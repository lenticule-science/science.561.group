---
id: script
description: "A Script is an ephemeral coordination unit: runs to completion, exits, and exposes itself through stdin/stdout/stderr and an exit code."
defines: Script
extends: Entity
date-modified: 2026-03-19
params:
  input-type: relational-universe
  output-type: relational-universe
  computation: relational-universe-morphism
output: relational-universe-morphism
ast:
  total-terminating-function:
    - input-type
    - computation:
        - input-type
        - output-type
    - exit-indicator:
        - input-type
---

# Script

## Formal definition

A **Script** is a morphism $f : A \to B$ in the category of data types:

$$\text{Script} = (A,\; B,\; f : A \to B,\; \mathrm{exit} : A \to \mathbf{2})$$

where:
- $A$ is the **input type** — the set of valid inputs (stdin stream, flags, input files)
- $B$ is the **output type** — the set of valid outputs (stdout stream)
- $f$ is the **computation** — a total function from input to output
- $\mathrm{exit} : A \to \mathbf{2}$ is the **success indicator** — maps each input to success (\$0$) or failure (non-zero); $f$ is only semantically meaningful when $\mathrm{exit}(a) = 0$

**UNIX realization.** In the concrete UNIX interface: $A \leq \mathrm{String} \times \mathrm{Flags}$ (stdin + named flags), $B \leq \mathrm{String}$ (stdout). The contract `(stdin, flags) → stdout` is the standard interface every script exposes. Scripts compose by pipe: $g \circ f$ when $B_f \leq A_g$.

**Atomicity.** $f$ is total — it either produces output or fails cleanly; no partial states. A Script that does two separable operations is two scripts composed by a third. Atomicity means: one named input type, one named output type, one function.

**Difference from Skill.** A [Skill](skills.md) is a judgment — it occupies a nuclear quartet position and operates within $H_t$. A Script is an implementation — it operates on concrete data types, has no nuclear structure, and terminates. Skills invoke Scripts; Scripts do not invoke Skills.

## What it is

A Script is a program that automates a sequence of operations by coordinating existing components: it is invoked, runs to completion, and exits.
It does not persist state between invocations — a Script CANNOT maintain state between invocations.
It CANNOT expose a network interface or block indefinitely waiting for external events.
This is the structural distinction from a Service — a service waits for requests indefinitely; a script terminates.

Its job is coordination, not implementation. A Script connects inputs to outputs by routing through existing components — file formats, other scripts, external tools. The behavior lives in those components; the Script is the glue that assembles them into a named operation. (Ousterhout: scripting languages are *gluing* languages — they assume the existence of powerful components and are intended primarily for connecting them.)

## The interface contract

A Script exposes itself through four channels:

- **stdin** — optional input stream
- **stdout** — primary output
- **stderr** — errors and diagnostics only
- **exit code** — 0 = success; non-zero = failure

Nothing else is guaranteed to be visible to callers. This shared interface is what makes Scripts composable without coordination: two Scripts that have never heard of each other can be chained because they agree on this contract.

A Script MUST write its primary output to stdout and errors and diagnostics to stderr — not stdout.
It MUST exit with a non-zero code on failure and run to completion — no persistent background threads.
A Script MAY read from stdin, accept named flags as its argument interface, invoke other Scripts as subprocesses, or read input files at runtime.

## Atomicity

A Script MUST do one thing.
The boundary of "one thing" is a single named operation with a defined input type and output type.
A Script that does two separable operations is two Scripts composed by a third.

A Script with no subprocess calls is an **atomic Script** — its behavior is entirely self-contained. A Script that invokes other Scripts as subprocesses and routes their outputs is a **composite Script** — its behavior is dispatching. Both are Scripts; the distinction is structural.

## Composition

Scripts compose by chaining through the pipe interface, or by a caller invoking them as subprocesses and consuming their stdout. The called Script knows nothing about the caller. Composition is structural — it requires only interface compatibility — not semantic (shared knowledge of internals).

## Open questions

- No formal mechanism yet to detect drift between a Runbook's declared interface and its colocated Script's actual flags.
