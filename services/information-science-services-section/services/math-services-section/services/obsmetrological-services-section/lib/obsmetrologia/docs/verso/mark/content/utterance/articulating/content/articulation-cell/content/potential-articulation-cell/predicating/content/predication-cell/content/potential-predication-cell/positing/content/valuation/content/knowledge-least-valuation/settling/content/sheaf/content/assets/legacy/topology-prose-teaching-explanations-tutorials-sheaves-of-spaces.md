---
title: "Sheaves of Spaces"
aliases:
  - "Sheaves of Spaces"
date-created: 2025-12-26
tags: []
introduces:
  - "Sheaves of Spaces"
type: overview
status: current
---
## Entry conditions

Use sheaves of spaces when your local data is itself homotopy-coherent (e.g., spaces or $\infty$-groupoids).

## Definitions

A **sheaf of spaces** assigns to each object in a site a space (or $\infty$-groupoid) and satisfies higher descent: compatible local data glues up to coherent homotopy.

A **geometric [morphism](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/morphism.md)** between higher topoi is given by adjoint [functors](../../categories/theories/ordinary-categories/morphisms/functor.md) respecting the higher structure.

## Vocabulary (plain language)

- **Space**: a homotopy type, not just a set.
- **Higher descent**: gluing with coherent homotopies, not strict equality.

## Symbols used

- $\infty$-groupoid: a space considered as a higher groupoid.

## Intuition

Sheaves of spaces keep track of homotopies during gluing, so local compatibility is up to homotopy rather than exact equality.

## Worked example

Assign to each open set the space of maps into a fixed space $K$. The gluing condition uses homotopies to identify overlaps.

## How to recognize the structure

- You need local data with higher homotopy information.
- Equality is too strict; coherence up to homotopy is required.

## Common mistakes

- Treating space-valued sheaves as set-valued sheaves.
