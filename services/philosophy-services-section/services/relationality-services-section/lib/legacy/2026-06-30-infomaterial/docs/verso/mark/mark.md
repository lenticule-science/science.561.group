---
title: Mark
description: The arbitrary atomic primitive — the genus of which token and claim are the two kinds. A mark has no internal structure and is built from nothing; it is the unit that the carriers of an utterance carry. Its string presentation on disk is surface form, not identity.
date-created: 2026-06-19
date-modified: 2026-06-19
keywords: ["mark", "primitive", "atomic", "token", "claim", "utterance", "articulating", "non-assembling", "inductive-base"]
---


## What this node is

A **mark** is the arbitrary atomic primitive of the system — the genus of which
[token](content/token/token.md) and [claim](content/claim/claim.md) are the two kinds. A
mark has **no internal structure** and is assembled from nothing; it is where
decomposition stops. An [utterance](content/utterance/utterance.md) pairs two
carriers of marks, and [articulating](content/utterance/articulating/articulating.md) is the
morphism applied to that pair. The mark is what is carried; the token and the
claim are the two ways of carrying it.

"Arbitrary" is exact: nothing about a mark is forced except that it stands as one
atom distinct from another. It carries no polarity, no value, no relation — those
all enter later, downstream of articulating. The mark is the barest possible
unit, the thing that simply *is one* so that something can later be said with it.

## Why it is primitive

A mark is **non-assembling**: there is no construction `mark = f(…)` that builds
it from smaller pieces. This is what makes marks the **inductive base** of the
whole active tree. The recursive type articulating has no finite inhabitant in
the abstract; a concrete inhabitant exists only once the recursion bottoms out at
primitive marks. Marks are exactly that bottom — the floor that makes the proof
engine terminate on real, finite, on-disk leaves.

On disk a mark is presented as a **string**, because strings are the system's
chosen finite surface form for primitives. The string is presentation, **not
identity**: two marks with the same string body may carry different categorical
roles, and what makes two marks the same is sameness of role in the articulating
recursion, not matching bytes.

## The two kinds of mark

A mark appears in an utterance as one of two carriers, dual to each other:

- a [token](content/token/token.md) — the atomic **identity-carrying** side;
- a [claim](content/claim/claim.md) — the atomic **content-carrying** side.

The cardinality *two* is not incidental. Two kinds give the utterance its pair
structure, and the pair gives articulating's codomain its four-cell partition
(token articulated, claim articulated, both, neither). One kind would collapse
the four cells to two; three kinds would oversaturate to eight, for which the
system has no derivation. The marks are two because the structure downstream of
articulating needs exactly four cells.

## Orientation

Read [token](content/token/token.md) and [claim](content/claim/claim.md) for the two kinds,
and [utterance](content/utterance/utterance.md) for the carrier that pairs them. The
morphism that acts on the pair is [articulating](content/utterance/articulating/articulating.md).
Alternate or superseded notes about the mark primitive are held in
[`_archive/`](_archive).
