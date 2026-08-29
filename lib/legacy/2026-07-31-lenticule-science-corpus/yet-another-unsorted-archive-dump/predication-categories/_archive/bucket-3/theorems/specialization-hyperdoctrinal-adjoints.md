---
kind: theorem
status: proved
depends-on: [predicate-specialization, predication-fiber-algebra, knowledge-order]
---

# Specialization hyperdoctrinal adjoints

For a [predicate specialization](../morphisms/predicate-specialization.md) morphism $f : q \to p$ with sub-support $\mathrm{dom}(q) \subseteq \mathrm{dom}(p)$, the induced fiber map $f^* : A_p \to A_q$ on [predication fiber algebras](../objects/predication-fiber-algebra.md) has both $\leq_k$-adjoints in the [knowledge order](../concepts/knowledge-order.md):

- $\exists_f : A_q \to A_p$ — **extension by $\bot$**:

$$(\exists_f w)(s, o) := \begin{cases} w(s, o) & (s, o) \in \mathrm{dom}(q) \\ \bot & (s, o) \notin \mathrm{dom}(q) \end{cases}$$

- $\forall_f : A_q \to A_p$ — **extension by $\top$**:

$$(\forall_f w)(s, o) := \begin{cases} w(s, o) & (s, o) \in \mathrm{dom}(q) \\ \top & (s, o) \notin \mathrm{dom}(q). \end{cases}$$

These satisfy $\exists_f w \leq_k v \iff w \leq_k f^* v$ and $v \leq_k \forall_f w \iff f^* v \leq_k w$, giving the hyperdoctrinal chain $\exists_f \dashv f^* \dashv \forall_f$.

## Proof

Both adjunctions are checked pointwise.

For $\exists_f \dashv f^*$: $\exists_f w \leq_k v$ holds iff $(\exists_f w)(s, o) \leq_k v(s, o)$ at every cell. On $\mathrm{dom}(q)$, this is $w(s, o) \leq_k v(s, o)$. Off $\mathrm{dom}(q)$, it is $\bot \leq_k v(s, o)$, which always holds. So $\exists_f w \leq_k v$ iff $w \leq_k f^* v$.

For $f^* \dashv \forall_f$: $v \leq_k \forall_f w$ requires $v(s, o) \leq_k w(s, o)$ on $\mathrm{dom}(q)$ and $v(s, o) \leq_k \top$ off, the latter always holding. So $v \leq_k \forall_f w$ iff $f^* v \leq_k w$. $\square$

## $\leq_t$-system

For the [truth order](../concepts/truth-order.md), specialization $f : q \to p$ admits parallel $\leq_t$-adjoints:

- $\exists_f^t : A_q \to A_p$ — **extension by $\mathbf{f}$** (the $\leq_t$-bottom):

$$(\exists_f^t w)(s, o) := \begin{cases} w(s, o) & (s, o) \in \mathrm{dom}(q) \\ \mathbf{f} & (s, o) \notin \mathrm{dom}(q) \end{cases}$$

- $\forall_f^t : A_q \to A_p$ — **extension by $\mathbf{t}$** (the $\leq_t$-top):

$$(\forall_f^t w)(s, o) := \begin{cases} w(s, o) & (s, o) \in \mathrm{dom}(q) \\ \mathbf{t} & (s, o) \notin \mathrm{dom}(q). \end{cases}$$

The adjunction check parallels the $\leq_k$ case: $\exists_f^t w \leq_t v$ iff cellwise $w \leq_t v$ on $\mathrm{dom}(q)$ and $\mathbf{f} \leq_t v$ off (always). So $\exists_f^t \dashv f^* \dashv \forall_f^t$ in the $\leq_t$-enrichment.
