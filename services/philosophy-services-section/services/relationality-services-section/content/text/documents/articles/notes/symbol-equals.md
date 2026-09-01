---
title: Symbol Equals
id: symbol-equals
role: operator
status: plan
inputs:
id: trace
alias: lhs
- id: trace
  alias: rhs
outputs:
id: recognition
alias: predicate
transformation:
- call
  - literal-equals
  - lhs
  - rhs
proof_refs:
- trace
- literal-equals
---

# Symbol Equals

Raw equality check over head traces, returning a recognition predicate.

## Invariants
- Symbols compare equal only when both tags and payloads match.
- Outputs a boolean runtime value usable for dispatch branching.
