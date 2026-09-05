---
name: judgment-evaluate-step
role: operator
derived_from:
- acts/recognize-value
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



Operator describing call-by-value evaluation in the judgment calculus: stepping
inside an evaluation context when the hole contains a value.

## Proof

Sketch: evaluation frames from `Judgment Evaluation Context` locate the hole;
`Judgment Value` recognises values. Define the step relation accordingly and
show it respects the earned evaluation structure.
