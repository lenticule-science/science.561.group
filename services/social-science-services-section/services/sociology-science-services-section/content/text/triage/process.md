---

title: "Process"
description: "A Process is a fully determined operation: both its meaning and its execution path are fixed before it runs. Same input always produces same output."
defines: Process
extends: FlatfileAgentialResourceSystemSkillfulWork
date-modified: 2026-03-19
---

A **process** is a defined, repeatable transformation: given the same input, it always produces the same output. No decisions, no branches, no judgment. The specification fully determines the behavior.

This is what "process" means in business process management (ISO 9000), formal methods, and manufacturing: a transformation whose complete behavior is determined by its specification before it runs. Baking a recipe with exact measurements. Running a build script. Executing a SQL query. Multiplying two matrices. In each case, the input and the specification together determine the output.

For the general concept — grounded in sociology and organizational theory — see [process](../../sociology/theories/work/terms/process.md) in the work taxonomy. That file defines process as one of four work types classified by whether meaning and execution are settled.

## The four work types

A process sits in one position of a 2×2 classification based on what is settled:

| | Execution settled | Execution open |
|---|---|---|
| **Meaning settled** | **Process** — fully determined | [Procedure](../../sociology/theories/work/terms/procedure.md) — branches on conditions |
| **Meaning open** | [Derivation](../../sociology/theories/work/terms/derivation.md) — follows rules, meaning emerges | [Inquiry](../../sociology/theories/work/terms/inquiry.md) — open exploration |

A process is the doubly-settled position: both meaning (what it produces) and execution (how it proceeds) are fixed.

## Open questions

- Whether the meaning-settled/execution-settled split is the right two-axis classification of work, or whether a different decomposition (e.g., novelty/repetition × autonomy/direction) is more useful in practice.
- Whether the boundary between process and procedure is empirically sharp — whether real operations cleanly fall into one of the four cells, or whether most actual work is somewhere on a continuum between them.


---

<!-- source: _archive/from-discourse-domain-locus-work-studies/process/process.md -->

## Imported source: _archive/from-discourse-domain-locus-work-studies/process/process.md

---

description: "A fully determined transformation — same input always produces same output, no decisions, no branches, no judgment."
defines: process
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
