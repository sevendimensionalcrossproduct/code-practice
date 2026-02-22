{-# LANGUAGE OverloadedStrings #-}

module Character where

import qualified Text.Blaze.Html5 as Blaze 
import qualified Text.Blaze.Html5.Attributes as Attr
import qualified Components as RenderComponent
import qualified Data.Text as T
-- import qualified Data.Text.Lazy as TL
import qualified Data.Text.Encoding as TE
import qualified Data.Text.Lazy.Encoding as TLE
import qualified Data.ByteString.Lazy as LazyBS
import qualified Data.Aeson as Ass
import Data.Aeson  ((.:))
import Data.Aeson.Types (parseMaybe)
import qualified Data.Aeson.KeyMap as KM
import qualified Data.Aeson.Key as KM
-- import Control.Applicative (Alternative(some))
-- import Text.Blaze.Html4.FrameSet.Attributes (char)


character :: Char -> LazyBS.ByteString ->Blaze.Html 
character someId someResponse = Blaze.docTypeHtml $ do
    Blaze.head $ do
        Blaze.title ("Character Profile: " <> Blaze.toHtml someId)
        Blaze.link Blaze.! Attr.rel "icon" Blaze.! Attr.href "/public/favicon.ico.png" Blaze.! Attr.type_ "image/png"
        Blaze.link Blaze.! Attr.rel "stylesheet" Blaze.! Attr.href "https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css"

    Blaze.body $ do
        RenderComponent.navbar
        RenderComponent.dictionaryInput
        
        let charKey = parseCharacter someResponse "character"
        case charKey of
            Just html -> Blaze.p ("Character:" <> html)
            Nothing -> Blaze.p "No character found"

        let indexKey = parseCharacterNumber someResponse "charindex"
        case indexKey of
            Just html -> Blaze.p ("Character:" <> html)
            Nothing -> Blaze.p "No character found"
        
        let gradeKey = parseCharacterNumber someResponse "grade"
        case gradeKey of
            Just html -> Blaze.p("Grade: " <> html)
            Nothing -> Blaze.p "No grade found"

        let jlptKey = parseCharacter someResponse "jlpt"
        case jlptKey of
          Just html -> Blaze.p("JLPT Level: " <> html)
          Nothing -> Blaze.p "No JLPT level found"

        let kankenKey = parseCharacterNumber someResponse "kanken"
        case kankenKey of
            Just html -> Blaze.p("Kanken Level: " <> html)
            Nothing -> Blaze.p "No Kanken level found"
        
        let formKey = parseCharacter someResponse "form"
        case formKey of
          Just html -> Blaze.p ("Form: " <> html)
          Nothing -> Blaze.p "This is a regular character"

        let determinativeKey = parseCharacter someResponse "determinative"
        case determinativeKey of
            Just html -> Blaze.p ("Semantic Component: " <> html)
            Nothing -> Blaze.p "No semantic component found"

        let typeKey = parseCharacter someResponse "type"
        case typeKey of
            Just html -> Blaze.p ("Character Type: " <> html)
            Nothing -> Blaze.p "No type"

        let seriesKey = parseSeries someResponse
        case seriesKey of
            Just html -> Blaze.div $ do 
                Blaze.p "Series Found:"
                html
            Nothing -> Blaze.p "No Series"
        
        let readingsKey = parseReadings someResponse
        case readingsKey of
            Just html -> Blaze.div $ do
                Blaze.p "Readings: "
                html
            Nothing -> Blaze.p "No Readings Found"

        -- case Ass.decode someResponse :: Maybe [Ass.Value] of
        --     Just [Ass.String obj] -> do
        --         let cock = LazyBS.fromStrict $ TE.encodeUtf8 obj
        --         case Ass.decode cock :: Maybe Ass.Value of
        --             Just decoded -> do
        --                 case decoded of
        --                     Ass.Object obje -> do
        --                         case parseMaybe (.: "character") obje :: Maybe String of
        --                             Just str -> Blaze.toHtml str
        --                             Nothing -> Blaze.toHtml ("Character field missing or invalid" :: String)
        --                     _ -> Blaze.toHtml ("Unexpected value" :: String)
        --             Nothing -> Blaze.toHtml ("Error decoding inner JSON" :: String)
        --     Just x -> Blaze.toHtml ("Unexpected structure in JSON: " ++ show x)
        --     Nothing -> Blaze.toHtml ("Error decoding JSON" :: String)

        Blaze.script $ do
            Blaze.toHtml ("console.log(JSON.parse(" <> TLE.decodeUtf8 someResponse <> "[0]));")   
            Blaze.toHtml ("console.log(JSON.parse(" <> TLE.decodeUtf8 someResponse <> "[0]).series);")   
            Blaze.toHtml ("console.log(JSON.parse(" <> TLE.decodeUtf8 someResponse <> "[0]).readings);")   



parseCharacter :: LazyBS.ByteString -> Ass.Key -> Maybe Blaze.Html
parseCharacter someResponse someKey = case Ass.decode someResponse :: Maybe [Ass.Value] of
    Just [Ass.String obj] -> do
        let cock = LazyBS.fromStrict $ TE.encodeUtf8 obj
        case Ass.decode cock :: Maybe Ass.Value of
            Just decoded -> case decoded of
                Ass.Object obje -> case parseMaybe (.: someKey ) obje :: Maybe String of
                    Just str -> Just (Blaze.toHtml str)
                    Nothing -> Nothing
                _ -> Just (Blaze.toHtml ("Unexpected value" :: String))
            Nothing -> Just (Blaze.toHtml ("Error decoding inner JSON" :: String))
    Just x -> Just (Blaze.toHtml ("Unexpected structure in JSON: " ++ show x))
    Nothing -> Just (Blaze.toHtml ("Error decoding JSON" :: String))

parseCharacterNumber :: LazyBS.ByteString -> Ass.Key -> Maybe Blaze.Html
parseCharacterNumber someResponse someKey = case Ass.decode someResponse :: Maybe [Ass.Value] of
    Just [Ass.String obj] -> do
        let cock = LazyBS.fromStrict $ TE.encodeUtf8 obj
        case Ass.decode cock :: Maybe Ass.Value of
            Just decoded -> case decoded of
                Ass.Object obje -> case parseMaybe (.: someKey ) obje :: Maybe Double of
                    Just str -> Just (Blaze.toHtml str)
                    Nothing -> Just (Blaze.toHtml ("Character field missing or invalid" :: String))
                _ -> Just (Blaze.toHtml ("Unexpected value" :: String))
            Nothing -> Just (Blaze.toHtml ("Error decoding inner JSON" :: String))
    Just x -> Just (Blaze.toHtml ("Unexpected structure in JSON: " ++ show x))
    Nothing -> Just (Blaze.toHtml ("Error decoding JSON" :: String))

parseSeries :: LazyBS.ByteString  -> Maybe Blaze.Html
parseSeries someResponse = case Ass.decode someResponse :: Maybe [Ass.Value] of
    Just [Ass.String obj] -> do
        let cock = LazyBS.fromStrict $ TE.encodeUtf8 obj
        case Ass.decode cock :: Maybe Ass.Value of
            Just decoded -> case decoded of
                Ass.Object obje -> case parseMaybe (.: "series" ) obje :: Maybe String of
                    Just str -> do
                        let secondCock = LazyBS.fromStrict $ TE.encodeUtf8 (T.pack str)
                        case Ass.decode secondCock :: Maybe Ass.Value of
                            Just secondDecoded -> case secondDecoded of
                                Ass.Object objec -> 
                                    let keys = map KM.toText (KM.keys objec)
                                     in Just $ Blaze.ul $ mconcat (map (\key -> Blaze.li $ Blaze.a Blaze.! Attr.href (Blaze.toValue ("/dictionary/" <> T.unpack key)) $ Blaze.toHtml (T.unpack key)) keys)
                                _ -> Just (Blaze.toHtml ("Unexpected value" :: String))
                            Nothing -> Just (Blaze.toHtml ("Error decoding inner JSON" :: String))
                    Nothing -> Nothing
                _ -> Just (Blaze.toHtml ("Unexpected value" :: String))
            Nothing -> Just (Blaze.toHtml ("Error decoding inner JSON" :: String))
    Just x -> Just (Blaze.toHtml ("Unexpected structure in JSON: " ++ show x))
    Nothing -> Just (Blaze.toHtml ("Error decoding JSON" :: String))

parseReadings :: LazyBS.ByteString  -> Maybe Blaze.Html
parseReadings someResponse = case Ass.decode someResponse :: Maybe [Ass.Value] of
    Just [Ass.String obj] -> do
        let cock = LazyBS.fromStrict $ TE.encodeUtf8 obj
        case Ass.decode cock :: Maybe Ass.Value of
            Just decoded -> case decoded of
                Ass.Object obje -> case parseMaybe (.: "readings" ) obje :: Maybe String of
                    Just str -> do
                        let secondCock = LazyBS.fromStrict $ TE.encodeUtf8 (T.pack str)
                        case Ass.decode secondCock :: Maybe Ass.Value of
                            Just secondDecoded -> case secondDecoded of
                                Ass.Object objecq ->do
                                    let keyValueList = KM.toList objecq  -- Convert the KeyMap to a list of key-value pairs``
                                    Just $ Blaze.ul $ mconcat $ map renderKeyValue keyValueList
                                _ -> Just (Blaze.toHtml ("Unexpected value" :: String))
                            Nothing -> Just (Blaze.toHtml ("Error decoding inner JSON" :: String))
                    Nothing -> Nothing
                _ -> Just (Blaze.toHtml ("Unexpected value" :: String))
            Nothing -> Just (Blaze.toHtml ("Error decoding inner JSON" :: String))
    Just x -> Just (Blaze.toHtml ("Unexpected structure in JSON: " ++ show x))
    Nothing -> Just (Blaze.toHtml ("Error decoding JSON" :: String))

renderKeyValue :: (KM.Key, Ass.Value) -> Blaze.Html
renderKeyValue (key, value) = Blaze.li $ do
    Blaze.toHtml (KM.toText key)  -- Render the key (the name of the key, e.g. "Kanon", "Kanyoon", etc.)
    Blaze.text ": "
    case value of
        Ass.String str -> Blaze.toHtml str  
        _ -> Blaze.toHtml ("Unknown value" :: String) 
