---
title: Equate Judgment
id: equate-judgment
role: operator
status: plan
derived_from:
- acts/normalized-judgement-equivalence
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
---


# Equate Judgment

The **Equate Judgment** operator establishes judgmental equivalence (CIU-style)
over judgment triads.

## Definition
- Input: two judgment triads.
- Output: a judgment triad witnessing their equivalence.
- Behaviour: applies normalized/contextual/witness equivalence acts to show the
  triads are equivalent; closes the loop via recognize-judgment triad.

## Invariants
- Equivalent judgments share witnesses and observational content.
- Equivalence respects head/tail/contextual cases.

## Proof
Derived from the judgment equivalence acts (normalized, contextual, witness),
showing the required cases and returning a triad-level equivalence witness.
