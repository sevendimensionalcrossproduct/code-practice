{-# LANGUAGE OverloadedStrings #-}

module Homepage where

import qualified Text.Blaze.Html5 as Blaze 
import qualified Text.Blaze.Html5.Attributes as Attr
import qualified Components as RenderComponent
import qualified Text.Blaze.Html5 as Attr

homepage :: Blaze.Html
homepage = Blaze.docTypeHtml $ do
    Blaze.head $ do
        Blaze.title "Home"
        Blaze.link Blaze.! Attr.rel "icon" Blaze.! Attr.href "/public/favicon.ico.png" Blaze.! Attr.type_ "image/png"
        Blaze.link Blaze.! Attr.rel "stylesheet" Blaze.! Attr.href "https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"
        
    Blaze.body $ do
        RenderComponent.navbar

        Blaze.div Blaze.! Attr.id "app" Blaze.! Attr.customAttribute "v-cloak" "" $ do
            Blaze.h1 "LOADING"
        Blaze.script Blaze.! Attr.src "/front_end/dist/main.js" $ ""
        
