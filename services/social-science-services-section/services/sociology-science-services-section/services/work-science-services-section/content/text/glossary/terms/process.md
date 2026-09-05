---
id: process
description: "A fully determined transformation — same input always produces same output, no decisions, no branches, no judgment."
aliases: [processes]
meaning-settled: true
execution-settled: true
contrasts-with: procedure, inquiry, derivation
composes-into: workflow
instance-of: work
date-created: 2026-03-29
---

A process is a fully determined transformation. Given the same input, it always produces the same output. There are no decisions to make, no conditions to evaluate, no branches to take. You run it and get the result.

A process knows what it is producing (its meaning is settled) and how to produce it (its execution path is settled). This double settlement is what distinguishes a process from every other kind of work. A [procedure](./procedure.md) knows what it is producing but must evaluate conditions to determine the path. An inquiry knows neither. A process knows both — it is the work that is already fully specified.

Baking a recipe with exact measurements and exact timing is a process. Running a build script is a process. Executing a SQL query is a process. Multiplying two matrices is a process. In each case, the specification fully determines the output given the input.

A process is repeatable. Running it twice on the same input gives the same result. This is the defining property that makes processes automatable — anything fully determined can be delegated to a machine without loss. A process does not require judgment, discretion, or interpretation. It requires only correct execution.

Processes compose. If process A produces output that process B takes as input, the composition A-then-B is itself a process. The composition of two fully determined transformations is fully determined. This is why process chains work: a manufacturing line, a data pipeline, a compilation toolchain. Each step is a process; the chain is a process.

A process can fail — the input may be malformed, the execution environment may be broken, a resource may be unavailable. But a process cannot produce an unexpected output from a valid input. If it does, the specification was wrong and the thing was never a process to begin with.

The four types of work form a lattice based on what is settled:

| | Execution settled | Execution open |
|---|---|---|
| **Meaning settled** | **Process** | [Procedure](./procedure.md) |
| **Meaning open** | Derivation | [Inquiry](./inquiry.md) |

A process sits at the top of this lattice — both dimensions settled. All other work types are on a path toward becoming processes as their open questions get resolved.


---

<!-- source: _archive/discipline-intake/business/terms/process.md -->

## Imported source: _archive/discipline-intake/business/terms/process.md

---
id: process
description: "A Process is a fully determined operation: both its meaning and its execution path are fixed before it runs. Same input always produces same output. Corresponds to Fix(σ)∩Fix(Δ) in the nuclear quartet."
defines: Process
extends: FlatfileAgentResourceSystemSkillfulWork
date-modified: 2026-03-19
params:
  input: relational-universe
  specification: relational-universe-morphism
output: relational-history-fiber-fixed-layer
ast:
  nuclear-fixed-point-satisfaction:
    - relational-history-saturating-nucleus:
        - specification
    - relational-history-transferring-nucleus:
        - specification
---

# Process

## Formal definition

A **Process** is an element $W$ of the fiber $H_t$ satisfying both nuclear fixed-point conditions:

$$W \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$$
$$\sigma_t(W) = W \quad\text{and}\quad \Delta_t(W) = W$$

As a [Skill](./skills.md) type, a Process is a morphism $f : A \to B$ with the guarantee that $f(a) \in H^*_t$ for all inputs — the output is always fully settled before it is inspected.

**The nuclear quartet.** The four positions partition $H_t$ (excluding $\bot$):

| Position | Nuclear condition | Set |
|---|---|---|
| **Process** | $\sigma_t(W) = W$ and $\Delta_t(W) = W$ | $H^*_t$ |
| [**Procedure**](./procedure.md) | $\sigma_t(W) = W$ and $\Delta_t(W) \neq W$ | $\mathrm{Fix}(\sigma_t) \setminus H^*_t$ |
| [**Derivation**](./derivation.md) | $\sigma_t(W) \neq W$ and $\Delta_t(W) = W$ | $\mathrm{Fix}(\Delta_t) \setminus H^*_t$ |
| [**Inquiry**](./inquiry.md) | $\sigma_t(W) \neq W$ and $\Delta_t(W) \neq W$ | $H_t \setminus (\mathrm{Fix}(\sigma_t) \cup \mathrm{Fix}(\Delta_t))$ |

The joint projection $\pi_t = \sigma_t \circ \Delta_t : H_t \to H^*_t$ maps every element into Process position — closing all open questions of meaning and execution. A Process is the fixed point of $\pi_t$.

## What this is

A **Process** is a defined, repeatable transformation: given the same input, it always produces the same output.
This is what the word "process" names in business process management (ISO 9000) and formal methods alike — a transformation whose complete behavior is determined by its specification before it runs.

In this system, a Process is [FlatfileAgentResourceSystemSkillfulWork](flatfile-agent-resource-system-skillful-work.md) in which both closure nuclei have been applied: meaning-closure (σ) and execution-closure (Δ).
The result is full determination — no open questions about what it is doing or how it will do it.

The mathematical position is Fix(σ)∩Fix(Δ) — the intersection of both fixed-point sub-algebras in the nuclear quartet ([NuclearQuartetSubalgebra](../math/nuclear-quartet-subalgebra.md)).
The joint projection π reflects every operation into this position.
A Process is already there.

## What full determination means

Meaning-closure (σ) means the Process knows what it is about.
Its purpose, its domain, its output type — all settled.
Execution-closure (Δ) means the Process knows exactly how to proceed.
No branches, no judgment calls, no conditions to evaluate.
Every step follows from the previous one without decision.

An operation that contains conditions is not yet Δ-closed — it is a [Procedure](./procedure.md).
An operation whose purpose is still being established is not yet σ-closed — it is a [Derivation](./derivation.md) or [Inquiry](./inquiry.md).

## The other three positions

- [Procedure](./procedure.md) — meaning-closed, execution-open: knows what, branches on how.
- [Derivation](./derivation.md) — execution-closed, meaning-open: follows fixed rules, produces a judgment.
- [Inquiry](./inquiry.md) — neither closed: open exploration.
- [FlatfileAgentResourceSystemSkillfulWork](flatfile-agent-resource-system-skillful-work.md) — all four positions together exhaust the nuclear quartet.

## Open questions

- Formal proof that σ-closure and Δ-closure together imply determinism for skill work — blocked by: skill-algebra construction.
