---
name: joining by knowledge
description: The binary join ∨_k of the order-of-knowledge, lifted pointwise from a bilattice value to a predication-valuation. For valuations v, v', the joined valuation (v ∨_k v')(p) := v(p) ∨_k v'(p) at each predicate p, with the pointwise join on the predication-fiber-algebra. A bounded join-semilattice operation: commutative, associative, idempotent, with the all-⊥ valuation as identity.
agent-noun: joiner-by-knowledge
gerund: joining-by-knowledge
---

The binary operation $\vee_k$ on [predication-valuations](../structures/predication-valuation.md) that joins two valuations pointwise in the [order-of-knowledge](../../prose/teaching/explanations/order-of-knowledge.md) at each [predication-cell](../structures/predication-cell.md).

## Definition

Fix a residuated lattice $\mathbf{L}$, a [predicate-category](../structures/predicate-category.md) $\mathcal{C}$, and an [entity-set](../structures/entity-set.md) $E$. For [predication-valuations](../structures/predication-valuation.md) $v, v'$ over $(\mathbf{L}, \mathcal{C}, E)$, the joining-by-knowledge $v \vee_k v'$ is the valuation defined pointwise at each predicate $p$:

$$(v \vee_k v')(p) \;:=\; v(p) \vee_k v'(p) \qquad \text{in } A_p,$$

where the right-hand $\vee_k$ is the join in the [predication-fiber-algebra](../structures/predication-fiber-algebra.md) $A_p$ at $p$. The fiber-algebra join is itself the pointwise lift of $\vee_k$ from the [bilattice](../structures/bilattice.md) $\mathbf{L}^\bowtie$ across the entity-pair index $E \times E$: for $\alpha, \beta \in A_p$, $(\alpha \vee_k \beta)(s, o) := \alpha(s, o) \vee_k \beta(s, o)$ in $\mathbf{L}^\bowtie$.

The bilattice-level $\vee_k$ — the binary join of the second lattice $\langle B, \wedge_k, \vee_k\rangle$ of the [pre-bilattice](../structures/pre-bilattice.md) — is the atomic content that propagates upward by these two pointwise lifts to deliver joining-by-knowledge at the predication-valuation level.

## Algebraic properties

Joining-by-knowledge is a bounded join-semilattice operation on the set of predication-valuations over a fixed base $(\mathbf{L}, \mathcal{C}, E)$. Four properties hold, each inherited by pointwise lift from the corresponding property at the bilattice level:

| Property | Statement | Source |
|---|---|---|
| Commutativity | $v \vee_k v' = v' \vee_k v$ | $\vee_k$ on $\mathbf{L}^\bowtie$ is a lattice join — commutative per the second-lattice axioms in [pre-bilattice](../structures/pre-bilattice.md); the pointwise lift across $E \times E$ and across $\mathcal{C}$ preserves commutativity. |
| Associativity | $(v \vee_k v') \vee_k v'' = v \vee_k (v' \vee_k v'')$ | $\vee_k$ on $\mathbf{L}^\bowtie$ is associative per the second-lattice axioms; the pointwise lift preserves associativity. |
| Idempotence | $v \vee_k v = v$ | $\vee_k$ on $\mathbf{L}^\bowtie$ is idempotent ($a \vee_k a = a$) per the lattice axioms; the pointwise lift preserves idempotence. |
| Identity | $v \vee_k \mathbf{0} = v$, where $\mathbf{0}$ is the all-$\bot$ valuation | $\bot$ is the bottom of $\leq_k$ on $\mathbf{L}^\bowtie$ per [pre-bilattice](../structures/pre-bilattice.md) (bounded second lattice with bottom $\bot$), so $a \vee_k \bot = a$ for every $a \in \mathbf{L}^\bowtie$; the all-$\bot$ valuation lifts this identity pointwise. |

The pointwise-lift discipline is established in [predication-fiber-algebra](../structures/predication-fiber-algebra.md), which records that the bilattice operations on $\mathbf{L}^\bowtie$ lift pointwise to $A_p$. The second lift — from $A_p$ across predicates to the predication-valuation level — is the same construction iterated.

## Lifts to higher structures

The same pointwise-lift mechanism extends joining-by-knowledge to richer structures:

- **Predication-settling level.** For [predication-settlings](../structures/predication-settling.md) $v = (v_\tau)_{\tau < \lambda}$ and $v' = (v'_\tau)_{\tau < \lambda}$ over a common base, the joined settling $(v \vee_k v')_\tau(p) := v_\tau(p) \vee_k v'_\tau(p)$ is itself a predication-settling. Settling-monotonicity is preserved: if $\sigma \leq \tau$ then $v_\sigma(p) \leq_k v_\tau(p)$ and $v'_\sigma(p) \leq_k v'_\tau(p)$, so $v_\sigma(p) \vee_k v'_\sigma(p) \leq_k v_\tau(p) \vee_k v'_\tau(p)$ by lattice monotonicity. The algebraic properties transfer at this level by pointwise lift across the settling index $\lambda$.

- **Stratified-fiber level.** When values are atom-collections (each atom carrying value, attribution, timestamp, deps) rather than bilattice values directly, joining-by-knowledge extends to an atom-union with per-canonical-identity $\vee_k$ on the value field. Atoms differing in context-tuple coordinates (stratum, peer, session, ord, deps, derived-via) are retained as distinct; the result is a state-based CRDT join operation. That extension depends on stratified-predication-fiber and is the subject of a separate record (forthcoming).

## Closure-merge commutation

Joining-by-knowledge and the [closure-operator](closure-operator.md) interact via the closure-merge commutation lemma:

$$\mathrm{cl}_p(\mathrm{cl}_p(v(p)) \vee_k w(p)) \;=\; \mathrm{cl}_p(v(p) \vee_k w(p)).$$

Proof: by inflationarity, $v(p) \leq_k \mathrm{cl}_p(v(p))$, so $v(p) \vee_k w(p) \leq_k \mathrm{cl}_p(v(p)) \vee_k w(p)$; by monotonicity of $\mathrm{cl}_p$, $\mathrm{cl}_p(v(p) \vee_k w(p)) \leq_k \mathrm{cl}_p(\mathrm{cl}_p(v(p)) \vee_k w(p))$. Conversely, $\mathrm{cl}_p(v(p)) \leq_k \mathrm{cl}_p(v(p) \vee_k w(p))$ and $w(p) \leq_k \mathrm{cl}_p(v(p) \vee_k w(p))$ by monotonicity of $\vee_k$-join followed by inflationarity, so $\mathrm{cl}_p(v(p)) \vee_k w(p) \leq_k \mathrm{cl}_p(v(p) \vee_k w(p))$; applying $\mathrm{cl}_p$ and using idempotence gives the reverse inequality. $\square$

This lemma is what makes the canonical settling update step

$$v_{\tau+1}(p) = \mathrm{cl}_p(v_\tau(p) \vee_k u_{\tau+1}(p))$$

(per [predication-settling](../structures/predication-settling.md)) order-independent across replicas — each replica may apply closure independently, then join, and the result equals what would have been obtained by joining first and closing once.

The composite "join then close" is the operationally-correct order. Reversing it ("close then join") in general gives a different result, because closure-of-join may derive consequences that closure-of-each-then-join cannot see.

## Knowledge-monotonicity

Joining-by-knowledge is knowledge-monotone:

$$v \leq_k v \vee_k v' \quad \text{and} \quad v' \leq_k v \vee_k v'.$$

There is no sequence of $\vee_k$-joins on a fixed valuation that lowers any of its cells' $\leq_k$-positions. The [claim substrate-layer-stigmergy](../../prose/learning/claims/substrate-layer-stigmergy.md) reads this as the algebra-side reason `posit`-style operations admit no inverse: retractions appear as further $\vee_k$-rises toward $\top$, not as decreases.

## Not synonymous with

- **The bilattice operation $\vee_k$ at a single value.** That is the atomic content joining-by-knowledge lifts. The atomic operation lives in [pre-bilattice](../structures/pre-bilattice.md) and [bilattice](../structures/bilattice.md); this transformer is the lift across the pointwise chain (bilattice value → fiber algebra → predication-valuation).
- **The [closure-operator](closure-operator.md).** Closure is unary, iterates inference rules to fixed point; joining-by-knowledge is binary, takes the join of two valuations algebraically. The two compose (canonical update is *join then close*) but are categorically distinct: closure is the [closure-2-monad](closure-2-monad.md)'s algebra structure; joining-by-knowledge is the underlying join-semilattice operation.
- **[Joining-by-truth](joining-by-truth.md).** The transverse operation in the order-of-truth: $(v \vee_t v')(p)(s, o) := v(p)(s, o) \vee_t v'(p)(s, o)$. Different operation, different order. (Forthcoming record.)
- **[Twist-product-fusion](twist-product-fusion.md).** The monoidal product $\odot$ of the residuated-lattice structure on $\mathbf{L}^\bowtie$ — non-integral, with unit $\top$ and absorber $\mathbf{f}$. Distinct operation from the lattice join $\vee_k$.
