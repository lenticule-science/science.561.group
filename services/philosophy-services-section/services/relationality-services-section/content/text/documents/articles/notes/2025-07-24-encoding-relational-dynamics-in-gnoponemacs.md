---
title: On encoding relational dynamics in GnoPonEmacs
author: emsenn
date-created: 2025-07-24
type: babble
status: draft
keywords:
  - babble
  - gnoponemacs
  - relational-dynamics
publish_to:
  - emsenn-net
---

Continuing on from my last babble, I'd like to think about the different kinds of encoding I'm working on - but not without a tip-of-the-hat toward overcoding.

If I try and just babble on it, a big part of what I'm trying to do is, under it, overcode the universe, so that each node of relational dynamics has a way to be encoded, fingerprinted, etc.

While I recognize that's an unrealistic goal, it's the method that interests me: starting from the existing mapped network of relations and differentiating new relations by describing their differences.

I want to do this in a way that is compatible with:

1. The way I've come to ontologize, as critical of that way as I am. What I've called relational dynamics or tekodynamics, elsewhere.
2. Org-roam nodes
   1. I want them to be publishable as static interlinking HTML docs, so I can provide a rendition of the map to the public.
   2. This one will require translation from my relational grammar to Emacs, Org-mode and Org-roam grammar. This might require translating them first into standard computer terms.
3. My own codebase, probably Fennel
   1. This requires translation into Fennel/Lua ideas, which will probably be simpler than Org-mode and Org-roam, in some ways, but trickier in others because I'll have to make it up, not map it to an existing system like Org-roam, no matter how janky it is.

From here, it seems critical to pin down certain things, such as:

- Every Org-mode file and Org-mode subtree with an Org-mode ID property is an Org-roam node.
  - This means it is a relational node, in our grammar.

At this point, that's all the system assumes: notably, a file with an ID does not need a title to be in the Org-roam database (it'll show up as a blank string, if you search for it), but if you end up with more than one untitled node, only the most recent one will be findable.

So, it seems necessary as a next step to establish titling - naming, as the first act of differentiation that occurs to relational nodes, within the GnoponEmacs framing.

I'm inclined to shift my babbling toward how that is, in some ways, perhaps anthropocentric or even colonial, but, I knew that this whole endeavor is going to be kyriarchist.

So, everything with an ID must have a title. From a software perspective, the primary use of the title is searching for a node. I could probably - and might end up - writing a whole thing on, "Titling Relational Nodes in GnoponEmacs," but for now, that seems like the thing to make important:

- ID is an automatically assigned unique alphanumeric identifier.

This feels very affirming of my desire to create a Fennel game engine grounded in structuralism and similar thoughts. I don't think folk know that's what they want their sandbox to be made of, but they *do*, they clearly do: it's what they made as a sandbox for their own cognition!
