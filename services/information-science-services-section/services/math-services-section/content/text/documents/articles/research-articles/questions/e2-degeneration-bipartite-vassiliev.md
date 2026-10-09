---
type: question
status: open
explores:
- bipartite-vassiliev-shapiro-vainshtein
- bipartite-multipartition-lattice
classical-anchor:
- shapiro-vainshtein-1995-alexander
references:
- key: shapiro1995stratification
  type: article
  authors:
  - Shapiro, Boris
  - Vainshtein, Alek
  year: 1995
  title: Stratification of Hermitian matrices and the Alexander mapping
  journal: Comptes Rendus de l'Académie des Sciences. Série I, Mathématique
  volume: 321
  number: 12
  pages: 1599–1604
title: Does the bipartite Vassiliev spectral sequence degenerate at $E2$?
description: The classical Vassiliev spectral sequence for $\mathrm{Sym}^+n$ stratified by partition lattice degenerates at $E2$ .
---

# Does the bipartite Vassiliev spectral sequence degenerate at $E_2$?

The classical Vassiliev spectral sequence for $\mathrm{Sym}^+_n$ stratified by partition lattice degenerates at $E_2$ [@shapiro1995stratification]. The bipartite analog of this result is conjectured but not proved.

## Statement

The [bipartite Vassiliev spectral sequence](../../learning-articles/research-papers/bipartite-vassiliev-shapiro-vainshtein/bipartite-vassiliev-shapiro-vainshtein.md):
$$E_1^{p,q} = \bigoplus_{\Pi: \mathrm{codim}_\Pi = p} H^q\big(\mathrm{Stratum}(\Pi);\, \mathrm{or}_\Pi\big) \implies H^{p+q}\big(\mathcal H \setminus \mathrm{disc}_{\mathrm{bip}};\, \mathbb Z\big)$$
indexed by the [bipartite multipartition lattice](../../../../glossary/terms/bipartite-multipartition-lattice.md), with $E_1$ computed from cohomology of strata + Möbius-weighted closure-poset incidences.

> **Conjecture (bipartite $E_2$-degeneration).** $d_r = 0$ for all $r \ge 2$ on this spectral sequence; equivalently, $E_2 = E_\infty$.

## Status

- **Verified on the binary $(2,2)$ case** (toolkit, single example): $E_1$ has 3 nonzero entries, $E_2$ degeneration is structurally automatic with only 2 strata.
- **Univariate case** ($N = 1$, partition lattice): proved by @shapiro1995stratification via Alexander duality + spectral-sequence machinery.
- **General case**: open.

## What's needed for the proof

The classical Shapiro–Vainshtein argument uses:
1. **Partition lattice Möbius factors**: $\mu(\hat 0, \pi) = (-1)^{n-|\pi|}\prod_B (|B|-1)!$ — clean factorial-style.
2. **Alexander duality**: the closure of a codim-$p$ stratum is Alexander-dual to a higher-codim cycle modulo $H^*$ of even-dim strata.
3. **Stratum cohomology supported in even degrees**: real flag manifolds have rational cohomology concentrated in specific degrees.

For the bipartite extension:
1. **Bipartite Möbius factors**: conjectured to factor over blocks ([open](bipartite-mobius-product-formula.md)). If the factorization holds, the differentials at $E_1 \to E_2$ have a clean structure.
2. **Alexander duality**: the closure of a bipartite stratum has its own Alexander dual; the precise form depends on the bipartite multipartition refinement structure.
3. **Stratum cohomology**: bipartite strata are products of real partial flag manifolds (one per chain degree), still concentrated in known degrees.

Each of (1)-(3) extends conjecturally; the full $E_2$-degeneration argument needs them to assemble compatibly.

## Concrete test cases

Verify $E_2$-degeneration computationally on:

- **$(3, 3)$ Hodge-constrained**: 5-element lattice (= $\Pi_3$), straightforward $E_1$ computation.
- **$(2, 1)$ chain**: 3-element lattice with mixed-degree blocks.
- **$\partial \Delta^3$**: 6 + 4 + 4 chain dims, longer chain, more strata.

If $E_2$-degeneration fails on any of these, that's a counterexample. If it holds on all, evidence accumulates.

## Implication if $E_2$-degenerates

The cohomology of the open stratum (= "simple-spectrum" stratum, complement of the discriminant) is computable from the $E_2$ page, which is determined by:
- Cohomology of each stratum (real partial flag manifold).
- Möbius function of the bipartite multipartition lattice.

So the cohomology of $\mathcal H \setminus \mathrm{disc}_{\mathrm{bip}}$ admits a *closed-form combinatorial expression* in terms of bipartite multipartition data. This would be a structural payoff parallel to Shapiro–Vainshtein's classical result.

## Implication if $E_2$ does NOT degenerate

The bipartite extension would then have *strictly richer* cohomological content than the univariate case — higher differentials would carry information not visible in the closure-poset/stratum-cohomology level.

## Connection to intersection cohomology

Intersection cohomology may be a more natural target than ordinary cohomology for the bipartite case, since closures of strata are singular varieties. Whether IH satisfies a parallel $E_2$-degeneration is a separate question.
