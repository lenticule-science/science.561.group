---
type: transformer
has-subject-type: entity
has-object-type: string
status: draft
aliases: [slug]
depends-on:
  - predication-fiber-algebra
  - entity-set
title: has-slug
description: The predicate of the substrate's predicate category whose cells record the canonical short name of a substrate atom.
---

# has-slug

The predicate of the substrate's predicate category whose cells record the canonical short name of a substrate atom.
This is the **addressability predicate**: without it, no atom can be cited from another atom's frontmatter, and the slug-resolution algorithm has nothing to resolve.

## Cell shape

$$(s, \texttt{has-slug}, S)$$

where $s$ is a substrate atom and $S \in \Sigma^*$ is a string matching the canonical slug syntax `[a-z0-9-]+`.

The cell sits in the predication-fiber-algebra over the mixed index $E^{\rm sub} \times \Sigma^*$ — a data-fiber extension of the standard $E \times E$ fiber to admit string-typed object-coordinate.

## Value domain

Bilattice $\mathbf{FOUR}$:

- $\mathbf{t}$ — substrate confirms the atom's canonical slug is $S$.
- $\mathbf{f}$ — substrate confirms the atom's slug is *not* $S$.
- $\bot$ — no slug recorded (atom unnamed).
- $\top$ — contested: multiple canonical slugs at $\mathbf{t}$.

## Constraints

**Addressability invariant.** Within a theory's atom-type partition, slug uniqueness: for any (theory, type, slug) at most one atom holds the slug at $\mathbf{t}$.
The slug-resolution algorithm requires unique resolution within scope; non-uniqueness is the cell-system's structural break.

**Per-atom uniqueness.** An atom may have at most one $\mathbf{t}$-valued slug cell.
Multiple $\mathbf{t}$-cells decay to $\top$.

## Self-application

This atom's own slug is `has-slug`.
The predicate self-applies: the cell $(\text{this-atom}, \texttt{has-slug}, \text{"has-slug"})$ is at $\mathbf{t}$.

## Aliases

The frontmatter key form `slug:` is the user-facing surface of this predicate.
When a frontmatter key `slug:` is encountered, the resolver consults `has-slug` as the canonical predicate atom.

## Required for

Every atom whose body is intended to be cited from another atom.
A substrate atom without a slug is invisible to the slug-resolution algorithm and effectively unreferenceable.

## Forced by

The slug-resolution algorithm requires unique resolution within a theory's atom-type partition.
Without `has-slug` as a substrate-resident predicate, the algorithm has nothing canonical to resolve against.

## Position in the self-typing bootstrap

`has-slug` is one of three predicates in the substrate's self-typing bootstrap core: `has-type`, `has-slug`, `specializes`.
These three are substrate-circular — each references the others or itself — and ground the recursion of "every key is substrate-resident."
The rest of the predicate catalog cites them.
