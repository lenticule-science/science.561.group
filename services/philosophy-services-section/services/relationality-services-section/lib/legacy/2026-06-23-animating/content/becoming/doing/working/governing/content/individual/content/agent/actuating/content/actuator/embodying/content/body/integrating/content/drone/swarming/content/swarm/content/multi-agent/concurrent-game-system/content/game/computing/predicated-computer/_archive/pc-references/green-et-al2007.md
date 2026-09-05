---
type: reference
class: academic
status: cited
authors: [Green, Todd J., Karvounarakis, Grigoris, Tannen, Val]
year: 2007
title: "Provenance Semirings"
venue: "PODS '07: Proceedings of the 26th ACM SIGMOD-SIGACT-SIGART Symposium on Principles of Database Systems, 31–40"
---

## Source

T. J. Green, G. Karvounarakis, V. Tannen. "Provenance Semirings." In *Proceedings of the 26th ACM SIGMOD-SIGACT-SIGART Symposium on Principles of Database Systems (PODS '07)*, 31–40, 2007.

## Form

Conference paper.

## Content summary

Introduces *provenance semirings* as a uniform algebraic framework for tracking *why* a tuple is in a query's output. Each tuple is annotated with an element of a commutative semiring $K$; the relational-algebra operators are extended to operate on $K$-annotated relations: union and projection sum annotations (records that a tuple has multiple derivations); join and selection multiply annotations (records that a tuple's derivation depends jointly on its constituents). Different choices of $K$ recover different provenance notions: the natural numbers $\mathbb{N}$ count derivations (bag semantics); the Boolean semiring $\mathbb{B}$ recovers set semantics; the *why-provenance* semiring tracks the set of source-tuple sets that derived the result; the *how-provenance* semiring (the polynomial semiring $\mathbb{N}[X]$ over source identifiers) tracks the full algebraic shape of the derivation. Datalog's least-fixed-point semantics extends to $K$-semirings under suitable conditions, giving provenance for recursive queries.
