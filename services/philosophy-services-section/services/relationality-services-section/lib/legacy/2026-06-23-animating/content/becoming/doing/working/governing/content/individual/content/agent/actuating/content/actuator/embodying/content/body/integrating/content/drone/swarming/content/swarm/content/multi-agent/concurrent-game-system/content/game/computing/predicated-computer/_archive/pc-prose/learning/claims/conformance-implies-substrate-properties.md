---
type: theorem
class: engineering-claim
status: proved
depends-on: [conformance, conformance-test-suite, property, run-conformance-test, settlement-determinism, federation-convergence, snapshot-replay-fidelity]
see-also: [federation-handshake]
---

# Passing a comprehensive conformance test suite implies substrate properties

**Claim.** Let $\Sigma$ be a substrate specification and $T$ a [conformance test suite](../objects/conformance-test-suite.md) whose `properties` cover every theorem in $\Sigma$. Let $I$ be an implementation that passes $T$ via [run-conformance-test](../morphisms/run-conformance-test.md) (verdict = `pass`). Then $I$ satisfies every theorem in $\Sigma$ within the test suite's coverage.

In particular, an implementation passing a conformance suite covering [settlement-determinism](settlement-determinism.md), [federation-convergence](federation-convergence.md), [snapshot-replay-fidelity](snapshot-replay-fidelity.md), and [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md) is structurally entitled to those guarantees in deployment.

## Why this holds

The argument is a *correspondence* between properties and theorems. The theorems are the substrate's specification claims; the properties in the test suite are checkable assertions of those claims; passing the properties is the empirical evidence the assertions hold for the implementation.

**Part 1: Each theorem corresponds to one or more properties.** The substrate's specification is decomposed into theorems (per the corpus's [theorems/](.) directory). Each theorem has a precise statement that translates into one or more checkable properties:

- [settlement-determinism](settlement-determinism.md) → property "two runs with the same `(event-log, rule-system)` produce the same output hash."
- [federation-convergence](federation-convergence.md) → property "two substrates exchanging the same writes converge to the same state hash."
- [snapshot-replay-fidelity](snapshot-replay-fidelity.md) → property "snapshot-then-replay reproduces the snapshotted state hash."
- And so on for every theorem.

A conformance test suite covering a theorem includes properties that, if satisfied, attest the theorem holds for the implementation.

**Part 2: Passing the property is empirical evidence.** The property's test generator produces test inputs; the satisfaction predicate checks the implementation's outputs. A `pass` outcome on the property means the implementation produced expected outputs across the test-input distribution. This is empirical evidence (not mathematical proof) that the implementation satisfies the property.

**Part 3: Coverage is the limit on the inference.** The strength of the implication depends on the test suite's coverage. A property tested on a small input set provides weaker evidence than one tested exhaustively or with comprehensive randomized generation. The substrate's response: conformance test suites should declare their coverage (per [conformance-test-suite](../objects/conformance-test-suite.md)'s `coverage-claim`), and consumers of conformance reports interpret coverage when deciding whether to admit the implementation.

**Part 4: Reference-results give byte-identical conformance.** When the test suite includes `reference-results` (per [conformance-test-suite](../objects/conformance-test-suite.md)), passing requires byte-identical match against the reference. Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), byte-identical means cellwise-identical predication valuations; the implementation is *behavior-equivalent* to the reference on the tested inputs.

## Engineering consequence

The theorem is what makes conformance testing *operationally meaningful*. Several engineering uses follow:

- **Deployment gating.** A new implementation deployment can be gated on conformance: per [deploy-to-target](../morphisms/deploy-to-target.md), the substrate may require a passing conformance report against the spec version before admitting the deployment.
- **Federation gating.** Per [federation-handshake](theories/agential-orchestration-platform/morphisms/federation-handshake.md), federating substrates may exchange conformance reports. A federated peer that fails the conformance suite is rejected at handshake before any messages are exchanged.
- **Implementation choice transparency.** Multiple implementations of the substrate (different language runtimes, different optimization levels) can be compared by their conformance against the same reference suite. Consumers can choose implementations whose conformance reports match their deployment requirements.
- **Drift detection.** Periodic re-running of the conformance suite against an implementation detects drift — bugs introduced by upgrades, host-environment changes, or substrate-content corruption. The substrate's [backup-discipline](teaching/explanations/backup-discipline.md) explicitly requires periodic restore-test which is a form of conformance check.

## What the theorem does not claim

- The theorem does *not* claim that passing a conformance suite proves the implementation satisfies the theorems on inputs not in the test set. Empirical conformance testing has the standard limitation: untested inputs may exhibit non-conformance.
- The theorem does *not* claim that an implementation failing some properties is useless. Per [conformance](teaching/explanations/conformance.md), conformance is layered; an implementation may be conformant on the layers a deployment uses while non-conformant on layers it doesn't.
- The theorem does *not* extend to properties not in the test suite. An implementation passing the suite may still violate properties the suite doesn't cover; the substrate's response is to use suites whose coverage is appropriate for the deployment.

## What the theorem rules out

- An implementation deployed for federation without a federation-conformance check is admitted on faith. Per [federation-convergence](federation-convergence.md), non-convergent implementations break federation; the substrate's response is to require conformance before admission.
- A substrate that allows conformance reports without proper signature verification (per [signature-binds-witness-to-identity](signature-binds-witness-to-identity.md)) admits forged conformance claims. Conformance reports must be signed by the testing entity, and the signing entity's reputation is itself substrate content that auditors can inspect.

## What the theorem requires

- The substrate specification $\Sigma$ has a precise decomposition into theorems.
- Each theorem in $\Sigma$ is covered by one or more properties in the test suite.
- The test suite's properties have well-formed test generators and satisfaction predicates.
- The implementation's `run-conformance-test` invocation produces a verdict (per [run-conformance-test](../morphisms/run-conformance-test.md)).
- For byte-identical conformance, the test suite includes reference-results from a known-good implementation.
