---
title: Kernel Machine Program
role: structure
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



A computer-layer packaging of the machine kernel for deployment. It instantiates
the earned carriers and operators of the kernel as a runnable computer target.

## Behaviour
- Initialise kernel carriers (section, evaluation state, recognitions,
  snapshots, wiring plan).
- Provide endpoints/runbooks to execute kernel operators.
- Expose traceability and telemetry for kernel-level operations.

## Invariants
- Kernel semantics are preserved: no extra instructions or state beyond the
  earned kernel.
- Programs run as acyclic wirings over kernel operators.
- Failures use [Computer Failure](../../type/computer-failure.md).

## Proof
This program instantiates the machine kernel in the computer layer; proof shows
it introduces no new semantics beyond the kernel and preserves kernel
invariants while using computer carriers/operators as the exposed interface.
