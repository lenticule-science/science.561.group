---
title: Personal History of Writing
---

# Introduction {#document-introduction}

This essay is an explanation of my history with writing, focused on the tools I've used.

# History of Writing Tools

## WYSIWYG Era

I have always writen on a computer, with a keyboard - I was born in 1990, and my parents appreciated the role computers would have in society from then until now, so I've had a computer since I began to become literate.[^1]

Even though I had a graphical editor like Word on my computer even back then, I tended to prefer Notepad. (Yes, I used Windows, I'm sorry.)

When I got further into elementary school and I started having to type papers in Word, I used it for pretty much everything, until time progressed and people started using Google Docs.

Most of these are not good tools for writing - they're decent at formatting documents, but in terms of handling text, they leave a lot to be lacking.

## Markup Era

As I got into high-school I started using Linux as my daily operating system, which led to me using Vim as my text-editor. It was a revelation - I could suddenly easily move huge chunks of text, have lots of documents easily onscreen at once, and it *looked cool*: I ran it in a black and grey terminal, instead of a web browser with what was at the time a trend of glossy, space-wasting design.

Using Vim got me into using the Markdown formatting language, where you write things like this:

``` markdown
# This Is A Title

This is a sentence, here is some _italic text_, here's
some *bold*. This is a [link](https://emsenn.net).

> Blockquotes like this.
```

It has more features, but mostly it's just a lightweight way to add formatting to text without needing a special formatting editor like Word or Google Docs. Markdown was - and is - very popular across the Internet; lots of forums and chat programs let you use it to add formatting to your messages.

## The Current, Org-mode, Era

Last year, I started using Org-mode, which is another formatting language like Markdown, but built for use with the Emacs text-editor (though you can write it in any program, Emacs enables the more powerful features.)

For comparison, it looks like this:

``` org
* This Is A Title
This is a sentence, here is some /italic text/, here's some
*bold*. This is a [[https://emsenn.net][link]].

#+BEGIN_QUOTE
Blockquotes like this
#+END_QUOTE
```

It's a little more verbose, but Emacs has features that more than make up than that - hotkeys for quickly pasting well-formatted links and blockquotes, for example.

I'm not going to explain Emacs and Org-mode more than I have to as I write this, but they are an important part of my writing tools these days.

Another set of tools I haven't talked about is static site generators - these are software tools that take text, usually formatted with Markdown or another markup language, and turn it into HTML - usually in the context of making a website, not just a single document.

I've used quite a few different static site generators, and don't see a need right now to go into that history. Right now, I use Hugo as my static site generator.

# Supplements

## Contribute {#supplements-contribute}

## License {#supplements-license}

[^1]: I will note, that as I become more proficient with digital writing, and gain a greater understanding of the concepts of text manipulation as a design tool, I am more often writing things by hand, as I find myself better able to plan the weft and warp of a piece in my head than I used to be.
