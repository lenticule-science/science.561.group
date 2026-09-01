---
name: identity
role: operator
inputs:
- id: trace
  alias: value
outputs:
- id: trace
  alias: value
transformation:
- value
proof_refs:
- trace
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Passes its input value through unchanged. Used to model returns and trivial
flows in nested-array programs.

## Proof
- Uses: no additional structure; identity is the neutral morphism on any
  carrier.
- Shows that: composing with identity yields the same value, enabling `return`
  to be expressed without primitive opcodes.
