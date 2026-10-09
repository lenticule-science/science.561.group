---
type: morphism
class: evaluation-operation
realizes: [runtime, code-as-substrate]
depends-on: [runtime-record, code-record, settlement-determinism, witness]
see-also: [invoke-function, compile]
---

# Evaluate

The substrate operation that executes a [code-record](../objects/code-record.md) under a chosen [runtime-record](../objects/runtime-record.md), producing the code's result and a witness chain. Evaluate is the substrate's primary code-execution primitive.

## Signature

`evaluate(code-record-id, runtime-record-id, evaluation-context) → (result, evaluation-witness)`

Inputs:

- **`code-record-id`** — the code to evaluate.
- **`runtime-record-id`** — the runtime under which to evaluate.
- **`evaluation-context`** — variable bindings, capabilities in scope, current substrate ordinal.

Outputs:

- **`result`** — the code's return value.
- **`evaluation-witness`** — records every sub-step the evaluation performed.

## Operational semantics

The evaluation iterates the code's source-form per the runtime's evaluation strategy:

- For `eager` runtime: evaluate sub-expressions in order before applying.
- For `lazy` runtime: build thunks, force on demand.
- For `normal-order` runtime: substitute bodies into argument positions before reducing.

Per [code-as-substrate](teaching/explanations/code-as-substrate.md), the code is substrate content; evaluation steps produce sub-witnesses recording each evaluation phase.

Per [settlement-determinism](../../../theorems/settlement-determinism.md), pure code evaluations replay byte-identically. Effectful evaluations are deterministic given the same context (capabilities, substrate state, etc.).

## Engineering invariants

- **Runtime-conformant.** The evaluation respects the runtime-record's declared properties.
- **Witness-emitted per phase.** Per [witness](../../../objects/witness.md), each evaluation phase produces a sub-witness.
- **Effect-bounded.** Per [function-record](../objects/function-record.md)'s effect declaration, only declared effects are admissible.

## Position in the platform

Evaluate is the substrate's *code-execution primitive*. Per [code-as-substrate](teaching/explanations/code-as-substrate.md), all program execution flows through evaluate; per [snapshot-replay-fidelity](../../../theorems/snapshot-replay-fidelity.md), evaluations are replayable from the substrate's audit chain.
