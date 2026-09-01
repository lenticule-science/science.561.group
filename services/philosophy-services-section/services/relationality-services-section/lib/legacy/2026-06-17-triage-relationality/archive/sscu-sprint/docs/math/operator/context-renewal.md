---
title: Context Renewal
role: operator
derived_from: acts/renew-context
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



## Definition
- Inputs: baseline remainder from [Baseline Remainder](../structure/baseline-remainder.md) and a context to renew.
- Outputs: renewed context carrying the baseline remainder forward.
- Behaviour: renews a context (via [Renew Context](../acts/renew-context.md)) while preserving bindings and baseline tail.

## Invariants
- Baseline remainder preserved across renewals/extensions.
- Bindings introduced before renewal remain valid afterward.

## Proof
- Derived from: [Renew Context](../acts/renew-context.md).
- Shows that: renewing contexts with baseline tails yields contexts consistent with future extensions and bindings, preserving the baseline remainder.
