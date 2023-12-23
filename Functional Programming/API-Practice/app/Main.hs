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
    captureParam "id" >>= \ userIdParameter ->
      readJson jsonStorage >>= \ users ->

      let userId' = read userIdParameter :: Integer in
      let user = find (\ u -> userId' == userId u) users in 
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
    captureParam "id" >>= \ userIdParameter ->
    jsonData >>= \ updatedUser ->
    readJson jsonStorage >>= \ users ->

    let userId' = read userIdParameter :: Integer in
    let updatedUsers = map (\ user -> if userId' == userId user 
        then user {userName = userName updatedUser} 
        else user) users in json updatedUsers >>

    writeJson jsonStorage updatedUsers
  ) >>

  delete "/users/:id" (
    captureParam "id" >>= \ userIdParameter ->
    let userId' = read userIdParameter :: Integer in 
      readJson jsonStorage >>= \ users ->
      let userIndex = findIndex (\ user -> userId' == userId user) users in
        case userIndex of
          Just index ->
            let (prefix, suffix) = splitAt index users in
            let updatedUsers = prefix ++ updateIds (fromIntegral (index + 1)) (drop 1 suffix) in json updatedUsers >>
            writeJson jsonStorage updatedUsers
          Nothing ->text "not found"
  ) >>
  
  delete "/users" (wipeJson jsonStorage >> text "JSON database wiped") 
 )


