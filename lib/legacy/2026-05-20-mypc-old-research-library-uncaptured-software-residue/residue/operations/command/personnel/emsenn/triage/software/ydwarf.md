+++
title = "YDwarf"
author = ["emsenn"]
description = "a CSS stylesheet"
tags = ["CSS"]
draft = false
css = "ydwarf"
+++

## Introduction {#introduction}

**_YDwarf_** is a minimal and cold blue CSS theme created by [emsenn](https://emsenn.net).


### License and Editorial Information {#license-and-editorial-information}

This document and the source code it contains are released under the
MIT License and maintained at <https://git.sr.ht/~emsenn/ydwarf>

<div class="ox-hugo-toc toc">
<div></div>

<div class="heading">Table of Contents</div>

- [Introduction](#introduction)
    - [License and Editorial Information](#license-and-editorial-information)
- [Design Philosophy](#design-philosophy)
- [CSS Rules](#css-rules)
    - [Base Rules](#base-rules)
        - [HTML Tag Rules](#html-tag-rules)
        - [Body Tag Rules](#body-tag-rules)
        - [Section Tag Rules](#section-tag-rules)
        - [Headline Tag Rules](#headline-tag-rules)
        - [Link Tag Rules](#link-tag-rules)
        - [Paragraph Tag Rules](#paragraph-tag-rules)
        - [Blockquote Tag Rules](#blockquote-tag-rules)
    - [Partials Rules](#partials-rules)
        - [Brief Rules](#brief-rules)
        - [Button Rules](#button-rules)
        - [Clickbait Rules](#clickbait-rules)
        - [Emphasize Rules](#emphasize-rules)
        - [Entrance Rules](#entrance-rules)
        - [Eyecatcher Rules](#eyecatcher-rules)
        - [Nameplate Rules](#nameplate-rules)
        - [Signature Rules](#signature-rules)
        - [Survey Rules](#survey-rules)
        - [Skip-to-Content Rules](#skip-to-content-rules)
        - [Video Rules](#video-rules)
    - [State Rules](#state-rules)
        - [Selection Rules](#selection-rules)
    - [Animation Rules](#animation-rules)
- [Demonstration HTML Document](#demonstration-html-document)

</div>
<!--endtoc-->


## Design Philosophy {#design-philosophy}

The _YDwarf_ theme is based on a client's request for a website which
would have a landing page containing a sales-letter, a second
sales-letter, and finally a link to a form page.


## CSS Rules {#css-rules}

All of _YDwarf_'s CSS lives in a single style-sheet, `ydwarf.css`.


### Base Rules {#base-rules}

The theme's **_base rules_** are those that go with HTML tags directly.


#### HTML Tag Rules {#html-tag-rules}

Document-wide settings, including those relevant to font-styling, are
declared in the `html` rule.

```css
html {
  background-color: #123;
  background-image: url("data:image/svg+xml,%3Csvg width='84' height='48' viewBox='0 0 84 48' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M0 0h12v6H0V0zm28 8h12v6H28V8zm14-8h12v6H42V0zm14 0h12v6H56V0zm0 8h12v6H56V8zM42 8h12v6H42V8zm0 16h12v6H42v-6zm14-8h12v6H56v-6zm14 0h12v6H70v-6zm0-16h12v6H70V0zM28 32h12v6H28v-6zM14 16h12v6H14v-6zM0 24h12v6H0v-6zm0 8h12v6H0v-6zm14 0h12v6H14v-6zm14 8h12v6H28v-6zm-14 0h12v6H14v-6zm28 0h12v6H42v-6zm14-8h12v6H56v-6zm0-8h12v6H56v-6zm14 8h12v6H70v-6zm0 8h12v6H70v-6zM14 24h12v6H14v-6zm14-8h12v6H28v-6zM14 8h12v6H14V8zM0 8h12v6H0V8z' fill='%23349' fill-opacity='0.3' fill-rule='evenodd'/%3E%3C/svg%3E");
  color: #def;
```

```css
hyphens: auto;
font-family: sans-serif;
line-height: 1.4;
font-size: 1.2rem;
```

```css
  transition-timing-function: ease-in;
  animation-timing-function: ease-in;
}
```


#### Body Tag Rules {#body-tag-rules}

```css
body {
  max-width: 60rem;
  width: 80vw;
  margin: 2em auto;
  background-color: #eee9;
  border-radius: 2em;
  color: #12202d;
  box-shadow: 0 0 0.5em #52a5cd, 0 1px 2px #52a5cd;
}
```


#### Section Tag Rules {#section-tag-rules}

```css
section {
  background-color: #eee;
  border-radius: 2em;
  padding: .1em 1em;
  box-shadow: 0 0 .5em #eee;
}
```


#### Headline Tag Rules {#headline-tag-rules}


##### H1 Tag Rules {#h1-tag-rules}

```css
h1 {
  background-color: #eee;
  border-radius: 2em;
  box-shadow: 0 0 .5em #eee;
  margin: 0 auto;
  font-weight: normal;
  font-size: 2.4em;
  text-align: center;
  text-shadow: 0 .05em .03em rgba(68,68,68,.3);
}
```


##### H2 through H6 Tag Rules {#h2-through-h6-tag-rules}

```css
h2,h3,h4,h5,h6 {
  text-align: center;
  text-shadow: 0 .1em .03em rgba(68,68,68,.3);
}
```


#### Link Tag Rules {#link-tag-rules}

```css
a {
  color: #222;
  text-decoration: underline dotted rgba(68,68,68,.6);
  text-shadow: 0 .1em .01em rgba(68,68,68,.2);
}
a:visited {
  color: #444;
}
a:hover {
  outline-style: none;
  text-decoration: underline solid;
  animation-delay: 0.3s;
  animation: animation-pulse 0.8s infinite;
}
a:focus {
  outline-style: none;
  text-decoration: underline solid;
  animation-delay: 0.3s;
  animation: animation-pulse-heavy 1.2s infinite;
}
```


#### Paragraph Tag Rules {#paragraph-tag-rules}

```css
p {
  background-color: #eee;
  border-radius: 2em;
  padding: .1em 1em;
  box-shadow: 0 0 .5em #eee;
}
```


#### Blockquote Tag Rules {#blockquote-tag-rules}

```css
blockquote {
    border-left: solid 0.2rem #52a5cd;
    border-radius: 0.2em;
    color: #035a85;
    font-size: 1.0em;
    line-height: 1.2em;
    max-width: 90%;
    margin-left: 2em;
    padding-left: 0.8rem}
```


### Partials Rules {#partials-rules}


#### Brief Rules {#brief-rules}

```css
.brief {
  font-size: 1.2em;
  max-width: 65%;
  font-style: italic;
  margin: auto
}
```


#### Button Rules {#button-rules}

```css
.button {
  max-width: 60vw;
  margin: auto;
  background-color: #52a5cd;
  color: #dedede;
  border: none;
  padding: 1rem;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  -webkit-transition-duration: 0.4s;
  transition-duration: 0.4s;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center
}
.button:hover {
  animation: animation-pulse-primary 2s infinite
}
```


#### Clickbait Rules {#clickbait-rules}

```css
.clickbait {
  font-weight: bold;
  font-size: 1.1em;
  background-color: #12202d;
  background: linear-gradient(to bottom right, #12202d, #035a85);
  border-radius: 2em;
  color: #52a5cd;
  padding: 1em;
  margin: 1em auto;
}
.clickbait__lead {
  max-width: 70%
}
.clickbait__close {
  font-style: italic;
  max-width: 70%;
  margin-left: auto;
  margin-right: 0
}
```


#### Emphasize Rules {#emphasize-rules}

```css
.emphasized {
  max-width: 20em;
  margin-left: 0.3em;
  font-size: 1.1em;
  font-style: italic
}
```


#### Entrance Rules {#entrance-rules}

```css
.entrance {
  text-align: center;
  font-size: 1.8em;
  text-shadow: 0 3px 3px rgba(44, 44, 44, 0.48)
}
```


#### Eyecatcher Rules {#eyecatcher-rules}

```css
.eyecatcher {
  font-weight: bold;
  font-size: 1.1em;
  background-color: #12202d;
  background: linear-gradient(to bottom right, rgba(82, 165, 205, 0.5), rgba(3, 90, 133, 0.5));
  border-radius: 2em;
  color: #12202d;
  padding: 1em;
  margin: auto;
  margin-top: 1em;
  margin-bottom: 1em
}
```


#### Nameplate Rules {#nameplate-rules}

```css
.nameplate {
  max-width: 80%;
  width: 80%;
  margin: auto;
  height: auto;
  margin-bottom: 1em
}
```


#### Signature Rules {#signature-rules}

```css
.signature {
  margin-top: 2em;
  margin-left: 1em;
  font-size: 1.4em
}
.signature__complimentary {
  padding: 0;
  margin: 0
}

.signature__name {
  margin-left: 1em;
  font-size: 1.2em;
  font-style: italic;
  margin-top: 0em;
  margin-bottom: 0
}
.signature__credentials {
  margin-left: 2em;
  font-size: 0.8em;
  padding: 0;
  margin-top: 0;
  padding-top: 0
}
```


#### Survey Rules {#survey-rules}

```css
.survey {
  max-width: 30em;
  margin: 1em auto;
  padding: 1em;
  font-family: sans-serif
}
.survey ul {
  list-style: none;
  padding: 0;
  margin: 0
}
.survey li {
  display: block;
  border: 0.2em solid #12202d;
  margin-bottom: 1.5rem
}
.survey li:last-child {
  border: none;
  text-align: center;
  margin-bottom: 2em
}
.survey li>label {
  background: #12202d;
  display: block;
  margin: 0 auto;
  color: #f2f2f2;
  font-size: 1.2em;
  padding: 0.2rem
}
.survey li>span {
  background: #12202d;
  display: block;
  margin: 0 auto;
  text-align: center;
  color: #f2f2f2;
  font-size: 1em;
  padding: 0.2rem
}
.survey li>input,
.survey li>textarea {
  font-family: serif;
  box-sizing: border-box;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  width: 90%;
  outline: none;
  border: none;
  font-size: 1.3em;
  margin: 0.5rem;
  left: 10%;
  background-color: #f2f2f2
}
.survey li>textarea {
  resize: none;
  max-width: 100%;
  width: 200em;
  height: 12em
}
.survey li>.-submitButton {
  border: none;
  background: #12202d;
  color: #f2f2f2;
  font-family: sans-serif;
  font-weight: bold;
  padding: 0.5em 3em;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  cursor: pointer;
  margin-bottom: 0
}
```


#### Skip-to-Content Rules {#skip-to-content-rules}

```css
.skipToContentLink {
  opacity: 0;
  position: absolute;
}
.skipToContentLink:focus{
  opacity:1
}
```


#### Video Rules {#video-rules}

```css
.videoContainer {
  margin: 0 auto;
  width: 80vw;
  max-width: 60rem
}
.video {
  position: relative;
  padding-bottom: 56.25%;
  padding-top: 25px;
  height: 0
}
.video iframe {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%
}
```


### State Rules {#state-rules}


#### Selection Rules {#selection-rules}

```css
::selection {
  color: #222;
  background-color: #777;
}
```


### Animation Rules {#animation-rules}

```css
@keyframes animation-pulse-primary {
  from,
  50%,
  to {
      background-color: #035a85
  }
  50% {
      background-color: rgba(18, 32, 45, 0.5)
  }
}
```


## Demonstration HTML Document {#demonstration-html-document}

```html
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <link href="https://gmpg.org/xfn/11" rel="profile">
    <meta charset="UTF-8">
    <meta name="description" content="YDwarf is a minimal and cold-blue CSS theme.">
    <meta name="keywords" content="ydwarf, css, theme">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="./ydwarf.css">
    <title>YDwarf</title>
  </head>
  <body>
    <a class="skipToContentLink" href="#content">Skip to Content</a>
    <header>
      <h1>YDwarf</h1>
    </header>
    <main id="content">
      <p>
      YDwarf is a minimal and cold blue CSS theme.
      </p>
      <section id="features">
      <h2>Features</h2>
      <ul>
	<li>
	  <strong>Very little,</strong> honestly. <a href="">A link</a>
	</li>
      </ul>
      <blockquote>
      "Butts?" -- Chaos
      </blockquote>
      <section class="brief">
       What the <span class="emphasized">fuck</span> is a brief, what are these class names, fucking useless.
       </section>
       <a id="right-here" href="#right-here" class="button">Right here!</a>
       <section class="clickbait">
	 <section class="clickbait__lead">
	   Knock knock
	 </section>
	 <section class="clickbait__close">
	   Who's there
	 </section>
	 <section class="clickbait__lead">
	   Cantelope
	 </section>
	 <section class="clickbait__close">
	   Can't elope tonight, my dad locked up the ladder!
	 </section>
       </section>
       <section class="entrance">
       I'm a rebel putting my entrance halfway down the page eh
       </section>
       <section class="eyecatcher">
       <code>Demonstration code eh </code>
       </section>
      </section>
    </main>
  </body>
</html>
```