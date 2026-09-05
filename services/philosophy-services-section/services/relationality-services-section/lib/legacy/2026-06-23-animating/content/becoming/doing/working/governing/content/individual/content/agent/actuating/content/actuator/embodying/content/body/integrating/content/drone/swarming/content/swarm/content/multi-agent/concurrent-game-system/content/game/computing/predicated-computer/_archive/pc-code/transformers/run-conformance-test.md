---
type: morphism
class: verification-operation
realizes: [conformance, property]
depends-on: [conformance-test-suite, property, witness, hash-discipline]
see-also: [conformance-implies-substrate-properties]
---

# Run conformance test

The substrate operation that executes a [conformance test suite](../objects/conformance-test-suite.md) against an implementation, producing a per-property satisfaction report and an overall conformance verdict.

## Signature

`run-conformance-test(test-suite-id, implementation-target) → conformance-report`

Inputs:

- **`test-suite-id`** — reference to the [conformance-test-suite](../objects/conformance-test-suite.md) to run.
- **`implementation-target`** — reference to the implementation being tested. Typically a [deployment-record](../objects/deployment-record.md) for a running deployment or a local implementation reference for in-process testing.

Outputs:

- **`conformance-report`** — a substrate-content record carrying per-property satisfaction results, a conformance verdict (`pass`, `partial`, `fail`), and diagnostic detail for any failures.

## Operational semantics

Run-conformance-test proceeds in five steps:

1. Resolve the test-suite-id to its property list, test inputs, and reference results.
2. For each property, exercise the property's test inputs against the implementation. Capture the implementation's outputs.
3. Apply each property's satisfaction predicate to the captured outputs. Record per-input satisfaction (pass / fail).
4. When `reference-results` are present, byte-compare the implementation's outputs against the reference. Note any divergence.
5. Aggregate results into a conformance-report. Compute the overall verdict:
   - `pass`: all properties satisfied for all test inputs (and reference-results match if checked).
   - `partial`: some properties pass, some fail. Report includes which.
   - `fail`: at least one critical property fails (the suite's `coverage-claim` declares which properties are critical).

Per [witness](../objects/witness.md), the conformance run produces witnesses recording the operation. Per [signature-binds-witness-to-identity](../theorems/signature-binds-witness-to-identity.md), the conformance-report can be signed by the testing entity, producing a non-repudiable conformance attestation.

## Engineering invariants

- **Reproducible.** Per [settlement-determinism](../theorems/settlement-determinism.md), running the same suite against the same implementation in the same configuration produces the same report.
- **Property-isolating.** Each property's test is independent of others; a failing property does not affect other properties' results unless they share dependencies (in which case the dependency is itself a property).
- **Witness-emitting.** Every run produces a witness chain capturing the per-property satisfaction outcomes.
- **Read-discipline-respecting.** Per [cost-discipline-reads-free](../theorems/cost-discipline-reads-free.md), conformance tests against an implementation should typically be reads (querying behavior on inputs); when the test involves writing to the implementation (e.g., testing admission), the writes are explicit and the test isolates them from production data.

## Failure modes

- **Implementation unreachable.** The implementation-target is offline or unresponsive. The conformance run cannot complete; the report is `fail` with a specific diagnostic.
- **Test-input generation failure.** The property's test generator fails to produce valid inputs. Indicates a generator bug; the property is reported as test-failure rather than implementation-failure.
- **Spec-version mismatch.** The test suite's `spec-version` doesn't match the implementation's claimed spec version. Run produces a version-mismatch warning; results may include false-failures from spec drift.
- **Timeout.** A property's test exceeds the suite's `expected-runtime` significantly. The property is reported as timeout-failure; the implementation may be non-terminating on the input.

## Position in the substrate

Run-conformance-test is the operator that *evaluates* substrate-implementation conformance. Per [conformance-implies-substrate-properties](../theorems/conformance-implies-substrate-properties.md), passing a comprehensive conformance test suite is what entitles an implementation to the substrate's other guarantees (settlement-determinism, federation-convergence, snapshot-replay-fidelity).

The pattern composes with [conformance-test-suite](../objects/conformance-test-suite.md), [property](teaching/explanations/property.md), [witness](../objects/witness.md), [federation-handshake](theories/agential-orchestration-platform/morphisms/federation-handshake.md) (which may consult conformance reports), and [deployment-record](../objects/deployment-record.md) (the implementation being tested).
