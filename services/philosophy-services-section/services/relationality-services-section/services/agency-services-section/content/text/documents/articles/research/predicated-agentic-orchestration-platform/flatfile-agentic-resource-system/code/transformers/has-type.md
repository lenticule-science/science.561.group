---
type: transformer
has-subject-type: entity
has-object-type: structure
status: draft
aliases: [type, kind]
depends-on:
  - predication-fiber-algebra
  - entity-set
title: has-type
description: The predicate of the substrate's predicate category whose cells record an atom's type-classifier — what kind of substrate-thing the atom is.
---

# has-type

The predicate of the substrate's predicate category whose cells record an atom's **type-classifier** — what kind of substrate-thing the atom is.
Without `has-type`, atoms cannot be located in component directories (each component holds atoms of specific types) and the substrate's type-discipline has no enforcement surface.

## Cell shape

$$(s, \texttt{has-type}, T)$$

where $s$ is a substrate atom and $T$ is a type-classifier entity — one of `{concept, object, morphism, claim, theorem, conjecture, question, example, narrative, remark, reference, theory-index, specification, predicate-definition, ...}
`.
The type-classifier set is itself substrate content: each type is its own atom in the corpus.

## Value domain

Bilattice $\mathbf{FOUR}$:

- $\mathbf{t}$ — substrate confirms the atom's type is $T$.
- $\mathbf{f}$ — substrate confirms the type is not $T$.
- $\bot$ — no type recorded.
- $\top$ — contested: multiple types at $\mathbf{t}$.

## Constraints

**Per-atom uniqueness.** An atom holds exactly one $\mathbf{t}$-valued type cell.
Multiple $\mathbf{t}$-cells decay to $\top$ — a type ambiguity that must be resolved.

**Type-classifier substrate-residency.** The type-classifier set is substrate content; each type-value $T$ is itself a substrate atom with its own definition.
Type-classifier extension is a substrate edit, not a code change.

## Self-application

This atom's own type is `predicate-definition`.
The cell $(\text{this-atom}, \texttt{has-type}, \text{"predicate-definition"})$ is at $\mathbf{t}$.
The type-classifier `predicate-definition` is itself an atom in the substrate's type-classifier set.

## Aliases

The frontmatter key forms `type:` and `kind:` are the user-facing surfaces of this predicate.
When a frontmatter key `type:` or `kind:` is encountered, the resolver consults `has-type` as the canonical predicate atom.

## Required for

Every atom in the substrate.
Type is the addressability prerequisite — an atom without a type cannot be located in its proper component directory.

## Forced by

The substrate's component-directory discipline: atoms live in directories indexed by type (`concepts/`, `objects/`, `morphisms/`, etc.).
Without `has-type` as a substrate-resident predicate, directory placement has no grounding.

## Position in the self-typing bootstrap

`has-type` is one of three predicates in the substrate's self-typing bootstrap core, alongside `has-slug` and `specializes`.
These three are substrate-circular and ground the recursion of "every key is substrate-resident."
