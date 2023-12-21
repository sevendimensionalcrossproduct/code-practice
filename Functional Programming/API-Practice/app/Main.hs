{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Scotty
import Network.Wai.Middleware.Static
import System.Directory (getCurrentDirectory)
import System.FilePath
import Data.Text.Lazy (Text)
import Data.Aeson (ToJSON, FromJSON, parseJSON, withObject, (.:), toJSON, object, (.=), (.:))

data User = User {userId :: Integer, userName :: Text}

instance ToJSON User where
  toJSON user = object ["userId" .= userId user, "userName" .= userName user]

instance FromJSON User where
  parseJSON = withObject "User" $ \v ->
    User <$> v .: "userId" <*> v .: "userName"

users :: [User]
users = [User 1 "MARK", User 2 "JOHN", User 3 "ALICE"]

main :: IO ()
main = 
  getCurrentDirectory >>= \ currentDir ->let publicDir = currentDir </> "public" in

  scotty 3001 (

  middleware (staticPolicy (addBase publicDir)) >>

  get "/users" (json users) >>
    
  post "/users" (
    jsonData >>= \newUser ->let newUserId = fromIntegral (length users) + 1 in
    let updatedUsers = users ++ [newUser { userId = newUserId }] in json updatedUsers
  ) >>
  
  patch "/users/:id" (
    captureParam "id" >>= \userId' ->
    jsonData >>= \ updatedUser ->
    let updatedUsers = map (\u ->if userId' == userId u then updatedUser else u) users
    in json updatedUsers
  ) >>

  get "/favicon.ico" (file (publicDir </> "favicon.ico")) >>
  
  get "/first" (file (publicDir </> "html1.html")) >>
  get "/second" (file (publicDir </> "html2.html")) >>
  get "/second/third" (file (publicDir </> "html3.html")) >>
  
  get "/userpage" (file (publicDir </> "users.html")) >>
  
  get "/" (text "Wilkommen") >>
  get "/greet/:name" (captureParam "name" >>= \name -> text ("Hello, "<> name<> "!")) >>
  get "/hello" (text "shalom") 
 )
