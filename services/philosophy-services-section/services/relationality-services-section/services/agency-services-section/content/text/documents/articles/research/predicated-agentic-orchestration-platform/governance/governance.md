---
type: concept
class: structure
depends-on:
  - office
  - scope
  - authorization
  - power
  - duty
  - privilege
  - immunity
  - modal-necessity-operator
  - bilattice-accessibility-relation
  - world-set
  - predication-fiber-algebra
see-also:
  - agent
  - escalation
  - federation
  - governance-as-modal-restriction
  - dispatch-composes-authorization
title: Governance
description: "The platform's pattern for who decides: the structural rules by which scope-level decisions are made and by which authority flows through the office graph."
---

# Governance

The platform's pattern for *who decides*: the structural rules by which scope-level decisions are made and by which authority flows through the [office](office.md) graph.
Governance is recorded as predications: who reports to whom, what decisions each office is empowered to make, what escalation paths exist when an office encounters work outside its capability.

Per [governance-as-modal-restriction](governance-as-modal-restriction/governance-as-modal-restriction.md) (status: sketch), governance is read as structurally a [modal-necessity restriction](../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/modal-necessity-operator.md) on the agent's capability fiber, indexed by a [world set](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/world-set.md) of `(scope, time, governing-context)` triples and equipped with a [bilattice accessibility relation](../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-bound/content/world-set/content/bilattice-accessibility-relation/bilattice-accessibility-relation.md) encoding the governance graph.
The substrate's authorized capability for an agent $a$ at predicate $p$ is

$$\mathrm{authorized}_a(p)(s, o) \;=\; (\Box_R u_a)_w(s, o) \;=\; \bigwedge_t \{R(w, w') \to u_a(s, o) : w' \in W\}$$

— the knowledge-meet of the raw capability $u_a$ across all governance worlds $w'$ accessible from the action's world $w$.
Governance is not a permission system layered above the substrate; it is a $\Box_R$ on the same predication-fiber algebra in which capability lives.

## Governance models as accessibility-relation patterns

The platform admits multiple governance models, distinguished by the predication patterns recorded.
Read through the (sketch-status) modal-necessity reformulation, the four conventional models become four *shapes of the accessibility relation* $R$ on the governance world-set — a structural interpretation rather than a settled theorem consequence:

- **Hierarchical ↔ tree-shaped accessibility.** A tree-shaped office graph where each office has exactly one parent. $R(w, w') = \mathbf{t}$ iff $w'$ is the parent-context of $w$ or $w$ itself.
  Decisions an office cannot make escalate by following $R$ upward.
- **Quorum ↔ aggregated multi-source accessibility.** $R(w, w')$ admits multiple parent contexts; the modal necessity $\Box_R$ requires the work survive a *threshold* of parent-context approvals (per the closure-rule's threshold parameter), recovering the quorum's aggregation.
  Once the predication's confidence value reaches the declared threshold, the decision is made.
- **Reputation-weighted ↔ value-graded accessibility.** $R(w, w')$ is bilattice-valued not just at $\{\mathbf{t}, \mathbf{f}, \bot, \top\}$: the value carries the parent-context's *reputation*, computed from past decision quality.
  The aggregate vote is the weighted bilattice meet over $R$.
- **Consent-based ↔ anti-accessibility.** $R(w, w') = \mathbf{f}$ iff $w'$ is an affected-parties context that has *objected*; the meet $\Box_R$ collapses to $\mathbf{f}$ when any objection is recorded.
  Consent is the absence of an objection predication after a declared deliberation period — equivalently, the empty join in the accessibility direction.

All four models are realizable on the same substrate — they differ in *which closure rules govern the decision predications*, not in any platform-level mechanism.
Switching models is replacing the relevant closure rules.
The math is the same modal apparatus throughout; the model choice is a choice of $R$'s shape.

## Hohfeldian positions as accessibility refinements

Per [governance-as-modal-restriction](governance-as-modal-restriction/governance-as-modal-restriction.md) Part 4 (status: sketch), the four classical Hohfeldian positions are read as four shapes on the same accessibility relation rather than as separate primitives:

- **[Power](power.md) ↔ forward accessibility.** $R(w, w')$ where $w'$ is a future state the action would produce.
  The agent's $\Box_R$ over forward-accessible worlds is its power to bring about state changes.
- **[Duty](duty.md) ↔ anti-accessibility on inaction.** Worlds where inaction is not admissible: $R(w, w_{\text{idle}}) = \mathbf{f}$ for $w_{\text{idle}}$ the inaction world under the duty's triggering condition.
- **[Privilege](privilege.md) ↔ trivial accessibility.** $R(w, w') = \mathbf{t}$ for all $w'$ in the privilege's domain — the agent's action is unconstrained within scope.
- **[Immunity](immunity.md) ↔ protected accessibility.** $R(w'', w) = \bot$ from any other world $w''$ to the agent's state $w$ — the agent's state cannot be changed by another's action.

On this sketch reading, Hohfeld's classical analysis is interpretable as the four basic shapes on the modal-necessity operator over the governance world-set: the substrate need not implement four separate position-types; it records one accessibility relation, and the four positions become different *queries* against it.
All consequences in this section are sketch-status structural readings, not settled theorem outputs.

## Engineering invariants

- **Recorded.** Per the theorem's "governance is queryable as substrate state" engineering reading (sketch), every decision produces a [witness](../../teaching/explanations/witness.md): the decision content, the offices participating, the rule under which it was made, the resulting predications.
  The witness is appended to the [event log](../../../objects/event-log.md).
  An auditor reconstructing the governance history reads the event log; querying current authorization is the substrate-traversal computation of $(\Box_R u_a)_w$.
- **Scope-local by construction.** A governance decision affects only the scope it was made within because the modal necessity $\Box_R$ is computed at *that scope's world coordinate* in $W$.
  Cross-scope governance — decisions affecting multiple scopes — is the engineering case requiring [federation](federation.md) and explicit bridges; under the sketch reformulation a federation bridge is read as a translation of accessibility relations between two governance graphs, with the cross-platform $\Box_R$ involving the *union* of accessibility relations.
- **Self-representable.** Governance rules are themselves [closure rules](../../teaching/explanations/closure-rule.md); the office graph is itself a sub-region of the predication-graph store.
  Per [self-representation](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md), there is no off-substrate "organizational structure" — the structure is *in* the substrate, and editing the structure is editing predications.
  Adding an authority, revoking it, restructuring the governance graph — all are substrate edits; under the sketch reformulation the next $\Box_R$ computation reflects the change immediately.
- **Bilattice-valued, not Boolean.** Per the (sketch) theorem's rule-out, a governance system that uses Boolean-valued authority relations loses the four-bilattice's expressivity.
  Partial authority — "this office has authority that is recognized by some but not all participants" — is a real governance state, recorded as $\bot$ on the corresponding accessibility cell.
  Contested authority is recorded as $\top$.
- **Soul-violation as modal validity.** Per [soul-violation-check](../agent/governing-soul/soul-violation-check/soul-violation-check.md), the substrate's check that a proposed action does not violate the governance soul is the validity check $\Box_R(\text{action-allowed}) \neq \mathbf{f}$ at the action's world.

## Composition with dispatch

Per [dispatch-composes-authorization](../dispatch/dispatch-composes-authorization/dispatch-composes-authorization.md), [dispatch](dispatch.md) composes capability with authorization in one [twist-product fusion](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md).
Under the (sketch) governance reformulation, governance enters as the *modal restriction on the authorization side*: the capability an agent presents to dispatch is read as the modally-restricted $\Box_R u_a$ rather than the raw $u_a$ — the capability that survives the governance graph's accessibility constraints.
A dispatch decision under governance is therefore

$$\mathrm{match}(w, a) \;=\; \mathrm{required}(w) \,\odot\, (\Box_R u_a)_w$$

— the work-item's required capability $\odot$-fused with the agent's modally-restricted capability at the dispatch world $w$.
An agent whose capability is constrained by governance to $\bot$ at the relevant world cannot match, regardless of what their raw capability says.
Governance is therefore *not* a post-dispatch filter; it is a pre-fusion restriction that changes the value being fused.

## What the discipline refuses

- **Runtime-branching governance.** Per the theorem's first rule-out, a platform that implements governance as runtime branching ("`if user.role == 'admin' then allow`") is not substrate-recorded governance.
  The branching is not part of the closure-rule system; it cannot be modally analyzed; it cannot be federation-bridged.
  The substrate's response is to lift the branching into substrate content as a power/duty/privilege/immunity predication.
- **Boolean-valued authority.** Per the theorem's second rule-out, governance restricted to authorize/deny without partial-authority $\bot$ or contested-authority $\top$ cannot represent contested or partially-recognized authority — engineering states the corpus has shown to occur in real federations.
- **Non-natural accessibility.** Per the theorem's third rule-out, a governance system whose accessibility relation is not natural under predicate-category morphisms cannot be federated cleanly: cross-substrate dispatches under such governance produce different modal computations on each side.
  The substrate's discipline is that $R$ is recorded as $\mathcal{C}$-natural predications.

## Position in the platform

Governance is the agential-orchestration platform's *authority-restriction surface*: the substrate's representation of who may act, on what, in which context, with which weight.
Together with [authorization](authorization/authorization.md) (the act of presenting governance-restricted capability), [office](office.md) (the unit of governance graph), [dispatch](dispatch.md) (the operator that composes required capability with authorized capability), and the four Hohfeldian positions, governance completes the platform's account of the action's path from intention to admission.
Particular platform realizations choose particular accessibility-relation shapes (hierarchical, quorum, reputation-weighted, consent-based); the corpus's claim is that *all* are substrate-level patterns on the same modal-necessity operator over the same world-set, and that the choice between them is a closure-rule edit, not an architectural decision external to the substrate.
