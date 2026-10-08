---
title: "emsenn website"
description: Please note any "TODO" or "TK" - that means text around it is incomplete or inaccurate, such as missing a citation.
---

## 1 Introduction

### 1.1 Summary

***Please note any "TODO" or "TK" - that means text around it is
incomplete or inaccurate, such as missing a citation.***

This document is my personal website. This is a novel concept to me,
so bear with me while I explain.

This document contains within itself many *source blocks*, which are
blocks of text that represent computer code, in some way or another.

Using the EmacsTK text editor, those snippets of code can either be
run or extracted into other files - the latter is mostly what I've
done.

There are source blocks in this document for not just the ***content***
of my basic webpages, but the ***templates*** which the Hugo static site
generatorTK uses to turn that content into HTML documents.

If you're a programmer, think of it this way: instead of having code
with chunks of documentation mixed in, this is documentation with
chunks of code mixed in.

If you're not, you can just read this linearly or at random, and you
may gain some understanding of the code behind my website.

### 1.2 License & Editorial Information

This document and the source code it contains are released under the
MIT License and maintained at
[https://git.sr.ht/~emsenn/emsenn-website](https://git.sr.ht/~emsenn/emsenn-website), where a list of syndications
is available.

### 1.3 Using this Document

#### 1.3.1 Introduction

This document is written, for now, mostly for my own use and benefit.
It's important readers understand that before going further. While
wrapping this up nicely as a real resource is an eventual plan, for
now I need to focus on giving myself a reliable publishing platform
through this website.

So, if you're an ordinary reader, very few concessions have been made
for you. I hope you are able to get what you want from this document
anyway.

If you're hoping to use this document to create your own version of my
website, it is required you be familiar with EmacsTK, Org-modeTK, and
BabelTK.

The [original Org-mode source](https://git.sr.ht/~emsenn/emsenn-net/emsenn-net.org/) of this document can be [detangled](https://orgmode.org/worg/org-contrib/babel/intro.html#literate-programming) which
will create a functional Hugo site in the [`build./`](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/web/src/emsenn-website/build) directory, which
you can then build with Hugo as normal.

The next few sections contain source blocks which can be run in
Org-mode, to go through the steps of building and deploying the site.
They're for my own convenience and others' education, don't expect
them to work if you have this code locally.

Since I'm working with them as source blocks, assume they're all to be
run in the same directory as the `emsenn-website.org` file you're
looking at now.

#### 1.3.2 Clean Current Build

rm -r ./build

#### 1.3.3 Make Build Directory

mkdir -p ./build/{data,content}
mkdir -p ./build/layouts/_default
mkdir -p ./build/layouts/partials
find ./build -type d -maxdepth 2

#### 1.3.4 Tangle code

Run the command `org-bable-tangle` or the hotkey `C-c C-v C-t`.

#### 1.3.5 Build the site

cd build
hugo

#### 1.3.6 Upload

This script uploads `./build/public` to Neocities, which is the host
for the HTTP distribution of the site. ***Note***, this relies on the
[Neocities CLI](https://neocities.org/cli) application, and being logged in with it.

cd ./build/public
neocities push .

### 1.4 Acknowledgements

- Matthew GrayboschTK whose own work made web design seem
approachable.

- Kaushal ModiTK who advocated Hugo and Org-mode to me.

- WhoeverMadeHeroPatternsTK for making [HeroPatterns](https://heropatterns.com).

## 2 Hugo Configuration

### 2.1 Introduction

Hugo allows for a [fair bit](https://gohugo.io/getting-started/configuration/) of configuration - in this section, I'll
explain which configurations I set - all of which are written to
`./config.toml`.

### 2.2 Base URL Configuration

The `baseURL` variable, accessed through `.Site.BaseURL`, is currently
unused.

baseURL = "http://localhost:1313"

### 2.3 Language Configuration

The `languageCode` variable, accessed through `.Site.Language.Lang`,
is used in the [5.1.1.1](#org4abc8db).

languageCode = "en-us"

### 2.4 Emoji Configuration

The `enableEmoji` variables sets whether or not emoticon shortcodes in
documents are rendered. (:smile: to a smiling face emoji, for example.)

enableEmoji = true

### 2.5 Title Configuration

title = "emsenn"

### 2.6 Author Configuration

author = "emsenn"

## 3 Content

### 3.1 Documents Listing

+++
title = "Documents"
author = ["emsenn"]
description = "This file is a contemporary record of emsenn's personal information."
lastmod = 2018-11-28T13:22:36-05:00
categories = ["webpage"]
draft = false
weight = 4007
+++

This !!contentType!! is a listing of all the **_documents_** in this website:
every single document in the website.

### 3.2 Drafts Listing

+++
title = "Drafts"
author = ["emsenn"]
lastmod = 2019-01-20T20:01:00-05:00
categories = ["webpage"]
draft = false
+++

This !!contentType!! is a listing of all the **_drafts_** in this
website: documents that are, for one reason or another, not yet
finished.

### 3.3 Finished Document Listing

+++
title = "Finished Documents"
author = ["emsenn"]
lastmod = 2019-01-20T20:01:00-05:00
categories = ["webpage"]
draft = false
+++

This !!contentType!! is a listing of all the **_finished documents_** in this website:
documents that I consider complete and ready for general distribution.  Note that this
listing also includes webpages.

### 3.4 Services Page

My name is _**emsenn**_. I'm an independent consultant and writer who
specializes in teaching senior executives how they can improve their
business by adopting methods used in open-source software development.

## 4 Data

### 4.1 Category Descriptions

directive = "_*Directives*_ are principles which guide my actions and decision-making."
essay = "_*Essays*_  are short pieces written with some depth or seriousness."
fiction = "_*Fictions*_ are untrue for one or more reason, usually entertainment."
game = "_*Games*_ are rules for doing something fun, often with friends."
letter = "_*Letters*_ are pieces written for a specific audience."
list = "Lists of useful information."
manual = "Guides for accomplishing a type of work or fulfilling a role."
note = "Unrefined writing on a variety of topics."
procedure = "A single set of instructions for completing an action.  _These are singular procedures._"
procedures = "A collection of procedures related to a broad action.  _These are collections of procedures._"
project = "Information about projects I'm developing."
service = "Information about professional services I offer."
webpage = "Other pages on this website; not really \"documents.\""

## 5 Layouts

### 5.1 Default Layouts

The ***default layouts*** are used when there's not a more relevant
layout to use with a document. In practice, they're used quite a lot.

#### 5.1.1 Default Document Layouts

- Default Base Layout**The *default base layout***, saved as
`./layouts/_default/baseof.html`, is the lowest-priority (except for
themes') base template.

{{ $scratch := newScratch }}
{{ if isset .Params "categories" }}
{{ range first 1 .Params.categories }}
{{ $scratch.Set "contentType" . }}
{{ end }}
{{ else }}
{{ $scratch.Set "contentType" "piece" }}
{{ end }}
{{ .Render "documentDeclaration" }}

{{ .Render "headMeta" }}
{{ .Render "headTitle" }}
{{ .Render "style" }}

**[Skip to Content](#content)

{{ with .Kind }}
{{ if (eq . "home") }}
{{ .Site.Title }}
{{ else if (eq . "taxonomy") }}
{{ $.Data.Term | title | pluralize }}
{{ end }}
{{ else }}
{{ .Title }}
{{ end }}

{{ if (or (eq .Kind "home") (eq .Kind "taxonomyTerm") (eq .Kind "taxonomy")) }}
This website is in early development**.
{{ end }}

{{ block "header" . }}
{{ end }}

{{ block "main" . }}
{{ $scratch := newScratch }}
{{ if (eq .Kind "home") }}
{{ range first 1 (where .Site.Pages "Title" "Homepage")}}
{{ .Content }}
{{ end }}
{{ else if (eq .Kind "taxonomy") }}
{{ .Content }}
{{ else }}
{{ .Content }}
{{ end }}
{{ end }}

{{ block "footer" . }}
{{ $scratch := newScratch }}
{{ if isset .Params "categories" }}
{{ range first 1 .Params.categories }}
{{ $scratch.Set "contentType" . }}
{{ end }}
{{ else }}
{{ $scratch.Set "contentType" "piece" }}
{{ end }}
{{ if (and (eq .Type "page") (ne .Kind "home") (not (in "webpage service" ($scratch.Get "contentType")))) }}

My name is [emsenn](https://emsenn.net) and I wrote
this {{ $scratch.Get "contentType" }}. It's released
under [the Unlicense](https://unlicense.org): you
can copy it, use it, and redistribute, for free, for any
purpose: personal or commercial. You may [print this document](#)
or save it locally by pressing `Ctrl s`.

If you found it useful, you may enjoy other
[{{ $scratch.Get "contentType" | pluralize }}]({{.Site.BaseURL }}{{ if (eq ($scratch.Get )
I have written {{- if isset .Params "tags" -}} , or other
pieces tagged with {{- range .Params.tags }}
[{{ . | humanize | title -}}]({{ $.Site.BaseURL }}/tags/{{ . }}/) {{- end -}}. {{- else -}} . {{ end }}
If you
have any feedback, or would like to join my email list,
please [send me an
email](mailto:emsenn@emsenn.net).

{{ else }}

My name is [emsenn](https://emsenn.net). It's
released under [the
Unlicense](https://unlicense.org): you may freely use it for personal and
commercial purposes.

{{ end }}
{{ if (and (eq .Type "page") (not (in .Title "Contribute Homepage"))) }}

This {{ $scratch.Get "contentType" }} was made possible with
contributions from humans like
you. [Thank you](/contribute). {{ end }}

This website uses no cookies, collects no personal
information, and conducts no tracking of its traffic:
please [send me an email](mailto:emsenn@emsenn.net)
to let me know you visited.

This document was created
using [Emacs](https://www.gnu.org/software/emacs/),
formatted with [Org-mode](https://orgmode.org/),
converted to Markdown
by [Ox-Hugo](https://ox-hugo.scripter.co/), built
into HTML by [Hugo](https://gohugo.io/), and served
by [Netlify](https://www.netlify.com/). I created
this document's stylesheet, while the background patterns were
created by [Steve
Schoger](http://www.heropatterns.com/).

{{ end }}

- Document Listing Layout

{{ define "main" }} {{ $scratch := newScratch }} {{ if (eq .Kind "taxonomy") }}

This webpage is a list of all the documents in the ***{{ .Data.Term }}* category**.
{{ with (index $.Site.Data.categoryDescriptions .Data.Term) }}
{{ . | markdownify }}
{{ end }}
{{ with .Site.GetPage (printf "/%s" (.Data.Term | pluralize)) }}
If you want to view all of these {{ (.Data.Term | pluralize) }} at once, they are available as a [single document]({{ .Permalink }}).
{{ end }}

{{ else if (eq .Kind "taxonomyTerm") }}
{{ if (eq .Data.Singular "category") }}

Each document on this website is in a single ***category***, which defines what type of content it is.  This page is a list of categories, with a link to a listing of the documents, a brief description, and how many pieces are in that category.
{{ .Render "categoryListing" }}
{{ end }}
{{ end }}
{{ with .Content }}
{{ . }}
{{ end }}
{{ with .Pages }}

{{ range . }}
{{ if (isset .Params "categories") }}
{{ with .Params.categories }}
{{ range first 1 . }}
{{ $scratch.Set "contentType" . }}
{{ end }}
{{ end }}
{{ else }}
{{ $scratch.Set "contentType" "piece" }}
{{ end }}

[**{{- .Title -}}**]({{ .Permalink}})**{{ partial "description.html" . }}

{{ end }}

{{ end}}
{{ end }}

- Single Document Layout

{{ define "header" }}

{{ partial "description.html" . }}

{{ end }}
{{ define "main" }}
{{ $scratch := newScratch }}
{{ if (eq .Kind "home") }}
{{ range first 1 (where .Site.Pages "Title" "homepage")}}

{{ replace .Content .Summary "" }}

{{ end }}
{{ else if (eq .Kind "taxonomy") }}

{{ replace .Content .Summary "" }}

{{ else }}

{{ if (eq .Title "Brick Box Apartments") }}

- Share your email

-

{{ end }}
{{ (replaceRE "$\n$

```
((.|\n)+?)
```

" "
*$2*
" (replaceRE "(`|\n)EXPORT_FILE_NAME: (\\S*)\n" "$1
- This section exists as a [individual document](../../research/2026/07/31/lenticule-import/library/applied-sciences/technology/archive/library/web/src/emsenn-website/\"/$2\").\n" (replace (replace (replace (replace (replace .Content "\\begin{equation}" "") "\\end{equation}" "") " \\( " "") " \\)" "`") "!!contentType!!" ($scratch.Get "contentType")))) | safeHTML }}

{{ if (eq .Title "Drafts") }}

{{ range .Site.Pages }}
{{ if (.Draft) }}
{{ .Render "documentListItem" }}
{{ end }}
{{ end }}

{{ else if (eq .Title "Finished Documents") }}

{{ range .Site.Pages }}
{{ if (not .Draft) }}
{{ .Render "documentListItem" }}
{{ end }}
{{ end }}

{{ else if (eq .Title "Documents") }}
{{ range .Site.Pages }}
{{ if .IsPage }}
{{ .Render "documentListItem" }}
{{ end }}
{{ end }}
{{ else if (eq .Title "Apply Now! (Brick Box Apartments)") }}

### Apply Now

*If no units are available, you'll be emailed when one opens up.*

- Name

Please provide your legal name

- Email

Enter a valid email address

- Phone

Your preferred phone number.

- Social Security Number
*For verifying your identity. (If you don't feel comfortable submitting this through a web form, that's file, I can get it from you later.)*

- License
*Your driver's license number. (If you don't have one, that's fine.)*

- Current Address

Your current address, written like `115 N. Merritt Mill Rd., Chapel Hill, NC 27516`, plasease.

- Current Landlord

Their name and phone number, please.

- Duration of Current Residence

How long have you lived there?

- Reason for Current Departure

Why are you looking to leave your current place?

- Previous Address

Your previous address, written like `115 N. Merritt Mill Rd., Chapel Hill, NC 27516`, plasease.

- Previous Landlord

Their name and phone number, please.

- Duration of Previous Residence

How long have you lived there?

- Reason for Previous Departure

Why did you leave your previous place?

- Current Employer

Who is your current employer?

- Job Title

What is your job title?

- Monthly Income
*Who is your (average)* monthly income.

- Employer's Phone Number

What's your employer's phone number?

- Employment Duration

How long have you worked for them?

- Where is your place of employment?

- Name of Bank

What's the name of your primary bank?

- Type of Bank Account
*What sort of account do you have there? (Checking, savings, so on)*

- Personal Reference 1

Who's a good personal reference for you?  How long have you known them, what's their relationship to you?

- Personal Reference 1 Phone Number

What's their phone number?

- Personal Reference 2

Who's a good personal reference for you?  How long have you known them, what's their relationship to you?

- Personal Reference 2 Phone Number

What's their phone number?

- Eviction

Have you ever been served an eviction notice or been asked to vacate a property you renting?

- Felony

Have you ever been convicted of a felony?

- Felony

Have you ever been convicted of a felony?

- Bankruptcy

Have you ever filed for bankruptcy?

- Rent Refusal

Have you ever intentionally refused to pay rent when due??

-

{{ end }}
{{ end }}
{{ end }}

#### 5.1.2 Default Component Layouts

- Basic Default Component Layouts

Default Document Declaration Layout

- Head Component Layouts

Head Meta Layout

- Head Title Layout

{{ if (eq .Kind "home") }}
{{ .Site.Title }}
{{ else if (eq .Kind "taxonomy") }}
{{ printf "%s: %s" .Site.Title (.Data.Term | pluralize) }}
{{ else }}
{{ printf "%s: %s" .Site.Title .Title }}
{{ end }}

- Listing Layouts

Category Listing Layout

{{ range $key, $value := .Site.Taxonomies.categories }}
{{ $scratch := newScratch }}
{{ $scratch.Set "wordCount" 0 }}
{{ range $value }}
{{ range where $.Site.Pages ".RelPermalink" .RelPermalink }}
{{ ($scratch.Set "wordCount" (add ($scratch.Get "wordCount") .WordCount)) }}
{{ end }}
{{ end }}

- [**{{- $key | humanize | pluralize -}}**]({{ $.Site.BaseURL  }}categories/{{ $key | urlize  }})
*({{ len $value }} documents, with {{ $scratch.Get "wordCount" }} total words.)*
{{ if (isset $.Site.Data.categoryDescriptions $key) }}

{{ (index $.Site.Data.categoryDescriptions $key) | markdownify }}
{{ end }}
{{ end }}

- Document Listing Layout

{{ define "main" }}
{{ $scratch := newScratch }}
{{ ($scratch.Set "totalWordCount" 0) }}
{{ ($scratch.Set "totalDrafts" 0) }}
{{ ($scratch.Set "totalFinishedDocuments" 0) }}
{{ ($scratch.Set "totalDocuments" 0) }}
{{ range .Site.Pages }}
{{ if (.IsPage) }}
{{ ($scratch.Set "totalWordCount" (add ($scratch.Get "totalWordCount") .WordCount)) }}
{{ if .Draft }}
{{ ($scratch.Set "totalDrafts" (add ($scratch.Get "totalDrafts") 1)) }}
{{ else }}
{{ ($scratch.Set "totalFinishedDocuments" (add ($scratch.Get "totalFinishedDocuments") 1)) }}
{{ end }}
{{ ($scratch.Set "totalDocuments" (add ($scratch.Get "totalDocuments") 1)) }}
{{ end }}
{{ end }}

This website is a repository of my writing and other original content.  At present, it contains [{{ ($scratch.Get "totalFinishedDocuments") }} finished documents](/finished-documents) and [{{ ($scratch.Get "totalDrafts") }} drafts](/drafts), for a total of [{{ ($scratch.Get "totalDocuments") }} documents](/documents) containing a {{ ($scratch.Get "totalWordCount") }}** words.

These documents are organized into the following [categories](/categories):

{{ .Render "categoryListing" }}

Many have also been given [tags](/tags) marking their /main subject/:

{{ .Render "tagListing" }} {{ end }}

- Tag Listing Layout

{{ range $key, $value := .Site.Taxonomies.tags }} {{ $scratch := newScratch }} {{ $scratch.Set "wordCount" 0 }} {{ range $value }} {{ range where $.Site.Pages ".RelPermalink" .RelPermalink }} {{ ($scratch.Set "wordCount" (add ($scratch.Get "wordCount") .WordCount)) }} {{ end }} {{ end }}

[**{{- $key | humanize | pluralize -}}**]({{ $.Site.BaseURL  }}tags/{{ $key | urlize  }})
*({{ len $value }} documents, with {{ $scratch.Get "wordCount" }} total words.)*
{{ if (isset $.Site.Data.tagDescriptions $key) }}
**{{ (index $.Site.Data.tagDescriptions $key) | markdownify }}
{{ end }}

{{ end }}

- List Item Layouts

Document List Item Layout

{{ if (.IsPage) }}
{{ $scratch := newScratch }}
{{ if (isset .Params "categories") }}
{{ with .Params.categories }}
{{ range first 1 . }}
{{ $scratch.Set "contentType" . }}
{{ end }}
{{ else }}
{{ $scratch.Set "contentType" "piece" }}
{{ end }}
{{ end }}

- [{{ .Title }}]({{ .Permalink }}):
{{ partial "description.html" . }}
{{ end }}

- Stylesheet Layouts

{{ $scratch := newScratch }}
{{ with .Content }}
{{ if in . " span {
background: hsla({{ ($scratch.Get "secondaryColorHue")}}, {{ ($scratch.Get "secondaryColorSaturation") }}%, {{($scratch.Get "secondaryColorLight") }}%, 1);
color: hsla({{ $scratch.Get "primaryColorHue" }}, {{ $scratch.Get "primaryColorSaturation"}}%, {{ $scratch.Get "primaryColorLight" }}%, 1);
display: block;
margin: 0 auto;
text-align: center;
padding: 0.2rem;
}

@keyframes animation-fadein {
from { opacity: 0;}
to { opacity: 1; }
}

### 5.2 404 Layout

{{ define "top" }}&#8203;{{ end }}
{{/* Above ZERO WIDTH SPACE is inserted between the define and end.
Leaving it empty or with normal spaces does not work. */}}

{{ define "main" }}

# 404

Sorry, we have misplaced that URL or it's pointing to something that
doesn't exist.

Head back [Home](/) or use the [Search](/search/) to
try finding it again.

{{ end }}

### 5.3 Index Layout

emsenn

# My name is emsenn

I have an interest in the things that shape our interactions with
technology, like software document and project governance. This is
my homepage, it has information on my recent activities, plans, the
other accounts I maintain online.

## Recent Activities

January 16, 2019**, I started centralizing
my projects
at git.sr.ht/~emsenn.

**January 17, 2019**, I wrote
a new
homepage for using
at emsenn.net.

**January 18, 2019**, I
wrote "Mastodon
is a Bake Fair" and syndicated it
on Wordsmith.social.

**January 19, 2019**, I
released Brutstrap,
a CSS stylesheet I made last spring.

Plans

Finish centralizing my projects
at git.sr.ht/~emsenn.

Consider using Org-mode to create a literately programmed static
site generator.

Develop a MUD engine.

You can see a complete list of my projects and writing
at git.sr.ht/~emsenn.

This website is just a small part of my online presence. I also
maintain:

@emsenn@mastodon.social
, for socializing with friends and strangers.

@emsenn@wordsmith.social
, for syndicating in-progress and personal documents.

@emsenn@tabletop.social
, for talking about designing and playing tabletop
role-playing games.

@emsenn@tabletop.press
, for syndicating tabletop role-playing game assets,
like rulesets, adventures, and maps.

I also operate mailing lists, listed
at lists.sr.ht/~emsenn

If you wish to make a financial contribution to my efforts, I am
currently accepting one-time contributions
through PayPal
and Ko-fi, or recurring
contributions may be made
through Liberapay.
Please note that I try and release everything useful I create for
free, and so contributing does not entitle you to any "exclusive
content." If you wish to inquire about my professional
services, send me an email.

This site was written by emsenn in 2019 and is released under the
Unlicense. It is maintained
at git.sr.ht/~emsenn/emsenn-net.

## 6 Partial Layouts

### 6.1 Content Parser Partial Layout

{{ (replaceRE "$\n$

`((.|\n)+?)`

" "*$2*" (replaceRE "(`|\n)EXPORT_FILE_NAME: (\\S*)\n" "$1 This section exists as a individual document.\n" (replace (replace (replace (replace (replace . "\\begin{equation}" "") "\\end{equation}" "") " \\( " "") " \\)" "`") "!!contentType!!" ""))) | safeHTML }}

### 6.2 Description Partial Layout

{{ $scratch := newScratch }}
{{ ($scratch.Set "showListItems" "") }}
{{ ($scratch.Set "showDate" "essay fiction note") }}
{{ ($scratch.Set "showReadingTime" "essay fiction letter manual procedure procedures") }}
{{ ($scratch.Set "showWordCount" "essay fiction letter manual procedure procedures") }}
{{ ($scratch.Set "paramTypes" slice) }}
{{ if (isset .Params "categories") }}
{{ with .Params.categories }}
{{ range last 1 . }}
{{ ($scratch.Set "contentType" .) }}
{{ end }}
{{ end }}
{{ else }}
{{ $scratch.Set "contentType" "piece" }}
{{ end }}
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
{{ ($scratch.Set "fullDesc" (printf "s% %s **%s words**," ($scratch.Get "fullDesc") (index ($scratch.Get "grammar") "hasTense") (string (index ($scratch.Get "pageParameters") .)))) | safeHTML }}
{{ else if (eq . "4readingTime") }}
{{ ($scratch.Set "fullDesc" (printf "%s %s estimated to take **%s minutes to read**," ($scratch.Get "fullDesc") (index ($scratch.Get "grammar") "isTense") (string (math.Round (mul (index ($scratch.Get "pageParameters") .) 1.2))))) }}
{{ else if (eq . "5isDraft") }}
{{ ($scratch.Set "fullDesc" (printf "%s **not finalized**," ($scratch.Get "fullDesc") (index ($scratch.Get "grammar") "isTense"))) }}
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
{{ ($scratch.Set "fullDesc" (printf "%s %s **not finalized**." ($scratch.Get "fullDesc") (index ($scratch.Get "grammar") "isTense"))) }}
{{ end }}
{{ end }}
{{ else }}
{{ ($scratch.Set "fullDesc" ($scratch.Get "introClause")) }}
{{ end }}
{{ ($scratch.Get "fullDesc") | markdownify }}

## 7 Static

## 8 Themes

## 9 Appendices

## 10 Bibliography

## 11 Contributors

## 12 Index

Author: emsenn

Created: 2019-01-21 Mon 12:02

Validate
