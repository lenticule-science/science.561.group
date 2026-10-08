---
type: definition
class: resource-budget-cell
status: draft
depends-on: [embodied-cost-coordinate, drone-record]
see-also: [embodied-cost-quantale-extends-monetary]
title: Physical-budget-record
description: The substrate-cell shape carrying an embodied participant's current budget on each embodied-cost-coordinate.
---

# Physical-budget-record

The substrate-cell shape carrying an embodied participant's **current budget** on each embodied-cost-coordinate.
The closure rule `verify-physical-budget` reads this cell at dispatch time; a `(workitem, dispatchable)` pair whose projected cost on any axis exceeds the current budget is rejected.

## Distinguishing predication-shape

```yaml
type: physical-budget-record
slug: <drone-record-slug>--<budget-window>
target-drone: <drone-record-slug>
budget-window: <ISO-8601-duration | event-triggered-bound>
joules-budget:
  remaining: <float>
  unit: J
  decay-rate: <float-per-second>      # battery natural drain
joules-budget-floor: <float>           # below which actuation is refused regardless of dispatch
bandwidth-budget:
  bytes-remaining-in-window: <int>
  window-start: <ISO-8601-timestamp>
  window-duration: <ISO-8601-duration>
fuel-budget: <int>
dollars-budget: <float>
tokens-budget: <int>
last-update-event: <event-id>
projection-rule: <closure-rule-slug>   # the rule that updates this cell
```

The `joules-budget-floor` is the hard floor below which the drone's actuation is refused regardless of any other consideration — the embodied analogue of the substrate's settlement-fuel exhaustion rule.
The cell is updated by the closure rule referenced in `projection-rule`; updates fire on event-emissions (sensor reads, actuation events, communication-budget consumption).

## Step-induction role

Without physical-budget-record cells the [embodied-cost-quantale](../embodied-cost-quantale-extends-monetary/embodied-cost-quantale-extends-monetary.md)'s rejection axis has no budget to compare against — the Pareto-min ranking degenerates to the disembodied `(fuel, dollars, tokens)` triple.
With them, the embodied axes carry independent budget data and the rejection rule fires on physical exhaustion.

## Position

Physical-budget-record cells are the **disqualification axis** for embodied dispatch in the same sense that `eligible-by-rate-limit` is the disqualification axis for endpoint dispatch (per [`pyfars.runtime.eligibility_rules`](../../../../../../../../../tools/platform/pyfars/src/pyfars/runtime/eligibility_rules.py)).
Pass-3 wires the closure rule into the eligibility-rule subsystem.

## Open

- Whether `joules-budget` should be per-task or aggregate (sum across in-flight tasks).
  The cost-coupling question on `embodied-cost-coordinate` informs this.
- Recharge events: when a drone returns to a charging station, does the budget refresh atomically or via a charging-trajectory cobordism?
  Likely the latter — recharging is itself a settling cobordism that produces a `physical-budget-record-recharged` witness.
- The interaction with [verify-certifiability-sectors](../../../../../../../../../../../../../engineering-science-services-section/services/technology-science-services-section/content/text/documents/articles/notes/undated/verify-certifiability-sectors.md): a budget-exhausted dispatch is refused at `c_2-physical-budget`, but does the refusal also surface as a `H¹_χ_-` event (paraconsistent inconsistency)?
  Likely no; budget exhaustion is `c_5 = F` (additional disqualification axis), not a cohomology event.
