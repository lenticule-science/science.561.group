---
id: spectral-hawking
name: SpectralHawking
description: "Spectral Hawking Operator"
defines: SpectralHawking
---

### Definition — Spectral Hawking Operator {#spectral-hawking}

**Motivation.** The Schwarzschild operator (§spectral-schwarzschild) identifies a spectral
horizon: the critical eigenvalue scale $r_s(\delta_t)$ above which modes are conjectured to be
trapped. In general relativity, a Schwarzschild black hole is not static — it **evaporates**
via Hawking radiation at temperature $T_H = \hbar c^3 / (8\pi G M k_B)$, which is inversely
proportional to the Schwarzschild radius. As mass decreases, temperature rises; at the Planck
scale, evaporation is complete.

The **Hawking operator** extracts the analogous evaporation scale from the spectral horizon: the
rate at which trapped modes can **tunnel** from the spectral interior to the exterior through
quantum/cohomological fluctuations.

#### Definition — Hawking Temperature {#def-hawking}

Given the Schwarzschild radius $r_s(\delta_t)$ at history $t$, define the **Hawking temperature**:
$$
T_H(\delta_t) \;:=\; \frac{1}{r_s(\delta_t)} \;=\; \frac{1}{2\,\mathrm{Tr}(\delta_t)},
$$
in natural units ($\hbar = c = G = k_B = 1$). The Hawking operator assembles these fiberwise:
$$
\mathrm{Haw} : \mathrm{End}_K(V) \longrightarrow \underline{K}_R,
\qquad
\mathrm{Haw}(\delta)_t \;:=\; T_H(\delta_t).
$$

**Interpretation.** A large spectral mass (many high-eigenvalue trapped modes) gives a large
Schwarzschild radius and a small Hawking temperature — the spectral black hole is cold and
evaporates slowly. A small spectral mass (few or low-eigenvalue defects) gives a small horizon
and a large Hawking temperature — the defect structure is hot and evaporates quickly. At
$\mathrm{Tr}(\delta_t) = 0$ (the stable layer $E_{t,0}$ only), the Hawking temperature diverges
— the "Planck regime" in which all defect modes have already evaporated.

#### Conjecture — Evaporation Dynamics {#hawking-evaporation}

Under the spectral dynamics of §closure-and-self-generation, the total spectral mass $M_t(\delta)$ is
monotonically non-increasing as the depth filtration deepens. The Hawking temperature
$T_H(\delta_t)$ therefore increases monotonically as the tower $R_0 \hookrightarrow R_1
\hookrightarrow \cdots$ climbs — modes evaporate, the horizon shrinks, the temperature rises,
and in the limit $R$ of the tower the stable layer $E_{t,0} = V_t$ is all that remains.

**Relation to Fischer–Rao convergence.** The Fischer–Rao convergence result (§fischer-rao-convergence)
— that iterating $U_G$ converges to $R$ along a geodesic in the moduli space — may be the
metric-geometric statement of which the Hawking evaporation conjecture is the spectral-algebraic
statement.

**Status.** Stub. Requires:
(a) a rigorous definition of "tunneling" from the spectral interior in this categorical setting,
(b) a proof or counterexample to the monotone mass decrease under the depth-filtration tower, and
(c) a comparison with the Fischer–Rao geodesic.
