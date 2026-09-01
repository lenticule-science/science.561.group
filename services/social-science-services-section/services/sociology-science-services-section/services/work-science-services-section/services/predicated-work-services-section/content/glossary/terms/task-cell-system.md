---
type: definition
class: cell-system
status: draft
symbol: T
depends-on: [operations-settling, predication-cell, closure-rule-system]
realizes: [task]
---

# Task cell system

The mathematical realization of a [task](../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/terms/task.md): a triple

$$T = (G_T, \mathcal{S}_T, v^{T}_0)$$

where:

- $G_T \subseteq \Phi_{\mathrm{op}}$ — a finite set of *goal cells*, the cells whose settled value determines the task's done-ness. Typically $G_T$ contains $\langle T, \texttt{completed-by}, A \rangle$ for some agent variable $A$, plus any task-specific outcome predicates the task's goal description names.
- $\mathcal{S}_T \subseteq \mathcal{S}_{\mathrm{op}}$ — a *task-local closure-rule subsystem*: the rules whose firings are conditional on cells related to $T$ and whose consequents are on cells in $G_T$ or cells that drive $G_T$.
- $v^T_0$ — the *initial valuation* at task creation: $v^T_0(\langle T, \texttt{has-goal}, g\rangle) = \mathbf{t}$ for each $g$ in the task's stated goal; $v^T_0(\langle T, \texttt{decomposes-into}, T_i\rangle) = \mathbf{t}$ for each declared subtask; $v^T_0(\langle T, \texttt{requires-capability}, c\rangle) = \mathbf{t}$ for each declared required capability; $v^T_0(\phi) = \bot$ at all goal cells.

## Operations on task cell systems

- **Decomposition.** A task with declared subtasks $T_1, \ldots, T_n$ has a *parent–subtask refinement*: the parent's goal cells are jointly settled by the subtasks' goal cells under a composition rule (a closure rule on $G_T$ whose antecedent is the conjunction of subtask completion cells).
- **Composition into a workflow.** A workflow $W$ over tasks $T_1, \ldots, T_k$ is a directed acyclic graph whose edges are *cell-flow* relations: an output goal cell of $T_i$ is referenced by the antecedent of a closure rule in $\mathcal{S}_{T_j}$. The workflow's task cell system is the union $T_W = \bigsqcup_i T_i$ with composed closure-rule subsystem $\bigcup_i \mathcal{S}_{T_i}$ and edges encoded by the cross-task antecedent references.

## Lifecycle

The work vocabulary's [task lifecycle](../../../../../content/glossary/terms/lifecycle.md) — open → active → completed — is the bilattice valuation of the task's `assigned-to` and goal cells:

- **Open**: $v(\langle T, \texttt{assigned-to}, A\rangle) = \bot$ for all $A$. No assignment witness has arrived.
- **Active**: $v(\langle T, \texttt{assigned-to}, A^*\rangle) = \mathbf{t}$ for some specific agent $A^*$, and $v|_{G_T} \neq v^*_T$.
- **Completed**: $v|_{G_T} = v^*_T$ at quiescence (target valuation reached and stable). See [completion-as-quiescence](../concepts/completion-as-quiescence.md).
- **Failed**: $v|_{G_T}$ contains an $\mathbf{f}$-valued goal cell at quiescence.
- **Abandoned**: $v(\langle T, \texttt{abandoned-by}, A^*\rangle) = \mathbf{t}$ for some $A^*$, regardless of goal cell values.
