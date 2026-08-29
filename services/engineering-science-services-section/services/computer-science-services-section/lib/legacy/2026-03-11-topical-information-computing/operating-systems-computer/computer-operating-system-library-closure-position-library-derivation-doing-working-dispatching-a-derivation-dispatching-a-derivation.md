---
name: dispatching-a-derivation
description: The derivation-kind branch of dispatching-work — handles work items whose closure-position is derivation. Use when a work item has kind derivation.
specializing: derivation
composes:
  - dispatching-logical-inference
---

One of the four kind-branches under `dispatching-work`.
Derivations (logical deductions from settled premises) may or may not need LLM consultation; v1 always chains to `dispatching-logical-inference`.
Future versions will try closure-rule firing first.
