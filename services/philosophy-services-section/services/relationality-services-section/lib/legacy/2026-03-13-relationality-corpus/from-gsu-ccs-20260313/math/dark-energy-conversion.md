---

name: dark-energy-conversion
description: "Dark Matter–Dark Energy Conversion"
---

### Conjecture — Dark Matter–Dark Energy Conversion {#dark-energy-conversion}

*This file maps the spectral surface conjecture to cosmological dark sector phenomena.
All mathematical claims are in §spectral-surface and §spectral-thermodynamics.*

#### The Mathematical Structures {#corr-dec-math}

From §spectral-surface: in $d=3$ spatial dimensions, the tunneling energy density
released per tower step scales as:
$$
\frac{d\mathcal{E}_{\mathrm{tunnel}}}{dn} \;\propto\; M_t(\delta)^{-1/d} \;=\; M_t(\delta)^{-1/3}.
$$

This accumulated energy — spectral latency released by cohomological tunneling — is
deposited into the vacuum state and contributes to the vacuum energy density $\rho_\Lambda$.

#### The Conjectural Correspondence {#corr-dec-correspondence}

**Bridge conjecture.** The vacuum energy density (dark energy) is fed by the tunneling
energy released as dark matter modes settle:
$$
\rho_\Lambda \;\propto\; M_t(\delta)^{-1/3} \;\propto\; \rho_{\mathrm{DM}}^{-1/3},
$$
where $\rho_{\mathrm{DM}} = \kappa \cdot M_t(\delta)$ is the spectral dark matter
density (§dark-matter). As dark matter density decreases (modes settle),
dark energy density increases, in inverse-cubic-root proportion.

This gives a **conservation-like relation** between the dark sectors:
$$
\rho_\Lambda \cdot \rho_{\mathrm{DM}}^{1/3} \;=\; \mathrm{const}.
$$
Equivalently: $\rho_\Lambda^3 \cdot \rho_{\mathrm{DM}} = \mathrm{const}$, a curve
in the $(\rho_{\mathrm{DM}}, \rho_\Lambda)$ plane that the universe histories as it
evolves through the depth tower.

**The mechanism.** Dark matter is not a stable particle species that can only be
detected gravitationally. It is spectral latency — unsettled relational history. As
this latency resolves via cohomological tunneling, the released energy goes into the
vacuum (the $E_{t,0}$ sector), raising the vacuum energy. The Hubble tension (see
§hubble-tension) is the direct observational signature: $H_0$ is higher
today than at the CMB epoch because dark energy has grown at the expense of dark matter.

#### The Hubble Tension Connection {#corr-dec-hubble}

From §hubble-tension: $H_{\mathrm{late}}/H_{\mathrm{early}} = \varphi^{1/6}$.
This follows from two independent derivation paths:

**Path A (shuffle count):** $H \propto F_n^{1/(2d)} = F_n^{1/6}$, where $F_n =
|\mathrm{Shuf}(T_n)|$ is the Fibonacci shuffle count.

**Path B (spectral surface):**
$$
\rho_\Lambda \propto M_t^{-1/3}
\quad\Rightarrow\quad
H \propto \rho_\Lambda^{1/2} \propto M_t^{-1/6}
\quad\Rightarrow\quad
\frac{H_{\mathrm{late}}}{H_{\mathrm{early}}}
= \left(\frac{M_t^{\mathrm{CMB}}}{M_t^{\mathrm{now}}}\right)^{1/6}
= \varphi^{1/6}.
$$

Both paths give $\varphi^{1/6}$ via different routes. Their agreement is non-trivial:
Path A uses only history combinatorics (§patch-flow); Path B uses the spectral surface
geometry (§spectral-surface). The coincidence of two independent routes is strong
evidence that the formula $\varphi^{1/6}$ is robust.

#### Empirical Predictions {#corr-dec-empirical}

1. **DM–DE anti-correlation.** In regions of unusually low dark matter density (local
   voids), dark energy should be correspondingly higher. Specifically:
   $$
   \rho_\Lambda(x) \;\propto\; \rho_{\mathrm{DM}}(x)^{-1/3}
   $$
   should hold as a spatial correlation across the cosmic web. Current surveys (DES,
   DESI, Euclid) measure $\rho_{\mathrm{DM}}$ via weak lensing and $\rho_\Lambda$
   via supernova distances; the anti-correlation $\rho_\Lambda \cdot \rho_{\mathrm{DM}}^{1/3} = \mathrm{const}$
   is testable in principle.

2. **Local void and Hubble tension.** We may live in a local void with below-average
   dark matter density. By the anti-correlation, our local dark energy density is
   above average, explaining the locally measured $H_0$ exceeding the global CMB-inferred
   value. This is the spectral-remanence resolution of the "local void" model of Hubble
   tension.

3. **Time evolution.** As the universe evolves (tower deepens), $\rho_{\mathrm{DM}}$
   decreases and $\rho_\Lambda$ increases along the curve $\rho_\Lambda \cdot
   \rho_{\mathrm{DM}}^{1/3} = \mathrm{const}$. This gives a specific prediction for
   the equation of state $w(z)$ of dark energy as a function of redshift:
   if $\rho_\Lambda \propto M_t^{-1/3}$ and $M_t \propto (1+z)^\alpha$ for some
   $\alpha$ set by the depth-tower dynamics, then $w(z)$ deviates from $-1$ by a
   calculable amount.

#### Numerical Check Against Planck 2020 {#corr-dec-numerical}

*Computed in `src/scripts/compute-dm-de-conversion.py`.*

Using Planck 2020 parameters ($\Omega_{\mathrm{DM}} = 0.265$,
$\Omega_\Lambda = 0.685$, $H_{\mathrm{early}} = 67.4$ km/s/Mpc,
$H_{\mathrm{late}} = 73.04$ km/s/Mpc):

The conservation constant at $z = 0$:
$$
C \;=\; \Omega_\Lambda \cdot \Omega_{\mathrm{DM}}^{1/3} \;=\; 0.4400.
$$

In standard $\Lambda$CDM, $C$ varies by a factor of $\sim 1091$ between the CMB
and today (because $\rho_\Lambda$ is constant while $\rho_{\mathrm{DM}}$ dilutes
as $(1+z)^3$). The conservation relation $C = \mathrm{const}$ is a sharp departure
from $\Lambda$CDM.

Under one golden step ($M_t^{\mathrm{CMB}} / M_t^{\mathrm{now}} = \varphi$):

| Quantity | Value |
|----------|-------|
| DM remaining since CMB | $1/\varphi = 61.8\%$ |
| DM converted to DE | $1/\varphi^2 = 38.2\%$ |
| Hubble ratio $\varphi^{1/6}$ | $1.08351$ |
| Observed $H_{\mathrm{late}}/H_{\mathrm{early}}$ | $1.08368$ |
| Agreement | $0.016\%$ |

The energy budget does not balance 1:1: the ratio of DE gained to DM lost is
$\approx 0.620 \approx 1/\varphi$. The remaining $1/\varphi^2$ fraction is the
Landauer dissipation — heat deposited into $E_{t,0}$ during tunneling, consistent
with §landauer-limit.

**Equation of state.** If the spectral mass evolves as $M_t(z) = M_t^{(0)} \cdot
(1+z)^\alpha$ with $\alpha = \ln\varphi / \ln(1 + z_{\mathrm{CMB}}) \approx
0.069$, then $\rho_\Lambda \propto (1+z)^{-\alpha/3} = a^{\alpha/3}$. Since the
standard parameterization gives $\rho_\Lambda \propto a^{-3(1+w)}$, equating
exponents: $-3(1+w) = \alpha/3$, so:
$$
w_{\mathrm{eff}} \;=\; -1 - \frac{\alpha}{9} \;\approx\; -1.008.
$$
This is **phantom** ($w < -1$): $\rho_\Lambda$ grows over time, consistent with
the DM-to-DE conversion mechanism. The deviation $|\Delta w| \approx 0.008$ is
$\sim 25\%$ of the current Planck+BAO error bar ($\pm 0.03$) and within reach
of Euclid and DESI full-survey precision.

#### KBC Void Test {#corr-dec-kbc}

The KBC void (Keenan, Barger, Cowie 2013) has measured density contrast
$\delta = -0.46 \pm 0.06$ out to $\sim 300$ Mpc. Under the conservation
relation:

- Local DM density: $(1 + \delta) \cdot \Omega_{\mathrm{DM}} = 0.143$
- Predicted local DE: $C / \rho_{\mathrm{DM,local}}^{1/3} = 0.841$
- DE boost: $22.8\%$ above cosmic mean
- Local $H$ boost (Friedmann): $+0.6\%$

In $\Lambda$CDM (no DM-DE coupling), the same void gives $H_{\mathrm{local}} /
H_{\mathrm{global}} = 0.925$ — a $7.5\%$ *decrease*. The **sign of the void
effect is opposite** between the two models: $\Lambda$CDM predicts voids slow
down expansion (less total density); the conservation relation predicts deep
voids *speed up* expansion (DE boost exceeds matter deficit).

The spatial effect alone does not account for the full Hubble tension (which
requires $\sim 76\%$ underdensity for the full $8.4\%$ boost). The temporal
effect — one golden step — is the primary mechanism; the spatial anti-correlation
is a secondary, independently testable signature.

**Linearized cross-correlation.** For small $\delta$, the local Hubble residual
is:
$$
\frac{\delta H}{H} \;\approx\; 0.043 \cdot \delta_{\mathrm{DM}}
\qquad (\text{RH}),
\qquad
\frac{\delta H}{H} \;\approx\; 0.157 \cdot \delta_{\mathrm{DM}}
\qquad (\Lambda\text{CDM}).
$$
The RH effect is $3.7\times$ weaker because the DE boost partially compensates
the matter deficit. This difference is measurable: correlating weak lensing
convergence $\kappa$ (tracing $\rho_{\mathrm{DM}}$) with SNIa Hubble residuals
$\delta H / H$ across the cosmic web should show a shallower slope in the RH
model than in $\Lambda$CDM.

**Falsification.** If weak lensing surveys show no spatial anti-correlation between
dark matter and dark energy densities, the bridge conjecture fails. If $w(z) = -1$
exactly (constant dark energy) to within $|\Delta w| < 0.005$ over a wide redshift
range, the DM-to-DE conversion mechanism is in tension.

The mathematics of §spectral-surface and §spectral-thermodynamics is unaffected by
falsification of this correspondence.
