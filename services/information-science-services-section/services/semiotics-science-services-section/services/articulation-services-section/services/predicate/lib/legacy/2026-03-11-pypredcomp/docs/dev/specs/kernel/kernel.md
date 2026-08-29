---
title: "Kernel"
description: "The substrate's instruction set: bilattice algebra, fibers, ISA, respond, closure-rule engine, runtime cycles. The OS's kernel."
kind: index
---

# Kernel

The substrate's primitive operations and runtime model.
This is the OS kernel — what every other subsystem assumes is correct.

## Specs

### Algebra and value model

- [canonicalization.md](canonicalization.md) — JSON byte form and SHA-256 hashing rules.
  Shared by every other spec.
- [computational-model.md](computational-model.md) — what "computing" means here; settlement principle; three computation levels.

### Primitive operations (ISA)

- [isa.md](isa.md) — the complete set of primitive operations on fibers and traces.
  Algebraic, adjoint, and temporal layers.
- [message-language.md](message-language.md) — the term calculus for closure-rule conclusions and structured messages.

### The substrate primitive

- [respond.md](respond.md) — `respond(target, payload, sender) → fiber`.
  Every substrate operation reduces to this.
- [closure-rule-record.md](closure-rule-record.md) — the canonical closure-rule entity format.
- [closure-engine-internals.md](closure-engine-internals.md) — the closure-rule firing algorithm.
- [stratified-facts.md](stratified-facts.md) — the asserted / saturated / settled stratum tag, retraction, federation merge, and witness chains.
- [sigma-delta-passes.md](sigma-delta-passes.md) — the σ-pass / Δ-pass split inside `respond` Phase 3.

### Audit and witnessing

- [repair-log.md](repair-log.md) — ordered settlement step log produced by every respond.
- [evidence-vector.md](evidence-vector.md) — replay-attestable hash sequence.

### Runtime

- [runtime-state.md](runtime-state.md) — `cold | initializing | ready | degraded | draining | stopped`.
- [runtime-cycles.md](runtime-cycles.md) — storage / respond / heartbeat / federation-sync / shutdown.

### Errors

- [error-codes.md](error-codes.md) — textual error code naming (`PCC_*`, `PCR_*`, `PCS_*`, etc.).

## Theory grounding

The kernel implements the substantive content of the [predicated-computing](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/README.md) parent theory and its [flatfile-agentic-resource-system](../../../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/README.md) substrate concretization.

Load-bearing references:

- `predicated-computing/concepts/closure-rule-system` — the closure-rule discipline.
- `predicated-computing/objects/witness` — the witness-chain Merkle structure.
- `flatfile-agentic-resource-system/concepts/four-layer-rule-architecture` — user/shape/governance/closure layers.
- `flatfile-agentic-resource-system/concepts/event-sourcing` — event log as source of truth.
- `flatfile-agentic-resource-system/morphisms/settle` — closure to fixed point.

## Conformance

The kernel passes:

1. The algebra round-trips byte-identically against the `mash-engine` test vectors.
2. A 50-rule fixture replays from event log to byte-identical fiber state.
3. Settlement converges within configured fuel for non-pathological inputs.
4. Determinism holds: same inputs + same state → byte-identical outputs.
5. The conformance-vector round-trip suite passes (round-trip, error propagation, fuel exhaustion, merge cases).

## Implementation note

Per [decisions/engine-language-rust.md](../../decisions/engine-language-rust.md), the kernel has two canonical implementations:

- **Python (v0.1 → v0.x).** Built on pydantic + LangGraph + asyncio.
  Pydantic models for `Fiber` and `CellRecord`; LangGraph StateGraph for closure-rule engine; asyncio for heartbeat.
  See [implementation/python.md](../../implementation/python.md).
- **Rust (v0.x → v1.0).** Ports forward from Python; uses the existing `mash-engine` crate at `operations/engineering/services/mash/crates/mash-engine/src/algebra/` as the algebra seed.
  See [implementation/rust.md](../../implementation/rust.md).

The Rust algebra is the truth-source for operator semantics across both implementations: when in doubt about a bilattice operation, the Rust algebra fixtures are authoritative.
