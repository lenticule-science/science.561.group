---
type: definition
class: cell-system
status: draft
symbol: E
depends-on: [task-cell-system, assignment, predication-cell, settling-monotonicity]
realizes: [execution]
see-also: [observation, assignment, completion-as-quiescence]
---

# Execution event

The substrate-entity emitted by an executing office when it produces work-state movement against an [assignment](./assignment.md). Per [execution](../../../terms/execution.md), an execution event is a first-class entity that *concerns* a task without mutating it — the [referencing-entity pattern](../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/concepts/referencing-entity-pattern.md) applied to the execution stage. The task remains thin; the task's effective state at time $t$ is folded from the most-recent-first walk of execution events whose `concerns-task` cell points back at the task per [derived-state-via-walks](../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/concepts/derived-state-via-walks.md).

## Definition

An execution-event cell-system is a triple

$$E = (G_E, \mathcal{S}_E, v^E_0)$$

where:

- $G_E \subseteq \Phi_{\mathrm{op}}$ — the *event claim cells*:
  - $\langle E, \texttt{is-a}, \texttt{execution-event} \rangle$
  - $\langle E, \texttt{concerns-task}, T \rangle$ — the task this event reports against
  - $\langle E, \texttt{under-assignment}, A \rangle$ — the assignment authorizing the work
  - $\langle E, \texttt{by-office}, O \rangle$ — the office that emitted the event
  - $\langle E, \texttt{at}, t \rangle$ — emission timestamp
  - $\langle E, \texttt{state-change}, s \rangle$ — the state transition this event records (e.g., `started`, `paused`, `completed`, `failed`, `produced-artifact`)
  - $\langle E, \texttt{produces}, \alpha \rangle^* $ — zero-or-more artifact references
  - $\langle E, \texttt{failure-diagnosis}, \Phi_F \rangle$ — present iff `state-change = failed`; carries a structured sub-fiber, not a string label

- $\mathcal{S}_E$ — closure rules conditioned on event cells; in particular, the *task-state-derivation* rule that lets a query about $T$'s current state walk all $E_i$ with $\langle E_i, \texttt{concerns-task}, T \rangle$ and fold $\langle E_i, \texttt{state-change} \rangle$ values most-recent-first.

- $v^E_0$ — initial valuation at emission: the schema cells at $\mathbf{t}$, all other cells at $\bot$.

## State is not on the task

A task's `state` is not a cell on the task. Asking "is task $T$ in-progress?" is a walk:

1. Locate execution events $E_i$ with $\langle E_i, \texttt{concerns-task}, T \rangle = \mathbf{t}$.
2. Sort by $\langle E_i, \texttt{at} \rangle$.
3. Read $\langle E_{\mathrm{newest}}, \texttt{state-change} \rangle$.
4. Apply state-machine specialization claims (see [task-cell-system](./task-cell-system.md) lifecycle table) to interpret the result.

Settling-monotonicity is preserved because the walk is over a growing set of cells, never a retraction. Each emitted event is an additive contribution; corrections are emitted as new events whose `state-change` cell supersedes the prior one in the walk's most-recent-first fold.

## Failure as structured sub-fiber, not label

Following Reason and Dekker, the `failure-diagnosis` cell on a failed event holds a sub-fiber $\Phi_F$ whose own cells are predicates like:

- $\langle \Phi_F, \texttt{error-kind}, k \rangle$ where $k \in \{\texttt{slip}, \texttt{lapse}, \texttt{mistake}\}$
- $\langle \Phi_F, \texttt{contributing-factor}, f \rangle^*$ — multiple, drawn from the failure-vocabulary
- $\langle \Phi_F, \texttt{repeat-risk}, \texttt{office} \rangle$ — claims about which offices the diagnosis applies to

This is what makes Reflexion-style learning possible without a runtime layer: subsequent dispatches compose the next candidate office's fiber with the diagnosis sub-fiber under $\odot$, and offices that would repeat the error compose at $\mathbf{f}$ (Prop 2: $\mathbf{f}$ as $\odot$-absorber).

## Algebraic role: events as the source of state, walks as queries

Execution events are append-only; they enter the substrate's log on the execution channel; queries that need task state walk the events rather than reading a cached state cell on the task. This is the substrate-realization side of the [referencing-entity pattern](../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/concepts/referencing-entity-pattern.md) — what makes plan-vs-actual comparison the same operation as plan-extension (the two sides of $\odot \dashv \Rightarrow$, exhibited by [adjudicate-witness-conflict](../morphisms/adjudicate-witness-conflict.md)).

## Position

Execution events are the data the [tracking](./observation.md) stage observes (without altering — see Goodhart discipline) and the data the [review](./finding.md) stage compares against [plan](./plan.md) cells when looking for variance. They are the *raw material* of the post-planning spokes; observations and findings are their derivatives.
