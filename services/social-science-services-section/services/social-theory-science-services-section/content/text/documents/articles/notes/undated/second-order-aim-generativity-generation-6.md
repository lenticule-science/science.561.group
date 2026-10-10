---
type: example
status: experimental
explores:
  - second-order-aim-generativity
  - observation
  - finding
  - sensor
  - measurement
date-created: 2026-10-01
title: "Generation-6 pilot: typed evidence-obligation closure"
description: "Generation-6 pilot: typed evidence-obligation closure. One generation of the cumulative machine-culture pilot on the second-order aim-generativity question; experimental, no theorem promoted."
---

# Generation-6 pilot: typed evidence-obligation closure

This example continues Generation 5.

Generation 5 generated candidate Gamma-mutations by pairing a structured
selection residue with an already-present sensing capability. It still depended
on the experimenter to decide that, for example, operational relevance is
measured by invocation witnesses.

Generation 6 tests whether that matching can instead be expressed as a
type-compatibility problem.

## Existing theory used

No new generic Sensor ontology is introduced.

The current theory already contains:

- PredWork Observation, a tracking-stage entity with observed entity, method,
  value, baseline, timestamp, and Stevens measurement scale;
- PredWork Finding, a review-stage entity whose structured cause may explicitly
  contain missing-information;
- PredWork Adjustment, including double-loop adjustments that change predicate
  relationships;
- predicated-computing Sensor, whose six-tuple contains measurand space, output
  space, transfer function, operating range, error model, and downstream scope;
- predicated-astronomy ObservationCell, which explicitly indexes an observation
  by body, predicate, and observer-instrument.

These structures imply a measurement discipline richer than the generic
PredWork Observation currently records.

## Proposed test relation

Let a selection residue be realized as a Finding F whose cause contains
missing-information.

For type-driven acquisition, the residue needs to state a required observation
signature:

R_F = (X, p, sigma, E)

where:

- X is the entity or scope to observe;
- p is the observable or measured predicate;
- sigma is the measurement scale or another composition guard;
- E is the admitted semantic output carrier when one exists.

An instrument or tracking method S is eligible only if its declared
measurand/output contract can produce an Observation compatible with R_F.

The intended matching rule is structural:

produces(S) ~= needs(R_F)

or is connected by an explicit, witnessed translation.

A prose statement that two descriptions seem related is not sufficient.

## Positive control: a measurement whose semantic carrier already exists

@emsenn/relating has a true measurement action:

SettlementFiltration -> SettlingClassification.

The domain carrier is:

relating/articulating/predicating/positing/settling/filtration

and the codomain carrier is:

relating/articulating/predicating/positing/settling/classification.

The registered action is read-classification-of-settlement-filtration.

The action has both domain and codomain carriers and carries an RMN runTerm.
It therefore satisfies the package's own true-morphism gate.

If a Finding's missing-information cause says, in carrier terms,

classification of this SettlementFiltration is required,

then the current action registry can discover a lawful producer by exact carrier
identity. No language-model semantic matching and no generic sensor extension
are needed.

Positive-control result: pass.

The carrier/action substrate can already close some evidence frontiers exactly.

## Test case: witnessed boundary use

Generation 5 retained the candidate mutation M_use.

Its selection residue is:

temporal frontier evidence is present, but witnessed operational use of the
actions touching the frontier is unmeasured.

The niche contains real observation machinery:

- running/invocation.mts defines one scripted play with caller, verb, args,
  optional serialized morphism carrier, result, and time;
- invocationFeed turns each successful boundary play into one EAVT witness;
- the invocation-ledger service projects those witnesses;
- OTLP/RWIL chronicle carriers can carry the witnessed records.

But these do not yet give an exact semantic measurement arrow analogous to the
positive control.

### Obstruction A: generic Observation lacks an explicit observable

PredWork Observation currently records:

(observes X, method mu, value v, baseline b, scale sigma, observed-at t)

but not a separate cell naming which property of X the value measures.

Method names how the reading was obtained. It is not the observable itself.

This makes several different ratio-scale readings of the same action
indistinguishable at the signature level:

- invocation count;
- failure count;
- latency;
- token consumption;
- number of distinct callers.

The value and method can distinguish them after interpretation, but an unmet
evidence obligation cannot type-match them without already understanding those
semantics.

Predicated astronomy does not have this ambiguity because its ObservationCell
is explicitly indexed by the measured predicate.

### Obstruction B: invocation witnessing is not a semantic measurement action

Invocation is currently an interface/feed observation, not a registered
carrier.

EAVT and the AgentEventChronicle are legitimate representation/chronicle
carriers, but they represent witness material, not the semantic observable
witnessed boundary-use of action a during interval I.

There is currently no true action of the form:

InvocationWitnessSet -> BoundaryUseObservation

with a semantic codomain carrier suitable for exact evidence-obligation
matching.

Treating application/eavt+jsonl as that codomain would confuse channel with
meaning.

Witnessed-use test result: obstructed.

The failure is correct under the proposed discipline.

## Generated agenda

The failed type closure generated emsenn/561-theory#3,
Align PredWork Observation with Sensor measurand/output typing.

The question is whether generic PredWork Observation should explicitly carry
the measured predicate or observable, or reuse an equivalent relation already
present elsewhere in predication-categories.

A candidate signature is:

ObsSig(O) = (observed entity, observable, scale, output shape).

The actual Observation would continue to carry method, value, baseline,
timestamp, and provenance.

This is a theory-alignment question, not yet a proposed canonical field.

## Why Sensor is not copied into PredWork

The generic predicated-computing Sensor includes transfer function, operating
range, error model, and downstream scope because it models an actual measurement
boundary.

PredWork methods may also be:

- substrate queries;
- deterministic computations;
- human judgments;
- aggregations of existing observations.

Therefore Observation should not become a physical-sensor record.

The bridge sought here is only enough shared structure to state:

this method produces observations about observable p of entities in scope X,
with scale/output contract E.

Where the method is a Sensor, its calibration and error model remain attached to
the Sensor and provenance points back to it.

## Selection result

Generation 6 selects the typed evidence-frontier discipline provisionally, but
does not select a runtime implementation.

What survived:

1. selection residues should be Findings, not informal failure prose;
2. missing-information causes can define evidence obligations;
3. current carrier/action identities already provide a positive-control
   instrument-discovery mechanism;
4. generic Observation likely needs explicit observable/measurand identity for
   heterogeneous measurements to compose safely;
5. wire/ledger representation must remain distinct from semantic observable type.

What failed:

- the G5 witnessed-use mutation cannot yet be derived by exact type matching;
- old MeasurementFrame and MASH sensor vocabularies are unnecessary as new
  runtime dependencies;
- EAVT cannot stand in for the missing semantic measurement type.

## Human contribution remaining

Generation 6 still contains an authored move:

the experimenter proposed that a Finding's missing-information cause should
request an Observation signature.

That is, however, no longer an arbitrary cross-domain analogy.
It follows the existing PredWork operations loop:

Observation -> Finding -> Adjustment.

A Finding already consumes observations and may identify missing information.
The proposed extension asks whether that same Finding can carry the shape of the
observation whose absence prevents settlement.

## Next experiment

Generation 7 should not invent another meta-layer.

It should test the smallest theory change implied here:

1. give an experimental Observation an explicit observable/predicate identity;
2. give a missing-information Finding a required-observation signature;
3. expose at least two measurement methods with different observables but the
   same entity and scale;
4. verify that exact matching chooses the right method and rejects the wrong one;
5. verify the positive-control settlement-classification measurement still
   composes without special cases;
6. only then ask whether a Gamma mutation can be generated automatically from
   the unmatched evidence frontier.

If this cannot be made precise without embedding arbitrary semantic labels, the
typed-mutation route should be rejected rather than expanded.
