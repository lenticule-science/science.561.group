---
title: Context Renewal
id: context-renewal
role: operator
status: plan
inputs: []
outputs: []
transformation:
- return
- value
proof_refs: []
derives-from: acts/renew-context
---



## Definition
- Inputs: baseline remainder from [Baseline Remainder](./baseline-remainder.md) and a context to renew.
- Outputs: renewed context carrying the baseline remainder forward.
- Behaviour: renews a context (via [Renew Context](./renew-context.md)) while preserving bindings and baseline tail.

## Invariants
- Baseline remainder preserved across renewals/extensions.
- Bindings introduced before renewal remain valid afterward.

## Proof
- Derived from: [Renew Context](./renew-context.md).
- Shows that: renewing contexts with baseline tails yields contexts consistent with future extensions and bindings, preserving the baseline remainder.

## Earlier material

## Definition
- Inputs: baseline remainder from [Baseline Remainder](baseline-remainder.md) and a context to renew.
- Outputs: renewed context carrying the baseline remainder forward.
- Behaviour: renews a context (via [Renew Context](renew-context.md)) while preserving bindings and baseline tail.

## Proof
- Derived from: [Renew Context](renew-context.md).
- Shows that: renewing contexts with baseline tails yields contexts consistent with future extensions and bindings, preserving the baseline remainder.
