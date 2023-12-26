head_ :: String -> String
head_ content = "<head>" <> content <> "</head>"

title_ :: String -> String
title_ content = "<title>" <> content <> "</title>"

body_ :: String -> String
body_ content = "<body>" <> content <> "</body>"

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
    body_ body
  )

main = putStrLn (makeHtml "Hspage" "Hello?")
