---
aliases: 
tags: 
created: 2019-05-03T11:16:24
modified: 2025-07-13T11:17:47
---

## Introduction

This collection of Hugo templates is unfinished, and I have no plans to finish it.

This collection of Hugo templates was written by me, [emsenn](https://emsenn.net/), and is released for the benefit of the public under the terms included in the ["License"](https://emsenn.neocities.org/hugo-website#supplements-license) supplement. It was made possible with financial [contributions](https://emsenn.neocities.org/hugo-website#supplements-contribute) from humans like you. Please direct comments to my [public inbox](https://lists.sr.ht/~emsenn/public-inbox/) or, if necessary, my [personal email](mailto:emsenn@emsenn.net).

This collection of Hugo templates is implemented using the *literate programming* paradigm. The "software" being presented is included as sections of code, within a longer piece of prose which explains the code's purpose and usage. For a more complete explanation of my implementation of the paradigm, see ["Literate Programming"](https://emsenn.neocities.org/style-manual.html#literate-programming) in my [_Style Manual_](https://emsenn.neocities.org/style-manual.html).

## Hugo Website

### Operations

#### Installation

##### Preparing the System

mkdir ../build/personal-website/layouts/{_default,docs,}

##### Tangling the Code

#### Building the Site

#### Publishing

### Hugo Configuration & Layouts

#### Hugo Configuration

Hugo is the static site generator I use, and while most of the configuration comes from individual documents, there is some site-wide configuration applied.

This configuration is written to the `./config.toml` file.

##### Base URL Configuration

The `baseURL` variable, accessed through `.Site.BaseURL`, is currently unused.

baseURL = "https://emsenn.net"

##### Language Configuration

The `languageCode` variable, accessed through `.Site.Language.Lang`, is used in the [Base Default Layout](https://emsenn.neocities.org/hugo-website#org5b85dd3).

languageCode = "en-us"

##### Emoji Configuration

The `enableEmoji` variables sets whether or not emoticon shortcodes in documents are rendered. (:smile: to a smiling face emoji, for example.)

enableEmoji = true

##### Title Configuration

title = "emsenn"

##### Site Author Configuration

author = "emsenn"

##### Site Document Types Configuration

[params]
  documentTypes = "essay fiction document letter manual"

#### Hugo Layouts

***Layouts*** are the instructions Hugo uses to construct a document. Explanation TK. If you're familiar with SMACSS, blocks are equivalent to [layouts](https://smacss.com/book/type-layout).

##### Default Layouts

The ***default layouts***, located under `./layouts/_default/` are used when there's not a more relevant layout to use with a document. Because Hugo is written as a static website generator, all the default templates are in HTML.

Base Default Layout

The ***base default layout***, saved as `./layouts/_default/baseof.html`, is the lowest-priority (except for themes') base template, but even so is used as the base template for every(?) HTML document on my website.

There are roughly two parts to the `baseof.html` layout - there is some initialization of variables at the top, and then the rest pulls in other layouts to render a complete HTML document.

Base Default Layout: Document Declaration

{{ block "documentDeclaration" . }}
  <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml"
      {{- with .Site.Language.Lang }} xml:lang="{{- . -}}" lang="{{- . -}}"
      {{- end }}>
{{ end }}

Base Default Layout: Head

Base Default Layout: Head: Opening

The default base layout creates a `head` block, which, in its default, contains a `<head>` tag with several components.

{{ block "head" . }}
  <head>

Base Default Layout: Head: Links

TODO Add canonical links

{{ block "headLinks" . }}
  <link href="https://gmpg.org/xfn/11" rel="profile">
{{ end }}

Base Default Layout: Head: Meta

The `headMeta` block contains a `<link>` tag that I honestly don't know why or what it does, and several `<meta>` tags. Setting the `charset` property does… something. I think maybe lets emoji be available? Or tells the client to try and make them available?

{{ block "headMeta" . }}
  <meta charset="UTF-8">

The `description` is used by search engines and other external resources if they don't have a more relevant description to pull.

<meta name="description" content="">

The `keywords` are used for SEO bullshit.

<meta name="keywords" content="{{- .Render "keywords" -}}">

The `author` is set only if the document has an `author` parameter set or if the [`config.toml`](https://emsenn.neocities.org/hugo-website#org6d1b747) contains a [`author` configuration](https://emsenn.neocities.org/hugo-website#org2859f1e).

{{ with ((.Params.author) | default (.Site.Author)) -}}
  <meta name="author" content="{{ . }}">
{{- end }}

  <meta name="viewport" content="width=device-width, initial-scale=1.0">
{{ end }}

Base Default Layout: Head: Title

{{ block "headTitle" . }}
  <title>
	{{- printf "%s%s" (.Site.Title) (printf ": %s" (((.Data.Term | pluralize) | default .Title)) | default "") -}}
  </title>
{{ end }}

Base Default Layout: Head: Style

{{ block "style" . }}
  <style>
	{{ block "htmlCSSRules" . }}
	  html {
		{{ block "htmlCSSColorRules" . }}
		  color: #444;
		  background-color: #eee;
		{{ end }}
		hyphens: auto;
		font-family: sans-serif;
		letter-spacing: .03em;
		word-spacing: .05em;
		line-height: 1.4;
		font-size: 1.3rem;
		transition-timing-function: ease-in;
		animation-timing-function: ease-in;
	  }
	{{ end }}
	{{ block "bodyCSSRules" . }}
	  body {
		margin: 0;
		{{ block "bodyExtraCSSRules" . }}
		<!-- -->
		{{ end }}
	  }
	{{ end }}
	{{ block "headerCSSRules" . }}
	  header {
		overflow: hidden;
		padding: 1rem 0 3rem 0;
		background: linear-gradient(to bottom, #eeef 92%, #eee0);
	  }
	{{ end }}
	{{ block "mainCSSRules" . }}
	  main {
		width: 80vw;
		max-width: 40rem;
		margin: -4rem 1em -6rem;
		padding: 3rem 2rem 6rem;
		{{ block "mainCSSColorRules" . }}
		  background: linear-gradient(to right, #eee0, #eeef 02%, #eeef 98%, #eee0);
		{{ end }}
		{{ block "mainExtraCSSRules" . }}
		{{ end }}
	  }
	{{ end }}
	{{ block "footerCSSRules" . }}
	  footer {
		padding: 4rem 1rem 1rem;
		background: linear-gradient(to top, #eeef 97%, #eee0);
	  }
	{{ end }}
	{{ block "sectionCSSRules" . }}
	{{ end }}
	{{ block "headlineRules" . }}
	  {{ block "h1CSSRules" . }}
		h1 {
		  font-weight: normal;
		  font-size: 2.6em;
		  line-height: 1;
		  {{ block "h1CSSShadowRules" . }}
			text-shadow: .05em .05em .1em rgba(68,68,68,.3);
		  {{ end }}
		  margin: 0 auto;
		  padding: 0 .5em;
		}
	  {{ end }}
	  h2,h3,h4,h5,h6 {
		{{ block "headlineCSSShadowRules" . }}
		  text-shadow: .08em .03em .03em rgba(68,68,68,.3);
		{{ end }}
	  }
	  {{ block "headlineCSSBeforeRules" . }}
		h2::before, h3::before, h4::before, h5::before, h6::before, h7::before, h8::before, h9::before, h10::before {
		  display: inline-block;
		  text-shadow: none;
		  {{ block "headlineCSSBeforeColorRules" . }}
			opacity: 0.5;
		  {{ end }}
		  margin-right: .3em;
		  font-size: 0.6em;
		}
	  {{ end }}
	  {{ block "h2CSSRules" . }}
		h2 {
		  font-size: 2.3em;
		}
		h2::before {
		  content: "*";
		}
	  {{ end }}
	  {{ block "h3CSSRules" . }}
		h3 {
		  font-size: 2.1em;
		}
		h3::before {
		  content: "**";
		}
	  {{ end }}
	  {{ block "h4CSSRules" . }}
		h4 {
		  font-size: 1.9em;
		}
		h4::before {
		  content: "⁂";
		}
	  {{ end }}
	  {{ block "h5CSSRules" . }}
		h5 {
		  font-size: 1.7em;
		}
		h5::before {
		  content: "⁂*";
		}
	  {{ end }}
	  {{ block "h6CSSRules" . }}
		h6 {
		  font-size: 1.5em;
		}
		h6::before {
		  content: "⁂**";
		}
	  {{ end }}
	  {{ block "h7CSSRules" . }}
		h7::before {
		  content: "⁂⁂";
		}
	  {{ end }}
	  {{ block "h8CSSRules" . }}
		h8::before {
		  content: "⁂*";
		}
	  {{ end }}
	{{ end }}
	{{ block "aCSSRules"  . }}
	  a {
		color: #31B;
		text-decoration: underline dotted #4447;
		text-shadow: 0 0 .1em rgba(68,68,68,.2);
	  }
	  a:visited {
		color: #718;
	  }
	  a:hover {
		color: #42C;
		outline-style: none;
		text-decoration: underline solid #42c3;
		text-shadow: 0 0 .1em #31b7;
	  }
	  a:focus {
		color: #42C;
		outline-style: none;
		text-decoration: underline solid #42c3;
		text-shadow: 0 0 .1em #31b7;
	  }
	  a:visited:hover, a:visited:focus {
		color: #918;
		text-decoration: underline solid #9183;
		text-shadow: 0 0 .1em #7187;
	  }
	{{ end }}
	{{ block "skipToContentCSSRules" . }}
	  .skipToContentLink {
		opacity: 0;
		position: absolute;
	  }
	  .skipToContentLink:focus{
		opacity:1
	  }
	{{ end }}
	{{ block "selectionCSSRules" . }}
	  ::selection {
		color: #222;
		background-color: #777;
	  }
	{{ end }}
	{{ block "imgCSSRules" . }}
	  img {
		width: 100%;
	  }
	{{ end }}

	{{ block "extraCSSRules" . }}
	{{ end }}
  </style>
{{ end }}

Base Default Layout: Head: Close

  </head>
{{ end }}

Base Default Layout: Body

Base Default Layout: Body: Opening

{{ block "body" . }}
  <body>

Base Default Layout: Body: Background

{{ block "bodyBackground" . }}
  <!-- -->
{{ end }}

Base Default Layout: Body: Preface

{{ block "bodyPreface" . }}
  <a class="skipToContentLink" href="#content">Skip to Content</a>
{{ end }}

Base Default Layout: Body: Header

{{ block "header" . }}
  <header>
	{{ block "headline" . }}
	  <h1>{{ .Title | default .Site.Title }}</h1>
	{{ end }}
	{{ block "subheadline" . }}
	  <!-- -->
	{{ end }}
	{{ block "headerExtra" . }}
	<!-- -->
	{{ end }}
  </header>
{{ end }}

Base Default Layout: Body: Main

{{ block "main" . }}
  <main id="content">
	{{ block "content" . }}
	  {{ with .Content }}
		{{ . }}
	  {{ end }}
	{{ end }}
	{{ block "sectionlisting" . }}{{ end }}
  </main>
{{ end }}

Base Default Layout: Body: Footer

{{ block "footer" . }}
{{ end }}

Base Default Layout: Body: Close

  </body>
{{ end }}

Base Default Layout: Document Close

</html>

List Default Layout

{{ define "headline" }}
  <h1>{{ (.Data.Term | title | pluralize) | default .Title }}</h1>
{{ end }}
{{ define "sectionlisting" }}
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

Default Single Page Layout

{{ define "subheadline" }}
  <!-- -->
{{ end }}
{{ define "content" }}
  {{ with .Content }}
	{{ . }}
  {{ end }}
{{ end }}

Index Default Layout

{{- define "headTitle" -}}
  <title>emsenn</title>
{{ end }}
{{- define "headline" -}}
  <h1>My name is emsenn</h1>
{{- end -}}
{{- define "subheadline" -}}
  <!-- -->
{{- end -}}
{{ define "content" }}
  {{ with .Site.Data.index.introduction }}
	{{ . | markdownify }}
  {{ end }}
  {{ with .Site.Data.activities }}
	<section id="recent-activites">
	  <h2>Recent Activities</h2>
	  <ul>
		{{ range $date, $report := . }}
		  <li>
			{{ (printf "**%s,** %s" (dateFormat "January 2, 2006" $date) $report) | safeHTML | markdownify }}
		  </li>
		{{ end }}
	  </ul>
	</section>
  {{ end }}
  {{ with .Site.Data.index.plans }}
	<section id="plans">
	  <h2>Plans</h2>
	  <ul>
		{{ range . }}
		  <li>
			{{ . | markdownify }}
		  </li>
		{{ end }}
	  </ul>
	</section>
  {{ end }}
  <p>
	{{ (printf "This website contains a [curated list of my projects](/projects/) and [my non-commissioned documents](/docs/).") | markdownify }}
  </p>
{{ end }}

TODO Use `<time>` tag for datetime content.

##### Content Layouts

TODO Video Streaming Layout

##### Document Layouts

Default Document Layouts

Default Single Document Layout

{{ define "bodyBackground" }}
  <div class="backgroundimage"></div>
{{ end }}
{{ define "bodyExtraCSSRules" }}
  background-image: url("data:image/svg+xml,%3Csvg width='84' height='48' viewBox='0 0 84 48' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M0 0h12v6H0V0zm28 8h12v6H28V8zm14-8h12v6H42V0zm14 0h12v6H56V0zm0 8h12v6H56V8zM42 8h12v6H42V8zm0 16h12v6H42v-6zm14-8h12v6H56v-6zm14 0h12v6H70v-6zm0-16h12v6H70V0zM28 32h12v6H28v-6zM14 16h12v6H14v-6zM0 24h12v6H0v-6zm0 8h12v6H0v-6zm14 0h12v6H14v-6zm14 8h12v6H28v-6zm-14 0h12v6H14v-6zm28 0h12v6H42v-6zm14-8h12v6H56v-6zm0-8h12v6H56v-6zm14 8h12v6H70v-6zm0 8h12v6H70v-6zM14 24h12v6H14v-6zm14-8h12v6H28v-6zM14 8h12v6H14V8zM0 8h12v6H0V8z' fill='%23444' fill-opacity='0.05' fill-rule='evenodd'/%3E%3C/svg%3E");
{{ end }}
{{ define "mainExtraCSSRules" }}
{{ end }}
{{ define "content" }}
  {{ block "frontmatter" . }}
	{{ $scratch := newScratch }}
	{{ ($scratch.Set "contentType" (printf "%s" (.Param "contentType" | default (.Layout | default (.Type | singularize))))) }}
	{{ ($scratch.Set "showListItems" "") }}
	{{ ($scratch.Set "showDate" "essay note") }}
	{{ ($scratch.Set "showReadingTime" "essay letter manual procedure procedures") }}
	{{ ($scratch.Set "showWordCount" "essay letter manual procedure procedures") }}
	{{ ($scratch.Set "paramTypes" slice) }}
	{{ if (isset .Params "tags") }}
	  {{ with .Params.tags }}
		{{ range last 1 . }}
		  {{ if (eq (. | title) .) }}
			{{ ($scratch.Set "contentSubject" (. | humanize | title)) }}
		  {{ else }}
			{{ ($scratch.Set "contentSubject" (. | humanize | lower)) }}
		  {{ end }}
		{{ end }}
	  {{ end }}
	{{ end }}
	{{ with ($scratch.Get "contentType") }}
	  {{ if (eq . ( . | pluralize)) }}
		{{ ($scratch.SetInMap "grammar" "article" "these") }}
		{{ ($scratch.SetInMap "grammar" "hasTense" "have") }}
		{{ ($scratch.SetInMap "grammar" "isTense" "are") }}
	  {{ else }}
		{{ ($scratch.SetInMap "grammar" "article" "this") }}
		{{ ($scratch.SetInMap "grammar" "hasTense" "has") }}
		{{ ($scratch.SetInMap "grammar" "isTense" "is") }}
	  {{ end }}
	{{ end }}
	{{ if (in ($scratch.Get "showDate") ($scratch.Get "contentType")) }}
	  {{ with .Date }}
		{{ ($scratch.SetInMap "pageParameters" "1date" .) }}
	  {{ end }}
   {{ end }}
   {{ if (in ($scratch.Get "showListItems") ($scratch.Get "contentType")) }}
   {{ end }}
   {{ if (in ($scratch.Get "showWordCount") ($scratch.Get "contentType")) }}
	 {{ ($scratch.SetInMap "pageParameters" "3wordCount" .WordCount) }}
   {{ end }}
   {{ if (in ($scratch.Get "showReadingTime") ($scratch.Get "contentType")) }}
	 {{ ($scratch.SetInMap "pageParameters" "4readingTime" .ReadingTime) }}
   {{ end }}
   {{ if (.Draft) }}
	 {{ ($scratch.SetInMap "pageParameters" "5isDraft" true) }}
   {{ end }}
   {{ ($scratch.Set "introClause" (printf "%s **%s**" ((index ($scratch.Get "grammar") "article") | title) ($scratch.Get "contentType"))) }}
   {{ with ($scratch.Get "contentSubject") }}
	 {{ ($scratch.Set "introClause" (printf "%s is about **%s** and" ($scratch.Get "introClause") (printf "%s" .))) }}
   {{ end }}
   {{ range $k, $v := ($scratch.Get "pageParameters") }}
	 {{ ($scratch.Add "paramTypes" (slice $k)) }}
   {{ end }}
   {{ if (gt (len ($scratch.Get "paramTypes")) 1) }}
	 {{ ($scratch.Set "fullDesc" ($scratch.Get "introClause")) }}
	 {{ range first (sub (len ($scratch.Get "paramTypes")) 1) ($scratch.Get "paramTypes") }}
	   {{ if (eq . "1date") }}
		 {{ if $.PublishDate }}
		   {{ if (ne (string $.PublishDate) ("0001-01-01 00:00:00 +0000 UTC")) }}
			 {{ ($scratch.Set "fullDesc" (printf "%s was **released on %s**," ($scratch.Get "fullDesc") (dateFormat "January 2, 2006" $.PublishDate))) }}
		   {{ else }}
			 {{ ($scratch.Set "fullDesc" (printf "%s was **last updated on %s**," ($scratch.Get "fullDesc") (dateFormat "Jan 2, 2006" $.Date))) }}
		   {{ end }}
		 {{ end }}
	   {{ else if (eq . "2listItems") }}
	   {{ else if (eq . "3wordCount") }}
		 {{ ($scratch.Set "fullDesc" (printf "%s %s **%s words**," ($scratch.Get "fullDesc") (index ($scratch.Get "grammar") "hasTense") (string (index ($scratch.Get "pageParameters") .)))) | safeHTML }}
	   {{ else if (eq . "4readingTime") }}
		 {{ ($scratch.Set "fullDesc" (printf "%s %s estimated to take **%s minutes to read**," ($scratch.Get "fullDesc") (index ($scratch.Get "grammar") "isTense") (string (math.Round (mul (index ($scratch.Get "pageParameters") .) 1.2))))) }}
	   {{ else if (eq . "5isDraft") }}
		 {{ ($scratch.Set "fullDesc" (printf "%s <strong>not finalized</strong>," ($scratch.Get "fullDesc") (index ($scratch.Get "grammar") "isTense"))) }}
	   {{ end }}
	 {{ end }}
	 {{ range last 1 ($scratch.Get "paramTypes") }}
	   {{ if (eq . "1date") }}
		  {{ if $.PublishDate }}
			{{ if (ne (string $.PublishDate) ("0001-01-01 00:00:00 +0000 UTC")) }}
			  {{ ($scratch.Set "fullDesc" (printf "%s was **released on %s**," ($scratch.Get "fullDesc") (dateFormat "January 2, 2006" $.PublishDate))) }}
			{{ else }}
			  {{ ($scratch.Set "fullDesc" (printf "%s was **last updated on %s**," ($scratch.Get "fullDesc") (dateFormat "Jan 2, 2006" $.Date))) }}
			{{ end }}
		  {{ end }}
		{{ else if (eq . "2listItems") }}
		{{ else if (eq . "3wordCount") }}
		  {{ ($scratch.Set "fullDesc" (printf "%s and %s **%s words**." ($scratch.Get "fullDesc") (index ($scratch.Get "grammar") "hasTense") (string (index ($scratch.Get "pageParameters") .)))) | safeHTML }}
		{{ else if (eq . "4readingTime") }}
		  {{ ($scratch.Set "fullDesc" (printf "%s and %s estimated to take **%s minutes to read**." ($scratch.Get "fullDesc") (index ($scratch.Get "grammar") "isTense") (string (math.Round (mul (index ($scratch.Get "pageParameters") .) 1.2))))) }}
		{{ else if (eq . "5isDraft") }}
		  {{ ($scratch.Set "fullDesc" (printf "%s and %s **not finalized**." ($scratch.Get "fullDesc") (index ($scratch.Get "grammar") "isTense"))) }}
		{{ end }}
	  {{ end }}
	{{ else if (gt (len ($scratch.Get "paramTypes")) 0) }}
	  {{ ($scratch.Set "fullDesc" ($scratch.Get "introClause")) }}
	  {{ with ($scratch.Get "contentSubject") }}
		{{ ($scratch.Set "introClause" (printf "%s %s about %s and" ($scratch.Get "introClause") (index ($scratch.Get "grammar") "isTense") ($scratch.Get "contentSubject" ))) }}
	  {{ end }}
	  {{ range first 1 ($scratch.Get "paramTypes") }}
		{{ if (eq . "1date") }}
		  {{ if $.PublishDate }}
			{{ if (ne (string $.PublishDate) ("0001-01-01 00:00:00 +0000 UTC")) }}
			  {{ ($scratch.Set "fullDesc" (printf "%s was **released on %s**," ($scratch.Get "fullDesc") (dateFormat "January 2, 2006" $.PublishDate))) }}
			{{ else }}
			  {{ ($scratch.Set "fullDesc" (printf "%s was **last updated on %s**," ($scratch.Get "fullDesc") (dateFormat "Jan 2, 2006" $.Date))) }}
			{{ end }}
		  {{ end }}
		{{ else if (eq . "2listItems") }}
		{{ else if (eq . "3wordCount") }}
		  {{ ($scratch.Set "fullDesc" (printf "%s %s **%s words**." ($scratch.Get "fullDesc") (index ($scratch.Get "grammar") "hasTense") (string (index ($scratch.Get "pageParameters") .))))  }}
		{{ else if (eq . "4readingTime") }}
		  {{ ($scratch.Set "fullDesc" (printf "%s %s estimated to take **%s minutes to read**." ($scratch.Get "fullDesc") (index ($scratch.Get "grammar") "isTense") (string (math.Round (mul (index ($scratch.Get "pageParameters") .) 1.2))))) }}
		{{ else if (eq . "5isDraft") }}
		  {{ ($scratch.Set "fullDesc" (printf "%s %s <strong>not finalized</strong>." ($scratch.Get "fullDesc") (index ($scratch.Get "grammar") "isTense"))) }}
		{{ end }}
	  {{ end }}
	{{ else }}
	  {{ ($scratch.Set "fullDesc" ($scratch.Get "introClause")) }}
	{{ end }}
	{{ ($scratch.Get "fullDesc") | markdownify }}
  {{ end }}
  {{ block "documentContent" . }}
	{{ with .Content }}
	  {{ . }}
	{{ end }}
  {{ end }}
{{ end }}
{{ define "footer" }}
  <footer>
	<p>
	  My name is emsenn and I wrote this
	  {{ .Layout | default (.Type | singularize) }}.
	  It's released under the
	  {{ .Params.license | default ((printf "[MIT License](https://opensource.org/licenses/MIT)") | markdownify) }}:
	  you can copy it, use it, and redistribute it, for free, for
	  any purpose: personal or commercial. You may
	  <a href="#" onclick="window.print();return false;">print
	  this document</a> or save it locally by pressing <code>Ctrl
	  s</code>.
	</p>
	<p>
	  If you found it useful, you might enjoy other
	  {{ (.Layout | pluralize) | default (.Type) }} I've written
	  {{- if isset .Params "tags" -}}
		, or other pieces tagged with
		{{- range .Params.tags -}}
		  {{ . }}
		{{ end }}
	  {{ else }}
		.
	  {{- end -}}
	  If you have any feedback, please send an email to my
	  <a href="https://lists.sr.ht/~emsenn/public-inbox/">public
	  inbox</a>.
	</p>
	<p>
	  This {{ .Layout | default (.Type | singularize) }} was made
	  possible with contributions from humans like you.
	  <a href="/contribute">Thank you.</a>
	</p>
	<p>
	  This document was created
	  using <a href="https://www.gnu.org/software/emacs/">Emacs</a>,
	  formatted with <a href="https://orgmode.org/">Org-mode</a>,
	  converted to Markdown
	  by <a href="https://ox-hugo.scripter.co/">Ox-Hugo</a>, built
	  into HTML by <a href="https://gohugo.io/">Hugo</a>, and served
	  by <a href="https://www.neocities.org">Neocities</a>. I created
	  this document's stylesheet, while the background patterns were
	  created by <a href="http://www.heropatterns.com/">Steve
	  Schoger</a>.
	</p>
  </footer>
{{ end }}

Essay Layout

Fiction Layout

Special Layouts

Teraum Layout

This layout is used for the content piece `docs/teraum.md`, which is a rendering of my fantasy encyclopedia.

{{ define "htmlCSSColorRules" }}
  color: #444;
  background-color: #5433;
{{ end }}
{{ define "bodyBackground" }}
  <div class="backgroundimage"></div>
{{ end }}
{{ define "bodyExtraCSSRules" }}
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='40' height='40' viewBox='0 0 40 40'%3E%3Cg fill-rule='evenodd'%3E%3Cg fill='%239759'%3E%3Cpath d='M0 38.59l2.83-2.83 1.41 1.41L1.41 40H0v-1.41zM0 1.4l2.83 2.83 1.41-1.41L1.41 0H0v1.41zM38.59 40l-2.83-2.83 1.41-1.41L40 38.59V40h-1.41zM40 1.41l-2.83 2.83-1.41-1.41L38.59 0H40v1.41zM20 18.6l2.83-2.83 1.41 1.41L21.41 20l2.83 2.83-1.41 1.41L20 21.41l-2.83 2.83-1.41-1.41L18.59 20l-2.83-2.83 1.41-1.41L20 18.59z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
{{ end }}
{{ define "h1CSSShadowRules" }}
  text-shadow: .05em .05em .1em #9759;
{{ end }}
{{ define "headlineCSSShadowRules" }}
  text-shadow: .08em .03em .03em #9759;
{{ end }}
{{ define "headlineCSSBeforeColorRules" }}
  color: #9759;
{{ end }}

Ikmu Layout

This layout is used for the content piece `docs/ikmu.md`, which is a about my pet cat, Ikmuwiyula.

{{ define "htmlCSSColorRules" }}
  color: #444;
  background-color: #5433;
{{ end }}
{{ define "bodyBackground" }}
  <div class="backgroundimage"></div>
{{ end }}
{{ define "bodyExtraCSSRules" }}
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='40' height='40' viewBox='0 0 40 40'%3E%3Cg fill-rule='evenodd'%3E%3Cg fill='%239759'%3E%3Cpath d='M0 38.59l2.83-2.83 1.41 1.41L1.41 40H0v-1.41zM0 1.4l2.83 2.83 1.41-1.41L1.41 0H0v1.41zM38.59 40l-2.83-2.83 1.41-1.41L40 38.59V40h-1.41zM40 1.41l-2.83 2.83-1.41-1.41L38.59 0H40v1.41zM20 18.6l2.83-2.83 1.41 1.41L21.41 20l2.83 2.83-1.41 1.41L20 21.41l-2.83 2.83-1.41-1.41L18.59 20l-2.83-2.83 1.41-1.41L20 18.59z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
{{ end }}
{{ define "h1CSSShadowRules" }}
  text-shadow: .05em .05em .1em #9759;
{{ end }}
{{ define "headlineCSSShadowRules" }}
  text-shadow: .08em .03em .03em #9759;
{{ end }}
{{ define "headlineCSSBeforeColorRules" }}
  color: #9759;
{{ end }}

##### Project Layouts

Brutstrap Layout

{{ define "style" }}
  <link rel="stylesheet" type="text/css" href="./projects/brutstrap/brutstrap.css">
{{ end }}

##### Metapage Layouts

Single Metapage Layout

{{ define "subheadline" }}
  {{ with .Description }}
	<p>
	  {{ . }}
	</p>
  {{ end }}
{{ end }}
{{ define "content" }}
  {{ with .Content }}
	{{ . }}
  {{ end }}
{{ end }}
{{ define "footer" }}
  <!-- -->
{{ end }}

Docs Metapage Layout

{{ define "subheadline" }}
  <!-- -->
{{ end }}
{{ define "content" }}
  {{ $scratch := newScratch }}
  {{ ($scratch.Set "totalWordCount" 0) }}
  {{ ($scratch.Set "totalDrafts" 0) }}
  {{ ($scratch.Set "totalFinishedDocuments" 0) }}
  {{ ($scratch.Set "totalDocuments" 0) }}
  {{ with .Content }}
	{{ . }}
  {{ end }}
  {{ range where .Site.RegularPages "Type" "docs" }}
	  {{ ($scratch.Set "totalWordCount" (add ($scratch.Get "totalWordCount") .WordCount)) }}
	  {{ if .Draft }}
		{{ ($scratch.Set "totalDrafts" (add ($scratch.Get "totalDrafts") 1)) }}
	  {{ else }}
		{{ ($scratch.Set "totalFinishedDocuments" (add ($scratch.Get "totalFinishedDocuments") 1)) }}
	  {{ end }}
	  {{ ($scratch.Set "totalDocuments" (add ($scratch.Get "totalDocuments") 1)) }}
  {{ end }}
  <p>
	At present, my website contains:
  </p>
  <ul>
	<li>
	  {{ ($scratch.Get "totalFinishedDocuments") }}
	  finished documents
	</li>
	<li>
	  {{ ($scratch.Get "totalDrafts") }}
	  drafts
	</li>
  </ul>
  <p>
	totalling {{ ($scratch.Get "totalDocuments") }}
	documents containing <strong>
						   {{ ($scratch.Get "totalWordCount") }}
						 </strong> words:
  </p>
  <ul>
	{{ range where .Site.RegularPages "Type" "docs" }}
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
{{ define "footer" }}
  <!-- -->
{{ end }}

##### Partial Layouts

In the context of Hugo, and thus my website, "partial layouts," or *partials*, are layouts which represent a discrete component of the page. If you're familiar with SMACSS, partials are equivalent to [modules](https://smacss.com/book/type-module).

Brief Description Partial Layout

{{- if (in (.Site.Params.documentTypes) (.Layout | default .Type)) -}}
{{ end }}

Description Partial Layout

This partial layout returns a paragraph about the page's metadata, based on its content type. An example of the return might be

<p>
  This <strong>essay</strong> is about <strong>Galavant</strong> and
  was <strong>released on October 11, 2018</strong>, has
  <strong>918 words</strong>, and is estimated to take <strong>4
  minutes to read</strong>.
</p>

Description Layout: Initialization

The top part of the description layout sets up which attributes should be shown in the description.

|Attribute|Renders in…|
|---|---|
|List Count||
|Date|Essays, fictions, and notes|
|Reading Time|Essays, fictions, letters, manuals, procedures, and singular procedures.|
|Word Count|Essays, fictions, letters, manuals, procedures, and singular procedures.|

{{- $scratch := newScratch -}}
{{- ($scratch.Set "showListItems" "") -}}
{{- ($scratch.Set "showDate" "essay fiction note") -}}
{{- ($scratch.Set "showReadingTime" "essay fiction letter manual procedure procedures") -}}
{{- ($scratch.Set "showWordCount" "essay fiction letter manual procedure procedures") -}}
{{- ($scratch.Set "paramTypes" slice) -}}

Description Layout: Determine Content Type

{{- if (isset .Params "categories") -}}
  {{- with .Params.categories -}}
	{{- range last 1 . -}}
	  {{- ($scratch.Set "contentType" .) -}}
	{{- end -}}
  {{- end -}}
{{- else -}}
  {{- $scratch.Set "contentType" "piece" -}}
{{- end -}}

Description Layout: Determine Content Subject

{{- if (isset .Params "tags") -}}
  {{- with .Params.tags -}}
	{{- range last 1 . -}}
	  {{- if (eq (. | title) .) -}}
		{{- ($scratch.Set "contentSubject" (. | humanize | title)) -}}
	  {{- else -}}
		{{- ($scratch.Set "contentSubject" (. | humanize | lower)) -}}
	  {{- end -}}
	{{- end -}}
  {{- end -}}
{{- end -}}

Description Layout: Configure Grammar

{{- with ($scratch.Get "contentType") -}}
  {{- if (eq . ( . | pluralize)) -}}
	{{- ($scratch.SetInMap "grammar" "article" "these") -}}
	{{- ($scratch.SetInMap "grammar" "hasTense" "have") -}}
	{{- ($scratch.SetInMap "grammar" "isTense" "are") -}}
  {{- else -}}
	{{- ($scratch.SetInMap "grammar" "article" "this") -}}
	{{- ($scratch.SetInMap "grammar" "hasTense" "has") -}}
	{{- ($scratch.SetInMap "grammar" "isTense" "is") -}}
  {{- end -}}
{{- end -}}

Description Layout: Configure Date

{{- if (in ($scratch.Get "showDate") ($scratch.Get "contentType")) -}}
  {{- with .Date -}}
	{{- ($scratch.SetInMap "pageParameters" "1date" .) -}}
  {{- end -}}
{{- end -}}

Description Layout: Configure List Count

{{- if (in ($scratch.Get "showListItems") ($scratch.Get "contentType")) -}}
{{- end -}}

Description Layout: Configure Word Count

{{- if (in ($scratch.Get "showWordCount") ($scratch.Get "contentType")) -}}
	{{- ($scratch.SetInMap "pageParameters" "3wordCount" .WordCount) -}}
{{- end -}}

Description Layout: Configure Reading Time

{{- if (in ($scratch.Get "showReadingTime") ($scratch.Get "contentType")) -}}
  {{- ($scratch.SetInMap "pageParameters" "4readingTime" .ReadingTime) -}}
{{- end -}}

Description Layout: Configure Draft

{{- if (.Draft) -}}
  {{- ($scratch.SetInMap "pageParameters" "5isDraft" true) -}}
{{- end -}}

Description Layout: Build Intro Clause

With the variables assembled above, the layout now builds the actual paragraph to be returned, inside the variable `introClause`.

{{- ($scratch.Set "introClause" (printf "%s **%s**" ((index ($scratch.Get "grammar") "article") | title) ($scratch.Get "contentType"))) -}}
{{- with ($scratch.Get "contentSubject") -}}
  {{- ($scratch.Set "introClause" (printf "%s is about **%s** and" ($scratch.Get "introClause") (printf "%s" .))) -}}
{{- end -}}
{{- range $k, $v := ($scratch.Get "pageParameters") -}}
  {{- ($scratch.Add "paramTypes" (slice $k)) -}}
{{- end -}}
{{- if (gt (len ($scratch.Get "paramTypes")) 1) -}}
  {{- ($scratch.Set "fullDesc" ($scratch.Get "introClause")) -}}
  {{- range first (sub (len ($scratch.Get "paramTypes")) 1) ($scratch.Get "paramTypes") -}}
	{{- if (eq . "1date") -}}
	  {{- if $.PublishDate -}}
		{{- if (ne (string $.PublishDate) ("0001-01-01 00:00:00 +0000 UTC")) -}}
		  {{- ($scratch.Set "fullDesc" (printf "%s was **released on %s**," ($scratch.Get "fullDesc") (dateFormat "January 2, 2006" $.PublishDate))) -}}
		{{- else -}}
		  {{- ($scratch.Set "fullDesc" (printf "%s was **last updated on %s**," ($scratch.Get "fullDesc") (dateFormat "Jan 2, 2006" $.Date))) -}}
		{{- end -}}
	  {{- end -}}
	{{- else if (eq . "2listItems") -}}
	{{- else if (eq . "3wordCount") -}}
	  {{- ($scratch.Set "fullDesc" (printf "s% %s **%s words**," ($scratch.Get "fullDesc") (index ($scratch.Get "grammar") "hasTense") (string (index ($scratch.Get "pageParameters") .)))) | safeHTML -}}
	{{- else if (eq . "4readingTime") -}}
	  {{- ($scratch.Set "fullDesc" (printf "%s %s estimated to take **%s minutes to read**," ($scratch.Get "fullDesc") (index ($scratch.Get "grammar") "isTense") (string (math.Round (mul (index ($scratch.Get "pageParameters") .) 1.2))))) -}}
	{{- else if (eq . "5isDraft") -}}
	  {{- ($scratch.Set "fullDesc" (printf "%s <strong>not finalized</strong>," ($scratch.Get "fullDesc") (index ($scratch.Get "grammar") "isTense"))) -}}
	{{- end -}}
  {{- end -}}
  {{- range last 1 ($scratch.Get "paramTypes") -}}
	{{- if (eq . "1date") -}}
	  {{- if $.PublishDate -}}
		{{- if (ne (string $.PublishDate) ("0001-01-01 00:00:00 +0000 UTC")) -}}
		  {{- ($scratch.Set "fullDesc" (printf "%s was **released on %s**," ($scratch.Get "fullDesc") (dateFormat "January 2, 2006" $.PublishDate))) -}}
		{{- else -}}
		  {{- ($scratch.Set "fullDesc" (printf "%s was **last updated on %s**," ($scratch.Get "fullDesc") (dateFormat "Jan 2, 2006" $.Date))) -}}
		{{- end -}}
	  {{- end -}}
	{{- else if (eq . "2listItems") -}}
	{{- else if (eq . "3wordCount") -}}
	  {{- ($scratch.Set "fullDesc" (printf "%s and %s **%s words**." ($scratch.Get "fullDesc") (index ($scratch.Get "grammar") "hasTense") (string (index ($scratch.Get "pageParameters") .)))) | safeHTML -}}
	{{- else if (eq . "4readingTime") -}}
	  {{- ($scratch.Set "fullDesc" (printf "%s and %s estimated to take **%s minutes to read**." ($scratch.Get "fullDesc") (index ($scratch.Get "grammar") "isTense") (string (math.Round (mul (index ($scratch.Get "pageParameters") .) 1.2))))) -}}
	{{- else if (eq . "5isDraft") -}}
	  {{- ($scratch.Set "fullDesc" (printf "%s and %s **not finalized**." ($scratch.Get "fullDesc") (index ($scratch.Get "grammar") "isTense"))) -}}
	{{- end -}}
  {{- end -}}
{{- else if (gt (len ($scratch.Get "paramTypes")) 0) -}}
  {{- ($scratch.Set "fullDesc" ($scratch.Get "introClause")) -}}
  {{- with ($scratch.Get "contentSubject") -}}
	{{- ($scratch.Set "introClause" (printf "%s %s about %s and" ($scratch.Get "introClause") (index ($scratch.Get "grammar") "isTense") ($scratch.Get "contentSubject" ))) -}}
  {{- end -}}
  {{- range first 1 ($scratch.Get "paramTypes") -}}
	{{- if (eq . "1date") -}}
	  {{- if $.PublishDate -}}
		{{- if (ne (string $.PublishDate) ("0001-01-01 00:00:00 +0000 UTC")) -}}
		  {{- ($scratch.Set "fullDesc" (printf "%s was **released on %s**," ($scratch.Get "fullDesc") (dateFormat "January 2, 2006" $.PublishDate))) -}}
		{{- else -}}
		  {{- ($scratch.Set "fullDesc" (printf "%s was **last updated on %s**," ($scratch.Get "fullDesc") (dateFormat "Jan 2, 2006" $.Date))) -}}
		{{- end -}}
	  {{- end -}}
	{{- else if (eq . "2listItems") -}}
	{{- else if (eq . "3wordCount") -}}
	  {{- ($scratch.Set "fullDesc" (printf "%s %s **%s words**." ($scratch.Get "fullDesc") (index ($scratch.Get "grammar") "hasTense") (string (index ($scratch.Get "pageParameters") .)))) -}}
	{{- else if (eq . "4readingTime") -}}
	  {{- ($scratch.Set "fullDesc" (printf "%s %s estimated to take **%s minutes to read**." ($scratch.Get "fullDesc") (index ($scratch.Get "grammar") "isTense") (string (math.Round (mul (index ($scratch.Get "pageParameters") .) 1.2))))) -}}
	{{- else if (eq . "5isDraft") -}}
	  {{- ($scratch.Set "fullDesc" (printf "%s %s <strong>not finalized</strong>." ($scratch.Get "fullDesc") (index ($scratch.Get "grammar") "isTense"))) -}}
	{{- end -}}
  {{- end -}}
{{- else -}}
  {{- ($scratch.Set "fullDesc" ($scratch.Get "introClause")) -}}
{{- end -}}
{{- ($scratch.Get "fullDesc") | markdownify -}}

Header Navigation Partial Layout

{{ define "headerExtra" }}
  <nav>
	<ul>
	  <li>
		<a href="/">Homepage</a>
	  </li>
	  <li>
		<a href="/docs/">Docs</a>
	  </li>
	</ul>
  </nav>
{{ end }}

##### 404 Layout

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

### Basic Pages

### Site Pages

The pages of my website come from three main sources:

- There are some ***basic pages*** that are written into this document and tangled out with the configution and layout. They're the sort of pages that are for information that doesn't exist outside my website - things like my contact page.
- There are also a few ***metapages*** written into the document that are used with specialized layout to provide information pages within the website - things like the list of drafts.

#### Basic Pages

##### Contact Page

+++
title = "Contact Me"
type = "metapages"
+++

***In a hurry?*** Send an email to my [public
inbox](https://lists.sr.ht/~emsenn/public-inbox), or [send me an
email](mailto:emsenn@emsenn.net) if you really have to.

## Introduction

This website is just part of my online presence, and doesn't provide
any means for readers to communicate back with me. I do maintain lots
of other accounts for various purposes - this is a list of all them,
not just the ones I use for "communicating."

## Email

You can */send me an email/*. I maintain a [collection of mailing
lists](https://lists.sr.ht/~emsenn/) relevant to my projects, as well
as a [public inbox](https://lists.sr.ht/~emsenn/public-inbox) for more
general public communication. I also accept [private
emails](mailto:emsenn@emsenn.net) but I reserve the right to publicize
anything you might send to me.

## Chatting

I'm active in the Fediverse, a network of communication platforms:

- At [@emsenn@mastodon.social](https://mastodon.social/@emsenn), I do
  my general chatting. *(If you're more familiar with legacy  social
  media, it's kind of like my Twitter.)*
- At [@emsenn@tabletop.social](https://tabletop.social/@emsenn), I
  chat about tabletop role-playing games, like Dungeons and Dragons or
  my own *[Brave Old World](/projects/brave-old-world)*.

## Syndication

In addition to publishing my non-commissioned writing on my website, I
also syndicate on other platforms.

- [@emsenn@wordsmith.social](https://wordsmith.social/emsenn) is where
  I syndicate drafts and non-commissioned writing.
- [@emsenn@tabletop.press](https://tabletop.press/emsenn) is where I
  syndicate my tabletop gaming rules and adventures.
- [LBRY](lbry://@emsenn) lets you buy my writing with a cryptocurrency
  of the same name.

This website is also syndicated through the [DAT
protocol](dat://beea87bd7ba3c55fbcf54a5f868dc5f6ff64b77ac8d82682170072c76a8d0c0f/)
and [archived on the
IPFS](https://neocities.org/site/emsenn/archives).

### Contribute Page

### Help Me Page

The ***help me*** page of my website is a list of things I currently want help with. I have plans to make this info available as json or something, as well, with the grand notion that if a few people do it, someone could write a client that pulls them in and gives you a sense of what your friends (or whoever) need help with - like an RSS for asking your social network for help. …Though that sounds rather impressive, and it's not my goal to personally develop this into more than making it easy for friends to see what I'm looking for help with.

#### Help Me Page Content

+++
title = "Help Me"
layout = "helpMe"
+++

This is a list of some things I want (volunteer) help with. If you
have the answer, please send it to my [public
inbox](https://lists.sr.ht/~emsenn/public-inbox).

- I'd like to use Emacs as my email client. What's the best resource
  to read on how to do that?

#### Help Me Page Data

### Services Page

My name is ***emsenn***. I'm an independent consultant and writer who
specializes in teaching senior executives how they can improve their
business by adopting methods used in open-source software development.

## Metapages

### Documents Listing

Ending up at `emsenn.net/docs/`, this content is caught by Hugo and used as the basis for a special page that lists all the categories and tags that documents fall under.

+++
title = "My Documents"
type = "metapages"
layout = "docs"
+++

This page is a listing of all the documents I've published to my
website.

### Drafts Listing

+++
title = "Drafts"
author = ["emsenn"]
lastmod = 2019-01-20T20:01:00-05:00
categories = ["webpage"]
draft = false
+++

This !!contentType!! is a listing of all the ***drafts*** in this
website: documents that are, for one reason or another, not yet
finished.

### Finished Document Listing

+++
title = "Finished Documents"
author = ["emsenn"]
lastmod = 2019-01-20T20:01:00-05:00
categories = ["webpage"]
draft = false
+++

This !!contentType!! is a listing of all the ***finished documents*** in this website:
documents that I consider complete and ready for general distribution.  Note that this
listing also includes webpages.

## Project Pages

### Brave Old World

+++
title = "Brave Old World"
+++

***Brave Old World*** are rules for telling stories with friends: a
collection of rules for playing a tabletop role-playing game.

### Brutstrap

+++
title = "Brutstrap"
+++

***Brutstrap*** is CSS for representing a HTML document's contents as
it's constructed. The project is maintained at
[git.sr.ht/~emsenn/brutstrap](https://git.sr.ht/~emsenn/brutstrap), and a
demo is available at
[emsenn.net/demos/brutstrap/](https://emsenn.net/demos/brutstrap/).

## Data

### Activities

2019-01-25 = """
I wrote a [Cultural Guide for Fediverse
Newcomers](/docs/cultural-guide-for-fediverse-newcomers/) and
released the [Oats](/projects/oats/) CSS theme."""

2019-01-27 = """
I sent ["Hello, Parlour"](https://emsenn.net/docs/dear-parlour-hello-parlour)
to my new [parlour mailing
list](https://lists.sr.ht/~emsenn/parlour)."""

2019-01-28 = """
I sent ["Do We Need More
Developers?"](https://emsenn.net/docs/dear-parlour-do-we-need-more-developers)
to my [parlour mailing
list](https://lists.sr.ht/~emsenn/parlour/)."""

### Category Descriptions

directive = "**Directives** are principles which guide my actions and decision-making."
essay = "**Essays**  are short pieces written with some depth or seriousness."
fiction = "**Fictions** are untrue for one or more reason, usually entertainment."
game = "**Games** are rules for doing something fun, often with friends."
letter = "**Letters** are pieces written for a specific audience."
list = "Lists of useful information."
manual = "Guides for accomplishing a type of work or fulfilling a role."
note = "Unrefined writing on a variety of topics."
procedure = "A single set of instructions for completing an action.  *These are singular procedures.*"
procedures = "A collection of procedures related to a broad action.  *These are collections of procedures.*"
project = "Information about projects I'm developing."
service = "Information about professional services I offer."
webpage = "Other pages on this website; not really \"documents.\""

### Index

introduction = """
I have an interest in the things that shape our interactions with
technology, like software document and project governance."""
plans = [
  "Finish centralizing my project repositories at [git.sr.ht/~emsenn](https://git.sr.ht/~emsenn).",
  "Consider using Org-mode to create a literately programmed static site generator.",
  "Develop a MUD engine."
]

### Project Descriptions

brave-old-world = "Rules for telling stories with friends."
brutstrap = "CSS rules for a brutalist website."
oats = "CSS rules for a neutral brown brutalist website."
website = "My website, a collection of literately-programmed and imported resources."
fyreside = "A chatroom with a built-in card game."
y-dwarf = "CSS rules for a cold blue brutalist website."
teraum = "A hand-crafted satirical fantasy: stories and role-playing resources."
you-are-conscious = "An interactive fiction: an artificial intelligence makes widgets."
starhopper = "A multiplayer text-based game: race to find a new home for humanity."
qtmud = "An engine for running a text-based multiplayer game."