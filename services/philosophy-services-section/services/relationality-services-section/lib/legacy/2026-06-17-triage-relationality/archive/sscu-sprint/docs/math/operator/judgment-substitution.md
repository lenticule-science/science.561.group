---
title: Judgment Substitution
role: operator
derived_from:
- acts/substitution-term
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



Capture-avoiding substitution for judgment-calculus terms, earned by
`SubstitutionTerm`.

## Proof

Sketch: `SubstitutionTerm` re-enters evaluation contexts without variable
capture, using the binder structure. Show it respects the earned term/binder
constructors and satisfies the beta rule when combined with evaluation.
