+++
title = "Planning a Personal Media Storefront Implemented in Hugo"
author = ["emsenn"]
tags = ["Hugo"]
draft = false
+++

Recently I decided that I was going to make a change in how I presented my writing online, away from a traditional website and toward a "storefront." I was pushed toward the decision when looking at how I wanted to present my writing related to Teraum, a fantasy setting I'm implementing as some stories and other texts.

While I have HTML files for each document, I'm not making them into a website. Instead, I've listed them as "games" on [itch.io](https://itch.io/), a web service for hosting and selling independent video (and other) games.

That's not too different from how my website used to be, before I switched it to running _WriteFreely_.

I was using _Hugo_ and _Ox-Hugo_ to turn _Org-mode_ source files into _HTML_, and I'll probably roughly follow that same toolchain.

So let's think about what the site would have: There'd be an index page that would explain the site and probably present the most recent additions to the "store".

There'd be a page for each "item" in the store, which would list info about it, its different formats in the latest version, and past versions.

Which implies the existence of a directory that has all that. I imagine it'd probably be best to do it `/store/{slug}/{version}/{slug}.{format}`.

So the _HTML_ rendering of version `1.0.0` of "A Shaggy Dog Tale" would go in `/store/shaggy-dog-tale/1.0.0/shaggy-dog-tale.html`.

The store page itself - the one that people would go to, to find their download link...

Actually, I should be able to link to an arbitrary source for the document - so while I might store things in that place I said, I'll want to accommodate them potentially being somewhere else.

When I was thinking about this last night, I realized that in a way, I'm building a sort of package management system, for my own writing.

_Hugo_ probably makes that easy, because it lets you use _TOML_ data files to supplement page contents.

Sorry if this feels fragmented to read - notes like this are written primarily for my benefit, and this is a bit project, conceptually.

I'll back up. There has to be a homepage. Then a page for each document that's available through the storefront.

It's been a few months since I've used Hugo, but as I recall, it encourages you to organize your posts under directories based on _content type_, which helps it decide what _layout_ to use.

I think I can comfortably use these _content types_:

-   `documents` for mostly-text things, like books, essays, collections of letters, and so on.
-   `images` for graphic assets, illustrations, scans of paintings, so on.
-   `audio` for music and other sounds.
-   `video` for video assets.

So, going back to the example, there'd be a page at `/documents/shaggy-dog-tale/`.

Oh and to be clear, I'm picturing all this living at `https://store.emsenn.net`.

Each page would have a bit of text about the document - with how I currently do things, I could copy any given document's "Introduction" section, since it is an out-of-context explanation of the document to follow, plus its license and so on.

It'd also have links to each available format of the current version, then a summary of past versions, and links to those downloads.

That... is a little trickier to build. I'm picturing that each page would be

So... each page - each _Markdown_ source file - would basically be a package definition? Okay - so I'm writing a package definition schema implemented as a _Hugo_-compatible _Markdown_ file, and layouts that render those.

That seems pretty comprehensible. I'm probably reinventing the wheel in some way - I mean, I could just release packages for another package manager and use whatever their web interface is.

But, here, I'll be able to really control how every store page looks, and I'm not sure but there might be features I want for a document-focused package store that existing software-focused package managers have. And beyond that, I'm not looking to build a full package manager, but just a static listing and an interface for accessing it.

The next step will be to create a basic _Hugo_ site to build this out on, and then start to implement the media package definition schema and layouts for rendering it. That sounds complex, but unless I've forgotten more about _Hugo_ than I think, it should be fairly easy at first. The difficulty will be in extending it as I use it and discovere more use-cases.