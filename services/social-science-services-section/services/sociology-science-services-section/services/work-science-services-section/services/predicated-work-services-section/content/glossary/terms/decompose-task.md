---
type: morphism
class: refinement
status: draft
depends-on: [task-cell-system, operations-settling, predicate-specialization]
realizes: [decomposition, subtask]
aliases:
  - Decompose task
---

# Decompose task

The morphism that takes a parent task cell system $T$ with declared subtasks $T_1, \ldots, T_n$ to the joint cell system $\bigsqcup_i T_i$ with a parent-completion closure rule.

## Definition

Given a parent task $T = (G_T, \mathcal{S}_T, v^T_0)$ and declared subtasks $T_i = (G_{T_i}, \mathcal{S}_{T_i}, v^{T_i}_0)$ for $i = 1, \ldots, n$, the *decomposed task system* $\mathrm{Dec}(T) = (G_T, \mathcal{S}_T \cup \bigcup_i \mathcal{S}_{T_i} \cup \{r_{\mathrm{compose}}\}, v^T_0 \vee_k \bigvee_{k} v^{T_i}_0)$ where the *composition rule* $r_{\mathrm{compose}}$ is a closure rule on $G_T$:

$$r_{\mathrm{compose}}: \bigwedge_{i=1}^{n} \bigl(\bigwedge_{\phi \in G_{T_i}} v(\phi) = v^*_{T_i}(\phi)\bigr) \;\Longrightarrow\; \bigwedge_{\phi \in G_T} v(\phi) \geq_k v^*_T(\phi)$$

— the parent's goal cells settle to their target values once every subtask's goal cells have settled to theirs.

## Acyclicity

The decomposition graph (parent → subtasks → sub-subtasks → ...) must be acyclic — the math's settling-monotonicity property forces this: a cyclic decomposition would require a cell's value to depend on itself through closure, which is admissible only as a fixed-point condition (which collapses to "no progress"). Acyclicity is a structural commitment of the work vocabulary's [task](../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/terms/task.md) (subtasks compose hierarchically), realized as a math property here.

## Settling regime under decomposition

Decomposition preserves regime: if every $\mathcal{S}_{T_i}$ is in the strict regime and $\mathcal{S}_T$ is in the strict regime, the composed system $\mathcal{S}_T \cup \bigcup_i \mathcal{S}_{T_i} \cup \{r_{\mathrm{compose}}\}$ is in the strict regime (finite union of finite-stabilization systems, plus one finitary composition rule). For Scott-continuous, transfinite-bounded, and aperiodic regimes, the regime of the composed system is the maximum regime of any component plus the regime of $r_{\mathrm{compose}}$.

The composition rule itself is $\Pi_1$ (its antecedent is a finite conjunction of cell-value equalities). It does not introduce non-Scott-continuous content. Hence decomposition does not lift a system *out of* its component regimes; it remains in the maximum.

## What the decomposition does *not* do

It does not commit to a specific *order* of subtask execution. The composition rule fires only when *all* subtasks have settled; it is silent on which one settles first. Sequential vs. concurrent execution is encoded by [`depends-on`](../../../../../../../../../../library/theories/humanities/theories/sociology/theories/work/terms/depends-on) cells between subtasks (separately from the parent–subtask relationship), which create additional closure rules forbidding $T_j$'s goal cells from settling before $T_i$'s.

## Earlier material

The AND-composition rule is the base case.
The [decomposition-patterns question](../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/content/social/_archive/sociology/content/work/theories/predicated-work/code/transformers/questions/decomposition-patterns.md) works out the full family; the main variants expressible within the closure-rule language are:

The parent settles when *any* subtask settles.
Realized as a family of $n$ rules, one per subtask — the disjunctive effect arises from multiple sufficient rules, each $\Pi_1$:

$$r_{\mathrm{OR},i}: \bigwedge_{\phi \in G_{T_i}} v(\phi) = v^*_{T_i}(\phi) \;\Longrightarrow\; \bigwedge_{\phi \in G_T} v(\phi) \geq_k v^*_T(\phi) \quad \text{for each } i = 1, \ldots, n$$

No new closure-rule fragment is required beyond the $\Pi_1$ rules already used in AND-composition.
The decomposed system $\mathrm{Dec}^{\mathrm{OR}}(T)$ replaces the single $r_{\mathrm{compose}}$ with $n$ separate rules, each individually sufficient.

**Regime:** identical to the AND case — strict if all component systems are strict. **Orphaned subtasks:** once the parent settles via subtask $T_i$, sibling subtasks $T_j$ ($j \neq i$) may continue firing their local rules.
An optional cascade-cancellation rule can assert $\langle T_j, \texttt{cancelled}\rangle = \mathbf{t}$ when the parent settles, which (via activation guards on $\mathcal{S}_{T_j}$) stops further rule firings on siblings.
The `cancelled` state is not currently named in the [task-cell-system lifecycle](../../../../../../../../social-theory-science-services-section/content/text/glossary/terms/task-cell-system.md) — it should be added as a terminal state alongside `completed`, `failed`, and `abandoned`.

Subtask $T_j$ may not begin settling until subtask $T_i$ has settled (for each edge $i \to j$ in the sequence order).
Realized by *activation guards*: a cell $\langle T_j, \texttt{activation-permitted}\rangle$ is asserted by the rule

$$r_{\mathrm{seq}, i \to j}: \bigwedge_{\phi \in G_{T_i}} v(\phi) = v^*_{T_i}(\phi) \;\Longrightarrow\; v\bigl(\langle T_j, \texttt{activation-permitted}\rangle\bigr) = \mathbf{t}$$

and each rule $r \in \mathcal{S}_{T_j}$ has $v(\langle T_j, \texttt{activation-permitted}\rangle) = \mathbf{t}$ added to its antecedent.
Settling-monotonicity ensures the activation-permitted cell, once at $\mathbf{t}$, stays there — the gate opens and does not close.
The composition rule over the whole chain remains AND-composition: the parent settles when the last subtask in the sequence settles.

**Regime:** strict if the chain is finite and all component systems are strict.
The closure ordinal of the composed system is the sum of component ordinals plus one activation step per edge.

**Note on distinction from workflow dependency edges.** Workflow edges in $\mathbf{Wf}_{B_{\mathrm{op}}}$ encode *data flow* — the output cells of $T_i$ are referenced by the antecedent of a closure rule in $\mathcal{S}_{T_j}$.
Sequential activation guards encode *temporal ordering without data transfer*: $T_j$ can begin only after $T_i$ completes, but $T_j$ does not necessarily read $T_i$'s goal-cell values.
Both mechanisms may coexist in a decomposed task.

The required subtask-set depends on a guard cell $\gamma$ settled at an earlier stage.
Realized as two rule-sets, each gated on $\gamma$'s bilattice value:

$$r_{\mathrm{cond}, \mathbf{t}}: v(\gamma) = \mathbf{t} \;\wedge\; \bigwedge_{\phi \in G_{T^A}} v(\phi) = v^*_{T^A}(\phi) \;\Longrightarrow\; G_T \text{ settled}$$ $$r_{\mathrm{cond}, \mathbf{f}}: v(\gamma) = \mathbf{f} \;\wedge\; \bigwedge_{\phi \in G_{T^B}} v(\phi) = v^*_{T^B}(\phi) \;\Longrightarrow\; G_T \text{ settled}$$

where $T^A$ is the subtask-set required when $\gamma = \mathbf{t}$ and $T^B$ when $\gamma = \mathbf{f}$.
This is the coproduct $W_{T^A} + W_{T^B}$ in $\mathbf{Wf}_\tau$ from [workflow-composition](../concepts/workflow-composition.md), with $\gamma$ selecting the injection.

If $\gamma = \top$, both branches' antecedents are met and both consequents fire — a repair condition.
If $\gamma = \bot$, neither fires and the task blocks pending $\gamma$'s settlement.
The conditional composition is $\Pi_1$ per branch; the branching is effected by the guard cell's value.

For AND, OR, sequential, and conditional composition: if all component $\mathcal{S}_{T_i}$ are strict, the composed system is strict.
The maximum-regime rule from the base AND-composition case generalizes:

$$\rho\bigl(\mathrm{Dec}(T)\bigr) = \max_i \rho(\mathcal{S}_{T_i}) \vee \rho(r_{\mathrm{compose-variant}})$$

All composition rules defined above are $\Pi_1$ (strict-class).
Hence decomposition does not lift the regime beyond the maximum component regime.
Only the dynamic-subtask (inquiry) pattern lifts to Scott-continuous, since its composition rule aggregates over a domain that grows with increments — see [decomposition-patterns](../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/actuating/content/actuator/embodying/content/body/integrating/content/drone/swarming/content/swarm/content/social/_archive/sociology/content/work/theories/predicated-work/code/transformers/questions/decomposition-patterns.md) for the full treatment.

The activation-permitted cells — $\langle T_j, \texttt{activation-permitted}\rangle = \mathbf{t}$ — are $\leq_k$-monotone once settled.
By the [predication-settling CALM corollary](../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/formalization/infomaterial/lib/infomaterial/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-calm-corollary.md):

- Confirming "is subtask $T_j$ now activated?" is coordination-free: any replica with the local activation-permitted cell can confirm it.
- Confirming "is $T_j$ still blocked (activation not yet permitted)?" requires coordination — it is the absence of the activation-permitted cell.

In sequential composition ($T_i \to T_j$): once $T_i$'s completion witness settles, the sequential-activation rule fires and the activation-permitted cell for $T_j$ is asserted.
Any distributed node receiving that increment can locally confirm that $T_j$ is ready — without round-tripping to a coordinator.
This is the CALM-theoretic content of "sequential task handoff is coordination-free in the forward direction."

The conditional composition ("do $T^A$ if $\gamma = \mathbf{t}$, else $T^B$") creates a branch in the [temporal 2-category](../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/temporal-2-category/temporal-2-category.md) $\mathbf{T}(\mathcal{C}_{\mathrm{op}}, \lambda)$.
The [temporal Beck-Chevalley condition](../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/temporal-2-category/references/temporal-beck-chevalley.md) holds for this branch iff the guard cell $\gamma$ has settled before the parent task's cells that trigger the conditional (i.e., $\gamma$ is settled independently of which branch executes).

**BC holds:** $\gamma$ settles early (before the branch point), its value is stable, and the two branch paths $T^A$ / $T^B$ produce compatible settling on the cells that are shared before and after the branch.
Standard conditional decomposition.

**BC fails:** $\gamma$ is a cell that the branch paths $T^A$ or $T^B$ themselves could influence — a guard condition that depends on the work the branch is doing.
This creates a non-invertible 2-cell at the pseudo-pullback: the guard's settling and the branch's fiber-change don't commute.
This is the temporal-2-category signature of a *circular condition* — a guard that depends on its own resolution.
When $\gamma = \top$ (both branches' antecedents fire simultaneously): the failed-BC 2-cell at the pseudo-pullback records the contradiction; the repair condition ($\gamma = \top$) is the substrate-algebraic manifestation of the failed-BC situation.

The AND-composition rule is the base case. The [decomposition-patterns question](../../../../../content/text/triage/questions/decomposition-patterns.md) works out the full family; the main variants expressible within the closure-rule language are:

The parent settles when *any* subtask settles. Realized as a family of $n$ rules, one per subtask — the disjunctive effect arises from multiple sufficient rules, each $\Pi_1$:

No new closure-rule fragment is required beyond the $\Pi_1$ rules already used in AND-composition. The decomposed system $\mathrm{Dec}^{\mathrm{OR}}(T)$ replaces the single $r_{\mathrm{compose}}$ with $n$ separate rules, each individually sufficient.

**Regime:** identical to the AND case — strict if all component systems are strict. **Orphaned subtasks:** once the parent settles via subtask $T_i$, sibling subtasks $T_j$ ($j \neq i$) may continue firing their local rules. An optional cascade-cancellation rule can assert $\langle T_j, \texttt{cancelled}\rangle = \mathbf{t}$ when the parent settles, which (via activation guards on $\mathcal{S}_{T_j}$) stops further rule firings on siblings. The `cancelled` state is not currently named in the [task-cell-system lifecycle](../../../../../../../../social-theory-science-services-section/content/text/glossary/terms/task-cell-system.md) — it should be added as a terminal state alongside `completed`, `failed`, and `abandoned`.

Subtask $T_j$ may not begin settling until subtask $T_i$ has settled (for each edge $i \to j$ in the sequence order). Realized by *activation guards*: a cell $\langle T_j, \texttt{activation-permitted}\rangle$ is asserted by the rule

and each rule $r \in \mathcal{S}_{T_j}$ has $v(\langle T_j, \texttt{activation-permitted}\rangle) = \mathbf{t}$ added to its antecedent. Settling-monotonicity ensures the activation-permitted cell, once at $\mathbf{t}$, stays there — the gate opens and does not close. The composition rule over the whole chain remains AND-composition: the parent settles when the last subtask in the sequence settles.

**Regime:** strict if the chain is finite and all component systems are strict. The closure ordinal of the composed system is the sum of component ordinals plus one activation step per edge.

**Note on distinction from workflow dependency edges.** Workflow edges in $\mathbf{Wf}_{B_{\mathrm{op}}}$ encode *data flow* — the output cells of $T_i$ are referenced by the antecedent of a closure rule in $\mathcal{S}_{T_j}$. Sequential activation guards encode *temporal ordering without data transfer*: $T_j$ can begin only after $T_i$ completes, but $T_j$ does not necessarily read $T_i$'s goal-cell values. Both mechanisms may coexist in a decomposed task.

The required subtask-set depends on a guard cell $\gamma$ settled at an earlier stage. Realized as two rule-sets, each gated on $\gamma$'s bilattice value:

$$r_{\mathrm{cond}, \mathbf{t}}: v(\gamma) = \mathbf{t} \;\wedge\; \bigwedge_{\phi \in G_{T^A}} v(\phi) = v^*_{T^A}(\phi) \;\Longrightarrow\; G_T \text{ settled}$$
$$r_{\mathrm{cond}, \mathbf{f}}: v(\gamma) = \mathbf{f} \;\wedge\; \bigwedge_{\phi \in G_{T^B}} v(\phi) = v^*_{T^B}(\phi) \;\Longrightarrow\; G_T \text{ settled}$$

where $T^A$ is the subtask-set required when $\gamma = \mathbf{t}$ and $T^B$ when $\gamma = \mathbf{f}$. This is the coproduct $W_{T^A} + W_{T^B}$ in $\mathbf{Wf}_\tau$ from [workflow-composition](../concepts/workflow-composition.md), with $\gamma$ selecting the injection.

If $\gamma = \top$, both branches' antecedents are met and both consequents fire — a repair condition. If $\gamma = \bot$, neither fires and the task blocks pending $\gamma$'s settlement. The conditional composition is $\Pi_1$ per branch; the branching is effected by the guard cell's value.

For AND, OR, sequential, and conditional composition: if all component $\mathcal{S}_{T_i}$ are strict, the composed system is strict. The maximum-regime rule from the base AND-composition case generalizes:

All composition rules defined above are $\Pi_1$ (strict-class). Hence decomposition does not lift the regime beyond the maximum component regime. Only the dynamic-subtask (inquiry) pattern lifts to Scott-continuous, since its composition rule aggregates over a domain that grows with increments — see [decomposition-patterns](../../../../../content/text/triage/questions/decomposition-patterns.md) for the full treatment.

The activation-permitted cells — $\langle T_j, \texttt{activation-permitted}\rangle = \mathbf{t}$ — are $\leq_k$-monotone once settled. By the [predication-settling CALM corollary](../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/formalization/infomaterial/lib/infomaterial/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-calm-corollary.md):

In sequential composition ($T_i \to T_j$): once $T_i$'s completion witness settles, the sequential-activation rule fires and the activation-permitted cell for $T_j$ is asserted. Any distributed node receiving that increment can locally confirm that $T_j$ is ready — without round-tripping to a coordinator. This is the CALM-theoretic content of "sequential task handoff is coordination-free in the forward direction."

The conditional composition ("do $T^A$ if $\gamma = \mathbf{t}$, else $T^B$") creates a branch in the [temporal 2-category](../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/temporal-2-category/temporal-2-category.md) $\mathbf{T}(\mathcal{C}_{\mathrm{op}}, \lambda)$. The [temporal Beck-Chevalley condition](../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/temporal-2-category/references/temporal-beck-chevalley.md) holds for this branch iff the guard cell $\gamma$ has settled before the parent task's cells that trigger the conditional (i.e., $\gamma$ is settled independently of which branch executes).

**BC holds:** $\gamma$ settles early (before the branch point), its value is stable, and the two branch paths $T^A$ / $T^B$ produce compatible settling on the cells that are shared before and after the branch. Standard conditional decomposition.

**BC fails:** $\gamma$ is a cell that the branch paths $T^A$ or $T^B$ themselves could influence — a guard condition that depends on the work the branch is doing. This creates a non-invertible 2-cell at the pseudo-pullback: the guard's settling and the branch's fiber-change don't commute. This is the temporal-2-category signature of a *circular condition* — a guard that depends on its own resolution. When $\gamma = \top$ (both branches' antecedents fire simultaneously): the failed-BC 2-cell at the pseudo-pullback records the contradiction; the repair condition ($\gamma = \top$) is the substrate-algebraic manifestation of the failed-BC situation.
