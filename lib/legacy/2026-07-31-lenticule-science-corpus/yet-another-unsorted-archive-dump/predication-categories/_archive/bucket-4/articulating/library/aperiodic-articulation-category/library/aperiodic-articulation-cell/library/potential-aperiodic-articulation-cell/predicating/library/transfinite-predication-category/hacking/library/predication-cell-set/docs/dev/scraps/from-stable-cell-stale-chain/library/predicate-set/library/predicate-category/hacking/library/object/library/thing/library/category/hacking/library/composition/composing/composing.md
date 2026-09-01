---
title: Composing
description: The general operation of producing one record by inlining slices from many source records. Composing's domain is a finite set of source records plus a composition spec; its codomain is a single new record whose body is the slices joined per the spec and whose frontmatter derives-from is the union of source paths. Distinct from the skill-composition morphism `composes`, which is between skills.
gerund: composing
agent-noun: composer
imperative: compose
derives-from:
  - ../structures/resource-file.md
  - derives-from.md
---

A composing transformer takes a finite set of source records and a composition spec, and produces one target record whose body is the spec-determined join of slices from the sources and whose frontmatter `derives-from` is the union of the source records' paths. The composition is *static*: the spec names which sources contribute which slices; the slices are inlined verbatim or via declared rewrites; the target record is itself a lintable resource record.

## Domain and codomain

- **Domain:** a tuple `(sources, spec)`. `sources` is a finite set of source record paths. `spec` is a structured composition recipe declaring the target's sections, each section's source slice (a source path plus a region selector), and any per-slice rewrites applied during composition.
- **Codomain:** a target record. Its frontmatter `derives-from` lists every source's path. Its body is the ordered concatenation of the spec's sections.

## Morphological forms in naming grammar

- `gerund: composing` heads skills built on this transformer: `composing-a-session-brief`, `composing-a-monograph`, etc.
- `agent-noun: composer` heads agents that invoke such skills: `composer-of-a-session-brief`.
- `imperative: compose` heads scripts that body such skills: `compose-a-session-brief.mjs`.

## Distinction from `composes`

The `composes` transformer is between *skills*: skill A composes skill B means A's steps invoke B. This `composing` transformer is between *records*: a composer agent takes many source records and produces one target record. The two are categorically distinct: `composes` records the call surface of skill invocation; `composing` records the content surface of record production.

## Preservation conditions

A composing invocation is conformant when:

- Every source path in the resulting `derives-from` list exists.
- The target body is the slices' ordered concatenation per the spec, with no slice from outside the spec's source list.
- Each per-slice rewrite, if declared, is a declared transformer with its own preservation conditions checked.
- The target record passes the resource-file lint manifest at its declared role-class.
