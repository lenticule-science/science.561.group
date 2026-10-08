---
name: officer-task-completion
fusion-left: assigned-to
fusion-right: task-done
fusion-target: officer-task-completion
---

Fuses a task's `assigned-to` claim with its `task-done` claim into an `officer-task-completion` witness at the task subject.
The structured object carries both source claims — which officer was assigned, and what completion witness fired — so the first officer's workload tracking walks one fiber and sees attribution + evidence together.

Same shape as `contribute-to-milestone`: two claims at the same subject fuse via ⊙ into a structured-pair witness in the target fiber.
