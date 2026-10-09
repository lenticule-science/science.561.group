---
aliases: []
tags: []
date-written: 2020-10-16
created: 2020-10-16T19:06
modified: 2025-07-14T10:20
title: Planning the next phase of my computing from prior obsidian dump
description: I'm fortunate enough to get to correspond with Phil Hagelberg, a developer whose sensibilities match my own, but whose knowledge and experience far exceeds mine, and it’s been really helpful in helping me plan this next phase of computing…
---

I'm fortunate enough to get to correspond with [Phil Hagelberg](http://technomancy.us/), a developer whose sensibilities match my own, but whose knowledge and experience far exceeds mine, and it’s been really helpful in helping me plan this next phase of computing I seem to be entering.

*(This next part of this newsletter took me quite a few drafts)*

Viewed abstractly, a great deal of my computer use has been a struggle to record human-generated data (text “strings” and numbers) and re-present it to other humans, using computers. (Or, sometimes, a printer.)

A few years ago, I was using Markdown and a static site generator. But that was rather limiting. Since then, I have…

…Well, being honest with myself, I haven’t actually *done* much of anything, in terms of actions that effect the outside world. I have certainly *attempted* a great number of things, and have *learned* even more, but, I don’t have some collection of software I can point to and go “that’s what I’ve done.”

Instead, I have a bunch of half-implemented, journal entries explaining concepts, and, importantly: a much clearer idea of where I plan to go with my computing from here. A lot of this thinking was influenced by Phil, like I said, but also other conversations in the Fediverse, and discussions with my partner, who is in library science.

While my thinking is relatively clear, I haven’t actually written out this thinking yet, so if this is unclear or you’ve got more questions, please write back and ask them!

This might sound self-evident, but computer-programming is writing data structures and procedures to handle them. Often, the data structure is coupled with the procedures, as part of a software, but usually the data structure is its own useful resource! So, moving forward, my first step with making a software will be to define the *schema* for its necessary data structures. And, since almost everything I do is human-generated data, I’m going to define those as XML schema.

Why XML? Well, it’s ubiquitous, and its syntax, while ugly, basically allows for the encoding of S-expressions, which I’ve come to favour as a way of composing statements. No one /needs/ a library to make use of XML, and it is fairly explicit, meaning that if I give you the XML sheet for something, you’ll probably be able to suss out what sort of “something” it is - even if the schema is unavailable.

I’m also going to move away from [Racket](https://racket-lang.org/) as my primary programming language. Racket is really wonderful for exploring “what happens when modern programming paradigms are enabled so folk can do them easily?” and I think in the hands of someone who’s programming is centered around choosing paradigms and stuff, it’s wonderful.

But I found myself ignoring 99% of the language, really just liking it because it was a LISP that had namespaces, which [ELISP](https://www.gnu.org/software/emacs/manual/html_node/elisp/) doesn’t. (And that was my first LISP.)

I had considered moving to [SBCL](http://www.sbcl.org/), a pretty straight-forward LISP, and then considered [Rust](https://www.rust-lang.org/), and a few other languages. I might use one or more of those in future projects.

But for now? I’m going to be using [Lua](https://www.lua.org/). This might seem like an odd choice, or it may seem obvious, depending on how closely you’ve been following my computer tinkering so far.

I’m going to explain why I chose Lua: these reasons are mostly arbitrary. If you have another language you think might be better, or recommendations on Lua libraries I should check out, let me know.

1. I like Lua’s history. A programming language built because of a nation’s pursuit of self-determination is nicely in-line with me wanting to write all this software because of my own desires for self-determination.
	
2. I like Lua’s ubiquity. So many things can interpret Lua scripting, that knowing how to use it proficiently seems really useful. It has a small footprint, I’m not really worried about being able to run it on any computer at-hand, the way I am with Racket.
	
3. Lua is pretty simple. “*Everything is a table”* is nice and clear, and makes it easy to grapple with other parts of the language, like modules.
	
4. Phil made [Fennel](https://fennel-lang.org/), which provides a LISP-y syntax for Lua.

There are other reasons, some more important than what I’ve listed here, but these are the ones that came up when I was writing this email.

I’m still planning on opening up the Teraum MUD to playtesters on March 23rd, even with these massively shifted plans for how to program it. But my first order of business is drafting a schema for my seed catalog, and then writing corresponding functions for creating XML documents adhering to those schema based on inputs.

Which might not sound like much, but I’m not *that* familiar with XML, and I am completely unfamiliar with Lua or Fennel, so it should keep me busy for a little while! But, I have something like 200 varieties of seeds already: I really need some sort of means of organizing them, and I was disastisfied with available solutions. *(That’ll likely be in a future newsletter.)*

A brief update about real life: Some green beans that I trellised up a broken staircase have been productive for a couple weeks now. Attached is a photo of Esther holding some of today’s harvest.