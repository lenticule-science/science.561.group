---
specialization: is-task-done-result
---

# task-done

`task-done` is the canonical completion-evidence predicate for tasks. A claim `(T, task-done, W)` says task T has completion-evidence W (a witness, not a boolean).

The specialization declaration cascades every `task-done` claim into the parallel `is-task-done-result` fiber with the same value, preserving the structured channels that carry each contribution. Consumers that ask "is this task done?" walk `is-task-done-result` and read the witnessing configuration.
