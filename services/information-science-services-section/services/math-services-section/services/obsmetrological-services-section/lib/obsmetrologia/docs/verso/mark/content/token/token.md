---
title: Token
description: A mark carried on the left hand — the identity-carrying side of an utterance. Obsmetrologia.Token, a one-field carrier of a Mark, distinct in type from Claim: the hand is carried by the carrier's type, not recovered afterward from position. Together with claim it grounds the articulating recursion in finite leaves.
date-created: 2026-06-19
date-modified: 2026-09-21
keywords: ["token", "mark", "claim", "utterance", "articulating", "hand", "carrier", "primitive", "inductive-base", "identity-carrier"]
---

## What this node is

A **token** is a [mark](../../mark.md) carried on the **left hand** — the atomic
**identity-carrying** side of an [utterance](../utterance/utterance.md). The
other hand is the [claim](../claim/claim.md). An utterance is the ordered pair
of one token and one claim, and that pair is the domain of
[articulating](../utterance/articulating/articulating.md). The token holds
*which one*; the claim holds *what is said*.

## Hands are types, not positions read off later

**Owner ruling 2026-09-21, "the admission boundary, restored."** A token is
not itself the non-assembling primitive; the mark is. `Obsmetrologia.Token` is
a one-field carrier, `{ mark : Mark }`, and `Obsmetrologia.Claim` is the dual
carrier on the other hand. Token and claim are **distinct types**, so which
hand a mark sits on is carried by the mark's own type from the moment it is
let in, not recovered afterward by reading off a position in a bare pair of
marks. This corrects an earlier drift in the Lean, in which token and claim
had been flattened to two same-typed `Mark` fields and the hand carried no
type of its own — the reading the theory's own kernel references (the
proof-tree schemas, the reference implementation) call the seeding error's
sibling: hands demoted to positions.

The mark is still where decomposition stops (see [mark](../../mark.md) for
the primitive itself); the token is one field of carrying, built from exactly
one mark and nothing else. Building a token from a mark is not the same act
as building a mark from smaller pieces — there is no such act, for a mark.

## Token is not its mark's string

A token's identity does **not** reduce to the string its mark presents on
disk. Two tokens with the same string body, in different utterances, may
carry different categorical roles; what makes them the same token is
sameness of role in the articulating recursion, not matching bytes. The
string is presentation; identity is role, carried one level down at the mark
and repeated, not altered, by the token's own carrying.

## Token versus claim

Token and claim are **dual carrier types**, both built from exactly one mark,
distinguished by which hand they carry it on — token first (the domain's
first field), claim second. The ordering is load-bearing, and it is now
settled by construction rather than by working theory: to
[articulate](../utterance/articulating/content/articulation-cell/articulation-cell.md)
an utterance is to place its own token as a witness on the token side and
leave the claim side free — the articulated cell is always **potential**
(told true), never absurd, and always reached with the token side witnessed
first. The claim side being witnessed with no prior token witness — the
**active** corner — is never articulating's own output; it is reached only
downstream, by the value algebra (meet under contradiction, negation,
converse). Token-before-claim is not a live alternative among readings any
longer; it is what the one articulating operation does. (Corner names follow
the evidence reading, ruled 2026-08-05; see
`docs/history/corner-naming-convention.md`.)

## Why two hands, not one or three

A single carrier type would not give the utterance the pair structure it
needs to be articulating's domain: one hand collapses articulating's
four-cell codomain to two statuses (articulated or not) and loses the
cardinality the system relies on downstream. A third hand would
oversaturate — three independent witness slots give $2^3 = 8$ cells, and the
system has no derivation of an eight-cell partition. The cardinality **two**
is forced by the four cells the system needs, and it is now also the
generator count of the orbital keystone (`Obsmetrologia.Orbital.orbital_exhaustive`):
the four reindexings of an oriented pair, from four entities on, are exactly
the four functions of the two-hand set to itself.

## Orientation

Read [claim](../claim/claim.md) for the dual content-carrying hand,
[mark](../../mark.md) for the primitive both hands carry, and
[utterance](../utterance/utterance.md) for the carrier that pairs them. The
morphism applied to the pair is
[articulating](../utterance/articulating/articulating.md).

## Earlier material

A **token** is one of the two non-assembling kinds of [mark](../../mark.md) —
the atomic **identity-carrying** side of an [utterance](../utterance/utterance.md).
The other kind is the [claim](../claim/claim.md). An utterance is the ordered
pair of one token and one claim, and that pair is the domain of
[articulating](../utterance/articulating/articulating.md). The token holds *which one*;
the claim holds *what is said*.

A token is **not built from anything**. The on-disk schema declares it a string
only because strings are the system's finite surface form for primitives — the
string is presentation, not categorical content. Categorically a token is the
atomic identity-carrying side of an utterance with no further decomposition;
nothing assembles a token out of smaller pieces. Tokens are where the recursion
of articulating **bottoms out**.

This makes tokens (with claims) the inductive base for the proof-engine character
of the active tree. The recursive type articulating has no finite inhabitant in
the abstract; a concrete inhabitant exists once an innermost utterance's token
and claim are reached. The string-typed leaf is what makes the bottom finitely
representable on disk.

A token's identity does **not** reduce to its string contents. Two tokens with
the same string body, in different utterances, may carry different categorical
roles; what makes them the same token is sameness of role in the articulating
recursion, not matching bytes. The string is presentation; identity is role. Any
future need for token-identity beyond string-equality lives *downstream* of this
primitive, never at it.

Token and claim are **dual**: both non-assembling, both string-typed on disk,
distinguished by position — token first, claim second. The ordering is
load-bearing. Under the *token-before-claim* working theory of the cell
partition, articulating naturally proceeds by articulating the token side first
and the claim side only after; the cells potential (no, no) → active (yes, no) →
absurd (yes, yes) are the natural progression, and stable (no, yes) — a claim
articulated with no prior token — is *off* that path. Whether token-before-claim
is the right reading is open work; the symmetric and reversed readings are live
alternatives.

A single non-assembling primitive would not give the utterance the pair structure
it needs to be articulating's domain: one primitive collapses articulating's
four-cell codomain to two statuses (articulated or not) and loses the cardinality
the system relies on downstream. A third primitive would oversaturate — three
independent binary statuses give $2^3 = 8$ cells, and the system has no
derivation of an eight-cell partition. The cardinality **two** is forced by the
four cells the system needs.

Read [claim](../claim/claim.md) for the dual content-carrying kind,
[mark](../../mark.md) for the genus, and [utterance](../utterance/utterance.md)
for the carrier that pairs them. The morphism applied to the pair is
[articulating](../utterance/articulating/articulating.md).
