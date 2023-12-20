{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Scotty
import Network.Wai.Middleware.Static
import System.Directory (getCurrentDirectory)
import System.FilePath

main :: IO ()
main = 
  getCurrentDirectory >>= \ currentDir ->

  scotty 3001 (
  get "/favicon.ico" (file (currentDir </> "public" </> "favicon.ico")) >>

  middleware (staticPolicy (addBase (currentDir </> "public"))) >>

  get "/greet/:name" (captureParam "name" >>= \name -> text ("Hello, " <> name <> "!")) >>
  get "/hello" (text "shalom") >>

  -- Serve HTML

  get "/first" (file (currentDir </> "public" </> "html1.html")) >>
  get "/second" (file (currentDir </> "public" </> "html2.html")) 
              )
