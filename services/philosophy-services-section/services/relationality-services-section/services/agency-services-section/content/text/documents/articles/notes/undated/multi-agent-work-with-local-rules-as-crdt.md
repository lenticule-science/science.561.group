---
type: theorem
status: sketch
depends-on: [operations-settling, task-cell-system, multi-agent-work-as-crdt, agent-team-as-bilattice-network-sheaf, witness-as-increment]
see-also: [adjudicate-witness-conflict, dispatch-readiness-regime-is-strict]
title: Multi-agent work with local rules converges as a CRDT
description: Lifts crdt-convergence-with-per-observer-rules to the work setting.
---

# Multi-agent work with local rules converges as a CRDT

Lifts [crdt-convergence-with-per-observer-rules](../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/crdt-convergence-with-per-observer-rules.md) to the work setting.
When agents operate under both shared operational rules and agent-local closure-rule subsystems, the combined work settling converges to a consistent global state if and only if the per-agent rules satisfy the compatibility condition.

## Setup

Let a work team consist of agents $A_1, \ldots, A_n$ operating on a shared operations settling $\mathcal{S}_{\mathrm{op}}$.
Each agent $A_i$ additionally carries a *local* closure-rule subsystem $\mathcal{S}_{A_i}$ encoding their private work style, local procedures, and personal task constraints.
The agent's effective rule system is:

$$\mathcal{S}^{\mathrm{eff}}_{A_i} \;=\; \mathcal{S}_{\mathrm{op}} \,\cup\, \mathcal{S}_{A_i}$$

An agent contributes witness increments to the shared operations settling; those increments reflect which rules in $\mathcal{S}^{\mathrm{eff}}_{A_i}$ fired locally on the agent's replica.

## Claim

The joint operations settling $(v_\tau)_{\tau < \lambda}$ under the distributed rule system $\{\mathcal{S}^{\mathrm{eff}}_{A_i}\}_{i=1}^n$ converges to a unique fixed point reachable from any merge ordering of witness increments if and only if:

**(Compatibility condition)** For every pair $A_i, A_j$ and every pair of consequents $\psi_i, \psi_j$ derivable by rules $r_i \in \mathcal{S}_{A_i}$ and $r_j \in \mathcal{S}_{A_j}$ on the same antecedent cells, the bilattice join $v(\psi_i) \vee_k v(\psi_j)$ is also a valid consequent value — i.e., no agent-local rule asserts a cell value incompatible (in the knowledge order) with another agent-local rule's consequent on the same cell.

## Sketch

The [crdt-convergence-with-per-observer-rules theorem](../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/crdt-convergence-with-per-observer-rules.md) establishes that a distributed settling system with per-observer rule systems converges under the meet-semilattice merge structure if the per-observer rules do not generate conflicting consequents.
In the work setting:

- Each agent's replica is a [distributed settling system](distributed-settling-system.md) replica indexed by the agent.
- The [witness-as-increment morphism](../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/text/glossary/terms/witness-as-increment.md) is the replication step: a witness an agent produces propagates to other agents' replicas.
- The [adjudicate-witness-conflict morphism](../../../../../../../../../../../social-science-services-section/services/social-theory-science-services-section/content/text/documents/articles/notes/undated/adjudicate-witness-conflict.md) handles the case where two agents' local rules produce conflicting consequents on the same cell — this is the $\top$-state case in the bilattice, not a convergence failure.

The compatibility condition rules out rules that would force incompatible *knowledge-order* assertions: both $v(\psi) = \mathbf{f}$ and $v(\psi) = \mathbf{t}$ from different agents' rule systems.
Bilattice join of $\mathbf{f}$ and $\mathbf{t}$ is $\top$ (both true and false), which the adjudication morphism handles — the case is flagged, not a failure.
So the compatibility condition is exactly "no agent-local rule forces $\mathbf{f}$ on a cell another agent's rule forces to $\mathbf{t}$" — a weaker condition than requiring identical rules.

## Operational content

In practice, agent-local rules encode private work procedures (how the agent decomposes tasks, which order they execute steps, what format they prefer for findings).
The compatibility condition says: agent-local procedures may differ, but no agent should have a local rule that conclusively invalidates another agent's substantive work output.
Local style rules are compatible; local rules that assert "this task cannot be done this way" (forcing $\mathbf{f}$ on a goal cell) may not be.

## Corollary — reconciling assignment representations

The open question [reconciling-assignment-as-entity-vs-predicate-on-task](../../../../../../../../../../../social-science-services-section/services/social-theory-science-services-section/content/text/documents/articles/notes/undated/reconciling-assignment-as-entity-vs-predicate-on-task.md) asks whether different agents can hold different internal representations of assignment.
In the per-observer-rules model: agent $A_1$ may track assignment via an [Assignment entity](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/working/content/work/dispatching/objects/assignment.md) fiber (the substrate-native representation) while a legacy agent $A_2$ tracks it as a predicate directly on the task cell.
These are different local rule systems.
By this theorem, they converge if neither forces incompatible values on the task's core goal cells — which they do not, since both are recording the same assignment event via different predicates.
The global settling absorbs both representations without conflict.

## Corollary — distributed capability enforcement

Each agent may have local capability-checking rules (rules that fire when a task's `requires-capability` cell references a capability the agent provides).
These local rules are compatible with the shared operational rules: they add knowledge-order evidence (capability-match cells settling to $\mathbf{t}$) but never force goal cells to $\mathbf{f}$ on their own.
The compatibility condition is trivially satisfied for capability-checking local rules, so distributed capability enforcement converges without coordination.
