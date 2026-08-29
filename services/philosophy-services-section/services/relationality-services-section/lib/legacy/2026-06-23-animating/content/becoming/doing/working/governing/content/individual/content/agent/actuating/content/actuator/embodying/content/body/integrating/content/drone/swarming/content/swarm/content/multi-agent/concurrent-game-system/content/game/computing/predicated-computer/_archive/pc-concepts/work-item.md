---
type: concept
class: orchestration-primitive
depends-on: [dispatch, capability, cost-discipline, hash-discipline, predication-fiber-algebra, four-bilattice, signature, time-and-event-ordinals]
see-also: [work-feasibility, opportunistic-scheduling-loop, agent-self-queued-work, graded-dispatch-via-q-enriched-fusion, cost-composition-via-lawvere-quantale]
---

# Work-item

The substrate's *queueable unit of pending work* — a substrate cell carrying everything the [opportunistic-scheduling-loop](opportunistic-scheduling-loop.md) needs to decide whether and when the work runs. In the substrate's hyperdoctrine setting, a work-item is *the substrate-side reification of a pending [dispatch](theories/agential-orchestration-platform/concepts/dispatch.md) — a cell in the [predication fiber-algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) over the work-queue predicate, carrying capability requirement, Lawvere-quantale cost estimate, value estimate, expiry, dependencies, and priority*.

Work-items are distinct from dispatch decisions. A dispatch is "this work is happening now, on this agent." A work-item is "this work could happen, here are its parameters, here's what it costs and yields, here's what would have to be true for it to run." The substrate's scheduler reads work-items, checks [work-feasibility](work-feasibility.md), and emits dispatch cells for the items it picks.

## Why this concept exists

PredComp has [dispatch](theories/agential-orchestration-platform/concepts/dispatch.md) (the act of routing work to an agent) and [graded-dispatch-via-q-enriched-fusion](../theorems/graded-dispatch-via-q-enriched-fusion.md) (the dispatch-matching's quantale-graded composition). What it doesn't have is a primitive for the *queueable form* of work — the cell that sits in the substrate waiting to be dispatched, carrying all the information the scheduler needs to decide *whether* to dispatch it *now*. Without that primitive, the queue is implicit (somewhere in dispatch internals) and the scheduler can't reason structurally about "what should I do next?"

This concept fills the gap: work-items are first-class substrate cells, the queue is the substrate-content set of work-items, and the scheduler is closure rules reading them.

## Work-item structure

A work-item is a substrate cell with the following predications:

```json
{
  "kind": "work-item",
  "work-item-id": "<canonical-form hash of the rest>",
  "work-kind": "<kind-hash, e.g., 'fetch-arxiv', 'render-document', 'dispatch-print-job'>",
  "queued-at-ordinal": <substrate ordinal>,
  "queued-by": {
    "session-hash": "<the session that admitted this item>",
    "agent-hash": "<optional: the agent that admitted it, if agent-self-queued>"
  },
  "required-capability": [<capability-hash>, ...],
  "cost-estimate": {
    "cpu-seconds": <number>,
    "memory-bytes": <number>,
    "network-bytes": <number>,
    "storage-bytes": <number>,
    "wall-time-seconds": <number>,
    "rate-limit-budget-of": {<api-hash>: <integer>, ...},
    "additional": {<dimension>: <number>, ...}
  },
  "value-estimate": <number in [0, 1]>,
  "priority": "<low | medium | high | urgent>",
  "expiry-ordinal": <substrate ordinal, or null for no-expiry>,
  "dependencies": [<work-item-id>, ...],
  "input-payload": <canonical-JSON of the work's input data>,
  "output-target": "<entity-hash where the work's output should land>",
  "signature": {
    "scheme": "Ed25519",
    "signing-key-hash": "<queuer's signing key>",
    "value": "<base64 signature>"
  }
}
```

Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the work-item-id is the canonical-form hash. Per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), the queuer's signature binds the work-item to its origin — auditable end-to-end.

## Cost estimate is Lawvere-quantale-valued

Per [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md), substrate cost composes via the Lawvere quantale. The work-item's `cost-estimate` is multi-dimensional — each dimension (CPU, memory, network, storage, wall-time, per-API rate-limits) has its own quantale. Per the substrate's product-quantale composition, the total cost of a multi-step work-item is the multi-dimensional sum.

The substrate's [opportunistic-scheduling-loop](opportunistic-scheduling-loop.md) reads the cost estimate, compares against the substrate's [resource-state-predications](resource-state-predications.md), and per [work-feasibility](work-feasibility.md) determines whether the work fits in current capacity.

Per [telemetry-as-continuous-valued-settling-projection](../theorems/telemetry-as-continuous-valued-settling-projection.md), actual cost (recorded after execution) is also $\mathcal{V}$-valued substrate content. Future work-items of the same `work-kind` can use the substrate's recorded actuals as a prior — a learned cost-estimate-revision feedback loop.

## Value estimate

The `value-estimate` is a number in $[0, 1]$ representing the work's expected value to the substrate's goals. Default is 0.5 (medium); per the substrate's policy, particular work-kinds have declared default values, and the queuer may override.

Value is in a quantale itself (typically $[0, 1]$ with multiplication), so per [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md), value composition across dependent work-items is well-defined: a chain of work-items has total value = product of per-step values.

The scheduler's prioritization isn't just "highest priority" or "lowest cost" — it's a quantale-product of $(value, priority, age, feasibility)$ that surfaces the structurally-best next work item.

## Priority

`priority` is a discrete ordering: `low < medium < high < urgent`. Higher priority preempts lower priority when capacity is constrained.

Priority is *separate* from value-estimate because they answer different questions:
- *Value* asks "how much does completing this advance the substrate's goals?"
- *Priority* asks "how soon does this need to start?"

Low-value-high-priority work (e.g., a urgent compliance check) and high-value-low-priority work (e.g., long-term research on background) are both meaningful; the substrate's scheduler composes both via the priority quantale.

## Expiry

`expiry-ordinal` is the substrate ordinal after which the work-item is no longer relevant (the request has timed out, the data is stale, the user gave up). When the substrate's current ordinal exceeds `expiry-ordinal`, a closure rule retracts the work-item from the queue per [retraction](../morphisms/retraction.md).

Setting `expiry-ordinal: null` means the work has no deadline — useful for opportunistic background work like the math agent's arxiv fetching.

## Dependencies

`dependencies` is a list of work-item-ids that must complete before this work can start. Per [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md), the dependency relation is a partial order on work-items (the causal precedence in the work-graph). Per [rule-dependency-soundness](../theorems/rule-dependency-soundness.md), spacelike-separated work-items (no transitive dependency) admit parallel dispatch.

Cycles in `dependencies` are forbidden — per [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md) the substrate's causal-set framework requires a partial order. The substrate's queue-admission discipline includes cycle detection; cyclic submissions are rejected with the cycle surfaced for governance review.

## Input payload and output target

`input-payload` carries the work's input as canonical-JSON — what the executing agent will read.

`output-target` is the substrate entity-hash where the work's output should land. The executing agent admits the output as predications on the target entity. Per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md), the output-target is content-addressed; downstream work-items waiting on the output reference the same hash.

## Lifecycle

A work-item moves through states, each a predication on the work-item-id:

- **`queued`** — admitted to the queue, waiting for feasibility.
- **`feasible`** — per [work-feasibility](work-feasibility.md), the work-item's cost-estimate fits current resources and dependencies are satisfied.
- **`dispatched`** — the [opportunistic-scheduling-loop](opportunistic-scheduling-loop.md) picked this item; per [graded-dispatch-via-q-enriched-fusion](../theorems/graded-dispatch-via-q-enriched-fusion.md), an agent has been chosen and the dispatch cell admitted.
- **`running`** — the chosen agent is executing.
- **`completed`** — the agent finished; output is in `output-target`; actual-cost is recorded in [telemetry](teaching/explanations/telemetry.md).
- **`failed`** — the agent failed; per [repair-as-top-cell-resolution](../theorems/repair-as-top-cell-resolution.md), the failure is a $\top$-cell needing resolution.
- **`expired`** — the work-item's `expiry-ordinal` passed without dispatch; per [retraction](../morphisms/retraction.md), the substrate retracts.
- **`retracted`** — the queuer (or an authorized governance entity) explicitly canceled the work-item.

Per [witness](teaching/explanations/witness.md), each state transition produces a witness — auditable end-to-end.

## Position

The work-item is the substrate's *queueable-unit primitive*. Per [graded-dispatch-via-q-enriched-fusion](../theorems/graded-dispatch-via-q-enriched-fusion.md), dispatch picks among feasible work-items by capability+cost+value match. Per [opportunistic-scheduling-loop](opportunistic-scheduling-loop.md), the scheduler is a closure-driven settling on the queue's feasibility cells. Per [agent-self-queued-work](theories/agential-orchestration-platform/concepts/agent-self-queued-work.md), agents themselves can admit work-items, with their authorization bounded by [authentication-as-modal-restriction](theories/interactive-application-platform/theorems/authentication-as-modal-restriction.md) and [capability-non-amplification](theories/functional-runtime-platform/theorems/capability-non-amplification.md).

The concept composes with [dispatch](theories/agential-orchestration-platform/concepts/dispatch.md), [resource-state-predications](resource-state-predications.md), [work-feasibility](work-feasibility.md), [opportunistic-scheduling-loop](opportunistic-scheduling-loop.md), [agent-self-queued-work](theories/agential-orchestration-platform/concepts/agent-self-queued-work.md), and the cost-discipline machinery via [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md).
