{-# LANGUAGE OverloadedStrings #-}

module Dictionary where

import qualified Text.Blaze.Html5 as Blaze 
import qualified Text.Blaze.Html5.Attributes as Attr
import qualified Components as RenderComponent

dictionary :: Blaze.Html
dictionary = Blaze.docTypeHtml $ do
    Blaze.head $ do
        Blaze.title "Dictionary"
        Blaze.link Blaze.! Attr.rel "icon" Blaze.! Attr.href "/public/favicon.ico.png" Blaze.! Attr.type_ "image/png"
        Blaze.link Blaze.! Attr.rel "stylesheet" Blaze.! Attr.href "https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
        
    Blaze.body $ do
        RenderComponent.navbar
        Blaze.h1 "Dictionary Page"
        RenderComponent.dictionaryInput

        Blaze.div Blaze.! Attr.id "app" $ mempty
        Blaze.script Blaze.! Attr.src "/front_end/dist/main.js" $ ""

