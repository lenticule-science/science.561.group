---
name: dispatching-a-derivation
description: Routes a derivation work item — looks at whether closure rules can settle the derivation deterministically and, if not, chains down to dispatching-logical-inference. Use when dispatching-work has identified the work item's kind as derivation (a logical deduction from settled premises).
---

## Requirements

- Work item kind is `derivation`.
- Work item carries `skill:`, `prompt:`, and `target:` fields.

### Inputs

- `workItem` — object with at minimum `{ kind: 'derivation', skill, prompt, target }`.

## Steps

1. v1: every derivation chains to logical inference.
  (Future: try deterministic closure-rule firing first; only chain to inference if rules cannot settle.)
2. Call `dispatching-logical-inference` with the work item.
3. Return the response cell to the caller.

## Outcomes

- On success: the response cell from the LLM is returned.
- On error: propagated up.
