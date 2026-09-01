---
authors:
  - emsenn
date-created: 2025-12-25
type: babble
title: "2025-12-25, Planning simple publishing pipeline"
aliases:
  - "2025-12-25, Planning simple publishing pipeline"
  - "2025-12-25, planning simple publishing pipeline"
tags: []
---

Today it's my hope to set up what I need so that I can do `make publish-emsenn-net` from the Emsemioverse's root.

This looks like:

- Having scripts for collecting matching content (i.e. `publications` is `{emsenn-net: publishable}` or whatever is proper YAML)
- IN THE FUTURE, Build that content into "hydrated" Markdown (i.e. take davaiew queries and render them)
- FOR NOW, just fill in whatever missing content is necessary and may be inferred from the collect, and then
- publish it via MkDocs

---

Now, one thing I want to do is start refining a work pipeline that goes something like this:

- I log about what I'm thinking.
- An agent (probably me) comes along and goes, okay, what changes does this motivate, if any, to the library?
- Those changes get noted as IDEAs first, with a notion of working them through being PLANs and finally, y'know, made.
- But! Doing that process just described will itself require a set of skills and documentation that explain all that stuff.

---

So what I want to do is very very slowly go, okay. I have described a process. I want to do a bit to formalize that process, and, formalize is itself process that needs formalizing, and it's hard to untangle the circularity in my head.

The idea is that for every discrete unit of Work - a term that hasn't been defined yet but will be part of our Agential Semioverse - we establish it having some sort of phasing that goes from Idea to Plan to Task to Task-At-Hand and from there what it is really changes shape. And, the shape of a planned math paper is already pretty different from the shape of a planned software project.

And so what we want is to record these processes, in keeping with emergent conventions, as Skills that, over time, represent every Unit-of-Work that Agents *can* do in this Agential Semioverse. (I think, at first, the underlying mathematical object is going to pretty irrelevant, but as we approach tying these skills together, we'll be glad for it).

---

What this gives us then is a few general Work-Flows (Chains-of-Work in some sort of Work-Graph? These ideas are emergent)

- Keep developing the Math Objects from which the repository's structuration derive:
  - Semiotic Universe
  - Interactive Semioverse
  - Agential Semioverse
- Develop the skills related to doing that
- Develop the skills for collecting what should be published to emsenn-net
- Do whatever else is necessary to make emsenn-net buildable and publishable
- Write the documentation that helps fill in the more qualitative substrate underneath skills:
  - ReadMes, Agent Contracts, Specifications, Glossaries.
  
I might be missing a few key things that make all that actually work, as an idea.

---

Personally, getting the ability to publish emsenn.net is absolutely the critical priority; we don't need to do it via fully atomic skills or anything, but being able to get *any* website up is important as a real-world obligation of this research.

---

Beyond that, I am going to keep moving in older content, either directly where it should go, or into our Triage.

---

But, related to the work at hand, I see there being basically two immediate steps:

- Write the skill and script for collecting emsenn-net publishables
- Write the skill and script for publishing the collected emsenn-net-source

I think there might already be some work done stubbing those out, but I'm not sure.

Once that's happened it opens up a few concurrent directions of work, none of which are blocked by not having a place to publish artifacts. (As, from there, it'll be easy to set up other publications, hopefully).

But! There is a lot of nuance to "publishing" that I'm glossing over for now, mostly due to unfamiliarity with the contemporary MkDocs ecosystem. I know I want Activity to be triggered locally by agents first, then git hooks if possible, and only use remote forget CI-stuff when it's actually appropriate.

Which leaves me with the actual next steps of:

1) Write the collection script, make sure it works.
2) Read more about MkDocs
