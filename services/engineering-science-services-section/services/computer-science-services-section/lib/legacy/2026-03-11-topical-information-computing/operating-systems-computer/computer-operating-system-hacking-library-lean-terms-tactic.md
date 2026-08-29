---

title: "tactic"
description: "A tactic is a command that transforms a proof goal into simpler subgoals. Tactics build proof terms incrementally: each tactic takes the current goal state (a type to be inhabited) and produces zero or more new goals, constructing the proof term behind the scenes."
aliases:
  - "tactic"
  - "tactics"
date-created: 2026-03-01T00:00:00
keywords:
  - lean
defines:
  - "tactic"
  - "tactics"
---

A tactic is a command that transforms a proof goal into simpler subgoals.
Tactics build proof terms incrementally: each tactic takes the current goal state (a type to be inhabited) and produces zero or more new goals, constructing the proof term behind the scenes.

In Lean 4, tactic mode is entered with the `by` keyword.
Common tactics include `intro` (introduce a hypothesis), `apply` (apply a lemma), `exact` (supply the exact proof term), `simp` (simplify using lemmas), `rw` (rewrite using an equation), and `cases`/`induction` (case-split or induct on a value).

Tactics are the primary interface for interactive proof construction.
They allow a user to think in terms of logical steps rather than raw proof terms, while the elaborator translates those steps into the fully explicit terms that the kernel checks.
