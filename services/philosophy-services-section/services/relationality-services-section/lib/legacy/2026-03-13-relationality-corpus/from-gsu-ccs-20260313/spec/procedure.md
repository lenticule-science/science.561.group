---
name: procedure

description: "Skillful work that is meaning-closed but not execution-closed; branches to a named output."
describes: SkillfulWork
defines: Procedure
domain: Input
codomain: NamedOutput
---

## What this is

A procedure is the type of skillful work (§skillful-work) corresponding to Fix(σ) \ H\* in the nuclear quartet ([NuclearQuartetSubalgebra](../math/nuclear-quartet-subalgebra.md)) — meaning-closure (σ) has been applied but not execution-closure (Δ). A procedure branches to stabilize its input: it runs only long enough to produce a named output that can serve as input to the next skill. The nuclear quartet projection ([NuclearQuartetSubalgebra](../math/nuclear-quartet-subalgebra.md#nuclear-quartet-subalgebra-projection)) establishes that Fix(σ) maps into H\* via Δ; following a procedure's branches until they resolve is exactly applying Δ to land in Process.

## MUST

- Produce a named, typed output — [NuclearQuartetSubalgebra](../math/nuclear-quartet-subalgebra.md#nuclear-quartet-subalgebra-projection): Fix(σ) maps to H\* via the reflection π; the output is the stabilized image and must be nameable as input to a downstream skill
- End every branch in a call to a named skill or a halt — [NuclearQuartetSubalgebra](../math/nuclear-quartet-subalgebra.md): all paths from Fix(σ) under Δ lead to H\*; a branch that terminates without dispatching to a skill has not applied Δ
- Contain no inline work within branches — §nuclear-quartet-theorem: inline work in a branch means execution is already determined at that point, making that branch a Process fragment; extract it
- Declare its type in `skill-closure-kind: procedure` frontmatter — §skillful-work

## CAN

- Call any type of skill (Process, Derivation, Inquiry, or another Procedure) as downstream work
- Be of any length, provided branches remain clean
- Re-enter from the top (loop) provided each loop pass produces a named intermediate output

## CANNOT

- Perform execution steps inline in branches — breaks the Fix(σ)/H\* distinction; inline execution means Δ has already been applied, which would make this fragment a Process
- Leave its output type unnamed — [NuclearQuartetSubalgebra](../math/nuclear-quartet-subalgebra.md#nuclear-quartet-subalgebra-projection): the reflection π must be well-defined; an unnamed output cannot be used as input to the next skill
- Do the downstream work itself — a procedure dispatches; it does not also execute

## Pending

- Formal proof that σ-closure alone is sufficient to produce a well-typed output — blocked by: skill-algebra construction
