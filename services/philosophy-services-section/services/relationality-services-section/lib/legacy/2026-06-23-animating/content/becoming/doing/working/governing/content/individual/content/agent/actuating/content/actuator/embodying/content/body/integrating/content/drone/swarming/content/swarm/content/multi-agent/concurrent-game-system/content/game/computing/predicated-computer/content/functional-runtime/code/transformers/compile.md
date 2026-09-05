---
type: morphism
class: code-transformation
realizes: [code-as-substrate]
depends-on: [code-record, hash-discipline, settlement-determinism]
see-also: [evaluate]
---

# Compile

The substrate operation that transforms a high-level [code-record](../objects/code-record.md) into a lower-level evaluatable representation. Compile is how the substrate produces optimized executable forms from source code.

## Signature

`compile(source-code-record-id, target-runtime, compilation-options) → (compiled-code-record, compile-witness)`

Inputs:

- **`source-code-record-id`** — reference to the source code to compile.
- **`target-runtime`** — reference to the [runtime-record](../objects/runtime-record.md) the compiled form targets.
- **`compilation-options`** — optimization level, debug info inclusion, etc.

Outputs:

- **`compiled-code-record`** — a new code-record carrying the compiled form, with `source-of-compiled-form` linking back.
- **`compile-witness`** — records the compilation.

## Operational semantics

1. Read the source code-record.
2. Apply the target runtime's compilation strategy (parse, type-check, optimize, code-generate).
3. Insert the compiled-code-record per [insertion](../../../morphisms/insertion.md).
4. Witness emit.

Per [settlement-determinism](../../../theorems/settlement-determinism.md), compilation is deterministic on `(source, target, options)`. Two compilations with byte-identical inputs produce byte-identical outputs.

## Engineering invariants

- **Reproducible.** Per the substrate's deterministic-compilation discipline, same inputs produce same compiled-code-record (byte-identical canonical-form).
- **Source-traceable.** The compiled-code-record references its source per `source-of-compiled-form`.
- **Witness-emitted.** Per [settlement-determinism](../../../theorems/settlement-determinism.md), compilation is replayable.

## Position in the platform

Compile is the substrate's *code-transformation primitive*. Per [code-as-substrate](teaching/explanations/code-as-substrate.md), both source and compiled forms are substrate content; the substrate's audit chain records the compilation event linking them.
