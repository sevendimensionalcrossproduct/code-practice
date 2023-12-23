-- Functions.hs
{-# LANGUAGE OverloadedStrings #-}

module Functions where

import Web.Scotty
import Network.Wai.Middleware.Static
import System.Directory (getCurrentDirectory)
import System.FilePath ((</>))
import Data.Text.Lazy (Text)
import qualified Data.ByteString.Lazy.Char8 as BS
import Data.Aeson (ToJSON, FromJSON, parseJSON, encode, eitherDecode, withObject, (.:), toJSON, object, (.=), (.:))
import Control.Monad.IO.Class (liftIO)
import Data.List (find, findIndex)
import Web.Scotty.Trans (ActionT)


data User = User { userId :: Integer, userName :: Text }

instance ToJSON User where
  toJSON user = object ["userId" .= userId user, "userName" .= userName user]

instance FromJSON User where
  parseJSON = withObject "User" $ \v ->
    User <$> v .: "userId" <*> v .: "userName"

publicDirectoryPath :: IO FilePath
publicDirectoryPath = getCurrentDirectory >>= \currentDir -> return (currentDir </> "public")

-- Read existing users from the JSON file
readUsersFromJsonFile :: FilePath -> IO [User]
readUsersFromJsonFile filePath = do
  contents <- BS.readFile filePath
  case eitherDecode contents of
    Left err -> do
      putStrLn $ "Error decoding JSON file: " ++ err
      return []
    Right users -> return users

readJson :: FilePath -> ActionT IO [User]
readJson jsonPath = liftIO (readUsersFromJsonFile jsonPath)


-- Write users to the JSON file
writeUsersToJsonFile :: FilePath -> [User] -> IO ()
writeUsersToJsonFile filePath users =
  BS.writeFile filePath (encode users)

writeJson :: FilePath -> [User] -> ActionT IO ()
writeJson jsonPath newData = liftIO ( writeUsersToJsonFile jsonPath newData)


-- Update IDs
updateIds :: Integer -> [User] -> [User]
updateIds _ [] = []
updateIds startId (user:users) = user { userId = startId } : updateIds (startId + 1) users

-- Wipe JSON file
wipeUsersJsonFile :: FilePath -> IO ()
wipeUsersJsonFile filePath = BS.writeFile filePath "[]"

wipeJson :: FilePath -> ActionT IO ()
wipeJson jsonPath = liftIO (wipeUsersJsonFile jsonPath)

