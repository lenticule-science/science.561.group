---
type: question
status: open
explores: [decompose-task, task-cell-system]
---

# What closure-rule shapes correspond to non-AND decomposition patterns?

The [decompose-task morphism](../morphisms/decompose-task.md) defines task decomposition with a single composition rule $r_{\mathrm{compose}}$ whose antecedent is the *conjunction* of all subtasks' goal-cell settlements.
This is AND-decomposition: the parent settles iff every subtask settles.

Real decomposition includes patterns the AND-rule does not cover:

- **OR-decomposition**: parent settles iff *any* subtask settles.
  Antecedent is a disjunction, not a conjunction.
- **k-of-n decomposition**: parent settles when at least $k$ of $n$ subtasks settle.
  Antecedent involves cardinality (related to [capacity-as-substrate-property](capacity-as-substrate-property.md)).
- **Sequential decomposition**: subtasks must settle in a specific order; later subtasks' closure rules become active only after earlier subtasks settle.
- **Conditional decomposition**: which subtasks are required depends on values settled at earlier stages — a procedure-typed task whose subtask-set is itself dynamic.
- **Inquiry decomposition**: subtasks emerge during execution; the subtask-set is unknown at task creation.

The work vocabulary's four [work-types](../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/terms/work.md) (process, procedure, derivation, inquiry) suggest a typology — different decomposition patterns may correspond to different work-types.
Whether each pattern admits a closure-rule realization in the bare $\Pi_1$ fragment, or whether richer fragments are needed, determines which work-types remain in the strict-or-Scott-continuous regime.
