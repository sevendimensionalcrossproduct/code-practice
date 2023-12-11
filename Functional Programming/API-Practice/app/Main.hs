{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Scotty

main :: IO ()
main = scotty 3001 (
  get "/greet/:name" (captureParam "name" >>= \name -> text ("Hello, " <> name <> "!")) >>
  get "/hello" (text "shalom")
  )
