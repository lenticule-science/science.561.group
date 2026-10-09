---
name: "Evidence"
description: "The role borne by the two components of a twist-product value: positive evidence (first coordinate) tracks information for an assertion; negative evidence (second coordinate) tracks information against. The two evidence kinds behave dually under the bilattice's two parallel orders."
date-created: 2026-04-29

---

**Evidence** is the role borne by the two coordinates of a [twist-product](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/residuated-lattice/content/twist-product/twist-product.md) value $\langle a_+, a_- \rangle \in L \times L$. The first coordinate $a_+$ tracks **positive evidence** — information *for* the assertion. The second coordinate $a_-$ tracks **negative evidence** — information *against*. Together they record the two-sided evidential situation a value reports.

This is Belnap's reading of the two coordinates, and it belongs to the truth order. Articulation reads its cells only by which hands of an utterance are articulated, and relationality has no evidence against; evidence for and against enters with value and its truth order at [positing](positing.md).

The two evidence kinds are not just two lattice components used as bookkeeping. They behave differently under the two parallel orders of the [bilattice](bilattice.md), and the difference is what makes a bilattice's values four-cornered rather than bivalent.

## Behavior under the two orders

- The [truth order](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/truth-order/truth-order.md) $\leq_t$ raises positive evidence and *lowers* negative evidence. A value tilts toward affirmation when its positive component grows and its negative component shrinks. The truth order's directionality is the asymmetry: it is monotone in $a_+$ and antitone in $a_-$.
- The [knowledge order](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/knowledge-order/knowledge-order.md) $\leq_k$ raises *both* components. A value rises in the knowledge order whenever any evidence accumulates, regardless of direction. The knowledge order does not distinguish affirming from denying evidence; it counts amount.

This dual behavior is what makes the bilattice non-trivial. A value with much positive and much negative evidence (high $\top$) is high on the knowledge axis (lots of evidence) but mid on the truth axis (the evidence cancels). A value with no evidence in either direction (low $\bot$) is low on both axes. These two cases are structurally different — both-witnessed-paraconsistently versus un-witnessed — and the bilattice records the difference.

## Negation as evidence-swap

[Negation](negation.md) on the twist product is exactly the swap of evidence components:

$$\sim \langle a_+, a_- \rangle = \langle a_-, a_+ \rangle.$$

The positive evidence of the negated value is the negative evidence of the original; the negative is the positive. This is consistent with the truth-axis behavior of negation (antitone — flips direction) and the knowledge-axis behavior (monotone — preserves amount): swapping components reverses the truth-axis tilt while preserving the total information.

## Four canonical configurations

The [four-element bilattice](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/four-bilattice/four-bilattice.md) $\mathbf{FOUR}$ instantiates the four canonical evidence configurations:

| Value | Positive evidence | Negative evidence | Reading |
|---|---|---|---|
| $\bot = \langle 0, 0 \rangle$ | none | none | no evidence at all |
| $\mathbf{t} = \langle 1, 0 \rangle$ | full | none | only positive — *told true* |
| $\mathbf{f} = \langle 0, 1 \rangle$ | none | full | only negative — *told false* |
| $\top = \langle 1, 1 \rangle$ | full | full | both — *told both* (paraconsistent) |

These four corners are the bilattice's extremal positions; everything else is interior — partial evidence in one or both directions, intermediate truth-axis tilt and intermediate knowledge-axis position.

## Evidence and settlement

A value's [settlement](settlement.md) position is its joint coordinate on the two axes — what evidence it carries and in what direction. Settlement is not an abstract truth-value attached to the value; it is the joint shape of the value's evidence. Reporting a value's settlement and reporting its evidence are the same act, viewed at the joint and component levels.

## What produces evidence

Witnessing produces evidence: a [witness](witness.md) recorded for a claim is evidence for it, and one recorded against it is evidence against. Evidence is a positive achievement on both sides. The absence of evidence for a claim is not evidence against it, only absence: the absurd corner, where nothing has been witnessed either way. A refuted claim (evidence against recorded) and an unexamined one (nothing recorded) are structurally different, and keeping them apart is the point of carrying two sides rather than one signed quantity.

Evidence is claim-relative. The same record can support one claim, refute another and bear on a third not at all, so an evidence record names the claim it bears on, the direction of its contribution, its source, and how it was interpreted.

## Evidence has an arrow of time

Evidence accumulates monotonically: under settling, positions rise in the knowledge order and never fall. Once recorded, evidence is not erased. New evidence can shift the tilt on the truth axis, and a claim settled toward affirmation becomes told-both if evidence against arrives, but nothing returns a claim to the unwitnessed state.

## Keeping evidence in a system

A system that bears evidence aggregates the two sides independently and preserves conflict instead of collapsing it to one Boolean or treating contradiction as failure. Silence, support alone, refutation alone and conflict are four materially different conditions, and a system that keeps them apart can report which one it is in.

## See also

- [Twist product](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/residuated-lattice/content/twist-product/twist-product.md) — the construction whose components carry the two evidence kinds.
- [Bilattice](bilattice.md) — the algebraic structure with two parallel orders that evidence behaves duallly under.
- [Knowledge order](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/knowledge-order/knowledge-order.md), [Truth order](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/truth-order/truth-order.md) — the two axes evidence is read along.
- [Negation](negation.md) — swaps positive and negative evidence.
- [Four-bilattice](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/four-bilattice/four-bilattice.md) — the canonical small bilattice exhibiting the four evidence configurations.
- [Witness](witness.md) — the record whose presence is evidence.
- [Positing](positing.md) — the stage at which evidence is admitted.
- [Settlement](settlement.md) — the joint structure within which evidence configurations are positioned.
