---
type: definition
class: admissible-region-cell
status: draft
depends-on: [bilattice, settling-cobordism-category]
see-also: [safe-envelope-precheck-as-bilattice-modal-suspension, drone-record]
title: Safety-envelope-cell
description: The substrate-cell shape carrying the precomputed admissible region $\sigma$ for the safety-envelope-precheck modal operator $\Box\sigma$ of safe-envelope-precheck-as-bilattice-modal-suspension.
---

# Safety-envelope-cell

The substrate-cell shape carrying the **precomputed admissible region** $\sigma$ for the safety-envelope-precheck modal operator $\Box_\sigma$ of [safe-envelope-precheck-as-bilattice-modal-suspension](safe-envelope-precheck-as-bilattice-modal-suspension/safe-envelope-precheck-as-bilattice-modal-suspension.md).
The cell encodes the boundary of the admissible region as a bilattice-valued predicate over actuation-space.

## Distinguishing predication-shape

```yaml
type: safety-envelope-cell
slug: <envelope-slug>
target-drone: <drone-record-slug>
target-actuation-space: <actuation-space-slug>
boundary-source: hj-reachability | control-barrier-function | gcbf-plus | manual-charter
boundary-content: <boundary-cell-id>   # content-addressed to the precomputed boundary data
admissible-region-predicate: <predicate-slug>
non-admissible-region-predicate: <predicate-slug>
last-recomputation: <ISO-8601-timestamp>
recomputation-trigger: <event-class>   # what causes recomputation (drone-state-change, environment-change, etc.)
authorized-by: <office-slug>           # which office certified this envelope as binding
```

The `boundary-source` declares which technique computed the admissible region's boundary; the bulk computation is foreign-interior cobordism per [tqft-structure](../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-frobenius-structure/references/tqft-structure.md), and only the boundary appears as a substrate-resident cell.
Replay-byte-identity holds for the boundary even when the bulk computation was non-deterministic offline.

## Step-induction role

Without safety-envelope-cells the polity has no admissible region to read at safety-envelope-precheck time — $\Box_\sigma$ has no $\sigma$.
With them, the bilattice-modal operator has a substrate-resident input and the precheck verdict is decidable.
Required for every embodied-actuating workitem per the [meaningful-human-control](../meaningful-human-control/meaningful-human-control-as-charter-c3-extension/meaningful-human-control-as-charter-c3-extension.md) Condition 2 closure rule.

## Position

The cell-shape is the substrate-side projection of Layer 3 (certified-safety-shield) of the three-layer architecture.
Its boundary serves as the in-boundary of Layer 3's cobordism $S_X$ in [six-way-intersection-composition](../six-way-intersection-composition/six-way-intersection-composition.md).

## Open

- Recomputation cadence: event-triggered vs. periodic.
  Likely event-triggered for routine drift; captain-recomputed when charter-tier authority changes the envelope.
- Federated envelopes: when multiple polities share a drone, who certifies the envelope?
  Likely a federation-handshake morphism resolves this with co-attestation.
- The relationship between offline-precomputed envelopes and online bilattice-network-sheaf-consensus on envelope drift.
  The latter handles drift; the former is the captain's authoring move.
