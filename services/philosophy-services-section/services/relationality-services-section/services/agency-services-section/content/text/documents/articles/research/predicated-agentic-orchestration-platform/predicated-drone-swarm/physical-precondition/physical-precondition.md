---
type: concept
class: actuation-precondition
status: draft
depends-on: [embodied-handedness, safety-envelope-cell]
see-also: [physical-budget-record, safe-envelope-precheck-as-bilattice-modal-suspension]
title: Physical precondition
description: A predicate over the embodied participant's physical state that must hold before an actuation is admissible.
---

# Physical precondition

A predicate over the embodied participant's physical state that **must hold** before an actuation is admissible.
Distinct from substrate-precondition (which is a predicate over substrate cells); a physical precondition is a predicate over physical-world state — battery state, position, orientation, sensor coverage of the actuation target — that the substrate reads via the participant's sensor cells and budget cells.

## Examples

- `battery-charge >= floor-for-actuation` — physical-budget-record's `joules-budget-floor` axis.
- `position-within-authorized-airspace` — read against the airspace cell.
- `target-line-of-sight-confirmed` — read against the sensor's recent observations.
- `wind-speed-below-airframe-limit` — read against weather-sensor cells.
- `mission-soul-binding-active` — read against the participant's `governing-soul-of-scope` cell (charter-tier-3 actuating workitems require active soul-binding).

## Why this is a separate concept

Disembodied agents have substrate-preconditions only — predicates over substrate cells.
Embodied participants have *both* substrate-preconditions (e.g., authorization-bundle composition with charter tier) and physical-preconditions (e.g., battery state).
The two compose at dispatch time; either failing rejects the actuation.

The [safe-envelope-precheck modal operator](../safety-envelope-cell/safe-envelope-precheck-as-bilattice-modal-suspension/safe-envelope-precheck-as-bilattice-modal-suspension.md) reads physical-precondition predicates as part of its admissibility computation; its bilattice-valued verdict aggregates physical-precondition checks alongside substrate-precondition checks.

## Position

Physical preconditions are the substrate-readable manifestation of the surveys' "physical world matters" point.
PyFARS's substrate cannot bypass physics; the physical-precondition concept makes that explicit and decidable in Π₁.
