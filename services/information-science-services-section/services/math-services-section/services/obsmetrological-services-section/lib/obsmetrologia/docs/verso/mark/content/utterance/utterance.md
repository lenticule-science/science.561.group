---
title: Utterance
description: The pair of a token and a claim, each a typed hand carrying one mark — Obsmetrologia.Utterance, articulating's domain and the theory's sole admission boundary. Not itself an act of articulation but the structured pair the act is applied to. Its two-sidedness gives articulating's codomain its four-cell partition; primitive utterances bottom out the articulating recursion in finite leaves.
date-created: 2026-06-19
date-modified: 2026-09-21
keywords: ["utterance", "token", "claim", "mark", "articulating", "carrier", "pair", "domain", "admission-boundary", "four-cell-partition", "inductive-base"]
---

## What this node is

An **utterance** is the ordered pair of one [token](../token/token.md) and one
[claim](../claim/claim.md) — the two **typed hands**, each carrying one
[mark](../../mark.md). It is the **domain** of
[articulating](articulating/articulating.md): the structured carrier the
articulating act is applied to, and is the **sole admission boundary of the theory**: the one
place a mark is let in, and it is let in on a hand. Token first, claim
second; the ordering is load-bearing.

## Hands are types

The hands are **types**, not positions read off a bare pair of marks
afterward. `Obsmetrologia.Token` and `Obsmetrologia.Claim` are each their own
one-field carrier of a [mark](../../mark.md), so "which hand a mark sits on"
is carried by the mark's own type from the moment it is let in.
`Obsmetrologia.Utterance` is the ordered pair of one `Token` and one `Claim`.
This corrects an earlier drift in which the two hands had been flattened to
two same-typed mark fields, the hand recovered only from position — the
drift the theory's own kernel references (the proof-tree schemas naming a
token "a mark carried on the left hand", the reference implementation's
`Token {hand: left, mark}` / `Claim {hand: right, mark}`) already called for
correcting.

## A carrier, not an act

An utterance **does not articulate anything**; it is the structured pair that
articulating takes as input. The two-sidedness — token on one hand, claim on
the other — is precisely what gives articulating's codomain its **four-cell
partition**: for each hand, a **slot** of witnesses that hand's articulating
has deposited — present or empty. Without the pair structure articulating
would have only one witness slot to track, and the four cells the system
relies on downstream would collapse to two.

## Position in the chain

The chain runs: **utterance**, then **articulating**, which takes an
utterance and produces a
[cell](articulating/content/articulation-cell/articulation-cell.md) carrying,
on each hand, the witnesses that hand has been articulated by; then the four
cells that partition articulating's outputs by which hand carries a witness.
The utterance sits at the **bottom** of this chain — it is the structure
articulating presupposes, not one articulating constructs.

## Primitive utterance bottoms out the recursion

Articulating is, recursively, the pair `[utterance, articulating]`: the first
slot the utterance being articulated, the second another articulating. The
recursion has no schema-level terminator. Concrete instances terminate only
when an innermost utterance is reached whose token and claim carry primitive
marks — at which point the recursion bottoms out at the mark-typed leaves and
the whole nested structure becomes finite. This is the proof-engine character
of the potential tree: the recursive type has no finite inhabitant unless the
recursion is grounded in primitives, and the mark each hand carries, at the
utterance's own two hands, is exactly that grounding.

## Token-before-claim, settled by construction

The pair lists token first, claim second, and the ordering is load-bearing
for reading the cell partition — no longer as a working theory among
alternatives, but as what the one articulating operation does. To
**articulate** an utterance is to place its own token as a witness on the
token side and leave the claim side free: the resulting cell is always
**potential** (told true), never the un-articulated position and never the
corner where a claim is witnessed ahead of its token. **Engaging** then puts
a witness on the claim side, reaching **stable** (told both). The
un-articulated position, **absurd** (both hands' slots empty), is not
articulating's output at all — it is where a cell *would* sit before any
articulation reaches it, reached only by the knowledge meet of incompatible
tellings downstream. The fourth corner, **active** (claim witnessed, token
not), is likewise never articulating's own output; it is reached only by the
value algebra (negation, converse), never by claiming ahead of a token.
(Corner names follow the evidence reading, ruled 2026-08-05 — see
`docs/history/corner-naming-convention.md`.)

## Orientation

Read [token](../token/token.md) and [claim](../claim/claim.md) for the two
typed hands of the pair, and [mark](../../mark.md) for the primitive both
hands carry. The morphism whose domain this is, is
[articulating](articulating/articulating.md).

## Earlier material

An **utterance** is the ordered pair of one [token](../token/token.md) and one
[claim](../claim/claim.md) — the two kinds of [mark](../../mark.md). It is the
**domain** of [articulating](articulating/articulating.md): the structured
carrier the articulating act is applied to. Token first, claim second.

An utterance **does not articulate anything**; it is the structured pair that
articulating takes as input. The two-sidedness — token on one side, claim on the
other — is precisely what gives articulating's codomain its **four-cell
partition**: token articulated, claim articulated, both, or neither. Without the
pair structure articulating would have only two articulation-statuses to track,
and the four cells the system relies on downstream would collapse to two.

The chain runs: **utterance**, then **articulating** which takes an utterance and
produces a charged, articulated form, then the four cells that partition
articulating's outputs by which side of the input got articulated. The utterance
sits at the **bottom** of this chain — it is the structure articulating
presupposes, not one articulating constructs.

Articulating is, recursively, the pair `[utterance, articulating]`: the first
slot the utterance being articulated, the second another articulating. The
recursion has no schema-level terminator. Concrete instances terminate only when
an innermost utterance is reached whose token and claim are the non-assembling
primitives — at which point the recursion bottoms out at the string-typed leaves
and the whole nested structure becomes finite. This is the proof-engine character
of the active tree: the recursive type has no finite inhabitant unless the
recursion is grounded in primitives, and the two non-assembling marks, token and
claim, are exactly that grounding.

The schema lists token first, claim second, and the ordering is load-bearing for
reading the cell partition. Under the *token-before-claim* working theory,
articulating naturally proceeds by articulating the token side first: the cells
potential (no, no) → active (yes, no) → absurd (yes, yes) are the natural
progression, and stable (no, yes) is off that path. The reversed claim-before-
token reading and a symmetric reading are live alternatives; which is right is
open work.

Read [token](../token/token.md) and [claim](../claim/claim.md) for the two
elements of the pair, and [mark](../../mark.md) for the genus they are kinds
of. The morphism whose domain this is, is
[articulating](articulating/articulating.md).
