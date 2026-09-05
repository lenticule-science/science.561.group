---
title: Relational Logic Algebra
id: relational-logic-algebra
role: structure
status: plan
derived_from: math/structure/logic-algebra
proof_refs: []
---



Mathematical algebra of recognitions with logical operations (meet, join,
implication) induced from the act of relationlessness.

## Definition
- Carrier: earned [Recognition Carrier](./recognition.md) equipped with a
  partial order `≤` interpreted as entailment/refinement.
- Operations:
  - `⊤` / `⊥`: top/bottom recognitions.
  - `∧`, `∨`: meet/join respecting the order.
  - `⇒`: implication satisfying residuation: `a∧b ≤ c` iff `a ≤ (b ⇒ c)`.
- Morphisms: order-preserving maps that respect the operations.

## Invariants
- Logic algebra laws: commutativity/associativity/absorption/distributivity;
  bottom and top are identities for join/meet; implication is right adjoint to
  meet, inherited from [Relational Logic Algebra](../../../triage/relationality/relationality-slop-2025-04/internal/logic-algebra.md).
- Monotonicity: operations are monotone in all arguments.
- Stability: recognitions closed under these operations remain earned
  recognitions.

## Proof
- Derived from: [Relational Logic Algebra](../../../triage/relationality/relationality-slop-2025-04/internal/logic-algebra.md).
- Uses: [Recognition Carrier](./recognition.md) as the carrier.
- Shows that: the earned logic structure instantiated on recognitions yields
  the logical substrate for classifiers and truth values.
