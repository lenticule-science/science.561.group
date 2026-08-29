---
title: Context
id: context
role: structure
status: plan
derived_from:
- acts/construct-contexts
proof_refs: []
---


# Context

The **Context** carrier is earned from the act
[`construct-contexts`](docs/math/acts/construct-contexts.md). It represents the
contextual environment in which recognitions and evaluations take place.

## Definition
- Elements: contexts constructed by the act `construct-contexts`, equipped with
  the recognitions induced by context acts.
- Structure: supports flow and nucleus operators defined over contexts.

## Invariants
- Contexts are well-formed per the construction act and admit earned flow and
  nucleus operations.

## Proof
Directly derived from the act `construct-contexts`, which supplies the carrier
and its admissibility conditions. This structure packages that carrier for use
by operators such as
[Flow Context](docs/math/operator/flow-context.md) and
[Nucleate Context](docs/math/operator/nucleate-context.md).
