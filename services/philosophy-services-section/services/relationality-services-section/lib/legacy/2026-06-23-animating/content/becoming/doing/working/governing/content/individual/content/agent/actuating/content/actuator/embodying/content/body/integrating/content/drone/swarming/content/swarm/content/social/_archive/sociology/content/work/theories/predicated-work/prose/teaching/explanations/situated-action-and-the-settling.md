---
type: narrative
---

# Situated action and the settling

Lucy Suchman's *Plans and Situated Actions* (1987) — already a [disciplinary reference](../references/suchman1987.md) for predicated-work — argues that plans are not scripts that execution follows.
They are resources for action: framings agents consult before acting, not programs that determine what agents do.
The actual conduct of work is *situated* — shaped in real time by the specifics of the situation — and plans are reconstructed after the fact to make the action accountable.

The operations settling has a formal structure that makes this argument precise — and that shows where the substrate's account of plans both matches and diverges from Suchman's.

## Plans as target valuations

The predicated-work formalism encodes a plan as a target valuation: a function $v^{\mathrm{target}}$ assigning each task-cell-system cell a desired value.
The [lift-task-to-plan](../morphisms/lift-task-to-plan.md) morphism lifts a task into a structured plan by specifying dependencies, deadlines, and the target valuation.

In Suchman's terms: the target valuation is precisely a plan-as-resource.
It specifies what state the settling should reach, not how to get there.
The path through the settling — the actual sequence of witness increments, closure-rule firings, and cell transitions — is not encoded in the plan.
The plan is the destination; the route is improvisational.

## The settling as situated action

When agent $A$ begins executing task $T$, the closure rules in $\mathcal{S}_{\mathrm{op}}$ fire on whatever cells are present.
The firing sequence is determined by: (1) the current state of $\mathcal{E}_{\mathrm{op}}$ (what cells are already settled), (2) the agent's local rules $\mathcal{S}_{A}$ (what $A$ brings to the work), and (3) the witness increments $A$ produces (what $A$ observes and reports).

None of these three inputs is determined by the plan.
The plan specifies the target, not the path.
The actual firing sequence is — in Suchman's sense — situated: it is a response to the specific state of the settling encountered at execution time, not to the abstract target valuation.

Here the substrate refines Suchman: the improvisation is not pure spontaneity.
It is the result of underspecified closure rules. $\mathcal{S}_{\mathrm{op}} = \mathcal{S}_{\mathrm{shared}} \cup \bigcup_{A_i} \mathcal{S}_{A_i} \cup \mathcal{S}_{\mathrm{charter}}$ is never a total function from settling states to actions.
There are cells whose values no current rule constrains, and agent $A$'s local rules $\mathcal{S}_A$ fill the gap.
The "improvisation" is $\mathcal{S}_A$ acting on cells that $\mathcal{S}_{\mathrm{shared}}$ left underdetermined.

## Retrospect as plan reconstruction

Suchman argues that after-the-fact plan construction — making action accountable by describing it as plan-following — is a social act, not a description of what actually happened.
The predicated-work formalism has a morphism for exactly this: [retrospect-via-cosettling](../morphisms/retrospect-via-cosettling.md) computes the gap between the plan's target valuation and the actual settling trajectory.

The retrospect morphism produces a [finding](../objects/finding.md) that documents the divergence.
This finding is the substrate equivalent of Suchman's accounts of action — the post-hoc narrative of what happened.
The finding does not change what the settling did; it records what the cosettling reveals.

Crucially: the finding is itself a cell increment on the settling.
It becomes part of the historical record.
And because settling is monotone — cells do not retract — the retrospective account is permanently installed.
The organization cannot un-remember what the retrospect revealed.

## The plan never survives contact

A military aphorism: no plan survives contact with the enemy.
In the substrate: no target valuation predicts the settling trajectory.
The actual trajectory is determined by the closure-rule firing sequence, which depends on the current settling state, which depends on all previous work — including the work of other agents whose local rules fire in ways the plan did not anticipate.

This is not a failure of planning.
It is a structural fact about the substrate.
The [plan-as-tensor-of-task-cobordisms](../theorems/plan-as-tensor-of-task-cobordisms.md) theorem shows that plans compose correctly — they can be tensored together — but composition of plans does not imply that execution will follow the composed path.
The path is a property of the settling's response to inputs, not of the plan itself.

The implication: organizations that treat plans as scripts — expecting execution to follow the target valuation — will be systematically surprised by what actually happens.
Organizations that treat plans as resources — consulting the target valuation as a guide while responding to the actual settling state — match Suchman's situated-action model and the substrate's formal behavior.

## The [shared-closure-rule-vocabulary](../teaching/explanations/shared-closure-rule-vocabulary.md) as institutional memory of situations

Suchman's account emphasizes that situations are specific: each situated action is a response to *this* situation, not to the generic type.
Yet organizations accumulate practices — they develop shared ways of handling recurring situations.

In the substrate: recurring situations produce recurring patterns of closure-rule firing.
When those patterns are documented (as findings, as adjustments), they become candidates for installation in $\mathcal{S}_{\mathrm{shared}}$.
The shared closure-rule vocabulary is the substrate's accumulated record of *how past situations were handled* — the sedimentation of past situated actions into reusable rules.

This gives the substrate a nuanced picture: each execution is situated (the specific firing sequence depends on the specific settling state), but the rules available to the agent ($\mathcal{S}_{\mathrm{shared}}$) encode the organization's history of past situations.
Situated action and institutional memory are not opposed; institutional memory is the settling's record of past situatedness.
