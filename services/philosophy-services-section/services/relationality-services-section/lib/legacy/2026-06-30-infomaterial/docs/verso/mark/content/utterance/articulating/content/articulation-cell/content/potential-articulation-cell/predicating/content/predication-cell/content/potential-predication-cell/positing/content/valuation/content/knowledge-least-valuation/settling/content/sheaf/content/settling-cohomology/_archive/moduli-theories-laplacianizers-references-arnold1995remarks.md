---
type: reference
key: arnold1995remarks
class: article
authors:
- Arnold, V. I.
year: 1995
title: Remarks on eigenvalues and eigenvectors of Hermitian matrices, berry phase, adiabatic connections and quantum Hall
  effect
journal: Selecta Mathematica New Series
volume: 1
number: 1
pages: 1–19
anchor: true
status: anchor
---

# Arnold 1995 — Stratification of Hermitian matrices by eigenvalue multiplicity

Selecta Math. New Series 1(1), 1–19 (1995). **Anchor reference** — the foundational work on eigenvalue-multiplicity stratification of Hermitian (and real symmetric) matrices.

## Why this is foundational for laplacianizers

This paper sets up the stratification of the space of Hermitian matrices by eigenvalue multiplicities and studies its singular geometry. The structural pattern the laplacianizers program rediscovered for moduli of Laplacianizations (`theorems/stab-codim-formula.md`, `examples/moduli-strata-classification.md`) is a known subject at the univariate level, with Arnold as its founder.

What Arnold establishes:

- The stratification by eigenvalue-multiplicity partition is a real (not just notional) stratification of the space of Hermitian matrices.
- The stratum of Hermitian matrices with a non-simple eigenvalue is codim 3 (real codim) in the Hermitian case, codim 2 in the real symmetric case.
- A spectral sequence is associated to the stratification; its degeneration produces non-trivial combinatorial identities.
- The eigenvector bundle has a connection over the open stratum (simple eigenvalues), with curvature blowing up at the codim-3 variety. This is the geometric origin of the quantum Hall effect.

## Relationship to the laplacianizers framework

The laplacianizers program studies moduli of Hilbert structures on chain complexes, stratified by eigenvalue multiplicity of the resulting Hodge Laplacian. **The univariate case** — stratification of $\mathrm{Sym}^+_n$ (or $\mathrm{Herm}_n$) by partition — is exactly Arnold's subject.

Our `theorems/stab-codim-formula.md` codim formula $\sum_B (|B|-1)$ in the univariate case is *classical* — implicit in Arnold's setup, and worked out in any standard reference on stratifications of matrix spaces.

Our stab formula $\sum_B \binom{k_n^B}{2}$ at the univariate level is the dimension of the unitary stabilizer on each eigenspace, $\dim O(k) = \binom{k}{2}$ — also classical.

**The novel piece of laplacianizers (relative to this anchor) is:**

1. **The bipartite/multipartite extension.** When the chain complex has multiple boundary operators $d_1, d_2, \ldots$, each contributes its own singular-value spectrum. Strata of moduli are indexed not by single partitions but by **bipartite (or N-partite) multipartitions**, with cross-$d_n$ identifications adding to codim while the stab formula treats within-$d_n$ multiplicities and cross-$d_n$ identifications differently. This is not in Arnold's univariate framework.

2. **The chain automorphism quotient.** Arnold stratifies $\mathrm{Herm}_n$ as a single space; we stratify $G \backslash \mathcal H$ where $G$ is the chain auto group of the underlying chain complex. The chain coupling changes the local structure of strata.

3. **The Laplacianizability framing.** Arnold doesn't connect his stratification to a moduli of Hodge Laplacians of a cohomology theory. Our framework does.

## Spectral sequence and cohomology — what extends, what doesn't

Arnold's spectral sequence and Shapiro–Vainshtein's Alexander mapping (`references/shapiro-vainshtein-1995-alexander.md`) compute cohomology of the stratification of Hermitian matrices. The natural question for laplacianizers: do these tools extend to the bipartite multipartition stratification of $G \backslash \mathcal H$?

This is open. The bipartite stratification has a more complex closure poset (refinements of bipartite multipartitions, not single partitions), and the chain automorphism quotient adds another layer of structure. The Arnold–Shapiro–Vainshtein techniques *should* generalize — that's the natural Direction B program — but the generalization isn't in the literature found.

## Bridges

- To `theorems/stab-codim-formula.md` — provides the univariate-case anchor.
- To `examples/moduli-strata-classification.md` — provides the structural antecedent for the bipartite enumeration.
- To laplacianizers' Direction B — Arnold–Shapiro–Vainshtein cohomology techniques are the natural starting point.
