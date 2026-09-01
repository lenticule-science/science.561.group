---
title: Judgment Typing
id: judgment-typing
role: structure
status: plan
derived_from:
- acts/flow-judgement
proof_refs: []
---



The **Judgment Typing** structure encodes the typing judgements `Γ ⊢ t : A` of
the internal judgment calculus as earned judgment triads.

## Definition
- Built from the judgment triad acts (`seed-judgement-triad`, `flow-judgement`)
  over contexts, terms, and types.
- Typing rules (variable, abstraction, application, fixpoint) correspond to
  compositions of these acts along the trace.

## Invariants
- Typing derivations are admissible traces of judgment triads.
- Flow of judgments preserves typing structure.

## Proof
Derived from the judgment triad and flow acts, which encode typing derivations
as traces over the judgment triad carrier. Each typing rule is realised as an
earned composition of these acts.
