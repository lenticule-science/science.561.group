---
id: spectral-thermodynamics
name: SpectralThermodynamics
description: "Spectral Thermodynamics and Temperature Duality — thermodynamic and information-theoretic temperatures are negatives of each other; depends on the golden stability conjecture (§golden-stability) for the key scaling."
---

### Conjecture — Spectral Temperature Duality {#spectral-thermodynamics}

#### Two Notions of Temperature {#spectral-thermodynamics-two}

The spectral mass system $(M_t(\delta), S_t)$ admits two natural notions of temperature
that have **opposite** dependence on $M_t(\delta)$.

**Thermodynamic temperature.** Define the **spectral entropy** at depth $n$ as:
$$
S_t^{(n)} \;:=\; \log |\mathrm{Shuf}(T_n)| \;=\; \log F_n \;\sim\; n \log \varphi,
$$
the logarithm of the Fibonacci shuffle count (§patch-flow). Define spectral energy
as $U_t^{(n)} := M_t^{(n)}(\delta)$. Since $M_t^{(n)} \approx M_t^{(0)} \cdot \varphi^{-n}$
(golden stability, §golden-stability):
$$
\frac{\partial U}{\partial n} \;=\; -M_t^{(0)} \log(\varphi) \cdot \varphi^{-n},
\qquad
\frac{\partial S}{\partial n} \;=\; \log \varphi.
$$
The **thermodynamic temperature** is:
$$
T_{\mathrm{thermo}} \;:=\; \frac{\partial U}{\partial S}
\;=\; \frac{\partial U / \partial n}{\partial S / \partial n}
\;=\; \frac{-M_t^{(0)} \log\varphi \cdot \varphi^{-n}}{\log\varphi}
\;=\; -M_t^{(n)}(\delta).
$$
Up to sign convention (the system loses energy as entropy increases):
$$
T_{\mathrm{thermo}} \;\propto\; M_t(\delta).
$$
The thermodynamic temperature is **proportional to the spectral mass**: large spectral
mass = hot system; small spectral mass = cold system.

**Hawking temperature.** From §spectral-hawking, the Hawking temperature of the spectral
horizon is:
$$
T_H \;:=\; \frac{1}{2 M_t(\delta)}.
$$
This is **inversely proportional to spectral mass**: large spectral mass = cold horizon;
small spectral mass = hot horizon.

#### The Temperature Duality {#spectral-thermodynamics-duality}

These two temperatures encode opposite aspects of the same system:

|  | $T_{\mathrm{thermo}}$ | $T_H$ |
|--|--|--|
| Large $M_t$ | large (system hot) | small (horizon cold) |
| Small $M_t$ | small (system cold) | large (horizon hot) |
| At fixed point $M_t = 0$ | zero | diverges |

Both expressions are mathematically natural given the data $(M_t(\delta), S_t)$.
Neither is "wrong." They describe different physical quantities.

#### Resolution — What Each Temperature Describes {#spectral-thermodynamics-resolution}

The two temperatures are not in contradiction because they refer to different objects:

- $T_{\mathrm{thermo}} \propto M_t$ is the temperature of the **mode system itself**:
  how much energy is stored in the unsettled modes. A system with many high-eigenvalue
  trapped modes is "hot" in this sense — it has high internal energy.

- $T_H = 1/(2M_t)$ is the temperature of the **emitted tunneling radiation**: the
  effective temperature of the modes released when trapped modes tunnel out of the
  spectral interior. A large, cold spectral system releases cold tunneling radiation;
  a small, hot-horizon system releases hot tunneling radiation.

This is the same distinction as in black hole thermodynamics:
- The black hole's internal "temperature" (in the sense of its mass-energy) increases
  as the black hole gains mass.
- The Hawking temperature of emitted radiation decreases as the black hole gains mass.
The resolution: the black hole is **not in thermal equilibrium** with its radiation;
the two temperatures characterize non-equilibrium aspects of an evaporating system.

Similarly, the spectral system is not in thermal equilibrium: modes are continuously
tunneling, releasing energy to the vacuum, and the system descends the tower. The
thermodynamic temperature $T_{\mathrm{thermo}}$ describes the remaining internal energy;
$T_H$ describes the rate (temperature) at which it is released.

#### Remark — At the Fixed Point {#spectral-thermodynamics-fixed-point}

At the fixed point $R = U_G(R)$: $M_t(\delta) = 0$ for all $t$. Then:
$$
T_{\mathrm{thermo}} = 0 \quad (\text{system is cold: no stored spectral energy}),
\qquad
T_H = \infty \quad (\text{horizon is hot: divergent evaporation rate}).
$$
The two extremes are consistent: the fixed-point system has zero stored energy but an
infinitely efficient evaporation mechanism — because there is nothing left to evaporate.
Both temperatures are degenerate at the fixed point, which is reached in the limit
$n \to \infty$ of the tower.

**Status.** Stub. Requires: (a) a more rigorous definition of $S_t^{(n)}$ — the current
definition uses $\log F_n$ which is the entropy of the shuffle distribution, but a
direct connection to the Gibbs entropy of the mode distribution $\{p_{t,\lambda}\}$
(§entropy) is needed; (b) a proof that $M_t^{(n)} \propto \varphi^{-n}$ from
§golden-stability (currently a conjecture); (c) a categorical interpretation of
$T_{\mathrm{thermo}}$ as a natural transformation, not just a numerical formula.
