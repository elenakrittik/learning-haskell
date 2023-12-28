module Html.Internal where

newtype Html = Html String

(&) :: Html -> Html -> Html
(Html a) & (Html b) = Html (a <> b)

newtype Document = Document Html

head_ :: Html -> Html
head_ content = wrap_ content "head"

title_ :: Html -> Html
title_ content = wrap_ content "title"

body_ :: Html -> Html
body_ content = wrap_ content "body"

h1_ :: Html -> Html
h1_ content = wrap_ content "h1"

p_ :: Html -> Html
p_ content = wrap_ content "p"

pre_ :: Html -> Html
pre_ content = wrap_ content "pre"

ul_ :: Html -> Html
ul_ content = wrap_ content "ul"

ol_ :: Html -> Html
ol_ content = wrap_ content "ol"

li_ :: Html -> Html
li_ content = wrap_ content "li"

html_ :: Html -> Html
html_ content = wrap_ content "html"

raw_ :: String -> Html
raw_ = Html . escape_

doctype_ :: Html
doctype_ = Html "<!DOCTYPE html>"

render_ :: Html -> String
render_ (Html a) = a

wrap_ :: Html -> String -> Html
wrap_ content elem = Html ("<" <> elem <> ">") & content & Html ("</" <> elem <> ">")

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
