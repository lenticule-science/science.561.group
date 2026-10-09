---
kind: theorem
status: proved
depends-on: [regime-decomposition, four-regime-dichotomy, scott-continuous-closure]
---

# Base admissibility of regimes

For a base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$, the four [regime strata](regime-decomposition.md) of the [coarse settling moduli](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/coarse-settling-moduli.md) admit the following non-emptiness conditions:

- $|\mathrm{KP}^{\mathrm{vis}}(B)|_A$ (strict stratum) is *always non-empty* — the trivial settling $v_\tau \equiv \bot$ has $\kappa = 0$.
- $|\mathrm{KP}^{\mathrm{vis}}(B)|_B$ is non-empty iff at least one of $\mathbf{L}, E, \mathcal{C}$ is infinite *and* the predicate category admits finitary closure rules producing settlings with $\kappa = \omega$.
- $|\mathrm{KP}^{\mathrm{vis}}(B)|_C$ is non-empty iff $\mathcal{C}$ admits non-Scott-continuous closure operators with state-space cofinality bounded below $\omega_1$.
- $|\mathrm{KP}^{\mathrm{vis}}(B)|_D$ is non-empty iff $\mathcal{C}$ admits non-Scott-continuous closure operators with state-space cofinality $\geq \omega_1$.

## Proof

The [four-regime dichotomy](four-regime-dichotomy.md) characterizes which regime an individual settling falls into based on $(\mathbf{L}, E, \mathcal{C})$ and the closure operator.
A regime-$X$ MLD-class over $B$ requires at least one settling-over-$B$ to land in regime $X$, which requires $B$ to support the closure structure producing it.
The four cases listed exhaust the possible combinations of base-parameter finiteness/infiniteness and closure Scott-continuity. $\square$

## Finite bases are entirely strict

If $\mathbf{L}, E, \mathcal{C}$ are all finite, every settling has $\kappa < \omega$ (the settling stabilizes in finitely many steps because the fiber algebras are finite ascending chains).
Hence $|\mathrm{KP}^{\mathrm{vis}}(B)| = |\mathrm{KP}^{\mathrm{vis}}(B)|_A$ entirely; the other three strata are empty.

This is the regime where finite-cellular-sheaf cohomology techniques apply directly, and the moduli is genuinely a finite set — though as the [two-entity moduli](../examples/two-entity-moduli.md) example shows, it need not be small.

## Reading

The theorem distinguishes "what regimes a base supports" from "how many settlings fall into each regime."
A base may admit the aperiodic regime in principle (cofinality-$\omega_1$ entity set, infinitary closure rules available) yet have no specific aperiodic settling if the rule-system at hand is finitary; conversely, a base may admit only the strict and Scott-continuous regimes and the moduli automatically lacks an aperiodic stratum.
