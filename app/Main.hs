import Blog.Html
import Blog.Markup (parse, renderMarkup)

-- | Create a simple HTML page.
createPage :: String -> String -> Html
createPage title body =
  doctype_ <>
  html_ (
    head_ (
      title_ (raw_ title)
    ) <>
    body_ (
      h1_ (raw_ title) <>
      p_ (raw_ body) <>
      orderedList_ [
        raw_ "Point 1. You suck.",
        raw_ "Point 2. I suck."
      ]
    )
  )

main :: IO ()
main = putStrLn (render_ (createPage "Hspage" "Hello?"))
