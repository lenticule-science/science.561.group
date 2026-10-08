---
title: Hugo Media Package Channel Theme
description: This is an implementation of a media package channel generator using Hugo.
---

# Introduction

{{{document-is-software-prototype}}}

This is an implementation of a *media package channel generator* using *Hugo*.

{{{document-eli(default)}}}

{{{document-implements-literate-programming}}}

# Hugo Media Package Channel Theme {#hugo-media-package-channel-generator}

## DRAFT Overview

This is an implementation of a *media package channel generator* in *Hugo*: it uses a collection of packages defined in *Hugo*-compatible *Markdown* to create a *media package channel* with listings in *HTML* and *JSON*.

## DRAFT Operations

This section explains the various operations involved in using the *media package channel generator* implemented in this {{{doc}}}.

### DRAFT Prepare the Generator

#### DRAFT Create Directories {#create-directories}

This shell script makes all the directories Hugo will expect to have.

``` {.bash org-language="sh" results="none"}
mkdir -p ./build/layouts/{_default,audio,documents,images,partials,software,video}
mkdir -p ./build/content/packages
```

#### DRAFT Tangle Code

The implementation of this *generator* is programmed *literately*, as code blocks embedded in this {{{doc}}}.

The generator is implemented as a collection of *Hugo templates*, which *Hugo* uses to create *HTML* and *JSON* files, representing the channel and its packages.

To tangle this code from this document you need the *Emacs* software and its *Org-mode*. Then, while viewing this file, run the command `org-babel-tangle`{.verbatim}. You must first create directories, see ["Create Directories"](#create-directories), so the folders the layouts expect are present.

#### DRAFT Remove Past Builds

If you want to remove past builds:

``` {.bash org-language="sh" results="none"}
rm -r ./build/
mkdir ./build/
```

### DRAFT Use the Generator

#### DRAFT Build the Site

To rebuild the collection of files that are the *media package channel*, you need the *Hugo* software. Then, run `hugo`{.verbatim} while in the `./build/`{.verbatim} directory, and it will create the channel under `./build/public/`{.verbatim}.

### DRAFT Distribute the Channel

The generated channel is in `./build/public/`{.verbatim}.

## DRAFT Channel Configuration {#draft-channel-configuration header-args=":tangle ./build/config.toml :padline no"}

The configuration below *tangles* to `./build/config.toml`{.verbatim}. Explaining it in detail is beyond the scope of this document. {{{source(hugo-config)}}}

``` {#site-configuration-base-url .toml}
baseURL = "./"
languageCode = "en-us"
enableEmoji = true
title = "emsenn's media store"
author = "emsenn"
[outputs]
  page = ["HTML","JSON"]
```

## DRAFT Page Layouts

This section contains the different page *layouts*.

### DRAFT HTML Layouts

#### DRAFT Base HTML Page Layout {#draft-base-html-page-layout header-args=":tangle ./build/layouts/_default/baseof.html"}

Located at `./build/layouts/_default/baseof.html`{.verbatim}, this *layout* serves as the base for all others in this collection.

``` html
<!DOCTYPE html>
  <html xmlns="http://www.w3.org/1999/xhtml"
    {{- with .Site.Language.Lang }} xml:lang="{{- . -}}" lang="{{- . -}}"
    {{- end }}>
  <head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="{{- .Render "keywords" -}}">
    {{- with ((.Params.author) | default (.Site.Author)) }}
    <meta name="author" content="{{ . }}">
    {{- end }}
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ .Site.Title | default "Media Package Channel"}}</title>
  </head>
  <body>
    <header>
      <h1>{{ block "headline" . }}{{ .Site.Title | default "Media Package Channel" }}{{ end }}</h1>
    </header>
    <main>
      {{- block "main" . -}}
        <!-- -->
      {{- end }}
    </main>
  </body>
</html>
```

#### DRAFT List HTML Page Layout {#draft-list-html-page-layout header-args=":tangle ./build/layouts/_default/list.html"}

Located at `./build/layouts/_default/list.html`{.verbatim}, this *layout* serves serves as the base for pages that exist to serve lists, like the index (homepage), or taxonomical list pages, such as those for categories or tags.

``` html
{{ define "headline" }}
  <h1>{{ (.Data.Term | title | pluralize) | default .Site.Title }}</h1>
{{ end }}
{{ define "main" }}
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
{{ end }}
```

#### DRAFT Index HTML Page Layout {#draft-index-html-page-layout header-args=":tangle ./build/layouts/_default/index.html"}

``` {#index-layout .html}
{{ define "main" }}
  raaaaaaaaaaaaaaar
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
{{ end }}
```

#### DRAFT Package HTML Page Layout {#draft-package-html-page-layout header-args=":tangle ./build/layouts/_default/single.html"}

``` {#default-single-document-layout .html}
{{- define "main" -}}
  {{- $scratch := newScratch -}}
  {{- range $version,$versionDetails := .Params.v -}}
    {{- $scratch.Add "versions" (slice $version) -}}
  {{- end -}}
  {{- $scratch.Set "versions" (sort ($scratch.Get "versions") "value" "desc") }}
      <ul>
        {{- range ($scratch.Get "versions") -}}
          {{- $scratch.Set "currentVersion" . -}}
          {{- range $versionOrigin, $originDetails := (index $.Params.v .) -}}
            {{- $scratch.Add "versionOrigins" (slice $versionOrigin) -}}
          {{- end -}}
          {{- $scratch.Set "versionOrigins" (sort ($scratch.Get "versionOrigins") "value" "asc") }}
        <li><strong>{{ . }}</strong>:<ul>
                {{- range ($scratch.Get "versionOrigins") -}}
                  {{- $scratch.Set "currentOrigin" . -}}
                  {{- $scratch.Set "currentLocation" (index (index (index $.Params.v ($scratch.Get "currentVersion")) ($scratch.Get "currentOrigin")) "location") }}
          <li><em>{{- . -}}</em>:<ul>
                    {{- range (index (index (index $.Params.v ($scratch.Get "currentVersion")) ($scratch.Get "currentOrigin")) "formats") }}
            <li>
              <a href="
                    {{- if (eq ($scratch.Get "currentOrigin") "local") -}}
                              {{- $.Site.BaseURL -}}
                            {{- end -}}
                            {{- $scratch.Get "currentLocation" -}}
                        .
                            {{- . -}}
                          ">
                          {{- . -}}
              </a>
            </li>
                      {{- end }}
          </ul></li>
              {{- end -}}
              {{- $scratch.Delete "versionOrigins" }}
        </ul></li>
      {{- end -}}
      {{- $scratch.Delete "currentVersion" }}
      </ul>
{{- end -}}
```

#### DRAFT 404 Page Layout {#draft-404-page-layout header-args=":tangle ./build/layouts/404.html"}

``` {#404-layout .html}
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
```

### DRAFT JSON Layouts

#### DRAFT List JSON Page Layout

#### DRAFT Package JSON Page Layout {#draft-package-json-page-layout header-args=":tangle ./build/layouts/_default/single.json"}

``` json
{
  "shaggy-dog-tale": {
    "title": "A Shaggy Dog Tale"
    version: {
      "0.1.0": {
        "local":{
          "location": "/store/"
          "formats": ["html","org"]
        }
      }
    }
  }
}
```

## DRAFT Example Packages

This *media package channel generator* sources from *Hugo*-compatible *Markdown*

### A Shaggy Dog Tale {#a-shaggy-dog-tale header-args=":tangle ./build/content/shaggy-dog-tale.md"}

``` markdown
+++
title = "A Shaggy Dog Tale"
slug = "shaggy-dog-tale"
description = """This is an example of a media storefront content
piece listing."""
[v."1.0.1"."github"]
location = "https://github.com/emsenn/shaggy-dog-tale"
formats = ["org", "html"]
[v."1.0.1"."local"]
location = "/store/"
formats = ["org", "html"]
[v."1.0.0"."local"]
location = "/store/"
formats = ["org"]
+++

Blah blah blah
```

# Supplements

## Example Pages

### HTML Channel Index

### HTML Package

### JSON Package

## Index

media package  
{{{ref(media-package)}}}

media package channel  
{{{ref(media-package-channel)}}}

media package channel generator  
{{{ref(media-package-channel-generator)}}}

JSON  
{{{ref(json)}}}

HTML  
{{{ref(html)}}}

Markdown  
{{{ref(markdown)}}}

Hugo  
{{{ref(hugo)}}}

## Source

The following is the source of this document as it was written by the author.
