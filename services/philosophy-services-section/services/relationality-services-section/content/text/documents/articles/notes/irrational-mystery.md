---
title: Irrational Mystery
id: irrational-mystery
role: structure
status: plan
emerges_from: irrational-commutation
proof_refs:
- irrational-modality
- irrational-commutation
- residue-dynamically
fields:
- name: residue
  type: recognition
  description: recognition that remains under irrationally weighted flow and nucleus.
- name: weight
  type: irrational-weight
  description: irrational scaling factor applied to admissible reordering families.
- name: flow_nucleus
  type: flow-nucleus-adjunction
  description: witness that flow and nucleus commute for this residue.
- name: collapse_witness
  type: recognition
  description: recognition that commutation with shuffle collapse holds.
- name: eigen_direction
  type: recognition
  description: recognition of the stabilized direction/eigenvector of the residue.
- name: provenance
  type: trace
  description: "`{origin, timestamp, trace}` showing how the residue was earned."
description: Carrier for the asymptotic residue that aligns to an eigenvector under irrationally weighted flow/nucleus dynamics and shuffle collapse.
---

# Irrational Mystery

Carrier for the asymptotic residue that aligns to an eigenvector under
irrationally weighted flow/nucleus dynamics and shuffle collapse. It packages
the invariant residue, the irrational weight, compatibility witnesses with
flow+nucleus, collapse commutation, and the stabilized eigen-direction.

## Invariants
- **Eigen-residue:** reapplying the flow-index implication scaled by `weight`
  leaves `residue` and `eigen_direction` equivalent.
- **Collapse compatibility:** `collapse_witness` shows the residue survives
  shuffle collapse unchanged.
- **Nucleus stability:** `flow_nucleus` witnesses admissible flow/nucleus
  commutation for this residue.
- **Provenance:** provenance is sufficient to replay the derivation.

## Proof
- Uses: acts [Irrational Modality](./irrational-modality.md),
  [Irrational Commutation](./irrational-commutation.md), and
  [Residuating Dynamically](./residue-dynamically.md).
- Shows that: combining irrationally scaled flow-index implication with fixed
  nucleus and collapse yields an eigen-residue that remains stable under those
  dynamics.
