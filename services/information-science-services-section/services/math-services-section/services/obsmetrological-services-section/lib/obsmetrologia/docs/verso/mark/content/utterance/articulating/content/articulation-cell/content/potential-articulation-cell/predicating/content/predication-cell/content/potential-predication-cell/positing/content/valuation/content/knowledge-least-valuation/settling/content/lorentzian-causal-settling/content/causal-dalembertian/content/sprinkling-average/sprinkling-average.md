---
type: theorem
status: stable
class: discrete-projection
symbol: "\\langle \\Box_{BD} \\rangle"
depends-on: [causal-dalembertian, sprinkled-causal-set-settling, einstein-hilbert-action, probability-theory]
see-also: [continuum-lorentzian-limit, myrheim-meyer-dimension, landauer-entropy]
---

# The sprinkling average of the Benincasa–Dowker operator

The [causal d'Alembertian](../../causal-dalembertian.md), read on the unit field and grouped by interval
abundance, is a **layer occupation sum**
$$\Box_{BD}\,\mathbf 1(x) \;=\; \sum_{k} c(k)\, N_k(x), \qquad N_k(x) := |L_k(x)|,$$
the coefficient $c(k)$ weighting the number $N_k$ of strict-past events at abundance $k$. Its physical
content is statistical: in causal-set gravity the operator is read against a *random*
[Poisson sprinkling](../../../sprinkled-causal-set-settling/sprinkled-causal-set-settling.md), and what
fixes the coefficient sequence $c$ is the behaviour of the **sprinkling average**
$\langle \sum_k c_k N_k\rangle$ as the density $\rho\to\infty$.

This node records the discrete, exp-free projection of that average — the part provable now — and marks
the analytic part honestly.

## What is green: the average and the moments that shape it

**The average commutes with the operator.** The layer occupation sum is linear in the occupation
profile $N$, so the sprinkling expectation passes straight through it:
$$\Big\langle \sum_k c_k\, N_k(\omega)\Big\rangle \;=\; \sum_k c_k\, \langle N_k\rangle.$$
The BD coefficients act on the **mean sprinkling** — the discrete content of "the operator is read
against the Poisson average." This is `bdLayerSum_expectation` (`Obsmetrologia.Lorentzian.SprinklingAverage`),
built from the layer sum's additivity (`bdLayerSum_add`) and the linearity of the integer expectation
(`expValZ_add`, `expValZ_smul`). *(Built+green; axiom-free.)*

**The coefficients are the operator's response to polynomial mean-fields.** The layer sum against a
monomial mean-occupation profile $N_k = k^{j}$ is exactly the $j$-th Benincasa–Dowker **moment**:
$$\sum_{k<n} c(k)\, k^{j} \;=\; m_j(c).$$
This is `bdLayerSum_eq_moment`. So the moment conditions of the
[BD coefficients](../../../einstein-hilbert-action/einstein-hilbert-action.md) are *precisely* the
sprinkling-average statement: the 2D stencil $(1,-2,1)$ annihilates a constant mean-field ($m_0 = 0$)
and an affine one ($m_1 = 0$) and first couples at second order ($m_2 = 2$) — to curvature. This is
`bdLayerSum_moment_response`, read through `bdCoeff2_moments`. The coefficients are *forced* by which
modes of the averaged sprinkling the operator kills. *(Built+green.)*

**A concrete sprinkling.** The diamond apex's realized occupation profile is $(2,0,1)$; its layer sum
against $(1,-2,1)$ is $3$ (`diamond_bd2_layerSum`), and a two-point ensemble (diamond apex plus an
empty sprinkling) realizes the average concretely (`pair_sprinkling_average`). *(Built+green.)*

## Endogenous coefficients — the Möbius inverse grouped by abundance

The sharpest form of "not externally dimension-fitted" drops the posited `c` entirely. Take the causal
order itself, compute its incidence-algebra **Möbius inverse** $\mu(y,x)$, and **group those weights by
past-layer abundance**:
$$c^{\mathrm{endo}}(x,k) \;:=\; \sum_{y \in L_k(x)} \mu(y,x), \qquad L_k(x) = \{y \prec x : |I(y,x)| = k\}.$$
This coefficient is read straight off the poset — no dimension parameter $d$ appears anywhere. The
discrete action then reconstructs from it with **no fit**:
$$\sum_x \Box\mathbf 1(x)\big|_{\text{strict}} \;=\; \sum_k c^{\mathrm{endo}}(x,k),$$
the strict-past column Möbius sum equals the sum of the endogenous layer coefficients
(`endo_reconstructs_action`, `Obsmetrologia.Lorentzian.EndogenousCoefficients`). The engine is a pure
combinatorial regrouping — a weighted list sum equals the layer sum of its per-abundance masked sums
(`sum_by_key`) — so curvature is endogenous to the poset, not calibrated against a manifold.

At the diamond the endogenous coefficients are $(c^{\mathrm{endo}}_0, c^{\mathrm{endo}}_1,
c^{\mathrm{endo}}_2) = (-2, 0, +1)$, summing to the strict action $-1$ (`diamond_endoCoeff`,
`diamond_action_is_layer_sum`). And they **factor through** the posited layer-constancy coefficients:
$c^{\mathrm{endo}}(x,k) = c_{\mathrm{Diamond}}(k)\cdot|L_k(x)|$ (`diamond_endoCoeff_factors`) — so the
posited per-element $c$ is *recovered* as the layer-averaged factor of the Möbius grouping, never
assumed. *(Built+green.)*

## The continuum limit is a Scott colimit (shape), not the magnitude

The `V → ∞` continuum limit splits cleanly into **shape** and **magnitude**, and the shape half is now
green. The tower of sprinkled settlings, ordered by refinement, is a `≤ₖ`-directed family; over the
finite charge model (as `Closure.ScottContinuousClosure` treats the closure ordinal `κ`) its
`⋁ₖ`-join is **attained** — `sup S ∈ S`. So any `≤ₖ`-monotone functional of the settling — the action,
the curvature, the Euler characteristic — **commutes with the directed join** and its continuum value
is *realized at a finite stage* of the tower (`action_commutes_with_join`, `action_limit_attained`,
`Obsmetrologia.Lorentzian.ContinuumColimit`). The continuum limit is therefore a **directed-join colimit
reached at a finite `V`, not an ε–δ limit approached from below**: the limit lives in the corpus's
settling machinery, no real-analytic limit required. *(Built+green.)*

What stays open is the **magnitude / scaling constant**: that the mean occupation $\langle
N_k\rangle$ of a Poisson sprinkling scales as $\rho\,V_k$ with the order-interval volumes $V_k$, and
that with the moment conditions in force the $\rho\to\infty$ expansion of $\sum_k c_k \langle
N_k\rangle$ leaves exactly the continuum Ricci term — the
[Benincasa–Dowker result](../../../einstein-hilbert-action/einstein-hilbert-action.md) $\langle S\rangle
\to -\tfrac14\int R\sqrt{-g}$. That metric contraction (the symmetric curvature weighted by $\sqrt{-g}$)
and the Poisson layer-volume asymptotics are the genuine analytic frontier. *(Roadmap.)*

So the corpus contributes the **structure** of the sprinkling average — the BD coefficients acting on
the mean profile, the moments as its response to polynomial mean-fields, and the limit's **colimit
shape** — and leaves the **scaling constant** (the `−¼` and `√g` of `R` proper) to the analytic
frontier. Shape: green. Magnitude: open.

## Position

The sprinkling average is generated by the causal d'Alembertian (the operator must exist before it can
be averaged) together with the sprinkling measure. It is the bridge from the exact incidence operator
to the statistical Benincasa–Dowker operator of causal-set gravity: the coefficients $(1,-2,1)$,
$(1,-9,16,-8)$ are not calibrated against Minkowski but **fixed by the moment conditions**, which this
node shows *are* the sprinkling-average response to constant, affine, and higher mean-fields.
