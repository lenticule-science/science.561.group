---
authors:
  - "[[emsenn]]"
kind: "[[log-entry]]"
date-created: 2026-02-22T10:15:00
publication-emsenn-net: publishable
---
I'm writing from Obsidian, as I struggle toward coming back toward computers. I'd last written about wanting to use Emacs and Org-mode, but I realized that part of that was coming from a feeling of despondency about working with others, and part of what I want to do is build habits that others can easily adopt as pieces. Markdown makes that so much easier than Org-mode, as demonstrated by the fact that I can work in this file within Obsidian, Emacs, and VS Code, all at once. (Though I *shouldn't*, unless I want to clobber each others' changes!)

Anyway, last time I was working on things, I came pretty close to the basic framework I needed: three directories: a library of content, an engine for processing that content, and a catalog of products, well, produced by that engine.

The first and most necessary part of this was setting up a way to collect everything relevant from my library - starting with Markdown files that have `publication: [emsenn-net: published]` in their frontmatter (or something similar) - and then moving them to `products/emsenn-net/content/`. In that directory there'll be whatever is necessary to then be able to build the site, and properly upload it.

That gets me a very simple, notes to public site pipeline, that should unstick some of what needs unsticking in my personal writing->sharing flow.

From there, it'll be a matter of bringing in some of those core content files, like a homepage, and from there, I should have a foundation for bringing in some of the massive amount of writing and slop I've generated over the past 12 months.

Right now, I'm working in VS Code to try and bring over some of the older MkDocs stuff I was working on in ~December - the goal is to get a simple website with the babble log up, *soon*, and then I can start repopulating it with content after that.

...And I've learned that MkDocs is going to a 2.0 that'll break everything, and so I'm looking at Astro as an alternative site generator, specifically toward their Starlight theme or whatever. I'm seeing one thing their docs point out is their eco-friendliness, and I'm thinking that might be a fun page to add to emsenn.net, about how it's super-light so it doesn't take much to transfer/load. And, when I get around to setting up Koios News again, that should be there.