---
title: Reducible Environment Carrier
role: structure
derived_from: acts/build-reducible-environment
proof_refs: []
introduces: structure
part-of: relational-computer
computer-system-type: primitive
---



## Definition
- Carrier: logical-relations environments that map variables to reducible terms and support substitution.
- Components: environments built by the act [Build Reducible Environment](../acts/build-reducible-environment.md), pairing contexts with reducible interpretations.

## Invariants
- Closed under substitution: extending the environment with a reducible term preserves reducibility.
- Compatible with typing: environments respect the typing discipline earned in the reducibility construction.

## Proof
- Derived from: [Build Reducible Environment](../acts/build-reducible-environment.md), which constructs the reducibility environment.
- Shows that: the act’s construction already establishes the carrier; enforcing substitution closure and typing compatibility yields the reducible environment structure.
