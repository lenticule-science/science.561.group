---
type: narrative
discusses:
- cross-degree-identification
- stab-codim-formula
- hodge-isomorphism
recaps:
- bipartite-stratification-theorem
references:
- key: aksoy2025reimagining
  type: article
  - Aksoy, Sinan G.
  - Young, Stephen J.
  year: 2025
  title: Re-imagining Spectral Graph Theory
  eprint: '2504.10624'
  eprinttype: arxiv
---

# The cross-degree asymmetry — why codim sees what stab doesn't

The bipartite stratification theorem produces an asymmetric formula:

| Block type | Codim | Stab |
|---|---|---|
| Within-degree, $k_n^B = k$ | $k - 1$ | $\binom{k}{2}$ |
| Cross-degree, $k_n^B = k_{n+1}^B = 1$ | $1$ | $0$ |

Cross-degree identifications cost codim but produce no stab.

## The chain-condition surface explanation

The chain auto group $G$ on a chain complex satisfies $g_{n-1} d_n = d_n g_n$ — it's the subgroup of $\prod_n \mathrm{GL}(C_n)$ that commutes with $d$.

A within-degree block corresponds to a multi-dim eigenspace $\mathcal E_n^B$ inside a single $C_n$. Elements of $G$ that preserve $\mathcal E_n^B$ (and don't move it relative to other eigenspaces of $\Delta_n$) form a subgroup including all of $O(\mathcal E_n^B, Q_n) \subset \mathrm{GL}(C_n)$ on this block — the within-block rotations preserve the inner product, the chain conditions on adjacent degrees, etc. So $\dim \mathrm{stab}|_{\text{within-}d_n\text{ block}} = \dim O(\mathcal E_n^B) = \binom{k_n^B}{2}$ (orthogonal group on real $k$-dim space).

A cross-degree block of size 2 (one element from each of $C_n$ and $C_{n+1}$) corresponds to a 1-dim eigenspace in each. There's no rotation freedom *within* a 1-dim subspace. Cross-degree rotation between $\mathcal E_n^B \subseteq C_n$ and $\mathcal E_{n+1}^B \subseteq C_{n+1}$ is forbidden by the chain conditions: any such rotation would mix degrees, but $g \in G$ acts independently on each $C_n$.

So a cross-degree block of size 2 has stab dim 0.

The codim contribution, however, doesn't care about chain conditions: each eigenvalue equality $\sigma_i^2(\widetilde d_n) = \sigma_j^2(\widetilde d_{n+1})$ is one extra condition, regardless of whether the involved indices are within or across degrees. So a cross-degree pair contributes 1 to codim.

## Why this generalizes across categories

The asymmetry appears identically in:

- **Cellular**: the chain-condition argument above, directly.
- **Smooth Riemannian**: the de Rham complex has $d: \Omega^n \to \Omega^{n+1}$ between different chain degrees. Cross-degree identifications of $\Delta_n$ vs. $\Delta_{n+1}$ eigenvalues are constrained by Hodge supersymmetric isospectrality (= they're paired automatically).
- **Spectral triples**: Hochschild chains $C_n(\mathcal A)$ with differential $b: C_n \to C_{n-1}$. Same structure.
- **Parametric graph case** [@aksoy2025reimagining]: inner products on vertices vs. edges are different chain degrees. Cross-vertex/edge identifications are codim, not stab.

So the asymmetry isn't specific to any of these categories — it's a *categorical* feature of the chain complex structure with Hilbert lift.

## Hodge supersymmetric isospectrality

The deeper reason: the Hodge identity $\Delta_n d^* = d^* \Delta_{n+1}$ implies the nonzero spectrum of $\Delta_n$ on $\mathrm{im}\,d_n^*$ equals the spectrum of $\Delta_{n+1}$ on $\mathrm{im}\,d_n$ as multisets.

In bipartite multipartition terms: Hodge *forces* certain cross-degree identifications between adjacent operators. These forced identifications are the cross-degree blocks of $\Pi_{\min}$ — built into the chain complex's structure, not extra equations.

For the cross-degree codim/stab question: Hodge-forced cross-degree identifications don't cost codim (they're free, structural). They also don't cost stab (no extra rotation, since $\Delta_n$ and $\Delta_{n+1}$ act on different $C$'s).

*Beyond* Hodge-forced identifications, additional cross-degree blocks correspond to:
- Identifications between non-adjacent chain degrees (e.g., $\Delta_0$ eigenvalue = $\Delta_2$ eigenvalue) — not Hodge-forced.
- Identifications between an $\mathrm{im}\,d_n^*$-eigenvalue and a $\mathrm{harm}_n$-eigenvalue (a kernel-space coincidence).

These ARE extra equations on $Q$, costing codim 1 each. But they still don't produce extra stab dim because the chain auto cannot mix degrees.

So the asymmetry arises from:
1. Hodge supersymmetric isospectrality: cross-adjacent-degree identifications are automatic, costing nothing.
2. Chain auto = chain-degree-preserving: extra cross-degree identifications cost codim but not stab.

## Categorical formulation

A *Hodge-symmetric chain complex* is a graded Hilbert chain complex satisfying the supersymmetric isospectrality (which any chain complex with a Hilbert structure does, automatically). The cross-degree asymmetry is a feature of moduli of Hodge-symmetric chain complexes — universal across categories where this Hodge structure makes sense.

The categorical statement (conjectural):

> For any category of inputs with a Hilbert lift functor producing Hodge-symmetric chain complexes, the moduli of Hilbert lifts has the bipartite stratification with universal codim formula $\sum_B(|B|-1)$ and category-specific stab dim, with the cross-degree asymmetry: cross-degree blocks contribute to codim but not to category-specific stab if the category's automorphism group preserves chain degrees.

## Universal codim, category-specific stab

The asymmetry separates the two formulas: codim depends only on bipartite multipartition combinatorics (counts independent eigenvalue equalities), while stab depends on the chain-auto group $\mathrm{Aut}(X)$ (counts the available rotations preserving spectrum). Codim is universal across categories; stab is category-specific.

Univariate specialization ($N = 1$, single chain space) has only within-degree blocks, so the asymmetry collapses and the classical Arnold–Weinstein codim/stab formulas pair symmetrically.

## Verification on small cases

- $\partial \Delta^2$: 2-dim moduli; codim and stab match the formula.
- $\partial \Delta^3$: 6-dim moduli with 31 strata; cross-degree blocks at the uniform-weight stratum.
- $(2, 2)$ chain with $d_1$ iso: codim 1 in moduli for $\Pi_{\max}$ relative to $\Pi_{\min}$.

## Open

The categorical formulation as a theorem in derived-category language is open. See [cross-degree-asymmetry-origin](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/documents/articles/research-articles/questions/cross-degree-asymmetry-origin.md) for the conjecture and what's needed.
