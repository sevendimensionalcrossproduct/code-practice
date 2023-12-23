{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Scotty
import Network.Wai.Middleware.Static
import System.Directory (getCurrentDirectory)
import System.FilePath ((</>))
import Data.Text.Lazy (Text)
import qualified Data.ByteString.Lazy.Char8 as BS
import Data.Aeson (ToJSON, FromJSON, parseJSON, encode, eitherDecode, withObject, (.:), toJSON, object, (.=), (.:))
import Control.Monad.IO.Class (liftIO)
import Data.List (find, findIndex)

data User = User {userId :: Integer, userName :: Text}

instance ToJSON User where
  toJSON user = object ["userId" .= userId user, "userName" .= userName user]

instance FromJSON User where
  parseJSON = withObject "User" $ \v ->
    User <$> v .: "userId" <*> v .: "userName"

main :: IO ()
main = 
  getCurrentDirectory >>= \ currentDir ->let publicDir = currentDir </> "public" in

  scotty 3001 (
  middleware (staticPolicy (addBase publicDir)) >>

  get "/" (html (mconcat ["<a href=\"http://localhost:3001/userpage\">u probably meant this</a>"])) >>
  get "/favicon.ico" (file (publicDir </> "favicon.ico")) >> 
  get "/users" (file (publicDir </> "users.json")) >>
  get "/userpage" (file (publicDir </> "users.html")) >>

  get "/users/:id" (
    captureParam "id" >>= \ userIdParameter ->
      liftIO (readUsersFromJsonFile (publicDir </> "users.json")) >>= \ users ->
      let userId' = read userIdParameter :: Integer in
      let user' = find (\ u -> userId' == userId u) users in 
      case user' of
        Just foundUser -> json foundUser
        Nothing -> text "Nope"
  ) >>
 
  post "/users"  (
    liftIO (readUsersFromJsonFile (publicDir </> "users.json")) >>= \ users ->
        
    jsonData >>= \newUser ->let newUserId = fromIntegral (length users) + 1 in
    let updatedUsers = users ++ [newUser { userId = newUserId }] in json updatedUsers >>

    liftIO (writeUsersToJsonFile (publicDir </> "users.json") updatedUsers) >> json updatedUsers
    ) >>
  
  patch "/users/:id" (
    captureParam "id" >>= \ userIdParameter ->
    jsonData >>= \ updatedUser ->
    liftIO (readUsersFromJsonFile (publicDir </> "users.json")) >>= \ users ->
    let userId' = read userIdParameter :: Integer in
    let updatedUsers = map (\ user -> if userId' == userId user 
        then user {userName = userName updatedUser} 
        else user) users in
    json updatedUsers >>
    liftIO (writeUsersToJsonFile (publicDir </> "users.json") updatedUsers)
  ) >>

  delete "/users/:id" (
    captureParam "id" >>= \ userIdParameter ->
    let userId' = read userIdParameter :: Integer in 
      liftIO(readUsersFromJsonFile (publicDir </> "users.json")) >>= \ users ->
      let userIndex = findIndex (\ user -> userId' == userId user) users in
        case userIndex of
          Just index ->
            let (prefix, suffix) = splitAt index users in
            let updatedUsers = prefix ++ updateIds (fromIntegral (index + 1)) (drop 1 suffix) in json updatedUsers >>
            liftIO (writeUsersToJsonFile (publicDir </> "users.json") updatedUsers)
          Nothing ->text "not found"
  ) >>
  
  delete "/users" ( liftIO (wipeUsersJsonFile (publicDir </> "users.json")) >> text "JSON database wiped") 
 )

-- Read existing users from the JSON file
readUsersFromJsonFile :: FilePath -> IO [User]
readUsersFromJsonFile filePath = do
  contents <- BS.readFile filePath
  case eitherDecode contents of
    Left err -> do
      putStrLn $ "Error decoding JSON file: " ++ err
      return []
    Right users -> return users

-- Write users to the JSON file
writeUsersToJsonFile :: FilePath -> [User] -> IO ()
writeUsersToJsonFile filePath users =
  BS.writeFile filePath (encode users)

-- Update IDs
updateIds :: Integer -> [User] -> [User]
updateIds _ [] = []
updateIds startId (user:users) = user { userId = startId } : updateIds (startId + 1) users

-- Wipe JSON file
wipeUsersJsonFile :: FilePath -> IO ()
wipeUsersJsonFile filePath = BS.writeFile filePath "[]"
