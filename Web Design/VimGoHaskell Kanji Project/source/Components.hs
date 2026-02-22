{-# LANGUAGE OverloadedStrings #-}

module Components where

-- import qualified Text.Blaze.Html.Renderer.Pretty as Blaze
import qualified Text.Blaze.Html5 as Blaze 
import qualified Text.Blaze.Html5.Attributes as Attr

navbar :: Blaze.Html
navbar = Blaze.nav Blaze.! Attr.class_ "bg-gray-800 p-4" $ do
    Blaze.ul Blaze.! Attr.class_ "flex space-x-4" $ do
        Blaze.li $ Blaze.a Blaze.! Attr.class_ "text-white hover:text-gray-300 " Blaze.! Attr.href "/" $ "Client Fetching"
        Blaze.li $ Blaze.a Blaze.! Attr.class_ "text-white hover:text-gray-300" Blaze.! Attr.href "/dictionary" $ "Server Fetching"

dictionaryInput :: Blaze.Html
dictionaryInput = Blaze.form Blaze.! Attr.id "searchForm" Blaze.! Attr.class_ "glass" Blaze.! Attr.method "get" $ do
    Blaze.button Blaze.! Attr.id "Button" Blaze.! Attr.type_ "submit" $ do
        Blaze.img Blaze.! Attr.src "/public/glass.svg" Blaze.! Attr.alt "Search" Blaze.! Attr.class_ "w-5 h-5"
    Blaze.input Blaze.! Attr.type_ "text" Blaze.! Attr.placeholder "Search..." Blaze.! Attr.id "searchInput"
    Blaze.script "document.getElementById('searchForm').onsubmit = function() { this.action = '/dictionary/' + document.getElementById('searchInput').value; };"            
