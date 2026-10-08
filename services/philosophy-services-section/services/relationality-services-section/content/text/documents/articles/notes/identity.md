---
title: Identity
id: identity
role: operator
status: plan
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
description: Passes its input value through unchanged.
---


Passes its input value through unchanged. Used to model returns and trivial
flows in nested-array programs.

## Proof
- Uses: no additional structure; identity is the neutral morphism on any
  carrier.
- Shows that: composing with identity yields the same value, enabling `return`
  to be expressed without primitive opcodes.
