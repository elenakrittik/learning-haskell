-- | Stable interface for Blog.Html.Internal. Includes a few utilities.
module Blog.Html (
  Html,
  Document,
  doctype_,
  html_,
  head_,
  title_,
  body_,
  h1_,
  p_,
  pre_,
  ul_,
  ol_,
  li_,
  raw_,
  render_,
  (&),

  code_,
  bulletList_,
  orderedList_,
) where

import Blog.Html.Internal

code_ :: Html -> Html
code_ = pre_

bulletList_ :: [Html] -> Html
bulletList_ = ul_ . (Html . concatMap (render_ . li_))

orderedList_ :: [Html] -> Html
orderedList_ = ol_ . (Html . concatMap (render_ . li_))
