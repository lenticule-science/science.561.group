---
title: Recognition
id: recognition
role: structure
status: plan
emerges_from: recognize
proof_refs:
- recognize
- meet-recognition
- join-recognition
- negate
- recognition-collapse-depth
- hypertensor-section
- coverage-site
- flow-nucleus-adjunction
fields:
- name: support
  type: hypertensor-section
  description: section of the hypertensor sheaf over which the recognition is asserted.
- name: window
  type: hypertensor-window
  description: window/locality for the recognition.
- name: predicate
  type: recognition-ring
  description: element of the earned recognition lattice/ring.
- name: evidence
  type: recognition-telescope
  description: witnesses/measurements supporting the predicate.
- name: scope
  type: coverage-site
  description: coverage/contexts where the recognition holds.
- name: provenance
  type: trace
  description: "`{origin, timestamp, trace}` for reproducibility and replay."
- name: collapse_depth
  type: recognition-collapse-depth
  description: measure of how far the recognition has been collapsed/stabilised.
- name: nucleus
  type: flow-nucleus-adjunction
  description: flow/nucleus compatibility data ensuring stability.
description: "Base recognition is earned by the act Recognize: a two-place witness formed from (Void SelfNaming) yielding a recognition."
---

# Recognition

Base recognition is earned by the act *Recognize*: a two-place witness formed
from `(Void SelfNaming)` yielding a recognition. Within the quasicrystalline
hypertensor topos, that predicate travels with its support (section/window),
evidence, scope, provenance, and stability data. This carrier packages all of
that so operators can combine and transport recognitions without violating
topos/flow/nucleus invariants.

## Invariants
- **Locality:** predicate refers to a specific `support` section and `window`;
  restriction/glue along the `scope` coverage preserves the recognition.
- **Lattice compatibility:** meet/join/negation earned from recognition acts
  operate within the `recognition-ring` component without violating support.
- **Stability:** revalidation under the same `nucleus` yields an equivalent
  recognition; `collapse_depth` records stabilisation.
- **Provenance:** `provenance` is sufficient to replay/verify the recognition;
  explicit failures travel via [Failure Carrier](failure-carrier.md), not here.

## Proof
- Uses: earned act [Recognize](./recognize.md) for the predicate, lattice
  acts (meet/join/negate) for combination, sheaf/coverage acts for locality,
  and flow/nucleus acts for stability.
- Shows that: packaging predicate, support, evidence, scope, provenance, and
  stability yields an earned, portable carrier for recognition operations in
  the quasicrystalline hypertensor topos.

## Earlier material

## Proof
- Uses: earned act [Recognize](recognize.md) for the predicate, lattice
  acts (meet/join/negate) for combination, sheaf/coverage acts for locality,
  and flow/nucleus acts for stability.
- Shows that: packaging predicate, support, evidence, scope, provenance, and
  stability yields an earned, portable carrier for recognition operations in
  the quasicrystalline hypertensor topos.
