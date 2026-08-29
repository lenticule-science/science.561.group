---
type: morphism
class: refinement
status: draft
depends-on: [task-cell-system, operations-settling, predicate-specialization]
realizes: [decomposition, subtask]
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
