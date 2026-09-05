---
title: Lookup Signature
role: operator
inputs:
- id: trace
  alias: target
outputs:
- id: operator-signature
  alias: signature
transformation:
- call
  - resolve-operator-signature
  - target
proof_refs:
- trace
- operator-signature
- resolve-operator-signature
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Kernel lookup that retrieves the [Operator Signature](../structure/operator-signature.md)
associated with an operator id from the interpreter’s registry.

## Proof
- Uses: the registry mapping operator ids to their signatures.
- Shows that: signatures are available to enforce typing before execution.
