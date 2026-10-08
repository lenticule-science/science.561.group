---
type: theorem
class: engineering-claim
status: sketch
depends-on: [governance, authorization, power, duty, privilege, immunity, modal-necessity-operator, modal-possibility-operator, bilattice-accessibility-relation, world-set, predication-fiber-algebra, twist-product-fusion]
see-also: [dispatch-composes-authorization, soul-violation-check]
title: Governance is modal restriction on the agent's capability fiber
description: Claim.
---

# Governance is modal restriction on the agent's capability fiber

**Claim.** The platform's [governance](teaching/explanations/governance.md) discipline — the substrate-recorded constraints on what an agent may do — is structurally a [modal restriction](../../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/modal-necessity-operator.md) on the agent's capability fiber, indexed by a [world set](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/world-set.md) of (scope, time, governing-context) triples and equipped with a [bilattice accessibility relation](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-bound/content/world-set/content/bilattice-accessibility-relation/bilattice-accessibility-relation.md) encoding the governance graph.

For an agent $a$ with capability fiber $u_a \in A_p$ at predicate $p$ ("permission to perform $p$"), the agent's *authorized* capability under governance is

$$\mathrm{authorized}_a(p)(s, o) \;=\; (\Box_R u_a)_w(s, o) \;=\; \bigwedge_t \{R(w, w') \to u_a(s, o) : w' \in W\}$$

where $W$ is the world set of governance contexts, $R(w, w')$ is the bilattice accessibility from world $w$ to world $w'$ (encoding "in context $w$, may we proceed to context $w'$?"), and $\to$ is the strong implication on the bilattice.
The four Hohfeldian positions ([power](teaching/explanations/power.md), [duty](teaching/explanations/duty.md), [privilege](teaching/explanations/privilege.md), [immunity](teaching/explanations/immunity.md)) are different choices of accessibility-relation structure on the same modal apparatus.

## Why this holds

Governance constraints on agent action are not separate "permission systems" layered on top of the substrate.
They are predications on the agent's relationship to the substrate, valued in the same [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) as capability predications.
The math reformulation:

**Part 1: Governance contexts form a world set.** A governance context — the combination of *scope of action*, *time of action*, *governing authority*, *applicable charter* — is structurally a world in a Kripke-style frame.
The platform's governance graph (offices, authorities, charter hierarchies) determines $W$ as the set of admissible governance contexts.

**Part 2: Authority relations are bilattice-valued accessibility.** "Office $o_1$ has authority over scope $s_2$" is a [bilattice](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice.md)-valued predication, not a Boolean.
Partial authority (governance recognized but contested), full authority, and contested-no authority are distinguishable values.
The set of these predications across all (office, scope) pairs is a bilattice accessibility relation $R: W \times W \to \mathbf{L}^\bowtie$ on the governance graph.

**Part 3: Authorization is necessity over the accessibility.** An agent's authorized capability at world $w$ is the [knowledge-meet](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) over all worlds $w'$ accessible from $w$ — equivalently, the modal $\Box_R$ of the agent's capability fiber.
This is the substrate-side instance of the [modal necessity operator](../../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/modal-necessity-operator.md).

**Part 4: The four Hohfeldian positions are accessibility-relation refinements.** - **Power** (the agent may change a state) corresponds to *forward* accessibility: $R(w, w')$ where $w'$ is a future state the action would produce. - **Duty** (the agent must act if some condition holds) corresponds to *anti-accessibility*: worlds where inaction is not admissible. - **Privilege** (the agent's action is not constrained) corresponds to *trivial accessibility*: $R(w, w') = \mathbf{t}$ for all $w'$ in the privilege's domain. - **Immunity** (the agent's state is not changeable by another) corresponds to *protected accessibility*: $R(w'', w) = \bot$ from any other world $w''$ to the agent's state $w$.

## Composition with dispatch

Per [dispatch-composes-authorization](../../dispatch/dispatch-composes-authorization/dispatch-composes-authorization.md), dispatch composes capability with authorization in one $\odot$ application.
Governance enters as the modal restriction on the authorization side: the authorization predication an agent presents to dispatch is *not* the raw $u_a$, but the modally-restricted $\Box_R u_a$ — the capability that survives the governance graph's accessibility constraints.

A dispatch decision under governance is therefore:

$$\mathrm{match}(w, a) \;=\; \mathrm{required}(w) \,\odot\, (\Box_R u_a)_w$$

— the work-item's required capability fused with the agent's modally-restricted capability at the dispatch world $w$.
An agent whose capability is constrained by governance to $\bot$ at the relevant world cannot match, regardless of what their raw capability says.

## Engineering consequence

Several engineering consequences follow:

- **Governance is queryable as substrate state.** Per [project](../../../morphisms/project.md), an auditor can ask "what is agent $a$'s authorization at scope $s$ in context $w$?" — the answer is the modal-necessity computation $(\Box_R u_a)_w$, executable as a substrate traversal.
  There is no separate "permissions service."
- **Governance changes are immediate.** Per [scope-as-predication](../../teaching/explanations/scope-as-predication.md), authority predications and accessibility-relation predications are substrate content.
  Adding an authority, revoking it, restructuring the governance graph — all are substrate edits.
  The next $\Box_R$ computation reflects the change.
- **Soul-violation-check is modal validity.** Per [soul-violation-check](../../agent/governing-soul/soul-violation-check/soul-violation-check.md), the substrate's check that a proposed action does not violate the governance soul is the validity check $\Box_R(\text{action-allowed}) \neq \mathbf{f}$ at the action's world.
  This is the substrate-side modal-validity operator.
- **Federation across governance graphs.** When two platforms federate, their governance graphs may differ.
  Per [federation-bridge](../../agent/federation/federation-bridge/federation-bridge.md), a bridge translates governance contexts between the platforms.
  The cross-platform $\Box_R$ computation involves the union of accessibility relations; an agent authorized on one platform but not on the other receives modally-restricted authorization on the union.

## What the theorem rules out

- A platform that implements governance as runtime branching ("if user.role == 'admin' then allow") is not substrate-recorded governance.
  The branching is not part of the closure-rule system; it cannot be modally analyzed; it cannot be federation-bridged.
  The substrate's response is to lift the branching into substrate content as a power/duty/privilege/immunity predication.
- A governance system that uses Boolean-valued authority relations (authorize/deny only, no $\bot$ partial authority) loses the four-bilattice's expressivity.
  Partial authority — "this office has authority that is recognized by some but not all participants" — is a real governance state that the substrate represents as $\bot$ on the corresponding accessibility cell.
- A governance system whose accessibility relation is not natural under predicate-category morphisms (per [closure-operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) axiom 4) cannot be federated cleanly: cross-substrate dispatches under such governance produce different modal computations on each side.

## What the theorem requires

- The platform's authority graph is recorded as substrate-content predications.
- Authority predications are bilattice-valued (not Boolean), per [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md).
- The substrate's [modal-necessity operator](../../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/modal-necessity-operator.md) $\Box_R$ is implemented as a substrate operator (or computable via [traversal](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/traversal.md) over the accessibility predications).
- Governance predications are $\mathcal{C}$-natural, so federation across substrates produces consistent modal computations.

## Status

Sketch.
Full proof requires formalizing the four Hohfeldian positions as specific accessibility-relation structures (each Hohfeldian position is a particular shape on $R$), and verifying that the platform's existing governance morphisms ([governance-decision](../governance-decision/governance-decision.md), [soul-violation-check](../../agent/governing-soul/soul-violation-check/soul-violation-check.md), [escalation](../escalation/escalation.md), [revoke](../revoke/revoke.md), [promote](../../office/promote/promote.md)) compose as expected operators on the modal apparatus.
The four-bilattice case is straightforward; richer value-domains require additional verification of the modal operator's structural properties on $\mathbf{L}^\bowtie$.
