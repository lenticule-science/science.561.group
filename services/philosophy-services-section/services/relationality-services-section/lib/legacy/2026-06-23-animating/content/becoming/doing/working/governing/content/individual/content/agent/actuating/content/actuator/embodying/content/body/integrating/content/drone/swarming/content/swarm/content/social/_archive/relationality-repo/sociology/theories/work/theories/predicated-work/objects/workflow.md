---
type: definition
class: type-bounded-composition
status: draft
symbol: W
depends-on: [task-cell-system, plan]
realizes: [workflow]
---

# Workflow

The mathematical realization of a [workflow](../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/terms/workflow.md): a directed-graph composition of work units with a single algebraic constraint — *the input cell-pattern type equals the output cell-pattern type*.
A workflow is a quadruple

$$W \;=\; (T_W,\; E_W,\; \tau_{\mathrm{in}},\; \tau_{\mathrm{out}}) \quad\text{with}\quad \tau_{\mathrm{in}} = \tau_{\mathrm{out}} = \tau$$

where:

- $T_W$ — a finite set of work units (each a [task cell system](task-cell-system.md) or a sub-workflow).
- $E_W$ — directed edges between elements of $T_W$.
  Two edge kinds: *dependency edges* (forcing ordering, as in [plan](plan.md)) and *information-flow edges* (an output cell of $T_i$ is referenced by an antecedent in $\mathcal{S}_{T_j}$).
- $\tau_{\mathrm{in}}$ — the *input cell-pattern type*: the cells the workflow consumes, characterized by their predicate-fiber slots and required initial bilattice values.
- $\tau_{\mathrm{out}}$ — the *output cell-pattern type*: the cells the workflow produces.

The algebraic constraint $\tau_{\mathrm{in}} = \tau_{\mathrm{out}}$ — the workflow's boundary type — is what makes workflows compose: two workflows on the same type can be chained.

## The three composition patterns

Per the [workflow term](../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/terms/workflow.md), all workflows are combinations of three patterns:

- **Sequence.** Workflow $W_1$ then $W_2$: $W_2$'s closure rules begin firing only after $W_1$'s output cells settle.
  Realized as an edge from each $W_1$-terminal-task to each $W_2$-initial-task.
- **Branch.** After $W_1$, do $W_2$ if condition $C$ at $\mathbf{t}$, else $W_3$: realized as gating closure rules whose antecedents include $C$'s value.
- **Parallel.** $W_2$ and $W_3$ run concurrently after $W_1$: no edge between $W_2$ and $W_3$, both depend on $W_1$.

## Workflow-as-task

A workflow becomes a task when given a name and completion condition: identify a task cell system $T_W$ whose $G_{T_W}$ is the workflow's output type's "fully settled" pattern, $\mathcal{S}_{T_W} = \bigcup_{T_i \in T_W} \mathcal{S}_{T_i} \cup E_W\text{-rules}$, and the workflow's components become subtasks of $T_W$.
The work vocabulary's identification "a task containing a workflow" is this construction in reverse: a task can declare a workflow as its content.

## Workflow-as-morphism

Workflows over a fixed type $\tau$ form a category $\mathbf{Wf}_\tau$:

- **Objects:** type-$\tau$ cell-pattern configurations.
- **Morphisms:** workflows $W : \tau \to \tau$.
- **Identity:** the trivial workflow $\mathrm{id}_\tau$ — no work units, no edges, input passes through unchanged.
- **Composition:** $(W_2 \circ W_1)$ — the sequence pattern, with $W_1$'s output cells identified with $W_2$'s input cells.
- **Associativity** of composition follows from union-of-closure-rule-subsystems being associative.

The category $\mathbf{Wf}_\tau$ is *non-strict* in a substantive sense: composition produces a workflow whose internal task-set is the disjoint union, and re-composition with a third workflow is associative on the level of task-sets but the closure-rule firing behavior depends on dependency edges that span boundaries.
The substantive theorem on workflow composition is [workflow-composition](../theorems/workflow-composition.md).

## Petri-net analysis

The work vocabulary cites Petri nets as the formal vehicle for workflow analysis (reachability, boundedness, liveness).
In the predicated-work setting, these properties translate:

- **Reachability** of a task $T_i$ in $W$ from input $\tau_{\mathrm{in}}$: there exists a settling trajectory of the operations settling that drives $T_i$'s antecedent-cells into the firing-admissible state.
  Reachability is a settling-quiescence property restricted to $T_i$'s antecedent cells.
- **Boundedness** of intermediate cells: no intermediate cell-pattern accumulates unbounded $\bot \to \mathbf{t}$ assertions.
  By [settling-monotonicity](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), this is automatic in the bilattice setting (cells don't unbounded-accumulate; they settle into $\mathbf{FOUR}$).
- **Liveness** — every task can eventually fire: every $T_i \in T_W$'s antecedent-cells are reachable.
  This is a structural property of $E_W$ (the dependency graph has no orphan dead-ends).

## Workflow vs. plan

The work vocabulary's distinction (workflow = algebraic, plan = planning) renders cleanly:

- A plan $P$ has a name, completion condition, and lifecycle (open/active/completed/etc.).
- A workflow $W$ is just the type-bounded composition; it has no name or completion condition without being attached to a task or plan.
- Plans contain workflows as their internal task-graph; workflows are content within plans.
