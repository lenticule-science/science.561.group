+++
title = "Planning a Personal Website with Hugo"
author = ["emsenn"]
tags = ["Hugo", "web-development"]
draft = false
+++

So I've been going through my various online representations, trying to figure out what each one is for, and what I'm missing. Part of that has been moving my "blog," such as it was, off of my main homepage and moving it to a dedicated platform for _broadcasting_ writing. Now, I'm using _WriteFreely_ at `posts.emsenn.net` to share some of my longer but more informal writing - this text is probably going to go there.

This leaves `emsenn.net` free to be mine, rather than belonging to my writing. You might think this would leave me without much content to put there, and in way, that's true, but there's also still a _lot_ of information that one can provide about oneself to be a filled-out digital representation.

A note - I'm going to be using terms like agent, representation, avatar, user, person, and so on as I write about this stuff, and I'll be doing so without what I hope is my usual precision. I'm not sure how I want to train myself to think about these things yet, so I'm not sure what terms I want to use for which concepts. I apologize if the current indecision makes this writing less intelligible or more verbose.

So, `emsenn.net` is free to be my "personal website." Now... to think about what that means. It'd need to have information about me, as a person. I often find myself wanting to link to info about how to donate to me. I maintain a list of things I recommend folk read. I also maintain a list of my recent activities, my plans, and I'd like to start keeping a list of things I'm looking for help with.

There's also things that are a part of the _IndieWeb_ that I'd like to add, and other things like a `/now/` page, which would have my most recent activities.

I put some thought into this the other night and I think the way I'd like to implement this is as a static _HTML_ website - there's nothing I do so rapidly that people need a second-by-second update of it.

_Hugo_ is my static site generator of choice - it's powerful enough to do everything I've wanted to do with it, without relying on your final site having _Javascript_ (or being very particular about avoiding it.)

I want to do things properly this time though - and by properly, I mean in such a way that what I'm making can be useful for other people who'd like to make a site like mine, but with their own information.

As I understand it, this means organizing the components as _Hugo themes_. _Hugo_ uses what it calls _layouts_ to determine how to render a document, and follows a _lookup order_ to determine which layout to use.

So, I think I'll start by making a new project, `hugo-personal-website-theme`, that'll be a _Hugo_ theme, and used by the `emsenn-website` project, that'll be a _Hugo_ website.

That's about all I can write on the topic until I take the first steps toward implementation.