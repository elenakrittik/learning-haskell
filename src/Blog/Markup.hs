module Blog.Markup (parse, Html, renderMarkup) where

import Numeric.Natural (Natural)
import Debug.Trace (trace)

data Html
  = Heading Natural String
  | Paragraph String
  | UnorderedList [String]
  | OrderedList [String]
  | CodeBlock [String]
  deriving Show

parse :: String -> [Html]
parse = parseLines [] . lines -- (1)

reverse_ :: [String] -> String
reverse_ = unlines . reverse

parseLines :: [String] -> [String] -> [Html]
parseLines currentLines lines_ =
  let
    currentParagraph = Paragraph (reverse_ currentLines) -- (2), (3)
  in
    trace (show currentLines <> show lines_) (case lines_ of -- (4)
      [] -> [currentParagraph]
      currentLine : rest ->
        if trim currentLine == ""
          then
            currentParagraph : parseLines [] rest -- (5)
          else
            parseLines (currentLine : currentLines) rest) -- (6)

trim :: String -> String
trim = unwords . words

renderMarkup :: [Html] -> [String]
renderMarkup = map renderMarkup_

renderMarkup_ :: Html -> String
renderMarkup_ m = case m of
  Heading _ b -> b
  Paragraph a -> a
  UnorderedList a -> concat a
  OrderedList a -> concat a
  CodeBlock a -> concat a
