---
type: definition
class: type-bounded-composition
status: draft
symbol: W
depends-on: [task-cell-system, plan, normative-operational-layering, work-regime]
realizes: [workflow]
title: Workflow
description: "The mathematical realization of a workflow: a directed-graph composition of work units with a single algebraic constraint — the input cell-pattern type equals the output cell-pattern type."
---

# Workflow

The mathematical realization of a [workflow](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/content/humanities/theories/sociology/theories/work/terms/workflow.md): a directed-graph composition of work units with a single algebraic constraint — *the input cell-pattern type equals the output cell-pattern type*.
A workflow is a quadruple

$$W \;=\; (T_W,\; E_W,\; \tau_{\mathrm{in}},\; \tau_{\mathrm{out}}) \quad\text{with}\quad \tau_{\mathrm{in}} = \tau_{\mathrm{out}} = \tau$$

where:

- $T_W$ — a finite set of work units (each a [task cell system](../../../../../../../../../social-science-services-section/services/social-theory-science-services-section/content/text/glossary/terms/task-cell-system.md) or a sub-workflow).
- $E_W$ — directed edges between elements of $T_W$.
  Three edge kinds: *dependency edges* (forcing ordering), *information-flow edges* (an output cell of $T_i$ referenced by an antecedent in $\mathcal{S}_{T_j}$), and *normative-handoff edges* (a normative cell produced by $T_i$'s completion triggers an authority or duty update that governs $T_j$'s execution).
- $\tau_{\mathrm{in}}$ — the *input cell-pattern type*: the cells the workflow consumes, characterized by their predicate-fiber slots and required initial bilattice values.
- $\tau_{\mathrm{out}}$ — the *output cell-pattern type*: the cells the workflow produces.

The algebraic constraint $\tau_{\mathrm{in}} = \tau_{\mathrm{out}}$ — the workflow's boundary type — is what makes workflows compose: two workflows on the same type can be chained.

## The three composition patterns

Per the [workflow term](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/content/humanities/theories/sociology/theories/work/terms/workflow.md), all workflows are combinations of three patterns:

- **Sequence.** Workflow $W_1$ then $W_2$: $W_2$'s closure rules begin firing only after $W_1$'s output cells settle.
  Realized as an edge from each $W_1$-terminal-task to each $W_2$-initial-task.
- **Branch.** After $W_1$, do $W_2$ if condition $C$ at $\mathbf{t}$, else $W_3$: realized as gating closure rules whose antecedents include $C$'s value.
- **Parallel.** $W_2$ and $W_3$ run concurrently after $W_1$: no edge between $W_2$ and $W_3$, both depend on $W_1$.

## Normative-handoff edges

The third edge kind in $E_W$ — normative-handoff edges — is the substrate-algebraic content of authority and duty transfers at workflow boundaries.
Per [normative-operational-layering](../../../../../../../../../social-science-services-section/services/social-theory-science-services-section/content/text/glossary/concepts/normative-operational-layering.md), tasks generate and consume normative cells (O→N and N→O rules).
When two tasks are connected by a workflow boundary, the normative cells produced by $T_i$ may be the normative antecedents of $T_j$'s closure rules.

Two canonical normative-handoff patterns:

**Approval handoff.** $T_i$ is an approval task; its completion produces a jural-relation cell $\langle R^{\mathrm{power}}, \texttt{scope-action}, \texttt{proceed-with-}T_j\rangle = \mathbf{t}$.
The normative-handoff edge from $T_i$ to $T_j$ carries this power cell: $T_j$'s dispatch-eligibility rule reads $R^{\mathrm{power}}$ as a required-authority cell ($\delta^N$ dimension).
Without the approval, $T_j$'s authority section is $\bot$ and dispatch is indeterminate.

**Accountability handoff.** $T_i$ is completed by agent $A_1$ with accountability for outcome $O$; the completion generates a duty-discharge for $A_1$ and simultaneously a duty-transfer to $A_2$ for the next stage $T_j$ (e.g., a code review that clears the author and creates a review-responsibility on the reviewer).
The normative-handoff edge carries the duty-transfer increment from $T_i$'s completion to $T_j$'s initial state.

Normative-handoff edges are *additional structure* beyond dependency and information-flow edges: they make the workflow's authority and accountability structure visible as a graph over the workflow's task topology, not just as a metadata annotation.

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
The substantive theorem on workflow composition is [workflow-composition](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/glossary/concepts/workflow-composition.md).

## Regime of a workflow

The regime of a workflow $W$ is the regime of the closure-rule subsystem $\mathcal{S}_W = \bigcup_{T_i \in T_W} \mathcal{S}_{T_i} \cup \mathcal{S}_{E_W}$ where $\mathcal{S}_{E_W}$ encodes the edges.
Per [work-regime](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/concepts/work-regime.md):

- A workflow whose tasks are all strict-regime and whose dependency/handoff rules are finitary is in the *strict regime*.
  Completion is always computable in bounded time.
- A workflow with dynamic task-addition (inquiry-typed tasks that generate subtasks mid-execution) lifts to Scott-continuous or higher.
- A workflow whose normative-handoff edges carry limit-aggregating antecedents (e.g., the approval gate requires evidence from all prior workflow instances) lifts to transfinite-bounded.

The workflow's regime is bounded by the most complex regime among its constituent tasks and edges — the supremum of regimes, not the maximum (a single transfinite-bounded subtask lifts the whole workflow's regime even if the other subtasks are strict).

## Petri-net analysis

The work vocabulary cites Petri nets as the formal vehicle for workflow analysis (reachability, boundedness, liveness).
In the predicated-work setting, these properties translate:

- **Reachability** of a task $T_i$ in $W$ from input $\tau_{\mathrm{in}}$: there exists a settling trajectory of the operations settling that drives $T_i$'s antecedent-cells into the firing-admissible state.
  Reachability is a settling-quiescence property restricted to $T_i$'s antecedent cells.
- **Boundedness** of intermediate cells: no intermediate cell-pattern accumulates unbounded $\bot \to \mathbf{t}$ assertions.
  By [settling-monotonicity](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/content/humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), this is automatic in the bilattice setting (cells don't unbounded-accumulate; they settle into $\mathbf{FOUR}$).
- **Liveness** — every task can eventually fire: every $T_i \in T_W$'s antecedent-cells are reachable.
  This is a structural property of $E_W$ (the dependency graph has no orphan dead-ends).

## CALM and coordination-free workflow-boundary admissibility

The dependency-gate cells in $E_W$ — the cells that gate a downstream task's admissibility once an upstream task completes — are $\leq_k$-monotone.
By the [predication-settling CALM corollary](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/formalization/infomaterial/lib/infomaterial/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-calm-corollary.md):

- Confirming "is the gate from $T_i$ to $T_j$ open?" is coordination-free: any replica with a local snapshot of $T_i$'s completion cells can confirm that $T_j$ is admissible.
- Confirming "is $T_j$ still blocked at this gate?" requires coordination.

The approval-handoff pattern benefits specifically: once the approval task $T_i$ completes and the power cell $\langle R^{\mathrm{power}}, \texttt{scope-action}, \texttt{proceed-with-}T_j\rangle = \mathbf{t}$ is settled, any node can locally confirm that $T_j$ is authorized to proceed.
Distributed workflow execution — where multiple worker nodes each take tasks from the frontier — is CALM-active: each node independently confirms gate-open status without central authority.

The accountability-handoff duty-transfer is the anti-monotone case: confirming that the prior agent's duty has been fully discharged requires coordination (confirming the absence of unresolved obligation).
The positive side (confirming new duty is in place) is coordination-free.

## Temporal BC for branching workflows

A branching workflow (after $W_1$, do $W_2$ if $C$ else $W_3$) produces a pseudo-pullback diagram in the [temporal 2-category](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/temporal-2-category/temporal-2-category.md) $\mathbf{T}(\mathcal{C}_{\mathrm{op}}, \lambda)$:

$$\mathbf{T}(\mathcal{C}_{W_2}) \leftarrow \mathbf{T}(\mathcal{C}_{W_1}) \to \mathbf{T}(\mathcal{C}_{W_3})$$

The [temporal Beck-Chevalley condition](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/temporal-2-category/references/temporal-beck-chevalley.md) holds for this branch iff the branching condition $C$ is settled in a way that commutes with the fiber-change across the branch — meaning: whether $W_2$ or $W_3$ executes does not affect the shared cells that precede the branch in $W_1$.
BC holds for well-formed branches (the condition cell $C$ settles independently of $W_1$'s internal cells; the two branch paths produce compatible settling on the cells that converge after the branch).

BC fails when the branching condition is *not* independent of the workflow's shared cells: a branch that conditions on a cell that $W_1$ is still actively settling has a dependency that violates BC.
Substrate-algebraically detectable: the condition cell's settling is not quiesced before $W_1$'s completion, producing a non-invertible 2-cell at the pseudo-pullback.
This is the temporal-2-category signature of a *race condition* in branching workflow execution.

## Workflow vs. plan

The work vocabulary's distinction (workflow = algebraic, plan = planning) renders cleanly:

- A plan $P$ has a name, completion condition, and lifecycle (open/active/completed/etc.).
- A workflow $W$ is just the type-bounded composition; it has no name or completion condition without being attached to a task or plan.
- Plans contain workflows as their internal task-graph; workflows are content within plans.

## Earlier material

- $T_W$ — a finite set of work units (each a [task cell system](../../../../../../../../../social-science-services-section/services/social-theory-science-services-section/content/text/glossary/terms/task-cell-system.md) or a sub-workflow).
- $E_W$ — directed edges between elements of $T_W$. Two edge kinds: *dependency edges* (forcing ordering, as in [plan](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/glossary/terms/plan.md)) and *information-flow edges* (an output cell of $T_i$ is referenced by an antecedent in $\mathcal{S}_{T_j}$).
- $\tau_{\mathrm{in}}$ — the *input cell-pattern type*: the cells the workflow consumes, characterized by their predicate-fiber slots and required initial bilattice values.
- $\tau_{\mathrm{out}}$ — the *output cell-pattern type*: the cells the workflow produces.
