---
type: research-article
status: active
aliases:
- Laplanc-2025
tags:
- laplacianizability
- hodge-laplacian
- spectral-geometry
- stratified-moduli
---

# Laplacianizability and stratified moduli

This research studies **Laplacianizability** — the property that a category of mathematical structures admits a Hilbert lift of a chosen cohomology theory — through the resulting moduli of Laplacianizers.

The original premise was that 2025 saw a surge of new "Laplacian" constructions across mathematical communities (graphs, hypergraphs, sheaves, quivers, persistence modules, RCD spaces, spectral triples, etc.) — and that this surge constitutes a unifiable mathematical phenomenon. After the survey and several rounds of structural work, the framework landed on a sharper, more honest framing.

## Current statement of the framework

**Definition.** A pair $(\mathcal C, H^\bullet)$ — a category and a graded-vector-space-valued cohomology theory — is **Laplacianizable** iff it admits a *Laplacianizer*: a triple $\mathfrak L = (F, d, \eta)$ with $F: \mathcal C \to \mathbf{Hilb}^{\mathbb Z}$, $d^2 = 0$, and $\eta: H^\bullet \xrightarrow{\sim} H_\bullet(F, d)$ a natural iso.

See [laplacianizer.md](../../../glossary/terms/laplacianizer.md) (the object) and [laplacianizability.md](../../../glossary/terms/laplacianizability.md) (the property).

**Central structural finding.** When such a Laplacianizer exists, it is *not unique*. The moduli of Laplacianizers is a stratified orbifold whose strata are indexed by *eigenvalue-multiplicity invariants* of the associated Hodge Laplacian. The univariate case (single chain space, single Laplacian) is **classical** — Arnold (1995), Shapiro–Vainshtein (1995), Weinstein (2020). The bipartite extension to multi-operator chain complexes is the framework's contribution: explicit codim and stab dim formulas, closure poset isomorphic to the bipartite multipartition refinement lattice.

**Dual-stratification observation.** The variety $V(\Pi) \subset \mathcal H$ also carries a *second* stratification at the SPD-cone boundary in the algebraic closure $\overline{\mathcal H}$ — Hilbert-degeneracy strata generalizing Pataki's rank stratification of the SDP cone. This second stratification is invisible from inside the SPD interior but appears in any global computation (EDD, intersection cohomology) of $V(\Pi)$.

See [stratified-moduli-of-laplacianizations.md](stratified-moduli-of-laplacianizations.md) for the consolidated central statement, and [bipartite-multipartition-lattice.md](../teaching-articles/explanations/bipartite-multipartition-lattice.md), [cross-degree-asymmetry.md](../teaching-articles/explanations/cross-degree-asymmetry.md), [dual-stratification.md](../teaching-articles/explanations/dual-stratification.md) for the structural narratives.

## What's established

### Cellular finite-dimensional Laplacianizability

Three paired headline results:

1. **[bipartite-stratification-theorem.md](bipartite-stratification-theorem.md)** — the bipartite stratification of moduli of Laplacianizations, with explicit codim and stab formulas, closure poset, and univariate specialization to Arnold–Shapiro–Vainshtein–Weinstein.

2. **[bipartite-realizability.md](bipartite-realizability.md)** — every bipartite multipartition is realized as a non-empty stratum, for any finite-dim chain complex over $\mathbb R$ (no sparsity constraints). The stratification is fully populated in the unconstrained setting.

3. **[chain-complex-iep-g.md](chain-complex-iep-g.md)** plus **[chain-complex-iep-g-decomposition.md](chain-complex-iep-g-decomposition.md)** — when inner products are restricted to be stalkwise diagonal in a cellular basis, realizability is substantive but **decomposes per-degree**: $\Pi$ is realizable iff each within-$d_n$ partition $\Pi|_n$ is univariate-IEP-G-realizable for $d_n$. Concrete first obstruction $P_3$ proved.

Combined: **for cellular chain complexes over $\mathbb R$, the moduli of Laplacianizations is a real algebraic orbifold faithfully stratified by bipartite multipartitions, with the unconstrained version fully populated and the cellular-sheaf version constrained by IEP-G obstructions that decompose to per-degree univariate IEP-G.** The univariate case recovers Arnold–Shapiro–Vainshtein–Weinstein and classical Barrett–Fallat IEP-G.

**See [stratified-moduli-of-laplacianizations.md](stratified-moduli-of-laplacianizations.md) for the consolidated central statement** combining cellular finite-dim, parametric graph, and smooth Riemannian cases into a single theorem with universal codim, category-specific stab, and bipartite-multipartition closure poset.

Catalog of cases worked out: paths, cycles, complete graphs, stars, filled triangle, $\partial \Delta^3$ — see [iep-g-cellular-catalog.md](../teaching-articles/examples/iep-g-cellular-catalog.md).

### Cross-category orbifold stratification

**[cross-category-orbifold-stratification.md](cross-category-orbifold-stratification.md)** abstracts the cellular finite-dimensional argument to any finite-dimensional Laplacianizer framework $(\mathcal C, H^\bullet, F, \eta, \mathrm{Aut})$. When $\mathrm{Aut}$ acts properly, the moduli $\mathrm{Aut}(X) \backslash \mathcal H(X)$ is an orbifold with strata indexed by spectral multipartitions, universal codimension $\sum_B(|B|-1)$, and category-specific stabilizer dimension. **Finite-dimensional case: proved.**

Specializes to:
- Cellular case (the bipartite stratification theorem).
- Parametric graph case (Young 2025's inner product Laplacian framework).
- Any user-specified $\mathrm{Aut}$ subgroup of the chain auto group.

**Smooth Riemannian extension** ([cross-category-smooth.md](cross-category-smooth.md), **proved**): the cross-category theorem on compact Riemannian manifolds, assembled from Ebin slice theorem + Kato analytic perturbation + Myers–Steenrod + first-order Rayleigh–Schrödinger. Five-step proof structure mirroring the cellular finite-dim case. Specializes to the Einstein-moduli theorem ([schwahn2025einstein.md](../bibliographies/schwahn2025einstein.md)) and to homogeneous-space spectrum-by-representation-theory.

**Noncommutative case**: finite spectral triples ([finite-spectral-triple-laplacianizability.md](finite-spectral-triple-laplacianizability.md), proved); infinite regular spectral triples ([infinite-spectral-triple-laplacianizability.md](infinite-spectral-triple-laplacianizability.md), sketched). Hochschild–Hilbert lift via the resolvent $R_D = (1+D^2)^{-1}$ as the chain-complex bridge; HKR reduction recovers smooth Riemannian for $\mathcal A = C^\infty(M)$.

**Nonlinear case**: variational $p$-Hodge framework ([nonlinear-p-hodge-laplacianizability.md](nonlinear-p-hodge-laplacianizability.md), sketched). Cross-category extension contingent on a variational analog of Kato perturbation theory; see [variational-p-eigenvalue-perturbation.md](questions/variational-p-eigenvalue-perturbation.md).

### Coverage of the 2025 wave

| Case | Status | Coverage |
|---|---|---|
| Cellular (finite-dim) | **Proved** | Bipartite stratification and realizability |
| Parametric graph (finite-dim) | **Proved** | Cross-category finite-dimensional theorem |
| Smooth Riemannian / Einstein | **Proved** | Cross-category smooth theorem |
| Noncommutative (finite spectral triples) | **Proved** | [finite-spectral-triple-laplacianizability.md](finite-spectral-triple-laplacianizability.md) |
| Noncommutative (infinite regular spectral triples) | **Sketched / partial-proved** | [infinite-spectral-triple-laplacianizability.md](infinite-spectral-triple-laplacianizability.md) |
| Nonlinear ($p$-Laplacian, fixed $p$ cellular) | Sketched ([nonlinear-p-hodge-laplacianizability.md](nonlinear-p-hodge-laplacianizability.md)) | Frontier — variational |
| Bipartite Vassiliev / Shapiro–Vainshtein cohomology | Sketched ([bipartite-vassiliev-shapiro-vainshtein.md](bipartite-vassiliev-shapiro-vainshtein.md)) | Frontier — combinatorial-topological |

The framework substantively covers the **linear Hilbert-lift** part of the 2025 wave. The noncommutative and nonlinear cases remain partial extensions.

Sub-theorems and supporting results (all integrated as research articles):

- **Stab/codim formulas** at moduli strata ([stab-codim-formula](stab-codim-formula.md), status: proved). Bipartite extension of Arnold–Weinstein.
- **Closure poset = bipartite multipartition refinement lattice** ([closure-poset-of-strata](closure-poset-of-strata.md), status: proved). Bipartite extension of Weinstein's univariate result, with first-order Rayleigh–Schrödinger perturbation argument for the density direction.
- **Per-object moduli theorem** $\mathcal M_{\mathrm{Lap}} = G \backslash \mathcal H$ ([moduli-of-laplacianizations](moduli-of-laplacianizations.md), status: proved).
- **Categorical moduli theorem** with per-object decomposition ([moduli-of-laplacianizers](moduli-of-laplacianizers.md), sketch).
- **Universal codim, category-specific stab** comparison across cellular and Einstein cases ([universal-vs-categorical-stratification](universal-vs-categorical-stratification.md)).
- **Hilbert-degeneracy stratification (Stratification II)** at the SPD-cone boundary ([hilbert-degeneracy-stratification](hilbert-degeneracy-stratification.md), **proved**). Pataki product stratification + chain-complex Schubert refinement; explicit codim formula $\sum_n \binom{m_n - r_n + 1}{2} + $ Schubert codim; closure poset = Pataki order × Schubert orders; worked verification on the (2,1) chain matching the 4 boundary components of the EDD = 40 computation.
- **Closed-range obstruction** ([closed-range-obstruction](closed-range-obstruction.md), classical, used for unbounded cases).

## Examples

The teaching examples include worked computations on $\partial \Delta^2$ (the smallest case), $\partial \Delta^3$ (where bipartite structure first appears), and the (2,1) chain complex (where the dual-stratification observation surfaced).

## Survey corpus

The bibliographies include about 25 annotated entries, mostly 2025 arXiv papers spanning sheaf-on-poset constructions, persistent Laplacians, hypergraph variants, Einstein moduli, $p$-Laplacians, noncommutative cases, and the modern algebraic-geometry literature on eigenvalue-stratification varieties. Five anchor entries cover the classical foundations (Arnold 1995, Shapiro–Vainshtein 1995, Weinstein 2020, IEP-G program, etc.).

## Open directions

Listed below; each specific open mathematical question is integrated as a research question:

1. ~~Proving the closure-poset theorem rigorously~~ — done ([closure-poset-of-strata.md](closure-poset-of-strata.md)).
2. ~~Articulating Stratification II as a full theorem with closure-poset structure~~ — done ([hilbert-degeneracy-stratification.md](hilbert-degeneracy-stratification.md)).
3. ~~A clean main-theorem synthesis statement~~ — done ([stratified-moduli-of-laplacianizations.md](stratified-moduli-of-laplacianizations.md)).
4. ~~Rigorizing the smooth Riemannian case~~ — done ([cross-category-smooth.md](cross-category-smooth.md)).
5. Hand-verifying small cases end-to-end without CAS.
6. (Stretch) Generalizing Vassiliev / Shapiro–Vainshtein cohomology to the bipartite case.
7. ~~Noncommutative case~~ — finite-dim proved ([finite-spectral-triple-laplacianizability.md](finite-spectral-triple-laplacianizability.md)), infinite-dim sketched ([infinite-spectral-triple-laplacianizability.md](infinite-spectral-triple-laplacianizability.md)) via Hochschild–Hilbert lift + Connes regularity + HKR reduction to smooth.
8. ~~Nonlinear case~~ — sketched ([nonlinear-p-hodge-laplacianizability.md](nonlinear-p-hodge-laplacianizability.md)); variational framework set up for fixed $p$ cellular case, full cross-category extension requires nonlinear-Kato perturbation theory.
9. ~~Bipartite Vassiliev / Shapiro–Vainshtein cohomology~~ — sketched ([bipartite-vassiliev-shapiro-vainshtein.md](bipartite-vassiliev-shapiro-vainshtein.md)); $E_1$-page formula stated, Alexander-duality conjectured, binary worked example complete.

## Integration in the Math Services Section

- Mathematical concepts, objects, and morphisms are glossary terms.
- Theorems and observations are research articles. The former generated compilation was removed because it duplicated these atomized resources.
- Open problems are research questions.
- Structural narratives are teaching explanations.
- Worked computations are teaching examples.
- Annotated sources and the BibTeX collection are bibliographies.
- Macaulay2 and Python implementations live under `lib/tools/laplacianizability/`.

## Convention

Every resource is a Markdown file with YAML frontmatter and one mathematical
entity per file. Its `type` follows the Math Services Section destination:

```yaml
---
type: term | theorem | conjecture | observation | question | example | explanation | bibliography
status: draft | sketch | proved | partial | known | resolved | superseded | refuted | open
depends-on: [...]
see-also: [...]
---
```

`status` field meanings (clarified in these resources):
- `proved` — has a proof in these resources or directly cited.
- `sketch` — proof structure given but details not fully written.
- `known` — classical or literature result, included for reference.
- `partial` / `partial-refuted` — initial conjecture failed; some refined version may stand.
- `resolved` — for questions, with `resolution:` field giving the answer.
- `superseded` — preserved as historical record; current framing is elsewhere.
