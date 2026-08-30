---
type: morphism
class: embedding
status: draft
depends-on: [task-cell-system, plan, operations-settling, normative-operational-layering]
---

# Lift task to plan

The canonical embedding $\iota : T \hookrightarrow P$ of a [task cell system](../objects/task-cell-system.md) $T$ into a [plan](../objects/plan.md) $P$ that contains it. The morphism witnesses the structural relation "$T$ is a subtask of $P$" as a substrate-algebraic embedding rather than a metadata pointer.

## Data

For $T = (G_T, \mathcal{S}_T, v^T_0)$ and $P = (T_P, \preceq_P, M_P, \mathcal{S}_P)$ with $T \in T_P$, the lift $\iota$ comprises three components:

- **Goal-cell inclusion.** $\iota_G : G_T \hookrightarrow \Phi_P$, the inclusion of $T$'s goal cells into the plan's full cell-set $\Phi_P = \bigcup_i G_{T_i} \cup M_P$.
- **Closure-rule inclusion.** $\iota_\mathcal{S} : \mathcal{S}_T \hookrightarrow \mathcal{S}_P$, the subset inclusion of $T$'s rules into the plan's coordination rules — well-defined because $\mathcal{S}_P = \bigcup_i \mathcal{S}_{T_i} \cup \mathcal{S}_{\mathrm{dep}} \cup \mathcal{S}_{\mathrm{milestone}}$ by definition.
- **Initial-valuation restriction.** $v^P_0|_{G_T} = v^T_0$, requiring that the plan's initial valuation agrees with the task's on the task's goal cells.

## Properties

**Functoriality of restriction.** The plan-level operations settling $v^P$ restricted to $G_T$ via $\iota_G^*$ recovers exactly the task-level operations settling $v^T$ — provided the dependency-ordering rules of $\mathcal{S}_{\mathrm{dep}}$ involving $T$ have already fired (i.e., $T$ is dispatch-ready in the plan). When $T$'s prerequisite tasks have settled their goal cells to the values $\mathcal{S}_{\mathrm{dep}}$ requires, the task's local closure operator and the plan's restricted closure operator coincide.

**Compositionality.** For a task $T$ in a plan $P$, and the plan $P$ in a workflow $W$, the composite lift $T \hookrightarrow P \hookrightarrow W$ equals the direct lift $T \hookrightarrow W$ obtained by reading $T$ as a workflow-level task. This is the substrate-algebraic content of "subtasks compose."

**Regime preservation.** The lift $\iota$ is regime-compatible: if $T$ is in the strict regime, its embedding into $P$ remains strict-regime on $G_T$-restricted cells. The plan's coordination rules ($\mathcal{S}_{\mathrm{dep}}$, $\mathcal{S}_{\mathrm{milestone}}$) may lift the *plan*'s regime above the task's individual regime (a plan whose milestone-aggregation depends on all prior subtasks is transfinite-bounded even if each subtask is strict), but the task itself, restricted to its own goal-cells, stays in its declared regime.

## Normative cells lifted with the task

When $T$ carries normative cells — specifically, when the task assignment rule has fired and created a duty cell $\langle R_{\mathrm{duty}}, \texttt{active-holder}, A\rangle = \mathbf{t}$ (per the O→N rule type from [normative-operational-layering](teaching/explanations/normative-operational-layering.md)) — the lift $\iota$ carries those normative cells into $P$ as well.

The plan-level operations settling $v^P$ restricted to the normative cells associated with $T$ recovers the task-level duty and authority cells. This is important for plan-level accountability: when a plan completes (by [plan-completion-as-meet](../theorems/plan-completion-as-meet.md)), each subtask's completion implies the associated duty has been discharged. Abandoned or cancelled subtasks carry *un-discharged duty cells* into the plan's settled state — a substrate-visible accountability gap.

The plan's [milestone cells](../objects/plan.md) may include normative-resolution cells: cells asserting that the duties associated with each subtask have been discharged or explicitly released. When a plan completes with some duties undischarged, the normative audit trail records the gap.

## Activation guard on suspended tasks

If a subtask $T$ is suspended (activation-permitted cell at $\bot$, per [abandonment-and-resumability](questions/abandonment-and-resumability.md)), the lift $\iota$ still embeds $T$'s closure rules into $P$. But the activation-guard antecedent conjunct on $T$'s lifecycle rules means those rules don't fire, and $T$'s goal cells don't advance. The plan-level settle then has a "frozen" subtask — a subtask whose goal cells are at $\bot$ while the plan is otherwise settling.

The plan's dependency rules detect this: if $T$'s successor subtask $T'$ has $T$'s goal-cell completion as an antecedent (dependency edge $T \to T'$), and $T$'s goal cells are frozen, then $T'$'s activation-permitted cell remains at $\bot$ as well (the dependency rule's antecedent is unsatisfied). The plan-level settle propagates the suspension forward through the dependency graph — a cascade halt through the plan's downstream subtasks.

## Where used

- [plan-completion-as-meet](../theorems/plan-completion-as-meet.md) — uses $\iota_G$ to identify the cells whose meet is the plan-completion condition.
- [workflow-composition](../theorems/workflow-composition.md) — uses lift-compositionality to build the monoidal structure.
- [closure-driven-coordination](teaching/explanations/closure-driven-coordination.md) — the lift exposes the inter-stalk cell-flow relations that constitute coordination.
