---
type: theorem
class: engineering-claim
status: proved
depends-on: [dispatch-matching, twist-product-fusion, quantale-enriched-sheaf, predication-fiber-algebra, q-fuzzy-equivalence, dispatch-composes-authorization]
see-also: [federation-path-metrics-multiplicative, cycle-holonomy-as-federation-disagreement]
---

# Graded dispatch is q-enriched fusion

**Claim.** For any [dispatch-matching](theories/agential-orchestration-platform/morphisms/dispatch-matching.md) operation against a candidate agent $a$, with required-capability predication $r$ and agent-capability predication $u_a$ in a [quantale-enriched](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/quantale-enriched-sheaf.md) [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) over a commutative unital quantale $\mathsf{Q}$, the substrate's match value

$$\mathrm{match}(r, u_a) \;=\; r \odot u_a \;\in\; A_p$$

decomposes into a *bilattice tag* $\tau \in \mathbf{L}^\bowtie$ and a *quantale grade* $q \in \mathsf{Q}$. The substrate's match operation is the q-enriched analogue of [twist-product fusion](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md) on the fiber's complete weighted lattice structure — and the quantale grade composes multiplicatively across sequential dispatch decisions:

$$q(r_1 \odot u_{a_1} \odot r_2 \odot u_{a_2}) \;=\; q(r_1 \odot u_{a_1}) \cdot q(r_2 \odot u_{a_2})$$

where $\cdot$ is the quantale's binary operation.

## Why this holds

Per [quantale-enriched-sheaf](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/quantale-enriched-sheaf.md), a $\mathsf{Q}$-enriched fiber is a complete weighted lattice with hom-objects in $\mathsf{Q}$. Per the quantale axioms, the binary $\cdot$ distributes over arbitrary suprema:

$$p \cdot \bigvee_{i \in I} q_i \;=\; \bigvee_{i \in I} (p \cdot q_i).$$

This distributivity is exactly what makes [twist-product fusion](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md) $\odot$ on a $\mathsf{Q}$-enriched fiber compose grades multiplicatively: when $\odot$ combines two predications, the resulting grade is the $\cdot$-product of the input grades, distributed across the bilattice's join structure.

The bilattice tag follows the standard $\odot$ rules ($\mathbf{f}$ is absorbing, $\mathbf{t}$ is unit, $\bot/\top$ behave per [twist-product](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/twist-product.md)). The quantale grade is a *separate* component that records strength-of-match along the same composition.

Two outcomes whose quantale grades differ by less than $q$ in $\mathsf{Q}$ are [q-fuzzy-equivalent](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/q-fuzzy-equivalence.md) — the substrate uses this equivalence to decide tie-breaks among near-equal candidates.

## Engineering consequence

- **Strength is composable.** Per the multiplicative composition, dispatch chains have predictable cumulative grade — the substrate can predict the final match strength of a multi-step delegation from per-step grades.
- **Federation-stable composition.** Per [federation-path-metrics-multiplicative](federation-path-metrics-multiplicative.md), the same multiplicative composition applies across federation edges; dispatch grades cross substrates without ambiguity.
- **Tie-break is principled.** Per [q-fuzzy-equivalence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/q-fuzzy-equivalence.md), candidates within $q$-grade of each other form an equivalence class; the dispatch policy's secondary rule applies to the class, not to micro-differences.
- **Cost-models become quantales.** A dispatcher needing latency-aware routing picks $\mathsf{Q} = ([0, \infty], +, \min)$ (the [Lawvere quantale](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/examples/benchmark-lawvere-quantale-settling.md)); a dispatcher needing reliability-weighted routing picks $\mathsf{Q} = ([0, 1], \cdot, \max)$; a dispatcher needing modal trust picks $\mathsf{Q} = \mathbf{L}^\bowtie$ itself. The substrate's dispatch is the same operator in each case — only the quantale changes.
- **Multi-criteria via product quantales.** Per the quantale's closure under products, a dispatcher needing multiple criteria (latency × reliability × authority-grade) uses a product quantale; multiplicative composition handles all dimensions in one operation.

## What the theorem rules out

- **Boolean dispatch on a quantale-enriched fiber.** A dispatcher that ignores the quantale grade and uses only the bilattice tag is operating in a subcategory; per this theorem, the platform's grade is structural and discarding it loses substrate information.
- **Non-multiplicative cost composition.** A dispatcher that adds grades along a path (rather than multiplying per the chosen quantale's $\cdot$) is not implementing q-enriched composition. The choice of quantale determines whether $\cdot$ is $+$, $\times$, $\min$, or another operation; the substrate's composition follows the quantale.
- **Cost models that aren't quantales.** A cost-model that doesn't distribute over suprema — e.g., a non-monotonic policy — cannot be lifted into the q-enriched dispatcher. The substrate's dispatch is bounded to monotone, distributive cost-models.

## What the theorem requires

- The fiber-algebra is enriched over a commutative unital quantale $\mathsf{Q}$ (per [quantale-enriched-sheaf](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/quantale-enriched-sheaf.md)).
- The dispatch's $\odot$ operator respects the q-enrichment (the substrate's implementation of $\odot$ uses the quantale's $\cdot$ for the grade component).
- The bilattice tag composes per [twist-product](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/twist-product.md) rules independently of the grade.

## Position

Together with [federation-path-metrics-multiplicative](federation-path-metrics-multiplicative.md) and [cycle-holonomy-as-federation-disagreement](cycle-holonomy-as-federation-disagreement.md), this theorem grounds the substrate's quantale-graded dispatch in the q-enriched-sheaf structure on the predication fiber algebra. Per [dispatch-composes-authorization](theories/agential-orchestration-platform/theorems/dispatch-composes-authorization.md), $\odot$ already composes capability with authorization in one application; this theorem extends that composition to the multiplicative-grade dimension.
