---
title: Valuation
description: The assignment of a bilattice charge to each cell of the predication base Φ. Positing reads the knowledge-least valuation at every cell no articulating has yet reached — measured from evidence, never seeded onto every cell as a stamped bottom. A knowledge-monotone family of valuations is a trace — the dynamic object the modal pair moves along and settling closes to a fixed point, bracketed between the unit cone (settle) and the counit cone (brim), the gap between them the void.
date-created: 2026-06-19
date-modified: 2026-09-21
keywords: ["valuation", "charge", "charged", "bilattice", "measured-not-seeded", "knowledge-least", "trace", "knowledge-monotone", "fiber-algebra", "settling", "void"]
---

## What this node is

A **valuation** assigns a [charge](../pre-bilattice/content/bilattice/content/charge/charge.md) to each
cell of the predication base $\Phi$ — one fiber-algebra $A_p$ per predicate.
Positing reads the **knowledge-least valuation** (`Obsmetrologia.Valuation.knowledgeLeast`):
bottom charge at every cell, but read as the value **no articulating has yet
reached** — a fact about what evidence a cell has been given, not a value
stamped onto every cell before any evidence exists. Assertion raises a cell's
charge as evidence accumulates; because raising only moves *up* the knowledge
order, a sequence of valuations is **knowledge-monotone**.

## Measured, not seeded

The knowledge-least valuation is not a foundational ground the way an earlier
reading took it to be; it is the honest readout of "nothing has been
measured here yet." A valuation is properly built by **measuring** a trace of
articulatings against a codec's contrariety
(`Obsmetrologia.measure`): for-witnesses accumulate from every articulating
whose oriented cell matches the claim being read, against-witnesses from
every articulating whose oriented cell is the *contrary* claim — there is no
operation asserting a charge directly, and no denial without the contrary
predicate having itself been articulated (`Obsmetrologia.no_denial`).
Evidence never retracts as a trace grows (`Obsmetrologia.measure_cons_le`),
which is the valuation-level statement of time's arrow: knowledge is joined,
never withdrawn. `Obsmetrologia.Spine.measure_nil_knowledgeLeast` is the
formal anchor of this node's headline: measuring the empty trace, at every
claim, is exactly the knowledge-least valuation.

## Trace and the dynamic

A knowledge-monotone family $v_\sigma \le_k v_\tau$ is a **trace** — the
Scott-continuous dynamic object. The modal pair (possibilize $\Diamond$ ⊣
necessitate $\Box$) appends new valuations to a trace, keeping it monotone;
[settling](content/knowledge-least-valuation/settling/settling.md) iterates the
modal closure on a trace until the last valuation stops changing.

## The two cones and the void

Each cell's charge, once measured, is bracketed between two fixed points of
the settling closure: the **unit cone** `settle` — the least the given
evidence forces — and the **counit cone** `brim` — the most it allows, reached
by presuming every evidence-free side present before closing
(`Obsmetrologia.CValuation.settle_le_brim`: `settle ≤ₖ brim` at every cell).
The **void** is the slack between them, the cells the two cones disagree on
(`Obsmetrologia.CValuation.Void`) — under-determination that is real because
the carrier is measured, not an artifact of where a value happened to be
stamped: a cell freshly articulated (potential, claim side free) is void on
its claim (`Obsmetrologia.CValuation.articulate_void`), while a cell whose
conflicting tellings have already cancelled to knowledge-bottom, evidenced on
both sides, is not (`Obsmetrologia.CValuation.cancelled_not_void`) — the same
distinction the [absurd corner](../../../../../../../../../absurd-articulation-cell/absurd-articulation-cell.md)
draws between "told nothing" and "cancelled." See
[the two cones and the void](../pre-bilattice/content/bilattice/explanations/the-two-cones-and-the-void.md)
for the kernel's fuller account.

## What descends from it

The [knowledge-least valuation](content/knowledge-least-valuation/knowledge-least-valuation.md)
is the value positing reads before any evidence is measured, and the point the
dynamic begins from; **settling** descends from it.

## Orientation

Read [charge](../pre-bilattice/content/bilattice/content/charge/charge.md) for the value assigned and
[bilattice](../pre-bilattice/content/bilattice/bilattice.md) for the orders along which valuations move.
The morphism that reads the valuation is [positing](../../positing.md).

## Earlier material

A **valuation** assigns a [charge](../pre-bilattice/content/bilattice/content/charge/charge.md) to each
cell of the predication base $\Phi$ — one fiber-algebra $A_p$ per predicate.
[Positing](../../positing.md) seeds the **knowledge-least valuation**: bottom charge
on every cell, the value before any is asserted. Assertion raises a cell's charge;
because raising only moves *up* the knowledge order, a sequence of valuations is
**knowledge-monotone**.

The [knowledge-least valuation](content/knowledge-least-valuation/knowledge-least-valuation.md)
is the seed valuation positing deposits, and the point the dynamic begins from;
**settling** descends from it.
