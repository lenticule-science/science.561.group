---
id: process
description: "A Process is a fully determined operation: both its meaning and its execution path are fixed before it runs. Same input always produces same output. Corresponds to Fix(σ)∩Fix(Δ) in the nuclear quartet."
extends: FlatfileAgentialResourceSystemSkillfulWork
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
aliases:
  - processes
  - Process
  - process
meaning-settled: true
execution-settled: true
contrasts-with: procedure, inquiry, derivation
composes-into: workflow
instance-of: work
relations:
  instance-of: work
  contrasts-with:
    - procedure
    - derivation
    - inquiry
  requires: flatfile-agent-resource-system-skill-result
  properties:
    - meaning-settled=true
    - execution-settled=true
type: sequence
visibility: public
date-created: 2026-03-29
---

# Process

## Formal definition

A **Process** is an element $W$ of the fiber $H_t$ satisfying both nuclear fixed-point conditions:

$$W \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$$
$$\sigma_t(W) = W \quad\text{and}\quad \Delta_t(W) = W$$

As a [Skill](skills.md) type, a Process is a morphism $f : A \to B$ with the guarantee that $f(a) \in H^*_t$ for all inputs — the output is always fully settled before it is inspected.

**The nuclear quartet.** The four positions partition $H_t$ (excluding $\bot$):

| Position | Nuclear condition | Set |
|---|---|---|
| **Process** | $\sigma_t(W) = W$ and $\Delta_t(W) = W$ | $H^*_t$ |
| [**Procedure**](../../../../services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/procedure.md) | $\sigma_t(W) = W$ and $\Delta_t(W) \neq W$ | $\mathrm{Fix}(\sigma_t) \setminus H^*_t$ |
| [**Derivation**](derivation.md) | $\sigma_t(W) \neq W$ and $\Delta_t(W) = W$ | $\mathrm{Fix}(\Delta_t) \setminus H^*_t$ |
| [**Inquiry**](inquiry.md) | $\sigma_t(W) \neq W$ and $\Delta_t(W) \neq W$ | $H_t \setminus (\mathrm{Fix}(\sigma_t) \cup \mathrm{Fix}(\Delta_t))$ |

The joint projection $\pi_t = \sigma_t \circ \Delta_t : H_t \to H^*_t$ maps every element into Process position — closing all open questions of meaning and execution. A Process is the fixed point of $\pi_t$.

## What this is

A **Process** is a defined, repeatable transformation: given the same input, it always produces the same output.
This is what the word "process" names in business process management (ISO 9000) and formal methods alike — a transformation whose complete behavior is determined by its specification before it runs.

In this system, a Process is [FlatfileAgentialResourceSystemSkillfulWork](../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/library/flatfile-agential-resource-system/library/vocabulary/library/flatfile-agential-resource-system-skillful-work/flatfile-agential-resource-system-skillful-work.md) in which both closure nuclei have been applied: meaning-closure (σ) and execution-closure (Δ).
The result is full determination — no open questions about what it is doing or how it will do it.

The mathematical position is Fix(σ)∩Fix(Δ) — the intersection of both fixed-point sub-algebras in the nuclear quartet ([NuclearQuartetSubalgebra](../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/library/relational-hyperverse-repository/math/nuclear-quartet-subalgebra.md)).
The joint projection π reflects every operation into this position.
A Process is already there.

## What full determination means

Meaning-closure (σ) means the Process knows what it is about.
Its purpose, its domain, its output type — all settled.
Execution-closure (Δ) means the Process knows exactly how to proceed.
No branches, no judgment calls, no conditions to evaluate.
Every step follows from the previous one without decision.

An operation that contains conditions is not yet Δ-closed — it is a [Procedure](../../../../services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/procedure.md).
An operation whose purpose is still being established is not yet σ-closed — it is a [Derivation](derivation.md) or [Inquiry](inquiry.md).

## The other three positions

- [Procedure](../../../../services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/procedure.md) — meaning-closed, execution-open: knows what, branches on how.
- [Derivation](derivation.md) — execution-closed, meaning-open: follows fixed rules, produces a judgment.
- [Inquiry](inquiry.md) — neither closed: open exploration.
- [FlatfileAgentialResourceSystemSkillfulWork](../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/library/flatfile-agential-resource-system/library/vocabulary/library/flatfile-agential-resource-system-skillful-work/flatfile-agential-resource-system-skillful-work.md) — all four positions together exhaust the nuclear quartet.

## Open questions

- Formal proof that σ-closure and Δ-closure together imply determinism for skill work — blocked by: skill-algebra construction.

A process is a fully determined transformation.
Given the same input, it always produces the same output.
There are no decisions to make, no conditions to evaluate, no branches to take.
You run it and get the result.

A process knows what it is producing (its meaning is settled) and how to produce it (its execution path is settled).
This double settlement is what distinguishes a process from every other kind of work.
A [procedure](../../../../services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/procedure.md) knows what it is producing but must evaluate conditions to determine the path.
An inquiry knows neither.
A process knows both — it is the work that is already fully specified.

Baking a recipe with exact measurements and exact timing is a process.
Running a build script is a process.
Executing a SQL query is a process.
Multiplying two matrices is a process.
In each case, the specification fully determines the output given the input.

A process is repeatable.
Running it twice on the same input gives the same result.
This is the defining property that makes processes automatable — anything fully determined can be delegated to a machine without loss.
A process does not require judgment, discretion, or interpretation.
It requires only correct execution.

Processes compose.
If process A produces output that process B takes as input, the composition A-then-B is itself a process.
The composition of two fully determined transformations is fully determined.
This is why process chains work: a manufacturing line, a data pipeline, a compilation toolchain.
Each step is a process; the chain is a process.

A process can fail — the input may be malformed, the execution environment may be broken, a resource may be unavailable.
But a process cannot produce an unexpected output from a valid input.
If it does, the specification was wrong and the thing was never a process to begin with.

The four types of work form a lattice based on what is settled:

| | Execution settled | Execution open |
|---|---|---|
| **Meaning settled** | **Process** | [Procedure](../../../../services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/procedure.md) |
| **Meaning open** | Derivation | [Inquiry](inquiry.md) |

A process sits at the top of this lattice — both dimensions settled.
All other work types are on a path toward becoming processes as their open questions get resolved.

A **process** is a defined, repeatable transformation: given the same input, it always produces the same output. No decisions, no branches, no judgment. The specification fully determines the behavior.

This is what "process" means in business process management (ISO 9000), formal methods, and manufacturing: a transformation whose complete behavior is determined by its specification before it runs. Baking a recipe with exact measurements. Running a build script. Executing a SQL query. Multiplying two matrices. In each case, the input and the specification together determine the output.

For the general concept — grounded in sociology and organizational theory — see [process](../../../../services/sociology-science-services-section/content/sociology/theories/work/terms/process.md) in the work taxonomy. That file defines process as one of four work types classified by whether meaning and execution are settled.

A process sits in one position of a 2×2 classification based on what is settled:

| | Execution settled | Execution open |
|---|---|---|
| **Meaning settled** | **Process** — fully determined | [Procedure](../../../../services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/procedure.md) — branches on conditions |
| **Meaning open** | [Derivation](../../../../services/sociology-science-services-section/content/sociology/theories/work/terms/derivation.md) — follows rules, meaning emerges | [Inquiry](../../../../services/sociology-science-services-section/content/sociology/theories/work/terms/inquiry.md) — open exploration |

A process is the doubly-settled position: both meaning (what it produces) and execution (how it proceeds) are fixed.

- Whether the meaning-settled/execution-settled split is the right two-axis classification of work, or whether a different decomposition (e.g., novelty/repetition × autonomy/direction) is more useful in practice.
- Whether the boundary between process and procedure is empirically sharp — whether real operations cleanly fall into one of the four cells, or whether most actual work is somewhere on a continuum between them.

Processes compose into workflows. A workflow arranges process steps as a directed graph while preserving each step's fully determined execution.

A ***process*** is a [sequence](sequence.md) of [acts](../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/tekodynamics-concepts-act-act.md), usually [acting](../../../../../philosophy-services-section/content/text/glossary/terms/acting.md) on the same [thing](../../../../../philosophy-services-section/content/text/glossary/terms/thing.org.md)(s), usually toward the same [result](../../../../../philosophy-services-section/services/relationality-services-section/content/text/glossary/terms/result.md).
