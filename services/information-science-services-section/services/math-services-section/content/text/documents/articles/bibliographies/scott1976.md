---
type: bibliography
key: scott1976
reference-type: article
authors:
- Dana S. Scott
year: 1976
title: 'Data Types as Lattices'
journal: SIAM Journal on Computing
volume: '5'
number: '3'
pages: '522-587'
---

# Scott 1976 — Data Types as Lattices

*SIAM Journal on Computing* 5(3), 1976, pp. 522–587.

## Why this is central

This is the paper that gives denotational semantics its domains: a data type is
modeled as a complete lattice (or more generally a directed-complete partial
order), and a computable function between data types is modeled as a
**Scott-continuous** function — monotone and preserving joins of directed sets.
Scott proves the existence of solutions to recursive domain equations
(`D ≅ D → D`) inside this category, which is what makes the untyped lambda
calculus and self-referential program semantics well-defined. Every later use of
"Scott-continuous," "Scott domain," or "Scott topology" in denotational semantics
and domain theory traces to this construction.

## What it does not settle

The paper is about the category of domains and continuous functions needed for
semantics; it does not develop the general theory of closure operators or
transfinite ordinal-indexed iteration to a least fixed point (that is the
Knaster–Tarski / Cousot–Cousot line). It also predates, and is independent of,
any reading of Scott-continuity as a stratification device for a settling
process's closure ordinal.

## Bridges

- To [Scott continuity](../../../glossary/terms/scott-continuity.md) — the directed-join-preservation
  property this paper's continuous functions are named for.
- To [closure ordinal](../../../glossary/terms/closure-ordinal.md) — the transfinite-iteration
  concept that uses Scott-continuity to bound how far an iteration must climb.
