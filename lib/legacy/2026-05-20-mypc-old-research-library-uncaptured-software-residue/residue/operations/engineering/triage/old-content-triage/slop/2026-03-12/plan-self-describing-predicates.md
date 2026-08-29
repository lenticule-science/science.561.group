---
date: 2026-03-12
type: plan
topic: self-describing predicate bootstrap — thing.md and description.md as proof of concept
---

# Plan: Self-Describing Predicate Bootstrap

## Goal

Demonstrate that the semioverse is fully self-describing: every key used in
any file's frontmatter is itself defined by a file in the library, and the
engine can walk from any key to its semantics without hardcoded mappings.

## The two files

### `library/domains/general/terms/thing.md`

The base. No `kind:` (nothing to inherit from). Defines what a thing is and
declares the universal predicates. Uses `key-correspondence` to map its own
keys to external URIs.

Minimal frontmatter:
```yaml
description: The base of all things in the semioverse. Anything that can be differentiated from other things by its description.
defines: thing
aliases: [things]
key-correspondence:
  description:
    schema.org: schema:description
    rdfs: rdfs:comment
  name:
    schema.org: schema:name
    rdfs: rdfs:label
  aliases:
    schema.org: schema:alternateName
  kind:
    rdf: rdf:type
  tags:
    schema.org: schema:keywords
  creators:
    schema.org: schema:author
  date-created:
    schema.org: schema:dateCreated
  date-modified:
    schema.org: schema:dateModified
  version:
    schema.org: schema:version
  status:
    s561: s561:status
  defines:
    s561: s561:defines
  aliases:
    schema.org: schema:alternateName
  key-correspondence:
    s561: s561:keyCorrespondence
```

### `library/domains/general/terms/description.md`

A term that defines the `description` predicate. This closes the self-reference:
`thing.md` uses `description`, and `description.md` is the file the engine
finds when it needs to know what `description` means.

Minimal frontmatter:
```yaml
description: A human-readable statement that differentiates a thing from all other things. The minimum predicate for any thing in the semioverse.
defines: description
aliases: [descriptions]
key-correspondence:
  description:
    schema.org: schema:description
```

## What this demonstrates

1. Engine encounters `description:` in any file's frontmatter
2. Engine finds the file where `defines: description` — that's `description.md`
3. `description.md` has `key-correspondence.description.schema.org: schema:description`
4. Engine now knows `description` maps to `schema:description` for TTL emission
5. The semantic is in the library, not hardcoded in the engine

## What remains unsolved (intentionally deferred)

- How `thing.md` expresses that `description` is *required* (not just present)
- How the engine generates SHACL from resolved models
- The `required:` predicate and its defining file

These are the SHACL generation problem. Deferred until the graph is CRUDable.
