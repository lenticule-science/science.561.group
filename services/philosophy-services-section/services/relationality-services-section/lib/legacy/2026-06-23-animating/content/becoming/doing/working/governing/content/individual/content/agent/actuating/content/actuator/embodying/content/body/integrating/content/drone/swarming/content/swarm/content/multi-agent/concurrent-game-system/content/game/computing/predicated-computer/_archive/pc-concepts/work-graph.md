---
type: concept
class: orchestration-discipline
depends-on: [work-item, lorentzian-causal-settling, event-causality-via-lorentzian-settling, predication-fiber-algebra, scope-cover-via-grothendieck-site]
see-also: [goal, agent-self-queued-work, opportunistic-scheduling-loop, just-in-time-orchestration-via-cohomological-vanishing]
---

# Work-graph

The substrate's *parent-child structural relationship among [work-items](work-item.md) and [goals](theories/agential-orchestration-platform/concepts/goal.md)* — the substrate-content directed acyclic graph linking goals, their derived work-items, sub-work spawned during execution, dependencies, and completion-propagation. In the substrate's hyperdoctrine setting, the work-graph is *the partial order on [work-item](work-item.md) and [goal](theories/agential-orchestration-platform/concepts/goal.md) cells under the dependency-and-spawn relation*, and per [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md) it is structurally a [Lorentzian causal-settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/lorentzian-causal-settling.md) on the work-cells.

Per the substrate's discipline, the work-graph is recorded as substrate predications — `parent-of`, `depends-on`, `spawned-by`, `derived-from` cells — letting closure rules query the structure (e.g., "what's still pending under this goal?") and [witness](witness.md) chains preserve causal lineage.

## Why this concept exists

[work-item](work-item.md) carries a `dependencies` field; [agent-self-queued-work](theories/agential-orchestration-platform/concepts/agent-self-queued-work.md) lets agents spawn sub-agents (each spawning their own work); [goal](theories/agential-orchestration-platform/concepts/goal.md) decomposes into work-items via closure rules. Together these create a graph — but no concept names the graph as a substrate object. Without a work-graph concept, queries like "what's the lineage of this completed work?" or "how many sub-work-items remain under this goal?" require ad-hoc per-implementation logic.

This concept makes the work-graph a first-class substrate-content structure with declared predicates, queries, and lifecycle rules.

## Hyperdoctrinal grounding

Per [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md), substrate events form a Lorentzian causal-set under causal precedence. Work-items are events (their admission is an event, their completion is an event); the work-graph is the sub-causal-set restricted to work-events.

The work-graph's structure inherits from the Lorentzian framework:

- **Apex cone of a work-item** = all work transitively triggered by it (downstream lineage).
- **Past cone of a work-item** = all work that contributed to triggering it (upstream lineage).
- **Spacelike-separated work-items** = independent work, parallelizable per [rule-dependency-soundness](../theorems/rule-dependency-soundness.md).
- **Causal closure** = the work-graph's transitive closure of all dependency relations.

Per [scope-cover-via-grothendieck-site](../theorems/scope-cover-via-grothendieck-site.md), the work-graph admits cover-based queries: "all work under goal $G$" is a cover query on the work-graph rooted at $G$.

## Edge predicates

The work-graph uses three predicates to record relationships:

### `derived-from`

Goals decompose into work-items via closure rules. The resulting work-items have `derived-from: {goal-id}` predications. Per [goal](theories/agential-orchestration-platform/concepts/goal.md), this is how closure rules link a goal to the work-items that pursue it.

A single goal may produce multiple work-items (e.g., `verify-theorem` produces several `proof-search` work-items). All of them have `derived-from` pointing back to the goal.

### `spawned-by`

When an agent executing a work-item produces a sub-work-item (e.g., the arxiv-fetcher needs to spawn a per-paper PDF-parse work-item), the new work-item has `spawned-by: {parent-work-item-id}`. Per [agent-self-queued-work](theories/agential-orchestration-platform/concepts/agent-self-queued-work.md), the spawn is the agent's self-queueing during execution.

`spawned-by` differs from `derived-from`: derived work comes from goal-decomposition (closure-rule-driven); spawned work comes from execution (agent-driven). Both produce parent-child links in the work-graph.

### `depends-on`

A work-item that requires another's output before it can run has `depends-on: {prereq-work-item-id}`. Per [work-item](work-item.md), this is the explicit dependency declaration; per [work-feasibility](work-feasibility.md), the feasibility rule's `dependencies-satisfied` predicate consults this.

`depends-on` differs from `derived-from` and `spawned-by`: dependency is *temporal* (must run after), while the others are *causal* (came from). A work-item may depend on another that was neither derived-from nor spawned-by it.

## Roots, leaves, internal nodes

The work-graph has structural positions:

- **Roots** — work-items not derived-from or spawned-by any other; user-decisions and standalone agent-actions are typical roots. Goals are the most common roots.
- **Internal nodes** — work-items both have and produce children; mid-execution chains live here.
- **Leaves** — work-items not parent of any other; final work in a chain.

Per [scope-cover-via-grothendieck-site](../theorems/scope-cover-via-grothendieck-site.md), the substrate can query "all roots" (the substrate's outstanding intentions), "all leaves currently feasible" (the substrate's pending tip), and "all internal nodes for goal $G$" (the goal's active progress).

## Completion propagation

When a work-item completes, the work-graph propagates state changes:

- The work-item's `state` moves to `completed`.
- Per [work-feasibility](work-feasibility.md), work-items that `depend-on` this one re-evaluate `dependencies-satisfied`.
- Per [goal](theories/agential-orchestration-platform/concepts/goal.md)'s completion criterion, the goal that derived this work-item may transition to `satisfied` if the criterion is met.
- Per [witness-chain-as-proof-object](../theorems/witness-chain-as-proof-object.md), the completion witness is added to the work-graph's audit chain.

Per [just-in-time-orchestration-via-cohomological-vanishing](../theorems/just-in-time-orchestration-via-cohomological-vanishing.md), the propagation is local — only the affected dependent work-items re-evaluate, not the whole graph.

## Failure propagation

When a work-item fails:

- The work-item's `state` moves to `failed`.
- Per [repair-as-top-cell-resolution](../theorems/repair-as-top-cell-resolution.md), a $\top$-cell records the failure.
- Per the substrate's repair catalog, the failure may trigger:
  - **Retry** — admit a new work-item with the same parameters as a sibling under the same parent.
  - **Cascade-failure** — work-items that `depend-on` the failed one transition to `failed-by-dependency`, with their failures propagating further.
  - **Goal-failure** — if the work-item was derived-from a goal and the goal's completion is now structurally impossible, the goal transitions to `failed` (a special case of `abandoned`).
  - **Escalation** — admit a governance-decision request for resolution.

Per [witness-chain-as-proof-object](../theorems/witness-chain-as-proof-object.md), every failure-propagation step is witnessed.

## Cycle prevention

Per [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md), the work-graph must be acyclic — Lorentzian causal-sets are partial orders, not arbitrary directed graphs. Per [opportunistic-scheduling-loop](opportunistic-scheduling-loop.md), the substrate's queue-admission discipline includes cycle detection:

```
admit work-item W
  ∧ W.dependencies + W.derived-from + W.spawned-by + transitively-prior-work
  creates cycle
→
reject-admission(W)
∧ admit ⊤-cell:work-graph-cycle(W, detected-cycle)
```

Per [audit-content-via-inconsistency-sheaf-cohomology](../theorems/audit-content-via-inconsistency-sheaf-cohomology.md), accumulated cycle attempts surface as $\top$-cell patterns — useful for detecting buggy agents or attack patterns.

## Querying the work-graph

Common queries the substrate supports as standard traversals:

- **Lineage of a work-item** — transitive `derived-from` + `spawned-by` ancestors. "What goal led to this work?"
- **Descendants of a goal** — transitive `derived-from` + `spawned-by` descendants. "What's all the work this goal generated?"
- **Critical path** — for a goal's pending descendants, the longest dependency chain. Per [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md), this is the longest timelike chain in the work-graph rooted at the goal.
- **Currently-feasible leaves** — work-items at the work-graph's tip whose feasibility is $\mathbf{t}$. The next work the [opportunistic-scheduling-loop](opportunistic-scheduling-loop.md) will pick.
- **Goal-completion projection** — given a goal's current state and pending descendants, when will it complete (or what additional work is required)?

Per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), all work-graph queries are reads — free at the substrate level.

## What the discipline rules out

- **Implicit work-graph state.** A substrate that tracks work-item parents/children in runtime data structures (in-memory hash tables, external task queues) loses the audit chain. Per [self-representation](self-representation.md), the work-graph is substrate content.
- **Cyclic work-graphs.** Per [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md), the work-graph must be acyclic. Per the cycle-detection rule, cyclic admissions are rejected.
- **Failure propagation that doesn't reach the goal.** A work-item's failure should propagate to its derived-from goal so the goal can fail-or-recover. Per the failure-propagation rules, the substrate's discipline is to surface failures upward.
- **Completion without dependent re-evaluation.** A work-item completion that doesn't trigger dependent re-evaluation is leaving downstream work in the wrong state. Per [just-in-time-orchestration-via-cohomological-vanishing](../theorems/just-in-time-orchestration-via-cohomological-vanishing.md), the wavefront is what triggers the re-evaluation.

## Position

The work-graph is the substrate's *structural-relationships-among-work primitive*. Per [work-item](work-item.md), individual work units are queueable; per this concept, their relationships form a graph queryable like any other substrate content; per [goal](theories/agential-orchestration-platform/concepts/goal.md), goals sit as roots of work-graph sub-trees; per [opportunistic-scheduling-loop](opportunistic-scheduling-loop.md), the scheduler navigates the graph picking feasible leaves.

The concept composes with [work-item](work-item.md), [goal](theories/agential-orchestration-platform/concepts/goal.md), [agent-self-queued-work](theories/agential-orchestration-platform/concepts/agent-self-queued-work.md), [opportunistic-scheduling-loop](opportunistic-scheduling-loop.md), [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md), [witness-chain-as-proof-object](../theorems/witness-chain-as-proof-object.md), and [scope-cover-via-grothendieck-site](../theorems/scope-cover-via-grothendieck-site.md).
