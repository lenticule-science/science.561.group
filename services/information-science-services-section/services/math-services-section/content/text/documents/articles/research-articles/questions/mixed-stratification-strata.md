---
type: question
status: open
explores: [stratification-i, stratification-ii, hilbert-degeneracy-stratification]
title: Structure of mixed Stratification I + II strata
description: In the algebraic closure $\overline{\mathcal M{\mathrm{Lap}}}$, the interior stratification I and boundary stratification II can intersect at mixed strata — loci with both spectral-multipartition structure (Stratification I behavior) and…
---

# Structure of mixed Stratification I + II strata

In the algebraic closure $\overline{\mathcal M_{\mathrm{Lap}}}$, the [interior stratification I](../../../../glossary/terms/stratification-i.md) and [boundary stratification II](../../../../glossary/terms/stratification-ii.md) can intersect at *mixed strata* — loci with both spectral-multipartition structure (Stratification I behavior) and rank/kernel-degeneracy structure (Stratification II behavior).

## Concrete example

The (2, 1) chain complex EDD = 40 computation has 5 singular components ([entry](../../teaching-articles/examples/edd-computation-on-2-1-chain/edd-computation-on-2-1-chain.md)):

- **Component 0** (dim 7, codim 2, deg 7): mixed $a, b$ cubics. Likely pure Stratification I — corresponds to $V(\Pi_T)$, the supersymmetric sub-stratum.
- **Component 2** (dim 6, codim 3, deg 1): $b_{13} = b_{23} = b_{33} = 0$. Pure Stratification II — kernel of $Q_1$ contains $\mathrm{im}\,d_2$.
- **Component 4** (dim 6, codim 3, deg 9): $\det Q_0 = 0$ + cubics. **Mixed** — Stratification II ($\det Q_0 = 0$) intersected with Stratification I (cubic conditions on $b$).
- **Components 1, 3** (dim 6, codim 3, degs 5, 3): $b_{33} = 0$ + various conditions. **Mixed** — Stratification II (kernel of $Q_1$ contains $\mathrm{im}\,d_2$ partially) intersected with Stratification I refinements.

## Question

What is the systematic structure of mixed strata? Specifically:

1. Given a Stratification I stratum $\mathrm{Stratum}(\Pi)$ (interior) and a Stratification II stratum $\mathrm{Stratum}_{\mathrm{II}}(\mathbf r, \sigma)$ (boundary), is their intersection in $\overline{\mathcal H}$ non-empty? When?

2. What's the codim of a mixed stratum? Naively additive: $\sum_B(|B|-1) + \sum_n \binom{m_n - r_n + 1}{2} + \mathrm{Schubert}$? Or are there mixing terms?

3. What's the closure poset of the *combined* stratification (Stratifications I + II merged into a single stratification of $\overline{\mathcal H}$)?

## Why this matters

Global invariants of $\overline{\mathcal M_{\mathrm{Lap}}}$ — EDD, intersection cohomology, integration of forms — pick up contributions from all strata, including mixed ones. A clean formula for invariants requires understanding mixed strata.

For the (2, 1) chain EDD = 40, decomposing as 1 (Component 0, pure I) + ? (Components 2, pure II) + ? (Components 1, 3, 4, mixed): the "mixed" contributions are 4 of the 5 components, accounting for most of the 39-component-not-from-Stratification-I.

Understanding mixed strata is the path to a clean closed-form for the boundary contribution to EDD (and hence the saturated EDD = Stratification I contribution alone).

## Approaches

**(a) Codim by transversality.** If Stratification I and II strata are "transverse" in $\overline{\mathcal H}$, codim of mixed stratum is the sum of codims. Need to verify transversality on small examples.

**(b) Explicit computation.** For the (2, 1) chain components 1, 3, 4: write down the Stratification I bipartite multipartition and Stratification II Pataki+Schubert pattern they correspond to, verify codim adds.

**(c) Closure poset structure.** A mixed stratum's closure includes mixed strata with finer Stratification I (more eigenvalue equalities) AND coarser Stratification II (less degenerate $Q$). The combined closure poset would be a product of the two closure poset structures.

## Concrete sub-question

For the (2, 1) chain Component 4 ($\det Q_0 = 0$ + cubics):

- Stratification II: $Q_0$ rank 1 (Pataki $r_0 = 1$). Kernel of $Q_0$ = generic 1-dim subspace of $C_0$. No Schubert refinement ($r_0 = 1, k_0 = 1$, $a_0$ generic = 1 since $\rho_1 = 2$ surjects $C_0$).
- Stratification I: cubic conditions on $b$ — encode multipartition refinements of the surviving spectrum on $\mathrm{im}\,d_1$ side.

What's the bipartite multipartition $\Pi$ and the Stratification II pattern $(\mathbf r, \sigma)$ jointly characterizing Component 4? Codim should be 1 (Pataki) + something (Stratification I contribution on the surviving spectrum).

This is concretely computable from the [Macaulay2 ideal data](../../../../../../lib/tools/laplacianizability/macaulay2-calculator/scripts/edd_PiA_singloc_components.m2) — the cubic generators determine the spectral conditions.

## Generalization

A systematic theory of mixed strata would need:
- A combined "indexing data" $(\Pi, \mathbf r, \sigma)$ specifying both stratification types.
- Compatibility conditions: not all $(\Pi, \mathbf r, \sigma)$ combinations give non-empty mixed strata.
- A combined closure poset on the compatible $(\Pi, \mathbf r, \sigma)$ tuples.

This is the "compactified moduli stratification" — a single stratification of $\overline{\mathcal M_{\mathrm{Lap}}}$ that combines I and II coherently. Open structural theorem.

## Connection to compactification

The compactification $\overline{\mathcal M_{\mathrm{Lap}}}$ as a stratified space requires the combined stratification structure. The Borel–Serre analog for moduli of locally symmetric spaces has a similar combined structure (interior eigenvalue stratification + boundary parabolic stratification). The chain-complex moduli's combined stratification might admit a parallel description in terms of parabolic / GIT data.
