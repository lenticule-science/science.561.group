---
date: 2026-03-12
type: slop
topic: frontmatter as Fregean secondary intension; predicate-as-key pattern; merging philosophical and schema files
---

# Fregean Frontmatter

## The Org-roam antecedent

From emsenn's `node-description` property work (2025-10-06):

> "One way I'm thinking of this property is as a node's secondary intension
> toward relational dynamics, and given that, the structure that seemed best
> was Fregean subject-predicate-object triplets, where each part of the
> triplet is another node in the database."

The `node-description` field in Org-roam stored a list of (predicate . object)
pairs, where both predicate AND object are nodes (identified by ID + sign).
The subject is always implicit: it's the file itself.

This is standard RDF. What's distinctive is that the predicate is itself a
node — a first-class object in the graph with its own definition.

## The predicate-as-key pattern

The Org-roam approach was:

```
title: "essay about pie"
fun-essay: pie
```

NOT:

```
title: "essay about pie"
kind: fun-essay
topic: pie
```

The difference: in the second form, `kind` and `topic` are generic structural
keys, and `fun-essay` and `pie` are values. In the first form, `fun-essay` IS
the predicate. The key name carries the semantic content.

This means:
- A file is a `fun-essay` because it HAS a `fun-essay` predicate, not because
  it has `kind: fun-essay`
- `fun-essay: pie` means "this document stands in the `fun-essay` relation to
  `pie`"
- The key `fun-essay` points to a node in the graph that defines the predicate

In RDF terms: `fun-essay` would resolve to a predicate IRI defined somewhere
in the library. Every YAML key in the frontmatter IS a predicate IRI (or
shorthand for one).

## Consequence for thing.md

A `thing.md` kind file does NOT need `kind: thing`. It IS a thing by having a
`description` predicate. And it defines the `thing` predicate vocabulary by
existing and being linked to.

The philosophical and schema functions merge because:
- The body defines WHAT the concept is (prose definition)
- The frontmatter IS an instance of the thing's own secondary intension
- The frontmatter structure DEMONSTRATES the predicate schema by being an example

So `thing.md` might look like:

```yaml
---
description: >
  A thing is a separation from everything, distinguished by its qualities.
  The minimum differentiator: any library node is a thing if it has this field.
---

A thing must have a description. That is the only invariant at this level.
Description is what grants perceptibility — in MUD terms, it is what `look`
returns; in graph terms, it is what makes a node non-blank.

All further kinds extend thing by adding predicates.
```

The frontmatter doesn't say `kind: thing` — it simply IS a thing (has
`description`). It defines the thing predicate by existing. The SHACL shape
for `thing` is then: "must have at least one `description` triple."

## What this means for YAML frontmatter in the library

Every frontmatter key is a predicate. The predicate vocabulary is:
- Defined by kind/predicate declaration files in the library
- Validated by SHACL shapes generated from those declarations
- Extractable to RDF triples mechanically: for each key-value pair, emit
  `<file-iri> <predicate-iri> <value>`

For values that are wikilinks (`[other-file](other-file)`), the object is another node.
For literal values (strings, dates, booleans), the object is a typed literal.
For lists, emit one triple per item.

## Predicate definition files

A predicate like `description` would have a definition file somewhere in the
library (perhaps `domains/general/predicates/description.md` or similar):

```yaml
---
description: A string that makes a thing perceptible and differentiable.
required-by: thing
datatype: string
min-length: 1
---

The description predicate is the minimum surface of a thing...
```

This is a self-describing predicate: it has a `description` itself (it's a
thing), and it also declares the constraints on uses of `description`.

## The engine consequence

Instead of dispatching by `kind` field value, the engine dispatches by
WHICH PREDICATES ARE PRESENT:

1. Extract all frontmatter keys from a file
2. Look up which kind shapes declare those predicates as required/defining
3. Validate against all matching shapes
4. Generate TTL with the resolved predicate IRIs

This is how RDF/SHACL actually works: shape targets can be by `sh:targetClass`
(explicit type declaration) or by `sh:targetSubjectsOf` (implicit: any node
that has this predicate). We can use both: explicit `kind` for strongly-typed
objects, implicit presence-of-predicate for flexible typing.

## The merged file design

Given all this, a `thing.md` that is BOTH the philosophical definition AND
the schema declaration:

```yaml
---
description: >
  A thing is a separation from everything, distinguished by its qualities.
  The base kind: any library node with a description is a thing.
shape:
  required:
    - description
  optional:
    - kind
    - name
    - date-created
    - date-modified
    - tags
    - creators
    - version
---
```

The `shape` field in the frontmatter IS the schema — it declares what
predicates instances of this kind must/may have. The engine reads `shape`
to generate the SHACL TTL file.

This keeps philosophical content and schema in one file, makes the file
self-describing (it has `description`, so it is a thing), and the `shape`
key functions as the kind's SHACL spec in a readable format.

## On the fields emsenn listed

Things should have (per conversation 2026-03-12):
- `description` — REQUIRED, the minimum differentiator
- `kind` — OPTIONAL, explicit type declaration (supplements predicate-presence typing)
- `name` — OPTIONAL, display name (vs `title` — TBD whether these collapse)
- `date-created` — OPTIONAL
- `date-modified` — OPTIONAL
- `tags` — OPTIONAL, list
- `creators` — OPTIONAL, list of nodes
- `version` — OPTIONAL

Note: `title` appears in virtually all existing library files. Relationship
between `name` and `title` needs resolution. TAB used `name`; the semiotic
specs use `title`. Probably: `title` for documents, `name` for entities.
Or: they're the same predicate under different signs — to be decided.
