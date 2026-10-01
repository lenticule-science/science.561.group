---
type: definition
class: cell-system
status: draft
symbol: T
depends-on: [operations-settling, predication-cell, closure-rule-system]
realizes: [task]
name: Task cell system
description: "The mathematical realization of a task: a triple"
---


The mathematical realization of a [task](../../documents/articles/humanities/theories/sociology/theories/work/terms/task.md): a triple

$$T = (G_T, \mathcal{S}_T, v^{T}_0)$$

where:

- $G_T \subseteq \Phi_{\mathrm{op}}$ — a finite set of *goal cells*, the cells whose settled value determines the task's done-ness. Typically $G_T$ contains $\langle T, \texttt{completed-by}, A \rangle$ for some agent variable $A$, plus any task-specific outcome predicates the task's goal description names.
- $\mathcal{S}_T \subseteq \mathcal{S}_{\mathrm{op}}$ — a *task-local closure-rule subsystem*: the rules whose firings are conditional on cells related to $T$ and whose consequents are on cells in $G_T$ or cells that drive $G_T$.
- $v^T_0$ — the *initial valuation* at task creation: $v^T_0(\langle T, \texttt{has-goal}, g\rangle) = \mathbf{t}$ for each $g$ in the task's stated goal; $v^T_0(\langle T, \texttt{decomposes-into}, T_i\rangle) = \mathbf{t}$ for each declared subtask; $v^T_0(\langle T, \texttt{requires-capability}, c\rangle) = \mathbf{t}$ for each declared required capability; $v^T_0(\phi) = \bot$ at all goal cells.

## Operations on task cell systems

- **Decomposition.** A task with declared subtasks $T_1, \ldots, T_n$ has a *parent–subtask refinement*: the parent's goal cells are jointly settled by the subtasks' goal cells under a composition rule (a closure rule on $G_T$ whose antecedent is the conjunction of subtask completion cells).
- **Composition into a workflow.** A workflow $W$ over tasks $T_1, \ldots, T_k$ is a directed acyclic graph whose edges are *cell-flow* relations: an output goal cell of $T_i$ is referenced by the antecedent of a closure rule in $\mathcal{S}_{T_j}$. The workflow's task cell system is the union $T_W = \bigsqcup_i T_i$ with composed closure-rule subsystem $\bigcup_i \mathcal{S}_{T_i}$ and edges encoded by the cross-task antecedent references.

## Lifecycle

The work vocabulary's [task lifecycle](../../../../../../content/text/glossary/terms/lifecycle.md) — open → active → completed — is derived by folding the task's *referencing entities* (assignments, execution-events) together with the bilattice valuation of its goal cells. By the [referencing-entity pattern](../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/flatfile/referencing-entity-pattern/referencing-entity-pattern.md), the dispatch relation lives on its own [Assignment](../../documents/articles/research/2026/07/31/lenticule-import/library/social-sciences/working/_archive/assignment.md) entity fiber, not as an `assigned-to` cell on the task. The Open and potential states are walked from $T$ via reverse-edges per [derived-state-via-walks](../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/derived-state-via-walks/derived-state-via-walks.md), not read from cells on $T$:

- **Open**: No live [Assignment](../../documents/articles/research/2026/07/31/lenticule-import/library/social-sciences/working/_archive/assignment.md) entity references $T$ — either no assignment with `assigns-task: T` exists yet, or every such assignment has $v(\langle A_i, \texttt{retracted}\rangle) = \mathbf{t}$ (or its `discharged-at`/`lapsed-at` cells have settled). The task awaits dispatch.
- **Active**: An assignment $A^*_{T \to A^*}$ exists with `assigns-task: T` and $v(\langle A^*, \texttt{retracted}\rangle) = \bot$, and at least one [ExecutionEvent](execution-event.md) under it carries $v(\langle e, \texttt{state-change}, \texttt{started}\rangle) = \mathbf{t}$, while $v|_{G_T} \neq v^*_T$.
- **Completed**: $v|_{G_T} = v^*_T$ at quiescence (target valuation reached and stable). See [completion-as-quiescence](../../../../../sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/glossary/concepts/completion-as-quiescence.md).
- **Failed**: $v|_{G_T}$ contains an $\mathbf{f}$-valued goal cell at quiescence; no `abandoned-by` cell at $\mathbf{t}$.
- **Abandoned**: $v(\langle T, \texttt{abandoned-by}, A^*\rangle) = \mathbf{t}$ for some $A^*$, regardless of goal cell values. The task's local rules are suspended via an activation-guard cell $\langle T, \texttt{potential-rules-suspended}\rangle = \mathbf{t}$, preventing further rule firings on $G_T$. See [abandonment-and-resumability](../../documents/articles/research/2026/07/31/lenticule-import/library/social-sciences/working/_archive/questions/abandonment-and-resumability.md) for the four abandonment substates (no-progress, partial-completion, partial-progress, failure-then-abandoned).
- **Cancelled**: $v(\langle T, \texttt{cancelled}\rangle) = \mathbf{t}$, asserted by a cascade-cancellation rule when a parent task settles via a sibling subtask in OR-decomposition, or by an explicit cancellation increment. Cancellation is a terminal state like abandonment; the distinction is that cancellation is imposed externally (by the parent's settlement or a governance decision) whereas abandonment is initiated by the task's assigned agent. The activation-guard mechanism applies identically.
- **Suspended** (non-terminal): $v(\langle T, \texttt{suspended-by}, A^*\rangle) = \mathbf{t}$ for some $A^*$, with a corresponding `suspension-epoch` cell. Unlike abandonment, suspension is temporary; a subsequent `suspension-lifted` increment re-activates the task's local rules for the new epoch. See [abandonment-and-resumability](../../documents/articles/research/2026/07/31/lenticule-import/library/social-sciences/working/_archive/questions/abandonment-and-resumability.md) for the epoch-based treatment.

The terminal states are **Completed**, **Failed**, **Abandoned**, and **Cancelled**. Once in a terminal state, a task's goal cells do not change (via the activation-guard suspension). A *resumption* of abandoned work creates a new task $T'$ with `resumes: T` rather than reactivating $T$ itself — settling-monotonicity prevents retracting the `abandoned-by` cell.

The state machine over these states, expressed as closure rules:

| From | To | Rule trigger |
|---|---|---|
| Open | Active | First [Assignment](../../documents/articles/research/2026/07/31/lenticule-import/library/social-sciences/working/_archive/assignment.md) with `assigns-task: T` and `retracted: ⊥`, *and* an [ExecutionEvent](execution-event.md) under it with `state-change: started` |
| Active | Completed | All goal cells reach $v^*_T$ |
| Active | Failed | A goal cell reaches $\mathbf{f}$ at quiescence |
| Active | Abandoned | `abandoned-by` increment asserted by agent |
| Active | Suspended | `suspended-by` increment asserted; epoch created |
| Suspended | Active | `suspension-lifted` increment for current epoch |
| Active or Open | Cancelled | Parent settles via sibling (OR-decomposition) or explicit cancel increment |
| Abandoned | — | Terminal; only $T'$ with `resumes: T` can continue the work |

The work vocabulary's [task lifecycle](../../../../../../content/text/glossary/terms/lifecycle.md) — open → active → completed — is the bilattice valuation of the task's `assigned-to` and goal cells:

- **Open**: $v(\langle T, \texttt{assigned-to}, A\rangle) = \bot$ for all $A$. No assignment witness has arrived.
- **Active**: $v(\langle T, \texttt{assigned-to}, A^*\rangle) = \mathbf{t}$ for some specific agent $A^*$, and $v|_{G_T} \neq v^*_T$.
- **Completed**: $v|_{G_T} = v^*_T$ at quiescence (target valuation reached and stable). See [completion-as-quiescence](../../../../../sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/glossary/concepts/completion-as-quiescence.md).
- **Failed**: $v|_{G_T}$ contains an $\mathbf{f}$-valued goal cell at quiescence.
- **Abandoned**: $v(\langle T, \texttt{abandoned-by}, A^*\rangle) = \mathbf{t}$ for some $A^*$, regardless of goal cell values.
