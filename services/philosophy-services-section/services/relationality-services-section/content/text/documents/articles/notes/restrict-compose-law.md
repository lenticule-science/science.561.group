---
title: Restrict Compose Law
id: restrict-compose-law
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
description: Witnesses functorial composition of restrictions in the hypertensor sheaf.
---



Witnesses functorial composition of restrictions in the hypertensor sheaf.

## Definition
- Inputs: inclusions `W→V→U` in [Hypertensor Site](./hypertensor-site.md).
- Output: law `res_W^U = res_W^V ∘ res_V^U` stored in
  [Sheaf Restriction Algebra](./sheaf-restriction-algebra.md).
- Behaviour: constructs the composite and records equality.

## Invariants
- Associativity of composition of restrictions.
- Identity restrictions act as units.

## Proof
- Uses: sheaf functoriality on the hypertensor site.
- Produces: restriction law witness.
- Shows that: restriction composition obeys functorial equations.

## Earlier material

## Definition
- Inputs: inclusions `W→V→U` in [Hypertensor Site](hypertensor-site.md).
- Output: law `res_W^U = res_W^V ∘ res_V^U` stored in
  [Sheaf Restriction Algebra](sheaf-restriction-algebra.md).
- Behaviour: constructs the composite and records equality.
