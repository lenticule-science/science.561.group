---
title: Entity
description: The subject and object coordinates of a predication cell — the relata a predicate is asserted between. Entities occupy the first and third positions of φ = (s, p, o); the positions are oriented and not interchangeable. Set-theoretically they range over the entity set E.
date-created: 2026-06-19
date-modified: 2026-06-19
keywords: ["entity", "subject", "object", "predication-cell", "predicate", "entity-set", "orientation", "relata"]
---

# Entity

## What this node is

An **entity** is a relatum — the kind of thing that occupies the **subject** and
**object** positions of a [predication cell](../predication-cell/predication-cell.md)
$\phi = (s, p, o)$. The first coordinate $s$ is the subject entity, the third
coordinate $o$ is the object entity, and a [predicate](../predicate/predicate.md)
is asserted *between* them, oriented from subject to object.

## Oriented, not interchangeable

The two entity positions are **not symmetric**. The cell $(s, p, o)$ asserts
something of $s$ in relation to $o$; swapping them gives $(o, p, s)$, a *distinct*
cell with an independent value. Entities are therefore not merely the members of
an unordered pair $\{s, o\}$ — they are placed, and the placement carries the
direction the assertion runs. The reflexive case $(s, p, s)$, where one entity
fills both positions, is the diagonal: a fixed point of both subject- and
object-projection.

Set-theoretically the entities range over the **entity set** $E$, and the
predication cell set is $\Phi = E \times \Pi \times E$ — entities on both flanks,
predicates between.

## Orientation

Read [predicate](../predicate/predicate.md) for the typed middle coordinate the
entities are related through, and [predication-cell](../predication-cell/predication-cell.md)
for the oriented triple they flank. The morphism that produced the cell is
[predicating](../../predicating.md).
