{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified Web.Scotty as Scotty
import qualified Text.Blaze.Html5 as Blaze 
import qualified Text.Blaze.Html.Renderer.Pretty as Blaze
import qualified Data.Text.Lazy as LazyT
import qualified Network.Wai.Middleware.Static as Middleware
import Control.Concurrent (forkIO)
import System.Process (createProcess, proc)
import qualified Network.HTTP.Conduit as Conduit
import qualified Data.ByteString.Lazy as BS
import qualified Data.ByteString.Lazy as BSL
import qualified Data.Text as DT
import Data.Text.Encoding (encodeUtf8)
import Network.HTTP.Types.Status (statusCode)
import Network.HTTP.Conduit
import Control.Exception (try)
import Homepage
import Dictionary
import Character

main :: IO ()
main = do
    _ <- forkIO $ do
        putStrLn "Back-End Server Up: http://localhost:4200/"
        _ <- createProcess (proc "./database/server.exe" [])
        return ()

    startFrontend

startFrontend :: IO ()
startFrontend = do
    putStrLn "Front-End Server Up (Cock): http://localhost:6969/"
    Scotty.scotty 6969 $ do
        Scotty.middleware $ Middleware.staticPolicy $ Middleware.addBase ""
        Scotty.get "/" $ do
            render homepage

        Scotty.get "/dictionary" $ do
            render dictionary

        Scotty.get "/dictionary/:id" $ do
            someId <- Scotty.pathParam "id" :: Scotty.ActionM Char
            result <- Scotty.liftIO $ try (fetchData [someId]) :: Scotty.ActionM (Either HttpException BSL.ByteString)
            case result of
                Left (HttpExceptionRequest _ (StatusCodeException response _)) ->
                    case statusCode (responseStatus response) of
                        404 -> render (renderCharacterProfile someId "Error Code 404: No character found")
                        code -> do
                            let msg = "{\"Hit\":[],\"Miss\":[\"Request failed with code " ++ show code ++ "\"]}"
                            render (renderCharacterProfile someId (BSL.fromStrict $ encodeUtf8 (DT.pack msg))) -- Should probably render actual error page here

                Left err -> do
                    let msg = "{\"Hit\":[],\"Miss\":[\"Unexpected error: " ++ show err ++ "\"]}"
                    render (renderCharacterProfile someId (BSL.fromStrict $ encodeUtf8 (DT.pack msg))) -- Should probably render actual error page here
                Right response -> do
                    render (renderCharacterProfile someId response)

render :: Blaze.Html ->Scotty.ActionM ()
render = Scotty.html . LazyT.pack . Blaze.renderHtml

fetchData :: String -> IO BS.ByteString
fetchData someRoute = Conduit.simpleHttp $ "http://localhost:4200/character/" ++ someRoute
