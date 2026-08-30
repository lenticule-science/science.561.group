---
type: theorem
status: sketch
depends-on: [workflow, task-cell-system, predication-settling-category]
---

# Workflow composition is a strict monoidal category

The collection of [workflows](../terms/workflow.md) over the operations base, organized by their type-boundaries, forms a strict monoidal category $\mathbf{Wf}_{B_{\mathrm{op}}}$:

- **Objects:** cell-pattern types — descriptions of which predicates' cells appear at a workflow's boundary, with required initial valuations.
- **Morphisms:** workflows $W : \tau \to \tau'$ (sequence pattern), with the identity $\mathrm{id}_\tau$ given by the trivial workflow on $\tau$.
- **Composition:** $W_2 \circ W_1$ — the sequence pattern.
- **Tensor:** $W_1 \otimes W_2$ — the parallel pattern, on the disjoint union of input/output types.

## Sketch

The structure has three parts:

**Category structure (sequence is associative; identity is two-sided).**

For workflows $W_1: \tau_a \to \tau_b$, $W_2: \tau_b \to \tau_c$, $W_3: \tau_c \to \tau_d$, the composition $(W_3 \circ W_2) \circ W_1$ produces the same task-set, edge-set, and closure-rule subsystem as $W_3 \circ (W_2 \circ W_1)$ — set-theoretic union is associative; closure-rule subsystem union is associative; the dependency-edge composition is associative because dependency edges are concatenations of paths through the workflow graph, and path concatenation is associative.

The identity workflow $\mathrm{id}_\tau$ has empty $T_W$ and empty $E_W$. For any $W: \tau \to \tau'$, $W \circ \mathrm{id}_\tau = W = \mathrm{id}_{\tau'} \circ W$ — composing with the empty workflow leaves the task-set, edge-set, and closure-rule subsystem unchanged.

**Monoidal structure (parallel composition is bifunctorial).**

For workflows $W_1, W_2$ with disjoint input-output cells, $W_1 \otimes W_2$ is the workflow whose task-set is $T_{W_1} \sqcup T_{W_2}$, edges $E_{W_1} \sqcup E_{W_2}$ (no edges between), and types $\tau_{W_1} \otimes \tau_{W_2}$ on the disjoint union.

Bifunctoriality: $(W_1 \otimes W_2) \circ (W'_1 \otimes W'_2) = (W_1 \circ W'_1) \otimes (W_2 \circ W'_2)$ when type-matched. The proof is direct from the disjointness of $W_1$- and $W_2$-cells: the composition operations on each side don't interact.

**Strictness.**

The associator $\alpha: (W_1 \otimes W_2) \otimes W_3 \to W_1 \otimes (W_2 \otimes W_3)$ is the identity, because disjoint-union associativity is a strict equality (not just an isomorphism) at the set-of-tasks level. Similarly for left- and right-unitors. $\square$

## Connection to the knowledge presheaf category

The math program's [knowledge presheaf category](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling-category.md) has settlings as objects and settling-morphisms as arrows. $\mathbf{Wf}_{B_{\mathrm{op}}}$ embeds into the knowledge presheaf category as the sub-category of settling-morphisms whose source and target are task-system-flavored sub-settlings. This embedding lets workflow-composition theorems inherit the math program's [completeness](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/predication-settling-category-completeness.md) results.

## Branch as a coproduct

The branch pattern (after $W$, do $W_1$ if $C$ else $W_2$) is the coproduct in $\mathbf{Wf}_\tau$: $W_1 + W_2$ is the workflow whose closure rules include both $W_1$'s and $W_2$'s, gated by $C$ on each. The coproduct's two injections $\iota_i: W_i \to W_1 + W_2$ are the workflows that *unconditionally* run $W_i$ — the branch with the gating condition fixed at $\mathbf{t}$ for the chosen branch.

## Consequence — workflow soundness is a structural property

A workflow is *sound* (every input that arrives eventually produces a settled output, no leftover unsettled cells) iff the workflow-as-morphism in $\mathbf{Wf}_\tau$ is *quiescence-preserving*: it sends quiescent input states to quiescent output states. By [completion-as-quiescence](./completion-as-quiescence.md), this is decidable in the strict regime; in higher regimes, soundness is a cohomological condition on the workflow's settling.

For the strict regime, workflow soundness reduces to the Petri-net-style reachability/liveness analysis the work vocabulary already names: every task is reachable, no task is dead, every settled input drives the workflow to a settled output.
