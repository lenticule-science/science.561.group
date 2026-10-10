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

A process is a fully determined transformation.
Given the same input, it always produces the same output.
There are no decisions to make, no conditions to evaluate, no branches to take.
You run it and get the result.

A process knows what it is producing (its meaning is settled) and how to produce it (its execution path is settled).
This double settlement is what distinguishes a process from every other kind of work.
A [procedure](./procedure.md) knows what it is producing but must evaluate conditions to determine the path.
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
| **Meaning settled** | **Process** | [Procedure](./procedure.md) |
| **Meaning open** | Derivation | [Inquiry](./inquiry.md) |

A process sits at the top of this lattice — both dimensions settled.
All other work types are on a path toward becoming processes as their open questions get resolved.
