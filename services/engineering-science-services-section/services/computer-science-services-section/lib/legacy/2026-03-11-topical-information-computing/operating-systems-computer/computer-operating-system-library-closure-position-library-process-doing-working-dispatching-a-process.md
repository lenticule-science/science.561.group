---
name: dispatching-a-process
description: Routes a process work item by chaining to dispatching-a-script — processes are continuous activities (respond loops, watchers, daemons) implemented as scripts. Use when dispatching-work has identified the work item's kind as process.
---

## Requirements

- Work item kind is `process`.
- Work item carries `skill:` naming the process-skill to invoke, plus the script's input parameters in `parameters:`.

### Inputs

- `workItem` — object with at minimum `{ kind: 'process', skill, parameters, target }`.

## Steps

1. Call `dispatching-a-script` with the work item.
2. Return the script result to the caller.

## Outcomes

- On success: the script's structured output is returned (for processes that run-to-completion, the final state; for long-running processes, the start ack and a handle).
- On error: propagated up.
