---
title: Section Normal Form
id: section-normal-form
role: structure
status: plan
proof_refs: []
description: Canonical representative of a hypertensor section obtained via nucleus/collapse steps for deterministic comparison.
---



Canonical representative of a hypertensor section obtained via nucleus/collapse
steps for deterministic comparison.

## Definition
- Representative: section collapsed via nucleus and simplification rules to a
  unique normal form.
- Role: enables deterministic equality checks and hashing.

## Invariants
- Uniqueness up to earned equivalence.
- Idempotent: normalizing twice yields the same result.

## Proof
- Uses: nucleus and section simplification to define canonical form.
- Shows that: sections admit canonical representatives for comparison/encoding.
