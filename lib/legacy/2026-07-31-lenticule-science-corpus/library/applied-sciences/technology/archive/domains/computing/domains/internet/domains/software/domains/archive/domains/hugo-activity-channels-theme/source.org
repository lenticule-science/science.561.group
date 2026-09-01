#+TITLE: Hugo Activity Channels Theme
#+EXPORT_FILE_NAME: ./hugo-activity-channels-theme
#+MACRO: document-type /Hugo/ theme
#+TOC: headlines 3
* Introduction
  :PROPERTIES:
  :CUSTOM_ID: introduction
  :END:
{{{document-is-software-prototype}}}

This {{{doc}}} is an implementation of /activity channels/: a
presentation of information about what something has recently done. It
is done using /Hugo/, a /static site generator/ written in /Go/.

The theme is written primarily for my personal use, on
[[https://emsenn.net][https://emsenn.net]].

{{{document-eli(default)}}}

{{{document-implements-literate-programming}}}
* Hugo Activity Channels Theme
  :PROPERTIES:
  :CUSTOM_ID: hugo-activity-channels-theme
  :END:
#+TOC: headlines 1 local
** DRAFT Overview
** DRAFT Operations
#+TOC: headlines 1 local
*** Install the Theme
**** Install with Git
**** Install from Source
** DRAFT Theme Configuration
   :PROPERTIES:
   :header-args: :tangle ./theme.toml :padline no
   :END:
The configuration below /tangles/ to =./theme.toml=. Explaining
it in detail is beyond the scope of this document. {{{source(hugo-themes)}}}
#+NAME: site-configuration-base-url
#+begin_src toml
  name = "Hugo Activity Channels Theme"
  license = "CC0"
  [author]
    name = "emsenn"
    homepage = "https://emsenn.net"
#+end_src
** DRAFT Page Layouts
This section contains the different page /layouts/.
#+TOC: headlines 1 local
*** Base Page Layout
    :PROPERTIES:
    :header-args: :tangle ./layouts/_default/activity-channel.html
    :END:
Located at =./build/layouts/_default/activity-channel.html=, this /template/
is the main activity channel
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
   :PROPERTIES:
   :EXPORT_FILE_NAME: ../README
   :END:
#+INCLUDE: "./index.org::#introduction" :only-contents t
** Source
The following is the source of this document as it was written by the
author.
#+INCLUDE:  "./index.org" src org
