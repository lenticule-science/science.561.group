---
title: Claim
description: A mark carried on the right hand — the content-carrying side of an utterance. Obsmetrologia.Claim, a one-field carrier of a Mark, distinct in type from Token: the hand is carried by the carrier's type, not recovered afterward from position. Together with token it grounds the articulating recursion in finite leaves.
date-created: 2026-06-19
date-modified: 2026-09-21
keywords: ["claim", "mark", "token", "utterance", "articulating", "hand", "carrier", "primitive", "inductive-base", "content-carrier"]
---

## What this node is

A **claim** is a [mark](../../mark.md) carried on the **right hand** — the
atomic **content-carrying** side of an [utterance](../utterance/utterance.md).
The other hand is the [token](../token/token.md). An utterance is the ordered
pair of one token and one claim, and that pair is the domain of
[articulating](../utterance/articulating/articulating.md). Where the token
holds *which one*, the claim holds *what is said*.

## Hands are types, not positions read off later

**The admission boundary is restored.** A claim is
not itself the non-assembling primitive; the mark is. `Obsmetrologia.Claim` is
a one-field carrier, `{ mark : Mark }`, dual to `Obsmetrologia.Token` on the
other hand. Token and claim are **distinct types**, so which hand a mark sits
on is carried by the mark's own type from the moment it is let in, not
recovered afterward by reading off a position in a bare pair of marks. This
corrects an earlier drift in the Lean, in which token and claim had been
flattened to two same-typed `Mark` fields and the hand carried no type of its
own.

The mark is still where decomposition stops (see [mark](../../mark.md) for
the primitive itself); the claim is one field of carrying, built from exactly
one mark and nothing else. Building a claim from a mark is not the same act
as building a mark from smaller pieces — there is no such act, for a mark.

## Claim is not its mark's string

A claim's identity does **not** reduce to the string its mark presents on
disk. The string is presentation; categorical identity is the role the claim
plays in the articulating recursion, carried one level down at the mark and
repeated, not altered, by the claim's own carrying.

## Position in the utterance

In `Obsmetrologia.Utterance`, the claim is the **second** field of the pair
(token first, claim second). The ordering is load-bearing for reading the
cell partition, and it is now settled by construction, not a working theory
among alternatives. To
[articulate](../utterance/articulating/content/articulation-cell/articulation-cell.md)
an utterance witnesses its token on the token side and leaves the claim side
free: the articulated cell is always **potential**, never the corner where a
claim is witnessed with no prior token. That corner — **active** — is never
articulating's own output; it is reached only downstream, by the value
algebra (meet under contradiction, negation, converse) — never by
articulating claiming ahead of its token.

## Claim versus token

Token and claim are **dual carrier types**, both built from exactly one mark,
distinguished by which hand they carry it on. The two-sidedness they give the
utterance is exactly what makes articulating's codomain a four-cell partition
(two witness slots, each present or empty) rather than two statuses. That the
hands are two, not one and not three, is forced by the four cells the system
needs downstream (see [token](../token/token.md) and [mark](../../mark.md)),
and is echoed in the orbital keystone
(`Obsmetrologia.Orbital.orbital_exhaustive`): from four entities on, a
predication pair admits exactly four natural reindexings, the four functions
of a two-element set to itself.

## Orientation

Read [token](../token/token.md) for the dual identity-carrying hand,
[mark](../../mark.md) for the primitive both hands carry, and
[utterance](../utterance/utterance.md) for the carrier that pairs them. The
morphism applied to the pair is
[articulating](../utterance/articulating/articulating.md).

## Earlier material

A **claim** is one of the two non-assembling kinds of [mark](../../mark.md) —
the atomic **content-carrying** side of an [utterance](../utterance/utterance.md).
The other kind is the [token](../token/token.md). An utterance is the ordered
pair of one token and one claim, and that pair is the domain of
[articulating](../utterance/articulating/articulating.md). Where the token holds *which
one*, the claim holds *what is said*.

A claim is **not built from anything**. The schema declares it a string because
the on-disk presentation must be finite, but the categorical content of a claim
has no further decomposition; nothing assembles a claim out of smaller pieces.
Claims are where the recursion of articulating bottoms out on the content side.
Together with the token, the claim provides the inductive base that lets the
recursive type articulating have concrete finite inhabitants — without these two
primitives the recursion would be uninhabited.

A claim's identity does **not** reduce to its string contents. The string is
presentation; categorical identity is the role the claim plays in the
articulating recursion. Any future need for claim-identity beyond string-equality
lives downstream of this primitive, not at it.

In the schema for the utterance, the claim is the **second** element of the pair
(token first, claim second). The ordering is load-bearing for the partition
reading: which primitive is "first" determines which cells lie on the natural
progression of articulating and which lie off it. Under the *token-before-claim*
working theory, articulating proceeds by articulating the token side first; the
stable cell at (no token, yes claim) is therefore **off** the natural path,
because the claim has been articulated without its expected prior token. Whether
token-before-claim is the right reading is open work; the reversed and symmetric
readings are alternatives.

Token and claim are **dual** non-assembling primitives — both string-typed on
disk, distinguished by position. The two-sidedness they give the utterance is
exactly what makes articulating's codomain a four-cell partition rather than two
statuses. That the marks are two, not one and not three, is forced by the four
cells the system needs downstream (see [token](../token/token.md) and
[mark](../../mark.md)).

Read [token](../token/token.md) for the dual identity-carrying kind,
[mark](../../mark.md) for the genus, and [utterance](../utterance/utterance.md)
for the carrier that pairs them. The morphism applied to the pair is
[articulating](../utterance/articulating/articulating.md).
