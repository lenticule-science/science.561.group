---
id: process
description: "Skillful work that is both meaning-closed and execution-closed; deterministic, no conditions."
describes: SkillfulWork
domain: Input
codomain: Output
---

# Process

## What this is

A process is the type of skillful work (§skillful-work) corresponding to H\* = Fix(σ)∩Fix(Δ) in the nuclear quartet ([NuclearQuartetSubalgebra](../math/nuclear-quartet-subalgebra.md)) — both meaning-closure and execution-closure have been applied. A process is a numbered list of instructions with no conditions; the same input always produces the same output. The joint projection π ([NuclearQuartetSubalgebra](../math/nuclear-quartet-subalgebra.md#nuclear-quartet-subalgebra-projection)) reflects every work unit into H\*; a process is already there.

## MUST

- Contain no conditions — §nucleus: a point in Fix(j)∩Fix(j') is stable under both nuclei; a conditional would mean the execution is not yet Δ-closed
- Produce identical output from identical input — [NuclearQuartetSubalgebra](../math/nuclear-quartet-subalgebra.md) (H\* is a sub-algebra; its elements are fully determined by the structure)
- Terminate in a finite number of steps — §nucleus: idempotence means one application of π suffices; a process that loops indefinitely has not reached H\*
- Declare its type in `skill-closure-kind: process` frontmatter — §skillful-work (every skill must declare its type)

## CAN

- Be of any length, provided no condition appears
- Call other processes as sub-steps
- Contain keyed dispatch on an input field (e.g., a table of cases indexed by an input value), provided the key is an explicit input and no inference is required to determine it

## CANNOT

- Contain `if`, `unless`, `when`, or any conditional — breaks Δ-closure; a conditional means the execution path is not fully determined
- Require the agent to infer or judge — breaks σ-closure; inference means meaning is not yet settled; extract that step into a Derivation
- Perform open-ended investigation — that is Inquiry; a process must know what it is doing at every step

## Pending

- Formal proof that Δ-closure and σ-closure together imply determinism for skill work — blocked by: skill-algebra construction
