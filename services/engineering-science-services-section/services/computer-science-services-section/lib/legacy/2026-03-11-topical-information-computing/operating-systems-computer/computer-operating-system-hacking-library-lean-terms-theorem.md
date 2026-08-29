---

title: "theorem"
description: "A theorem in Lean is a named declaration consisting of a type (the proposition) and a term (the proof)."
aliases:
  - "theorem"
  - "theorems"
date-created: 2026-03-01T00:00:00
keywords:
  - lean
defines:
  - "theorem"
  - "theorems"
---

A theorem in Lean is a named declaration consisting of a type (the proposition) and a term (the proof).
The syntax is:

```lean
theorem name : proposition := proof_term
```

or equivalently in tactic mode:

```lean
theorem name : proposition := by
  tactic₁
  tactic₂
  ...
```

The kernel checks that the proof term has the declared type.
If it does, the theorem is accepted; if not, Lean reports an error.
A theorem declaration differs from a `def` only in that theorems are marked as irrelevant to computation — they contribute type information but are erased at runtime.

Theorems can depend on parameters (universally quantified variables), hypotheses (assumed propositions), and previously proven theorems.
This builds a dependency graph of verified results.
