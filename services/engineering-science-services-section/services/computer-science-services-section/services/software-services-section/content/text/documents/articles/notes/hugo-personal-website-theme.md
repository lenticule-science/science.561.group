---
title: Table of Contents
description: This Hugo theme is about a software prototype.
aliases:
  - Hugo Personal Website Theme
keywords:
  - hugo
  - personal-website
  - static-site-generator
  - go-lang
  - literate-programming
target-discipline: technology
triage-enriched-by: infer-triage-frontmatter-v2-by-qwen2.5:3b
date-triage-enriched: 2026-03-08T22:09:52
type: text
---

# Table of Contents

-   [Introduction](#org349f46f)
-   [Hugo Personal Website Theme](#hugo-media-package-channel-generator)
    -   [Overview](#org0090677)
    -   [Operations](#orgd93e5bb)
        -   [Install the Theme](#org2d6588a)
        -   [Prepare the Build Environment](#org7a92c2a)
        -   [Build the Theme](#org6a2072d)
        -   [Distribute the Theme](#orgb42c4cd)
    -   [Theme Configuration](#org7789e26)
    -   [Page Layouts](#org4671e11)
        -   [Base Page Layout](#orgedeb581)
        -   [List Page Layout](#orgf15061a)
        -   [Index Page Layout](#org26b54db)
        -   [Single Page Layout](#orgde74012)
        -   [404 Page Layout](#org65654c9)
    -   [Partial Layouts](#orgc523333)
        -   [Pages Listing](#orgd6e976a)
        -   [Main Menu Listing](#orgf64adec)
-   [Supplements](#org71001b7)
    -   [Index](#orgb2fd0b4)
    -   [README](#orgdf1ec8d)
    -   [Source](#org2b245d0)


<a id="org349f46f"></a>

# Introduction

This *Hugo* theme is about a software prototype. It is likely to be inaccurate.

This *Hugo* theme is an implementation of a *personal website*: a website
catered around presenting information about a person. It is done using
*Hugo*, a *static site generator* written in *Go*.

The theme is written primarily for my personal use, on
[https://emsenn.net](https://emsenn.net).

The focus is on a relatively data-driven site, and hopefully one
that's able to present that data in a useful way, too.

This *Hugo* theme was created by me, emsenn, in the United States. To the extent possible under law, I have waived all copyright and related or neighboring rights to this document. This document was created for the benefit of the public. If you're viewing it on a remote server, you're encouraged to download your own copy. To learn how you can support me, see [https://emsenn.net/donate](https://emsenn.net/donate).

This *Hugo* theme implements its content using the *literate programming* paradigm. The "software" being presented is included as sections of code, within a longer piece of prose which explains the codes' purpose and usage. See [https://en.wikipedia.org/wiki/Literate\_programming](https://en.wikipedia.org/wiki/Literate_programming)


<a id="hugo-media-package-channel-generator"></a>

# Hugo Personal Website Theme

-   [Overview](#org0090677)
-   [Operations](#orgd93e5bb)
-   [Theme Configuration](#org7789e26)
-   [Page Layouts](#org4671e11)
-   [Partial Layouts](#orgc523333)


<a id="org0090677"></a>

## Overview

This *theme* provides layouts for generating a static website with the
*Hugo* static site generator. Despite the name, it doesn't provide any
information about how to style the documents - *theme* here is just
*Hugo's* term for things.


<a id="orgd93e5bb"></a>

## Operations

-   [Install the Theme](#org2d6588a)
-   [Prepare the Build Environment](#org7a92c2a)
-   [Build the Theme](#org6a2072d)
-   [Distribute the Theme](#orgb42c4cd)


<a id="org2d6588a"></a>

### Install the Theme


#### Install with Git


#### Install from Source


<a id="org7a92c2a"></a>

### Prepare the Build Environment

-   [Create Directories](#create-directories)
-   [Tangle Code](#org8563b71)
-   [Remove Past Builds](#org5323e3a)


<a id="create-directories"></a>

#### Create Directories

This shell script makes all the directories Hugo will expect to have.

    mkdir -p ../layouts/{_default,partials}


<a id="org8563b71"></a>

#### Tangle Code

The implementation of this *theme* is programmed *literately*, as
code blocks embedded in this *Hugo* theme.

The *theme* is implemented as a collection of *Hugo layouts*,
which *Hugo* uses to create the final website.

To tangle this code from this document you need the *Emacs* software
and its *Org-mode*. Then, while viewing this file, run the command
`org-babel-tangle`. You must first create directories, see ["Create
Directories"](#create-directories), so the folders the layouts expect are present.


<a id="org5323e3a"></a>

#### Remove Past Builds

If you want to remove past builds:

    rm -r ./build/
    mkdir ./build/


<a id="org6a2072d"></a>

### Build the Theme

To rebuild the collection of files that are the *theme*, you need the
*Hugo* software. Then, run `hugo` while in the `./build/` directory,
and it will create the channel under `./build/public/`.


<a id="orgb42c4cd"></a>

### Distribute the Theme

The generated theme is in `./build/public/`.


<a id="org7789e26"></a>

## Theme Configuration

The configuration below *tangles* to `./build/theme.toml`. Explaining
it in detail is beyond the scope of this document. <https://gohugo.io/themes/>

    name = "Hugo Personal Website Theme"
    license = "CC0"
    min_version = "0.55"
    [author]
      name = "emsenn"
      homepage = "https://emsenn.net"


<a id="org4671e11"></a>

## Page Layouts

This section contains the different page *layouts*.

-   [Base Page Layout](#orgedeb581)
-   [List Page Layout](#orgf15061a)
-   [Index Page Layout](#org26b54db)
-   [Single Page Layout](#orgde74012)
-   [404 Page Layout](#org65654c9)


<a id="orgedeb581"></a>

### Base Page Layout

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


<a id="orgf15061a"></a>

### List Page Layout

Located at `./build/layouts/_default/list.html`, this *layout* serves
serves as the base for pages that exist to serve lists, like the index
(homepage), or taxonomical list pages, such as those for categories or
tags.

    {{ define "main" }}
      {{ partial "pages-listing" . }}
    {{ end }}


<a id="org26b54db"></a>

### Index Page Layout

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


<a id="orgde74012"></a>

### Single Page Layout

    {{- define "main" -}}
      {{ with .Content }}
        {{ . }}
      {{ end }}
    {{- end -}}


<a id="org65654c9"></a>

### 404 Page Layout

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


<a id="orgc523333"></a>

## Partial Layouts


<a id="orgd6e976a"></a>

### Pages Listing

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


<a id="orgf64adec"></a>

### Main Menu Listing

    {{ with .Site.Menus.index }}
      <ul>
        {{ range . }}
          <li><a href="{{ .URL }}">{{ .Name }}</a></li>
        {{ end }}
      </ul>
    {{ end }}


<a id="org71001b7"></a>

# Supplements

-   [Index](#orgb2fd0b4)
-   [README](#orgdf1ec8d)
-   [Source](#org2b245d0)


<a id="orgb2fd0b4"></a>

## Index

-   **JSON:** A human-readable data format. See [https://json.org/](https://json.org/).
-   **HTML:** A way of adding layout, formatting, and media to text documents. See [https://en.wikipedia.org/wiki/HTML](https://en.wikipedia.org/wiki/HTML).
-   **Markdown:** A way of adding style notation to plain text. <https://daringfireball.net/projects/markdown/>
-   **Hugo:** A software tool for creating rendered documents from formatted text files. See [https://gohugo.io/](https://gohugo.io/)


<a id="orgdf1ec8d"></a>

## README


<a id="org2b245d0"></a>

## Source

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
    [https://emsenn.net](https://emsenn.net).

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

## Earlier material

The theme is written primarily for my personal use, on
    [[https://emsenn.net][https://emsenn.net]].

## Earlier material

<a id="introduction"></a>

<a id="org55b6867"></a>

<a id="org141e415"></a>

<a id="org4156f77"></a>

<a id="org0a73f63"></a>

```sh
mkdir -p ../layouts/{_default,partials}
```

<a id="org21b583f"></a>

<a id="org2c8237a"></a>

```sh
rm -r ./build/
mkdir ./build/
```

<a id="org5001242"></a>

<a id="orgd9cb5cb"></a>

<a id="orgf7d1411"></a>

```toml
name = "Hugo Personal Website Theme"
license = "CC0"
[author]
  name = "emsenn"
  homepage = "https://emsenn.net"
```

<a id="orgfe9448c"></a>

-   [Base Page Layout](#org99b9914)
-   [List Page Layout](#orgf5f6eba)
-   [Index Page Layout](#orgb6547ec)
-   [Single Page Layout](#org6f576d6)
-   [404 Page Layout](#org9d27db3)
-   [Media Package List Layout](#org04b8296)

<a id="org99b9914"></a>

<a id="orgf5f6eba"></a>

```html
{{ define "main" }}
  {{ with .Content }}{{ . }}{{ end }}
  {{ partial "pages-listing" . }}
{{ end }}
```

<a id="orgb6547ec"></a>

<a id="org6f576d6"></a>

<a id="org9d27db3"></a>

```html
{{- define "main" -}}

{{- end -}}
```

<a id="org04b8296"></a>

```html
{{ define "main" }}
  {{ with .Content }}{{ . }}{{ end }}
  {{ partial "media-package-listing" . }}
{{ end }}
```

<a id="org494b39e"></a>

<a id="org4b7273e"></a>

<a id="orgfb09c01"></a>

<a id="orgf0919fa"></a>

```html
{{ with .Params.mediaPackages }}
  <ul>
    {{ range . }}
      {{ with getJSON . }}
	{{ range $packageID, $packageDetails := . }}
	  <li>{{ $packageDetails.name }}</li> - Created by
	  {{ $packageDetails.creator }}, {{ $packageDetails.name }} is
	  {{ $packageDetails.description }} released under the
	  {{ $packageDetails.license }}.
	  {{ if $packageDetails.versions.current }}
	    The current version is available through the following
	    locations and formats:
	    {{ with $packageDetails.versions.current }}
	      <ul>
		{{ range $originName, $originDetails := . }}
		  <li>
		    <strong>{{ $originName | title }}</strong>:
		    {{ range $originDetails.formats }}
		      <a href="{{ $originDetails.location }}{{ $packageID }}.{{ . }}">
			{{ . }}
		      </a>
		    {{ end }}
		  </li>
		{{ end }}
	      </ul>
	    {{ end }}
	  {{ end }}
	{{ end }}
      {{ end }}
    {{ end }}
  </ul>
{{ end }}
```

<a id="org4490f9e"></a>

-   [Index](#orgafe98dd)
-   [README](#org79092cb)
-   [Source](#org890145b)

<a id="orgafe98dd"></a>

<a id="org79092cb"></a>

<a id="org890145b"></a>

```org
#+TITLE: Hugo Personal Website Theme
#+EXPORT_FILE_NAME: ../hugo-personal-website-theme
#+MACRO: document-type /Hugo/ theme
#+TOC: headlines 3
* Introduction
  :PROPERTIES:
  :CUSTOM_ID: introduction
  :END:
{{{document-is-software-prototype}}}

{{- end -}}
#+END_SRC
*** Media Package List Layout
    :PROPERTIES:
    :header-args: :tangle ../layouts/_default/media-package-list.html
    :END:
#+BEGIN_SRC html
  {{ define "main" }}
    {{ with .Content }}{{ . }}{{ end }}
    {{ partial "media-package-listing" . }}
  {{ end }}
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
*** Index Menu Listing
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
*** Media Package Listing
    :PROPERTIES:
    :header-args: :tangle ../layouts/partials/media-package-listing.html
    :END:
#+begin_src html
  {{ with .Params.mediaPackages }}
    <ul>
      {{ range . }}
	{{ with getJSON . }}
	  {{ range $packageID, $packageDetails := . }}
	    <li>{{ $packageDetails.name }}</li> - Created by
	    {{ $packageDetails.creator }}, {{ $packageDetails.name }} is
	    {{ $packageDetails.description }} released under the
	    {{ $packageDetails.license }}.
	    {{ if $packageDetails.versions.current }}
	      The current version is available through the following
	      locations and formats:
	      {{ with $packageDetails.versions.current }}
		<ul>
		  {{ range $originName, $originDetails := . }}
		    <li>
		      <strong>{{ $originName | title }}</strong>:
		      {{ range $originDetails.formats }}
			<a href="{{ $originDetails.location }}{{ $packageID }}.{{ . }}">
			  {{ . }}
			</a>
		      {{ end }}
		    </li>
		  {{ end }}
		</ul>
	      {{ end }}
	    {{ end }}
	  {{ end }}
	{{ end }}
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
   :PROPERTIES:
   :EXPORT_FILE_NAME: ../README
   :END:
#+INCLUDE: "./index.org::#introduction" :only-contents t
** Source
The following is the source of this document as it was written by the
author.
#+INCLUDE:  "./index.org" src org
```
