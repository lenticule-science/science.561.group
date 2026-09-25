---
name: note
description: "The substrate-record holding one entity's presentation-layer content: the parsed frontmatter mapping, the body string, the substrate-relative path, the file's modification time."
type: definition
class: record
depends-on: [flatfile, frontmatter-as-presentation, source-of-truth]
see-also: [fiber, interpret, load, witness]
title: note
---

# Note

The substrate-record holding one entity's *presentation-layer* content: the parsed frontmatter mapping, the body string, the substrate-relative path, the file's modification time.
A `Note` is what [`load`](../morphisms/load.md) produces from a `.md` file on disk; it is what [`interpret`](../transformers/interpret.md) consumes to produce a [`Fiber`](fiber.md).
Every `Note` corresponds 1:1 with a file in the [flatfile](../../flatfile/flatfile.md) substrate; per [source-of-truth](../../../../teaching/explanations/source-of-truth.md), the file is authoritative and the `Note` is its in-memory parse.

## Required fields

Every conforming realization SHALL hold, for each `Note`:

- **`slug`** — the entity's *short name*: the tail of its path under the substrate's canonicalization (e.g. the filename stem, or `<parent>-index` for a directory's `_index.md` sentinel).
  Canonicalization is realization-defined but SHALL be deterministic.
  Slugs are NOT required to be unique across the substrate; the substrate's unique address is `path` (see *Path-addressable*).
  The slug exists for human-friendly short reference, not as a primary key.
- **`dir`** — the enclosing-subdivision of the substrate (e.g. a directory tree position, a logical scope path, a type-grouping prefix).
- **`type`** — the entity's note type (`concept`, `theorem`, `morphism`, …).
  Derived by default from `dir` when the substrate's directory tree carries type-grouping conventions; an explicit `type:` in the frontmatter SHALL override.
- **`fm`** — the parsed frontmatter as a mapping.
  Content is presentation-layer per [frontmatter-as-presentation](../../flatfile/frontmatter-as-presentation/frontmatter-as-presentation.md); not yet a [fiber](fiber.md).
- **`body`** — the post-frontmatter content, as text.
  Format is realization-defined (markdown by default convention; other body formats are admissible as long as the realization's interpretation rules know how to read predications from them).
- **`path`** — the substrate-relative path identifying the file.
  The substrate's address for this entity.
- **`mtime`** — the file's modification time.
  Used by realizations that maintain caches keyed on freshness.

## Invariants

- **Immutable.** A `Note` is a value, not a handle.
  Edit operations (rename, frontmatter-set, body-rewrite) act on the underlying file and on subsequent reads produce a *new* `Note`; an existing `Note` value never changes after construction.
- **Path-addressable.** Two `Note`s with the same `path` are the same entity in the substrate; their content is the file's content at the time of read.
  The path is the substrate's address.
- **Slug-canonical.** Slug canonicalization is deterministic per the realization's rules.
  Slugs are the path tail and are NOT required to be unique; same-tail records are normal (e.g. `personnel/cassia-lorne.md` and `personas/cassia-lorne.md` legitimately share the slug `cassia-lorne`).
  The substrate's namespace is the path; the slug is its short form.
  References between records resolve by path-suffix match: the reference's component list matches every record whose path ends with those components.
  Zero matches is a broken reference; more than one is an ambiguous reference, which the writer disambiguates by lengthening the reference to include more enclosing path.
  The substrate detects ambiguous references at reference sites and emits a witness; it does NOT diagnose same-tail records as collisions.
- **Type-derived.** Type defaults from `dir`; explicit frontmatter `type:` overrides.
  A `Note` whose derived type is ambiguous (the substrate's type-grouping conventions don't determine one) carries `type=""` and the realization's validation surfaces the case.

## What a `Note` does *not* carry

- **Not a fiber.** The `fm` mapping is presentation content; a `Note` is *not* a `Fiber`.
  Operators that need bilattice-valued cells run [`interpret`](../transformers/interpret.md) first.
- **Not a stable hash.** The `Note`'s identity is its `path`.
  When the file's body or frontmatter changes, the new `Note` supersedes the old at the same path.
  Hash discipline applies to *fiber*-level content (the canonicalized algebraic projection); note-level identity is path-based.
- **Not a graph node.** Edges between entities are derived from the note's frontmatter (relation keys like `depends-on`, `see-also`) and body (links to other entities).
  The `Note` carries the raw content; the [`Edge`](edge.md) record — produced by the index layer — is the typed graph projection of the relations the note carries.

## Position

`Note` is the foundational presentation-layer record.
Every operator that crosses the substrate's I/O surface — read or write — works in terms of `Note`s.
The algebra layer ([`Fiber`](fiber.md), [`compose`](../morphisms/compose.md), [`restrict`](../transformers/restrict.md), [`respond`](../transformers/respond.md), [`settle`](../transformers/settle.md)) works in terms of `Fiber`s; [`interpret`](../transformers/interpret.md) is the bridge.
Edit operators (move, rename-frontmatter-key, rewrite-frontmatter-slug) take a `Note` as input, mutate the file on disk, and on subsequent loads produce a new `Note` from the updated file.
