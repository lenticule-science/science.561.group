---
type: concept
class: predication
status: settled
depends-on:
  - note.md
  - slug.md
  - ../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md
see-also:
  - ../specifications/frontmatter-relations.md
  - questions/frontmatter-relation-vocabulary.md
  - ../objects/relation-graph.md
  - ../../teaching/explanations/frontmatter-is-structured-data.md
title: Frontmatter-relation
description: A frontmatter-relation is a frontmatter-declared edge from one note to another, named by a key in the established vocabulary (depends-on, realizes, see-also, introduces, recaps, discusses, instantiates, explores, closes, chapters) and…
---

# Frontmatter-relation

A **frontmatter-relation** is a frontmatter-declared edge from one [note](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/note.md) to another, named by a key in the established vocabulary (`depends-on`, `realizes`, `see-also`, `introduces`, `recaps`, `discusses`, `instantiates`, `explores`, `closes`, `chapters`) and valued as a [slug](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/slug.md) or relative path to the target note.

A frontmatter-relation is the substrate's first-class predication: it is a [predication-cell](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md) where the subject is the asserting note, the predicate is the relation key, and the object is the target note. The corpus's relation graph (the [relation-graph](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/relation-graph.md) object) is the union of every such cell across every note.

## The minimum vocabulary

Eight relations carry the topological/semantic load (the answer in progress of [frontmatter-relation-vocabulary](../../documents/articles/learning-articles/questions/frontmatter-relation-vocabulary.md)):

- **`depends-on:`** — this note requires the target to make sense; the renderer must traverse the target before this note in any sound reading order.
- **`realizes:`** — this object/morphism realizes the named concept (an object-to-concept edge).
- **`instantiates:`** — this note instantiates the named upstream entity at a more specific substrate (a parent-theory-to-child-theory edge).
- **`see-also:`** — informational cross-reference; non-load-bearing.
- **`introduces:`** — this narrative or chapter introduces the named entities (typed-targets list).
- **`recaps:`** — this note recaps named earlier material; rendering may abbreviate.
- **`discusses:`** — this note discusses named entities without depending on them; renderer hint for region-end placement.
- **`explores:`** — this question explores the named entities; sets the question's scope.

Two further relations are book-assembly mechanics specific to the monograph build:

- **`closes:`** — names the question this answer closes.
- **`chapters:`** — orders child notes within a parent's table of contents.

Two are typing/disambiguation:

- **`class:`** — sub-classification within the note's `type:`.
- **`symbol:`** — the canonical math symbol an object/morphism carries.

## Edge typing

Relations are typed: each relation's source and target must satisfy a typing rule. `realizes:` requires source ∈ {object, morphism} and target ∈ {concept}. `instantiates:` requires both endpoints typed. `depends-on:` is liberal — any typed note may depend on any other — but cycles violate the topo-sortability claim (see [relation-graph-topo-sortable-under-depends-on](relation-graph-topo-sortable-under-depends-on.md)).

Edges to non-existent targets are dangling; the substrate's validation pass surfaces them as defects, not errors. A dangling edge is sometimes legitimate (the target is a planned but unwritten note); the discipline accepts dangling edges with `status: pending` on the source side and a comment naming the gap.
