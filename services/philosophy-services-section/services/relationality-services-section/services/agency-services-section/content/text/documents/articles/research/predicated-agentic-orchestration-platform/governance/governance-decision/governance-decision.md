---
type: morphism
class: composed-operator
realizes: [governance]
depends-on: [governance, office-record, modal-necessity-operator, bilattice-accessibility-relation, predication-fiber-algebra]
see-also: [escalation, soul-violation-check, governance-as-modal-restriction]
title: Governance decision
description: The operator that admits a proposed substrate change after the cited governance model has produced agreement.
---

# Governance decision

The operator that admits a proposed substrate change after the cited [governance](teaching/explanations/governance.md) model has produced agreement.
A governance decision is structurally a [modal necessity](../../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/modal-necessity-operator.md) check — per [governance-as-modal-restriction](../governance-as-modal-restriction/governance-as-modal-restriction.md), the decision evaluates the modal $\Box_R$ of the proposed action's permissibility across the world set of authority contexts ($R$ = the bilattice accessibility relation derived from the office graph).
The decision admits the action when the modal evaluation produces an affirmative bilattice value at the action's world.

## Signature

`governance-decision(proposed-action, scope) → (admitted-action, witness) | (rejection, witness)`

Inputs:

- **`proposed-action`** — reference to the substrate action being proposed: an edit to an [office record](../objects/office-record.md), a [skill record](../objects/skill-record.md) revision, an authorization change, etc.
- **`scope`** — reference to the [scope](../../scope/scope.md) the action affects, determining which [governance](teaching/explanations/governance.md) rule and accessibility-relation structure applies.

Outputs:

- **`admitted-action`** — on success, a substrate event applying the proposed action to the substrate.
  The event carries witness predications citing the governance decision that admitted it.
- **`rejection`** — on failure, a substrate event recording the rejection: which decision rule failed (insufficient quorum, vetoes present, no consent within deliberation window, soul-violation flagged).
- **`witness`** — both outcomes produce witnesses; the witness records the participating offices, their declared positions, the rule applied, the canonical hashes of the proposed action and the resulting state.

## Operational semantics

Governance decision proceeds per the cited governance model.
Each model is a particular shape on the [bilattice accessibility relation](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-bound/content/world-set/content/bilattice-accessibility-relation/bilattice-accessibility-relation.md):

- **Hierarchical.** The accessibility relation gives full $\mathbf{t}$ from a higher office to a lower.
  Identify the office in the scope with the relevant authority for the proposed action; the decision is the office head's affirmative response.
  Escalation up the office graph applies if the office cannot resolve the matter.
- **Quorum.** The accessibility relation has $\mathbf{t}$ values determined by per-office voting weights summing past a threshold.
  Identify the offices entitled to vote; collect their position predications (affirmative, negative, abstain); the decision admits the action when the affirmative count crosses the declared threshold.
- **Reputation-weighted.** As quorum, but the accessibility relation's weights are scaled by each office's reputation predication.
- **Consent-based.** The accessibility relation is $\mathbf{t}$ unless any participating office records an objection.
  Identify the affected-parties set; the decision admits the action when no objection predications are recorded within the declared deliberation window.

In all models, [soul-violation-check](../../agent/governing-soul/soul-violation-check/soul-violation-check.md) runs alongside: per [governance-as-modal-restriction](../governance-as-modal-restriction/governance-as-modal-restriction.md)'s soul-violation as modal-validity-check, if the proposed action would violate the cited scope's [governing soul](../../agent/governing-soul/governing-soul.md), the decision rule does not admit (regardless of the model's affirmative outcome).
Soul violations override governance affirmative.

## Engineering invariants

- **Witness-recorded on both outcomes.** Both admission and rejection produce witnesses.
  A governance event is a substrate event regardless of its outcome.
- **Decision rule cited.** The witness cites which decision rule was applied; an audit can check that the rule's invocation conditions were met.
- **Participating offices recorded.** The witness records every office that participated, with each office's recorded position.
  An audit can verify the participation set against the scope's governance predications.
- **Outcome traceable.** The admitted (or rejected) action's [event log](../../../objects/event-log.md) entry cites the governance-decision witness; an auditor can chain backward from the action to the decision.
- **Modal-coherent.** Per [governance-as-modal-restriction](../governance-as-modal-restriction/governance-as-modal-restriction.md), the decision's outcome is consistent with $\Box_R$ evaluated at the action's world.
  Two governance decisions on the same proposal at the same world produce the same outcome.

## Failure modes

- **Insufficient participation.** Quorum or consent rules require a minimum participation level; a decision below the level is recorded as rejected for non-participation rather than admitted by default.
- **Soul violation.** Per soul-violation-check, the proposed action would violate the scope's governing soul; the decision is rejected regardless of office affirmative.
- **Conflict between sources.** Two governance rules give contradictory outcomes (one admits, the other rejects); the substrate's [repair](../../teaching/explanations/repair.md) discipline determines which rule's authority is canonical for this scope.
  If the conflict is irreducible (per [bilattice network-sheaf consensus](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md)'s $\top$-witness for disagreement), the decision is escalated.

## Position in the platform

Governance decision is the operator that *admits substrate change under collective authority*.
Without it, all changes are individual authorizations; with it, the platform supports decisions that require collective agreement.
The decision's witness is the substrate-recorded artifact of the decision; the action's admittance is contingent on the witness existing.

The pattern composes with [office-record](../objects/office-record.md) (the structural data the accessibility relation is computed from), [governance-as-modal-restriction](../governance-as-modal-restriction/governance-as-modal-restriction.md) (the math anchor), [soul-violation-check](../../agent/governing-soul/soul-violation-check/soul-violation-check.md) (the modal-validity check), and [escalation](../escalation/escalation.md) (the deferred-decision pathway).
