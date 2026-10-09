---
type: definition
class: embodied-participant-cell-shape
status: draft
depends-on: [embodied-handedness, physical-precondition, agent-record]
see-also: [physical-budget-record, control-layer-handoff]
realizes: [seven-axis-taxonomy]
title: Drone-record
description: The substrate-cell shape for an embodied participant in the polity's drone swarm.
---

# Drone-record

The substrate-cell shape for an embodied participant in the polity's drone swarm.
Realizes the [seven-axis taxonomy](../_index.md#the-seven-axis-taxonomy-as-predicate-fibration) as substrate-typed frontmatter; the predication fibration over $\mathcal{C}^\mathrm{drone}$ has the drone-record as its fiber-data carrier.

## Distinguishing predication-shape

```yaml
type: drone-record
slug: <participant-slug>
embodiment: software-only | embodied-robot | hybrid-human-machine
control-architecture: centralized | hierarchical | decentralized | distributed
homogeneity: identical | role-specialized-homogeneous | heterogeneous
interaction-topology: metric-neighbor | topological-neighbor | all-to-all | leader-follower | tree | mesh | time-varying-switching
information-structure: full-state | partial-observability | delayed | lossy | event-triggered | adversarial
decision-model: rule-based | optimization-based | game-theoretic | learned
assurance-class: empirical-only | partially-certified | theorem-backed-with-explicit-safe-sets
embodied-handedness:
  recv: <bandwidth-budget-window>
  send: <bandwidth-budget-window>
  actuate: <physical-precondition-set>
  observe: <sensor-set>
applicable-theorems: [<theorem-slug>, ...]   # mechanically computed from the seven-axis values
applicable-regulations: [<regulation-slug>, ...]   # mechanically computed from assurance-class + embodiment
governing-soul-of-scope: <soul-record-slug>   # which soul this drone is committed to
```

The seven-axis values declare the drone's position in the predicate category $\mathcal{C}^\mathrm{drone}$; substrate closure rules read these values to compute `applicable-theorems` (which sub-theory theorems apply at this drone's coordinates) and `applicable-regulations` (which charter-tier regulatory authorities bind this drone's actuations).

## Step-induction role

Without drone-records, the polity's dispatch graph cannot reason about embodied participants at all — it has no fiber data to read for the predication fibration.
With drone-records, dispatch can match work to participants whose seven-axis profile satisfies the work's required preconditions, and the [embodied-cost-quantale](../embodied-cost-quantale-extends-monetary/embodied-cost-quantale-extends-monetary.md)'s Pareto-min ranking applies.

## Position relative to existing AOP `agent` object

A drone-record is a *specialization* of [`agent-record`](../../../../../objects/agent-record.md) for embodied participants.
The agent-record's symmetric-peer assumption is replaced by the embodied-handedness asymmetry; the seven-axis taxonomy refines the agent-record's coarser type predicates.

A drone is `instantiates: agent-record` plus the specialization predicates above.

## Open

- Whether `governing-soul-of-scope` is required for every drone (likely yes; embodied actuation requires explicit soul-binding per the charter-tier-discipline).
- The exact form of `embodied-handedness` sub-fields when they vary over time (battery state changes, weather changes RF range).
  Likely event-emission updates the cell.
- Federation: when a drone is loaned from one polity to another, which polity's soul governs it?
  The federation-handshake morphism resolves this; the drone-record carries the handshake reference.
