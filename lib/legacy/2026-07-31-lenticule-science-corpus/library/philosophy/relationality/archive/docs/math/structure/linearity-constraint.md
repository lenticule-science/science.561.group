---
title: Linearity Constraint
id: linearity-constraint
role: structure
status: plan
proof_refs: []
---


# Linearity Constraint

Resource/linearity constraint for concurrent flows over hypertensor sections.

## Definition
- Scope: subset of a [Hypertensor Section](hypertensor-section.md) where flow
  operations must be single-use (no duplication/discard).
- Relation: marks resources as linear/affine, restricting admissible flow steps.

## Invariants
- No duplication: linear resources cannot be copied.
- No implicit discard: consumption must be explicit unless affine permission.
- Compatibility: constraints respected under interleaving flow.

## Proof
- Uses: flow rules to annotate linear/affine usage.
- Shows that: resource discipline can be imposed on section flows.
