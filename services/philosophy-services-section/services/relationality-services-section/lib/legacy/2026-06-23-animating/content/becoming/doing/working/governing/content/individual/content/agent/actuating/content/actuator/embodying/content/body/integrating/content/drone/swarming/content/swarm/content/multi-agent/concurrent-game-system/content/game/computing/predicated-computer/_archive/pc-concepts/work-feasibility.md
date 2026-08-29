---
type: concept
class: orchestration-discipline
depends-on: [work-item, resource-state-predications, closure-rule, four-bilattice, predication-fiber-algebra, knowledge-order, cost-composition-via-lawvere-quantale, time-and-event-ordinals]
see-also: [opportunistic-scheduling-loop, just-in-time-orchestration-via-cohomological-vanishing, bilattice-operation-table]
---

# Work-feasibility

The substrate's *closure-rule-derived bilattice predicate determining whether a [work-item](work-item.md) can run right now* — a per-(work-item, current-substrate-state) cell whose value is in $\mathbf{FOUR}$. Per [opportunistic-scheduling-loop](opportunistic-scheduling-loop.md), the substrate's scheduler reads `feasible-now:{work-item}` cells and picks among the $\mathbf{t}$-valued ones. Per [just-in-time-orchestration-via-cohomological-vanishing](../theorems/just-in-time-orchestration-via-cohomological-vanishing.md), feasibility flips propagate locally — when [resource-state-predications](resource-state-predications.md) change, only the affected work-items re-evaluate.

Feasibility is bilattice-valued, not boolean, because the substrate distinguishes:

- $\mathbf{t}$ — *feasible*: cost ≤ available, dependencies satisfied, within expiry, capability available.
- $\mathbf{f}$ — *infeasible*: definitively blocked (cost exceeds capacity, dependency failed, expired, no capable agent).
- $\bot$ — *uninformed*: feasibility hasn't been evaluated yet, or relevant resource-state cells are themselves $\bot$.
- $\top$ — *contested*: conflicting signals (cost says yes but rate-limit says no, capability available but agent is in DnD, etc.). Per [repair-as-top-cell-resolution](../theorems/repair-as-top-cell-resolution.md), $\top$-feasibility surfaces for resolution.

## Why this concept exists

The substrate has [work-item](work-item.md)s in a queue and [resource-state-predications](resource-state-predications.md) tracking current capacity, but no concept naming the *relationship* between them — the bilattice predicate that says "can this work run now?" Without it, the [opportunistic-scheduling-loop](opportunistic-scheduling-loop.md) has nothing to read; the schedule decision is implicit and per-implementation. This concept fixes the relation as substrate-recorded predicates, derived by closure rules.

## The feasibility closure rule

The substrate's primary feasibility rule (admitted at bootstrap per [bootstrap-content](bootstrap-content.md)):

```
∀ work-item W, current substrate state S:
  cost-fits(W, S)
  ∧ dependencies-satisfied(W)
  ∧ within-expiry(W)
  ∧ capable-agent-available(W)
  →
  feasible-now(W) := t
```

The rule's premise has four sub-predicates, each itself a closure rule:

### `cost-fits(W, S)`

For each cost dimension $d$ in $W$'s `cost-estimate`:

```
W.cost-estimate.<d> ≤ S.<resource-state-predicate-for-d>
```

Per [cost-composition-via-lawvere-quantale](../theorems/cost-composition-via-lawvere-quantale.md), the comparison uses the appropriate quantale's order. For additive resources (CPU, memory, network bytes), comparison is "estimated ≤ available." For bottleneck resources (network bandwidth, IOPS), "estimated ≤ available bottleneck." For rate-limit budgets, "estimated calls ≤ remaining budget."

If *any* cost dimension fails, `cost-fits = f`. If *all* succeed and resource-state cells are non-$\bot$, `cost-fits = t`. If some resource-state cells are $\bot$, `cost-fits = ⊥` (we don't know yet).

### `dependencies-satisfied(W)`

Per [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md), the work-item's `dependencies` form a partial order. The closure rule:

```
∀ d ∈ W.dependencies: state(d) = completed → dependencies-satisfied(W) := t
```

If any dependency is in `failed` or `expired` state, `dependencies-satisfied = f` (the dependency failed, this work can't proceed). If any dependency is still `queued` or `running`, `dependencies-satisfied = ⊥` (waiting). If all are `completed`, `dependencies-satisfied = t`.

### `within-expiry(W)`

```
W.expiry-ordinal = null ∨ current-substrate-ordinal ≤ W.expiry-ordinal → within-expiry(W) := t
```

If current ordinal exceeds `expiry-ordinal`, `within-expiry = f` and the substrate's expiry-rule moves the work-item to `expired` state.

### `capable-agent-available(W)`

Per [graded-dispatch-via-q-enriched-fusion](../theorems/graded-dispatch-via-q-enriched-fusion.md), the dispatcher matches work-items to agents by capability. For feasibility, the question is "is *any* agent available with the required capabilities?":

```
∃ agent A:
  A.capabilities ⊇ W.required-capability
  ∧ available-attention-of(A) > 0
  →
  capable-agent-available(W) := t
```

If no agent matches, `capable-agent-available = f` — the work isn't infeasible *forever*, it's infeasible *now*; the substrate may admit a new agent later that resolves the constraint.

## How feasibility composes via the bilattice

The four sub-predicates' values combine via $\wedge_t$ (truth-meet — classical conjunction) per [bilattice-operation-table](bilattice-operation-table.md):

```
feasible-now(W) := cost-fits(W) ∧_t dependencies-satisfied(W) ∧_t within-expiry(W) ∧_t capable-agent-available(W)
```

The bilattice's $\wedge_t$ truth-meet absorbs $\mathbf{f}$ (any false → false), preserves $\bot$ on uninformed inputs, and produces $\top$ when one is $\top$ and another is $\mathbf{t}$ — exactly the substrate's "contested feasibility" signal.

## Feasibility is reactive, not polled

Per [just-in-time-orchestration-via-cohomological-vanishing](../theorems/just-in-time-orchestration-via-cohomological-vanishing.md), the feasibility rule fires on the wavefront whenever its premises change. Critically:

- A change to a resource-state predication (e.g., free-cpu-fraction rises from 0.1 to 0.5) re-evaluates `cost-fits` for all work-items whose CPU cost-estimate is in the affected range.
- A change to a dependency's state (e.g., one of the work-item's deps moves to `completed`) re-evaluates `dependencies-satisfied`.
- A new agent admission re-evaluates `capable-agent-available` for all matching work-items.

Per [wavefront-locality-via-cohomology-vanishing](../theorems/wavefront-locality-via-cohomology-vanishing.md), each re-evaluation is local — it doesn't trigger a full queue scan. The substrate's feasibility-tracking is structurally O(affected work-items), not O(queue size).

## Predicting future feasibility

Beyond `feasible-now`, the substrate may compute `feasible-within:{duration}` — work-items expected to become feasible within the next $\Delta$ ordinals, given the current trend. Per [continuous-valued-settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/continuous-valued-settling.md), the substrate's resource-state forms a continuous-valued settling; trend extrapolation predicts when current resource pressure will lift.

This enables look-ahead scheduling: the substrate can reserve capacity for an imminent-feasible high-value work-item, rather than dispatch a lower-value item immediately and starve the higher-value one.

## Cost-estimate revision

When a work-item completes, its actual cost is recorded per [telemetry](telemetry.md). Per [telemetry-as-continuous-valued-settling-projection](../theorems/telemetry-as-continuous-valued-settling-projection.md), the actual is $\mathcal{V}$-valued substrate content. The substrate's discipline (an additional closure rule) updates the cost-estimate prior for the work-kind:

```
∀ work-kind K:
  cost-estimate-prior(K) := exponentially-weighted-average(actual-costs(K))
```

Subsequent work-items of kind $K$ use the revised prior. Per the substrate's overall determinism, this means feasibility computation gets *better calibrated over time* — the substrate learns its own cost dynamics.

The revision is closure-rule-driven, so it's auditable and replayable; per [witness](witness.md), every revision is in the audit chain.

## What the discipline rules out

- **Polling-based scheduling.** A scheduler that wakes every N seconds and re-evaluates the whole queue is wasting cycles. Per [just-in-time-orchestration-via-cohomological-vanishing](../theorems/just-in-time-orchestration-via-cohomological-vanishing.md), the substrate is wavefront-driven; feasibility re-evaluates only when premises change.
- **Boolean-only feasibility.** A "feasible: yes/no" predicate misses $\bot$ (don't know yet) and $\top$ (conflicting signals). Per the bilattice, the substrate represents both first-class.
- **Implicit feasibility logic.** A scheduler that hard-codes feasibility rules in runtime code (instead of as substrate closure rules) is opaque; per [self-representation](self-representation.md), feasibility logic is substrate content.
- **Cost-estimate without revision.** A scheduler using static cost estimates accumulates calibration drift over time. The substrate's discipline includes the actual-cost-feedback closure rule.

## Position

Work-feasibility is the substrate's *bilattice-valued readiness predicate*. Per [work-item](work-item.md), each queued item has a feasibility cell; per [resource-state-predications](resource-state-predications.md), the cell's value depends on current substrate state; per [opportunistic-scheduling-loop](opportunistic-scheduling-loop.md), the scheduler picks among $\mathbf{t}$-feasible items; per [just-in-time-orchestration-via-cohomological-vanishing](../theorems/just-in-time-orchestration-via-cohomological-vanishing.md), the feasibility update is structurally local and reactive.

The concept composes with [work-item](work-item.md), [resource-state-predications](resource-state-predications.md), [opportunistic-scheduling-loop](opportunistic-scheduling-loop.md), [graded-dispatch-via-q-enriched-fusion](../theorems/graded-dispatch-via-q-enriched-fusion.md) (dispatch picks among feasible items), [bilattice-operation-table](bilattice-operation-table.md) (the value-domain operations the rule uses), and [event-causality-via-lorentzian-settling](../theorems/event-causality-via-lorentzian-settling.md) (the dependency partial order).
