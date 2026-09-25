---
type: question
class: bridge
status: open
explores: [aperiodic-settling, four-regime-dichotomy, settling-as-type-realization, four-regimes-as-stability-hierarchy, aperiodic-classifying-invariant, transfinite-settling-convergence]
---

# Saturation in the aperiodic regime

In model theory, a **$\kappa$-saturated** model realizes every type over every parameter set of cardinality $< \kappa$. Saturation is the technical content of "completed" models: a saturated model has every type that's consistent with predication categories.

Read through the [model-theoretic perspective](settling-as-type-realization.md) on settlings, the aperiodic settling at $\omega_1$ is structurally **approaching saturation**: every type that's realizable over a countable parameter set has been realized. Open: make this precise. Specifically — when does $v_\kappa$ for $\kappa \geq \omega_1$ actually achieve $\omega_1$-saturation, and what are the saturation properties of the settled state?

## Why this is non-trivial

The aperiodic settling at $\kappa \geq \omega_1$ has $\omega_1$-many non-Scott-continuous firings, each realizing a new type. This is a *lot* of type-realization. But $\omega_1$-saturation requires realizing types over *every* countable parameter set — and predication categories' settling realizes types over the *cumulative* parameter set as it grows. These aren't quite the same:

- The corpus's settling realizes types over $v_\sigma$'s settled facts at stage $\sigma$, with $\sigma$ ranging up to $\kappa$.
- $\omega_1$-saturation requires realizing types over *any* countable $A$, including $A$'s that aren't initial segments of the settling's parameter accumulation.

Whether the cumulative-parameter realization matches the all-countable-parameters saturation is structurally non-trivial. The corpus's settling might be **less** saturated than $\omega_1$-saturation strictly requires.

## Sub-questions

1. **Define corpus-saturation precisely.** What does it mean for $v_\kappa$ to be **closure-saturated**? Candidate: every type over $v_\sigma$ for $\sigma < \kappa$ that is consistent with the closure rules has been realized at some $\mu \leq \kappa$. Verify this is well-defined and matches the standard model-theoretic saturation when applicable.

2. **When is $v_\kappa$ $\omega_1$-saturated?** Identify the conditions on the closure rules under which the aperiodic settling reaches genuine $\omega_1$-saturation. Conjecture: this requires the closure rules to "explore all consistent types" — equivalently, to be **dense** in the type space.

3. **The ω-stability anomaly.** $\omega$-stable theories typically have *prime* models — minimal saturated models. The corpus's strict-regime settlings are prime in this sense (canonical, minimal). The aperiodic regime's analog: a *minimal saturated settling* over the closure rules. Whether one exists, and what its structure is, is open.

4. **Saturation under deformation.** Two $\omega_1$-saturated settlings over the same closure rules are model-theoretically isomorphic. The corpus's MLD-equivalence is structurally weaker — it allows shifts and rebases. Whether $\omega_1$-saturation implies a stronger equivalence than MLD is an open structural question. Connection to the [strong-MLD classification](../theorems/strong-mld-via-composed-duality.md): saturation may correspond to being in a *unique* strong-MLD orbit.

## Concrete instances

**Pure paraconsistent settling.** A settling whose every NSC firing is a $\top$-firing — the [⊤-only orbit](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-verdier-composition.md) of the strong-MLD classification. Whether this settling is $\omega_1$-saturated depends on whether every consistent type can be realized as a $\top$-firing. For closure rules of $\Pi_1$-schema form, this seems plausible but requires verification.

**Mixed-firing aperiodic settling.** A settling with mixed truth-only / falsity-only / $\top$ firings. Saturation is harder here because the type space is more complex.

**Scott-continuous settling at $\omega$.** Saturated trivially (every type at the directed colimit is realized) but not $\omega_1$-saturated (no firings at limit ordinals beyond $\omega$).

## Connection to existing structure

Saturation connects:

- The [aperiodic-regime classification](../../aperiodic-settling/references/aperiodic-regime-classification.md) — saturated settlings might be the canonical representatives of MLD-classes.
- The [aperiodic co-classification](../theorems/aperiodic-co-classification.md) — saturation has a cosheaf-side dual interpretation in terms of cycle-aggregation.
- The [strong-MLD classification](../theorems/strong-mld-via-composed-duality.md) — saturation might force a specific orbit-type pattern.
- The [transfinite settling convergence](../../../references/transfinite-settling-convergence.md) — saturation refines convergence.

## Connection to existing literature

Standard model theory (Marker §4-5; Tent-Ziegler §6-7) develops the saturation apparatus for first-order theories. Stability theory (Shelah's classification theory) develops it for active theories. The corpus's bilattice setting requires extension to many-valued / paraconsistent saturation — a less-developed area.

Specifically: **saturation for paraconsistent type spaces** is non-standard. A type can be paraconsistent (containing both $\phi$ and $\neg\phi$); saturation must realize these types, which is structurally different from classical saturation. The corpus's $\top$-firings give a concrete instance of paraconsistent type realization.

## Position in predication categories

Third in the model-theoretic framing trio:

- [Settling as type realization](settling-as-type-realization.md) — master framing.
- [Four regimes as stability hierarchy](four-regimes-as-stability-hierarchy.md) — regime-stability correspondence.
- (this question) — saturation in the aperiodic regime.

Concrete entry point: a small aperiodic-regime example (closure-rule on $\omega_1$-many cells, with explicit type-realization at each NSC firing), and check whether $\omega_1$-saturation holds. The corpus's existing aperiodic-regime examples are sketched but not deeply computed; this question would be a natural place to extend them.

This is novel mathematics: saturation theory for predication categories' specific setting (bilattice values + paraconsistent types + transfinite type-realization) doesn't have a direct established analog. The corpus is uniquely positioned to develop it.
