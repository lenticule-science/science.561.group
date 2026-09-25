---
kind: theorem
status: proved
depends-on: [coarse-settling-moduli, bigraded-settling-cohomology, paraconsistent-classification, inconsistency-sheaf, settling-associated-sheaf, four-regime-dichotomy]
---

# Bigraded aperiodic-regime trichotomy

The aperiodic stratum $|\mathrm{KP}^{\mathrm{vis}}(B)|_D$ of the [coarse settling moduli](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/coarse-settling-moduli.md) decomposes into three sub-strata indexed by the [bigraded classifying invariant](../content/sheaf/content/settling-cohomology/content/bigraded-settling-cohomology/bigraded-settling-cohomology.md):

- $|\mathrm{KP}^{\mathrm{vis}}(B)|_D^{\mathrm{cons}}$ — **consistent**: $\mathrm{cl}\text{-}\mathrm{inv}^{(\top)} = 0$, no $\top$-valued cells.
- $|\mathrm{KP}^{\mathrm{vis}}(B)|_D^{\mathrm{para}}$ — **paraconsistent**: $\mathrm{cl}\text{-}\mathrm{inv}^{(t)} = 0$, no purely $\mathbf{t}$-valued firings.
- $|\mathrm{KP}^{\mathrm{vis}}(B)|_D^{\mathrm{mix}}$ — **mixed**: both invariants non-zero.

## Proof

The bigraded classifying invariant of a aperiodic settling is the pair

$$\mathrm{cl}\text{-}\mathrm{inv}^{(k, t)}(v) \;=\; \bigl(\mathrm{cl}\text{-}\mathrm{inv}^{(t)}(v),\; \mathrm{cl}\text{-}\mathrm{inv}^{(\top)}(v)\bigr) \;\in\; H^1_t \,\oplus\, H^1(\mathcal{F}_U^{(\top)}),$$

with components in the truth-side [settling-associated sheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md) cohomology and the [inconsistency-sheaf](../content/sheaf/content/inconsistency-sheaf/inconsistency-sheaf.md) cohomology respectively.

The three sub-strata correspond to the three possibilities for which components are non-zero — disjoint and jointly exhaustive of $|\mathrm{KP}^{\mathrm{vis}}(B)|_D$ by definition.
Each sub-stratum is non-empty: explicit examples include the [transfinite-induction settling](../examples/transfinite-induction-settling.md) (consistent), its [paraconsistent variant](../examples/paraconsistent-transfinite-settling.md) (paraconsistent), and mixed settlings built by combining $\mathbf{t}$-valued and $\top$-valued initial data with appropriate closure rules. $\square$

## Gauge interaction

The [internal $\mathbb{Z}/2$-gauge](../concepts/internal-z2-gauge.md) from bilattice negation interacts with the trichotomy via the [classifying-morphism $\mathbb{Z}/2$-equivariance](classifying-morphism-z2-equivariance.md):

- The paraconsistent stratum consists of *gauge-stable* settlings — every designated cell is $\top$-valued, fixed by $\sim$.
- The consistent stratum has *gauge-unstable generic settlings* with a gauge-stable self-symmetric sub-locus (when designated cells are diagonal-$\sim$-paired).
- The mixed stratum is *intermediate*: partially gauge-stable, depending on the $\top$-content's distribution.

The gauge therefore decorates the trichotomy with an additional $\mathbb{Z}/2$-equivariant refinement, with concrete structure computable per sub-stratum.

## Reading

The trichotomy is the moduli-level reflection of [paraconsistent classification](paraconsistent-classification.md): the bigraded invariant separates classical structural content ($\mathrm{cl}\text{-}\mathrm{inv}^{(t)}$) from inconsistency-structural content ($\mathrm{cl}\text{-}\mathrm{inv}^{(\top)}$), and the moduli stratifies accordingly.
A aperiodic moduli point can be classical, paraconsistent, or mixed in its $\top$-content; the three are genuinely distinct moduli sub-strata.
