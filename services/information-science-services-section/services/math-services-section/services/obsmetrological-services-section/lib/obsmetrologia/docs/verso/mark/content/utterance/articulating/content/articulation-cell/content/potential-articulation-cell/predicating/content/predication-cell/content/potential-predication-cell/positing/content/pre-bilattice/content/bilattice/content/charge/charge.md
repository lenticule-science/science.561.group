---
title: Charge
description: The four-point value of the bilattice, now carried together with its lossless evidence as Obsmetrologia.Charged — value plus a witness pair. An ordered pair [positive-slot, negative-slot] of slot-presence, the same four-point object as the articulation phases recast as value. Bottom (absurd), positive (potential), negative (active), top (stable/held-both). Measured from evidence, never seeded; presumption is the one sanctioned breach.
date-created: 2026-06-19
date-modified: 2026-09-21
keywords: ["charge", "charged", "measured", "evidence", "bilattice", "slot-presence", "knowledge-bottom", "knowledge-top", "positive", "negative", "four-point", "paraconsistent", "presumption"]
---

## What this node is

A **charge** is the value a [bilattice](../../bilattice.md) assigns to a cell: an
ordered pair `[positive-slot, negative-slot]` where each slot is either absent
(empty) or present (a singleton). **Absence is slot structure, not a third
primitive** — two slots in two states give exactly **four** charges, the same
four-point object as the [articulation phases](../../../../../../../../../../../../../../articulation-cell.md),
here recast as *value*:

| Charge | pos | neg | reading | phase |
| --- | --- | --- | --- | --- |
| knowledge-bottom | empty | empty | no evidence either way | absurd |
| positive | present | empty | evidence for | potential |
| negative | empty | present | evidence against | active |
| knowledge-top | present | present | evidence both ways | stable / held both |

## Charge carries its evidence: `Charged`

**"The admission boundary, restored."** The bare four-point value above is
`Charge`; positing does not admit a bare `Charge` directly. What is admitted
is `Obsmetrologia.Charged`: a `value : Charge` together with `evidence`, the
pair of witness slots (for-witnesses, against-witnesses) that value is read
off. `Charged.Measured` is the invariant that the value **is** the presence
pattern of the evidence — `Charged.ofCell`, which reads a `Charged` straight
off an articulation cell's own slots, is always measured
(`Charged.ofCell_measured`). This closes the question the pre-ruling text of
this node left open ("whether the bottom charge is *seeded* onto every cell
or *measured* from each cell's givens"): it is measured, and a charge without
its evidence is an incomplete carrier, not the full one.

Combining two `Charged` values (`joinK`, `meetK`, `joinT`, `meetT`) always
unions the evidence on each side even where it changes the derived value.
This is what makes the knowledge-top value **honestly** distinguishable from
a **cancelled** one: `potential ⊓ₖ active` has value knowledge-bottom *and*
both witnesses kept (`Charged.meetK_not_measured`) — the meet is not
measured, and that gap between value and evidence is exactly how "absurd,
told nothing" differs from "absurd, two tellings that cancelled." The one
sanctioned breach of `Measured` is `Charged.presumeFree`: raise every
evidence-free side to present while leaving the evidence itself untouched —
a bare articulated cell presumes from potential up to stable
(`Charged.presumeFree_articulate`), and `presumeFree` only ever raises a
value, never lowers one (`Charged.presumeFree_ge`).

## Why this matters

The identification is the spine of the design: the phases of *articulation*
and the values of the *value algebra* are not analogues, they are **the same
four-point object met at two depths**. The top charge is a *held
contradiction*, not explosion — evidence for and against retained together,
absorbing under further telling — which is why the value logic is
**paraconsistent** and why that corner is named *stable*. Bottom is
**absurd**: the charge with no evidence either way, holding only because
nothing constrains it — the identity of joining-knowledge, and the reading a
cell has by default before any evidence has been measured at it (naming
ruled 2026-08-05; see `docs/history/corner-naming-convention.md`).

## Orientation

Read [bilattice](../../bilattice.md) for the two orders and six operations that
range over these four charges. The morphism that admits a charge into a cell is
[positing](../../../../../../positing.md).

## Earlier material

| Charge | pos | neg | reading | phase |
|---|---|---|---|---|
| knowledge-bottom | empty | empty | no evidence either way | potential |
| positive | present | empty | evidence for | active |
| negative | empty | present | evidence against | stable |
| knowledge-top | present | present | evidence both ways | absurd / over-determined |

The identification is the spine of the design: the phases of *articulation* and
the values of the *value algebra* are not analogues, they are **the same
four-point object met at two depths**. The top charge is a *held contradiction*,
not explosion — evidence for and against retained together — which is why the
value logic is **paraconsistent**. Bottom is the identity of joining-knowledge,
the value [positing](../../../../../../positing.md) seeds before any is asserted.
