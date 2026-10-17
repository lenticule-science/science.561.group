---
kind: theorem
status: proved
depends-on: [cohomological-equivalence, mutually-locally-derivable, aperiodic-regime-classification, transfinite-bounded-regime-h1-generators, four-regime-dichotomy, settling-cohomology-vanishes-above-degree-1, settling-associated-sheaf]
---

# Biequivalence and cohomological equivalence collapse on each regime

[Mutually-locally-derivable](../concepts/mutually-locally-derivable.md) equivalence implies [cohomological equivalence](../content/cohomological-equivalence/cohomological-equivalence.md).
The partial converse — that cohomological equivalence implies MLD — holds on each [regime stratum](../../../../../references/four-regime-dichotomy.md) under regime-specific hypotheses, with regime-specific detection mechanisms:

- **The aperiodic regime,** with $|E| \geq \omega_1$ and closure ordinals $\leq \omega_1$.
  Sheaf-iso of $\mathcal{F}_U$ is detected by $H^1$-class agreement: $\mathrm{cl}\text{-}\mathrm{inv}(v) = \mathrm{cl}\text{-}\mathrm{inv}(v')$ in $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U^{\mathrm{univ}})$ — this is the [aperiodic-regime classification](../../../../aperiodic-settling/references/aperiodic-regime-classification.md) statement.
- **The transfinite-bounded regime.** Same equivalence with $H^1$-class agreement, where $H^1$ has [one $\mathbb{Z}$-generator per non-Scott-continuous firing ordinal](transfinite-bounded-regime-h1-generators.md).
- **The strict and Scott-continuous regimes.** [$H^1 = 0$](settling-cohomology-vanishes-above-degree-1.md), so no cohomological-class agreement is available; the sheaf-iso condition reduces to a combinatorial stage-by-stage matching of the designated-cell evolution.

## Proof

**MLD implies cohomological.** An invertible settling-morphism $(\delta, \phi) : v \to v'$ induces a sheaf isomorphism $\phi_* : \mathcal{F}_U \xrightarrow{\sim} \mathcal{F}_{U'}[\delta]$.
This is exactly the sheaf-iso condition.

**Partial converse.** On each regime, cohomological equivalence determines MLD by the regime-specific detection mechanism:

- *Aperiodic regime:* by [aperiodic-regime classification](../../../../aperiodic-settling/references/aperiodic-regime-classification.md), $H^1$-class agreement is equivalent to MLD.
  Sheaf-iso of $\mathcal{F}_U$ implies $H^1$-class agreement (functoriality of cohomology); the converse is the substantive direction supplied by Hermida–Jacobs fibered coinduction in that proof.
- *Transfinite-bounded regime:* analogous, with $H^1$ structure given by [transfinite-bounded-regime $H^1$-generators](transfinite-bounded-regime-h1-generators.md).
  Two settlings have the same sheaf-iso class iff their non-Scott-continuous firing-ordinal sets agree up to settling-shift, iff their $H^1$-classes agree.
- *the strict and Scott-continuous regimes:* $H^1 = 0$ for the settling-associated sheaf by [settling cohomology vanishes above degree 1](settling-cohomology-vanishes-above-degree-1.md).
  The sheaf-iso condition reduces to bijective matching of designated-cell sets stage-by-stage, which is the cellwise content of MLD-equivalence.

The partial converse is not a single uniform statement: each regime supplies its own detection. $\square$

## Reading

The theorem packages the regime-by-regime collapse into a single structural statement.
On each regime, biequivalence and cohomological equivalence partition the settlings the same way; the *detection mechanism* differs (cohomological in C/D, combinatorial in A/B), but the *partition* is identical.

This is what makes the [moduli classifying function](../morphisms/moduli-classifying-function.md) injective on each regime stratum: cohomological equivalence (= sheaf-iso) is the relation it computes, and biequivalence is the equivalence by which the moduli is quotiented; they coincide.
