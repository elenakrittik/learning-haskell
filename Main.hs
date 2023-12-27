newtype Html = Html String
newtype Document = Document Html

head_ :: String -> String
head_ content = "<head>" <> content <> "</head>"

title_ :: String -> String
title_ content = "<title>" <> content <> "</title>"

body_ :: String -> String
body_ content = "<body>" <> content <> "</body>"

h1_ :: String -> String
h1_ content = "<h1>" <> content <> "</h1>"

p_ :: String -> String
p_ content = "<p>" <> content <> "</p>"

html_ :: String -> String
html_ content = "<html>" <> content <> "</html>"

doctype_ :: String
doctype_ = "<!DOCTYPE html>"

makeHtml :: String -> String -> String
makeHtml title body = doctype_ <>
  html_ (
    head_ (
      title_ title
    ) <>
    body_ (
      h1_ title <>
      p_ body
    )
  )

main = putStrLn (makeHtml "Hspage" "Hello?")
