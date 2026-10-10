---
type: question
status: resolved
resolved-at: 2026-05-04
explores: [assignment, dispatch, task-cell-system]
see-also: [assignment, dispatch]
---

# Reconciling assignment-as-entity vs. assigned-to as a cell on the task (existing dispatch morphism)

The current [dispatch](../morphisms/dispatch.md) morphism note closes with:

> When $\delta(A, T) = \mathbf{t}$ and authority and capacity both hold, the dispatcher's *assignment act* is an increment $u_\tau$ that asserts $\langle T, \texttt{assigned-to}, A\rangle = \mathbf{t}$ at stage $\tau$.

The FARS [referencing-entity pattern](../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/concepts/referencing-entity-pattern.md) — drafted later — explicitly asserts the opposite:

> Assignment is its own substrate entity, not a predicate on the task.
> (...)
> The task's own fiber does not grow an `assigned-to:` predicate; the composition `message(model, <query assigned-to for task-id>)` walks from the task to its assignment entities by following `assigns-task` in reverse.

The two formulations cannot both stand.
The new [assignment](../objects/assignment.md) object adopts the referencing-entity reading; the older dispatch-morphism formulation needs updating, or the new reading needs justification against the older one.

## What the old reading is doing right

The `assigned-to` cell on the task is *useful* for the lifecycle table in [task-cell-system](../objects/task-cell-system.md): the Open → Active transition is gated on $\langle T, \texttt{assigned-to}, A\rangle$ reaching $\mathbf{t}$.
If assigned-to is *not* a cell on the task, the lifecycle table needs reformulation — what cell on the task does the Active state correspond to?

A direct rewrite: Active state is *not* a cell on the task either.
The task's lifecycle state is folded by walking execution events ([execution-event](../objects/execution-event.md)) and assignment entities ([assignment](../objects/assignment.md)).
Open is the absence of any assignment entity pointing at $T$; Active is the presence of an assignment whose `discharged-at`, `retracted`, and `lapsed-at` cells are all at $\bot$ and at least one execution event with `state-change = started` has been emitted under it.

This rewrite preserves the lifecycle semantics without requiring `assigned-to` cells on the task.
The task remains thin; its lifecycle is *derived from referencing entities*, per the FARS [derived-state-via-walks](../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/concepts/derived-state-via-walks.md) discipline.

## What the new reading is doing right

Three reasons the referencing-entity pattern prefers assignment-as-entity:

1. **Audit trail.** An assignment carries `from-sender`, `sent-at`, `authority-bound`, `capability-match`.
  A cell on the task carries only the agent.
  The audit trail of *who dispatched what under what authority* needs the assignment to be its own entity with its own cells.
2. **Hohfeldian invariants.** The four invariants (derivativity, accountability non-transfer, boundedness, revocability) are morphism rules on the assignment fiber.
  If the assignment is just a cell on the task, there is nowhere for the invariants to attach as substrate-content rules — they would have to be hard-coded in the increment-generation layer.
3. **Reassignment and revocation.** Re-assigning a task and revoking an assignment are different operations: revocation withdraws an existing assignment without naming a new assignee; reassignment creates a new assignment that supersedes the old.
  With assignments as entities, both are increments on the assignment fiber.
  With assigned-to as a task cell, revocation requires retracting the cell (non-monotone, contradicts settling-monotonicity) or asserting a "no-longer-assigned" cell that the dispatch must walk past — at which point the task fiber is carrying assignment-history information anyway.

## Resolution direction

Update the [dispatch](../morphisms/dispatch.md) morphism to:

- Compute $\delta(O, T)$ as it currently does (capability matching is unchanged).
- On a $\mathbf{t}$-valued $\delta$, *emit an assignment entity* whose cells carry the dispatch witnesses, rather than asserting `assigned-to` on the task.
- Update the [task-cell-system](../objects/task-cell-system.md) lifecycle table to derive Open/Active states from referencing-entity walks rather than from `assigned-to` cells on the task itself.

This rewrite touches:

- [dispatch.md](../morphisms/dispatch.md) §"Composition into the assignment morphism"
- [task-cell-system.md](../objects/task-cell-system.md) lifecycle table (Open and Active rows specifically)
- Any theorem or example that depends on `assigned-to` being a task-cell

The rewrite is mechanical once it's been decided.
The substantive question this note opens is whether *the referencing-entity discipline applies generally* — whether all references-from-task-to-other-entities should follow the same thin-task pattern — or whether `assigned-to` is exceptional in some way.

## What this question is for

This is a coordination question, not a research question.
The math is unchanged either way; what changes is which entity carries which cells.
Capt. emsenn (or a follow-on session) decides the rewrite, and the affected notes get updated accordingly.
The current state is: the new objects ([assignment](../objects/assignment.md), [execution-event](../objects/execution-event.md), [observation](../objects/observation.md), [finding](../objects/finding.md), [adjustment](../objects/adjustment.md)) are written under the referencing-entity reading, and the older [dispatch](../morphisms/dispatch.md) morphism still uses the pre-pattern reading.
The two read inconsistently until the rewrite happens.

## Resolution (2026-05-04)

Adopted the FARS [referencing-entity pattern](../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/concepts/referencing-entity-pattern.md) throughout.
The thin-task discipline applies generally: the task fiber does not grow predicates that name relationships to other entities; those relationships live as their own entities walked via reverse-edges.
Concretely:

- [`dispatch.md`](../morphisms/dispatch.md) §"Composition into the assignment morphism" now emits an [Assignment](../objects/assignment.md) entity carrying `assigns-task`, `to-office`, `from-sender`, `sent-at`, `authority-bound`, `capability-match` cells, rather than asserting `assigned-to` on the task.
- [`task-cell-system.md`](../objects/task-cell-system.md) lifecycle definitions for **Open** and **Active** are derived by walking referencing assignment entities and execution events; the lifecycle table's `Open → Active` row is triggered by the first assignment-emission plus first execution-event with `state-change: started`.
- [`examples/dispatch-of-a-pr-review.md`](../examples/dispatch-of-a-pr-review.md) updated to show the dispatch increment as an Assignment-entity emission rather than a task-cell assertion.

Other notes referencing `assigned-to` (`theorems/restructure-as-visible-automorphism.md`, `questions/capacity-as-substrate-property.md`, `questions/abandonment-and-resumability.md`, the operations-loop / operations-base / operations-settling objects, and the `_index.md`) use it as an *example predicate name* in broader discussions and remain readable; they may be sharpened in a future pass but are not load-bearing on the cell-vs-entity choice.
