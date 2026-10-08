---
name: edge
description: "The substrate-record carrying one typed graph edge between FARS entities, derived from a Note's relation frontmatter or from a body link."
type: definition
class: record
depends-on: [note, fiber]
see-also: [interpret, frontmatter-as-presentation]
title: edge
---

# Edge

The substrate-record carrying one typed graph edge between FARS entities, derived from a [`Note`](note.md)'s relation frontmatter or from a body link.
An `Edge` is *not* a primitive substrate entity — it is a *projection* of relation predicates carried by some entity's fiber, surfaced as a typed graph record so operators that traverse, count, or rank the entity-relation graph can do so without re-reading frontmatter or scanning bodies on every call.

`Edge` is *derived*, not *authoritative*.
The substrate's source-of-truth is the `Note` content; an `Edge` is reconstructible from the notes by re-interpretation.
Caching edges (in memory, in a derived index) is admissible per [source-of-truth](../../../../teaching/explanations/source-of-truth.md) as long as the cache is invalidated on note edits and re-derivation is deterministic.

## Required fields

Every conforming realization SHALL hold, for each `Edge`:

- **`src`** — the source entity's address (the entity whose fiber carries the relation predicate).
- **`dst`** — the destination entity's address (the target of the relation, parsed from the predicate's value).
- **`kind`** — the relation's name (e.g. `depends-on`, `see-also`, `instantiates`, `link`).
  Frontmatter-derived edges carry the frontmatter key as `kind`; body-derived edges typically carry `kind=link` (or a kind-specific value declared by the substrate's interpretation rules).
- **`source`** — which presentation source the edge was derived from: `fm` (frontmatter relation key), `body` (a link extracted from the body), or whichever realization-specific source the interpretation rules declare.
- **`line`** — for body-derived edges, the line in the source body where the edge was extracted; absent or null for frontmatter-derived edges.

## Invariants

- **Derived.** An `Edge` is constructed from a `Note` plus the substrate's interpretation rules.
  Two notes whose relation frontmatter (or body) is byte-identical SHALL produce byte-identical edges under the same rules.
- **Immutable.** Edges are values, not handles.
  Edits to the source note produce a new note and a re-derivation of edges; an existing `Edge` value is never mutated.
- **Provenance-recorded.** The `source` and `line` fields together identify the presentation site that produced the edge, so a downstream operator that needs to inspect the source can locate it without re-deriving.

## What an `Edge` does *not* carry

- **Not a value-domain value.** An `Edge` is structural — it records that a relation exists, with the predicate name as `kind`.
  The relation's bilattice value lives in the source entity's fiber as a cell.
  An operator that needs the value reads the fiber; an operator that needs the graph structure reads the edges.
- **Not a substrate primitive.** Frontmatter relation predicates (and body links) are the primary substrate content; `Edge` is a derived projection.
  A realization that re-derives the edge index on every operation is conformant; a realization that maintains an edge cache is also conformant.
  Both produce the same edges from the same notes.
- **Not bidirectional.** An `Edge` is directed: `src` and `dst` are not interchangeable.
  A bidirectional relation (where both ends declare each other) produces two edges, one per direction.
  Operators that need the undirected view derive it from the directed edges.

## How edges are produced

Edges are produced by interpretation, alongside fiber cells:

- A frontmatter relation key (e.g. `depends-on: [foo, bar]`) on a note `N` produces `Edge(src=N.slug, dst="foo", kind="depends-on", source="fm", line=null)` and a similar edge for `bar`.
- A body link to another entity (e.g. a markdown link with target `foo.md`) on a note `N` produces `Edge(src=N.slug, dst="foo", kind="link", source="body", line=<line-number>)`.

The relation-key vocabulary (which frontmatter keys are interpreted as relations, vs. which are scalar predicates) is itself substrate content (interpretation rules); a realization that wants to admit a new relation key adds it to the rules and the next interpretation pass produces edges for it.

## Position

`Edge` is the load-bearing intermediate object for graph-shaped operations: traversal, ancestor/descendant computation, dependency analysis, foundation-distance ranking, cycle detection.
The substrate's [traversal](../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/traversal.md) operator reads edges; the relation index morphisms (forthcoming) maintain by-source and by-destination indexes for efficient lookup.

The relationship to [`Fiber`](fiber.md) is: a fiber's relation-cells are the *value* side of relations (carrying the relation's bilattice value); an `Edge` is the *structure* side (carrying the relation's source/destination/kind).
Both are projections of the same source content — the note's frontmatter and body — under different selection criteria.
