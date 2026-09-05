---
type: question
status: open
explores: [stratification-ii, pataki-rank-stratum, schubert-invariant]
---

# Is the Stratification II closure poset Bruhat-like?

The closure poset of [Stratification II](../../../../glossary/terms/stratification-ii.md) combines:
1. The Pataki product chain (rank tuple coordinate-wise order).
2. Schubert orders on the Grassmannian fibers (kernel-pattern refinement within fixed rank).

These combine into a poset described algorithmically (in `src/stratification_ii.py`), but lack a clean combinatorial description.

## Question

Is there a combinatorial description of the Stratification II closure poset analogous to Bruhat order on flag manifolds, or as a clean product/wreath-product of partial orders, or as a poset with a known generating function?

## What's known

- **Pataki coarse closure** (no Schubert): product chain $\prod_n \{0, \ldots, m_n\}$ with coordinate-wise order. Clean.
- **Single Pataki stratum + Schubert refinement**: within a fixed rank-$r_n$ stratum, kernel patterns refine by Schubert order on the Grassmannian $\mathrm{Gr}(k_n, m_n)$ with respect to the chain filtration. Schubert order is well-known.
- **Combined**: closure relations across rank-drops AND kernel-pattern changes mix the two orders. Algorithmic description is given but not in clean closed form.

## Why Bruhat?

The chain filtration $0 \subseteq \mathrm{im}\,d_{n+1} \subseteq \ker d_n \subseteq C_n$ gives each $C_n$ a flag of length 3 (or shorter, if filtration steps coincide). Subspaces $K_n \subseteq C_n$ relative to this flag are parameterized by Schubert cells in a flag manifold. Bruhat order on flag manifolds describes the closure relations of Schubert cells.

The Pataki rank-drop dimension is *outside* the Schubert structure (it varies the kernel dim $k_n$, which Schubert order takes as fixed). So the combined order is Schubert × Pataki-on-each-degree, with mixing terms when rank changes.

This is similar to:
- **Wreath product of orders**: Pataki ≀ Schubert.
- **Bruhat-type**: parabolic Bruhat-like order on the union of Schubert cells over varying flag dimensions.

Whether the combined order matches a known combinatorial-poset structure is the question.

## Concrete approach

Compute the closure poset on small chain complexes:

- **Single chain space** ($N = 0$): no chain structure, just Pataki on a single $\mathrm{Sym}^+_m$. Closure = chain $0 \le 1 \le \cdots \le m$. Trivial.

- **$P_3$**: chain dims $(3, 2)$, ranks $(2)$, no $d_2$. Pataki on $\mathrm{Sym}^+_3 \times \mathrm{Sym}^+_2$ has closure $\{0,1,2,3\} \times \{0,1,2\}$ (Pataki coarse) refined by chain-Schubert. Compute fully and check structure.

- **$(2, 1)$ chain**: chain dims $(2, 3, 1)$, more interesting. The toolkit enumerates strata up to codim 4.

Look for:
- Order-theoretic invariants (Möbius function, characteristic polynomial).
- Whether the poset is graded, ranked, or has other regularity.
- Whether it admits an EL-shellability or other "nice" combinatorial structure.

## Implication for compactified moduli

A clean description of the Stratification II closure poset would feed directly into:
- The compactification $\overline{\mathcal M_{\mathrm{Lap}}}$ as a stratified space.
- Intersection cohomology computations.
- Possible decomposition theorems for the compactified moduli's cohomology.

If the closure poset is wreath-like or Bruhat-like, the compactified moduli inherits structural features from these poset categories.

## Connection to GIT / Borel–Serre

The classical Borel–Serre compactification of locally symmetric spaces has boundary stratified by parabolic-conjugacy types, with closure relations related to parabolic-inclusion. The Stratification II closure poset might admit a parallel description via parabolic-type data on the chain auto group $G$.

This would provide a *categorical* explanation of the closure poset in terms of standard Lie-theoretic / GIT data.
