---
title: Organizing Toward a Semiotic Universe
date-created: 2025-01-01
status: draft
type: babble
tags: []
---

I think I’m finally at the point where the next thing to do is not invent anything new, but start organizing what already exists. I have years of files spread across repositories, moments, naming schemes, half-finished directions. None of it really means anything in isolation anymore. What I want is to be able to see it all at once, as parts of one [semiotic](../../../linguistics/topics/semiotics/index.md) universe, so that meaning emerges from adjacency rather than memory.

That doesn’t mean putting everything into one giant messy repository. I already know that just creates a different kind of [opacity](../../../philosophy/terms/opacity.md). What I actually need is a way to see how things fit together *as documents, research projects, software tools, and specifications*, without requiring all of them to be finished or public at the same time.

Once I frame it that way, it becomes obvious that this is less about “research vs product” and more about wiring. The same script, spec, or document can exist in multiple contexts without changing what it is. A public-facing repository and a private working space aren’t different *kinds* of things; they’re different configurations. Publication is just a particular wiring pattern.

That leads naturally to Git as the substrate, but not in the usual monolithic way. Instead of one repo to rule them all, I want a library of repositories. Some are specs. Some are tools. Some are half-baked research notebooks. Some are just operational junk that nonetheless matters. The important thing is that they can be related without being collapsed.

Submodules turn out to be the honest primitive here. They say “this exists over there” without pretending divergence or authorship. Forks, socially, tell a story about disagreement or contribution that often isn’t true. I don’t want that narrative unless it’s actually what’s happening.

There’s an immediate snag, though: platforms like GitHub expect certain files at the repo root. Licenses, contributing guides, codes of conduct. They don’t understand relational wiring. They only see flat trees. So if I try to be perfectly honest with submodules, the forge will lie on my behalf by acting as if those things don’t exist.

The FOSS world mostly resolves this by shrugging and duplicating files. That works, but it erases identity. I don’t want silent drift, and I don’t want a false sense that every copy is authoritative.

The compromise that actually feels clean is to factor the boilerplate itself into a first-class repository. One repo whose job is to hold specification boilerplate: LICENSE templates, CONTRIBUTING templates, README scaffolding, and a small shell script that stamps those into a new repository with minimal templating. Not live identity, not forks, just explicit generation.

So instead of pretending the forge understands relationships, I acknowledge the boundary. There is a canonical source. There is a moment where it becomes instantiated elsewhere. After that, it belongs to that repo’s reality.

That suggests a concrete starting point. A `library/repo-boilerplate/` repository that contains templates for different repo types: specification, Python package, Rust crate, research notebook, even “sloppy old research.” No moral hierarchy. Just shapes.

Alongside that, a `library/semiotic-markdown/` repository that holds the specification for the Markdown conventions I’m already using, plus examples. It’s not infrastructure beneath everything; it’s a sibling artifact that happens to be widely depended on.

With those in place, I can start moving old material out of the amorphous pile and into repos that at least tell the truth about what they are. Not cleaned up. Not finalized. Just placed.

At that point, organization stops being a blockage. It becomes a background process. I can publish slices without publishing the whole. I can wire things together without collapsing them. And the universe can start to become legible, not because I explained it, but because its parts can finally see each other.
