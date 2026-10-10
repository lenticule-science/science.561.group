---
type: example
status: experimental
explores:
  - second-order-aim-generativity
  - predicate-conservation
  - measurement
  - dynamic-predicate-category
date-created: 2026-10-01
title: "Generation-8 pilot: predicate conservation from selection to measurement"
description: "Generation-8 pilot: predicate conservation from selection to measurement. One generation of the cumulative machine-culture pilot on the second-order aim-generativity question; experimental, no theorem promoted."
---

# Generation-8 pilot: predicate conservation from selection to measurement

Generation 7 established that a PredWork Observation need not necessarily store a new observable field. Its measured predicate can be derived from the existing path:

Observation --method--> metric/method --measures--> predicate.

Generation 8 tests the next step: whether the same predicate identity can survive from a Gamma-selection criterion into a missing-information Finding and then into instrument discovery without semantic relabeling.

## Fixture and checker

Machine-readable fixture:

`examples/fixtures/second-order-aim-generativity-generation-8-predicate-conservation.json`

Deterministic checker:

`examples/second-order-aim-generativity-generation-8-predicate-conservation.mjs`

The fixture uses the selection predicate:

`predicate:witnessed-boundary-invocation-count`

for candidate `candidate:temporal-frontier-fixture`.

The selection criterion carries that predicate directly. Its current value is `bottom`, so the criterion is not evaluable from present evidence.

The generated Finding references the selection criterion as its expected criterion and marks its cause as `missing-information`. No new predicate name is introduced by the Finding.

Instrument discovery extracts the predicate from the referenced selection criterion and searches available method entities for:

`method measures predicate:witnessed-boundary-invocation-count`.

## Three deterministic cases

### Unique

Available methods:

- invocation-count measures witnessed-boundary-invocation-count;
- failure-count measures witnessed-boundary-failure-count.

Result: exactly one match, invocation-count.

Verdict: **unique**.

### Unserved

Only failure-count is available.

Result: zero matches.

Verdict: **unserved evidence frontier**.

No nearest-neighbour or prose substitution is attempted.

### Ambiguous

Two different methods both declare that they measure witnessed-boundary-invocation-count.

Result: both survive.

Verdict: **ambiguous**.

The matching stage does not choose among them. Calibration, authority, cost, completeness, or another independently admitted criterion must decide later.

## Predicate conservation assertion

The experiment checks that the same predicate identity appears at every semantic stage:

1. selection criterion predicate;
2. Finding.expected -> selection criterion predicate;
3. matched method's `measures` target;
4. resulting Observation's derived measured predicate via its method.

No intermediate stage invents a synonym, natural-language description, or replacement predicate.

The deterministic checker passed all three scenarios and the conservation assertion.

## Positive carrier control

The existing `SettlementFiltration -> SettlingClassification` measurement remains the stronger exact-carrier case and requires no `measures` traversal.

This gives two compatible evidence-discovery modes:

1. exact semantic carrier composition where the observable already has a carrier;
2. predicate-conserved metric discovery where Observation semantics are carried by `method -> measures -> p`.

## Ancestor correction

The next apparent frontier -- inventing new predicates -- is already explicit current ancestry.

`predication-categories/questions/dynamic-predicate-categories-emerging-vocabularies.md` asks how predicate categories evolve through time, including:

- predicate-creation closure-rule firings;
- inductive logic programming with predicate invention;
- ontology learning;
- emergent communication vocabularies in agent populations;
- convergence of evolving predicate categories.

Therefore this lineage does not claim predicate invention as a new problem.

Recent public work strengthens the relevance of that ancestor: 2026 multi-agent language-evolution experiments report compositional emergent vocabularies and cultural transmission among LLM agents, while current ILP work continues to treat predicate invention/renaming as a first-class symbolic-learning problem.

## The narrower remaining problem: valuation-predicate promotion

Not every invented predicate should become consequential for agenda selection.

There is a difference between:

- adding predicate p to the institution's vocabulary;
- having methods that can measure p;
- promoting p into the valuation discipline V used to decide which questions, programs, or institutions deserve attention.

That final move is normative/institutional, not merely representational.

The estate already contains a cautionary adjacent theory: governance indicators do not merely describe institutions; once rankings and indicators become consequential, they govern by making particular differences matter.

Therefore a candidate new selection predicate should not enter V simply because it can be invented or measured.

## G8 selection result

**Promote provisionally:** predicate conservation as the normal path for evidence acquisition when the selection predicate already exists.

**Demote:** adding a new `observable` field to Observation, unless a later case shows `method -> measures` is insufficient.

**Do not claim as new:** predicate invention, dynamic vocabularies, emergent languages, or schema evolution.

**New bridge question:** how does a newly invented/measurable predicate become an admitted valuation predicate in V without Goodhart-style metric capture or silent mission drift?

## Generation-9 target

Generation 9 should connect second-order aim-generativity to the existing dynamic-predicate-category program at one precise seam:

`predicate invention -> valuation-predicate candidate -> bounded use in selection -> promotion/rejection receipt`.

The first experiment should not invent a brand-new predicate from prose. It should take a candidate predicate produced by an existing predicate-invention mechanism or a controlled fixture, then compare:

1. vocabulary-only admission: p exists but has no selection consequence;
2. experimental valuation admission: p may influence ranking inside a bounded nursery;
3. promoted valuation predicate: only after evidence that using p improves information gain/reachability without violating hard core C.

Selection must separately measure predictive/discriminating usefulness, manipulation susceptibility, redundancy with existing criteria, cost of measurement, and effect on lineage diversity.

The critical safety invariant is:

`predicate existence != predicate authority`.

A culture may invent language freely inside its research nursery; making a predicate govern attention or resources is a distinct institutional act requiring evidence and authority.
