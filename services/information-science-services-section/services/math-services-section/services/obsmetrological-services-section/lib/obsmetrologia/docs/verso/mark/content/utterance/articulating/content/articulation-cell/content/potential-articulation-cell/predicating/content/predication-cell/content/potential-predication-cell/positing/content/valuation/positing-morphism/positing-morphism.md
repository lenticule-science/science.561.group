---
title: Positing Morphism
description: The mechanized morphism δ/posit that admits one charge into a valuation as a knowledge-join with a point mass. Abstaining, asserting, denying, and contesting are its four Belnap speech-act classes, named by which charge is posited. Posits are inflationary, merge by joining charges at a shared cell, commute unconditionally, and are idempotent; contesting is the knowledge-order's absorbing point.
date-created: 2026-08-05
date-modified: 2026-08-05
keywords: ["positing-morphism", "posit", "delta", "point-mass", "valuation", "charge", "belnap", "speech-act", "abstaining", "asserting", "denying", "contesting", "knowledge-join", "naturality"]
---

## What this node is

[Positing](../../../positing.md) has, until now, described its own action on a
[valuation](../valuation.md) only in prose: one posit at claim point $\varphi$
with charge $q$ moves a valuation $v$ to $v \vee_k \delta_{\varphi,q}$, where
$\delta_{\varphi,q}$ is the **point mass** — $q$ at $\varphi$, knowledge-bottom
$\bot_k$ everywhere else. This node is that morphism's first mechanization:
`Valuation.delta`, `Valuation.posit`, and the algebraic laws one posit — and
finite batches of posits — obey, in
`Obsmetrologia/Language/Positing/Morphism.lean`.

```lean
Valuation.delta (φ : Claim) (q : Charge) : Valuation :=
  fun ψ => if ψ = φ then q else Charge.kBot

Valuation.posit (φ : Claim) (q : Charge) (v : Valuation) : Valuation :=
  fun ψ => Charge.joinK (v ψ) (delta φ q ψ)
```

Everything is proved **pointwise** — `∀ ψ, … ψ = … ψ`, never `Valuation`
function equality — so no `funext` appears anywhere in the file. This is a
proof-shape fact worth naming, not a claim of extra strength: the laws below
hold at every claim point individually.

## Where this sits

This node is placed as a sibling of [necessitating](../necessitating/necessitating.md)
and [possibilizing](../possibilizing/possibilizing.md) rather than nested
further under [`valuation/content/`](../content), mirroring the precedent those
two already set: both are operations that act **on** a valuation
(`Valuation → Valuation`) rather than structural constituents nested inside one.
`posit` fits the same shape — `Claim → Charge → Valuation → Valuation` — and is,
if anything, the more primitive of the three: necessitating and possibilizing
raise or lower a whole valuation along the knowledge order by folding across
fiber-algebras, while posit is the single-cell act of injecting one piece of
evidence. It is the operation [positing](../../../positing.md) names in prose at
the level of the whole morphism; this node is where that prose becomes the
mechanized update every assertion, denial, and contestation reduces to.

## The algebra, all pointwise

* `Valuation.posit_kBot` — positing $\bot_k$ (**abstaining**) is the identity: it
  adds no knowledge anywhere.
* `Valuation.posit_inflationary` — a posit never retracts knowledge already
  held: $v(\psi) \le_k \mathrm{posit}(\varphi, q, v)(\psi)$.
* `Valuation.posit_posit_same` — two posits **at the same cell** merge by
  joining their charges: $\mathrm{posit}(\varphi, q_2, \mathrm{posit}(\varphi,
  q_1, v)) = \mathrm{posit}(\varphi, q_1 \vee_k q_2, v)$, pointwise. The second
  posit's data folds into the first's rather than overwriting it.
* `Valuation.posit_comm` — two posits **commute**, unconditionally. This is
  pure $\vee_k$ associativity/commutativity on `Charge`; the two posited cells
  need not be distinct, or even related, for it to hold.
* `Valuation.posit_monotone` — posit at a fixed $(\varphi, q)$ preserves the
  pointwise $\le_k$ order on valuations.
* `Valuation.posit_idem` — positing the same charge at the same cell twice is
  the same as positing it once, from `posit_posit_same` and `Charge.joinK_idem`.

## The four Belnap speech-act classes

Named under the evidence reading (authoritative, ruled 2026-08-05; see
`docs/history/corner-naming-convention.md`): $\bot_k$ = absurd = told none,
$t$ = potential = told true, $f$ = active = told false, $\top_k$ = stable =
told both.

| Speech act | Lean name | Charge posited | Corner reached |
| --- | --- | --- | --- |
| Abstaining | `Valuation.abstaining` | `Charge.kBot` | absurd, told none |
| Asserting | `Valuation.asserting` | `Charge.tTop` | potential, told true |
| Denying | `Valuation.denying` | `Charge.tBot` | active, told false |
| Contesting | `Valuation.contesting` | `Charge.kTop` | stable, told both |

`Valuation.contest_absorbs` records the one absorption law the algebra above
supports: once $\varphi$ has been contested, any further posit *at $\varphi$*
leaves it at $\top_k$ — contesting is the $\le_k$-absorbing point no further
posit can move. This is stated only at $\psi = \varphi$: off that cell,
`contesting φ v` leaves `v` untouched, so no cell-free version of the law holds
and none is claimed.

## Naturality

`Valuation.posit_converse_natural` shows `posit` is natural under
reindexing along the converse generator: reindexing a posited valuation by
`Claim.converse` is the same as positing at the converse cell into the
reindexed valuation, via `Claim.converse_eq_iff` (`converse` is an involution).

`Obsmetrologia/Language/Positing/MorphismNaturality.lean` works out, for each
of the predication category's other three generators, exactly which strength
of naturality claim actually holds, rather than assuming all three get the
same one:

* **`specialize f`, `f` injective** — full pointwise naturality
  (`Valuation.posit_reindex_natural_of_specialize_injective`), because the
  proof only ever needs the cancellation direction of `f`, not an inverse.
* **`subjProj` / `objProj`** — the single-posit naturality form **fails in
  general**, and `Valuation.posit_reindex_subjProj_not_natural` proves the
  failure rather than asserting it: two cells sharing a subject and predicate
  but differing in object collapse to the same `subjProj` image, so no single
  reindexed cell can match both. What *is* true, and proved, is the
  **diagonal fixed-point case**: restricted to query points already on the
  diagonal ($\chi.\mathrm{subject} = \chi.\mathrm{object}$), `subjProj` (resp.
  `objProj`) is the identity there, so naturality holds for every posited cell
  at those points (`Valuation.posit_reindex_subjProj_diagonal`,
  `Valuation.posit_reindex_objProj_diagonal`).

## What remains open

The closure companion of this evidence-injection step — how a *sequence* of
posits settles to a fixed point under the modal closure — is
[settling](../content/knowledge-least-valuation/settling/settling.md) territory
and is not addressed here. What this node's algebra supplies toward that: the
finite-**batch** order-independence fact, that any finite list of posits
collapses to the same result regardless of the order it is applied in, is
carried out separately at [batch positing](content/batch-positing/batch-positing.md)
— the induction this node's own source states it leaves undone.

## Orientation

The domain and codomain are the [valuation](../valuation.md) itself; the two
sibling operations are [necessitating](../necessitating/necessitating.md) and
[possibilizing](../possibilizing/possibilizing.md). Read
[charge](../../pre-bilattice/content/bilattice/content/charge/charge.md) for the
four values posited, and [batch positing](content/batch-positing/batch-positing.md)
for the finite-list extension. The morphism this mechanizes is
[positing](../../../positing.md) itself.
