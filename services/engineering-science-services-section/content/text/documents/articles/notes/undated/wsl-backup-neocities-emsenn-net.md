---
title: "emsenn.net"
description: here lives one whose life is writ in ions
---

here lives one whose life is writ in ions

This file contains the [Website source code](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/web/src/emsenn-website/neocities-mirrors/website-source-code.html#ID-39d17256-0e28-495f-afcb-745cfe68557d) and [plans](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/web/src/emsenn-website/neocities-mirrors/plan.html#ID-7801aaee-b673-4a41-8299-9c45859d8fc0) I have for emsenn.net, my [personal website](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/web/src/emsenn-website/neocities-mirrors/personal-website.html#ID-9976df5b-a5f5-4190-8e1f-52346b1c9b75).

If you're looking for the homepage, check [my files](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/web/src/emsenn-website/neocities-mirrors/index.html#ID-3ffa600c-f831-428f-bd11-a4e6583ff5ad)

## Source Code

### CSS

```
@charset "UTF-8";

:root {
  --body-font: sans-serif;
  --header-font: sans-serif;
  --code-font: monospace;
  --primary-color: #ffe;
  --primary-dim-color: #eed;
  --secondary-color: #312;
  --secondary-dim-color: #756;
  --link-color: #880;
  --link-hover-color: #aa2;
  --link-visited-color: #934;
  --link-visited-hover-color: #b56;
  --external-link-color: #008;
  --external-link-hover-color: #60b;
  --external-link-visited-color: #172;
  --external-link-visited-hover-color: #394;
}
@media(prefers-color-scheme:light){
  :root {
     --body-font: sans-serif;
     --header-font: sans-serif;
     --code-font: monospace;
     --primary-color: #756;
     --primary-dim-color: #312;
     --secondary-color: #eed;
     --secondary-dim-color: #ffe;
     --link-color: #880;
     --link-hover-color: #aa2;
     --link-visited-color: #934;
     --link-visited-hover-color: #b56;
  }}
body {
  position: relative;
  min-height: 100%;
  background-color: var(--primary-color);
  color: var(--secondary-color);
  margin: 0 auto;
  font-family: sans-serif;
}
main, #content {
  background-color: var(--primary-dim-color);
  border-left: 1.5em dotted var(--primary-color);
  padding: 1em;
}
header {
  border-bottom: 0.8em dotted var(--secondary-dim-color);
}
h1 { font-size: 2em; margin-bottom: 0; }
h2 {
  border-bottom: 0.3em dotted var(--secondary-dim-color);
}
h2, h3, h4, h5, h6, p, table, ul, ol, .org-src-container {
  width: 60%;
}
aside {
  float: right;
  width: 35%;
}
aside p { width: 100%; }
@media screen and (max-width:760px) {
  h2, h3, h4, h5, h6, p, table, ul, ol, .org-src-container {
     width: 90%;
  }
  aside {
     float: inherit;
     width: 90%;
     border-top: 0.2em dotted var(--secondary-dim-color);
     border-bottom: 0.2em dotted VAR(--secondary-dim-color);
     font-size: 0.8em;
         }
}

footer, #postamble, #preamble {
  padding: 0.5em;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
  empty-cells: show;
  border: 0.1em solid #444;
}
thead { font-family: sans-serif; }
th, td {
  padding: 0 0.3em;
  border: 0.01em solid #444;
}
img {
  max-width: 80vw;
  vertical-align: middle;
}
pre, .src {
  padding: 0.5em;
  border: 0.1em solid #444;
  white-space: pre-wrap;
  overflow-x: scroll;
  text-overflow: clip;
  scrollbar-width: none;
}
pre::-webkit-scrollbar, .src::-webkit-scrollbar {
  display: none;
}

dt {
  font-weight: normal;
  display: inline-block;
  border-bottom: 0.1rem dotted #444;
}
#text-index dt { border-bottom: none; }
h2, h3, h4, h5, h6, h7, h8, h9, h10 {
  display: block;
  font-family: sans-serif;
  margin: 0.2em auto 0.5em 0;
}
a, .link {
  text-decoration: none;
  color: #880;
  display: inline;
  position: relative;
  border-bottom: 0.1rem dotted;
  line-height: 1.2;
  transition: border 0.3s;
}
a:hover {
  color: #aa2;
  outline-style: none;
  border-bottom: 0.1rem solid;
}
a:visited, .visited-link { color: #934; }
a:visited:hover { color: #b56; }
a:focus {
  outline-style: none;
  border-bottom: 0.1rem solid;
}
::selection { background-color: #777; color: #eee; }
a::selection { background-color: #ccc; }
.org-todo {
  background-color: #ddd;
  color: #333;
  font-size: .8rem;
  float: right;
}
.org-src-container + .example {
  margin-left: 8em;
}
a[href^="https://"]:not([href*="emsenn.net"]):after, a[href^="https://"]:not([href*="emsenn.net"]):visited:after, .external-link:after, .visited-external-link:after {
  content: "^";
  font-size: 0.5em;
  vertical-align: super;
}
a[href^="https://"]:not([href*="emsenn.net"]), .external-link {
  color: var(--external-link-color);
}
a[href^="https://"]:not([href*="emsenn.net"]):hover{
  color: var(--external-link-hover-color);
}
a[href^="https://"]:not([href*="emsenn.net"]):visited, .visited-external-link {
  color: var(--external-link-visited-color);
}
a[href^="https://"]:not([href*="emsenn.net"]):visited:hover{
  color: var(--external-link-visited-hover-color);
}
blockquote {
  border: 0.1em dashed var(--secondary-dim-color);
  padding-left: 0.2em;
}
label.org-src-name {
  margin: 0 0 0 3em;
  font-family: sans-serif;
  font-size: 1rem;
  line-height: 0;
}
.skip-to-content {
  opacity: 0;
  position: absolute;
  left: 0.2em;
}
.skip-to-content:focus{
  opacity: 1;
  background-color: var(--secondary-dim-color);
  color: var(--primary-color);
}
ul { max-width: 85%; }
.footpara { display: inline; font-size: 0.8rem; }
```

#### Issues

##### Dark mode by default

##### Dark mode is ugly

### HTML

```
[skip to content](#content)

**emsenn's digital garden**
  [Homepage](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/web/src/emsenn-website/neocities-mirrors/index.html) |
  [Index](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/web/src/emsenn-website/neocities-mirrors/theindex.html)

This Website was cultivated as a public asset with [support](https://ko-fi.com/emsenn) from people like you. ***Thank you!***

    Click this sentence for information about my Website.

Click each sentence below for more info:

- This website was created by Emacs and Org-mode

See [my Emacs configuration](https://emsenn.net/gnoponemacs.html) to learn how.

- Its content was written by hand.

This means there might be mistakes!

- It uses style to add information to the pages.

                Click this sentence to see how links are styled:

                      Color
                      Link type

                    Sample
                      Unvisited local resource
                    Sample
                      Visited local resource
                    Sample
                      Unvisited external resource
                    Sample
                      Visited external resource

```

#### Issues

##### Needs copyright

##### More contact info?

## Ideas and Plans

### IDEA My Blog = My Babbling Log

I could perhaps use `#+include` statements (or maybe something else) to set up a directory on emsenn.net that is any babbles I want to make public. Or, I could do a single page, that's a rolling log of the 20 most recent babbles (that I'm comfortable sharing). But perhaps it would be better to keep babblings as assumed private, and anything useful from them that I want to share, I can render some other way, like rewriting them as part of the "routine bulleitns" I want to resume publishing.

## Backlinks

- [Babble, [2025-09-04 Thu 19:57], On influencer authenticity, aestheticity, authority, and availability](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/web/src/emsenn-website/neocities-mirrors/babble-20250904195737-0500.html#ID-c76c79ac-0fd5-4bb4-baaf-75a0318cde0a)

- [Relaunching emsenn.net](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/web/src/emsenn-website/neocities-mirrors/babble-20250821135932-0500.html#ID-32d5e9f3-d254-4dd3-beed-18563f87d50c)

- [On epistemics, economies, and didactics of encyclopedia, wiki, and digital gardens.](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/web/src/emsenn-website/neocities-mirrors/babble-20250921072126-0500.html#ID-7b5581e4-9d06-4f64-8a99-8fde57fb9514)

- [About emsenn](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/web/src/emsenn-website/neocities-mirrors/about-emsenn.html#ID-1c8beae7-705a-4751-b682-3c517b36435e)

- [Post to @emsenn@kolektiva.social, 2025-08-25](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/web/src/emsenn-website/neocities-mirrors/post-emsenn-kolektiva-social-20250825081900-0500.html#ID-9bf0833f-c072-4d7b-9075-e5b1c7503d80)

- [Adding Org-cite to GnoponEmacs](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/web/src/emsenn-website/neocities-mirrors/babble-20250828085353-0500.html#ID-9cbbeef0-0b01-4d86-900b-5c6c7623fbf7)

- [Post to @emsenn@kolektiva.social, 2025-08-26 0812h](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/web/src/emsenn-website/neocities-mirrors/post-emsenn-kolektiva-social-20250826081200-0500.html#ID-91687610-f54e-40dd-88f6-0da558e09bb6)

- [Post to @emsenn@kolektiva.social, 2025-09-08 10:11h, On using Substack](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/web/src/emsenn-website/neocities-mirrors/post-emsenn-kolektiva-social-20250908101100-0500.html#ID-40d82828-1c24-4823-984e-e523011aaeb4)

- [my Ko-Fi](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/web/src/emsenn-website/neocities-mirrors/my-ko-fi.html#ID-586f1109-a99c-432e-b191-b9e11a21d50d)

- [Thinking on privacy within my research notes](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/web/src/emsenn-website/neocities-mirrors/babble-20250723213554-0500.html#ID-adb03cf1-9c42-43f1-bcb3-88d572adf713)

- [Babble, [2025-09-11 Thu 08:55], Installing TAB on my Omnibook](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/web/src/emsenn-website/neocities-mirrors/babble-20250911085500-0500.html#ID-34a6180c-ce51-4693-a6f0-2a3e9ed3f9b4)

- [Making progress with GnoponEmacs](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/web/src/emsenn-website/neocities-mirrors/babble-20250722091452-0500.html#ID-d113b3e7-ae97-467a-b1e9-41660c818117)

- [Babble, [2025-08-25 Mon 00:49](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/web/src/emsenn-website/neocities-mirrors/babble-20250825004921-0500.html#ID-3b564925-5102-424c-8e05-b5bf5e0b2804)]

- [emsenn's files](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/web/src/emsenn-website/neocities-mirrors/index.html#ID-3ffa600c-f831-428f-bd11-a4e6583ff5ad)
