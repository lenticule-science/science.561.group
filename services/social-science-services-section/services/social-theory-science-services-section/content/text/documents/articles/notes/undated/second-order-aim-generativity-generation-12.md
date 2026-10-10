---
type: example
status: experimental
explores:
  - second-order-aim-generativity
  - vocabulary-fold
  - valuation-nursery
  - extensional-screening
date-created: 2026-10-01
title: "Generation-12 pilot: screen a would-fold candidate before predicate creation"
description: "Generation-12 pilot: screen a would-fold candidate before predicate creation. One generation of the cumulative machine-culture pilot on the second-order aim-generativity question; experimental, no theorem promoted."
---

# Generation-12 pilot: screen a would-fold candidate before predicate creation

Generation 10 established a zero-authority valuation nursery.
Generation 11 produced a living draft implementation of a read-only fold-candidate census in `emsenn/relating#6`.

Generation 12 asks whether nursery screening requires the candidate predicate atom to exist.

## Ancestor law

`vocabulary-fold-as-predicate-atom-promotion` states that a promoted predicate atom p_e is grounded in the already-settled fiber of source entity e. The new predicate is a shorter primitive for the joint configuration the old cells already encoded.

Therefore, before promotion, the candidate's extension can be evaluated directly by its grounding configuration.

## Would-fold proposal

A pre-promotion candidate needs only:

- source entity identity;
- settled grounding support;
- partner-completeness receipt / limitation;
- grounding-rule obligation;
- ancestry/equivalence evidence.

It does not need a human-readable predicate name and it does not need to edit the predicate category.

## Fixture

`examples/fixtures/second-order-aim-generativity-generation-12-would-fold.json`

with checker:

`examples/second-order-aim-generativity-generation-12-would-fold.mjs`.

The fixture defines one would-fold proposal grounded by the conjunction:

- cell:a|supports|b
- cell:b|supports|a

and compares two replay valuations:

1. direct evaluation of the pre-promotion grounding conjunction;
2. the hypothetical truth-value of p_e after a semantics-preserving fold.

Across four replay snapshots the values are:

`[true, false, true, false]`

for both representations.

Verdict: **extensionally equivalent in the fixture**.

## Consequence

A candidate may enter the zero-authority valuation nursery as a `would-fold` proposal before schema mutation.

The provisional lifecycle becomes:

`settled pattern -> fold-candidate census -> would-fold proposal -> zero-authority replay -> predicate-atom promotion only if warranted -> possible valuation promotion later`.

This removes two avoidable sources of semantic drift:

- naming a predicate before it has earned use;
- adding schema merely to test whether the new feature is useful.

## Identity and deduplication

The current relating runtime already exposes canonical predication cell signatures (`signatureOfCell`, `cellSignatureKey`). Generation 11's census branch was tightened to sort support and missing-converse obligations explicitly by these keys and to test byte-structural stability under reversed input cell order.

The would-fold proposal should preserve source entity identity and separately carry a canonical grounding-support fingerprint. Two source entities may have extensionally equal support; that should surface as possible redundancy rather than being silently given different semantic names.

Generation 12 does not yet settle the canonical identity of a future p_e. No predicate identity should be fabricated merely for nursery screening.

## Selection result

Provisionally retain:

> extensional pre-promotion screening of grounded fold candidates.

Do not promote:

- automatic predicate creation;
- automatic valuation authority;
- human-readable naming of p_e;
- equivalence claims beyond the grounding rule actually tested.

## Remaining implementation gap

`relating#6` and this theory fixture are not yet wired together.

The living census is currently limited to canonical converse partner-completeness; the full theory allows additional declared symmetric partner relations.

Draft PR `relating#6` typechecks/builds and its fold-census tests pass, but repository-wide CI remains red on an unrelated pre-existing writing/canonical ownership contradiction tracked as `relating#7`.

## Generation-13 target

After the read-only census implementation is accepted or otherwise executable from the live surface, bind its actual candidate output into a would-fold nursery input without hand-authoring the candidate support.

Success requires:

1. candidate support originates from runtime settlement evidence;
2. nursery receives it without adding a predicate atom;
3. historical/replay evaluation uses only its grounding obligation;
4. redundancy/equivalence is checked against existing vocabulary;
5. no valuation authority is granted by fold eligibility alone.
