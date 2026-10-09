---
title: "Hugo Personal Website Theme"
description: This Hugo theme is about a software prototype.
---

## Table of Contents

- [Introduction](#org4a7d0bd)

- [Hugo Personal Website Theme](#hugo-media-package-channel-generator)

[Overview](#orga20e68a)

- [Operations](#orgaf33f49)

[Install the Theme](#org8ae209f)

- [Prepare the Build Environment](#orgc11b22c)

- [Build the Theme](#org8bcdb8b)

- [Distribute the Theme](#org1e02ffb)

- [Theme Configuration](#orgfb0eaae)

- [Page Layouts](#orgaa9fa41)

[Base Page Layout](#orgb5436ea)

- [List Page Layout](#orgf39f4e6)

- [Index Page Layout](#org0f6f037)

- [Single Page Layout](#orgd96e8a1)

- [404 Page Layout](#org2316f8d)

- [Partial Layouts](#orge4eda18)

[Pages Listing](#org5559b39)

- [Main Menu Listing](#orgc907de8)

- [Supplements](#orga90bfd8)

[Index](#org5ca8540)

- [README](#orgcceec30)

- [Source](#orgad57988)

## Introduction

This *Hugo* theme is about a software prototype. It is likely to be inaccurate.

This *Hugo* theme is an implementation of a *personal website*: a website
catered around presenting information about a person. It is done using
*Hugo*, a *static site generator* written in *Go*.

The theme is written primarily for my personal use, on
[https://emsenn.net](https://emsenn.net).

The focus is on a relatively data-driven site, and hopefully one
that's able to present that data in a useful way, too.

This *Hugo* theme was created by me, emsenn, in the United States. To the extent possible under law, I have waived all copyright and related or neighboring rights to this document. This document was created for the benefit of the public. If you're viewing it on a remote server, you're encouraged to download your own copy. To learn how you can support me, see [https://emsenn.net/donate](https://emsenn.net/donate).

This *Hugo* theme implements its content using the *literate programming* paradigm. The "software" being presented is included as sections of code, within a longer piece of prose which explains the codes' purpose and usage. See [https://en.wikipedia.org/wiki/Literate_programming](https://en.wikipedia.org/wiki/Literate_programming)

## Hugo Personal Website Theme

- [Overview](#orga20e68a)

- [Operations](#orgaf33f49)

- [Theme Configuration](#orgfb0eaae)

- [Page Layouts](#orgaa9fa41)

- [Partial Layouts](#orge4eda18)

### Overview

This *theme* provides layouts for generating a static website with the
*Hugo* static site generator. Despite the name, it doesn't provide any
information about how to style the documents - *theme* here is just
*Hugo's* term for things.

### Operations

- [Install the Theme](#org8ae209f)

- [Prepare the Build Environment](#orgc11b22c)

- [Build the Theme](#org8bcdb8b)

- [Distribute the Theme](#org1e02ffb)

#### Install the Theme

##### Install with Git

##### Install from Source

#### Prepare the Build Environment

- [Create Directories](#create-directories)

- [Tangle Code](#orga0b588f)

- [Remove Past Builds](#org4f0e7ad)

##### Create Directories

This shell script makes all the directories Hugo will expect to have.

mkdir -p ../layouts/{_default,partials}

##### Tangle Code

The implementation of this *theme* is programmed *literately*, as
code blocks embedded in this *Hugo* theme.

The *theme* is implemented as a collection of *Hugo layouts*,
which *Hugo* uses to create the final website.

To tangle this code from this document you need the *Emacs* software
and its *Org-mode*. Then, while viewing this file, run the command
`org-babel-tangle`. You must first create directories, see ["Create
Directories"](#create-directories), so the folders the layouts expect are present.

##### Remove Past Builds

If you want to remove past builds:

rm -r ./build/
mkdir ./build/

#### Build the Theme

To rebuild the collection of files that are the *theme*, you need the
*Hugo* software. Then, run `hugo` while in the `./build/` directory,
and it will create the channel under `./build/public/`.

#### Distribute the Theme

The generated theme is in `./build/public/`.

### Theme Configuration

The configuration below *tangles* to `./build/theme.toml`. Explaining
it in detail is beyond the scope of this document. [https://gohugo.io/themes/](https://gohugo.io/themes/)

name = "Hugo Personal Website Theme"
license = "CC0"
min_version = "0.55"
[author]
name = "emsenn"
homepage = "https://emsenn.net"

### Page Layouts

This section contains the different page *layouts*.

- [Base Page Layout](#orgb5436ea)

- [List Page Layout](#orgf39f4e6)

- [Index Page Layout](#org0f6f037)

- [Single Page Layout](#orgd96e8a1)

- [404 Page Layout](#org2316f8d)

#### Base Page Layout

Located at `./build/layouts/_default/baseof.html`, this *layout*
serves as the base for all others in this collection.

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
{{- with .Site.Language.Lang }} xml:lang="{{- . -}}" lang="{{- . -}}"
{{- end }}>
<head>
<link href="https://gmpg.org/xfn/11" rel="profile">
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="keywords" content="{{- .Render "keywords" -}}">
{{- with ((.Params.author) | default (.Site.Author)) }}
<meta name="author" content="{{ . }}">
{{- end }}
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>{{- printf "%s%s" (.Site.Title) (printf ": %s" (((.Data.Term | pluralize) | default .Title)) | default "Personal Website") -}}</title>
<style>
html {
color: #444;
background-color: #eee;
}
body: { margin: 0; }
header {
overflow: hidden;
padding: 1rem 0 3rem 0;
background: linear-gradient(to bottom, #eeef 92%, #eee0);
}
main {
width: 80vw;
max-width: 40rem;
margin: -4rem 1em -6rem;
padding: 3rem 2rem 6rem;
background: linear-gradient(to right, #eee0, #eeef 02%, #eeef 98%, #eee0);
}
footer {
padding: 4rem 1rem 1rem;
background: linear-gradient(to top, #eeef 97%, #eee0);
}
a {
text-decoration: none;
color: #3ac;
display: inline;
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
.skipToContentLink {
opacity: 0;
position: absolute;
}
.skipToContentLink:focus{
opacity:1
}
::selection {
color: #222;
background-color: #777;
}
img {
width: 100%;
}
</style>
</head>
<body>
<a class="skipToContentLink" href="#content">Skip to Content</a>
<header>
<h1>{{ .Title | default (.Data.Term.Pluralize | default (.Site.Title | default "Personal Website")) }}</h1>
</header>
<main>
{{- block "main" . -}}
<!-- -->
{{- end }}
</main>
</body>
</html>

#### List Page Layout

Located at `./build/layouts/_default/list.html`, this *layout* serves
serves as the base for pages that exist to serve lists, like the index
(homepage), or taxonomical list pages, such as those for categories or
tags.

{{ define "main" }}
{{ partial "pages-listing" . }}
{{ end }}

#### Index Page Layout

{{ define "main" }}
{{ with .Content }}{{ . }}{{ end }}
{{ partial "index-menu-listing.html" . }}
{{ with .Site.Data.activities }}
<h2>Recent Activites</h2>
<ul>
{{ range $date, $report := . }}
<li>
{{ (printf "**%s,** %s" (dateFormat "January 2, 2006" $date) $report) | safeHTML | markdownify }}
</li>
{{ end }}
</ul>
{{ end }}
{{ with .Site.Data.plans }}
<h2>Plans</h2>
{{ range $type, $plans := . }}
<h3>{{ $type | upper }}</h3>
<ul>
{{ range $plans }}
<li>{{ . }}</li>
{{ end }}
</ul>
{{ end }}
{{ end }}
{{ end }}

#### Single Page Layout

{{- define "main" -}}
{{ with .Content }}
{{ . }}
{{ end }}
{{- end -}}

#### 404 Page Layout

{{- define "main" -}}

<article>
<h1 class="post-title">404</h1>
<p>
Sorry, we have misplaced that URL or it's pointing to something that
doesn't exist.
</p>
<p>
Head back <a href="/">Home</a> or use the <a href="/search/">Search</a> to
try finding it again.
</p>
</article>

{{- end -}}

### Partial Layouts

#### Pages Listing

{{ with .Pages }}
<ul>
{{ range . }}
<li>
<a href="{{ .Permalink}}"><strong>
{{- if (eq .Kind "taxonomy") -}}
{{- .Title | pluralize -}}
{{- else -}}{{- .Title -}}{{- end -}}
</strong></a><br/>
</li>
{{ end }}
</ul>
{{ end }}

#### Main Menu Listing

{{ with .Site.Menus.index }}
<ul>
{{ range . }}
<li><a href="{{ .URL }}">{{ .Name }}</a></li>
{{ end }}
</ul>
{{ end }}

## Supplements

- [Index](#org5ca8540)

- [README](#orgcceec30)

- [Source](#orgad57988)

### Index

JSONA human-readable data format. See [https://json.org/](https://json.org/).
HTMLA way of adding layout, formatting, and media to text documents. See [https://en.wikipedia.org/wiki/HTML](https://en.wikipedia.org/wiki/HTML).
MarkdownA way of adding style notation to plain text. [https://daringfireball.net/projects/markdown/](https://daringfireball.net/projects/markdown/)
HugoA software tool for creating rendered documents from formatted text files. See [https://gohugo.io/](https://gohugo.io/)

### README

### Source

The following is the source of this document as it was written by the
author.

#+TITLE: Hugo Personal Website Theme
#+EXPORT_FILE_NAME: ../hugo-personal-website-theme
#+MACRO: document-type /Hugo/ theme
#+TOC: headlines 3
* Introduction
{{{document-is-software-prototype}}}

This {{{doc}}} is an implementation of a /personal website/: a website
catered around presenting information about a person. It is done using
/Hugo/, a /static site generator/ written in /Go/.

The theme is written primarily for my personal use, on
[[https://emsenn.net][https://emsenn.net]].

The focus is on a relatively data-driven site, and hopefully one
that's able to present that data in a useful way, too.

{{{document-eli(default)}}}

{{{document-implements-literate-programming}}}
* Hugo Personal Website Theme
:PROPERTIES:
:CUSTOM_ID: hugo-media-package-channel-generator
:END:
#+TOC: headlines 1 local
** DRAFT Overview
This /theme/ provides layouts for generating a static website with the
/Hugo/ static site generator. Despite the name, it doesn't provide any
information about how to style the documents - /theme/ here is just
/Hugo's/ term for things.
** DRAFT Operations
#+TOC: headlines 1 local
*** Install the Theme
**** Install with Git
**** Install from Source
*** DRAFT Prepare the Build Environment
#+TOC: headlines 1 local
**** DRAFT Create Directories
:PROPERTIES:
:CUSTOM_ID: create-directories
:END:
This shell script makes all the directories Hugo will expect to have.
#+begin_src sh :results none
mkdir -p ../layouts/{_default,partials}
#+end_src

**** DRAFT Tangle Code
The implementation of this /theme/ is programmed /literately/, as
code blocks embedded in this {{{doc}}}.

The /theme/ is implemented as a collection of /Hugo layouts/,
which /Hugo/ uses to create the final website.

To tangle this code from this document you need the /Emacs/ software
and its /Org-mode/. Then, while viewing this file, run the command
=org-babel-tangle=. You must first create directories, see [[#create-directories]["Create
Directories"]], so the folders the layouts expect are present.

**** DRAFT Remove Past Builds
If you want to remove past builds:

#+begin_src sh :results none
rm -r ./build/
mkdir ./build/
#+end_src
*** DRAFT Build the Theme
To rebuild the collection of files that are the /theme/, you need the
/Hugo/ software. Then, run =hugo= while in the =./build/= directory,
and it will create the channel under =./build/public/=.
*** DRAFT Distribute the Theme
The generated theme is in =./build/public/=.
** DRAFT Theme Configuration
:PROPERTIES:
:header-args: :tangle ../theme.toml :padline no
:END:
The configuration below /tangles/ to =./build/theme.toml=. Explaining
it in detail is beyond the scope of this document. {{{source(hugo-themes)}}}
#+NAME: site-configuration-base-url
#+begin_src toml
name = "Hugo Personal Website Theme"
license = "CC0"
min_version = "0.55"
[author]
name = "emsenn"
homepage = "https://emsenn.net"
#+end_src
** DRAFT Page Layouts
This section contains the different page /layouts/.
#+TOC: headlines 1 local
*** Base Page Layout
:PROPERTIES:
:header-args: :tangle ../layouts/_default/baseof.html
:END:
Located at =./build/layouts/_default/baseof.html=, this /layout/
serves as the base for all others in this collection.
#+BEGIN_SRC html
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
{{- with .Site.Language.Lang }} xml:lang="{{- . -}}" lang="{{- . -}}"
{{- end }}>
<head>
<link href="https://gmpg.org/xfn/11" rel="profile">
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="keywords" content="{{- .Render "keywords" -}}">
{{- with ((.Params.author) | default (.Site.Author)) }}
<meta name="author" content="{{ . }}">
{{- end }}
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>{{- printf "%s%s" (.Site.Title) (printf ": %s" (((.Data.Term | pluralize) | default .Title)) | default "Personal Website") -}}</title>
<style>
html {
color: #444;
background-color: #eee;
}
body: { margin: 0; }
header {
overflow: hidden;
padding: 1rem 0 3rem 0;
background: linear-gradient(to bottom, #eeef 92%, #eee0);
}
main {
width: 80vw;
max-width: 40rem;
margin: -4rem 1em -6rem;
padding: 3rem 2rem 6rem;
background: linear-gradient(to right, #eee0, #eeef 02%, #eeef 98%, #eee0);
}
footer {
padding: 4rem 1rem 1rem;
background: linear-gradient(to top, #eeef 97%, #eee0);
}
a {
text-decoration: none;
color: #3ac;
display: inline;
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
.skipToContentLink {
opacity: 0;
position: absolute;
}
.skipToContentLink:focus{
opacity:1
}
::selection {
color: #222;
background-color: #777;
}
img {
width: 100%;
}
</style>
</head>
<body>
<a class="skipToContentLink" href="#content">Skip to Content</a>
<header>
<h1>{{ .Title | default (.Data.Term.Pluralize | default (.Site.Title | default "Personal Website")) }}</h1>
</header>
<main>
{{- block "main" . -}}
<!-- -->
{{- end }}
</main>
</body>
</html>
#+end_src
*** DRAFT List Page Layout
:PROPERTIES:
:header-args: :tangle ../layouts/_default/list.html
:END:
Located at =./build/layouts/_default/list.html=, this /layout/ serves
serves as the base for pages that exist to serve lists, like the index
(homepage), or taxonomical list pages, such as those for categories or
tags.
#+BEGIN_SRC html
{{ define "main" }}
{{ partial "pages-listing" . }}
{{ end }}
#+END_SRC
*** DRAFT Index Page Layout
:PROPERTIES:
:header-args: :tangle ../layouts/_default/index.html
:END:
#+NAME: index-layout
#+BEGIN_SRC html
{{ define "main" }}
{{ with .Content }}{{ . }}{{ end }}
{{ partial "index-menu-listing.html" . }}
{{ with .Site.Data.activities }}
<h2>Recent Activites</h2>
<ul>
{{ range $date, $report := . }}
<li>
{{ (printf "**%s,** %s" (dateFormat "January 2, 2006" $date) $report) | safeHTML | markdownify }}
</li>
{{ end }}
</ul>
{{ end }}
{{ with .Site.Data.plans }}
<h2>Plans</h2>
{{ range $type, $plans := . }}
<h3>{{ $type | upper }}</h3>
<ul>
{{ range $plans }}
<li>{{ . }}</li>
{{ end }}
</ul>
{{ end }}
{{ end }}
{{ end }}
#+END_SRC
*** DRAFT Single Page Layout
:PROPERTIES:
:header-args: :tangle ../layouts/_default/single.html
:END:
#+NAME: default-single-document-layout
#+BEGIN_SRC html
{{- define "main" -}}
{{ with .Content }}
{{ . }}
{{ end }}
{{- end -}}
#+END_SRC
*** DRAFT 404 Page Layout
:PROPERTIES:
:header-args: :tangle ../layouts/404.html
:END:
#+NAME: 404-layout
#+BEGIN_SRC html
{{- define "main" -}}

<article>
<h1 class="post-title">404</h1>
<p>
Sorry, we have misplaced that URL or it's pointing to something that
doesn't exist.
</p>
<p>
Head back <a href="/">Home</a> or use the <a href="/search/">Search</a> to
try finding it again.
</p>
</article>

{{- end -}}
#+END_SRC
** Partial Layouts
*** Pages Listing
:PROPERTIES:
:header-args: :tangle ../layouts/partials/pages-listing.html
:END:
#+begin_src html
{{ with .Pages }}
<ul>
{{ range . }}
<li>
<a href="{{ .Permalink}}"><strong>
{{- if (eq .Kind "taxonomy") -}}
{{- .Title | pluralize -}}
{{- else -}}{{- .Title -}}{{- end -}}
</strong></a><br/>
</li>
{{ end }}
</ul>
{{ end }}
#+end_src
*** Main Menu Listing
:PROPERTIES:
:header-args: :tangle ../layouts/partials/index-menu-listing.html
:END:
#+begin_src html
{{ with .Site.Menus.index }}
<ul>
{{ range . }}
<li><a href="{{ .URL }}">{{ .Name }}</a></li>
{{ end }}
</ul>
{{ end }}
#+end_src
* Supplements
#+TOC: headlines 1 local
** Index
- JSON :: {{{ref(json)}}}
- HTML :: {{{ref(html)}}}
- Markdown :: {{{ref(markdown)}}}
- Hugo :: {{{ref(hugo)}}}
** README

** Source
The following is the source of this document as it was written by the
author.
#+INCLUDE:  "./index.org" src

Author: emsenn

Created: 2019-06-09 Sun 21:10

[Validate](http://validator.w3.org/check?uri=referer)
