---
type: theorem
status: sketch
depends-on: [plan, task-cell-system, completion-as-quiescence, lift-task-to-plan, normative-operational-layering]
---

# Plan completion as the meet of subtask completions

A [plan](../objects/plan.md) $P = (T_P, \preceq_P, M_P, \mathcal{S}_P)$ embedded in an [operations settling](../objects/operations-settling.md) $v^{\mathrm{op}}$ is *complete at stage $\tau^*$* if and only if every constituent task $T_i \in T_P$ is complete at some stage $\tau_i \leq \tau^*$, the milestone cells $M_P$ have settled to their target values, and $\tau^*$ is the supremum of the per-task completion stages and the milestone-settlement stage.

## Sketch

(⇐) Suppose every $T_i$ is complete at $\tau_i$ in the [completion-as-quiescence](completion-as-quiescence.md) sense, and $M_P$ has settled by stage $\tau_M$.
Let $\tau^* = \sup_i \tau_i \vee \tau_M$.

By [lift-task-to-plan](../morphisms/lift-task-to-plan.md), each $T_i$'s goal cells appear in $\Phi_P$ via the inclusion $\iota_{G_i}$, and the per-task closure operator coincides with the plan-restricted closure operator on those cells.
Hence the plan-level valuation at $\tau^*$ on $\bigcup_i G_{T_i}$ matches the union of per-task target valuations.
Combined with $M_P$ at target, the plan-completion condition (target valuation on all of $\Phi_P$, stable for $\tau \geq \tau^*$) holds.

(⇒) Suppose the plan is complete at $\tau^*$ in the work-vocabulary sense.
Then by definition every milestone cell carries its target value at $\tau^*$, and the milestone-aggregation rules in $\mathcal{S}_P$ require each subtask's goal cells to carry their targets as antecedent.
By back-propagation through the dependency-ordering rules, every $T_i$'s goal cells must have settled to their targets at some $\tau_i \leq \tau^*$.
By [settling-monotonicity](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), these values are stable for $\tau \geq \tau_i$.
Hence each $T_i$ is complete at $\tau_i$. $\square$

## Substrate-algebraic content

The theorem has a categorical reading: plan completion is the [predication-fiber-algebra](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) *meet* of the per-subtask completions in the knowledge order, lifted to the plan's milestone cells:

$$\mathrm{complete}(P, \tau^*) \;\;=\;\; \Bigl(\bigwedge_i^{(k)} \mathrm{complete}(T_i, \tau_i)\Bigr) \;\wedge_k\; \mathrm{settled}(M_P, \tau^*).$$

This is what justifies treating "all subtasks done plus milestones met" as the canonical plan-completion condition: the meet structure is *forced* by the closure-rule subsystem, not an external aggregation rule.

## Regime-dependent existence

By [regime-of-task](regime-of-task.md), each $T_i$'s completion stage $\tau_i$ exists at the regime determined by $\mathcal{S}_{T_i}$.
The plan's completion stage $\tau^*$ thus exists at the *supremum* of the subtasks' regimes — which can be a strictly higher regime than any individual subtask (a plan whose subtasks are all strict-regime but whose milestone-aggregation rules are non-Scott-continuous can land in a transfinite-bounded regime).

## Corollary: normative residue at plan completion

Per [normative-operational-layering](teaching/explanations/normative-operational-layering.md), each task-dispatch event generates a duty cell on the assigned agent (O→N rule).
Plan completion is *operationally complete* (as defined above) when all goal and milestone cells are at target.
A plan may be operationally complete while carrying *normative residue* — undischarged duty cells from subtasks that were cancelled, abandoned, or completed without explicit duty-discharge records.

**Normative residue.** Let $T_i \in T_P$ be a subtask that was *cancelled* at stage $\tau_c$: the goal cells of $T_i$ are driven to $\mathbf{f}$ (or retired) via the cancellation increment, and the milestone-aggregation rule for the plan accepts the cancellation witness as satisfying $T_i$'s completion condition.
The plan may be operationally complete.
But the duty cell $\langle R^{\mathrm{duty}}_i, \texttt{active-holder}, A_i\rangle = \mathbf{t}$ — generated when $T_i$ was dispatched to agent $A_i$ — remains settled at $\mathbf{t}$ unless a duty-discharge increment is also recorded.

The normative residue at plan-completion is the set of duty cells that are settled at $\mathbf{t}$ without a corresponding duty-discharge record at $\tau^*$:

$$\mathrm{residue}(P, \tau^*) \;=\; \{R^{\mathrm{duty}}_i \;:\; \langle R^{\mathrm{duty}}_i, \texttt{active-holder}, A_i\rangle_{v^{\mathrm{op}}_{\tau^*}} = \mathbf{t} \;\wedge\; \langle R^{\mathrm{duty}}_i, \texttt{discharged}\rangle_{v^{\mathrm{op}}_{\tau^*}} \neq \mathbf{t}\}$$

Operational plan completion ($\mathrm{complete}(P, \tau^*)$) does not imply zero normative residue.
A plan is *normatively clean* at completion iff $\mathrm{residue}(P, \tau^*) = \emptyset$.

**Abandoned-subtask normative residue.** If $T_i$ is abandoned (per [completion-as-quiescence](completion-as-quiescence.md)), the goal cells are quiescent with $\bot$-values on unresolved dimensions.
The duty cell on $A_i$ remains settled at $\mathbf{t}$.
The plan-level milestone-aggregation rule must explicitly account for abandoned subtasks — either accepting the abandonment witness as satisfying $T_i$'s completion condition (with the duty residue noted), or keeping the plan incomplete until an explicit duty-resolution increment is recorded.

**Significance.** The normative-residue corollary makes visible the accountability gap that operational completion can conceal: a plan can be "done" in every operational sense while some agent retains an undischarged duty from a cancelled or abandoned subtask.
The substrate-algebraic content of team accountability after a project ends is exactly the normative-residue set.

## CALM for plan-completion queries

The milestone cells $M_P$ — once settled to their target values — are $\leq_k$-monotone.
By the [predication-settling CALM corollary](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-calm-corollary.md):

- Confirming "is plan $P$ complete?" is coordination-free: any replica that has received the milestone-cell settlements can confirm plan completion locally.
- Confirming "is plan $P$ not yet complete?" requires coordination — it confirms the absence of a milestone-settlement cell.

For normative residue: confirming "does agent $A_i$ have an undischarged duty from plan $P$?" is a positive query if the duty-discharge cell is present and at $\mathbf{f}$ (the duty is explicitly still open).
Confirming "there is *no* normative residue in plan $P$" requires coordination — it confirms the absence of undischarged duty cells across all dispatched agents.

This is the CALM-theoretic content of "project managers can locally confirm project completion; confirming clean normative closure requires coordinated audit."
The gap between operational completion (coordination-free to confirm) and normative cleanness (requires coordination) is the substrate-algebraic source of post-project accountability disputes.

## LES for normative residue at completion

The [truth-knowledge long exact sequence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/truth-knowledge-cohomology-long-exact-sequence.md) applied to the plan's normative-residue sheaf $\mathcal{F}_{\mathrm{res}}$ at completion stage $\tau^*$:

**Normatively clean plan** ($\mathrm{residue}(P, \tau^*) = \emptyset$): $\mathcal{F}^{(\top)}_{\mathrm{res}} = 0$.
All duty cells either have discharge records or were never created.
The LES collapses; $H^n_t \cong H^n_k$.
No normative obstruction.

**Plan with normative residue** (undischarged duty cells at $\tau^*$): the residue cells are not $\top$-valued (they are simply settled at $\mathbf{t}$ without contradicting discharge records).
The inconsistency sheaf $\mathcal{F}^{(\top)}_{\mathrm{res}}$ is zero — there is no *contradiction*, just a *gap*.
The gap is not a LES obstruction but a $H^0_k$ class: the normative residue is visible in $H^0_k(\mathcal{F}^{(k)}_{\mathrm{res}})$ as a non-zero knowledge-cohomology class.

The distinction: LES-obstruction means *contradiction* (both a discharge and non-discharge cell); normative residue means *incompleteness* (a duty cell without any discharge record).
The two failure modes are substrate-algebraically distinguishable.
A disputed discharge (agent claims they discharged a duty, system has no discharge record) produces a $\top$-valued cell and a LES-obstruction.
An undisputed incomplete discharge (agent genuinely did not discharge) produces only a $H^0_k$ class.
