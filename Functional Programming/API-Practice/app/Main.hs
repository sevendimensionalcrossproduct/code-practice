{-# LANGUAGE OverloadedStrings #-}

module Main where

import Functions
import Web.Scotty
import Web.Scotty.Trans (ActionT)
import Network.Wai.Middleware.Static
import System.Directory (getCurrentDirectory)
import System.FilePath ((</>))
import Data.Text.Lazy (Text)
import qualified Data.ByteString.Lazy.Char8 as BS
import Data.Aeson (ToJSON, FromJSON, parseJSON, encode, eitherDecode, withObject, (.:), toJSON, object, (.=), (.:))
import Control.Monad.IO.Class (liftIO)
import Data.List (find, findIndex)

main :: IO ()
main = 
  publicDirectoryPath >>= \ publicDirectory ->  
  let usersHtmlFile = publicDirectory </> "users.html" in
  let icon = publicDirectory </> "favicon.ico" in
  let jsonStorage = publicDirectory </> "users.json" in

  scotty 3001 ( 
  middleware (staticPolicy (addBase publicDirectory)) >>

  --Filesystem Bindings
  get "/" (html (mconcat ["<a href=\"http://localhost:3001/userpage\">u probably meant this</a>"])) >>
  get "/favicon.ico" (file icon) >> 
  get "/users" (file jsonStorage) >>
  get "/userpage" (file usersHtmlFile) >>

  get "/users/:id" (
    captureParam "id" >>= \ parsedId' ->let parsedId = read parsedId' :: Integer in
    readJson jsonStorage >>= \ users ->
    
    let user = find (\ u -> parsedId == userId u) users in 
    case user of
      Just foundUser ->json foundUser
      Nothing -> text "Nope"
  ) >>
 
  post "/users"  (
    readJson jsonStorage >>= \ users ->
    jsonData >>= \newUser ->let newUserId = fromIntegral (length users) + 1 in
    let updatedUsers = users ++ [newUser { userId = newUserId }] in json updatedUsers >>

    writeJson jsonStorage updatedUsers >> json updatedUsers
    ) >>
  
  patch "/users/:id" (
    captureParam "id" >>= \ parsedId' ->let parsedId = read parsedId' :: Integer in
    jsonData >>= \ updatedUser ->
    readJson jsonStorage >>= \ users ->

    let updatedUsers = 
          map (\ user -> 
            if parsedId == userId user 
            then user {userName = userName updatedUser} 
            else user) 
          users in json updatedUsers >>

    writeJson jsonStorage updatedUsers
  ) >>

  delete "/users/:id" (
  captureParam "id" >>= \ parsedId' ->let parsedId = read parsedId' :: Integer in 
  readJson jsonStorage >>= \ users ->

  let userIndex = findIndex (\ user -> parsedId == userId user) users in
    case userIndex of
      Just foundIndex ->
        let (usersBefore, usersRest) = splitAt foundIndex users in
        let updatedUsers = usersBefore ++ updateIds (fromIntegral (foundIndex + 1)) (drop 1 usersRest) in json updatedUsers >>
        writeJson jsonStorage updatedUsers
      Nothing ->text "not found"
  ) >>
  
  delete "/users" (wipeJson jsonStorage >> text "JSON database wiped") 
 )
