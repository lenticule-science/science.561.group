---
title: Recognition Convolution
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



Combines two recognitions via convolution across flow paths.

## Definition
- Inputs: recognitions `a,b` and flow rules.
- Output: recognition `a ⋆ b` aggregating outcomes of flowing along `a` then `b`
  over admissible paths.

## Invariants
- Associative up to nucleus where flow composes.
- Identity given by neutral recognition if available.

## Proof
- Uses: flow context to define composite effects.
- Produces: convoluted recognition.
- Shows that: recognitions can compose via flow convolution.
