---
type: definition
class: substrate-entity
realizes: [runtime]
depends-on: [runtime, settlement-determinism, conformance-test-suite]
see-also: [function-record]
---

# Runtime record

A **runtime record** is the substrate-entity formal definition of a [runtime](teaching/explanations/runtime.md): the predication-graph entity declaring an execution environment's evaluation strategy, effect system, and concurrency model.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary.
- **`evaluation-strategy`** — `eager`, `lazy`, `normal-order`, `hybrid-spec`.
- **`effect-system`** — reference to the effect-system specification.
- **`concurrency-model`** — `single-threaded`, `cooperative-async`, `preemptive-multi-threaded`, `actor-based`, `csp-channels`.
- **`memory-model`** — `refcount`, `tracing-gc`, `region-based`, `none-static`.
- **`ffi-spec`** — foreign function interface declarations.
- **`capability-environment-discipline`** — how capabilities are tracked: `lexical-passing-only` (per [capability-passing](teaching/explanations/capability-passing.md)), `ambient-with-restrictions`, `effect-typed`.
- **`conformance-suite`** — reference to a [conformance-test-suite](../../../objects/conformance-test-suite.md) verifying runtime properties.
- **`closure-kind`** — `runtime`.

## Invariants

- **Conformance-testable.** Per [conformance-implies-substrate-properties](../../../theorems/conformance-implies-substrate-properties.md), the runtime must pass its declared conformance suite to be admissible.
- **Determinism-consistent.** A runtime declared deterministic must satisfy [settlement-determinism](../../../theorems/settlement-determinism.md) on its evaluations.

## Position in the platform

Runtime records are the substrate's *execution-environment registry*. Multiple runtimes may coexist on a substrate (each with different strategies for different use cases); functions declare which runtime they require.
