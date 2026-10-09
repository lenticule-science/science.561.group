---
name: fiber
description: "The substrate-record holding an entity's predication-fiber in algebraic form: a bundle of cells, each a predicate (and arguments) paired with a value in the substrate's value-domain."
type: definition
class: record
instantiates: [predication-fiber]
depends-on: [substrate-value-domain, frontmatter-as-presentation]
see-also: [note, interpret, respond]
title: fiber
---

# Fiber

The substrate-record holding an entity's [predication-fiber](../../../../teaching/explanations/predication-fiber.md) in algebraic form: a bundle of cells, each a predicate (and arguments) paired with a value in the [substrate's value-domain](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/substrate-value-domain.md).
A `Fiber` is what the algebra operates on; it is constructed by [`interpret`](../transformers/interpret.md) from a [`Note`](note.md) and is the input to every operator that composes, restricts, or settles fiber content.

A `Fiber` is *not* what is stored on disk.
What is stored on disk is the [`Note`](note.md) — the file's path, its frontmatter as a parsed mapping, its body.
The `Fiber` is the *interpreted* form: the result of applying the substrate's interpretation rules to the note's presentation content (per [frontmatter-as-presentation](../../flatfile/frontmatter-as-presentation/frontmatter-as-presentation.md)).
Two notes with the same frontmatter under the same interpretation rules SHALL produce byte-identical fibers; the same note under different interpretation rules MAY produce different fibers.

## Required fields

Every conforming realization SHALL hold, for each `Fiber`:

- **`entity`** — the entity's substrate address (typically the canonicalized slug or substrate-relative path).
- **`cells`** — the algebraic content, a mapping from `Cell` to value-domain value, where `Cell` is a structured key naming a predicate plus its arguments where the predicate is parameterized.
- **`provenance`** — for each cell, the source it was derived from (which note, which frontmatter key, or which body pattern produced the cell).
  Provenance is what the [witness](witness.md) chain cites.

`Cell` and the realization's value type are the two extension points: the value-domain is fixed per realization (FARS commits to the four-valued bilattice $\{\bot, t, f, \top\}$ from [@adjoint-structure-spo-bilattice], following the [substrate value-domain](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/substrate-value-domain.md) discipline); `Cell`'s shape is whatever structured key the predicate vocabulary requires (predicate-name strings for unary predicates, predicate-name plus argument tuple for parameterized predicates).

## Invariants

- **Immutable.** Fibers are values.
  Operators produce new fibers from existing ones; they SHALL NOT mutate an existing fiber in place.
  Immutability is what makes a fiber's canonical hash a stable identity, and what admits caching without invalidation logic.
- **$\bot$-on-absence.** A cell not present in `cells` carries the value $\bot$ (no information).
  Absence is *not* the same as $f$ (told false).
  The fiber's algebraic domain is the substrate's predicate vocabulary; restriction to present cells is a presentation choice, not an algebraic one.
- **Provenance-recorded.** Every cell SHALL carry provenance.
  The substrate's [witness](../../../../teaching/explanations/witness.md) chain depends on this: a closure-rule firing that read a cell records the cell's provenance in the emitted witness so an auditor can trace the fiber's content back to its source notes.

## Composition

Two fibers compose under the substrate value-domain's operations, lifted pointwise.
Given fibers $F_1$ and $F_2$ on the same entity (or on entities at composable scopes):

- The **extending composition** $F_1 \odot F_2$ is the fiber whose cell at predicate $p$ is $F_1[p] \odot F_2[p]$, where $\odot$ is the value-domain's residuated extending operation.
- The **restricting composition** $F_1 \Rightarrow F_2$ is constructed analogously with $\Rightarrow$.

The Lambek adjunction $a \odot p \leq_t q \iff p \leq_t (a \Rightarrow q)$ on individual cells extends pointwise to fibers; the adjunction is what makes [`respond`](../transformers/respond.md) compose entity-fiber and message-fiber coherently.
Realization-level operators expose composition as [`compose`](../morphisms/compose.md) and restriction as [`restrict`](../transformers/restrict.md).

Fibers on different entities do not compose at the cell level directly.
They compose through the substrate's [closure rules](../../../../teaching/explanations/closure-rule.md) acting at bounded radius: a rule that reads cells from two adjacent entities' fibers produces predications that may be cells on either fiber or a third.

## What a Fiber does *not* carry

- **Not the entity's body.** The body of the source note is presentation content; the fiber is the algebraic projection.
  Body-extracted predications (link references, citation keys, kind-specific patterns the realization's interpretation rules know about) appear as cells in the fiber after interpretation, but the body's text is not a fiber field.
- **Not the file path.** The fiber's `entity` is the substrate's address.
  The note's filesystem path is *provenance* for that address — recorded in the fiber's provenance mapping for cells derived from that file — but the path is not part of the fiber's algebraic content.
- **Not a database row.** A fiber is a derived view, reconstructible from the source notes by re-interpretation.
  Caching fibers (in memory, in a database, in a derived store) is admissible per [source-of-truth](../../../../teaching/explanations/source-of-truth.md) as long as the cache is invalidated on note edits and re-derivation is deterministic.

## Construction

The only construction path conformant realizations admit at substrate-API surfaces is via [`interpret`](../transformers/interpret.md):

```
fiber = interpret(note, rules)
```

Direct construction (hand-building the `cells` mapping) is admissible inside the bodies of operators that produce fibers (operators are themselves invocations of interpretation rules) and in tests, but no high-level FARS surface SHALL admit hand-built fibers as input to inference operations.
The discipline preserves [source-of-truth](../../../../teaching/explanations/source-of-truth.md): the substrate content is authoritative; the fiber is its derived view.

## Multi-entity operations

The class describes one entity's worth of algebraic content.
Multi-entity operations work at the level of *fiber maps* — a mapping from `entity` to `Fiber` — under the substrate's locality discipline: a closure rule reads a bounded set of fibers from the map, produces a bounded set of fibers as output, and the whole-substrate state is the map's pointwise composition.

## Position

`Fiber` is the load-bearing intermediate object between [`load`](../morphisms/load.md) (substrate → `Note`s) and the algebra layer ([`compose`](../morphisms/compose.md), [`restrict`](../transformers/restrict.md), [`settle`](../transformers/settle.md), [`respond`](../transformers/respond.md)).
Every operator that performs inference takes fibers and returns fibers; every operator that touches the substrate's I/O surfaces takes notes and produces notes.
[`interpret`](../transformers/interpret.md) and its (planned) inverse projection from fiber to note are the only operators that cross the layer boundary.
