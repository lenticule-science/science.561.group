---
title: Directed Homotopy Simulation Program
id: directed-homotopy-program
role: structure
status: someday
derived_from:
- computer/type/documentation-interpreter
proof_refs: []
---


# Directed Homotopy Simulation Program

Program to realise relational directed homotopy: simulate oriented paths and
higher cells using flow/nucleus operations and profile towers.

## Behaviour
- State representation:
  - directed space `X` as states with partial order/transition relation;
    each state stores stabilised recognitions.
  - flow operator advancing states along the directed relation.
  - nucleus operator collapsing states, commuting with flow.
  - profile tower tracking higher cells; each level inherits directed relation.
- Inputs:
  - base directed graph/partial order; flow/nucleus definitions satisfying
    commutation laws; tower description (filters/disciplines).
- Update procedure:
  - flow step: apply flow to generate successors.
  - nucleus collapse: stabilise and discard nucleus-equivalent states.
  - tower update: recompute induced flow relations; ensure level compatibility.
  - observables/reach: propagate observables; compute reachable components.
- Invariants:
  - flow/nucleus commute; tower coherence across levels; reachability stable
    under further flow.
- Outputs:
  - directed homotopy classes (reachable components), tower summaries, and
    diagnostics for commutation/coherence.

## Proof
- Derived from: [Documentation Interpreter](../../../computer/type/documentation-interpreter.md).
- Shows that: this program simulates directed homotopy concepts atop the documentation interpreter without extending machine semantics.
