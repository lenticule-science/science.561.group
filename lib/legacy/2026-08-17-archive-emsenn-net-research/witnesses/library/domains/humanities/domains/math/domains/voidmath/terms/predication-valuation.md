---
name: "Predication valuation"
description: "A function assigning to each predicate a fiber-algebra element — the structure that records what value is held at every predication cell. The dynamic data of a predication system: what is registered at each (subject, predicate, object) triple."
symbol: "v"
date-created: 2026-04-28
---

A **predication valuation** is a function $v$ that assigns to each predicate $p$ an element $v(p) \in A_p$ of the [predication fiber algebra](predication-fiber-algebra.md) at $p$. This determines a value at each [predication cell](predication-cell.md) $(s, p, o)$: namely $v(p)(s, o) \in \mathbf{L}^\bowtie$, a position in the [settlement](settlement.md) space.

The valuation is the *content* of a predication system at a moment. The cells are *where* values can sit; the fiber algebras are *what* values can be; the valuation is *which* values are actually being held. A system with a fixed set of entities and predicates can hold different valuations — the valuation is the dynamic data, not the static structure.

## Settling: valuations over time

When values evolve as evidence accumulates, the data is a family of valuations indexed by a settling bound $\lambda$:

$$v = (v_\tau)_{\tau < \lambda}.$$

Each $v_\tau$ is a predication valuation in the above sense, recording the values assigned at settling step $\tau$. When the family satisfies *settling monotonicity* — values rise monotonically in the [knowledge order](knowledge-order.md) $\leq_k$ as $\tau$ increases — it is the data of a *spatiotemporal knowledge presheaf*: evidence accumulates and is never retracted.

Settling monotonicity is what makes a valuation family a coherent temporal-evidence structure rather than an arbitrary state-update sequence. It is the formal counterpart of the relationality-framework intuition that [determination](../../../../philosophy/domains/relationality/terms/determination.md) is achieved through accumulating witnessing, not by replacing one settled position with another.

## Constant valuations and trivial settlings

Two boundary cases are useful:

- **The absurd valuation** $v_\bot$ assigns $\bot$ at every cell — no information anywhere. This is the starting point of any settling that begins from no evidence.
- **The fully-determined valuation** $v_\top$ assigns $\top$ at every cell — full evidence in both directions everywhere. This is the absorbing state of a settling that contradicts itself maximally.

Most valuations encountered in practice sit between these. The richness of a predication system is that it can record any pattern of partial evidence across cells, not just uniform bottom or uniform top.

## See also

- [Predication cell](predication-cell.md) — the location at which a valuation assigns a value.
- [Predication fiber algebra](predication-fiber-algebra.md) — the structure values come from.
- [Settlement](settlement.md) — the joint structure within which each value sits.
- [Knowledge order](knowledge-order.md) — the order along which valuations evolve under settling monotonicity.
