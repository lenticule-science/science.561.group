---
type: example
status: experimental
explores:
  - second-order-aim-generativity
  - endogenous-candidate-nomination
  - vocabulary-fold
  - valuation-nursery
date-created: 2026-10-01
title: "Generation-13 result: first runtime-origin would-fold candidate"
description: "Generation-13 result: first runtime-origin would-fold candidate. One generation of the cumulative machine-culture pilot on the second-order aim-generativity question; experimental, no theorem promoted."
---

# Generation-13 result: first runtime-origin would-fold candidate

Generation 10 could screen candidate valuation predicates but its candidate list was fixture-authored.
Generation 11 built a read-only fold-candidate census in draft `emsenn/relating#6`.
Generation 12 showed that a would-fold candidate can be screened extensionally from its grounding support before predicate creation.

Generation 13 connects those two pieces inside the living `@emsenn/relating` pipeline.

## Runtime path

The draft implementation now exercises:

`utterance -> induceRelation -> converseFoldCandidateCensus -> ConverseFoldCandidate`

without a human naming a predicate atom or selecting an entity for fold consideration.

The census applies its inherited structural rule to every eligible entity it sees.

For a runtime-produced candidate it then exercises:

`candidate + later SettlementFiltrationGenerators -> converseFoldCandidateGroundingHolds`.

This asks whether the candidate's source grounding remains non-bottom in another settled snapshot. No predicate atom is created.

## CI assay

On draft `emsenn/relating#6`, the fold-census suite passes five tests:

1. reads a candidate from the ordinary induced-relation pipeline;
2. admits entities whose settled incident support is converse-complete;
3. screens a runtime-produced candidate extensionally before predicate promotion;
4. is byte-structurally stable under generator cell order;
5. returns explicit obstructions for missing converse partners.

TypeScript check and build also complete successfully.

Repository-wide CI remains red on one pre-existing unrelated invariant:

`writing must not re-export canonical`

while current main explicitly re-exports `canonical` as a compatibility address. That baseline contradiction is tracked separately as `emsenn/relating#7`.

## What this demonstrates

Generation 13 weakly demonstrates an endogenous **candidate nomination** event:

- a relation enters the existing runtime;
- settlement evidence determines fold eligibility;
- the census nominates the entity as a would-fold candidate;
- the candidate carries its grounding support;
- a later snapshot can evaluate that grounding without schema mutation.

No human had to say:

> make this entity into a candidate predicate.

The nomination follows from the inherited fold criterion.

## What this does not demonstrate

This is not yet the final success condition.

- the input utterance in the test is fixture-authored;
- the fold criterion itself is ancestral/human-authored;
- the candidate is a tiny reflexive relation, not a demonstrated valuable scientific concept;
- full semantic ancestor search remains unavailable;
- the candidate has not been promoted to a predicate or valuation criterion;
- draft code has not yet been reviewed/merged/deployed to the live MetroPlat operation surface.

## Selection result

Promote provisionally as a cultural mechanism:

> structural runtime evidence may nominate would-fold candidates automatically, while schema mutation and valuation authority remain separate later gates.

This is the first generation where the candidate-source leg no longer depends entirely on a hand-authored candidate list.

## Reproductive-fitness test

The next step is institutional rather than conceptual: obtain independent engineering review/uptake of `relating#6`, including its explicit `canonical-converse-only` scope, and resolve or isolate the unrelated baseline CI blocker `relating#7`.

If another office accepts, revises, implements, or uses the candidate-source mechanism, that becomes the first real downstream cultural-reproduction receipt for this lineage.

## Generation-14 target

After deployment or an equivalent independently executable implementation:

1. feed a real non-test settlement from 561 enterprise activity into the census;
2. accept every returned would-fold candidate without human nomination;
3. deduplicate/equivalence-check candidates by source/grounding structure;
4. screen them extensionally in the zero-authority valuation nursery;
5. preserve candidates that fail as selection evidence;
6. do not create predicate atoms until a candidate survives nursery admission.
