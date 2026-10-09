---
type: definition
class: substrate-entity
realizes: [effect]
depends-on: [effect, capability-record, witness]
see-also: [function-record, exercise-capability]
---

# Effect record

An **effect record** is the substrate-entity formal definition of an [effect](teaching/explanations/effect.md): the predication-graph entity declaring an effect's name, the capability it requires, and its determinism profile.

## Structural fields

- **`id`** — kebab-case identifier (the effect's name; e.g. `read-file`, `write-network`, `invoke-model`).
- **`description`** — one-line summary of what the effect does.
- **`required-capability`** — reference to the [capability-record](capability-record.md) the effect requires to execute.
- **`determinism-class`** — `deterministic-given-capability-state`, `non-deterministic`, `external-stateful`.
- **`witness-shape`** — what the effect's witness records (inputs, outputs, capability used, ordinal).
- **`scope`** — reference to the scope the effect is declared in.

## Invariants

- **Capability-bound.** An effect cannot execute without its required capability being held by the executing function (per [exercise-capability](../morphisms/exercise-capability.md)).
- **Witness-emitting.** Per [witness](../../../objects/witness.md), every effect execution produces a witness conforming to `witness-shape`.
- **Determinism-honest.** An effect declared `deterministic-given-capability-state` must produce byte-identical outputs on byte-identical inputs and capability state.

## Position in the platform

Effect records are the substrate's *effect registry*. Per [function-record](function-record.md), every function declares its effects via references into the effect-record registry. Per [exercise-capability](../morphisms/exercise-capability.md), effect execution is mediated by the substrate's capability discipline.
