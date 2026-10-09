---
title: Brutstrap
description: "This CSS theme is a draft: it is considered incomplete and there are plans to add or change information contained in it."
---
This CSS theme is a _draft_: it is considered incomplete and there are plans to add or change information contained in it.

This CSS theme assumes the reader is knows how to read [cascading style sheets](https://en.wikipedia.org/wiki/Cascading_Style_Sheets) (CSS) and [HTML](https://en.wikipedia.org/wiki/HTML).

In this document I explain the design philosophy and implementation of my **Brutstrap** CSS theme: one where the webpage, as shown in the browser, is an accurate representation of the HTML document it is displaying.

This CSS theme was written by me, [emsenn](https://emsenn.net/), and is released for the benefit of the public under the terms included in the ["License"](https://emsenn.neocities.org/brutstrap#supplements-license) supplement. It was made possible with financial [contributions](https://emsenn.neocities.org/brutstrap#supplements-contribute) from humans like you. Please direct comments to my [public inbox](https://lists.sr.ht/~emsenn/public-inbox/) or, if necessary, my [personal email](mailto:emsenn@emsenn.net).

This CSS theme was directly inspired or supported by the work of others. Please see the ["Acknowledgements"](https://emsenn.neocities.org/brutstrap#supplements-acknowledgements) section.

This CSS theme is implemented using the _literate programming_ paradigm. The "software" being presented is included as sections of code, within a longer piece of prose which explains the code's purpose and usage. For a more complete explanation of my implementation of the paradigm, see ["Literate Programming"](https://emsenn.neocities.org/style-manual.html#literate-programming) in my [_Style Manual_](https://emsenn.neocities.org/style-manual.html).

## Brutstrap

**_Brutstrap_** is a CSS theme based on David Bryant Copeland's ["Guidelines for Brutalist Web Design,"](https://brutalist-web.design/) which advocates "_raw content true to its construction_."

- [Principles](https://emsenn.neocities.org/brutstrap#org8f337b5)
- [Usage](https://emsenn.neocities.org/brutstrap#orgec03dc5)
- [Implementation](https://emsenn.neocities.org/brutstrap#orgde0686d)

### Principles

- **_The website people see is the website in the HTML file._** As David Byant Copeland says in his definition, brutalist websites should be "raw content, true to [their] construction." Here, that means the content is represented as a single column, flowing left to right and top to bottom.
- **_Only links, inputs and buttons should respond to interaction._** A website should allow two points of interaction: a hyperlink that brings you to a destination, and form which submits information to a server. Those elements, and only those elements, should respond to being clicked, focused, or hovered-over.
- **_Components should be named what they are._** Classes should be named what they are, not what they're for.
- **_Design should be helpful._** Styling should be to help reinforce the context that your content has.

### Usage

**Brutstrap**'s stylesheet is available at [`./build/brutstrap/brutstrap.css`](https://emsenn.neocities.org/build/brutstrap/brutstrap.css), but please don't hotlink to it. You can also view the stylesheet under the ["Complete Stylesheet"](https://emsenn.neocities.org/brutstrap#supplements-complete-stylesheet) section.

### Implementation

**_NOTE:_** Because I use Org-mode, this CSS is written with rules compatible with its naming scheme.

- [Document Framing](https://emsenn.neocities.org/brutstrap#orgfda3411)
    - [Body](https://emsenn.neocities.org/brutstrap#org8ed2000)
    - [Header & Title](https://emsenn.neocities.org/brutstrap#orgd7de2ee)
    - [Content Container](https://emsenn.neocities.org/brutstrap#orgdfa8524)
    - [Footer](https://emsenn.neocities.org/brutstrap#org280a011)
- [Block Design](https://emsenn.neocities.org/brutstrap#org2d8f557)
    - [Section](https://emsenn.neocities.org/brutstrap#org41b9541)
    - [Blockquote](https://emsenn.neocities.org/brutstrap#orgabc9614)
    - [Table](https://emsenn.neocities.org/brutstrap#orgb28e585)
- [Typography](https://emsenn.neocities.org/brutstrap#org5d09c54)
    - [Headlines](https://emsenn.neocities.org/brutstrap#org736fd98)
    - [Links](https://emsenn.neocities.org/brutstrap#org90d4eb3)
- [State Rules](https://emsenn.neocities.org/brutstrap#orgaeb2474)
    - [Selection Rules](https://emsenn.neocities.org/brutstrap#org95b6e72)
- [Class Rules](https://emsenn.neocities.org/brutstrap#org2d4fb15)
    - [Code Block Rules](https://emsenn.neocities.org/brutstrap#org7b086bf)

#### Document Framing

##### Body

body {
  position: relative;
  background-color: #eee;
  color: #444;
  font-family: serif;
  margin: 0 auto;
  padding-bottom: 6rem;
  min-height: 100%;
  font-size: 1.4em;
}

##### Header & Title

header, h1 {
  font-family: sans-serif;
  text-align: center;
  width: 100%;
  overflow: hidden;
  font-family: sans-serif;
}
.title { font-size: 3.2rem; }
.subtitle { font-size: 2.2rem; }

##### Content Container

main, #content {
  width: 75vw;
  max-width: 40em;
  margin: 0 auto;
  line-height: 1.6;
  margin-bottom: 8rem;
}

##### Footer

footer, #postamble {
  padding: 1em 0;
  position: absolute;
  right: 0;
  bottom: 0;
  left: 0;
}

#### Block Design

##### Section

section {
  border-bottom: 0.1em solid #444;
  margin-bottom: 1em;
}

##### Blockquote

blockquote {
  padding: 0.5rem;
  border-left: 0.1em solid #444;
}

##### Table

table {
    border-collapse: collapse;
    border-spacing: 0;
    empty-cells: show;
    border: 0.1em solid #444;
}
thead { font-family: sans-serif; }
td {
  padding: 0 0.3em;
  border: 0.01em solid #444;
}

#### Typography

##### Headlines

h2, h3, h4, h5, h6 {
  font-family: sans-serif;
  margin: 0.5em;
}

##### Links

a {
  text-decoration: none;
  color: #3ac;
  display: inline-block;
  position: relative;
  border-bottom: 0.1rem dotted;
  line-height: 1.2;
  transition: border 0.3s;
}
a:hover {
  color: #5ce;
  outline-style: none;
  border-bottom: 0.1rem solid;
}
a:visited { color: #b8c; }
a:visited:hover { color: #dae; }
a:focus {
  outline-style: none;
  border-bottom: 0.1rem solid;
}

#### State Rules

##### Selection Rules

::selection { background-color: #777; color: #eee; }
a::selection { background-color: #ccc; }

#### Class Rules

##### Code Block Rules

pre, .src {
  padding: 0.5em;
  border: 0.1em solid #444;
  white-space: pre-wrap;
  overflow-x: scroll;
  text-overflow: clip;
}

## Supplements

- [Acknowledgements](https://emsenn.neocities.org/brutstrap#supplements-acknowledgements)
- [Contribute](https://emsenn.neocities.org/brutstrap#supplements-contribute)
- [Document History](https://emsenn.neocities.org/brutstrap#orgdfe5775)
- [License](https://emsenn.neocities.org/brutstrap#supplements-license)
- [Complete Stylesheet](https://emsenn.neocities.org/brutstrap#supplements-complete-stylesheet)
- [Demonstration HTML](https://emsenn.neocities.org/brutstrap#demonstration-html)

### Acknowledgements

- [David Bryant Copeland](https://naildrivin4.com/) defined "brutalist web design," inspiring this project.
- Whoever made the [motherfucking website](https://motherfuckingwebsite.com/).
- [Matthew Graybosch](https://www.matthewgraybosch.com/), whose [variation](https://codepen.io/demifiend/pen/EENKNN) on the motherfucking website made learning HTML and CSS seem feasible and worthwhile.