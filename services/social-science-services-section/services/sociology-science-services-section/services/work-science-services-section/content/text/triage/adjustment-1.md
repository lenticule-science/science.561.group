---
type: definition
class: cell-system
status: draft
symbol: J
depends-on: [finding, plan, predication-cell, settling-monotonicity]
realizes: [adjustment]
see-also: [finding, retrospect-via-cosettling, multi-agent-work-as-crdt]
---

# Adjustment

The substrate-entity produced by the [feedback](../../../terms/feedback.md) stage: a structured change applied in response to a [finding](./finding.md). Per the [referencing-entity pattern](../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/concepts/referencing-entity-pattern.md), an adjustment is a first-class entity that targets some other entity (a plan, a task, a procedure, a term, a policy, an office) and asserts the change as substrate content. Adjustments are not new work — new work enters through planning. Adjustments modify the conditions under which future work happens.

## Definition

An adjustment cell-system is a triple

$$J = (G_J, \mathcal{S}_J, v^J_0)$$

where:

- $G_J \subseteq \Phi_{\mathrm{op}}$ — the *adjustment claim cells*:
  - $\langle J, \texttt{is-a}, \texttt{adjustment} \rangle$
  - $\langle J, \texttt{responds-to}, F \rangle^*$ — references to the [findings](./finding.md) being addressed
  - $\langle J, \texttt{target}, X \rangle$ — the entity being changed
  - $\langle J, \texttt{change}, \Phi_K \rangle$ — a sub-fiber describing the change in structured terms (not prose)
  - $\langle J, \texttt{loop-type}, \ell \rangle$ where $\ell \in \{\texttt{single-loop}, \texttt{double-loop}\}$
  - $\langle J, \texttt{rationale}, \Phi_R \rangle$ — sub-fiber linking the finding's `cause` to the adjustment's `change` (which contributing factor does this change address?)
  - $\langle J, \texttt{by-office}, O \rangle$ — the office authoring the adjustment
  - $\langle J, \texttt{applied-at}, t \rangle$ — when the change took effect

- $\mathcal{S}_J$ — closure rules; in particular, the *application rule* that asserts the adjustment's `change` cells against the target's fiber at $t$, and the *graph-modification rule* (for double-loop adjustments) that admits or retracts predicate-relationship claims.

- $v^J_0$ — initial valuation at adjustment emission.

## Single-loop vs. double-loop as cell-content vs. graph-edges

Following Argyris-Schön, the loop distinction at the adjustment stage is structural:

- **Single-loop adjustment** — the `change` sub-fiber asserts new cell-values *within the existing predicate-relationship structure*. A new claim on an office (capacity raised), a new task on a plan, a changed value on an existing predicate. The adjustment's `change` cells, when applied at $t$, enter the substrate as ordinary increments. By [settling-monotonicity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), the new value supersedes the old via subsequent walks; nothing about the predicate graph $C$ changes.

- **Double-loop adjustment** — the `change` sub-fiber asserts (or retracts) claims that *declare relationships between predicates themselves*. For example, a claim that one predicate is a specialization of another, or that one predicate composes from two others. The fiber functor's domain category $C$ (per Theorem 2 of the [adjoint-structure paper](../../../../../../../../../science/theories/information/texts/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md)) is *built from* exactly these kinds of relationship claims. A double-loop adjustment grows or modifies $C$.

A frozen $C$ — a substrate that admits only single-loop adjustments — cannot learn at the structural level. The same plan-execution-outcome pattern, recurring under the same predicate vocabulary, will repeat: single-loop adjustments tighten parameters within an unmodified frame. Double-loop adjustments are the algebraic content of structural learning.

This distinction does not require kernel changes. $C$ is content, not kernel — it is the predicate-relationship claims that have been admitted into the substrate.

## Settlement-path as increasing predicate formality

The settlement-path candidate reading — observation → instinct → skill → tool — reads as a chain of adjustments at increasing formality (the substrate-side counterpart of FARS's [formality-progression](../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/concepts/formality-progression.md)):

1. **Observation-stage** content: prose-valued cells on an [observation](./observation.md) entity. Maximum context-dependence, minimum substrate-leverage.
2. **Instinct-stage** content (review-stage adjustment): an instinct entity carries $\langle I, \texttt{heuristic}, \texttt{prose} \rangle$ — still prose-valued but now *named*, so future walks can reference it.
3. **Skill-stage** content (feedback-stage adjustment): an adjustment replaces the prose heuristic with structured predicates on the relevant office, capability, or procedure. Cells now carry $\mathbf{t}$/$\mathbf{f}$ values, not prose.
4. **Tool-stage** content (double-loop adjustment): the adjustment asserts a new specialization, inversion, or composition claim between existing predicates. The fiber functor sees a new edge; subsequent compositions pick it up automatically.

Each transition might be a Lambek-style settlement — the adjustment operator's fiber reaching a fixpoint under further application. By Proposition 8 of the adjoint-structure paper, orbits reach fixed points in $\le 2$ steps, so the settlement is fast if it settles. Whether the formalities really jump in this discrete way or just relabel the same content at different granularities is empirical.

## Ashby variety constraint

By Ashby's Law of Requisite Variety, the adjustment vocabulary's variety must be at least as rich as the finding vocabulary's variety, or some findings will land at $\bot$ on their `responds-to` composition because no response-type claim exists to match them. The adjustment cell-system thus imposes a *vocabulary-richness* discipline on the substrate: as findings discriminate finer causes, adjustments must discriminate finer changes, or the feedback fiber becomes sparser than the review fiber and the loop runs partially-open.

Whether this is genuinely Ashby's law (an information-theoretic capacity bound) or a metaphorical echo (a vocabulary-richness analogue) is open. The cell shape allows either interpretation; the substrate-engineering choice is whether to enforce a variety check at adjustment-issuance time or to let sparse coverage fail downstream.

## Algebraic role: closing the loop

The full operations loop in the substrate's algebra:

$$\text{plan} \xrightarrow{\odot \text{ task-assertion}} \text{plan'} \xrightarrow{\text{dispatch}} A \xrightarrow{\text{execute}} E \xrightarrow{\text{track}} O \xrightarrow{\text{review}} F \xrightarrow{\text{feedback}} J \xrightarrow{\text{apply}} \text{(modified target)}$$

The adjustment's apply-step writes new cells against the target. If the target was the plan (a re-planning adjustment), the cycle re-enters at planning with a modified fiber. If the target was a term or a predicate-relationship, $C$ has changed and *all subsequent compositions* — including future plans, dispatches, executions — see the modified structure. Bratman's plan-stability principle asserts that re-entering planning is a different operation than initial planning; the substrate-algebraic content of that distinction is exactly that the re-entry composes against an adjusted $C$.

## Position

Adjustments are the substrate's mechanism for organizational learning: every claim that the substrate has admitted reflects either an initial assertion (planning, dispatch, execution emissions) or an adjustment-mediated revision. An organization that emits findings without adjustments is open-loop; an organization that emits only single-loop adjustments has a frozen predicate graph; an organization whose double-loop adjustment cadence matches its environment's rate of change is the algebraic content of a viable system in Beer's sense.
