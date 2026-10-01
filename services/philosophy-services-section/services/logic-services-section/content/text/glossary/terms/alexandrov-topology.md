---
kind: definition
type: topology
name: Alexandrov topology
description: For a poset $(P, \leq)$, the Alexandrov topology has as open sets the up-sets — sets closed under going up along $\leq$ (or, in the dual convention, down-sets; the choice fixes a direction).
---

# Alexandrov topology

For a poset $(P, \leq)$, the **Alexandrov topology** has as open sets the up-sets — sets closed under going up along $\leq$ (or, in the dual convention, down-sets; the choice fixes a direction).

Finite topological spaces are equivalent to finite posets under this construction. The general statement — arbitrary poset corresponds to an arbitrary Alexandrov-topological space, and continuous maps correspond to monotone maps — is classical (modern statement: [@ayzenberg-magai2025] Appendix A.2 Proposition A.7).

In sheaf theory, a sheaf on $(P, \leq)_{\mathrm{Alex}}$ is exactly a functor $P \to \mathcal{V}$, and Alexandrov-topology sheaf cohomology agrees with the cellular cochain cohomology of [@curry2014] when $P$ is the face poset of a cell complex.

The Alexandrov topology is a key bridge between combinatorial poset theory and topological sheaf theory: it lets cohomological machinery developed for topological spaces apply directly to posets.
