---
type: definition
class: substrate-entity
realizes: [function, closure]
depends-on: [function, closure, type-record, code-record, effect-record, capability-record]
see-also: [invoke-function]
---

# Function record

A **function record** is the substrate-entity formal definition of a [function](teaching/explanations/function.md): the predication-graph entity declaring a function's signature, body, effects, and capabilities.

## Structural fields

- **`id`** — kebab-case identifier (the function's name).
- **`description`** — one-line summary.
- **`signature`** — reference to the [type-record](type-record.md) of the function's signature: `(parameters) → return-type`.
- **`body`** — reference to the [code-record](code-record.md) carrying the function's implementation.
- **`captured-environment`** — for closures, references to substrate values the function references but doesn't take as parameters.
- **`effects`** — references to [effect-records](effect-record.md) declaring what the function does.
- **`required-capabilities`** — references to [capability-records](capability-record.md) the function needs to execute.
- **`determinism-declaration`** — `pure`, `effectful`, `non-deterministic`.
- **`runtime-requirement`** — reference to the [runtime-record](runtime-record.md) the function requires.
- **`scope`** — reference to the scope the function is defined in.
- **`closure-kind`** — `function`.

## Invariants

- **Signature-coherent.** The function's body must conform to its signature (per [check-type](../morphisms/check-type.md)).
- **Effect-coherent.** The function's body's actual effects must match (or be a subset of) the declared effects.
- **Capability-coherent.** The function's body must only use capabilities passed in or in its required-capabilities set.
- **Deterministic-as-declared.** Per [settlement-determinism](../../../theorems/settlement-determinism.md), pure functions produce byte-identical outputs on byte-identical inputs.

## Position in the platform

Function records are the substrate's *function registry*. Per [code-as-substrate](teaching/explanations/code-as-substrate.md), every function the substrate executes has a function-record. Per [invoke-function](../morphisms/invoke-function.md), invocation references the function-record.
