---
name: "Settling monotonicity"
description: "The condition that a settle-indexed family of predication valuations grows monotonically in the knowledge order. Values may shift in truth direction but never lose evidence: knowledge accumulates, conflicts surface as both-affirmed-and-denied rather than overwriting each other. The formal structure of irreversible evidence-gathering."
date-created: 2026-04-29
---

**Settling monotonicity** is the condition on a settle-indexed family $v = (v_\tau)_{\tau < \lambda}$ of [predication valuations](predication-valuation.md) — indexed by a settling bound $\lambda$ — that values grow monotonically in the [knowledge order](knowledge-order.md): for all $\sigma \leq \tau < \lambda$ and every [predicate](predicate.md) $p$,

$$v_\sigma(p) \leq_k v_\tau(p)$$

pointwise in the [predication fiber algebra](predication-fiber-algebra.md) $A_p$, where $\leq_k$ is the knowledge order.

In ordinary language: as settling proceeds, the value at every cell only ever rises in the knowledge order. It may shift in [truth-axis](truth-order.md) direction (toward affirmation, toward denial, toward paraconsistent both-directions); but it never loses evidence. What was witnessed remains witnessed.

## What monotonicity guarantees

Settling monotonicity makes the framework's evolution honest in a specific way. Three properties follow:

- **No retraction.** Once a value has been raised in the knowledge order, no later settling step can lower it. Evidence accumulates; it does not get erased.
- **Conflicts surface as $\top$, not as overwriting.** If a value is at $\mathbf{t}$ (told true) and new denying evidence arrives, the value rises to $\top$ (told both — paraconsistent), not down to $\mathbf{f}$. The framework records the contradictory situation rather than forgetting the original affirmation.
- **Settled is settled.** A value at the joint affirming corner $\mathbf{t}$ (or the affirming corner of any of the four extremes) does not move under further settling, because moving up in the knowledge order from any extremum either stays put or moves toward $\top$. If the inquiry has fully determined the value's affirming-only character, that determination is preserved.

The third property is what makes [settlement](settlement.md)'s notion of *determination* work: a settled position is one that further settling cannot disturb in the directions that would un-settle it. Settling monotonicity is the formal condition that makes this so.

## Truth-axis is not constrained

Monotonicity is asserted in the knowledge order, not the truth order. The truth-axis position of a value can move in either direction as settling proceeds — toward $\mathbf{t}$ if affirming evidence accumulates, toward $\mathbf{f}$ if denying evidence accumulates, or staying mixed if both kinds arrive at similar rates.

What cannot happen is for the truth-axis to shift *without corresponding accumulation in the knowledge order*. Every truth-axis movement requires new evidence — positive evidence to move toward $\mathbf{t}$, negative evidence to move toward $\mathbf{f}$ — and that evidence raises the knowledge-axis position. The two axes are not independent at the level of dynamics, even though they are independent at the level of static positions.

## A spatiotemporal knowledge presheaf

A settle-indexed family $v = (v_\tau)_{\tau < \lambda}$ satisfying settling monotonicity is the data of a **spatiotemporal knowledge presheaf**: a sheaf-theoretic object encoding the framework's evolution over the settling bound. Each $v_\tau$ records the predication valuation at settling step $\tau$; the monotonicity condition encodes the irreversibility of evidence accumulation; together they constitute a coherent temporal-evidence structure rather than an arbitrary state-update sequence.

This is the bridge between the static settlement structure (the bilattice fiber algebra at one moment) and the dynamic settlement structure (a family evolving over time). Without monotonicity, the dynamic structure is just a sequence; with monotonicity, it is a presheaf with the knowledge-order-monotone evolution that the framework's commitments require.

## See also

- [Predication valuation](predication-valuation.md) — the family $v_\tau$ of valuations indexed by settling step.
- [Knowledge order](knowledge-order.md) — the order along which monotonicity is asserted.
- [Settlement](settlement.md) — the joint structure within which monotone evolution takes place.
- [Truth order](truth-order.md) — the orthogonal axis, *not* constrained by monotonicity.
- [Evidence](evidence.md) — what accumulates monotonically.
