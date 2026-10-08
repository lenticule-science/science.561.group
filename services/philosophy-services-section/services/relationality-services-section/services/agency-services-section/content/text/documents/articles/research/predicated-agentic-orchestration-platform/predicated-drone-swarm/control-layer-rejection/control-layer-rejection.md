---
type: concept
class: inter-cobordism-event
status: draft
depends-on: [control-layer-handoff, safety-envelope-cell]
see-also: [safe-envelope-precheck-as-bilattice-modal-suspension, six-way-intersection-composition]
title: Control-layer rejection
description: "The substrate-event when one layer of the three-layer hierarchical safety architecture refuses to accept a handoff from the layer above it — a control-layer-handoff cell whose closure-stable: false because the receiving layer's…"
---

# Control-layer rejection

The substrate-event when one layer of the three-layer hierarchical safety architecture **refuses** to accept a handoff from the layer above it — a [control-layer-handoff](../control-layer-handoff/control-layer-handoff.md) cell whose `closure-stable: false` because the receiving layer's admissibility check rejected the incoming boundary.

## Three rejection points

Per the three-layer architecture (Layer 1 foundation-model → Layer 2 optimization-control → Layer 3 certified-safety-shield), three rejection events are possible:

- **Layer 2 rejects Layer 1's intent.** The optimization-control layer's solver finds no feasible trajectory satisfying Layer 1's intent within the action-space constraints.
  Substrate response: emit a `control-layer-rejection` witness; return an `intent-infeasible` cell to Layer 1; Layer 1 may re-plan or escalate.
- **Layer 3 rejects Layer 2's action.** The certified-safety-shield's $\Box_\sigma$ verdict is $\mathbf{f}$ — the action is outside the admissible region.
  Substrate response: emit a `control-layer-rejection` witness; return an `action-unsafe` cell to Layer 2; Layer 2 must re-solve under tightened constraints or surrender to layer-1 escalation.
- **The actuation hardware rejects Layer 3's certified action.** Physical-precondition violation detected at actuation time (e.g., battery insufficient despite Layer 2 budget projection).
  Substrate response: emit a `control-layer-rejection` witness with `actuation-failed`; cell propagates back through layers for analysis.

## Why rejection is a substrate event, not an exception

A rejection is a **boundary-incompatibility event** in `Cob_settling`: the producing cobordism's out-boundary does not match the receiving cobordism's in-boundary.
The substrate's response is to emit a witness recording the rejection; downstream cobordisms compose against the witnessed rejection cell, not against the would-have-been-handoff.
The polity's audit chain captures the rejection as positive content, not as a missing record.

## Failure-vs-rejection

Distinct from [`failure-detection-as-bilattice-modal-suspicion`](../../../theories/distributed-coordination-platform/theorems/failure-detection-as-bilattice-modal-suspicion.md): failure is when a participant goes silent; rejection is when a participant explicitly returns a non-acceptance verdict.
Both are substrate events; their bilattice-modal forms differ.

## Position

Control-layer rejection is the substrate-side accounting for "the layered architecture does not always succeed."
Per the three-layer safety architecture's design intent, rejections are *expected* — the whole point of layering is to catch unsafe actions before they actuate.
A polity with frequent Layer 3 rejections is operating at the safety boundary, which is auditably visible via the rejection-witness count.
