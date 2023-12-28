module Html.Internal where

newtype Document = Document Html
newtype Html = Html String

(&) :: Html -> Html -> Html
(Html a) & (Html b) = Html (a <> b)

head_ :: Html -> Html
head_ = wrap_ "head"

title_ :: Html -> Html
title_ = wrap_ "title"

body_ :: Html -> Html
body_ = wrap_ "body"

h1_ :: Html -> Html
h1_ = wrap_"h1"

p_ :: Html -> Html
p_ = wrap_ "p"

pre_ :: Html -> Html
pre_ = wrap_ "pre"

ul_ :: Html -> Html
ul_ = wrap_ "ul"

ol_ :: Html -> Html
ol_ = wrap_ "ol"

li_ :: Html -> Html
li_ = wrap_ "li"

html_ :: Html -> Html
html_ = wrap_ "html"

raw_ :: String -> Html
raw_ = Html . escape_

doctype_ :: Html
doctype_ = Html "<!DOCTYPE html>"

render_ :: Html -> String
render_ (Html a) = a

wrap_ :: String -> Html -> Html
wrap_ elem content = Html ("<" <> elem <> ">") & content & Html ("</" <> elem <> ">")

escape_ :: String -> String
escape_ =
  let
    escapeChar c =
      case c of
        '<' -> "&lt;"
        '>' -> "&gt;"
        '&' -> "&amp;"
        '"' -> "&quot;"
        '\'' -> "&#39;"
        _ -> [c]
  in
    concatMap escapeChar
