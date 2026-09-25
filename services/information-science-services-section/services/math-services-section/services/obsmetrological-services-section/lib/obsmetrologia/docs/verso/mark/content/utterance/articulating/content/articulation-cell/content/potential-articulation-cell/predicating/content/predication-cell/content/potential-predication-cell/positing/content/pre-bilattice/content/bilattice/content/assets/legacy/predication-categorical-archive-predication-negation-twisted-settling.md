---
type: definition
class: settling-transformation
symbol: "\\sim(v)"
depends-on: [predication-settling, negation, bilattice, settling-monotonicity]
see-also: [antonymy, negation-invisibility, negation-involution-on-settling-category, klein-four-symmetry]
---

# Negation-twisted settling

Let $v = (v_\tau)_{\tau < \lambda}$ be a [predication settling](predication-settling.md) over $(\mathbf{L}, \mathcal{C}, E, \lambda)$, and let $\sim$ be the [negation](../morphisms/negation.md) on $\mathbf{L}$. The **negation-twisted settling** of $v$ is

$$\sim(v) \;=\; (\sim \circ\, v_\tau)_{\tau < \lambda},$$

defined pointwise: $(\sim(v))_\tau(q) = \sim(v_\tau(q))$ for every $q \in \mathcal{C}$ and $\tau < \lambda$.

## Well-definedness

$\sim(v)$ is a valid predication settling over the same base $(\mathbf{L}, \mathcal{C}, E, \lambda)$. [Settling monotonicity](teaching/explanations/settling-monotonicity.md) requires $(\sim(v))_\sigma(q) \leq_k (\sim(v))_\tau(q)$ for $\sigma \leq \tau$. Since $v_\sigma(q) \leq_k v_\tau(q)$ (by $v$'s monotonicity) and $\sim$ is [monotone in $\leq_k$](../morphisms/negation.md) ($a \leq_k b \Rightarrow \sim a \leq_k \sim b$), we get $\sim(v_\sigma(q)) \leq_k \sim(v_\tau(q))$. $\square$

## Regime preservation

$\sim(v)$ and $v$ are in the same [regime](../../../../../../valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md). Both settling closure ordinals are determined by the stage at which the $\leq_k$-ascending chain $(v_\tau(q))_{\tau < \lambda}$ stabilizes pointwise. Since $\sim$ is a $\leq_k$-automorphism (monotone and involutive in $\leq_k$), it preserves stabilization stages: the chain $(\sim(v_\tau(q)))_{\tau < \lambda}$ stabilizes at the same ordinal as $(v_\tau(q))_{\tau < \lambda}$.

## Firing-pattern preservation

On $\mathbf{FOUR}$: $\sim$ fixes $\bot$ ($\sim \bot = \bot$) and fixes $\top$ ($\sim \top = \top$), swapping only $\mathbf{t} \leftrightarrow \mathbf{f}$. Consequently $v_\tau(q) = \bot$ iff $(\sim(v))_\tau(q) = \bot$: the two settlings have identical designated-cell firing patterns. The negation-twist changes evidence polarity — which side of the truth/falsity divide a cell's evidence lands on — without changing when cells acquire evidence.

## Involution

$\sim(\sim(v)) = v$ — the negation-twist is its own inverse. This follows from the involutivity of $\sim$ on $\mathbf{L}$ ($\sim\sim a = a$), applied pointwise.

## Contrast with conflation

Applying [conflation](../morphisms/conflation.md) $-$ pointwise gives $(-(v))_\tau(q) = -(v_\tau(q))$. Since $-$ is $\leq_k$-antitone, $-(v)$ is $\leq_k$-descending — not a valid predication settling. Conflation does not give a well-defined settling-level twist; it acts at the sheaf level through the spatial component of the composed duality $\mathbb{D} = \mathbb{D}_{\mathrm{sp}} \circ \mathbb{D}_{\mathrm{val}}$.
