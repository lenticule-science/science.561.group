---
name: dispatching-an-inquiry
description: Routes an inquiry work item — looks at whether closure rules can settle the inquiry deterministically and, if not, chains down to dispatching-logical-inference. Use when dispatching-work has identified the work item's kind as inquiry (an open question seeking an answer).
---

## Requirements

- Work item kind is `inquiry`.
- Work item carries `skill:`, `prompt:`, and `target:` fields.

### Inputs

- `workItem` — object with at minimum `{ kind: 'inquiry', skill, prompt, target }`.

## Steps

1. v1: every inquiry chains to logical inference.
  (Future: try deterministic closure-rule firing first; only chain to inference if rules cannot settle.)
2. Call `dispatching-logical-inference` with the work item.
3. Return the response cell to the caller (`dispatching-work`).

## Outcomes

- On success: the response cell from the LLM is returned.
  The kind-dispatcher does not itself write the response to disk; that responsibility belongs to the respond loop or the caller of `dispatching-work`.
- On error: propagated up.
