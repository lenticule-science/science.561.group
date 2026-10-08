---
title: Judgment Substitution
id: judgment-substitution
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
derives-from:
  - acts/substitution-term
description: Capture-avoiding substitution for judgment-calculus terms, earned by SubstitutionTerm.
---



Capture-avoiding substitution for judgment-calculus terms, earned by
`SubstitutionTerm`.

## Proof

Sketch: `SubstitutionTerm` re-enters evaluation contexts without variable
capture, using the binder structure. Show it respects the earned term/binder
constructors and satisfies the beta rule when combined with evaluation.
