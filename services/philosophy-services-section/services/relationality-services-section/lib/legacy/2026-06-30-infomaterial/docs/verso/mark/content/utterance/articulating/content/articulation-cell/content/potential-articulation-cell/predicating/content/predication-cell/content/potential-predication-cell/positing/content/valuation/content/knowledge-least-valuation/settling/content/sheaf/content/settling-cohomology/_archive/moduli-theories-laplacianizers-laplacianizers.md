---
title: "Laplacianizers"
description: "Hodge-theoretic moduli of Hilbert lifts of cohomology theories. A pair (𝒞, H•) is Laplacianizable if it admits a Laplacianizer — a functor 𝒞 → graded Hilbert chain complexes with a chain differential and a natural iso witnessing the cohomology. The moduli of Laplacianizers carries a stratified-orbifold structure indexed by spectral multipartitions, with universal codim formula, and a dual Pataki rank stratification at the SPD-cone boundary."
component-of: moduli
---

# Laplacianizers

The Hodge-theoretic moduli theory of *Laplacianizers* — Hilbert chain-complex realizations of cohomology theories. A pair $(\mathcal{C}, H^\bullet)$ — a category and a graded-vector-space-valued cohomology theory — is **Laplacianizable** if it admits a **Laplacianizer**: a triple $\mathfrak{L} = (F, d, \eta)$ with $F: \mathcal{C} \to \mathbf{Hilb}^{\mathbb{Z}}$, $d^2 = 0$, and $\eta: H^\bullet \xrightarrow{\sim} H_\bullet(F, d)$ a natural iso. See [concepts/laplacianizer.md](concepts/laplacianizer.md) (the object) and [concepts/laplacianizability.md](concepts/laplacianizability.md) (the property).

When a Laplacianizer exists, it is *not unique*. The moduli of Laplacianizers is a stratified orbifold whose strata are indexed by *eigenvalue-multiplicity invariants* of the associated [Hodge Laplacian](concepts/hodge-laplacian.md). The univariate case (single chain space, single Laplacian) is **classical** — Arnold (1995), Shapiro–Vainshtein (1995), Weinstein (2020). The bipartite extension to multi-operator chain complexes is this theory's structural contribution: explicit codim and stab dim formulas, closure poset isomorphic to the bipartite multipartition refinement lattice. See [theorems/main-theorem-synthesis.md](theorems/main-theorem-synthesis.md) for the consolidated central statement.

The variety $V(\Pi) \subset \mathcal{H}$ also carries a *second* stratification at the SPD-cone boundary in the algebraic closure $\overline{\mathcal{H}}$ — Hilbert-degeneracy strata generalizing Pataki's rank stratification of the SDP cone. The two stratifications are complementary: spectral-interior vs. kernel-boundary. See [narratives/the-dual-stratification.md](narratives/the-dual-stratification.md).

The chief application that drove the theory's development was the observation that 2025 saw a surge of new "Laplacian" constructions across mathematical communities (graphs, hypergraphs, sheaves, quivers, persistence modules, RCD spaces, spectral triples, ...) — and that this surge constitutes a unifiable mathematical phenomenon. The cross-category orbifold-stratification theorem ([theorems/cross-category-orbifold-stratification.md](theorems/cross-category-orbifold-stratification.md)) shows that essentially every linear-Hilbert-lift Laplacian construction is an instance of the same moduli structure. The 2025 wave is thus the application; the math is the moduli theory.

This entry is **not** organized as a sequence of papers. It is a working library of mathematical material — concepts, objects, morphisms, theorems, narratives, examples, questions, references, plus computational tools (Macaulay2 for EDD, Python sympy for bipartite-multipartition / Hodge / Pataki computations). Papers, when produced, are derived outputs; the structure here is the source.

## What's established

### Project A: cellular Laplacianizability theorem (proved)

Three paired headline results:

1. [theorems/bipartite-stratification-theorem.md](theorems/bipartite-stratification-theorem.md) — the bipartite stratification of moduli of Laplacianizations, with explicit codim and stab formulas, closure poset, and univariate specialization to Arnold–Shapiro–Vainshtein–Weinstein.

2. [theorems/bipartite-realizability.md](theorems/bipartite-realizability.md) — every bipartite multipartition is realized as a non-empty stratum, for any finite-dim chain complex over $\mathbb{R}$ (no sparsity constraints). The stratification is fully populated in the unconstrained setting.

3. [theorems/chain-complex-iep-g.md](theorems/chain-complex-iep-g.md) plus [theorems/chain-complex-iep-g-decomposition.md](theorems/chain-complex-iep-g-decomposition.md) — when inner products are restricted to be stalkwise diagonal in a cellular basis, realizability is substantive but **decomposes per-degree**: $\Pi$ is realizable iff each within-$d_n$ partition $\Pi|_n$ is univariate-IEP-G-realizable for $d_n$. Concrete first obstruction $P_3$ proved.

Combined: **for cellular chain complexes over $\mathbb{R}$, the moduli of Laplacianizations is a real algebraic orbifold faithfully stratified by bipartite multipartitions, with the unconstrained version fully populated and the cellular-sheaf version constrained by IEP-G obstructions that decompose to per-degree univariate IEP-G.** The univariate case recovers Arnold–Shapiro–Vainshtein–Weinstein and classical Barrett–Fallat IEP-G.

Catalog of cases worked out: paths, cycles, complete graphs, stars, filled triangle, $\partial \Delta^3$ — see [examples/iep-g-cellular-catalog.md](examples/iep-g-cellular-catalog.md).

### Project B: cross-category orbifold-stratification

[theorems/cross-category-orbifold-stratification.md](theorems/cross-category-orbifold-stratification.md) — abstracts Project A's framework to any finite-dim Laplacianizer framework $(\mathcal{C}, H^\bullet, F, \eta, \mathrm{Aut})$. The cross-category theorem says: for any finite-dim such framework with $\mathrm{Aut}$ acting properly, the moduli $\mathrm{Aut}(X) \backslash \mathcal{H}(X)$ is an orbifold with strata indexed by spectral multipartitions, universal codim formula $\sum_B(|B|-1)$, and category-specific stab dim depending on $\mathrm{Aut}$. **Finite-dim case: proved.**

Specializes to:
- Cellular case (Project A's bipartite stratification theorem).
- Parametric graph case (Young 2025's inner product Laplacian framework).
- Any user-specified $\mathrm{Aut}$ subgroup of the chain auto group.

**Smooth Riemannian extension** ([theorems/cross-category-smooth.md](theorems/cross-category-smooth.md), **proved**): the cross-category theorem on compact Riemannian manifolds, assembled from Ebin slice theorem + Kato analytic perturbation + Myers–Steenrod + first-order Rayleigh–Schrödinger. Five-step proof structure mirroring the cellular finite-dim case. Specializes to the Einstein-moduli theorem ([references/schwahn2025einstein.md](references/schwahn2025einstein.md)) and to homogeneous-space spectrum-by-representation-theory.

**Noncommutative case**: finite spectral triples ([theorems/finite-spectral-triple-laplacianizability.md](theorems/finite-spectral-triple-laplacianizability.md), proved); infinite regular spectral triples ([theorems/infinite-spectral-triple-laplacianizability.md](theorems/infinite-spectral-triple-laplacianizability.md), sketched). Hochschild–Hilbert lift via the resolvent $R_D = (1+D^2)^{-1}$ as the chain-complex bridge; HKR reduction recovers smooth Riemannian for $\mathcal{A} = C^\infty(M)$.

**Nonlinear case**: variational $p$-Hodge framework ([theorems/nonlinear-p-hodge-laplacianizability.md](theorems/nonlinear-p-hodge-laplacianizability.md), sketched). Cross-category extension contingent on a variational analog of Kato perturbation theory; see [questions/variational-p-eigenvalue-perturbation.md](questions/variational-p-eigenvalue-perturbation.md).

### Coverage of the 2025 wave

| Case | Status | Coverage |
|---|---|---|
| Cellular (finite-dim) | **Proved** | Project A + B finite-dim |
| Parametric graph (finite-dim) | **Proved** | Project B finite-dim |
| Smooth Riemannian / Einstein | **Proved** | Project B smooth |
| Noncommutative (finite spectral triples) | **Proved** | [theorems/finite-spectral-triple-laplacianizability.md](theorems/finite-spectral-triple-laplacianizability.md) |
| Noncommutative (infinite regular spectral triples) | **Sketched / partial-proved** | [theorems/infinite-spectral-triple-laplacianizability.md](theorems/infinite-spectral-triple-laplacianizability.md) |
| Nonlinear ($p$-Laplacian, fixed $p$ cellular) | Sketched ([theorems/nonlinear-p-hodge-laplacianizability.md](theorems/nonlinear-p-hodge-laplacianizability.md)) | Frontier — variational |
| Bipartite Vassiliev / Shapiro–Vainshtein cohomology | Sketched ([theorems/bipartite-vassiliev-shapiro-vainshtein.md](theorems/bipartite-vassiliev-shapiro-vainshtein.md)) | Frontier — combinatorial-topological |

The framework substantively covers the **linear Hilbert-lift** part of the 2025 wave. The noncommutative and nonlinear cases are honestly outside scope.

Sub-theorems and supporting results (all in [theorems/](theorems/)):

- **Stab/codim formulas** at moduli strata ([stab-codim-formula.md](theorems/stab-codim-formula.md), status: proved). Bipartite extension of Arnold–Weinstein.
- **Closure poset = bipartite multipartition refinement lattice** ([closure-poset-of-strata.md](theorems/closure-poset-of-strata.md), status: proved). Bipartite extension of Weinstein's univariate result, with first-order Rayleigh–Schrödinger perturbation argument for the density direction.
- **Per-object moduli theorem** $\mathcal{M}_{\mathrm{Lap}} = G \backslash \mathcal{H}$ ([moduli-of-laplacianizations.md](theorems/moduli-of-laplacianizations.md), status: proved).
- **Categorical moduli theorem** with per-object decomposition ([moduli-of-laplacianizers.md](theorems/moduli-of-laplacianizers.md), sketch).
- **Universal codim, category-specific stab** comparison across cellular and Einstein cases ([universal-vs-categorical-stratification.md](theorems/universal-vs-categorical-stratification.md)).
- **Hilbert-degeneracy stratification (Stratification II)** at the SPD-cone boundary ([hilbert-degeneracy-stratification.md](theorems/hilbert-degeneracy-stratification.md), **proved**). Pataki product stratification + chain-complex Schubert refinement; explicit codim formula $\sum_n \binom{m_n - r_n + 1}{2} + $ Schubert codim; closure poset = Pataki order × Schubert orders; worked verification on the (2,1) chain matching the 4 boundary components of the EDD = 40 computation.
- **Closed-range obstruction** ([closed-range-obstruction.md](theorems/closed-range-obstruction.md), classical, used for unbounded cases).

## Examples

In [examples/](examples/): worked computations on $\partial \Delta^2$ (the smallest case), $\partial \Delta^3$ (where bipartite structure first appears), and the (2,1) chain complex (where the dual-stratification observation surfaced).

## Survey corpus

In [references/](references/): ~25 entries, mostly 2025 arxiv papers spanning sheaf-on-poset constructions, persistent Laplacians, hypergraph variants, Einstein moduli, $p$-Laplacians, noncommutative cases, and the modern algebraic-geometry literature on eigenvalue-stratification varieties. Five anchor entries cover the classical foundations (Arnold 1995, Shapiro–Vainshtein 1995, Weinstein 2020, IEP-G program, etc.).

## Open directions

Listed below; specific open mathematical questions are in [questions/](questions/):

1. Hand-verifying small cases end-to-end without CAS.
2. (Stretch) Generalizing Vassiliev / Shapiro–Vainshtein cohomology to the bipartite case.
3. Self-contained closed-range proof for the infinite-regular spectral triple case ([questions/closed-range-in-our-framework.md](questions/closed-range-in-our-framework.md)).
4. Nonlinear Kato perturbation theory for full variational cross-category extension ([questions/variational-p-eigenvalue-perturbation.md](questions/variational-p-eigenvalue-perturbation.md)).
5. Bruhat-like combinatorial description of Stratification II's closure poset ([questions/stratification-ii-closure-poset-combinatorics.md](questions/stratification-ii-closure-poset-combinatorics.md)).
6. Categorical moduli in non-discrete categories ([questions/functoriality-of-moduli.md](questions/functoriality-of-moduli.md), [questions/categorical-free-cross-category.md](questions/categorical-free-cross-category.md)).

## Layout

- [concepts/](concepts/) — definitions of mathematical notions (bipartite multipartition, squared singular value, stratum, cross-degree identification, Pataki rank stratum, Schubert invariant, stalkwise diagonal cone, boundary-operator graph, Hodge Laplacian, the Laplacianizer object, Laplacianizability).
- [objects/](objects/) — mathematical objects studied (moduli of Laplacianizations, Hilbert structure cone, bipartite multipartition lattice, Stratification I/II, plus input categories: cellular sheaf, finite poset, hypergraph, metric measure space, spectral triple, symmetric simplicial set).
- [morphisms/](morphisms/) — structural maps (chain auto action, Hodge isomorphism, refinement cover, resolvent intertwiner, weighted boundary).
- [theorems/](theorems/) — claims with proof, proof sketch, or honest open status.
- [questions/](questions/) — open mathematical questions, each focused on a specific unresolved point.
- [examples/](examples/) — worked instances and computations.
- [narratives/](narratives/) — through-line documents. Math-narratives describe structural relationships between objects (the bipartite multipartition lattice; the dual stratification; the cross-degree asymmetry); program-narratives recap the framing pivots in the theory's development.
- [references/](references/) — annotated reference entries; 2025 are first-class, classical anchors carry `status: anchor` or `anchor: true`.
- [tools/](tools/) — computational scripts and supporting code:
  - `tools/macaulay2-calculator/` for the M2 EDD computations.
  - `tools/python-toolkit/` for sympy-based bipartite multipartition / Hodge Laplacian / Stratification II / Möbius / IEP-G computations, with verification scripts reproducing $\partial \Delta^2$, $\partial \Delta^3$, $(2,1)$-chain corpus results.

## Convention

Atomized-by-kind layout (same as [predication-categories](../../../categories/theories/predication-categories/)). Every note is a Markdown file with YAML frontmatter; one mathematical entity per file. `grep` is the primary navigation tool.

```yaml
---
type: concept | object | morphism | theorem | conjecture | observation | question | example | narrative | reference
status: draft | sketch | proved | partial | known | resolved | superseded | refuted | open
depends-on: [...]
see-also: [...]
---
```

`status` field meanings:
- `proved` — has a proof in laplacianizers or directly cited.
- `sketch` — proof structure given but details not fully written.
- `known` — classical or literature result, included for reference.
- `partial` / `partial-refuted` — initial conjecture failed; some refined version may stand.
- `resolved` — for questions, with `resolution:` field giving the answer.
- `superseded` — preserved as historical record; current framing is elsewhere.
