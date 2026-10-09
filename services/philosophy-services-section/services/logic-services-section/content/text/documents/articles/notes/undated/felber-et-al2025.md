---
kind: reference
authors: [Felber, Stephan, Hummes Flores, Bernardo, Rincon Galeana, Hugo]
year: 2025
title: "A Sheaf-Theoretic Characterization of Tasks in Distributed Systems"
venue: "arXiv:2503.02556"
description: S.
---

## Full citation

S. Felber, B. Hummes Flores, H. Rincon Galeana. "A sheaf-theoretic characterization of tasks in distributed systems." arXiv:2503.02556, 2025.

## Status

Abstract and key claims verified.

## Annotation

A directly-relevant modern parallel to the cohomological layer. Felber et al. introduce a **task sheaf** on a simplicial input/output complex such that:
- The task sheaf's **global sections** are exactly the task's terminating solutions.
- Its **cohomology** encodes the obstructions to finding solutions.

For our program this is the closest parallel to the cohomological-layer's CRDT Mayer–Vietoris bridge. The two frameworks differ in four ways:

1. **Fiber values.** Felber et al. use vector-space / $\mathbf{Ab}$-valued task sheaves; we use $\mathbf{Ab}$-valued sheaves on the paired-Priestley dual of a bilattice-fibered hyperdoctrine.
2. **Temporal structure.** Felber et al. use finite 1-categorical execution models; we use the transfinite 2-categorical settling.
3. **Primary question.** Felber et al. target task solvability; we target settling convergence and classification.
4. **Site base.** Felber et al. use a simplicial base; we use the bitopological site $(\mathbf{T}^*, J)$.

Approaches are complementary. The cohomological layer discusses the relationship in its CRDT-bridge content.
