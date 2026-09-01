---
id: restriction-velocity
name: RestrictionVelocity
description: "Conjectures a maximum restriction rate for information flow through fiber restriction maps, bounded by Fischer-Rao curvature and decreasing in high-spectral-mass regions."
---

### Conjecture — Restriction Velocity and Information Propagation {#restriction-velocity}

#### The Mathematical Claim {#restriction-velocity-math}

A restriction map $H(f) : H_{t'} \to H_t$ for $f : t \to t'$ in $T$ (meaning $t \leq t'$,
i.e., $t'$ extends $t$ by $|f| := \mathrm{len}(t') - \mathrm{len}(t)$ history steps) carries
information from the longer history $t'$ back to the shorter history $t$. The **information
content** of this map is measured by how much of $H_{t'}$ survives restriction:
$$
\mathrm{Throughput}(f) \;:=\; \frac{\dim_K V_t}{\dim_K V_{t'}}
\;=\; \frac{|H_t^*|}{|H_{t'}^*|} \;\in\; (0, 1],
$$
where $V_t = K^{H_t^*}$ is the mode sheaf fiber (§spectral-decomposition). A value of
$1$ means no information is lost; a value near $0$ means almost all of $H_{t'}$ collapses
to $H_t$.

**Definition — Restriction Rate.** The **restriction rate** along $f$ is the throughput
per history step:
$$
v(f) \;:=\; \frac{\log \mathrm{Throughput}(f)}{|f|}
\;=\; \frac{\log |H_t^*| - \log |H_{t'}^*|}{|f|}.
$$
Since $|H_t^*| \leq |H_{t'}^*|$ (adding history steps can only increase the fixed fiber
— longer history has at least as many stable propositions), $v(f) \leq 0$. The
**magnitude** $|v(f)|$ measures the rate of information loss per step.

**Conjecture — Curvature Bound.** The restriction rate magnitude $|v(f)|$ is bounded
from above by a constant $v_{\max}$ (the **maximum restriction velocity**), and this
bound is achieved along geodesics in the Fischer–Rao metric on $\mathcal{M}_n$
(§fischer-rao-metric). Furthermore, $v_{\max}$ decreases in regions of high Fischer–Rao
curvature $K(\mathcal{M}_n)$:
$$
v_{\max}(t) \;\propto\; \frac{1}{1 + \alpha \cdot K(\mathcal{M}_n, R_t)}
$$
for some constant $\alpha > 0$, where $K(\mathcal{M}_n, R_t)$ is the scalar curvature of
the moduli space at the point corresponding to the relational universe at depth $n$
containing history $t$.

The motivation: in high-curvature regions (far from the fixed point $R = U_G(R)$, with
many trapped modes and large $M_t(\delta)$), the mode sheaf is highly non-trivial.
Restriction maps must "compress" more information into each step, and this compression
is bounded. The Fischer–Rao curvature measures this compression demand.

**Corollary — Effective Restriction Velocity.** Define the **effective restriction velocity**
at history $t$:
$$
c_{\mathrm{eff}}(t) \;:=\; v_{\max}(t) \;=\; \frac{v_0}{1 + \alpha \cdot M_t(\delta)},
$$
where $v_0$ is the flat-space restriction velocity (at the fixed point, where $M_t(\delta) = 0$
and $K(\mathcal{M}_n, R_t) = 0$) and the proportionality $K \propto M_t(\delta)$ is
motivated by the Fischer–Rao convergence result (§fischer-rao-convergence: curvature
concentrates near points with large spectral mass). The effective velocity decreases
monotonically as $M_t(\delta)$ increases.

**Note on what this is not.** The restriction map $H(f) : H_{t'} \to H_t$ acts on
propositions, not on physical positions or times. "Restriction velocity" is a rate in
abstract history depth. Any correspondence with a physical propagation speed belongs in
§light-propagation.

**Status.** Stub. Requires: (a) a proof or counterexample to the curvature bound
$|v(f)| \leq v_{\max}(t)$; (b) a precise proportionality $K(\mathcal{M}_n, R_t) \propto M_t(\delta)$
derived from Fischer–Rao geometry; (c) an explicit computation of $v(f)$ in a concrete history model to verify that the bound is non-trivial.

*See §light-propagation for physical interpretation.*
