---
type: theorem
status: sketch
depends-on: [decompose-task, task-cell-system, plan-completion-as-meet, beck-chevalley-commutation-on-predication-bilattices, predication-fibration, predicate-specialization, predicate-subject-projection]
realizes: [decomposition]
---

# Task decomposition is base-change in the predication fibration

The [decompose-task](../morphisms/decompose-task.md) morphism, viewed in the [predication fibration](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md), is *base-change along a predicate-category projection*.
The composition rule $r_{\mathrm{compose}}$ that links subtask completions to parent completion is then forced by the [Beck–Chevalley commutation](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/beck-chevalley-commutation-on-predication-bilattices.md), not posited.
Substitution under context-change — re-parenting a subtask to a different parent, or running the same decomposition under a different ambient policy — preserves completion semantics exactly because BC commutes the relevant $\exists/\forall$ with reindexing.

## Statement

**Theorem.** *Let $T$ be a [task cell system](../objects/task-cell-system.md) with declared subtasks $T_1, \ldots, T_n$, and let $\mathrm{Dec}(T)$ be the decomposed system per [decompose-task](../morphisms/decompose-task.md).
Let $\pi : \bigsqcup_i G_{T_i} \to G_T$ be the [subject-projection](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-subject-projection.md) collapsing each subtask's goal cells to the parent's corresponding goal cells (the projection along the decomposition relation in the predicate category $\mathcal{C}_{\mathrm{op}}$).*

(a) *(Decomposition is reindexing.)
The subtask join-section $\bigvee_k v^{T_i}$ obtained on the disjoint subtask base is the* $\pi^*$*-image of the parent target valuation $v^*_T$ in the [predication fibration](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md): $\bigvee_k v^{T_i} = \pi^*(v^*_T)$.*

(b) *(Composition rule is the counit of the base-change adjunction.)
The composition rule $r_{\mathrm{compose}}$ in $\mathrm{Dec}(T)$ is the closure-rule shadow of the adjunction counit*

$$\varepsilon_{v^*_T} : \;\exists_\pi^t (\pi^* v^*_T) \;\to\; v^*_T$$

*for $\exists_\pi^t \dashv \pi^*$ in the truth order, evaluated on the parent target.
The "all-subtasks-meet-targets implies parent-meets-target" implication is exactly this counit — the canonical map from "sum of the per-subtask targets transported back to the parent base" to "parent target."
(Beck–Chevalley is not what produces $r_{\mathrm{compose}}$; it enters in (c) below, governing transport across context-change pullbacks.)*

(c) *(Re-parenting preserves completion.)
For any pullback square in $\mathcal{C}_{\mathrm{op}}$ relating decomposition projections $\pi$ and $\pi'$ across a context-change $f$ (e.g., re-parenting subtasks to a different parent $T'$), the completion-equivalence on subtasks transports along $f^*$ exactly: a subtask cell-pattern that completed $T$ completes $T'$ when the BC square commutes.
Failure of BC is failure of re-parenting.*

## Sketch

**(a)** The predicate category $\mathcal{C}_{\mathrm{op}}$ contains, for each parent task $T$ with subtasks $\{T_i\}$, a projection morphism $\pi : (T_1, \ldots, T_n) \to T$ obtained as the [subject-projection](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-subject-projection.md) over the decomposition relation.
Reindexing along $\pi$ in the [predication fibration](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) sends a parent-base valuation to its row-fold-extended subtask-base valuation; for the parent target $v^*_T$, this reindexing produces precisely the per-subtask target valuations $v^*_{T_i}$ on each $G_{T_i}$.
The disjoint subtask base $\bigsqcup_i G_{T_i}$ carries their join in the knowledge order: $\bigvee_k v^{T_i} = \pi^*(v^*_T)$.

**(b)** The composition rule $r_{\mathrm{compose}}$ of [decompose-task](../morphisms/decompose-task.md) reads as: when all subtask cells $\bigwedge_i \bigwedge_{\phi \in G_{T_i}} v(\phi) = v^*_{T_i}(\phi)$ — i.e., when the subtask base carries $\pi^*(v^*_T)$ — the parent-base cells settle to at least $v^*_T$.
This is exactly the counit of $\exists_\pi^t \dashv \pi^*$: the canonical map $\varepsilon_{v^*_T} : \exists_\pi^t \pi^* v^*_T \to v^*_T$ on the parent base transports the per-subtask realization back to the parent target.
The counit always exists (it is part of the adjunction data); on the cells in $\pi^*$'s image the counit is an iso (by the standard fully-faithful-embedding criterion for inclusion-shaped projections), hence $r_{\mathrm{compose}}$ recovers $v^*_T$ exactly when the subtask base carries $\pi^* v^*_T$.
There is no choice in *what* the composition rule says once decomposition is identified as base-change.

**(c)** Re-parenting fits as a pullback in $\mathcal{C}_{\mathrm{op}}$:

$$\begin{array}{ccc} (T_1', \ldots, T_n') & \xrightarrow{\pi'} & T' \\ \tilde f \downarrow & & \downarrow f \\ (T_1, \ldots, T_n) & \xrightarrow{\pi} & T \end{array}$$

where $f : T' \to T$ is the parent-substitution (e.g., a subtask suite originally decomposing $T$ now decomposes $T'$ under context-change $f$).
The Beck–Chevalley iso

$$\exists_{\pi'}^t (\tilde f^* \pi^* v^*_T) \;\xrightarrow{\sim}\; f^* (\exists_\pi^t \pi^* v^*_T) \;=\; f^*(v^*_T) \;=\; v^*_{T'}$$

— substituting the BC commutation step — gives that the re-parented subtask suite completes $T'$ via the analogous closure rule, with no extra structure required. $\square$

## What this earns

Three concrete consequences not visible at the level of [plan-completion-as-meet](plan-completion-as-meet.md):

1. **Decomposition equivalence is base-change equivalence.** Two decompositions of the same parent task are completion-equivalent iff they correspond to isomorphic predicate-category projections — a structural test, not a heuristic.

2. **Cross-context decomposition is automatic.** The same subtask suite decomposing two different parents is internally consistent because of BC, not because of a side condition.
  This explains why standard work-breakdowns (e.g., a generic "PR review" subtask suite) transfer across projects without re-derivation.

3. **Decomposition failure is BC failure.** A decomposition that does not satisfy BC — typically because the projection $\pi$ is not a [predicate-category](../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) generator-composition — produces *non-commuting* completion semantics under context change: re-parenting breaks completion.
  Such "decompositions" are mis-decompositions; the math diagnoses them precisely.

## Relation to plan-completion-as-meet

[Plan-completion-as-meet](plan-completion-as-meet.md) shows that plan completion is a knowledge-order *meet* of subtask completions plus milestone settlement.
The present theorem upgrades that result: the meet structure is not merely an aggregation rule chosen for convenience but the *adjoint* $\pi^*$ of an existential quantifier $\exists_\pi^t$ along a base-change projection.
The two views together — meet-structure on the subtask side, BC iso on the parent side — exhaust the algebraic content of decomposition.
