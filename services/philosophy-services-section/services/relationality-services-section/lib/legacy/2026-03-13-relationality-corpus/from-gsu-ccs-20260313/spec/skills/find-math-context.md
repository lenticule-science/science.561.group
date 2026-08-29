---
name: find-math-context

description: "Returns the math-layer context for X by calling skills/find-context.md and extracting only the math_context output. Use when only the math context is needed, not the full cross-layer context."
skill-closure-kind: process
---

*Process — no branching. Execute each line.*

Given: X.

1. Run process: `skills/find-context.md` with X.
2. Output `result.math_context` only.
