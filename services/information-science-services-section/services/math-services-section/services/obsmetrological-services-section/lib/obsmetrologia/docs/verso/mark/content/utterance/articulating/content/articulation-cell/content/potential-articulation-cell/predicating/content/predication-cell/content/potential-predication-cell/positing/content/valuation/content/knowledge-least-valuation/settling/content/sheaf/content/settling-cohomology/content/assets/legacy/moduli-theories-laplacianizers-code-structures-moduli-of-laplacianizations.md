---
type: object
class: orbifold
symbol: \mathcal M_{\mathrm{Lap}}
depends-on:
- hilbert-structure-cone
- gauge-group
- hodge-laplacian
see-also:
- moduli-of-laplacianizers
- stratification-i
- stratification-ii
references:
- key: arnold1995remarks
  type: article
  - Arnold, V. I.
  year: 1995
  title: Remarks on eigenvalues and eigenvectors of Hermitian matrices, berry phase, adiabatic connections and quantum Hall
    effect
  journal: Selecta Mathematica New Series
  volume: 1
  number: 1
  pages: 1–19
---

# Moduli of Laplacianizations

The central object of laplacianizers for a fixed chain complex.

## Definition

For a finite-dim graded chain complex $(C_\bullet, d)$ over $\mathbb R$, the moduli of Laplacianizations is the orbifold quotient
$$\mathcal M_{\mathrm{Lap}}(C_\bullet, d) := G \backslash \mathcal H,$$
where:
- $\mathcal H = \prod_n \mathrm{Sym}^+(C_n)$ is the open cone of [Hilbert structures](hilbert-structure-cone.md) on the chain complex.
- $G = \{(g_n) \in \prod_n \mathrm{GL}(C_n) : g_{n-1} d_n = d_n g_n\}$ is the [chain automorphism group](../morphisms/chain-auto-action.md).
- $G$ acts on $\mathcal H$ by $g \cdot Q := (g_n^T Q_n g_n)_n$.

A point $[Q] \in \mathcal M_{\mathrm{Lap}}$ is an equivalence class of Hilbert structures, equivalently a "Laplacianization" of $(C_\bullet, d)$ up to chain auto.

## Dimension

$\dim \mathcal M_{\mathrm{Lap}} = \dim \mathcal H - \dim G + \dim \mathrm{stab}_G(\text{generic}) = \sum_n \binom{m_n + 1}{2} - \dim G + \dim \mathrm{stab}_{\mathrm{generic}}$.

For the cellular case (full chain auto group), this simplifies to a count in terms of chain ranks $r_n$ and chain dims $m_n$ via the orbit-stabilizer count.

## Orbifold structure

$\mathcal M_{\mathrm{Lap}}$ is a real-algebraic orbifold: locally the quotient of a smooth Hilbert manifold by a finite-dim Lie group with discrete generic stabilizer. The orbifold points are at Hilbert structures with extra symmetry (= maximally-degenerate eigenvalue multipartitions), where the stabilizer in $G$ is positive-dim.

## Stratifications

$\mathcal M_{\mathrm{Lap}}$ carries two stratifications, distinct in nature:

**[Stratification I](stratification-i.md)** (intrinsic, in the SPD interior). Strata indexed by [bipartite multipartitions](teaching/explanations/bipartite-multipartition.md) $\Pi$. Codim $\sum_B(|B|-1)$, stab $\sum_B \sum_n \binom{k_n^B}{2}$. Closure poset = bipartite multipartition refinement lattice.

**[Stratification II](stratification-ii.md)** (extrinsic, at the SPD-cone boundary in $\overline{\mathcal H}$). Strata indexed by Pataki rank tuples + chain-Schubert invariants. Lives in $\overline{\mathcal M_{\mathrm{Lap}}} \setminus \mathcal M_{\mathrm{Lap}}$.

The interior of $\mathcal M_{\mathrm{Lap}}$ has Stratification I; its boundary in $\overline{\mathcal M_{\mathrm{Lap}}}$ adds Stratification II.

## Functoriality

A chain map $f: (C_\bullet, d) \to (C'_\bullet, d')$ induces a map of moduli — but its precise form is [open](questions/functoriality-of-moduli.md). The pullback of inner products is well-defined when $f$ is injective; for general chain maps, the relationship between $\mathcal M_{\mathrm{Lap}}(C)$ and $\mathcal M_{\mathrm{Lap}}(C')$ is a structural question.

## Special cases

- **Univariate** ($N = 1$, single chain space, single $d_1$): reduces to $O(n) \backslash \mathrm{Sym}^+_n$, the classical eigenvalue stratification of real symmetric positive-definite matrices ([@arnold1995remarks]).

- **$\partial \Delta^2$**: dim 2 orbifold, $\mathrm{Sym}^2(\mathbb R_{>0}) / S_2$.

- **$\partial \Delta^3$**: dim 6 orbifold, with 31 explicit strata enumerated.

- **(2, 1) chain complex of dims (2, 3, 1)**: dim ≤ 10, with the EDD computation showing extensive boundary structure (Stratification II contributing 4 components).

## Distinct from moduli of Laplacianizers

$\mathcal M_{\mathrm{Lap}}$ is moduli of *Hilbert structures on a fixed chain complex*. The categorical generalization, [moduli of Laplacianizers](moduli-of-laplacianizers.md) $\mathcal M_{\mathrm{Lap}}(\mathcal C, H^\bullet)$, parametrizes Hilbert lift functors $F: \mathcal C \to \mathbf{Hilb}^\mathbb{Z}$ with cohomology iso $\eta$, and is the natural object in the cross-category framework.
