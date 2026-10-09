---
title: Batch Positing
description: Order-independent finite batches of posits. positList folds a list of (claim, charge) instructions into a valuation; permuted batches posit to the identical result, because a batch collapses to a single knowledge-join against a summed delta. Inflationary, monotone, and idempotent exactly as a single posit is — the finite-batch induction positing-morphism's own docstring left undone.
date-created: 2026-08-05
date-modified: 2026-08-05
keywords: ["batch-positing", "positlist", "order-independence", "permutation-invariance", "delta-sum", "knowledge-join", "valuation"]
---

## What this node is

[Positing morphism](../../positing-morphism.md) proves that two posits commute
unconditionally (`posit_comm`) and that two posits at the same cell merge by
joining their charges (`posit_posit_same`), but its own docstring names what it
leaves undone: "the finite-batch induction itself." This node carries that
induction out, in `Obsmetrologia/Language/Positing/Batch.lean`:

```lean
Valuation.positList (ws : List (Claim × Charge)) (v : Valuation) : Valuation :=
  ws.foldl (fun acc w => posit w.1 w.2 acc) v
```

`positList` folds a finite list of posit-instructions into a valuation, one
`Valuation.posit` at a time, left to right.

## Order-independence, exactly

`Valuation.positList_perm` is the main result: if `ws` and `ws'` are
permutations of each other (`List.Perm ws ws'`), they posit to the same
result at every claim point. It is proved by structural induction on the
permutation witness — `nil` trivial, `cons` a congruence over the recursive
permutation, `swap` exactly `posit_comm` pushed through the shared tail via a
private congruence lemma, `trans` composed. This is the fact a CRDT-style
merge relies on: as far as its outcome is concerned, a batch of posits behaves
as a *set* of instructions, not a sequence.

The closed form underneath order-independence is `Valuation.deltaSum` — the
knowledge-join of the point-mass `delta` of every instruction in the batch,
evaluated at one claim point — and `Valuation.positList_eq_joinK_deltaSum`:

$$\mathrm{positList}(ws, v)(\psi) = v(\psi) \vee_k \mathrm{deltaSum}(ws)(\psi).$$

A batch is, semantically, just one big join, and joins do not care what order
their arguments were listed in — order-independence is a corollary of this
closed form, not a separate combinatorial fact.

## The lifted laws

Exactly the single-posit laws, lifted to batches:

* `Valuation.positList_inflationary` — a batch never retracts knowledge already
  held.
* `Valuation.positList_monotone` — batching is monotone in the starting
  valuation.
* `Valuation.positList_idem` — applying the same batch twice is the same as
  applying it once, regardless of whether the batch repeats a cell internally.
* `Valuation.positList_append` — batches concatenate: positing `as ++ bs` is
  positing `as`, then folding `bs` into the result.

## What remains open

This node discharges exactly the gap [positing morphism](../../positing-morphism.md)
names: the finite-batch induction. It does not address the **closure**
companion — how a sequence of posits, batched or not, settles to a fixed point
under the modal closure — which is
[settling](../../../content/knowledge-least-valuation/settling/settling.md)
territory. It also states the merge property only for `List.Perm` on a bare
`List (Claim × Charge)`, not against an actual set- or multiset-typed batch —
a scope note, not a weaker theorem: `List.Perm` invariance already supplies
exactly the content a set-typed batch would need (agreement up to
reordering), stated at the list level it is proved at.

## Orientation

Parent operation: [positing morphism](../../positing-morphism.md). Acts on the
[valuation](../../../valuation.md), same as a single posit. Read
[charge](../../../../pre-bilattice/content/bilattice/content/charge/charge.md)
for the values batched, and
[settling](../../../content/knowledge-least-valuation/settling/settling.md)
for the closure this batch algebra does not itself carry out.
