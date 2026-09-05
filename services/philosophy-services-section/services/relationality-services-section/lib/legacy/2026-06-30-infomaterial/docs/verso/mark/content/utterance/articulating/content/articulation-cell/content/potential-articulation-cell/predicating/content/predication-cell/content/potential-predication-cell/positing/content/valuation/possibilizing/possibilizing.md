---
title: Possibilizing
description: The modal operation ◇ of the valuation — raises each cell's charge to the knowledge-join of the charges assigned at that cell across the valuation's fiber-algebras, appending a new knowledge-monotone valuation to the trace. Inflationary ("what could become known"). Left adjoint of necessitating's □.
date-created: 2026-06-21
date-modified: 2026-06-21
keywords: ["possibilizing", "valuation", "modal", "diamond", "knowledge-join", "trace", "scott-continuous", "bilattice", "adjunction"]
---


## What this node is

**Possibilizing** is the modal operation $\Diamond$ of the
[valuation](../valuation.md): it raises each cell's
[charge](../../pre-bilattice/content/bilattice/content/charge/charge.md) to the
**knowledge-join** of the charges assigned at that cell across the valuation's
fiber-algebras, and appends the result as a new valuation on the trace:

$$
\Diamond : v \;\longmapsto\; v' , \qquad v'(c) \;=\; \bigvee\nolimits_{k}\; \{\, v(c) : \text{over } \Phi \,\}.
$$

It reuses the bilattice's join along the **knowledge order**, so it only ever
moves a charge *up* $\le_k$ — the appended valuation is knowledge-monotone over
its predecessor, keeping the [trace](../valuation.md) a Scott-continuous family.

## What it means

Possibilizing is **inflationary** — "what *could* become known." It opens each
cell to the most its fellow assignments across $\Phi$ would support, without yet
committing. It is the diamond of the modal pair $\Diamond \dashv \Box$ with
[necessitating](../necessitating/necessitating.md), and the two run on the
**same** trace carrier — over the knowledge order here, and, by the
[two-orders duality](../../pre-bilattice/content/bilattice/content/two-orders-duality/two-orders-duality.md)
of the bilattice, over the truth order as its $\Diamond_t$ variant.

## What it serves

The composite $\Diamond \circ \Box$ is the closure
[settling](../content/knowledge-least-valuation/settling/settling.md) iterates to
a fixed point. Possibilizing supplies the raising half; on its own it does not
settle — it is one append, not the orbit. Its coherence with necessitating is
[commutating](../commutating/commutating.md), the 2-cell that (at this regime,
and only here) becomes invertible.

## Orientation

Acts on the [valuation](../valuation.md), starting from the
[knowledge-least valuation](../content/knowledge-least-valuation/knowledge-least-valuation.md).
Adjoint: [necessitating](../necessitating/necessitating.md). Coherence:
[commutating](../commutating/commutating.md). Closed to a fixed point by
[settling](../content/knowledge-least-valuation/settling/settling.md).
