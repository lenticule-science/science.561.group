---
type: definition
class: substrate-entity
realizes: [conformance, property]
depends-on: [conformance, property, witness, hash-discipline, settlement-determinism]
see-also: [run-conformance-test]
---

# Conformance test suite

A **conformance test suite** is the substrate-entity formal definition of a *named, versioned collection of [properties](teaching/explanations/property.md) checking conformance to a substrate specification*. Test suites are how implementations are evaluated against the substrate's specification.

## Structural fields

- **`id`** — kebab-case identifier (typically the suite's purpose: `core-substrate-v1`, `federation-conformance`, `predication-categories-mathematical-properties`).
- **`description`** — one-line summary.
- **`spec-version`** — references to the substrate-specification version this suite checks against. The substrate's specification evolves; conformance test suites are pinned to specification versions.
- **`properties`** — references to the [property](teaching/explanations/property.md) records that the suite checks. Each property has a test generator and a satisfaction predicate.
- **`coverage-claim`** — a declared coverage statement: "all core admit/settle/project properties," "federation-convergence layer," "encryption-and-replay layer." Determines which substrate behaviors the suite verifies.
- **`expected-runtime`** — the suite's typical runtime on a reference implementation. Used to detect implementations that fail to terminate or whose performance is degenerate.
- **`reference-results`** — for a known-good implementation, the canonical-form hashes of expected outputs for each property's test inputs. Lets a new implementation's results be compared against the reference for byte-identical conformance.
- **`test-inputs`** — for property-based testing with deterministic inputs, the suite's enumeration of inputs. For randomized testing, the seed and generator parameters that reproduce a given run.
- **`closure-kind`** — `conformance-test-suite`.

## Invariants

- **Spec-version-pinned.** Each suite is pinned to a specific substrate-specification version. Running an older suite against a newer specification (or vice versa) may produce false-failures or miss new properties.
- **Property-coherent.** Every property in the suite is well-formed (test generator + satisfaction predicate + failure-mode profile).
- **Reproducible.** Given the same inputs (deterministic) or seeds (randomized), running the suite twice produces the same satisfaction outcomes. Per [settlement-determinism](../theorems/settlement-determinism.md), this holds across implementations that are themselves deterministic.
- **Reference-results-checkable.** When `reference-results` are present, an implementation's outputs can be byte-compared against the reference for the strongest conformance claim.

## Operations

- *Author.* A new conformance test suite is created by selecting properties from the substrate's specification, declaring coverage, generating test inputs, and (optionally) running a reference implementation to populate `reference-results`. Authoring is a substrate operation.
- *Run.* Per [run-conformance-test](../morphisms/run-conformance-test.md), the suite is executed against an implementation, producing per-property satisfaction results and an overall conformance verdict.
- *Version.* When the substrate's specification evolves, new properties are added or existing ones updated. A new suite version is published with `predecessor` linking to the prior version.
- *Compare.* Two implementations' conformance reports for the same suite can be compared cell-by-cell: which properties each satisfies, where they differ.
- *Federate.* Conformance test suites are federation-portable substrate content. A reference suite published by one substrate-instance can be received and run by federated peers, supporting cross-substrate conformance verification.

## Position in the substrate

Conformance test suites are the substrate's *implementation-evaluation registry*. Per [conformance](teaching/explanations/conformance.md), an implementation's fitness for federation, deployment, and use is determined by which suites it passes. Per [federation-handshake](theories/agential-orchestration-platform/morphisms/federation-handshake.md), federating substrates may exchange conformance proofs (passed-suite witnesses signed by the implementation) as part of the handshake; mismatched conformance flags are surfaced at admission time.

The pattern composes with [property](teaching/explanations/property.md), [run-conformance-test](../morphisms/run-conformance-test.md), [witness](witness.md) (the suite's run produces witnesses), and the substrate's [audit chain](teaching/explanations/substrate-as-stack-composition.md).
