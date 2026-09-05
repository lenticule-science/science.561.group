+++
title = "How I Write"
author = ["emsenn"]
tags = ["writing"]
draft = false
+++

## Introduction {#introduction}

The following is an explanation, mostly to myself, of how I accomplish
the technical task of writing. It is being written because I am
struggling to hold the conception of the entire process in my head,
and feel I am getting lost in the weeds, especially when it comes to
implementing fragments of this idea.

First, a breakdown of my history with writing tools, and what sorts of
writing I do. Note that I'll mention some brand names and such,
these aren't endorsements - and if you're reading this from the far
future, it's utterly irrelevant and you can move on to the next section.


## History of Writing Tools {#history-of-writing-tools}


### WYSIWYG Era {#wysiwyg-era}

I have always writen on a computer, with a keyboard - I was born in
1990, and my parents appreciated the role computers would have in
society from then until now, so I've had a computer since I began to
become literate.[^fn:1]

Even though I had a graphical editor like Word on my computer even
back then, I tended to prefer Notepad. (Yes, I used Windows, I'm
sorry.)

When I got further into elementary school and I started having to type
papers in Word, I used it for pretty much everything, until time
progressed and people started using Google Docs.

Most of these are not good tools for writing - they're decent at
formatting documents, but in terms of handling text, they leave a lot
to be lacking.


### Markup Era {#markup-era}

As I got into high-school I started using Linux as my daily operating
system, which led to me using Vim as my text-editor. It was a
revelation - I could suddenly easily move huge chunks of text, have
lots of documents easily onscreen at once, and it _looked cool_: I ran
it in a black and grey terminal, instead of a web browser with what
was at the time a trend of glossy, space-wasting design.

Using Vim got me into using the Markdown formatting language, where
you write things like this:

```markdown
# This Is A Title

This is a sentence, here is some _italic text_, here's
some *bold*. This is a [link](https://emsenn.net).

> Blockquotes like this.
```

It has more features, but mostly it's just a lightweight way to add
formatting to text without needing a special formatting editor like
Word or Google Docs. Markdown was - and is - very popular across the
Internet; lots of forums and chat programs let you use it to add
formatting to your messages.


### The Current, Org-mode, Era {#the-current-org-mode-era}

Last year, I started using Org-mode, which is another formatting
language like Markdown, but built for use with the Emacs text-editor
(though you can write it in any program, Emacs enables the more
powerful features.)

For comparison, it looks like this:

```org
* This Is A Title
This is a sentence, here is some /italic text/, here's some
*bold*. This is a [[https://emsenn.net][link]].

#+BEGIN_QUOTE
Blockquotes like this
#+END_QUOTE
```

It's a little more verbose, but Emacs has features that more than make
up than that - hotkeys for quickly pasting well-formatted links and
blockquotes, for example.

I'm not going to explain Emacs and Org-mode more than I have to as I
write this, but they are an important part of my writing tools these
days.

Another set of tools I haven't talked about is static site
generators - these are software tools that take text, usually
formatted with Markdown or another markup language, and turn it into
HTML - usually in the context of making a website, not just a single
document.

I've used quite a few different static site generators, and don't see
a need right now to go into that history. Right now, I use Hugo as my
static site generator.


## What I Write {#what-i-write}

Most of my life I've focused on writing short stories and essays. More
recently I've written some poetry, and most recently I've gotten into
writing technical documentation and resources for tabletop
role-playing games.

This means that while I work on many documents that are are just a few
thousand words, I also work on a few significantly larger pieces,
including some that require complex formatting and inclusion of things
like code examples and graphs.

This also means there are a lot of times I want to use the same
template, or even include the same text across multiple documents.

Because I'm interested in sharing my work as well, it's important to
me that I can easily make it available in many different formats.

This leads to me wanting a rather complex writing and publishing
process, which is what I'll try to explain below.


## Writing & Publishing Method {#writing-and-publishing-method}

I'm going to try to write about the abstract process first, and explain the technical implementation as an afterthought - in part, because the technical implementation is bad, really bad, and I plan on overhauling it as soon as I finish this essay. But some things, like the terms I'll put in bold, are what I know is going to remain the same, regardless of implementation. (Well, if the term conflicts with a term in the implementation it might change, but, uh.)


### Creating the Project {#creating-the-project}

Everything I write - every _document_ starts as a **_project_**, which
is a directory on my computer that has both the _contents_ of the
document, and whatever _meta_ information is needed - things like a
_license_ for declaring copyright. (Some projects contain multiple
documents, it should be said.)

Most projects have roughly the same layout:

There's a `README.org` and `LICENSE.txt` file in the root
directory. The README has a bit of information about the project, and
is shown by some software when displaying information about the
project. It also contains the instructions for "using" the project -
taking the files and using them to create an up-to-date "published"
document - one that has all its necessary components. The LICENSE has
the terms governing the project's use, modification, and distribution.

There's also usually four subdirectories: `src/`, `layouts/`,
`build/`, and `pub/`.

The `src/`, or source, directory contains the raw components of the
project. This is usually at least a few `.org` files, sometimes a
folder called `assets/` that contains images, and maybe some other
files.

The layouts directory has more `.org` files, which use `INCLUDE`
statements to pull in one more more source files. For example, there's
usually a `layouts/readme.org` which includes the source files for the
project's description, financial disclosure, credits, and license.

The build directory is populated by properly exporting the layouts,
and contains some more `.org` files. These contain the text of
whatever was `INCLUDE`'d in the layout, and are ready to be published.

The `pub/`, or publication, directory is populated by exporting the
files in the build directory, usually in a bunch of different formats,
like Markdown, HTML, PDF, and of course, Org-mode itself. Why not.


#### Project Root {#project-root}


##### `LICENSE.txt` {#license-dot-txt}

The `LICENSE.txt` file at the root of the project is created by exporting `layouts/license.org`.


##### `README.org` {#readme-dot-org}

The `README.org` file at the root of the project is created by
exporting `layouts/readme.org`.


##### `src/` {#src}


###### `license.org` {#license-dot-org}


###### `brief.org` {#brief-dot-org}


###### `editorial.org` {#editorial-dot-org}


###### `introduction.org` {#introduction-dot-org}


###### `readme.org` {#readme-dot-org}


###### `contents.org` {#contents-dot-org}


###### `project-definition.el` {#project-definition-dot-el}


##### `layouts/` {#layouts}


###### `readme.org` {#readme-dot-org}

The `readme.org` layout pulls together several source files to create
a useful readme, and specifies to export the collection to
`../README.org` - the readme at the root of the project. To properly
use this layout, export the "README" subtree as an Org-mode file.


###### `how-i-write.org` {#how-i-write-dot-org}


###### `license.org` {#license-dot-org}

The `license.org` layout specifies that this layout should export to
`../LICENSE.txt` - the license file at the root of the project - and
include the `license.org` file from the `src/` directory. To properly
use this layout, export just the "MIT License" subtree as a utf-8
plaintext.


##### `build/` {#build}


###### `how-i-write.org` {#how-i-write-dot-org}


##### `pub/` {#pub}


###### `how-i-write.org` {#how-i-write-dot-org}


###### `how-i-write.hugomd` {#how-i-write-dot-hugomd}

[^fn:1]: I will note, that as I become more proficient with digital writing, and gain a greater understanding of the concepts of text manipulation as a design tool, I am more often writing things by hand, as I find myself better able to plan the weft and warp of a piece in my head than I used to be.