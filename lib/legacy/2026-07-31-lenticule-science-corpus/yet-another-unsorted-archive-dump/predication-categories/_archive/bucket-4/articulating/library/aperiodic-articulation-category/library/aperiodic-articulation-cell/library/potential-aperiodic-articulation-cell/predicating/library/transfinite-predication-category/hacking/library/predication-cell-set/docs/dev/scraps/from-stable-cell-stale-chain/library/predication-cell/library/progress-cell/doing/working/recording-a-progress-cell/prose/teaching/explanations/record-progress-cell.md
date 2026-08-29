# record-progress-cell — theory bridge

A task is a cell-system $T = (G_T, \mathcal{S}_T, v^T_0)$. This skill writes a single $v$ assignment — one observed predication. The bilattice value is from Belnap-Dunn 4-valued logic:

- `b` — bottom/unknown: no information yet
- `t` — true: confirmed by evidence or process
- `f` — false: definitively refuted
- `top` — contradictory: conflicting evidence

Multiple cells accumulate as the task's settling history. `rollup-progress` and `audit-task-trajectory` consume these to derive the task's overall trajectory stage.

A progress cell is typically used to record: a closure-rule premise, an outcome witness, or a partial-completion fact.
