---
id: instability-width-tower
name: InstabilityWidthTower
description: "Basic properties of the instability interval [Env_t(a), Stab_t(a)] and conjecture that its width decreases geometrically at rate φ^{-1} as the tower ascends."
---

### Theorem — Instability Width and the Tower {#instability-width-tower}

#### The Instability Interval {#iwt-interval}

The stabilization-envelope dyad (§stabilization-envelope-dyad) defines for each
fiber element $a \in H_t$ the instability interval
$$
[\mathrm{Env}_t(a),\; \mathrm{Stab}_t(a)] \;\subseteq\; H_t
$$
where $\mathrm{Stab}_t(a)$ is the smallest stable element above $a$ and
$\mathrm{Env}_t(a)$ is the largest element below $a$ from which stabilization can
reach $a$. The width of this interval measures how far $a$ is from being settled.

#### Basic Properties {#iwt-basic}

The following properties hold by definition:

1. **Containment**: $\mathrm{Env}_t(a) \leq a \leq \mathrm{Stab}_t(a)$ for all
   $a \in H_t$.

2. **Vanishing at fixed points**: $\mathrm{Env}_t(a) = a = \mathrm{Stab}_t(a)$ if
   and only if $a$ is a fixed point of $\sigma_t$ — that is, $\sigma_t(a) = a$.

3. **Monotonicity**: if $a \leq b$ then $\mathrm{Env}_t(a) \leq \mathrm{Env}_t(b)$
   and $\mathrm{Stab}_t(a) \leq \mathrm{Stab}_t(b)$.

4. **Tower contraction**: if $a^{(n)}$ denotes the image of $a$ in $H_t^{(n)}$
   after level-$n$ normalization, the interval $[\mathrm{Env}_t(a^{(n)}),
   \mathrm{Stab}_t(a^{(n)})]$ is contained in the interval at level $n-1$.

Property (4) says that the tower progressively tightens the interval — each level
of normalization reduces the distance between the envelope and the stabilization.

#### Conjecture — Geometric Width Decrease {#iwt-conjecture}

**Conjecture (Instability Width Tower).** Let $w_n(a)$ denote the width of the
instability interval of $a$ at tower level $n$, measured by the length of a maximal
chain in $[\mathrm{Env}_t(a^{(n)}), \mathrm{Stab}_t(a^{(n)})]$. Then:

$$
w_{n+1}(a) \;\leq\; \varphi^{-1} \cdot w_n(a)
$$

where $\varphi = \tfrac{1+\sqrt5}{2}$ is the golden ratio. Equivalently, the width
decreases at rate $\varphi^{-1}$ per tower level.

#### Why $\varphi^{-1}$ {#iwt-golden}

The transfer matrix of the nuclear pair $(\sigma_t, \Delta_t)$ is
$\begin{pmatrix} 1 & 1 \\ 1 & 0 \end{pmatrix}$ with Perron-Frobenius eigenvalue
$\varphi$ (§golden-stability, §nuclear-fibonacci-recurrence). This matrix governs
how mode counts grow as the tower ascends.

The instability width is dual to the mode count: width measures unresolved
instability, while mode count measures settled content. If mode count grows at rate
$\varphi$ per level, instability width should decrease at rate $\varphi^{-1}$ per
level — each application of $U_{\mathcal{H}}$ resolves a $\varphi^{-1}$ fraction of
the remaining instability.

The conjecture connects the golden ratio as growth rate (§golden-stability) to the
golden ratio as contraction rate — two sides of the same $\varphi$-structure.

#### Connection to Zeno Settling {#iwt-zeno}

The Zeno settling gap (§zeno-settling) concerns elements whose normalization
sequences do not terminate at any finite tower level. For such elements,
$w_n(a) > 0$ for all $n$, but $w_n(a) \to 0$ as $n \to \infty$ (by the contraction
property). If the geometric rate $\varphi^{-1}$ holds, the convergence to zero is
at an explicit rate:
$$
w_n(a) \leq w_0(a) \cdot \varphi^{-n}.
$$

This makes the Zeno gap quantitatively precise: the width at level $n$ is bounded
by $\varphi^{-n}$ times the initial width.

#### What Remains to Prove {#iwt-open}

- **Properties (1)–(3)**: formal proofs from the definitions in
  §stabilization-envelope-dyad.
- **Property (4)**: that the tower is contracting — each level reduces the interval.
- **The $\varphi^{-1}$ rate**: the main conjecture, requiring a connection between
  the transfer matrix eigenvalue and the geometric contraction of the instability
  interval.
