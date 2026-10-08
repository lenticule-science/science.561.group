---
type: concept
class: participant-property
status: draft
depends-on: [agent, physical-precondition]
see-also: [predicated-drone-collective-fails-classical-stigmergy, coordination-across-handedness-asymmetric-participants]
title: Embodied handedness
description: "The substrate-property that distinguishes embodied participants from disembodied (purely-software) agents: an embodied participant's communication and actuation structure is asymmetric — the participant receives more than it sends,…"
---

# Embodied handedness

The substrate-property that distinguishes embodied participants from disembodied (purely-software) agents: an embodied participant's communication and actuation structure is **asymmetric** — the participant receives more than it sends, broadcasts state periodically rather than continuously, actuates under physical preconditions, and observes its environment partially.
The asymmetry is structural, not a tuning parameter.

## Four-coordinate structure

A participant's embodied handedness is a four-tuple:

$$h(d) = (\mathrm{recv}, \mathrm{send}, \mathrm{actuate}, \mathrm{observe})$$

where each coordinate is a participant-specific predicate over the substrate's communication/actuation/observation axes:

- **`recv`** — the participant's receive-handedness: bandwidth budget, receiver hardware class, decoding latency profile.
- **`send`** — the participant's send-handedness: transmit power, bandwidth budget, broadcast cadence.
- **`actuate`** — the participant's actuation handedness: physical preconditions for actuation, energy cost per actuation, actuation latency.
- **`observe`** — the participant's observe-handedness: sensor set, sensor noise model, sensor field-of-view.

The four coordinates are *generally not equal* across embodied participants — drones with different airframes, different sensors, and different bandwidth budgets have different handedness coordinates.
Two participants are *handedness-symmetric* iff $h(d_1) = h(d_2)$; the symmetric case is rare and an idealization.

## Why the asymmetry matters structurally

Per [predicated-drone-collective-fails-classical-stigmergy](../predicated-drone-collective-fails-classical-stigmergy/predicated-drone-collective-fails-classical-stigmergy.md): embodied collectives fail classical stigmergy because handedness asymmetry violates the uniform-reciprocal-signal-exchange condition.
The substrate-coordination layer carries what classical stigmergy would have provided.

Per [coordination-across-handedness-asymmetric-participants](coordination-across-handedness-asymmetric-participants/coordination-across-handedness-asymmetric-participants.md): the cohomology bound on coordination disagreement adds generators in the $H¹_{\chi_\sim}$ sector for each handedness-asymmetric edge in the commitment graph.

## Position

Embodied handedness is the load-bearing concept that distinguishes this sub-theory from the AOP parent.
The AOP's symmetric-peer assumption is replaced by handedness asymmetry; every other concept and theorem in the sub-theory derives from this distinction.

## Substrate cell-shape

The handedness-coordinates are sub-fields of the [drone-record](../drone-record/drone-record.md) cell-shape.
They are read by the dispatch graph's selection logic at every dispatch decision involving an embodied participant.
