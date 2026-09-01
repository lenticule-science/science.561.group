---
name: bayesian-profile
role: structure
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



Epistemic profile enriched with probabilistic recognitions via entropy measures.

## Definition
- Carrier: [Epistemic Profile](epistemic-profile.md) annotated with probability/
  entropy data from the [Entropy Functional](entropy-functional.md).
- Structure: recognitions carry weights; entropy measures uncertainty.

## Invariants
- Normalisation: probabilities sum to 1 in each context; entropy is well-defined.
- Refinement: updates lower entropy when evidence arrives.

## Proof
- Uses: [Epistemic Profile](epistemic-profile.md) and
  [Entropy Functional](entropy-functional.md).
- Shows that: probabilistic reasoning can be overlaid on epistemic profiles
  while retaining earned recognitions.
