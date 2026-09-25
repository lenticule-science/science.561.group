---
type: concept
class: modality
status: draft
depends-on: [modal-necessity-operator, modal-possibility-operator, klein-four-symmetry, jural-relation]
realizes: [power, duty, privilege, immunity]
title: Deontic modality
description: A reading of the Hohfeldian first/second-quartet kinds (power, duty, privilege, immunity, and their correlatives) as bilattice-modal operators on a bilattice accessibility relation $R^O$ — the authority frame of an office or normative…
---

# Deontic modality

A reading of the Hohfeldian first/second-quartet kinds (power, duty, privilege, immunity, and their correlatives) as bilattice-modal operators on a [bilattice accessibility relation](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-bound/content/world-set/content/bilattice-accessibility-relation/bilattice-accessibility-relation.md) $R^O$ — the *authority frame* of an office or normative system $O$.

The accessibility relation $R^O(w, w') \in \mathbf{FOUR}$ records, for each pair of operations-settling stages or scope-action worlds, the bilattice-valued *authorization-strength* from $w$ to $w'$ under $O$'s constitutive power.

## The four kinds as modal operators

For an action-payload $u : W \to \mathbf{FOUR}$ on the action-world set $W$:

| Kind | Operator | Reading |
|---|---|---|
| **Power** ($\Diamond_{R^O}$) | $(\Diamond_{R^O} u)_w := \bigvee_t \{R^O(w, w') \odot u_{w'}\}$ | "There is some authorized continuation in which $u$ holds" — the potential-holder *can* act so as to bring $u$ about. |
| **Duty** ($\Box_{R^O}$) | $(\Box_{R^O} u)_w := \bigwedge_t \{R^O(w, w') \to u_{w'}\}$ | "Every authorized continuation has $u$" — the potential-holder *must* act so $u$ holds. |
| **Privilege** ($\sim \Box_{R^O} \sim$) | $\sim \Box_{R^O} \sim u$ | The Klein-four $\sim$-conjugate of duty: "no duty *not* to $u$." Negative duty. |
| **Immunity** ($\sim \Diamond_{R^{O,\mathrm{imp}}} \sim$) | $\sim \Diamond \sim$ over the *imposition* frame | "No power on the passive party can authorize $u$ being imposed." Negative power on the converse frame. |

The truth-axis $\bigvee_t / \bigwedge_t$ aggregations are the predication-fiber's [twist-product fusion](../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md) and [twist-product right-residual](../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-right-residual.md), so the operators inherit the bilattice's consistent-vs-paraconsistent structure: a power can be $\top$-valued (simultaneously authorized and forbidden), and a duty can be $\bot$-valued (no information about whether the action is binding) without the calculus collapsing.

## Klein-four orbit recovers Hohfeld's eightfold

The bilattice's [Klein-four symmetry](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/klein-four-symmetry/klein-four-symmetry.md) ($\mathrm{id}$, negation $\sim$, conflation $-$, double $\sim\circ-$) acts on each operator. Combined with the [correlate-of](../../../../../sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/services/predicated-governance-services-section/content/glossary/terms/correlate-of.md) operation (which exchanges the potential-holder/passive-party roles, equivalently swaps the modal frame between $R^O$ and its converse $R^{O,\mathrm{imp}}$), the orbit of any starting kind under the Klein-four group times the correlate-of involution recovers Hohfeld's full eightfold:

$$\{\text{power}, \text{liability}, \text{no-power}, \text{immunity}, \text{duty}, \text{claim}, \text{privilege}, \text{disability}\}.$$

The eightfold is therefore not a flat enumeration of unrelated relations — it is the orbit of a *single* modal generator under the Klein-four × $\mathbb{Z}/2$ action. The closure-of-the-orbit property is the structural reason why every Hohfeldian operation on one kind has a determinate action on every other kind in the orbit, made precise in [correlative-pair-as-modal-dual](../../../../../sociology-science-services-section/services/work-science-services-section/content/text/documents/articles/notes/undated/correlative-pair-as-modal-dual.md).

## Why this is the right reading

Three structural reasons the bilattice-modal reading is preferable to a flat predicate-cell reading:

1. **Composition.** Modal operators compose: $\Diamond_R \Diamond_S$ is again a modal operator (over the composite accessibility $R \circ S$). Delegation chains are exactly composite modal frames — the principal's $\Diamond_{R^P}$ followed by the delegate's $\Diamond_{R^B}$ gives the composite power, with the [predicate-specialization](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-specialization.md) bound on $R^B \subseteq R^P$ enforcing *delegatus non potest delegare*.
2. **Correlative duality.** Box/Diamond duality $\Box \;=\; \sim \Diamond \sim$ on $\mathbf{FOUR}$ supplies *half* of the correlative pairing — the kind-side component — with the other half being the frame-converse $R^O \mapsto R^{O,\mathrm{imp}}$ on the agent pair. The substrate doesn't need a separate `correlate-of` axiom; it follows from the composite of these two operations applied to the appropriate frame, per [correlative-pair-as-modal-dual](../../../../../sociology-science-services-section/services/work-science-services-section/content/text/documents/articles/notes/undated/correlative-pair-as-modal-dual.md).
3. **Aggregation across continuations.** "Every authorized continuation" and "some authorized continuation" are the operational content of duty and power — both are aggregations over forward-stages of the operations settling, exactly what $\Box$ and $\Diamond$ compute on a settling-as-Kripke-frame.

The flat predicate-cell reading (a duty is just a `kind=duty` cell) gets the *recording* right but loses the *quantification structure*. Both readings coexist on the substrate: the cells of a [jural relation](../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/jural-relation.md) entity *are* the recording, and the modal-operator reading *is* the quantification structure those cells satisfy. The two views are linked by [correlative-pair-as-modal-dual](../../../../../sociology-science-services-section/services/work-science-services-section/content/text/documents/articles/notes/undated/correlative-pair-as-modal-dual.md).

## Position

This concept gives the structural answer to why governance has *exactly* four first-order kinds rather than three or five: the Klein-four group of bilattice symmetries acting on a single modal generator has orbit-size four, and the correlate-of involution doubles it to eight. Hohfeld's eightfold is the orbit; the deontic-modal reading is its source.
