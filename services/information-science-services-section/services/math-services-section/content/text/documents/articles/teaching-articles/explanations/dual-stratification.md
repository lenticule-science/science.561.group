---
type: explanation
article-kind: narrative
discusses: [stratification-i, stratification-ii, hilbert-degeneracy-stratification]
recaps: [bipartite-stratification-theorem, hilbert-degeneracy-stratification]
---

# The dual stratification — interior vs. boundary, spectral vs. kernel

The moduli of Laplacianizations $\mathcal M_{\mathrm{Lap}}$ carries two distinct stratifications: one in the SPD interior, indexed by spectral data of $\Delta(Q)$; one at the SPD-cone boundary, indexed by rank/kernel data of $Q$.

## Two stratifications, two domains

[Stratification I](../../../../glossary/terms/stratification-i.md) lives in the SPD interior $\mathcal H = \prod_n \mathrm{Sym}^+(C_n)$. Strata are indexed by [bipartite multipartitions](../../../../glossary/terms/bipartite-multipartition.md) of the Hodge spectrum. The data: which squared singular values of $\widetilde d_n$ coincide.

[Stratification II](../../../../glossary/terms/stratification-ii.md) lives at the SPD-cone boundary $\partial \overline{\mathcal H}$. Strata are indexed by Pataki rank tuples + chain-Schubert invariants. The data: which $Q_n$ become rank-deficient and how their kernels intersect the chain filtration.

Inside $\mathcal H$, only Stratification I sees structure — Stratification II is concentrated at codim-$\infty$ (the boundary). At the boundary $\partial \overline{\mathcal H}$, Stratification I doesn't apply because $\Delta(Q)$ is not well-defined (the inner product $Q$ is degenerate).

So the two stratifications are *complementary*: one in the interior, one at the boundary, with no overlap on $\overline{\mathcal H}$.

## Spectral vs. kernel data

| Aspect | Stratification I | Stratification II |
|---|---|---|
| Source data | spectrum of $\Delta(Q)$ | rank/kernel of $Q$ |
| Gauge invariant | yes (spectrum is gauge-invariant) | no (kernel has frame data) |
| Intrinsic to chain complex | yes | yes (chain filtration enters) |
| Refinable by | within-degree multiplicity, cross-degree identification | chain-Schubert intersection invariants |
| Closure poset | bipartite multipartition refinement | Pataki product chain × Schubert orders |

Stratification I is "intrinsic to the Hodge structure" in the sense that it depends only on the spectral data of the resulting Laplacian. Stratification II is "extrinsic to the linear ambient" — it sees how the SPD cone is embedded in the surrounding linear space.

## Why the boundary stratification matters

For compact moduli problems, the closure $\overline{\mathcal M_{\mathrm{Lap}}}$ in some compactification matters. The natural compactification adds Stratification II at the boundary — a Borel–Serre-style stratified compactification.

Several invariants of $\overline{\mathcal M_{\mathrm{Lap}}}$ pick up *both* stratifications:
- **Euclidean Distance Degree (EDD)** of a stratum closure: critical points include both interior critical points (Stratification I) and boundary critical points (Stratification II). The (2, 1) chain EDD = 40 result decomposes as 1 Stratification-I component + 4 Stratification-II components.
- **Intersection cohomology** of $\overline{\mathcal M_{\mathrm{Lap}}}$.
- **Top forms / volume forms** on compactified moduli.

So global invariants see both stratifications; the dual structure is essential for any global computation.

## How they interact: mixed strata

In the algebraic closure $\overline{\mathcal M_{\mathrm{Lap}}}$, the two stratifications can *intersect*. A **mixed stratum** is a locus where:
- Some $Q_n$ becomes rank-deficient (Stratification II behavior).
- The remaining spectrum has a non-trivial multipartition (Stratification I behavior on the surviving piece).

The (2, 1) chain singular components 1 and 3 are mixed: $Q_1$ rank-deficient with kernel containing $\mathrm{im}\,d_2$ (Stratification II) AND additional cubic conditions on the surviving spectral structure (Stratification I).

The systematic study of mixed strata is [open](../../research-articles/questions/mixed-stratification-strata.md). They sit at the intersection of the two refinement orders and have a richer structure than either alone.

## Why two stratifications, structurally

The reason for two stratifications can be traced to the *two* sources of structural information about a Hilbert chain complex:

1. **The spectrum** of the Hodge Laplacian (= spectral data of $\Delta(Q)$).
2. **The metric structure** on the chain spaces (= rank/kernel data of $Q$ itself, plus its geometric position relative to the chain filtration).

For a Hilbert structure $Q$ in the SPD interior, both are non-degenerate; the spectral data dominates and gives Stratification I. At the boundary, the metric structure degenerates (rank drops), the Laplacian fails to be self-adjoint with discrete spectrum, and the relevant data shifts to the rank/kernel structure of $Q$ — giving Stratification II.

## Compactified moduli as a complete object

A natural picture: $\overline{\mathcal M_{\mathrm{Lap}}}$ as a stratified space with:
- **Open dense interior**: Stratification I generic stratum (codim 0, simple bipartite multipartition).
- **Interior boundary**: higher-codim Stratification I strata (eigenvalue degeneracies in SPD interior).
- **Outer boundary**: Stratification II strata (Hilbert-structure degeneracies).
- **Mixed boundary**: intersections of interior strata (Stratification I) and boundary strata (Stratification II) at the algebraic closure.

This compactified picture is the right ambient for global computations and parallels the Borel–Serre boundary structure of locally symmetric spaces.

## Analog in other categories

The dual-stratification picture should extend to other Laplacianizer categories:

- **Smooth Riemannian**: Stratification I = eigenvalue multipartition strata in the moduli of metrics. Stratification II analog = boundary of the moduli where metrics become degenerate (collapse to lower dim, become incomplete, etc.). Open whether the Einstein moduli's boundary admits this structure.

- **Spectral triples**: Stratification I on $D$-spectra (interior). Stratification II analog: degenerations where the spectral triple becomes "almost-not-a-spectral-triple" — e.g., $D$ losing compact resolvent, $\mathcal A$-action becoming ill-defined.

- **$p$-Banach (nonlinear)**: Stratification I on variational eigenvalues. Stratification II analog: boundary where Banach norms become non-strictly-convex (unit ball stops being a smooth strictly-convex body).

In each case, the dual-stratification picture is structurally consistent: there's an interior stratification by spectral data and a boundary stratification by structural-degeneracy data.

## Ambient for global computations

For any global computation of moduli — compactification, integration of forms, intersection numbers — the relevant ambient is the *stratified pair* (interior + boundary), not $\mathcal H$ or $\overline{\mathcal H}$ alone. Concrete instance: the (2, 1) chain EDD = 40 decomposes over both stratifications ([edd-computation-on-2-1-chain](../examples/edd-computation-on-2-1-chain.md)).
