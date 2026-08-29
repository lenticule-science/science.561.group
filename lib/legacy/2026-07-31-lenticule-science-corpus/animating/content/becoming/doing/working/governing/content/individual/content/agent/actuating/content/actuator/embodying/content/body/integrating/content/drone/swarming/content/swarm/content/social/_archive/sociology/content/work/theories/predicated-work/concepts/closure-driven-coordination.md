---
type: concept
class: semantic-anchor
status: draft
depends-on: [operations-settling, workflow-composition, witness-as-increment, operations-base]
---

# Closure-driven coordination

The principle that coordination among work-units — tasks within a plan, plans within a workflow, agents within a recurrent practice — is realized by *closure rules in the operations settling* rather than by external scheduling, control flow, or message passing.

Two work-units coordinate, in the predicated-work sense, when there is a closure rule $\sigma \in \mathcal{S}_{\mathrm{op}}$ whose antecedent reads cells of one unit and whose consequent writes cells of the other.
The coordination relation is then *implicit in the closure-rule subsystem*: any two units whose cells are linked by some chain of closure-rule antecedent/consequent edges coordinate, transitively, in the closure-rule-language sense.

The contrast: a *push-based* coordination model (a scheduler tells the next unit to start) is a meta-level addition to the substrate.
The closure-driven account dissolves the meta-level: the scheduler is not a separate actor but a *projection* of the closure-rule subsystem onto cells expressing readiness, dispatch, and start-events.
Per [witness-as-increment](../morphisms/witness-as-increment.md), every coordination event is an increment; every coordination rule is a closure rule.

This is what makes [workflow-composition](../theorems/workflow-composition.md) a strict monoidal *category* result rather than a process-algebra result: the algebra is the closure-rule subsystem's union and the cell-pattern boundary, both substrate-native.

## Coordination as a presheaf-stalk relation

In the [knowledge-presheaf](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling-category.md) view, each work-unit $T_i$ corresponds to a sub-settling — a section of the operations settling over the sub-base of cells relevant to $T_i$.
Coordination between $T_i$ and $T_j$ is a *cell-flow relation* from the output stalk of $T_i$ to the input stalk of $T_j$: the closure rule $\sigma$ has an antecedent atom over $T_i$'s cells and a consequent atom over $T_j$'s cells.

Under the workflow-composition embedding of $\mathbf{Wf}_{B_{\mathrm{op}}}$ into the knowledge-presheaf category, a workflow's dependency edges are exactly these inter-stalk cell-flow relations.
The workflow's strict monoidal structure (sequence as composition, parallel as tensor) corresponds to: - **Sequential coordination**: a cell-flow relation from $T_i$'s output stalk to $T_j$'s input stalk — $T_j$ waits on $T_i$. - **Parallel coordination**: no inter-stalk cell-flow relations — $T_i$ and $T_j$ operate on disjoint sub-bases. - **Fan-out**: $T_i$'s output stalk has cell-flow relations to multiple downstream stalks — completion of $T_i$ enables multiple successors. - **Fan-in** (AND-join): a closure rule whose antecedent spans cells from multiple upstream stalks — all predecessors must complete before the successor fires.

The four coordination patterns from workflow process algebra (sequence, parallel, fan-out, fan-in) are all expressible as cell-flow relations in Π₁ closure rules — no richer fragment is needed.

## CALM and the monotone coordination property

Closure-driven coordination has a deep connection to the CALM (Consistency As Logical Monotonicity) result from distributed systems ([Hellerstein et al., 2010](../../../../../../../../../../../theories/math/theories/computing/theories/distributed-systems/texts/calm-theorem.md)):

**CALM theorem (informal):** A distributed computation is coordination-free (consistent without inter-replica messaging) if and only if it is expressible in a monotone logic.

The bilattice-substrate's coordination is monotone in the knowledge order $\leq_k$: every closure rule fires only when its antecedent cells have reached sufficient $\leq_k$ values, and its consequent raises $\leq_k$ values, never lowering them (by the inflationary property of closure operators).
This is exactly the monotone logic CALM identifies as the coordination-free fragment.

**Implication for predicated-work:** All Π₁ closure-rule coordination is *monotone* in the knowledge order.
A working community running Π₁ coordination rules is CALM-compatible: two agents with identical initial valuations and identical increment sequences will converge to the same settled valuation, without coordinating on the order of their closure-rule applications.
The coordination is *implicit* in the shared closure-rule subsystem and shared increment sequence, not in inter-agent messaging.

The CRDT literature makes this concrete: a CRDT (Conflict-free Replicated Data Type) is a bilattice-valued state machine whose operations are monotone in the join-semilattice order — exactly a closure-driven settling in the knowledge order.
The [CRDT chapter](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/prose/teaching/explanations/crdts-and-calm.md) of the math program makes the formal correspondence explicit.

**The Mayer–Vietoris consequence.** By [CRDT-convergence-via-Mayer-Vietoris](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/crdt-convergence-via-mayer-vietoris.md), multi-replica operations settlings (distributed teams running the same closure-rule system) converge to a joint fixed point via Mayer–Vietoris-style pasting of sub-settlings.
This is the formal substrate-algebraic content of "teams following the same charter and recording work in a shared event log will reach consistent operational state without needing a central coordinator."

## Coordination failures

Closure-driven coordination has two substrate-detectable failure modes:

**Antecedent mismatch.** A coordination rule $\sigma$ has antecedent cells belonging to $T_i$, but $T_i$'s cells never settle to the required values (the task fails, is abandoned, or is blocked). $\sigma$'s consequent never fires; $T_j$ is never activated.
This is a *deadlock* in traditional process-algebra terms, rendered substrate-algebraically as: the activation-permitted cell $\langle T_j, \texttt{activation-permitted}\rangle$ remains at $\bot$ because $\sigma$'s antecedent is never satisfied.

Substrate-detectable: the audit log shows $T_j$'s activation-permitted cell never left $\bot$ while $T_i$'s goal-cells show non-completion.
The coordination failure is visible in the cell history.

**Consequent collision.** Two coordination rules $\sigma_1$, $\sigma_2$ have consequents over the *same* downstream cell $c$ of $T_k$, asserting $\mathbf{t}$ and $\mathbf{f}$ respectively.
The joint LFP produces $c = \top$.
This is a *coordination conflict*: two upstream units are driving a downstream cell to contradicting values.

Substrate-detectable: the $\top$ on cell $c$ is a repair condition that the audit log records with its producing rules, identifying which upstream units' coordination rules conflicted.
The governance process then adjudicates.
Coordination conflicts are not silent failures; they are surfaced as $\top$-marked cells in the settling.

## Non-monotone coordination and its cost

Some coordination patterns are non-monotone: cancellation (reducing a cell's value), preemption (overriding a prior commitment), retraction (withdrawing a witness).
Non-monotone operations cannot be expressed in the closure-rule fragment and require either: 1.
The *epoch-based* pattern (from [capacity-as-substrate-property](questions/capacity-as-substrate-property.md) and [abandonment-and-resumability](questions/abandonment-and-resumability.md)): non-monotone operations are encoded as new timestamped cells, with the semantic of "current value" derived by reading the most recent epoch's cells.
Monotone in the extended cell-set.
2.
External coordination outside the closure-rule system: a separate process that rewrites cells.
This breaks the CALM property — external coordination is precisely the messaging that CALM shows is avoidable for monotone computations.

The predicated-work theory's commitment to epoch-based encoding for non-monotone operations (task cancellation, suspension, load change) is the structural commitment to staying within the CALM-compatible monotone fragment.
The cost is additional cell overhead (epoch markers); the benefit is coordination-freedom and the Mayer–Vietoris convergence guarantee.

## Where used

- [workflow](../objects/workflow.md) — the closure-rule subsystem whose dependency edges are coordination.
- [plan](../objects/plan.md) — the coordination of multiple task-cell systems.
- [workflow-composition](../theorems/workflow-composition.md) — the categorical structure on closure-driven coordinations.
- [operations-settling](../objects/operations-settling.md) — the settling that hosts all coordination rules.
- [decompose-task](../morphisms/decompose-task.md) — decomposition patterns are coordination patterns between parent and subtask.
