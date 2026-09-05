---
type: theorem
status: sketch
depends-on:
- laplacianizer
- laplacianizability
- moduli-of-laplacianizations
- stab-codim-formula
see-also:
- universal-vs-categorical-stratification
- gauge-fiber-structure
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
- key: andreotti2025generalizing
  type: article
  authors:
  - Andreotti, Eleonora
  year: 2025
  title: 'Generalizing Lattice Structures to Hypergraphs: Spectra of Clique and Hyperedge-based Laplacians'
  eprint: '2511.11138'
  eprinttype: arxiv
---

# The moduli of Laplacianizers

The categorical extension of `theorems/moduli-of-laplacianizations.md`: a per-object moduli of Hilbert structures on a fixed chain complex assembles, across the input category $\mathcal C$, into the moduli of Laplacianizers.

## Setup

$(\mathcal C, H^\bullet)$ a Laplacianizable pair, with a fixed underlying *algebraic* Laplacianizer functor $F^{\mathrm{alg}}: \mathcal C \to \mathbf{Ch}(\mathbf{Vect}_\mathbb R)$ — the chain complex skeleton without inner products.

A **Laplacianizer above $F^{\mathrm{alg}}$** is a Laplacianizer $\mathfrak L = (F, d, \eta)$ whose underlying algebraic functor (forget the inner products) is $F^{\mathrm{alg}}$.

The **moduli of Laplacianizers above $F^{\mathrm{alg}}$** is the groupoid

$$\mathcal M_{\mathrm{Lap}}(F^{\mathrm{alg}}) := \{\text{Laplacianizers above } F^{\mathrm{alg}}\} / \{\text{natural isomorphism over } F^{\mathrm{alg}}\}.$$

Two Laplacianizers above $F^{\mathrm{alg}}$ are isomorphic-over-$F^{\mathrm{alg}}$ if there is a natural transformation $\phi: F \to F'$ that (i) restricts to the identity on $F^{\mathrm{alg}}$ in each degree (as algebraic functors) and (ii) is an isometry into the new inner products.

(More generally, $\mathcal M_{\mathrm{Lap}}(\mathcal C, H^\bullet) = \int_{F^{\mathrm{alg}}} \mathcal M_{\mathrm{Lap}}(F^{\mathrm{alg}})$ over the discrete category of algebraic Laplacianizers — but for almost every example in the survey, $F^{\mathrm{alg}}$ is canonical and the integration is trivial.)

## Per-object decomposition

For each $X \in \mathcal C$, the chain complex $F^{\mathrm{alg}}(X)$ has its own moduli of Hilbert structures, which is exactly the per-object moduli of `theorems/moduli-of-laplacianizations.md`:

$$\mathcal M_{\mathrm{Lap}}(F^{\mathrm{alg}}(X)) = G(X) \backslash \mathcal H(F^{\mathrm{alg}}(X)),$$

where $G(X) = \mathrm{Aut}_{\mathrm{Ch}}(F^{\mathrm{alg}}(X))$ and $\mathcal H(F^{\mathrm{alg}}(X)) = \prod_n \mathrm{Sym}^+(F^{\mathrm{alg}}(X)_n)$.

The **per-object decomposition** is the natural map

$$\mathrm{ev}: \mathcal M_{\mathrm{Lap}}(F^{\mathrm{alg}}) \to \prod_{X \in \mathcal C} \mathcal M_{\mathrm{Lap}}(F^{\mathrm{alg}}(X))$$

restricting a Laplacianizer to its per-object inner-product data.

> **Theorem (per-object decomposition).** The map $\mathrm{ev}$ is a fibration with discrete fiber. The fiber over a tuple $(\langle \cdot, \cdot \rangle_X)_X$ is the set of natural transformations between $F^{\mathrm{alg}}$ instances of itself that are compatible with the chosen inner products — typically a discrete (often singleton) set when $\mathcal C$ has enough morphisms to pin down the Laplacianizer.

The substantive content of $\mathcal M_{\mathrm{Lap}}(F^{\mathrm{alg}})$ comes from the per-object moduli; the categorical structure is a *coupling* across $X$ via naturality, but for our purposes (computing strata, dimensions, gauge fibers), the per-object analysis dominates.

## Universal claims (statements)

> **Theorem (orbifold structure, sketch).** For each $X$ with $F^{\mathrm{alg}}(X)$ finite-dimensional, the moduli $\mathcal M_{\mathrm{Lap}}(F^{\mathrm{alg}}(X)) = G(X) \backslash \mathcal H(F^{\mathrm{alg}}(X))$ is a real algebraic orbifold. Its strata are indexed by multipartitions of $\bigsqcup_n \{1, \ldots, r_n(X)\}$ (with $r_n(X) = \mathrm{rank}\, d_n^{F^{\mathrm{alg}}(X)}$), and the stab/codim formulas of `theorems/stab-codim-formula.md` apply.

> **Theorem (universal codim formula).** For any $(\mathcal C, H^\bullet)$ Laplacianizable, fixed $X$, and any stratum of $\mathcal M_{\mathrm{Lap}}(F^{\mathrm{alg}}(X))$ at $Q$:
> $$\mathrm{codim}_{\mathcal M_{\mathrm{Lap}}}(\text{stratum at } Q) = \sum_{B \in \Pi(Q)} (|B| - 1)$$
> where $\Pi(Q)$ is the multipartition labeling the stratum (`examples/moduli-strata-classification.md`).
>
> This formula is **universal** across the category — and across other categories of Laplacianizers (`theorems/universal-vs-categorical-stratification.md`).

The stab formula at each stratum is *category-specific*: it depends on what $G(X)$ is for the given input category. In the cellular case, $G(X) = $ algebraic chain automorphisms gives $\sum_B \sum_n \binom{k_n^B}{2}$. In the Einstein case, $G(X) = \mathrm{Isom}(M, g)$ gives a different count ([@schwahn2025einstein]).

## What this gains

The previous moduli theorem (`theorems/moduli-of-laplacianizations.md`) was per-object: fix a chain complex, compute its moduli of inner products. This works on the cellular case but doesn't articulate why the same shape appears in Einstein moduli, Young's inner product Laplacian, or persistent Laplacians.

The Laplacianizer framework articulates this: each input category $\mathcal C$ has its own "moduli of Laplacianizers" — a categorical object whose per-object slices are concrete moduli of inner products on chain complexes. The orbifold-stratified shape is universal *across* this categorical setup; what varies is the input category, the cohomology theory, and the automorphism group.

This generalization unlocks the following questions, all natural at the categorical level:

- **Stratum incidence.** What is the partial-order structure on strata of $\mathcal M_{\mathrm{Lap}}(\mathcal C, H^\bullet)$? Stratum $\Pi'$ is in the closure of $\Pi$ iff $\Pi'$ refines $\Pi$ — see `theorems/closure-poset-of-strata.md`.

- **Cohomology of moduli.** With strata indexed by multipartitions and incidence by refinement, the moduli has a stratified topology. Its cohomology — including intersection cohomology and Gysin-type long exact sequences across stratum boundaries — is well-defined and computable in principle.

- **Functoriality of moduli.** A morphism $X \to Y$ in $\mathcal C$ induces a chain map $F^{\mathrm{alg}}(X) \to F^{\mathrm{alg}}(Y)$, which in turn induces a map of moduli $\mathcal M_{\mathrm{Lap}}(F^{\mathrm{alg}}(X)) \to \mathcal M_{\mathrm{Lap}}(F^{\mathrm{alg}}(Y))$ (with caveats for surjectivity vs. injectivity of the chain map). The behavior of strata under these induced maps is part of the categorical structure.

## What is not yet proved

- **Existence of $F^{\mathrm{alg}}$ as a *canonical* algebraic Laplacianizer** in each example category. For cell complexes, the cellular cochain functor is canonical. For Riemannian manifolds, the de Rham complex is canonical. For hypergraphs, multiple competing $F^{\mathrm{alg}}$'s exist ([@andreotti2025generalizing]). When competing $F^{\mathrm{alg}}$'s exist, the moduli of Laplacianizers has a *coarser* structure (a disjoint union over the algebraic-Laplacianizer choices, with each piece an orbifold stratification per the theorem).

- **Properness of the $G$-action.** For finite-dim chain complexes, $G$ acts properly on $\mathcal H$ in standard cases, giving the orbifold quotient. A general theorem covering all cases of the survey (including the unbounded / infinite-dim Einstein moduli) needs case-by-case verification.

- **Functoriality across $\mathcal C$.** The per-object moduli $X \mapsto \mathcal M_{\mathrm{Lap}}(F^{\mathrm{alg}}(X))$ is a contravariant functor on $\mathcal C^{\mathrm{op}}$ (under appropriate hypotheses). The theorem statement should make this explicit.

These open items are the remaining prerequisites for the strata-incidence-poset construction (Direction B).

## Bridge to next direction

With the Laplacianizer object now treated as primary:
- The moduli of Laplacianizers is the proper subject of structural study.
- Strata are indexed by a clean combinatorial invariant (multipartitions).
- Stratum-incidence relations form a poset (refinement of multipartitions). **Worked out** in `theorems/closure-poset-of-strata.md`.
- The universal codim formula and category-specific stab formula apply (`theorems/stab-codim-formula.md`).
- A second stratification (Stratification II) lives at the SPD-cone boundary in $\overline{\mathcal H}$ (`theorems/hilbert-degeneracy-stratification.md`), generalizing Pataki's rank stratification of the SDP cone. It appears in global computations (EDD, intersection cohomology) of $V(\Pi)$ in the algebraic closure.

The bipartite generalization of Vassiliev / Shapiro–Vainshtein cohomology is in `theorems/bipartite-vassiliev-shapiro-vainshtein.md`; open questions about $E_2$-degeneration and Möbius factorization are in `questions/e2-degeneration-bipartite-vassiliev.md` and `questions/bipartite-mobius-product-formula.md`.
