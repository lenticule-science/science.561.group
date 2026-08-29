---
title: "Chain Complex"
aliases:
  - "chain complex"
  - "chain complexes"
  - "cochain complex"
  - "differential"
date-created: 2026-08-26
tags: []
defines:
  - "Chain Complex"
  - "cochain complex"
type: term
---

A chain complex is a sequence of [abelian groups](./abelian-group.md) or [vector spaces](./vector-space.md) $C_0, C_1, C_2, \ldots$ together with maps $d_n: C_n \to C_{n-1}$, called the differential, satisfying $d_{n-1} \circ d_n = 0$ for every $n$. Elements of $\ker d_n$ are called cycles, elements of $\mathrm{im}\, d_{n+1}$ are called boundaries, and $d_{n-1} d_n = 0$ says every boundary is a cycle: $\mathrm{im}\, d_{n+1} \subseteq \ker d_n$. The homology of the complex measures the gap between the two,

$$H_n(C_\bullet) := \ker d_n / \mathrm{im}\, d_{n+1},$$

a cycle's homology class records it up to adding a boundary. A cochain complex is the same data with arrows raised rather than lowered — $d^n: C^n \to C^{n+1}$ with $d^{n+1} d^n = 0$ — and its cohomology $H^n(C^\bullet) := \ker d^n / \mathrm{im}\, d^{n-1}$ is defined dually; a chain complex with $C_n := C^{-n}$ recovers a cochain complex and vice versa, so the two are the same structure under a sign convention on the grading.

The condition $d^2 = 0$ is the algebraic residue of "the boundary of a boundary is empty": the singular or simplicial chains of a topological space, with $d$ the alternating sum of face maps, satisfy it because each codimension-$2$ face of a simplex is counted twice with opposite signs when it is reached via two different codimension-$1$ faces. This is the source example that the abstract definition axiomatizes; the [Dold–Kan correspondence](./dold-kan-correspondence.md) makes the connection to [simplicial](./simplicial-set.md) data precise, exhibiting every chain complex of abelian groups (concentrated in non-negative degrees) as coming from a simplicial abelian group in exactly this way.

Chain complexes are the basic objects of homological algebra, and live naturally in an [abelian category](./abelian-category.md) — the category $\mathbf{Ch}_{\bullet}(\mathcal A)$ of chain complexes over any abelian category $\mathcal A$ is again abelian, with kernels, cokernels, and exactness computed degreewise. A chain map $f: C_\bullet \to C'_\bullet$ is a family of maps $f_n: C_n \to C'_n$ commuting with the differentials ($f_{n-1} d_n = d'_n f_n$); it induces maps on homology, and a chain map inducing an isomorphism on all homology groups is a quasi-isomorphism — the basic notion of "sameness up to homology" used throughout the subject.

When each $C_n$ carries an inner product, making it a [Hilbert space](./hilbert-space.md), the differential has a Hilbert adjoint $d_n^*: C_{n-1} \to C_n$, and the Hodge Laplacian $\Delta_n := d_{n+1} d_{n+1}^* + d_n^* d_n$ realizes the homology $H_n(C_\bullet)$ concretely as its kernel — the harmonic representatives. This is the analytic route into chain complexes used throughout the Laplacianizer program.
