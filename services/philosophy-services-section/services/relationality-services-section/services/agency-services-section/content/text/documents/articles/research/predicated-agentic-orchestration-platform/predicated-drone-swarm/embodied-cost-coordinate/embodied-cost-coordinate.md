---
type: definition
class: cost-quantale-coordinate
status: draft
depends-on: [cost-discipline]
see-also: [embodied-cost-quantale-extends-monetary, physical-budget-record]
title: Embodied-cost-coordinate
description: The substrate-cell shape for one coordinate of the embodied cost-quantale $Q\mathrm{embodied} = (\mathrm{fuel}, \mathrm{dollars}, \mathrm{tokens}, \mathrm{joules}, \mathrm{bandwidth})$.
---

# Embodied-cost-coordinate

The substrate-cell shape for **one coordinate** of the embodied cost-quantale $Q_\mathrm{embodied} = (\mathrm{fuel}, \mathrm{dollars}, \mathrm{tokens}, \mathrm{joules}, \mathrm{bandwidth})$.
Each cost coordinate is a Lawvere-quantale-valued predicate; the embodied-cost-quantale is their product per [embodied-cost-quantale-extends-monetary](../embodied-cost-quantale-extends-monetary/embodied-cost-quantale-extends-monetary.md).

## Distinguishing predication-shape

```yaml
type: embodied-cost-coordinate
slug: <coordinate-slug>
coordinate-name: fuel | dollars | tokens | joules | bandwidth
quantale: <quantale-record-slug>
unit: <unit-slug>             # SI unit or substrate-unit (e.g., 'token', 'settlement-fuel')
ordering: <pareto-direction>   # always 'minimize' for cost coordinates
reads-from: <substrate-region>  # where consumption events accumulate
budget-template: <physical-budget-record-slug>
```

The coordinate's `quantale` reference identifies which Lawvere-quantale provides the algebraic structure; standard cases:

| Coordinate | Quantale | Substrate-source |
|---|---|---|
| fuel | $(\mathbb{N}, +, 0)$ | settlement-fuel cells |
| dollars | $(\mathbb{R}_{\geq 0}, +, 0)$ | endpoint-cost cells |
| tokens | $(\mathbb{N}, +, 0)$ | LLM-invocation cells |
| joules | $(\mathbb{R}_{\geq 0}, +, 0)$ | physical-budget-record (battery axis) |
| bandwidth | $(\mathbb{N}, +, 0)$ | physical-budget-record (bandwidth axis) |

## Step-induction role

Closure rule `compute-projected-cost` reads each coordinate's substrate-source for a proposed dispatch, projects the cost onto each axis, and emits the projected-cost cell that the [embodied-cost-quantale Pareto-min ranking](../embodied-cost-quantale-extends-monetary/embodied-cost-quantale-extends-monetary.md) reads.

## Position

Cost-quantale-coordinate cells are the per-axis fiber data for the embodied cost-quantale.
Without them the dispatch graph's selection logic has no axis-specific cost data; with them, each axis is independently rankable and the multi-axis Pareto comparison is well-defined.

## Open

- Whether the coordinate cells are per-workitem or per-(workitem, dispatchable) pair.
  Likely the latter for dispatch-time projection.
- The relationship between substrate-fuel and joules — they are conceptually different (substrate-fuel is settlement work; joules is physical actuation energy) but on a drone they share the same battery.
  Cost-coupling needs a substrate-record.
