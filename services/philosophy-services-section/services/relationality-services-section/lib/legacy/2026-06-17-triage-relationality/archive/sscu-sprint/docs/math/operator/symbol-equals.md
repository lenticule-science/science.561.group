---
title: Symbol Equals
role: operator
inputs:
alias: lhs
- id: trace
  alias: rhs
outputs:
alias: predicate
transformation:
- call
  - literal-equals
  - lhs
  - rhs
proof_refs:
- trace
- literal-equals
introduces: operator
part-of: relational-computer
computer-system-type: primitive
---


Raw equality check over head traces, returning a recognition predicate.

## Invariants
- Symbols compare equal only when both tags and payloads match.
- Outputs a boolean runtime value usable for dispatch branching.
