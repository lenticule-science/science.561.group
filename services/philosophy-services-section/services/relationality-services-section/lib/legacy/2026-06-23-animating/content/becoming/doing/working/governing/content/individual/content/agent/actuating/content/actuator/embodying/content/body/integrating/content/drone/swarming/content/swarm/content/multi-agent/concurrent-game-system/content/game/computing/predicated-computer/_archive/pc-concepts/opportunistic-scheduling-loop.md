---
type: concept
class: orchestration-discipline
depends-on: [work-item, work-feasibility, resource-state-predications, settlement-via-closure-2-monad, wavefront, closure-2-monad-lax-idempotence, closure-driven-settling-monotonicity, graded-dispatch-via-q-enriched-fusion]
see-also: [agent-self-queued-work, just-in-time-orchestration-via-cohomological-vanishing, dispatch]
---

# Opportunistic scheduling loop

The substrate's *continuous-settling discipline for dispatching feasible work-items as resources permit*. In the substrate's hyperdoctrine setting, the scheduling loop is not an imperative loop — it is *the closure-driven settling on the substrate's orchestration cells*. Per [settlement-via-closure-2-monad](../theorems/settlement-via-closure-2-monad.md), the scheduler is the closure 2-monad's iteration on the work-feasibility + dispatch sub-fibration; per [just-in-time-orchestration-via-cohomological-vanishing](../theorems/just-in-time-orchestration-via-cohomological-vanishing.md), the scheduler reacts immediately to resource-state changes without polling.

There is no scheduler tick. The scheduler is structurally a wavefront on substrate predications: when [resource-state-predications](resource-state-predications.md) change, when [work-feasibility](work-feasibility.md) cells flip, when new [work-item](work-item.md)s admit, the wavefront fires the relevant dispatch rules. This is the substrate's structural answer to "the system runs, notices it has spare resources, figures out what to do with itself."

## Why this concept exists

Most orchestration systems run a literal loop — a goroutine wakes every N seconds, scans the queue, decides what to dispatch. This wastes cycles when nothing changes and adds latency when changes happen between ticks. The substrate's answer is wavefront-driven: the scheduling decisions *are* closure-rule applications on substrate cells, firing when their premises change.

This concept names that discipline so it's not implicit per-implementation: the scheduling loop is structurally a closure-driven settling, with all the substrate's settlement properties (determinism, replay-equivalence, audit-traceability, wavefront-locality).

## The scheduling rules

The substrate's orchestration is governed by a small set of closure rules admitted at bootstrap:

### Rule 1: Pick the best feasible work-item

```
∃ work-item W:
  feasible-now(W) ∈ {t, ⊤}
  ∧ ∀ other work-item W' with feasible-now(W') ∈ {t, ⊤}:
    score(W) ≥ score(W')
  →
  scheduling-pick := W
```

Where `score(W)` is the q-enriched composition of $W$'s value, priority, age, and feasibility-strength per [graded-dispatch-via-q-enriched-fusion](../theorems/graded-dispatch-via-q-enriched-fusion.md):

$$\mathrm{score}(W) = \mathrm{value}(W) \cdot \mathrm{priority\_weight}(W) \cdot \mathrm{age\_factor}(W) \cdot \mathrm{feasibility\_strength}(W)$$

The $\cdot$ here is the chosen quantale's composition (typically multiplication for $[0, 1]$-valued components). Per [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md), the composition is structural — same components produce same score across substrates.

### Rule 2: Dispatch the picked item

```
scheduling-pick := W ∧ no-active-dispatch-for(W)
→
admit(dispatch-cell(W))
```

The dispatch cell is admitted via [dispatch](theories/agential-orchestration-platform/concepts/dispatch.md); per [graded-dispatch-via-q-enriched-fusion](../theorems/graded-dispatch-via-q-enriched-fusion.md), the dispatcher picks the strongest-match agent. The work-item's state moves from `feasible` to `dispatched`.

### Rule 3: Update state on dispatch

```
admit(dispatch-cell(W))
→
state(W) := dispatched
∧ active-agent(W) := chosen-agent
∧ resource-reserve(W) := W.cost-estimate
```

The substrate's resource-state predications are updated: the chosen agent's `available-attention-of` decreases by 1; the work's `cost-estimate` is *reserved* against current resources (so subsequent feasibility checks see them as committed, not free).

### Rule 4: Update state on completion

```
agent emits completion-witness(W, actual-cost)
→
state(W) := completed
∧ resource-reserve(W) := released
∧ actual-cost-record(W) := actual-cost
∧ wake-feasibility(work-items dependent-on W)
```

The reserved resources are released; the actual cost is recorded for [cost-estimate revision](work-feasibility.md); dependent work-items have their `dependencies-satisfied` re-evaluated.

### Rule 5: Update state on failure

```
agent emits failure-witness(W, error)
→
state(W) := failed
∧ resource-reserve(W) := released
∧ admit(top-cell:work-failure(W, error))
```

Per [repair-as-top-cell-resolution](../theorems/repair-as-top-cell-resolution.md), the failure is a $\top$-cell. The substrate's repair catalog determines whether to retry (admit a new work-item with the same parameters), escalate (admit a governance-decision request), or drop (mark as terminally failed).

## Wavefront propagation

Per [wavefront](wavefront.md) and [wavefront-locality-via-cohomology-vanishing](../theorems/wavefront-locality-via-cohomology-vanishing.md), changes to the orchestration cells propagate locally:

- **A resource-state change** triggers re-evaluation of `cost-fits` for work-items in the affected cost range — typically a small subset of the queue.
- **A new work-item admission** triggers a one-shot feasibility evaluation for that item.
- **A dispatch completion** triggers `dependencies-satisfied` re-evaluation for dependent items, plus resource-release.
- **An expiry-ordinal crossing** triggers expiry-rule firing for affected items.

Each propagation is structurally O(affected items), not O(queue size). Per [just-in-time-orchestration-via-cohomological-vanishing](../theorems/just-in-time-orchestration-via-cohomological-vanishing.md), the substrate's $\delta^0 = 0$ on the orchestration sheaf means changes don't cascade globally.

## Multiple parallel dispatches

Per [rule-dependency-soundness](../theorems/rule-dependency-soundness.md), independent work-items (no transitive dependency, no shared resource constraint) admit parallel dispatch. The scheduling loop's Rule 1 picks the *best* item; Rule 2 dispatches it; if more capacity remains, Rule 1 re-fires (the wavefront is still active) and picks the next-best item. This continues until either no more feasible items or capacity is exhausted.

The parallelism is structural: per [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md), spacelike-separated dispatches admit any relative ordering. The substrate's runtime can dispatch multiple items per wavefront iteration without coordination overhead.

## Backpressure

When the substrate's queue is large or capacity is tight, backpressure manifests structurally:

- New work-item admissions are accepted (the queue grows), but their `feasible-now` cells settle to $\bot$ or $\mathbf{f}$ until capacity allows.
- Per [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md), federation peers can see the substrate's queue depth (via federation-announced state) and route work elsewhere.
- The substrate's [authentication-as-modal-restriction](theories/interactive-application-platform/theorems/authentication-as-modal-restriction.md) discipline can deprioritize sessions admitting too many work-items.

There's no explicit "queue full" rejection — the substrate accepts admissions and lets the feasibility logic determine when they run.

## Dependency-cycle detection

Per [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md), the dependency graph among work-items must be a partial order. The scheduler's discipline includes a cycle-detection rule fired at admission:

```
admit(work-item W) ∧ creates-cycle-in(W.dependencies)
→
reject-admission(W)
∧ admit(top-cell:dependency-cycle(W, detected-cycle))
```

The cycle is surfaced for governance review; the work-item is not added to the queue.

## Look-ahead and reservation

For high-value work-items that are imminent-feasible (per `feasible-within:{duration}` per [work-feasibility](work-feasibility.md)), the substrate may *reserve* capacity:

```
high-value W ∧ feasible-within(W, Δ) ∧ low-value W' currently feasible
→
defer-dispatch(W')
∧ reserve(W.cost-estimate, until: now + Δ)
```

This trades immediate utilization for higher total value — a low-value item runs slightly later so a high-value imminent item can dispatch immediately when feasible.

The reservation is itself substrate content; per [witness](witness.md), the reservation decision is auditable.

## What the discipline rules out

- **Tick-based scheduling.** A scheduler that wakes every N seconds polls the queue regardless of changes. The substrate's discipline is wavefront-driven; per [just-in-time-orchestration-via-cohomological-vanishing](../theorems/just-in-time-orchestration-via-cohomological-vanishing.md), there's no tick.
- **Hidden scheduling state.** A scheduler with internal state (a priority-queue heap, a worker-pool tracker) not represented as substrate content is opaque. Per [self-representation](self-representation.md), all scheduling state is substrate content.
- **Greedy-only scheduling without value composition.** A scheduler that always picks the cheapest-cost item ignoring value, or the highest-value item ignoring cost, misses the structural composition. Per [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md), the substrate's score is a quantale composition of multiple dimensions.
- **Synchronous block on resource availability.** A work-item that "waits" by blocking a worker doesn't release capacity. The substrate's discipline is to leave the work-item in `feasible: ⊥` state until resources allow; the worker is not blocked.

## Position

The opportunistic scheduling loop is the substrate's *autonomous-orchestration discipline*. Per [work-item](work-item.md), pending work is queueable substrate content; per [resource-state-predications](resource-state-predications.md), current capacity is substrate content; per [work-feasibility](work-feasibility.md), the readiness predicate is closure-rule-derived; per this concept, the scheduler is closure-driven settling on those cells; per [just-in-time-orchestration-via-cohomological-vanishing](../theorems/just-in-time-orchestration-via-cohomological-vanishing.md), the propagation is structurally local.

The concept composes with [graded-dispatch-via-q-enriched-fusion](../theorems/graded-dispatch-via-q-enriched-fusion.md) (the dispatch-matching once an item is picked), with [agent-self-queued-work](theories/agential-orchestration-platform/concepts/agent-self-queued-work.md) (agents queueing their own work-items), with [federation-trust-bilattice-graded](../theorems/federation-trust-bilattice-graded.md) (cross-substrate work routing), and with [repair-as-top-cell-resolution](../theorems/repair-as-top-cell-resolution.md) (failure handling).

This is what enables the substrate to *run autonomously*: the math agent admits a goal, the substrate's scheduler notices spare network capacity, dispatches the arxiv fetcher, papers arrive, the math agent's next iteration finds them and continues — no scheduler loop in code, just wavefront propagation on substrate cells.
