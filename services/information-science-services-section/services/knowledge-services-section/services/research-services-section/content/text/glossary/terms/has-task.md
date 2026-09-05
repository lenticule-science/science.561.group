---
specialization: tasks
---

# has-task

`has-task` is the inversion-derived back-walk of the `plan` predicate: every `(T, plan, P)` claim at a task subject derives `(P, has-task, <witness>)` at the plan subject (with the Theorem 2 swap+negate value). Specialization cascades the derived claims into the parallel `tasks` fiber at the plan subject, so consumers who walk `(plan-X, tasks, ?)` read the witnessing configuration under a naturally-named predicate without needing to reason about the inversion algebra. Witness presence is the signal; the bilattice value encodes the algebraic transport, not membership.
