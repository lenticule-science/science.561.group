---

name: conceptual-dependency
date-created: 2026-03-08T00:00:00
introduces: term
keywords:
  - agential-semioverse
  - conceptual-stack
  - predicate-graph
description: "A relationship between formal structures where one cannot be defined, motivated, or implemented without the other. Distinguished from implementation dependency."
---

A conceptual dependency is a relationship between formal structures
where one structure requires another for its definition, motivation,
or implementation. Conceptual dependencies constitute the backbone
of the emsemioverse's layered architecture.

## Primary intension

A depends conceptually on B when A cannot be coherently stated
without reference to vocabulary, structures, or principles that B
provides.

## Secondary intension

### Distinguished from implementation dependency

An implementation dependency (plan X depends on plan Y) is about
sequencing of work. A conceptual dependency is about the logical
structure of ideas. Plan 0044 depends on plan 0045 (implementation);
the agential semioverse depends on the interactive semioverse
(conceptual). The first could be reordered; the second cannot.

### Typed relationships

Conceptual dependencies vary in strength and kind:

- **inspires**: weakest; the dependent structure could exist without
  the inspiration but would not have been conceived
- **grounds**: formal dependency; the dependent structure uses
  vocabulary from the grounding structure
- **extends**: the dependent structure adds to the grounding structure
  while preserving all its properties
- **instantiates**: the dependent structure implements the grounding
  structure as a concrete system
- **specifies-aspect-of**: the dependent structure defines one
  dimension of a larger method
- **practices**: the dependent structure uses a specification as its
  method
- **derives-from**: the dependent structure draws substance, practice,
  or design patterns from a source

### Directional

Conceptual dependency is directional: the agential semioverse
depends on the interactive semioverse, not the reverse. This
direction determines where content should live (it belongs at the
level of its dependencies, not at the level that depends on it)
and the order in which formalization should proceed (ground before
you extend).

## Distinguished from

- **Implementation dependency** (`depends-on` in plan frontmatter):
  sequencing of work, not logical structure
- **`requires`** (predicate graph edge): prerequisite for a page,
  which may be either conceptual or practical
- **`extends`** (predicate graph edge): already exists as a typed
  edge; conceptual dependency adds the full vocabulary of
  relationship types
