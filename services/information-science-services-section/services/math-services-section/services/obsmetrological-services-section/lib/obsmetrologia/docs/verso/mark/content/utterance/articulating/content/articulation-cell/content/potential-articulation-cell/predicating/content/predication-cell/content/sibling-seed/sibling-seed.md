---
title: Sibling Seed
description: Off-diagonal predication cells arise only by composing sibling seeds drawn from an articulating recursion's own utterances, never by postulating an entity from nothing — composeSeeds and cellsOf discharge the RelMath blueprint's content.tex:136 promise, with completeness proved as composeSeeds_surjective. "Sibling" is stated as the linear-utterances hypothesis, not a theorem; a structural reading is left open.
date-created: 2026-08-05
date-modified: 2026-08-05
keywords: ["sibling-seed", "composeseeds", "cellsof", "off-diagonal", "completeness", "linear-sibling-hypothesis", "blueprint", "utterances"]
---

## What this node is

The RelMath blueprint (`content.tex:136`) promises, and until now never
elsewhere discharges, that cells with `subject ≠ object` "arise only by
composing such seeds drawn from sibling utterances of the articulating
recursion, never by postulating an entity from nothing."
`Obsmetrologia/Language/Predicating/SiblingSeed.lean` discharges that promise.
`PredicationCell.composeSeeds` composes the reflexive seeds of two utterances
`u` and `v` through the **first** utterance's claim:

```lean
PredicationCell.composeSeeds (u v : Utterance) : PredicationCell := ⟨u.token, u.claim, v.token⟩
```

Subject and predicate come from `u`, object comes from `v`'s token. Composing a
seed with itself is the diagonal seed exactly (`composeSeeds_self`): nothing
off-diagonal is produced from a single utterance alone.

## The linear-sibling hypothesis, stated as a hypothesis

The blueprint never defines which utterances count as siblings of one another.
The reading taken here is stated as a **choice, not a theorem**: for an
[articulating](../../../../../../../../../articulating.md) recursion `a`, its siblings
are `a.utterances` — the flat list obtained by walking the `pair`/`utter` spine
and collecting every utterance carried along the way, in order. This is the
natural reading of a *linear* recursion, where each `pair` has one utterance
and one further articulating, no branching — but a different notion of
"sibling" (utterances at the same depth across distinct recursions, say, or an
equivalence closed under some articulating congruence) is not ruled out and is
not addressed here. `Articulating.head_mem_utterances` at least pins down one
guarantee: the head utterance a cell seeds from is always among the
recursion's own utterances, never smuggled in from outside.

## Completeness — nothing off-diagonal need be postulated

`PredicationCell.composeSeeds_surjective` is the completeness half of the
blueprint's promise: **every** predication cell, on- or off-diagonal, is
`composeSeeds u v` for *some* pair of utterances `u v`. Nothing off-diagonal is
ever postulated from nothing — it is always assembled by composing two seeds.
The witness is not unique: `composeSeeds_surjective` produces one pair, not a
bijection between cells and utterance-pairs.

`PredicationCell.cellsOf a` narrows this to a given recursion's own pool: the
list of every `composeSeeds u v` for `u`, `v` ranging over `a.utterances`.
`PredicationCell.seed_head_mem_cellsOf` shows the recursion always composes at
least its own reflexive seed — the diagonal seed at `a`'s head is always among
`cellsOf a` — and `PredicationCell.cellsOf_utter` computes the base case
exactly: a bare `utter u` has exactly one sibling (itself), so its only
composable cell is the diagonal seed.

## The composition asymmetry

Composition is not symmetric in its two seeds, and the module states this
plainly rather than smoothing it over:

* `PredicationCell.subjProj_composeSeeds` — subject-projection recovers `seed
  u` **exactly**, predicate included, because the composite's predicate
  already is `u`'s claim.
* `PredicationCell.objProj_composeSeeds` — object-projection does **not**, in
  general, recover `seed v`: it carries `v`'s token paired with `u`'s claim,
  not `v`'s. `objProj_composeSeeds_endpoints` records what it does share with
  `seed v` (both entity endpoints), and `objProj_composeSeeds_of_claim_eq`
  records the one condition — `u.claim = v.claim` — under which full recovery
  does hold.

## What remains open

Whether "sibling" should instead mean something structural — co-occurrence at
a fixed depth, or an equivalence closed under some articulating congruence —
is not decided here; only the linear reading is formalized. No claim is made
that a given cell has a *unique* composing pair, only that at least one always
exists.

## Orientation

Read [predication-cell](../../predication-cell.md) for the object these seeds
compose, and
[predication-cell-set](../predication-cell-set/predication-cell-set.md) for the
set $\Phi$ they range over. The four corners the composed cell can land in are
[potential](../potential-predication-cell/potential-predication-cell.md),
[active](../active-predication-cell/active-predication-cell.md),
[stable](../stable-predication-cell/stable-predication-cell.md), and
[absurd](../absurd-predication-cell/absurd-predication-cell.md). The morphism
that produced the predication category these cells inhabit is
[predicating](../../../../predicating.md).
