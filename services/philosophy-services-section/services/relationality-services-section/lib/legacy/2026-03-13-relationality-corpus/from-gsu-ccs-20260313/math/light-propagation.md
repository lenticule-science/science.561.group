---

name: light-propagation
description: "Observer-Dependent Speed of Light as Maximum Restriction Rate"
---

### Conjecture — Observer-Dependent Speed of Light as Maximum Restriction Rate {#light-propagation}

*The speed of light is not a given constant. It is the local maximum restriction rate:
the maximum fraction of information per history step that can propagate from a longer
trace back to a shorter one, as measured in the Fischer–Rao geometry of the moduli
space. In flat space — at the fixed point where $M_t(\delta) = 0$ — every observer
agrees on this maximum, recovering the invariant $c$ of special relativity. In curved
or dense regions, the local maximum decreases with spectral mass, making $c$ a field
rather than a constant. Different observers at different history coordinates measure
different local speeds of light.*

---

#### The Mathematical Structures {#lp-math}

- **Restriction rate** (§restriction-velocity): the throughput of a morphism
  $f: t \to t'$ (with $t \leq t'$) is
  $$
  \mathrm{Throughput}(f) \;=\; \frac{|H_t^*|}{|H_{t'}^*|} \;\in\; (0,1],
  $$
  the fraction of invariant modes that survive restriction. The effective maximum
  restriction velocity at history $t$ is
  $$
  c_{\mathrm{eff}}(t) \;=\; \frac{v_0}{1 + \alpha \cdot M_t(\delta)},
  $$
  where $v_0$ is the flat-space maximum (achieved when $M_t(\delta) = 0$) and
  $\alpha > 0$ is a coupling constant.

- **Fischer–Rao curvature bound** (§fischer-rao-metric, §riemannian-moduli): the curvature
  $K(\mathcal{M}_n, R_t) \propto M_t(\delta)$ of the moduli space at the point
  corresponding to history $t$. The curvature bound on the restriction rate
  $c_{\mathrm{eff}}(t) = v_0/(1 + \alpha K)$ identifies the Fischer–Rao curvature as
  the mechanism that caps the local maximum propagation speed.

- **The flat-space limit**: at the fixed point $R = U_G(R)$, the spectral mass
  $M_t(\delta) = 0$ for all $t$, the Fischer–Rao curvature vanishes, and
  $c_{\mathrm{eff}}(t) = v_0$ uniformly. Every history coordinate agrees on the same
  maximum restriction rate: a universal constant.

---

#### The Speed of Light as Maximum Restriction Rate {#lp-identification}

**The identification.** Light propagation — transmission of a signal from one
spacetime point to another — corresponds relationally to the propagation of
information along restriction maps: from a longer history (the source event) back
to a shorter history (the receiver event). The local maximum rate at which this
can happen in one history step is $c_{\mathrm{eff}}(t)$.

**Why a maximum and not a fixed value.** The restriction map $H(f): H_{t'} \to H_t$
has throughput $\leq 1$ by construction: it can only preserve or lose information.
The ceiling $\mathrm{Throughput}(f) = 1$ (no information loss) is achieved only
when $H(f)$ is an isomorphism — i.e., on the settled layer $H^*_t$, where
restriction maps are isomorphisms of fixed-point algebras (§fixed-fiber). The
maximum restriction rate $v_0$ is the rate of information propagation through
fully settled content, which can be transmitted without loss. Unsettled content
(modes in the spectral interior) drags the throughput below $v_0$.

**Observer-dependence.** An observer at history $t$ with $M_t(\delta) > 0$ has a
local maximum restriction rate $c_{\mathrm{eff}}(t) < v_0$. An observer at history
$t'$ with $M_{t'}(\delta) \approx 0$ has a local maximum close to $v_0$. The ratio
$$
\frac{c_{\mathrm{eff}}(t)}{c_{\mathrm{eff}}(t')}
\;=\; \frac{1 + \alpha M_{t'}(\delta)}{1 + \alpha M_t(\delta)}
$$
is less than 1 when the first observer is in a denser region. Different observers
measure different local $c$ — not as a failure of special relativity, but as a
correction to its flat-space idealization.

**Recovery of special relativity.** In the flat-space limit ($M_t(\delta) = 0$
globally), every observer at every history coordinate sees the same maximum restriction
rate $v_0$. The invariance of $c$ — the cornerstone of special relativity — is
recovered as the $M_t(\delta) \to 0$ limit. Special relativity is the theory of
the fixed-point fiber $H^*$: the settled, nucleus-free substructure in which all
restriction maps are isomorphisms and all observers agree.

---

#### Correspondence with General Relativity {#lp-gr}

**Gravitational time dilation.** In GR, a clock in a gravitational potential runs
slower by $\sqrt{1 - 2GM/rc^2}$. Relationally: an observer in a deep gravitational
well sits at a history $t$ with high spectral mass $M_t(\delta)$ (the well's mass
contributes to the local spectral density). Their local $c_{\mathrm{eff}}(t) < v_0$.
Light they emit reaches a flat-space observer as if from a slower-$c$ medium:
it appears redshifted and delayed — gravitational time dilation and redshift.

**Shapiro delay.** The extra travel time of a signal passing near a massive body
is, relationally, the signal passing through high-$M_t$ histories where $c_{\mathrm{eff}}$
is reduced. The delay:
$$
\Delta t_{\mathrm{Shapiro}} \;\propto\; \alpha \cdot \int_{\mathrm{path}} M_t(\delta)\,d\ell.
$$
In dark-matter-dominated regions, $M_t(\delta)$ includes the spectral mass of dark
matter (§dark-matter-lag), predicting an excess Shapiro delay:
$$
\Delta\tau_{\mathrm{spectral}} \;\propto\; \alpha \cdot M_{\mathrm{spectral}}(t)
$$
beyond the GR prediction from baryonic mass alone.

**Light bending.** Light follows the path that maximizes throughput — the
Fischer–Rao geodesic. In a region of high Fischer–Rao curvature (high $M_t$),
geodesics bend toward the curvature concentration, just as light bends in GR
toward a massive body. The bending angle is proportional to the integrated
curvature along the path.

**Distinction from §dark-matter-lag.** The dark-matter-lag file
uses the same $c_{\mathrm{eff}}(t)$ structure but focuses on a different question:
why dark matter halos produce gravitational effects via the Kramers–Kronig refractive
structure of spectral mass. The present correspondence focuses on what $c$ fundamentally
is — the local maximum restriction rate — and on the GR-type kinematic effects
(time dilation, Shapiro delay, light bending) that follow from its spatial variation.
The two files share the same underlying machinery but address different physical phenomena.

---

#### The Correspondence Table {#lp-table}

| Physical phenomenon | Relational structure |
|---|---|
| Speed of light $c$ in vacuum | Flat-space maximum restriction rate $v_0$ at $M_t(\delta) = 0$ |
| Invariant $c$ of special relativity | $M_t(\delta) \to 0$ limit: universal agreement on $v_0$ in the settled layer |
| Local $c$ in a medium or curved space | $c_{\mathrm{eff}}(t) = v_0/(1 + \alpha M_t(\delta))$: spectral-mass-dependent local maximum |
| Observer-dependent $c$ | Different $M_t(\delta)$ at different history coordinates → different measured local maxima |
| Gravitational time dilation | Local $c_{\mathrm{eff}}(t) < v_0$ in high-$M_t$ region → clocks run slow |
| Gravitational redshift | Throughput $< 1$ from high-$M_t$ to low-$M_t$: signal loses eigenvalue weight on restriction |
| Shapiro delay (standard) | $\int M_t^{\mathrm{baryonic}}\,d\ell$ along path |
| Shapiro delay (excess, dark matter) | Additional $\int M_t^{\mathrm{spectral}}\,d\ell$: dark spectral mass contribution |
| Light bending near massive body | Fischer–Rao geodesic deflected by curvature concentration at high-$M_t$ histories |
| Quantum scrambling / butterfly velocity | Restriction rate = information propagation speed in quantum systems; reduced at high entanglement density |
| Vacuum $n = 1$ (light in vacuum travels at $c$) | Flat space: $c_{\mathrm{eff}} = v_0$, so $n_{\mathrm{rel}} = 1$ |

---

#### Prediction and Falsification {#lp-prediction}

**Prediction 1 — Excess Shapiro delay in dark-matter-dominated regions.** Signals
passing through galaxy cluster halos should arrive with a delay exceeding the
standard GR prediction by $\Delta\tau_{\mathrm{spectral}} \propto \alpha M_{\mathrm{spectral}}(t)$,
where $M_{\mathrm{spectral}}$ is the spectral mass of the dark matter. This excess
is not degenerate with standard dark matter lensing: lensing measures the mass
distribution, while the Shapiro excess measures the spectral mass along the
specific signal path. The two can be decorrelated.

**Prediction 2 — Entanglement-density dependence of scrambling.** In quantum
systems, the butterfly velocity (Lieb–Robinson bound velocity) measures how fast
quantum information scrambles. The relational reading identifies this velocity
with the local restriction rate. High entanglement density = large $M_t(\delta)$
(many unsettled modes = many entangled modes) = lower restriction rate = lower
butterfly velocity. Comparing systems of the same Hamiltonian but different
entanglement densities should show the predicted reduction.

**Prediction 3 — High-energy photon speed suppression.** From the quasicrystalline
vacuum structure (§quasicrystal-vacuum), $M_t^{(n)} \sim \varphi^{-n}$
at Fibonacci depth $n \sim \log_\varphi(\hbar c/E d_0)$. High-energy photons probe
deeper Fibonacci levels and encounter higher effective $M_t$, giving
$c_{\mathrm{eff}} < v_0$ at high $E$. The suppression: $\Delta c/c \sim \alpha\varphi^{-n(E)}$,
a Fibonacci-staircase LIV.

**Falsification.** The correspondence fails if:

- Shapiro delay measurements in dark-matter-dominated regions show no excess beyond
  the standard GR prediction from the observed baryonic + dark matter mass distribution.

- The throughput formula $|H_t^*|/|H_{t'}^*|$ is constant (independent of
  $M_t(\delta)$) in explicit computations, meaning the restriction rate is not
  bounded by spectral mass.

- All measurements of $c$ across varied environments (near black holes, in voids,
  in clusters) are consistent with a universal constant plus standard GR corrections,
  with no additional spectral-mass term.

---

#### What the Correspondence Requires {#lp-requires}

- **The curvature bound of §restriction-velocity**: the identification $c_{\mathrm{eff}}(t)
  = v_0/(1 + \alpha M_t(\delta))$ is a conjecture there. This file inherits that
  conjecture entirely.

- **An identification of $v_0$ with physical $c$**: the flat-space maximum restriction
  rate must be matched to $c \approx 3 \times 10^8$ m/s. This requires specifying the
  physical scale of one history step — not established in the framework.

- **The GR comparison**: for Shapiro delay and time dilation to match GR quantitatively,
  $c_{\mathrm{eff}}(t)$ must reproduce the standard Schwarzschild metric in the
  appropriate limit. This requires deriving the metric from the spectral mass field —
  a connection not yet established.

**Status.** Stub (expanding the prior placeholder). The identification of the speed of
light with the maximum restriction rate is the conceptual core, grounded in
§restriction-velocity. The GR-type effects (Shapiro delay, time dilation, light bending)
follow qualitatively from the $c_{\mathrm{eff}}(t)$ variation with spectral mass.
Quantitative agreement requires establishing the curvature-bound conjecture of
§restriction-velocity and the physical unit dictionary.
