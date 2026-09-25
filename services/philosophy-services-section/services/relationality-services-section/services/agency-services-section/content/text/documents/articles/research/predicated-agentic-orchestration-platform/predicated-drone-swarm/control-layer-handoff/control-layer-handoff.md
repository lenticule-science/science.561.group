---
type: definition
class: inter-cobordism-boundary
status: draft
depends-on: [settling-cobordism-category, safety-envelope-cell]
see-also: [drone-record, six-way-intersection-composition]
title: Control-layer-handoff
description: The substrate-cell shape that records a handoff between two layers of the three-layer hierarchical safety architecture (Layer 1 foundation-model → Layer 2 optimization-control → Layer 3 certified-safety-shield).
---

# Control-layer-handoff

The substrate-cell shape that records a **handoff between two layers** of the three-layer hierarchical safety architecture (Layer 1 foundation-model → Layer 2 optimization-control → Layer 3 certified-safety-shield).
Each handoff is a boundary predication system $\mathcal{B}$ in `Cob_settling` that simultaneously serves as the out-boundary of one layer's cobordism and the in-boundary of the next.

## Distinguishing predication-shape

```yaml
type: control-layer-handoff
slug: <workitem-id>--<from-layer>--<to-layer>
workitem-id: <workitem-slug>
from-layer: layer-1-foundation-model | layer-2-optimization-control
to-layer: layer-2-optimization-control | layer-3-certified-safety-shield
out-boundary-cell-system: [<cell-id>, ...]   # boundary cells from the outgoing cobordism's out-boundary
in-boundary-cell-system: [<cell-id>, ...]    # boundary cells of the receiving cobordism's in-boundary
boundary-compatibility-witness: <witness-id>  # the cell-system identification certifying B_out = B_in
closure-stable: true | false
```

The `boundary-compatibility-witness` cell certifies that the out-boundary of the producing cobordism equals the in-boundary of the consuming cobordism — the structural requirement for cobordism composition per [settling-cobordism-category §Composition](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cobordism-category.md).
Without this witness the layers do not compose; with it the composite cobordism in `Cob_settling` is well-defined.

## Step-induction role

The three-layer composition theorem ([six-way-intersection-composition](../six-way-intersection-composition/six-way-intersection-composition.md), restricted to the three-layer subset) requires per-handoff witnesses to certify each composition step.
Without control-layer-handoff cells the polity cannot certify that the layers actually composed; with them, the composition is auditable.

## Position

Inter-cobordism boundary records are the substrate-side realization of the closure-stable boundary requirement of `Cob_settling`.
Per [settling-cobordism-category §Objects](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cobordism-category.md), boundary valuations must be closure-stable; the `closure-stable: true | false` field records whether the polity has verified this for the specific handoff.

## Open

- Whether each layer-N → layer-(N+1) handoff requires a captain-attestation cell (likely no for routine operation; yes for charter-tier-3 actuating workitems).
- The substrate-side detection of "closure-stable" — likely a closure rule `verify-handoff-closure-stability` reads the boundary cells and applies the polity's closure operator; idempotency check determines stability.
