---
title: Operator Signature
id: operator-signature
role: structure
status: plan
emerges_from: judgment-typing
proof_refs:
- judgment-typing
- judgment-triad
- recognition
fields:
- name: op_id
  type: trace
  description: canonical operator identifier as a traceable symbol/text.
- name: inputs
  type: trace
  description: ordered list of `{id, alias}` carrier references consumed.
- name: outputs
  type: trace
  description: ordered list of `{id, alias}` carrier references produced.
- name: typing_judgment
  type: trace
  description: witness showing `op_id : inputs -> outputs`.
---

# Operator Signature

Typed descriptor bundling an operator id with the ordered inputs/outputs it is
permitted to consume/produce, expressed as an earned typing judgment. The
dispatcher consults signatures before evaluating transformations.

## Definition
- `op_id`: canonical operator identifier (string/symbol).
- `inputs`: ordered list of `{id, alias}` carrier references expected by the operator.
- `outputs`: ordered list of `{id, alias}` carrier references produced by the operator.
- `typing_judgment`: the [Judgment Typing](judgment-typing.md) witness that
  `op_id : inputs → outputs`.

## Invariants
- Arity: `inputs` length matches the arity in `typing_judgment`.
- Typing: every listed carrier id is an earned structure; `typing_judgment`
  proves the mapping is total (or explicitly returns failure carriers).
- Identity: `op_id` is unique within the operator registry; signatures are
  immutable once published.

## Proof
- Uses: [Judgment Typing](judgment-typing.md) and [Judgment Triad](judgment-triad.md)
  to encode operator domains/codomains as judgments.
- Shows that: packaging typing evidence into a signature allows the dispatcher
  to validate arity/types mechanically before applying a transformation.
