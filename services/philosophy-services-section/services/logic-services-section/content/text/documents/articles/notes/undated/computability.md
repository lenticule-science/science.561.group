---
name: computability
description: The effective topos Eff = RT(K₁) — the theory of discrete deterministic computation over Kleene's first algebra. The minimum categorical level at which Church-Turing and Rice's theorem are internal theorems (not axioms). The base theory from which all other untyped subtheories of computing are derived by restriction.
component-of: computing
title: computability
---

# Computability

The core untyped theory of computing. $\mathbf{Eff} = RT(\mathcal{K}_1)$ is the realizability topos over Kleene's first algebra; its internal logic is IPC + CT + MP + WEM. Church-Turing holds internally because $\mathcal{K}_1$ is the initial Turing-complete PCA. Rice's theorem holds internally via Kleene's second recursion theorem. The subobject classifier $\Omega_{\mathbf{Eff}}$ is the internal Heyting algebra of r.e. propositions; its structure is isomorphic to the Medvedev lattice $\mathbf{M}$, making the lattice of subtheories of computability the filter lattice of $\mathbf{M}$.

The halting problem, Kleene's recursion theorems, and the arithmetical hierarchy are theorems of this theory. Resource bounds (complexity theory) and oracle jumps (arithmetical hierarchy as extensions) are not subtheories but a sub-restriction-category and an extension tower respectively.
