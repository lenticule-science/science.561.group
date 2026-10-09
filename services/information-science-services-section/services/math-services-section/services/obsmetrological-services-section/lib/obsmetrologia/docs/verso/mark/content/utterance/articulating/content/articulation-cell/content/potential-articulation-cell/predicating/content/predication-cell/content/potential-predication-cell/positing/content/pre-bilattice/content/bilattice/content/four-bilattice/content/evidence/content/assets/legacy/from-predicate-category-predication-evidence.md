---
type: concept
depends-on: [twist-product, four-bilattice]
see-also: [truth, knowledge, negation, truth-order, knowledge-order, temporal-accumulation]
---

# Evidence

The role borne by the two components of a [twist product](../../../../../../../../../../residuated-lattice/content/twist-product/twist-product.md) value $\langle a_+, a_- \rangle \in L_1 \times L_2$. The first coordinate $a_+$ tracks **positive evidence** (information for the assertion); the second coordinate $a_-$ tracks **negative evidence** (information against). The role's content is the structural commitment that the value of an assertion is a *pair* of independently tracked sides, never collapsed into a single signed scalar.

The two evidence kinds behave dually under the bilattice's two orders. The [truth order](../../../../../../../../truth-order/truth-order.md) raises positive evidence and lowers negative evidence; the [knowledge order](knowledge-order.md) raises both. [Negation](negation.md) interchanges positive and negative evidence: $\sim \langle a_+, a_- \rangle = \langle a_-, a_+ \rangle$.

## The role's three pressures

A framework realizes evidence — rather than a thinner notion such as classical truth-value or single-axis confidence — when it carries each of the following:

- **Independence of the two sides.** Positive and negative evidence must be separately representable, so that the absence of one is distinguishable from the presence of the other. This is what fails in classical two-valued and three-valued logics, where "no information for $p$" cannot be told apart from "evidence against $p$."
- **Compatibility of the two sides.** The two sides must be jointly representable, so that *both* can hold at once without trivializing inference. This is what licenses the role's distinguishing value $\top = \langle 1, 1 \rangle$ — *contradiction held as a state*, not propagated as ex falso.
- **Transverse aggregation.** The two sides must aggregate *separately under accumulation*: receiving more positive evidence raises the first coordinate while leaving the second unchanged, and vice versa. This is what makes [temporal accumulation](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/temporal-accumulation.md) compatible with the role rather than destructive of it.

These three pressures motivate factoring the value space as a product of two ordered components — a [twist product](../../../../../../../../../../residuated-lattice/content/twist-product/twist-product.md). For the class where this factorization holds globally, [Avron representation](../theorems/avron-representation.md) supplies the converse: every *bounded interlaced* (pre-)bilattice in fact arises as a twist product. Within that class, the twist-product realization is *the* realization of evidence — not one option among several. Outside it (bilattices that are not interlaced, or that lack global bounds), the role is still realizable, but the realization is no longer guaranteed to globalize into a clean coordinate split.

## The FOUR realization

In the [four-element bilattice](../objects/four-bilattice.md): $\bot = \langle 0, 0 \rangle$ (no evidence), $\mathbf{t} = \langle 1, 0 \rangle$ (only positive), $\mathbf{f} = \langle 0, 1 \rangle$ (only negative), $\top = \langle 1, 1 \rangle$ (both positive and negative — contradictory). The two truth-determinate configurations $\mathbf{t}$, $\mathbf{f}$ are at the same $\leq_k$-rank but opposite $\leq_t$-positions; the two truth-indeterminate configurations $\bot$, $\top$ are at opposite $\leq_k$-ranks and at distinct intermediate $\leq_t$-positions — both lying strictly between $\mathbf{f}$ and $\mathbf{t}$ but incomparable to each other in $\leq_t$. The role's transversality is visible directly in the diamond: each axis carries information that the other does not.

## Beyond Belnap

Richer ordered components than $\{0, 1\}$ realize the same role with finer granularity. When $L_1 = L_2 = [0, 1]$, the role is realized as a continuous degree of evidence on each side, and the bilattice is the standard *fuzzy bilattice* used in graded reasoning. When $L_1, L_2$ are arbitrary bounded distributive lattices of evidence-grades, the role is realized in the full bounded-interlaced setting, and [Avron representation](../theorems/avron-representation.md) certifies that the bilattice arising algebraically is the same one obtained from the twist-product construction. The role's content — *track the two sides separately, aggregate them transversely* — is invariant across these realizations.

## Under settling and merge

Evidence enters a [predication settling](../objects/predication-settling.md) through the [increment sequence](../objects/increment-sequence.md): each step contributes a [predication valuation](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predication-valuation.md) of new evidence, joined into the prior state via $\vee_k$ before the closure fires. The role's transverse-aggregation pressure is what makes this $\leq_k$-join the right operation: it raises positive and negative evidence component-wise without entangling them. Across observers, the same $\leq_k$-join realizes [CRDT-convergent merge](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/crdt-convergence.md), so the role's structural content extends from the single-observer setting to the distributed one without modification.
