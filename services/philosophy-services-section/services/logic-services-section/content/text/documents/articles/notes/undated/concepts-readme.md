---
title: concepts/
description: Semantic anchors that recur across the program.
---
# concepts/

Semantic anchors that recur across the program. Not mathematical objects in themselves; objects *realize* them.

A concept here is a role — *truth*, *knowledge*, *observation*, *agreement*, *consistency*, *time*, … — that takes different mathematical shapes in different constructions. In one system "knowledge" is a presheaf; in another it is a hyperdoctrine fiber; in a third it is a section of a sheaf. The concept note describes the role and tracks how it is realized across constructions.

Objects and morphisms that realize a concept declare it via `realizes:` in frontmatter. To find every realization of a concept, `grep -l "realizes:.*<concept>"` over `objects/` and `morphisms/`.

## Frontmatter

```yaml
---
kind: concept
depends-on: [bilattice, ...]   # optional — see below
---
```

Concept notes do not carry `status` (they are not claims). They may carry `depends-on:` when the role can only be precisely named after certain other notes exist — for instance, *truth* and *knowledge* both `depends-on: [bilattice]`, because the orders $\leq_t$ and $\leq_k$ are defined as orders on a bilattice. A concept named informally without prior structure (e.g. *adjudication*, which is meaningful before any formalism is introduced) carries no `depends-on:` at its first stratum.

## Body shape

A concept note's body describes the role: what it names, what pressures it imposes on any structure that would realize it, what gets settled by adjudicating the role. The body is written in mathematical and conceptual terms — never in terms of "paper X says Y" or "this was introduced in §1.1." A reader of the note should be able to understand the concept on its own. Where a citation is needed, the cited work lives in `references/` and is linked via `see-also:` in the frontmatter; bibliography is not body content.

A short opening line under the file's `# Title` gives the concept's role in one sentence. That line is the through-line — the most distilled statement of what the concept names. It should remain accurate as the body grows.

As the program develops and new mathematical structure brings new shape to the concept, the body grows by appending sections. Section headings name the *mathematical move* that brought the new shape — for example, `## The bilattice realization`, `## Under hyperdoctrine refinement`, `## After dualization`. They never name papers, authors, or bibliographic units; the math is the organizing principle. Earlier sections stay as they were; new sections record what the new structure determines about the role. Each section is complete and unhedged on its own terms.

## When to add a concept

When the same word starts to do load-bearing work across two or more distinct mathematical structures, and you want to be able to ask "is this still the same X?" — promote it to a concept. If a word only appears inside one construction, it does not need a concept note.

A concept also gets a note when a derivational stage names the role explicitly, even before its first formalization — *adjudication* and *temporal accumulation* are named before any algebra is introduced, and they belong here from that moment.
