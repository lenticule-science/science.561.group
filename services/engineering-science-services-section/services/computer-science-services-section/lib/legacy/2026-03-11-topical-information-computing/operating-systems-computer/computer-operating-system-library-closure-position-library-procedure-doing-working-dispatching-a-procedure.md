---
name: dispatching-a-procedure
description: Routes a procedure work item by chaining to dispatching-a-script — procedures are deterministic step-by-step recipes whose bodies are scripts. Use when dispatching-work has identified the work item's kind as procedure.
---

## Requirements

- Work item kind is `procedure`.
- Work item carries `skill:` naming the procedure-skill to invoke, plus the script's input parameters in `parameters:`.

### Inputs

- `workItem` — object with at minimum `{ kind: 'procedure', skill, parameters, target }`.

## Steps

1. Call `dispatching-a-script` with the work item.
2. Return the script result to the caller.

## Outcomes

- On success: the script's structured output is returned.
- On error: propagated up.
