---
name: derivation

description: "Skillful work that is execution-closed but not meaning-closed; applies inference rules to produce a judgment."
describes: SkillfulWork
domain: Input
codomain: Judgment
---

## What this is

A derivation is the type of skillful work (§skillful-work) corresponding to Fix(Δ) \ H\* in the nuclear quartet ([NuclearQuartetSubalgebra](../math/nuclear-quartet-subalgebra.md)) — execution-closure (Δ) has been applied but not meaning-closure (σ). A derivation follows fully determined inference rules to produce a judgment: a named, typed output that classifies or assesses its input but whose content could not have been precomputed from the input alone. The nuclear quartet projection ([NuclearQuartetSubalgebra](../math/nuclear-quartet-subalgebra.md#nuclear-quartet-subalgebra-projection)) establishes that Fix(Δ) maps into H\* via σ; a judgment, once its meaning is settled by the reader, becomes executable as a Process.

## MUST

- State its inference rules explicitly in the file body — §nucleus: Δ-stable means the transfer rules are fixed; unstated rules mean Δ has not been applied and the skill is an Inquiry
- Produce a judgment as output — [NuclearQuartetSubalgebra](../math/nuclear-quartet-subalgebra.md): Fix(Δ) maps to H\* via σ; the judgment is the image of σ applied after Δ
- Apply rules without control-flow branching — §nuclear-quartet-theorem: commutativity σ∘Δ = Δ∘σ means the path to H\* via Δ then σ equals the path via σ then Δ; branching on the inference path would merge this with Procedure
- Declare its type in `skill-closure-kind: derivation` frontmatter — §skillful-work

## CAN

- Call Processes as sub-steps for mechanical information gathering
- Apply any number of inference rules sequentially
- Produce a judgment whose type is known but whose content is not predetermined (e.g., "the critique", "the claims list", "the canonical name")

## CANNOT

- Branch on control flow — [NuclearQuartetSubalgebra](../math/nuclear-quartet-subalgebra.md): that would make this Fix(σ), not Fix(Δ); a branch means the output type is known but execution is undetermined, which is Procedure
- Produce an executable action sequence as its primary output — an action sequence is already in H\*; the Derivation's output must require σ-closure (interpretation) before it can be executed; if no interpretation is needed, this is a Process
- Leave inference rules implicit — §nucleus: implicit rules mean Δ has not been applied; extract to an Inquiry

## Pending

- Formal proof that Δ-closure alone is sufficient to define well-typed judgments for skill work — blocked by: skill-algebra construction
