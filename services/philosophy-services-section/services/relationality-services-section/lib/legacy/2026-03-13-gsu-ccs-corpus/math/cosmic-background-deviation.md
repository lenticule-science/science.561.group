---
id: cosmic-background-deviation
name: CosmicBackgroundDeviation
description: "The CMB as Fixed-Point Deviation"
---

### Theorem — The CMB as Fixed-Point Deviation {#cosmic-background-deviation}

The spectral thermodynamic temperature $T_{\mathrm{thermo}} \propto M_t(\delta)$
(§spectral-thermodynamics) measures the total weight of unsettled modes — the
spectral mass of propositions not yet in $H_t^*$. At the fixed point
$R \cong U_\mathcal{H}(R)$, all modes are settled, $M_t(\delta) = 0$, and
$T_{\mathrm{thermo}} = 0$.

The Landauer correspondence (§landauer-limit) establishes that each
depth step $U_G$ is logically irreversible: the counit $\varepsilon$ erases
$s$-shadow information, dissipating a minimum of $c_{\mathrm{rel}} \cdot
\mathcal{L}_s(t)$ spectral energy as heat. This dissipation has a floor: the
minimum temperature at which a single bit of relational information can be
processed. Call this the **bit temperature** $T_{\mathrm{bit}} = c_{\mathrm{rel}}$.

If the cosmic microwave background temperature corresponds to
$T_{\mathrm{thermo}}$, then the deviation of the universe from the fixed point is:

$$
T_{\mathrm{CMB}} - T_{\mathrm{bit}}.
$$

The CMB is the thermal signature of all settling completed so far — the heat
already released by modes that have transitioned from $E_{t,\lambda}$ ($\lambda >
0$) to $E_{t,0}$. The bit temperature is the irreducible cost of the settling
process itself. Their difference is the **remaining spectral mass**, thermalized:
the distance from the current universe to the fixed point, measured in thermal
units.

#### Three consequences {#cmb-deviation-consequences}

**The fixed point is unreachable in finite depth.** Each depth step settles modes
(decreasing $T_{\mathrm{thermo}}$) but also dissipates Landauer heat (depositing
energy into $E_{t,0}$). The settling process cannot drive $T_{\mathrm{thermo}}$
below $T_{\mathrm{bit}}$, because reaching $T_{\mathrm{bit}}$ would require
erasing the last bit of unsettled information — which itself costs one bit of
heat. The fixed point $R = U_\mathcal{H}(R)$ is the limit $n \to \infty$, never
achieved at any finite depth.

**The deviation decreases at rate $\varphi^{-1}$.** Under the Golden Stability
Conjecture (§golden-stability), $M_t(\delta^{(n)}) \propto \varphi^{-n}$.
Therefore $T_{\mathrm{thermo}}^{(n)} \propto \varphi^{-n}$, and the deviation
$T_{\mathrm{CMB}}^{(n)} - T_{\mathrm{bit}}$ decreases by a factor of
$\varphi^{-1} \approx 0.618$ at each depth step. The universe cools toward the
fixed point at the golden rate.

**The current CMB temperature encodes the depth.** If $T_{\mathrm{CMB}} \propto
\varphi^{-n}$ and $T_{\mathrm{bit}}$ is a universal constant, then the current
CMB temperature determines the current depth $n$ of the universe in the tower:

$$
n \;\approx\; \frac{\log(T_{\mathrm{CMB}} / T_{\mathrm{bit}})}{\log \varphi}.
$$

The CMB temperature is a thermometer for **how many Fibonacci steps the universe
has completed** in its approach to the fixed point.
