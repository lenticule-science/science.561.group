---

introduces: relation
description: "A partial order where every pair of elements is comparable: either a ≤ b or b ≤ a. Also called a linear order or chain."
aliases: [total order, total orders, linear order, chain, totally ordered set]
specialization: partial-order
contrasts-with: partial-order
date-created: 2026-03-30

---

A total order is a [partial order](./partial-order.md) where every pair of elements is comparable: for any $a$ and $b$, either $a \leq b$ or $b \leq a$.

The integers under $\leq$ are totally ordered. The real numbers under $\leq$ are totally ordered. Any subset of a totally ordered set is totally ordered.

A total order is also called a **linear order** or a **chain**. "Chain" is used especially when referring to a totally ordered subset of a partial order.

The key distinction: in a partial order, two elements can be incomparable (neither is above the other). In a total order, this cannot happen. Everything lines up.

After closure on the four-valued [bilattice](./bilattice.md), the truth ordering on $\{t, f, \top\}$ becomes a total order: $f <_t \top <_t t$. The diamond collapses to a chain.

---

## Additional formulation

```yaml
---

introduces: relation
description: "A partial order where every pair of elements is comparable: either a ≤ b or b ≤ a. Also called a linear order or chain."
aliases: [total order, total orders, linear order, chain, totally ordered set]
specialization: partial-order
contrasts-with: partial-order
date-created: 2026-03-30
---
```

A total order is a [partial order](./partial-order.md) where every pair of elements is comparable: for any $a$ and $b$, either $a \leq b$ or $b \leq a$.

The integers under $\leq$ are totally ordered. The real numbers under $\leq$ are totally ordered. Any subset of a totally ordered set is totally ordered.

A total order is also called a **linear order** or a **chain**. "Chain" is used especially when referring to a totally ordered subset of a partial order.

The key distinction: in a partial order, two elements can be incomparable (neither is above the other). In a total order, this cannot happen. Everything lines up.

After closure on the four-valued [bilattice](../../algebra/terms/bilattice.md), the truth ordering on $\{t, f, \top\}$ becomes a total order: $f <_t \top <_t t$. The diamond collapses to a chain.
