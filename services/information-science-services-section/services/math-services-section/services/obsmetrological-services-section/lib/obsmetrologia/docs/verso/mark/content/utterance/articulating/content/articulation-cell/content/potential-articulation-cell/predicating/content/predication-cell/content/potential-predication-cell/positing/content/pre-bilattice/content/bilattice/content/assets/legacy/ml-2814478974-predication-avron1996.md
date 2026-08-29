---
type: reference
year: 1996
title: "The Structure of Interlaced Bilattices"
venue: "Mathematical Structures in Computer Science 6(3), 287–299"
---

## Full citation

A. Avron. "The Structure of Interlaced Bilattices." *Mathematical Structures in Computer Science* 6(3), 287–299, 1996.

## Status

Pending direct access. Cited via secondary literature ([@fitting2006], [@rivieccio-et-al2017]); the representation theorem itself is well-summarized in subsequent surveys.

## Annotation

The **Avron representation theorem.** Every interlaced bilattice $\mathbf{B}$ — that is, a bilattice in which the truth-meet/join and knowledge-meet/join each distribute over the other in a specific interlacing pattern — is isomorphic to the [twist product](../objects/twist-product.md) $\mathbf{L}^\bowtie$ of two lattices $\mathbf{L}_1, \mathbf{L}_2$, with the bilattice operations given by the standard twist-product formulas.

For the program: foundational result — see [Avron representation](../theorems/avron-representation.md). The framework everywhere works with twist products $\mathbf{L}^\bowtie = \mathbf{L} \times \mathbf{L}^{\mathrm{op}}$ rather than abstract interlaced bilattices, and Avron's theorem is what licenses this without loss of generality.

Two structural consequences used throughout:
- **The [predication fiber algebra](../objects/predication-fiber-algebra.md) $A_q = \mathbf{L}^{\bowtie\, E \times E}$ is automatically interlaced**, so all the interlacing-based proofs of Fitting and others apply directly. The framework does not need to re-prove interlacing — Avron supplies it as a structural property of the construction.
- **Restricting to distributive bilattices is automatic**: when $\mathbf{L}$ is a distributive (residuated) lattice, $\mathbf{L}^\bowtie$ is a distributive interlaced bilattice. The [Jung–Rivieccio Priestley duality](../theorems/jung-rivieccio-duality.md) of distributive bilattices is then directly available — see [@jung-rivieccio2012].

Together with [@kalman1958] (twist-product origin) and [@busaniche-cignoli2014] (residuation on $\mathbf{L}^\bowtie$), Avron's theorem closes the loop: every distributive bilattice with the required structural properties is the twist product of a residuated lattice, and the framework can specialize to that case without loss of generality.
