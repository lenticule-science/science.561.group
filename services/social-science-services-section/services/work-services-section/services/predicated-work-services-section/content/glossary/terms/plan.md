---
type: definition
class: closure-rule-subsystem
status: draft
symbol: P
depends-on: [task-cell-system, operations-settling, decompose-task]
realizes: [plan]
---

# Plan

The mathematical realization of a [plan](../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/terms/plan.md): a closure-rule-driven coordination of multiple [task cell systems](./task-cell-system.md) under a dependency partial order. A plan is a quadruple

$$P \;=\; (T_P,\; \preceq_P,\; M_P,\; \mathcal{S}_P)$$

where:

- $T_P = \{T_1, \ldots, T_n\}$ — a *finite* set of task cell systems comprising the plan. The work vocabulary's first plan-property (finite commitment) is this finiteness.
- $\preceq_P$ — a partial order on $T_P$, the *dependency order*: $T_i \preceq_P T_j$ iff $T_j$'s closure-rule subsystem references $T_i$'s goal cells in its antecedents. Per the [task term](../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/terms/plan.md)'s third property (goal orientation) and the dependency-DAG requirement, the partial order is acyclic.
- $M_P \subseteq \Phi_W$ — the *milestone cells*: the cells whose joint settlement constitutes plan-level completion. Often $M_P = \bigcup_i G_{T_i}$ (all subtasks' goal cells), but a plan may also have its own plan-level goals (e.g., $\langle P, \texttt{plan-completed-by}, A\rangle$).
- $\mathcal{S}_P \subseteq \mathcal{S}_{\mathrm{op}}$ — the plan's coordination rules. $\mathcal{S}_P$ is the union of the per-task subsystems $\bigcup_i \mathcal{S}_{T_i}$, the dependency-ordering rules, and the milestone-aggregation rules.

## The dependency-ordering rules

For each pair $T_i \prec_P T_j$, the rule

$$\bigwedge_{\phi \in G_{T_i}} v(\phi) = v^*_{T_i}(\phi) \;\Longrightarrow\; \texttt{antecedents of } \mathcal{S}_{T_j} \texttt{ are now admissible}$$

ensures that $T_j$'s closure rules fire only after $T_i$ has settled. This is encoded in the substrate by an explicit gate cell $\langle T_j, \texttt{depends-on-completed}, T_i\rangle$ that must be at $\mathbf{t}$ for $T_j$'s rules to admit antecedents — by [settling-monotonicity](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), once the gate fires, $T_j$ is permanently unblocked.

## Defeasible stability (Bratman 1987)

The work vocabulary's fourth plan-property — defeasibility — is the property that a plan can be *abandoned* or *revised* but not silently dropped. As substrate operations:

- **Plan abandonment** is an increment $\langle P, \texttt{abandoned-by}, A\rangle = \mathbf{t}$ that propagates to abandonment of all tasks in $T_P$ that have not yet settled.
- **Plan revision** is the addition or removal of a task in $T_P$: an increment that either adds $\langle P, \texttt{contains}, T_{n+1}\rangle = \mathbf{t}$ for a new task or $\langle P, \texttt{contains}, T_i\rangle = \mathbf{f}$ for a removal. Revision is a substrate operation that produces witnesses; silent revision is forbidden (a revision-without-witness leaves the substrate in an inconsistent state).

The "reconsideration requires reasons" principle is encoded by the closure rule that any revision-witness must cite a *justification cell* $\langle \texttt{revision-witness}, \texttt{justified-by}, J\rangle = \mathbf{t}$.

## Plan hierarchy (goal → project → plan → task)

A *project* is a plan-of-plans: a plan $P_{\mathrm{project}}$ whose tasks $T_i$ are themselves plans rather than atomic task cell systems. The dependency order, milestone cells, and coordination rules generalize. The hierarchy continues upward: *campaign* contains projects; *goal* is the top-level milestone-set.

## Plan vs. recurrent practice

A plan and a [recurrent practice](./recurrent-practice.md) are distinct: a plan has a single completion (its milestones jointly settle once); a recurrent practice has periodic firing without single completion. A plan with periodic re-execution (e.g., "run this plan every quarter") is a recurrent practice whose per-cycle content is the plan's execution.

## Regime

By the [regime-of-task theorem](../concepts/regime-of-task.md) applied to the plan-level closure-rule subsystem $\mathcal{S}_P$: a plan is in the strict regime if all $\mathcal{S}_{T_i}$ are strict and the dependency-ordering and milestone-aggregation rules are finitary. A plan that includes inquiry-typed tasks (whose subtask-set is itself dynamic) can lift to higher regimes.

## Position in the dispatchable graph

The [dispatch morphism](../morphisms/dispatch.md) operates on individual tasks. A plan's dispatch is the dispatch of its currently-active tasks — those whose dependencies have settled but whose goals have not. The plan's *potential-frontier* at stage $\tau$ is the set $\{T_i \in T_P : \text{dependencies settled, goal not yet settled}\}$. Dispatch consumes from this frontier.
