---
title: Check Parameterized Base Change
id: check-parameterized-base-change
role: operator
status: plan
derived_from: math/operator/base-change-square
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Check Parameterized Base Change

Computes and verifies base-change commutation for executable pullback/pushforward
in the parameterized sheaf setting.

## Definition
- Inputs: a pullback square in the parameterized coverage site, plus a subobject
  or recognition represented via the parameterized classifier payloads.
- Outputs: a [Parameterized Base-Change Condition](../structure/parameterized-base-change-condition.md)
  witness if pullback ∘ pushforward equals pushforward ∘ pullback; otherwise the
  operator fails to produce the structure.
- Behaviour: runs restriction/direct-image routines along both routes of the
  square, compares classifier payloads, and records provenance of both paths.

## Preconditions
- Pullback and pushforward implementations are available from the parameterized
  sheaf and are deterministic for the supplied payloads.

## Postconditions
- On success, the produced witness can be cached and reused under refinements of
  the square.
- On failure, callers can surface the mismatch for debugging or refinement.

## Proof
- Derived from: [Base-Change Square](../../math/operator/base-change-square.md)
  by executing the abstract commutation check with concrete parameterized sheaf
  routines.
- Shows that: the base-change law can be validated at the calculus level,
  supplying executable witnesses for substitution stability.
