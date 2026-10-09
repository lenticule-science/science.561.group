---
type: concept
class: equivalence-relation
symbol: "\\sim_{\\mathrm{syn}}"
depends-on: [mutually-locally-derivable, cohomological-equivalence, biequivalence-cohomological-collapse, settling-fiber-groupoid]
see-also: [coarse-settling-moduli, settling-morphism, four-regime-dichotomy, synonymy-criterion, antonymy, negation-invisibility]
---

# Synonymy

Two [predication settlings](../objects/predication-settling.md) $v, v'$ over a common base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$ are **synonymous** — written $v \sim_{\mathrm{syn}} v'$ — iff they are [mutually-locally-derivable](mutually-locally-derivable.md), equivalently iff they are [cohomologically equivalent](../../../../../../sheaf/content/settling-cohomology/content/cohomological-equivalence/cohomological-equivalence.md). The [biequivalence-cohomological-collapse theorem](../../../../../../sheaf/content/settling-cohomology/references/biequivalence-cohomological-collapse.md) establishes that these two conditions coincide on every regime stratum, so the definition is unambiguous.

$$v \sim_{\mathrm{syn}} v' \;\iff\; v \sim_{\mathrm{MLD}} v' \;\iff\; v \sim_H v'.$$

The synonymy relation is an equivalence relation. Its equivalence classes are the connected components of the [settling fiber groupoid](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-fiber-groupoid.md) $\mathrm{KP}^\simeq(B)$, and the set of classes is the [coarse settling moduli](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/coarse-settling-moduli.md) $|\mathrm{KP}^{\mathrm{vis}}(B)|$.

## What synonymy captures

Two settlings are synonymous when one can be converted into the other by an invertible [settling-morphism](../morphisms/settling-morphism.md) — a bilattice-homomorphism family that commutes with both settlings' closure endofunctors, up to ordinal shift. The endofunctor-commutation condition is the substance: it forces synonymous settlings to share the same inferential dynamics, not merely the same static values. Synonymy is thus a structural equivalence, not a value equivalence.

In particular, two settlings can be synonymous while having different ordinal starting points (related by settling-shift $\delta$) and different surface notation, as long as their closure patterns are structurally the same.

## What synonymy is not

- **Strict isomorphism**: cell-by-cell identity at every stage, no shift allowed. Strictly finer than synonymy.
- **Preorder morphism** ($\leq_k$ pointwise): a one-way comparison, not symmetric, not structural. Much coarser.
- **Refactoring** (invisible automorphism of a settling): a synonym from a settling to itself that the resource cannot detect. This is the $\delta = 0$ subcase of synonymy among settlings in the same MLD-class.

Synonymy is the coarsest structural equivalence that respects the inferential dynamics of the settling endofunctor. It is the right equivalence for classification: the [aperiodic-regime classification theorem](../../../../../../aperiodic-settling/references/aperiodic-regime-classification.md) and [transfinite-bounded-regime moduli classification](../../../../../../../references/transfinite-bounded-regime-moduli-classification.md) both classify settlings up to synonymy.

## Regime-relative detection

Synonymy is uniform across regimes as a definition, but its detection varies by regime — see [synonymy criterion](../theorems/synonymy-criterion.md) for the explicit per-regime test. The key structural fact: in the strict and Scott-continuous regimes, synonymy has no cohomological witness ($H^1 = 0$) and is detected purely by stage-by-stage combinatorial matching; in the transfinite-bounded and aperiodic regimes, synonymy is detected by agreement of $H^1$-classes, which are non-trivial.
