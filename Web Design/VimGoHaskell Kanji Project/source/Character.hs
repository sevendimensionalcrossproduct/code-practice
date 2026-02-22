{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Character (renderCharacterProfile) where

import qualified Text.Blaze.Html5 as Blaze 
import qualified Text.Blaze.Html5.Attributes as Attr
import Data.Aeson
import Data.ByteString.Lazy (ByteString)
import qualified Components as RenderComponent
import Utils

renderCharacterProfile :: Char -> ByteString -> Blaze.Html
renderCharacterProfile someId someResponse =
    case decode someResponse :: Maybe CharacterResponse of
    Nothing -> Blaze.docTypeHtml $ do
        Blaze.head $ do
            Blaze.link Blaze.! Attr.rel "icon" Blaze.! Attr.href "/public/favicon.ico.png" Blaze.! Attr.type_ "image/png"
            Blaze.title ("Search " <> Blaze.toHtml [someId] <> " did not return any results.")
            Blaze.link Blaze.! Attr.rel "stylesheet" Blaze.! Attr.href "https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"

        Blaze.body $ do
            RenderComponent.navbar
            Blaze.h1 "Dictionary Page"
            RenderComponent.dictionaryInput
            Blaze.h2 $ Blaze.toHtml ("Search " <> [someId] <> " did not return any results.")
            Blaze.toHtml $ show someResponse
            Blaze.script Blaze.! Attr.src "/front_end/dist/main.js" $ ""

    Just response -> case hit response of
        [] -> Blaze.docTypeHtml $ do
          Blaze.head $ Blaze.title "No results"
          Blaze.body $ Blaze.h2 $ Blaze.toHtml ("No character found for " ++ [someId])

        (firstHit:_) -> Blaze.docTypeHtml $ do
            Blaze.head $ do
                Blaze.title ("Character Profile: " <> Blaze.toHtml [someId])
                Blaze.link Blaze.! Attr.rel "icon" Blaze.! Attr.href "/public/favicon.ico.png" Blaze.! Attr.type_ "image/png"
                Blaze.link Blaze.! Attr.rel "stylesheet" Blaze.! Attr.href "https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
                Blaze.style $ Blaze.toHtml $ unlines
                  [ "body {"
                  , "  background: linear-gradient(to bottom, #0d0d1a 0%, #121212 100%);"
                  , "  background-repeat: no-repeat;;"
                  , "  background-attachment: fixed;"
                  , "  min-height: 100%;"
                  , "}"
                  , "#searchInput{background-color: transparent;}"
                  ]
            Blaze.body $ do
                RenderComponent.navbar
                Blaze.div Blaze.! Attr.id "particles-js" $ mempty
                Blaze.div Blaze.! Attr.id "app" $ mempty
                Blaze.h1 "Dictionary Page"
                Blaze.div Blaze.! Attr.class_ "wrapper" $ do
                    RenderComponent.dictionaryInput

                Blaze.div Blaze.! Attr.class_ "wrapper" $ do
                    Blaze.div Blaze.! Attr.id "box" $ do
                        Blaze.p $ Blaze.toHtml ("Character: " ++ character firstHit)
                        Blaze.p $ Blaze.toHtml ("Index: " ++ show  (charindex firstHit))
                        
                        renderMaybe "Determinative: " (determinative firstHit)
                        renderMaybe "Form: " (form firstHit)
                        renderMaybe "Grade: " (grade firstHit)
                        renderMaybe "JLPT: " (jlpt firstHit)
                        case kanken firstHit of
                            Just k -> Blaze.p $ Blaze.toHtml ("Kanken: " ++ (if k == fromIntegral (round k :: Int) then show (floor k :: Int) else show k))
                            Nothing -> Blaze.p $ Blaze.toHtml ("∅" :: String)
                        Blaze.p "Readings:"
                        Blaze.span Blaze.! Attr.id "readingslist" $ do
                            renderReadings (readings firstHit)
                        Blaze.span  Blaze.!  Attr.class_ "inline-flex space-x-2" $ Blaze.span "Series: " <> parseSeries (series firstHit)
                        renderMaybe "Type: " (charType firstHit)

                Blaze.script Blaze.! Attr.src "/front_end/dist/main.js" $ ""
