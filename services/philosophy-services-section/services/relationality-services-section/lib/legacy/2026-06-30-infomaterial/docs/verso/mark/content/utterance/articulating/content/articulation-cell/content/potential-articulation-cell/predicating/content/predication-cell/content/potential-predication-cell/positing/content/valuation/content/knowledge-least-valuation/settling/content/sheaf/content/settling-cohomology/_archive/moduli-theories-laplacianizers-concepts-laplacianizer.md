---
type: concept
class: object
symbol: \mathfrak L
status: draft
depends-on:
- hodge-laplacian
- laplacianizability
see-also:
- moduli-of-laplacianizers
references:
- key: schwahn2025einstein
  type: article
  authors:
  - Schwahn, Paul
  - Semmelmann, Uwe
  year: 2025
  title: Einstein metrics, their moduli spaces and stability
  eprint: '2507.18463'
  eprinttype: arxiv
- key: wei2023persistent
  type: article
  authors:
  - Wei, Jian
  - Wei, Guo-Wei
  year: 2023
  title: Persistent Topological Laplacians -- a Survey
  eprint: '2312.07563'
  eprinttype: arxiv
- key: aksoy2025reimagining
  type: article
  authors:
  - Aksoy, Sinan G.
  - Young, Stephen J.
  year: 2025
  title: Re-imagining Spectral Graph Theory
  eprint: '2504.10624'
  eprinttype: arxiv
---

# The Laplacianizer

The mathematical object whose existence proves Laplacianizability and whose moduli is the central object of study of laplacianizers.

## Definition

Let $\mathcal C$ be a category and $H^\bullet: \mathcal C \to \mathbf{grVect}_\mathbb{R}$ a graded-vector-space-valued cohomology theory.

A **Laplacianizer** of the pair $(\mathcal C, H^\bullet)$ is a triple

$$\mathfrak L = (F, d, \eta)$$

where:

- $F: \mathcal C \to \mathbf{Hilb}^\mathbb{Z}$ is a functor to graded Hilbert spaces (each $F(X)$ a graded Hilbert space, each morphism in $\mathcal C$ inducing a bounded graded linear map between Hilbert spaces);

- $d: F \to F[-1]$ is a degree-$(-1)$ natural transformation (each $F(X)$ comes with a chain differential $d_X$ functorial in $X$) satisfying $d \circ d = 0$;

- $\eta: H^\bullet \xrightarrow{\sim} H_\bullet(F, d)$ is a natural isomorphism between the given cohomology theory $H^\bullet$ and the homology of the Hilbert chain complex $(F, d)$, restricted to objects $X$ where $d_X$ has closed range.

The Laplacian of $\mathfrak L$ at $X$ is

$$\Delta^\mathfrak L_X := dd^* + d^*d \quad \text{on } F(X),$$

with $d^*$ the Hilbert adjoint relative to $F(X)$'s inner product. By construction, $\ker \Delta^\mathfrak L_X \cong H^\bullet(X)$ via $\eta$ (Hodge isomorphism).

## What a Laplacianizer is *not*

- **Not just a functor to chain complexes.** The functor $F$ goes to *Hilbert* chain complexes — equipped with inner products. The inner products are part of the data.

- **Not just a Hilbert structure on a fixed complex.** A Laplacianizer is a *family* — one Hilbert chain complex per object $X$, with naturality across morphisms. Per-object data is recovered by restricting $\mathfrak L$ to a single $X$.

- **Not unique.** Many Laplacianizers exist for the same $(\mathcal C, H^\bullet)$. The space of Laplacianizers is the moduli `theorems/moduli-of-laplacianizers.md`.

- **Not sensitive to which $\Delta$ we extract.** The Laplacianizer is the *full* triple $(F, d, \eta)$, and the Laplacian is a derived invariant. Two different Laplacianizers can yield Laplacians with the same spectrum but be inequivalent as Laplacianizers (different chain maps under naturality).

## Decomposition: per-object data

A Laplacianizer $\mathfrak L = (F, d, \eta)$ has, at each object $X \in \mathcal C$, the following pieces of data:

1. The **algebraic chain complex** $F^{\mathrm{alg}}(X) := (F(X), d_X)$ — a chain complex of (algebraic) vector spaces, ignoring the inner products.

2. The **Hilbert structure** $\langle \cdot, \cdot \rangle_X$ on $F(X)$ — a graded inner product.

3. The **cohomology iso** $\eta_X: H^\bullet(X) \xrightarrow{\sim} H_\bullet(F^{\mathrm{alg}}(X))$ — independent of the inner product.

Two Laplacianizers $\mathfrak L, \mathfrak L'$ with isomorphic underlying algebraic chain complex functors $F^{\mathrm{alg}} \cong F'^{\mathrm{alg}}$ differ only in choice of inner product (and the natural iso witnessing the algebraic equivalence). The moduli at the algebraic level is *typically discrete* (chain complexes with the same homology are isomorphic up to chain isomorphism, with discrete moduli for finite-type complexes); the *interesting* moduli is in the choice of inner product.

So, **fixing the algebraic Laplacianizer $F^{\mathrm{alg}}$**, the moduli of full Laplacianizers reduces to:

> The space of natural choices of graded inner product on $F^{\mathrm{alg}}(X)$ — one per object — modulo natural automorphisms of the algebraic chain complex functor.

This is the *concrete* moduli of `theorems/moduli-of-laplacianizations.md`, generalized to the categorical setting.

## The moduli problem

**Definition.** The **moduli of Laplacianizers** of $(\mathcal C, H^\bullet)$ is the groupoid

$$\mathcal M_{\mathrm{Lap}}(\mathcal C, H^\bullet) := \{\text{Laplacianizers } \mathfrak L\} / \{\text{natural isomorphism}\},$$

where two Laplacianizers $\mathfrak L, \mathfrak L'$ are isomorphic if there is a natural transformation $\phi: F \to F'$ that is a graded chain isomorphism intertwining $d, d'$ (and consequently the cohomology iso's).

This is the categorical object laplacianizers studies. Its structure — orbifold, stratified by eigenvalue-multiplicity invariants of the associated Laplacian — is the content of the universal stratification claim.

## Why "Laplacianizer" rather than "Hilbert lift"

The phrasing "Hilbert lift" emphasizes the *act* of lifting cohomology to Hilbert chain complexes. The phrasing "Laplacianizer" emphasizes the *object* — the functor + differential + iso, treated as a single thing whose moduli is to be studied.

The two are the same data; the choice of name reflects which structural role is being highlighted.

For laplacianizers: "Laplacianizer" is the better name when we want to talk about the *moduli* of such things, especially when the moduli structure (orbifold, strata, gauge fibers) is the focus. "Hilbert lift" is the better name when we're talking about the *existence* question: does $(\mathcal C, H^\bullet)$ admit one?

A Laplacianizer is what Laplacianizability guarantees. The moduli of Laplacianizers is the proper unit of structural study.

## Examples

1. **Cellular case.** $\mathcal C = $ cell complexes (regular CW, simplicial, or symmetric simplicial sets). $H^\bullet = $ cellular cohomology with $\mathbb R$-coefficients. A Laplacianizer is a choice of weight on each cell (more generally, a Hilbert-valued sheaf on the face poset). See `objects/cellular-sheaf.md`.

2. **Riemannian / de Rham case.** $\mathcal C = $ compact Riemannian manifolds. $H^\bullet = $ de Rham cohomology. A Laplacianizer is a choice of metric (which determines the $L^2$-pairing on differential forms). See `objects/metric-measure-space.md` for the variant.

3. **Einstein moduli.** $\mathcal C = $ smooth manifolds with the Einstein equation as constraint. $H^\bullet = $ tt-tensor cohomology of the Lichnerowicz operator. A Laplacianizer is an Einstein metric. See [@schwahn2025einstein].

4. **Persistent case.** $\mathcal C = $ filtered cell complexes. $H^\bullet = $ persistent homology. A Laplacianizer is the persistent Laplacian construction. See [@wei2023persistent].

5. **Inner product Laplacian (graphs).** $\mathcal C = $ graphs. $H^\bullet = $ graph cohomology with $\mathbb R$-coefficients. A Laplacianizer is a choice of inner product on vertices and edges. See [@aksoy2025reimagining].

In each case, the moduli of Laplacianizers is the natural object of study.
