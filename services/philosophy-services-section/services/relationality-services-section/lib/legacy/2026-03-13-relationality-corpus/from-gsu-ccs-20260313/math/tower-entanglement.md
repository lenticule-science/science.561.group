---

name: tower-entanglement
description: "the fiber factoring that History Separation guarantees within a fixed universe fails after tower-level promotion — fibers become entangled across levels, with entanglement monotone non-decreasing in tower level."
---

### Conjecture — Tower Entanglement {#tower-entanglement}

#### Setup {#te-setup}

History Separation (§history-separation) states that no nontrivial automorphism
$\alpha: T \to T$ preserving $J$ satisfies $\alpha^* H^* \cong H^*$. The semantic
content is that distinct histories have distinct fiber structures — fibers are
separated at the level of a fixed universe $R^{(0)}$.

The hyperverse tower (§hyperverse-tower) promotes $R^{(0)}$ to $R^{(1)}, R^{(2)},
\ldots$ by applying $U_{\mathcal{H}}$ iteratively. Each promotion adds new fiber
content — new elements of $H_t$ that did not exist at the previous level. The
conjecture concerns what happens to the separation structure during this promotion.

#### The Conjecture {#te-conjecture}

**Conjecture (Tower Entanglement).** Let $E(t, n)$ denote the degree of fiber
entanglement at history $t$ and tower level $n$, defined as the failure of local
factoring: the extent to which $H_t^{(n)}$ cannot be expressed as a product of
contributions from sub-histories of $t$ independently.

Then:

1. $E(t, 0) = 0$ for all $t$ — at the base universe, History Separation guarantees
   that fibers factor over their sub-history contributions.

2. $E(t, n+1) \geq E(t, n)$ — entanglement is non-decreasing in tower level.

3. There exist histories $t$ and levels $n$ where $E(t, n+1) > E(t, n)$ — the
   entanglement is strictly increasing for at least some histories at each level.

#### Why Promotion Entangles {#te-mechanism}

At each tower level, the new fiber elements of $H_t^{(n+1)}$ are those that are
inexpressible in the level-$n$ nuclear language — elements with no level-$n$ preimage
(§completeness-tower-stratification). These new elements encode correlations between
sub-history fibers that the level-$n$ language could not name.

Specifically: a level-$(n+1)$ element $a \in H_t^{(n+1)}$ that is inexpressible at
level $n$ witnesses a constraint that relates the values of $H_s^{(n)}$ for
independent sub-histories $s \leq t$ in a way that $H_t^{(n)}$ does not reflect.
This cross-fiber constraint is entanglement.

The analogy is to quantum entanglement: just as an entangled state cannot be written
as a product of local states, an entangled fiber element cannot be written as a
product of sub-fiber elements.

#### Connection to History Separation {#te-separation}

History Separation at level $n$ says fibers are separated. This is not entanglement
at that level: fibers factor, so $H_t^{(n)}$ is determined by local data. But the
promotion $R^{(n)} \to R^{(n+1)}$ adds elements that encode non-local correlations,
breaking this factoring.

The conjecture implies that the hyperverse tower is a machine that progressively
entangles — that the cost of ascending the tower is that local factoring breaks down.
The limit $\mathcal{H}$ may have no factoring at all: all fiber elements may encode
non-local constraints at some tower level.

#### What Remains to Prove {#te-open}

- **Definition of $E(t, n)$**: a formal definition of the entanglement monotone that
  captures failure of local factoring in the fiber algebra setting.
- **Base case $E(t, 0) = 0$**: a proof that History Separation implies the factoring
  condition at the base level.
- **Monotonicity**: that promotion does not decrease entanglement — even if it adds
  new elements, it cannot remove the correlations already present.
- **Strict increase**: identifying the first level and first history where entanglement
  increases, and showing this is non-empty.
