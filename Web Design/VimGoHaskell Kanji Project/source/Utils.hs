{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE RecordWildCards #-}

module Utils (
    CharacterData(..),
    CharacterResponse(..),
    renderMaybe,
    parseSeries,
    renderReadings,
    parseReading
    ) where

import qualified Text.Blaze.Html5 as Blaze 
import qualified Text.Blaze.Html5.Attributes as Attr
import Data.Aeson
import qualified Data.Aeson as Aeson
import GHC.Generics (Generic)
import Data.Text (Text)
import Data.ByteString.Lazy (fromStrict)
import Data.Text.Encoding (encodeUtf8)
import Data.Typeable (Typeable, cast)
import qualified Data.Aeson.KeyMap as Keymap
import qualified Data.Aeson.Key as Key

data CharacterData = CharacterData
  { character     :: String
  , charindex     :: Int
  , determinative :: Maybe String
  , form          :: Maybe String
  , grade         :: Maybe Int
  , jlpt          :: Maybe String
  , kanken        :: Maybe Double
  , readings      :: Maybe Text
  , series        :: Maybe Text
  , charType      :: Maybe String
  } deriving (Show, Generic)

instance FromJSON CharacterData where
  parseJSON = withObject "CharacterData" $ \obj -> do
    character     <- obj .:  "character"          
    charindex     <- obj .:  "charindex"       
    determinative <- obj .:? "determinative"     
    form          <- obj .:? "form"              
    grade         <- obj .:? "grade"             
    jlpt          <- obj .:? "jlpt"              
    kanken        <- obj .:? "kanken"            
    readings      <- obj .:? "readings"          
    series        <- obj .:? "series"            
    charType      <- obj .:? "type"              
    return CharacterData{..}

data CharacterResponse = CharacterResponse
  { hit  :: [CharacterData]  
  , miss :: Maybe [String]
  } deriving (Show, Generic)

instance FromJSON CharacterResponse where
  parseJSON = genericParseJSON defaultOptions
    { fieldLabelModifier = \ case
        "hit"  -> "Hit"
        "miss" -> "Miss" 
        other  -> other
    }

renderMaybe :: (Show a, Typeable a) => String -> Maybe a -> Blaze.Html
renderMaybe label (Just value) =
  case cast value of
    Just (str :: String) -> Blaze.p $ Blaze.toHtml (label ++ str)
    Nothing              -> Blaze.p $ Blaze.toHtml (label ++ show value) 
renderMaybe label Nothing = Blaze.p $ Blaze.toHtml (label ++ "∅")


parseReading :: Text -> Maybe Aeson.Object
parseReading readings = decode (fromStrict $ encodeUtf8 readings)

renderReadings :: Maybe Text ->Blaze.Html
renderReadings Nothing = Blaze.p "No readings data was found."
renderReadings (Just readingsText) =
    case parseReading readingsText of
        Just obj -> do
            renderKeyVal "Goon" "Go'on" obj
            renderKeyVal "Kanon" "Kan'on:" obj
            renderKeyVal "Kanyoon" "Kan'yoon: " obj
            renderKeyVal "Toon" "To'on: " obj
            renderKeyVal "Unclassified" "Unclassified: " obj
            renderKeyVal "BSOldChinese" "Baxter-Sagart: " obj
            renderKeyVal "ZZOldChinese" "Zhenzhang: " obj
            renderKeyVal "MiddleChinese" "Middle Chinese: " obj
        Nothing -> Blaze.p "Decoded JSON is not an object."

renderKeyVal :: Text -> String -> Aeson.Object -> Blaze.Html
renderKeyVal key paragraph obj =
    case Keymap.lookup (Key.fromText key) obj of
        Just (Aeson.String value) -> Blaze.div Blaze.! Attr.class_ "readings_entry" $ do
            Blaze.span $ Blaze.toHtml paragraph
            Blaze.span Blaze.! Attr.id (Blaze.toValue key) $ Blaze.toHtml value
        _ -> mempty  -- Or just copy paste the just case with "∅" instead of value

parseSeries :: Maybe Text -> Blaze.Html
parseSeries (Just phoneticSeries) =
    case eitherDecode (fromStrict $ encodeUtf8 phoneticSeries) :: Either String Value of
        Left err -> Blaze.span $ Blaze.toHtml ("Failed to decode JSON: " ++ show err)
        Right (Object obj) ->do 
            let keys = map Key.toText (Keymap.keys obj)
            Blaze.span Blaze.! Attr.class_ "inline-block flex space-x-2" $ mconcat (map (\key -> Blaze.div $ Blaze.a Blaze.! Attr.href (Blaze.toValue ("/dictionary/" <> key)) $ Blaze.toHtml key) keys)
        _ -> Blaze.span $ Blaze.toHtml ("Decoded JSON is not an object." :: String)
parseSeries Nothing = Blaze.span "No series data was found."
