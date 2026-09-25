---
title: Reflexive Profile
id: reflexive-profile
role: structure
status: plan
proof_refs: []
description: Profile that contains recognitions of its own recognitions, enabling self-reference.
---



Profile that contains recognitions of its own recognitions, enabling
self-reference.

## Definition
- Carrier: [Profile Topos](./profile-topos.md) augmented so recognitions can
  reference themselves in the [Recognition Carrier](./recognition.md).
- Structure: supports self-recognition and reflection via internal homs.

## Invariants
- Closure: self-referential recognitions stay within the profile.
- Consistency: reflexivity does not trivialise the logic; contradictions are
  controlled.

## Proof
- Uses: [Profile Topos](./profile-topos.md) and [Recognition Carrier](./recognition.md).
- Shows that: reflexive recognitions can be accommodated, forming the basis for
  self-witnessing operators.
