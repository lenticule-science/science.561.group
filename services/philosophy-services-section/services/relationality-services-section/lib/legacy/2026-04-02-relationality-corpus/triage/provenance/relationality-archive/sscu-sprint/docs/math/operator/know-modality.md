---
name: know-modality
role: operator
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---



Epistemic necessity operator `K_a` that collapses an epistemic profile to the
states that survive all earned observations of an agent.

## Definition
- Inputs: an [Epistemic Profile](../structure/epistemic-profile.md) for agent
  `a` and its inherited [Modal Structure](../structure/modal-structure.md).
- Output: the same epistemic profile restricted to states known by `a`.
- Behaviour: take the meet of all observations available to `a` in the profile,
  then apply the nucleus (necessity) to close under earned inference; produce
  the resulting epistemic subprofile.

## Invariants
- Monotone: if `P ≤ Q` then `K_a(P) ≤ K_a(Q)`.
- Idempotent: `K_a(K_a(P)) = K_a(P)`; inflationary/deflationary as earned by
  the modal structure.
- Compatibility: commutes with profile restriction and observation witnesses.

## Proof
- Uses: [Epistemic Profile](../structure/epistemic-profile.md) and modal
  operators from [Modal Structure](../structure/modal-structure.md) to form the
  necessity operator.
- Produces: an [Epistemic Profile](../structure/epistemic-profile.md) closed
  under knowledge for agent `a`.
- Shows that: epistemic necessity is an interior/closure operator on epistemic
  recognitions satisfying modal laws.
