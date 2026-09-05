+++
title = "Looking at How I Organize a Document"
author = ["emsenn"]
tags = ["OrgMode", "writing"]
draft = false
+++

## Overview {#overview}

In this essay I'm going to explain how I'm organizing my documents these days. By documents, I mean written texts - stories, essays, posts like this one, but also, software. Software might not seem like a document, but I use the _literate programming_ paradigm when I work with a computer, so I write my software as snippets of code inside longer essays.

I'll use my _Brutstrap_ project as an example. It's a relatively simple _CSS_ theme I made, so should be an opportunity to demonstrate a lot of things without its content getting in the way.


## Document Project Layout {#document-project-layout}

Each document exists in its own directory on my computer, under the `~/org/projects/` directory. It's called `projects` because within _Org-mode_, the name for collections of files published together is a "project," so each document exists as a "document project." Brutstrap's "identifier" is `brutstrap-css` - that means it's at `~/org/projects/brutstrap-css/`.

The root of that directory contains the document in various formats (_HTML_, plain-text, _Markdown_, and others), as well as a `README.md` and a `media-package.json`.

There's also a subdirectory, `src/`, which contains an `index.org` and subsubdirectory, `build/` which has in it an `index.html` and `brutstrap.css`.

The only file I edit by hand is `src/index.org`, which is an _Org-mode_ text file. All the other files are created by using _Org-mode_ features on that file.


## The Source File {#the-source-file}

Here's a walkthrough of what's in that file. I'll break it up into the front-matter, introduction, document contents, and supplements.


### Front Matter {#front-matter}

```org
#+TITLE: Brutstrap
#+AUTHOR: emsenn
#+EXPORT_FILE_NAME: ../brutstrap
#+MACRO: document-type CSS theme
#+HTML_HEAD: <link rel="stylesheet" type="text/css" href="./src/build/brutstrap.css">
{{{document-brief}}}
#+TOC: headlines local 4
```

Let's look at this line by line:

-   `#+TITLE: Brutstrap`
    -   This sets the document's title. Fairly self-evident. It's used when exporting the document, and also available as a _macro_: `{{{title}}}`. I use _Org-mode macros_ a fair amount, they're a way to quickly insert pre-assigned text.
-   `#+AUTHOR: emsenn`
    -   This set's the document's author. Works similar to title.
-   `#+EXPORT_FILE_NAME: ../brutstrap`
    -   This tells _Org-mode_ where to put exported copies of the file. When I tell _Org-mode_ to export `./src/index.org` as _HTML_, it'll export to `./brutstrap.html`.
-   `#+MACRO: document-type CSS theme`
    -   This sets the `document-type` macro, which is used by some other macros to say what sort of document this is - in this example, it's a "CSS theme". Due to how it's used, the document-type is assumed to be a singular noun.
-   `#+HTML_HEAD: <link />`
    -   I cut out the specifics, but this line tells _Org-mode_: when exporting as an HTML file, link to `./src/build/brutstrap.css` as a stylesheet.
-   `{{{document-brief}}}`
    -   This is a macro I've defined in my _Org-mode_ configuration, so it's available in all my _Org-mode_ files. Here's what it's defined as:

        ```org
        "{{{title}}}" is a {{{document-type}}} created by {{{author}}}.
        ```

        As you can see, it makes use of the macros defined above.
-   `#+TOC: headlines local 4`
    -   This generates a table of contents linking to sections and through three depths of subsections. (1+3=4)

Past here, the document is divided into three sections: an "Introduction," the document contents itself (here, "Brutstrap,") and "Supplements."


### Introduction Section {#introduction-section}

nil:END:
Here's the Introduction:

\#+begin\_src org
  ,\* Introduction
    :PROPERTIES:
    :CUSTOM_ID: introduction

{{document-is-draft}}

In this document I explain...

  {{document-eli}}
\#+end\_src

Again, line by line:

-   `* Introduction` declares the start of what _Org-mode_ calls a _subtree_, but what normal people would call a "section". How many asterisks lead determine the depth of the section - `**** Pumpkin` means that "Pumpkin" is a subsubsubsection.
-   `:PROPERTIES:` declares the start of what _Org-mode_ calls a _drawer_, which is container for data associated with an element of the document - in this case, the Introduction section.
-   `:CUSTOM_ID:` declares what the identifier for this section should be, when it's exported. It's a part of the `PROPERTIES` drawer that was just opened. This is the name that anchor links in an _HTML_ export will point to, for example. If this isn't set, _Org-mode_ will generate an identifier automatically, something like `org3507c8b`.
-   `:END:` declares the close of the `PROPERTIES` drawer.
-   `{{{document-is-draft}}}` is another macro from my _Org-mode_ configuration:

    ```org
    This {{document-type}} is a /draft/: it is unfinished and that
    should be considered when reading it. Special attention should be paid
    to text marked DRAFT, EDIT, or TK.
    ```
-   `In this document I explain...` is an abridged version of the paragraph that's actually there, that explains the broad strokes of what _Brutstrap_ is, how it's meant to look, and so on.
-   `{{{document-eli(default)}}} is yet another macro from my /Org-mode/ configuration. This one is a bit unusual, it's set to ={{{document-eli-\$1}}}`. _Org-mode_ passes text after the macro name, between paratheses, as arguments, separated by commas. So, `{{{document-eli(default)}}}` translates to `{{{document-eli-default}}}`. Why don't I just do `{{{document-eli-default}}}` in the source file then? This way I can change how macro is rendered across all files, just by updating the `document-eli` macro. So, what does `document-eli-default` expand out to?

    ```org
    This {{document-type}} was created by me, emsenn, in the United
    States. To the extent possible under law, I have waived all copyright
    and related or neighboring rights to this document. This document was
    created for the benefit of the public. If you're viewing it on a
    remote server, you're encouraged to download your own copy. To learn
    how you can support me, see
    [[https://emsenn.net/donate][https://emsenn.net/donate]].
    ```

    Oh - it might help to say what "eli" is short for: _editorial and licensing information_: a declaration of the author and the rights assocated with the document. I assume I'm the author, and that the rights are "released into the public domain."


### Document Contents {#document-contents}

That's it for the "Introduction". The "Brutstrap" section contains the _Brutstrap_ theme itself - explaining how I _literately program_ CSS is beyond the scope of this document. In short, using _Babel_, I'm able to write short blocks of CSS, and extract them out to `./src/build/brutstrap.css`.


### Supplements Section {#supplements-section}

nil:END:
The "Supplements" section contains four subsections:

-   "Example Texts" This section contains two subsections:
    -   "Complete Stylesheet," uses _Org-mode's_ inclusion feature to pull in `./src/build/brustrap.css` - which is itself extracted from the "Brutstrap" section above.
    -   "Demonstration HTML," is a source block that, again using _Babel_, is written to `./src/build/index.html`
-   "Index"
    -   This section uses _Org-mode's_ dictionary list feature to present a list of proper terms mentioned in the document. Here's an excerpt from _Brutstrap's_ index:

        ```org
        ​- brutalism :: {{{ref(brutalism)}}}
        ​- Brutstrap CSS :: {{{ref(brutstrap-css)}}}
        ​- CSS :: {{{ref(css)}}}
        ​- HTML :: {{{ref(html)}}}
        ```

        This introduces a new macro: `ref`. This is, like the others, defined in my _Org-mode_ configuration, and is: `{{{define(\$1)}}} {{{source(\$1)}}}`. `define` is defined as `{{{\$1-definition}}}` and `source` is defined as `{{{\$1-source}}}.`. For each term, then, I have two macros, for example for Brutalism I have `brutalism-definition` and `brutalism-source`. The definition is simple a sentence defining the term, and the source is... a call to yet another macro: `{{{source-link(https://en.wikipedia.org/wiki/Brutalist_architecture)}}}`.

        `source-link` is defined as `See [[\$1][\$1]]` which is _Org-mode_ formatting for a link whose anchor text is the URI it directs to.

        So, the final entry for _brutalism_ would be:

        ```org
        ​- Brutalism :: A style exaggerating the pragmatic functionality
        	 present in modernist design. See
        	 https://en.wikipedia.org/wiki/Brutalist_architecture.
        ```
-   "Media Package"

This section contains a _JSON_ source block which implements a specification I'm developing for what I'm calling a _media package_, which is a manifest of information about a piece of media content.

Explaining that is beyond the scope of this document, in part because it's in development, so I'll just show the _JSON_ here:

```json
"brutstrap-css": {
    name: "Brutstrap",
    creator: "emsenn",
    license: "CC0",
    languages: ["en_US","CSS","HTML"],
    versions: {
      "current": {
	  "sourcehut": {
	      "location": "https://git.sr.ht/~emsenn/brutstrap-css/blob/master/",
	      "formats": ["html","md","pdf","tex","txt"]
	  }
      }
    }
}
```

-   "README"

    -   The "README" section is used to generate a `README.md` at the root of the project, as that file is often used by _Git forges_ to generate the project's "homepage" on the forge. It contains three thing:

        -   It sets the `PROPERTY` of `EXPORT_FILE_NAME` to

        `../README`, so that when this section is exported, as say
        _Markdown_, it will be exported to `./README.md`.

        -   Then, it has the line `*** {{{title}}}` which creates a subsection under itself using the document's title.
        -   Then, it includes the "Introduction" section from `./src/index.org` - itself - but only the contents, not the title.

    Here's what the section looks like in the source file:
    \#+begin\_src org
      ,\*\*\* README
          :PROPERTIES:
          :EXPORT\_FILE\_NAME: ../README
          :CUSTOM_ID: readme

  ,\*\*\*\* Words
  ,#+INCLUDE: "./index.org::#introduction" :only-contents t
\#+end\_src

And here's what `./README.md` looks like - with the paragraphs cut down.

```markdown
# Brutstrap

This CSS theme is a *draft*...

In this document I explain...

This CSS theme was created by...
```


## Conclusion {#conclusion}

And so that's it, how I manage a document as a project, exporting it to various different formats, maintaining a README, and so on, by just editing one file for each document, one at `./src/index.org`.