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

  get "/users" (file (publicDir </> "users.json")) >>

   
  post "/users"  (
    liftIO (readUsersFromJsonFile (publicDir </> "users.json")) >>= \ users ->
        
    jsonData >>= \newUser ->let newUserId = fromIntegral (length users) + 1 in
    let updatedUsers = users ++ [newUser { userId = newUserId }] in json updatedUsers >>

    liftIO (writeUsersToJsonFile (publicDir </> "users.json") updatedUsers) >> json updatedUsers
    ) >>
  
  delete "/users" ( liftIO (wipeUsersJsonFile (publicDir </> "users.json")) >> text "JSON database wiped") >>

  get "/favicon.ico" (file (publicDir </> "favicon.ico")) >>
  
  
  get "/userpage" (file (publicDir </> "users.html")) >>
  
  get "/" (text "Wilkommen") 
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

-- Wipe JSON file
wipeUsersJsonFile :: FilePath -> IO ()
wipeUsersJsonFile filePath = BS.writeFile filePath "[]"
