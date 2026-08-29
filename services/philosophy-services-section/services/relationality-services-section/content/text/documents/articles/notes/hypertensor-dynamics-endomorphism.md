---
title: Hypertensor Dynamics Endomorphism
id: hypertensor-dynamics-endomorphism
role: structure
status: plan
derived_from:
- acts/flow
proof_refs: []
---


# Hypertensor Dynamics Endomorphism

The **Hypertensor Dynamics Endomorphism** is a local endomorphism of the
relational quasicrystalline hypertensor sheaf induced by an earned act in the
flow/measurement/tower stacks.

## Definition
- For each open set `U`, acts on sections over `U` by modifying only the
  fibres/towers determined by the act’s footprint.
- Commutes with restriction: for inclusion `V ⊂ U`,
  `res_{V,U} ∘ F(U) = F(V) ∘ res_{V,U}`.
- Built from flow/nucleus and measurement acts over the
  [Hypertensor Sheaf](./hypertensor-sheaf.md).

## Invariants
- Locality: only touches fibres/towers in the act’s footprint.
- Closure: endomorphisms form a monoid under composition (include identity).
- Compatibility: respects the sheaf structure (restriction/gluing).

## Proof
Derived from flow/nucleus/measurement acts applied to the hypertensor sheaf,
ensuring locality and restriction-compatibility.
