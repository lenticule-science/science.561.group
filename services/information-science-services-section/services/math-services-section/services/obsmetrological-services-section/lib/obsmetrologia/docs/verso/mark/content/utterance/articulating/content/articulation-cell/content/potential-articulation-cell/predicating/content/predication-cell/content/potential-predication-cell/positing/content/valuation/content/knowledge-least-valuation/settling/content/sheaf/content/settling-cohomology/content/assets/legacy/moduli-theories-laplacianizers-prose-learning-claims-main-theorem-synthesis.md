---
type: theorem
status: proved
depends-on:
- cross-category-orbifold-stratification
- bipartite-stratification-theorem
- bipartite-realizability
- chain-complex-iep-g-decomposition
- stab-codim-formula
- closure-poset-of-strata
- moduli-of-laplacianizations
- cross-category-smooth
see-also:
- hilbert-degeneracy-stratification
- finite-spectral-triple-laplacianizability
- infinite-spectral-triple-laplacianizability
- nonlinear-p-hodge-laplacianizability
classical-anchor:
- arnold-1995-hermitian-stratification
- shapiro-vainshtein-1995-alexander
- weinstein-2020-partitioned-eigenvalues
- iep-g-multiplicity-partitions
references:
- key: schwahn2025einstein
  type: article
  - Schwahn, Paul
  - Semmelmann, Uwe
  year: 2025
  title: Einstein metrics, their moduli spaces and stability
  eprint: '2507.18463'
  eprinttype: arxiv
- key: aksoy2025reimagining
  type: article
  - Aksoy, Sinan G.
  - Young, Stephen J.
  year: 2025
  title: Re-imagining Spectral Graph Theory
  eprint: '2504.10624'
  eprinttype: arxiv
---

# Main theorem synthesis: stratified moduli of Laplacianizations

The central claim of laplacianizers, stated in one place. Combines the cellular finite-dim theorem (Project A), the cross-category abstraction (Project B), and the smooth Riemannian extension into a single statement.

## Setup

A **Laplacianizer framework** is a tuple $(\mathcal C, H^\bullet, F, \eta, \mathrm{Aut})$ where:

- $\mathcal C$ is a category of mathematical structures.
- $H^\bullet: \mathcal C \to \mathbf{GrVect}_{\mathbb R}$ is a graded-vector-space-valued cohomology theory.
- $F: \mathcal C \to \mathbf{Hilb}^{\mathbb Z}$ assigns to each $X$ a graded Hilbert chain complex $(C_\bullet(X), d_X)$ with $d_X^2 = 0$ and closed range.
- $\eta_X: H^\bullet(X) \xrightarrow{\sim} H_\bullet(C(X), d_X)$ is a natural isomorphism.
- $\mathrm{Aut}: \mathcal C \to \mathbf{Grp}$ assigns to each $X$ a group of automorphisms acting on the moduli of inner-product structures.

For each object $X$, write $\mathcal H(X)$ for the space of valid inner-product structures on the chain complex of $X$ (subject to whatever category-specific constraints). The **moduli of Laplacianizations** of $X$ is

$$\mathcal M_{\mathrm{Lap}}(X) := \mathrm{Aut}(X) \backslash \mathcal H(X).$$

Each point $[g] \in \mathcal M_{\mathrm{Lap}}(X)$ determines a Hodge Laplacian $\Delta^{(g)}_n$ on each chain space; its **bipartite multipartition** $\Pi(g)$ records which eigenvalues coincide, both within a degree and across degrees.

## Main theorem

> **Theorem (stratified moduli of Laplacianizations).** Let $(\mathcal C, H^\bullet, F, \eta, \mathrm{Aut})$ be a Laplacianizer framework, and let $X \in \mathcal C$. Suppose $X$ falls in one of:
>
> (a) **Cellular finite-dim**: $C_\bullet(X)$ finite-dim over $\mathbb R$, $\mathrm{Aut}(X)$ a closed subgroup of $\prod_n GL(C_n)$.
>
> (b) **Smooth Riemannian**: $X = (M, \cdot)$ a compact smooth manifold, $C_\bullet$ the $L^2$-de-Rham complex, $\mathrm{Aut}(X) = \mathrm{Diff}(M)$.
>
> (c) **Parametric graph**: $X = G$ a finite graph, $\mathcal H(X) =$ inner-product Laplacians in Young's framework, $\mathrm{Aut}(X) = $ vertex-symmetry group.
>
> Then $\mathcal M_{\mathrm{Lap}}(X)$ has the following structure:
>
> 1. **Orbifold structure.** $\mathcal M_{\mathrm{Lap}}(X)$ is a (possibly infinite-dim) real-analytic orbifold.
>
> 2. **Stratification.** Strata are indexed by bipartite multipartitions $\Pi$ of $\bigsqcup_n \mathrm{Spec}(\Delta_n)$:
>    $$\mathcal M_{\mathrm{Lap}}(X) = \bigsqcup_\Pi \mathrm{Stratum}(\Pi).$$
>    Each stratum is a locally closed real-analytic subvariety of the moduli orbifold.
>
> 3. **Universal codim formula.** For any non-trivial stratum,
>    $$\mathrm{codim}\, \mathrm{Stratum}(\Pi) = \sum_{B \in \Pi,\ |B| \ge 2} (|B| - 1).$$
>    This formula is *category-independent*.
>
> 4. **Category-specific stab dim.** The dim of the orbifold stabilizer of a point in $\mathrm{Stratum}(\Pi)$ depends on the category:
>    - **Case (a) cellular**: $\dim \mathrm{stab} = \sum_B \sum_n \binom{k_n^B}{2}$ where $k_n^B$ is the within-degree-$n$ multiplicity of block $B$.
>    - **Case (b) smooth**: $\dim \mathrm{stab} = \dim \mathrm{Isom}(M, g)$, the geometric isometry group dim.
>    - **Case (c) parametric graph**: $\dim \mathrm{stab} = \dim \mathrm{Aut}_G(g)$, the metric-respecting graph automorphism subgroup.
>
> 5. **Closure poset.** $\overline{\mathrm{Stratum}(\Pi')} \supseteq \mathrm{Stratum}(\Pi)$ iff $\Pi$ is a coarsening of $\Pi'$ (the bipartite multipartition refinement order).
>
> 6. **Realizability (case-dependent).**
>    - **Case (a) unconstrained**: every bipartite multipartition $\Pi$ compatible with the chain dimensions is realized as a non-empty stratum.
>    - **Case (a) cellular-sheaf-IEP-G**: $\Pi$ is realizable iff each within-degree restriction $\Pi|_n$ is univariate-IEP-G-realizable for the cellular boundary $d_n$. The first non-trivial obstruction is $P_3$ (Barrett–Fallat).
>    - **Case (b) smooth, case (c) parametric graph**: realizability depends on $X$; characterization is open beyond known special cases (e.g., round spheres, regular graphs).

## Specializations

Setting $\mathrm{Aut} = \prod_n O(C_n)$ in case (a) recovers the **bipartite stratification theorem** (`theorems/bipartite-stratification-theorem.md`): the cellular finite-dim Laplacianizability theorem with explicit stab/codim formulas and closure poset indexed by the bipartite multipartition refinement lattice.

Restricting case (a) to a single chain space (univariate) and $\mathrm{Aut} = O(n)$ recovers **Arnold–Shapiro–Vainshtein–Weinstein**: the classical eigenvalue stratification of $\mathrm{Sym}^+(n)$ with codim $\sum_B(|B|-1)$ and closure poset = univariate partition refinement lattice.

Restricting case (b) to Einstein metrics on $S^{2n}_{tt}M$ recovers the **Einstein moduli orbifold-stratification** ([@schwahn2025einstein]): Lichnerowicz Laplacian eigenvalue $2E$ multiplicity = IED dim, codim = IED dim − 1, stab = $\dim\mathrm{Isom}(g)$.

Restricting case (c) to Young's parametric graph framework ([@aksoy2025reimagining]) recovers the inner-product-Laplacian eigenvalue stratification.

## Proof structure

Cases (a) and (c) are finite-dim and proved by the cross-category orbifold-stratification theorem (`theorems/cross-category-orbifold-stratification.md`). The proof assembles:

- Orbifold structure: $\mathcal M_{\mathrm{Lap}}(X) = \mathrm{Aut}(X) \backslash \mathcal H(X)$ with $\mathrm{Aut}(X)$ acting properly on a real-analytic manifold $\mathcal H(X)$.
- Stratification: spectrum of $\Delta^{(g)}$ varies real-analytically in $g$; eigenvalue-coincidence loci are real-analytic.
- Codim formula: counted via independent eigenvalue-equality conditions, descending to moduli through the $\mathrm{Aut}$-quotient.
- Stab formula: per-block (cellular case) or geometric (smooth case).
- Closure poset: upper-semi-continuity of multiplicity + first-order Rayleigh–Schrödinger argument for the closure direction (`theorems/closure-poset-of-strata.md`).
- Realizability: case (a) unconstrained by the bipartite realizability theorem (`theorems/bipartite-realizability.md`); case (a) cellular-sheaf via the IEP-G decomposition theorem (`theorems/chain-complex-iep-g-decomposition.md`).

Case (b) smooth Riemannian is proved by the same structural pattern with infinite-dim ingredients (full assembly in `theorems/cross-category-smooth.md`):

- **Step 1 — orbifold structure**: Ebin slice theorem (Ebin 1970) on $\mathcal{Met}^s(M)$; $\mathrm{Diff}^{s+1}(M)$ acts properly with finite-dim isotropy.
- **Step 2 — analytic spectrum**: gauge intertwiner $J_g$ transferring $\Delta_g$ to a self-adjoint analytic family on a fixed Hilbert space; Kato VII gives real-analytic eigenvalue branches.
- **Step 3 — codim**: Arnold-style counting transferred via Kato; codim $\sum_B(|B|-1)$ in moduli.
- **Step 4 — stab**: $\dim \mathrm{Isom}(M, g)$ by Myers–Steenrod (1939); finite-dim compact Lie group.
- **Step 5 — closure poset**: first-order Rayleigh–Schrödinger argument with compactly-supported metric variations.

Case (c) parametric graph is detailed in `theorems/cross-category-orbifold-stratification.md`.

## What this theorem covers in the 2025 wave

| 2025 construction | Covered by case | Specific result |
|---|---|---|
| Cellular sheaf Laplacian (Hansen–Ghrist, Ayzenberg–Magai) | (a) | Bipartite stratification with IEP-G obstruction |
| Persistent Laplacian (Mémoli et al.) | (a), parametric | Strata vary continuously in persistence parameter |
| Hypergraph Laplacian | (a) | Reduces to chain-complex case after sheafification |
| Sheaf-on-poset Laplacian | (a) | Direct instance |
| Quiver / persistence-module Laplacian | (a) | After choice of homology functor |
| Einstein moduli (Lichnerowicz) | (b) | IED dim stratification |
| RCD-space Laplacian | (b)-extension | Sketch via $\Gamma$-convergence to smooth case |
| Spectral triple Laplacian ($D^2$), finite | **proved** | `theorems/finite-spectral-triple-laplacianizability.md` |
| Spectral triple Laplacian ($D^2$), infinite regular | **sketched** | `theorems/infinite-spectral-triple-laplacianizability.md` |
| $p$-Laplacian (graph or manifold), fixed $p$ cellular | **sketched** | `theorems/nonlinear-p-hodge-laplacianizability.md` |
| Tensor-eigenvalue Laplacian | **frontier (next phase)** | Variational; nonlinear-frontier |
| Nonlinear-PCA Laplacian | **frontier (next phase)** | Variational; nonlinear-frontier |

The theorem covers the **linear Hilbert-lift** part of the 2025 wave — substantively all constructions that admit a graded Hilbert chain complex with closed-range linear differential. Noncommutative extensions use the Hochschild–Hilbert lift (`theorems/finite-spectral-triple-laplacianizability.md`, `theorems/infinite-spectral-triple-laplacianizability.md`); the nonlinear extension uses graded Banach + variational $p$-Hodge structure (`theorems/nonlinear-p-hodge-laplacianizability.md`).

## Stratification II: dual-stratification observation

The strata of the main theorem are the **eigenvalue-multiplicity strata** in the SPD-cone interior. There is a *second* stratification at the SPD-cone boundary in the algebraic closure $\overline{\mathcal H}$ — the **Hilbert-degeneracy stratification** (`theorems/hilbert-degeneracy-stratification.md`), generalizing Pataki's rank stratification of the SDP cone.

The two stratifications are independent:

- Stratification I lives inside the SPD interior $\mathcal H \subset \overline{\mathcal H}$, indexed by spectral multipartitions.
- Stratification II lives at the boundary $\partial\overline{\mathcal H} = \overline{\mathcal H} \setminus \mathcal H$, indexed by rank patterns of degenerate Hilbert structures.

Global computations (EDD, intersection cohomology) of $V(\Pi) \subset \overline{\mathcal H}$ pick up *both* stratifications. The EDD = 40 result on the (2,1) chain complex (`examples/edd-computation-on-2-1-chain.md`) is the simplest case where this dual structure manifests: 5 singular components, 1 of which (Component 0) is the eigenvalue-multiplicity stratum and 4 of which are SPD-boundary degenerations.

## What's not yet in the theorem

1. **Noncommutative**: finite case proved (`theorems/finite-spectral-triple-laplacianizability.md`); infinite-dim regular case sketched via Hochschild–Hilbert lift + HKR (`theorems/infinite-spectral-triple-laplacianizability.md`); self-contained closed-range proof open (`questions/closed-range-in-our-framework.md`); cyclic-complex variant open (`questions/cyclic-complex-hilbert-lift.md`).

2. **Nonlinear**: framework in `theorems/nonlinear-p-hodge-laplacianizability.md`; cross-category extension contingent on `questions/variational-p-eigenvalue-perturbation.md`.

3. **Stratification II as full theorem**: codim formula and closure-poset proved (`theorems/hilbert-degeneracy-stratification.md`); Bruhat-like combinatorial description open (`questions/stratification-ii-closure-poset-combinatorics.md`).

4. **Persistent / parametric extension**: when $X$ varies in a parameter, the moduli assembles into a fibered structure. Implicit in case (c); not stated as a separate theorem.

5. **Categorical moduli theorem in non-discrete categories**: see `theorems/moduli-of-laplacianizers.md` (sketch); functoriality questions in `questions/functoriality-of-moduli.md` and `questions/categorical-free-cross-category.md`.

## Content

Across the 2025 wave's linear-Hilbert constructions, the moduli of Laplacianizations is *uniformly* an orbifold stratified by spectral multipartition with a *universal* codim formula. The category enters only through the stab-dim formula and through realizability constraints.

The bipartite extension contributes new content beyond the univariate case in two places:
- The closure poset is the *bipartite* multipartition refinement lattice.
- The codim formula counts cross-degree coincidences as well as within-degree.

Realizability under the cellular-sheaf constraint decomposes per-degree to univariate IEP-G (`theorems/chain-complex-iep-g-decomposition.md`) — the bipartite stratification is non-trivial but its realizability is reducible to the univariate IEP-G program.

## Entry points

- For the cellular finite-dim statement: `theorems/bipartite-stratification-theorem.md`.
- For the cross-category abstraction: `theorems/cross-category-orbifold-stratification.md`.
- For the smooth case: `theorems/cross-category-smooth.md`.
- For the realizability theory: `theorems/bipartite-realizability.md`, `theorems/chain-complex-iep-g-decomposition.md`.
- For the closure poset: `theorems/closure-poset-of-strata.md`.
- For the dual stratification: `theorems/hilbert-degeneracy-stratification.md`.
- For the structural narratives: `narratives/the-bipartite-multipartition-lattice.md`, `narratives/the-cross-degree-asymmetry.md`, `narratives/the-dual-stratification.md`.
