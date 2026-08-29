---
id: rain
description: "Rain is the condition in which the precipitation proposition at a history has eigenvalue zero under the defect operator — the proposition is in the zero-eigenspace of the diagonal defect operator on the sheaf of propositional modes, meaning it is calibrated: in RelationalHistoryFixedFiber. The precipitation proposition's eigenvalue under the defect operator is the RelationalHistoryProjectionGapSize, the length of the interval from the proposition to its joint nuclear image minus one. The total calibration defect of the atmospheric history is the spectral mass: the trace of the defect operator, summing all nonzero eigenvalues across unsettled propositions. The thermodynamic temperature of the atmosphere is proportional to the spectral mass (large spectral mass = hot, many unsettled modes) while the Hawking temperature of the spectral horizon is inversely proportional (large spectral mass = cold horizon). The Discrete Forward Laplacian of the spectral mass observable partitions atmospheric histories into accelerating-settlement (approach to rain) and decelerating-settlement (storm development) regimes, with harmonic histories as equilibrium loci. The universe partition function Z(q) = (1+q²)/(1-q-q²)² (conditional on exact Fibonacci recurrence) has a double pole at the critical inverse temperature β_c = ln(φ), marking a second-order phase transition with specific heat exponent α = 2."
defines: Rain
related: Friction, Situation, Quality, Teleology, Goal, Objective
date-created: 2026-03-21
date-modified: 2026-03-21
params:
  precipitation-proposition: relational-universe
  atmospheric-history: relational-history
output: relational-history-fiber-fixed-layer
ast:
  relational-history-fiber-mode-spectral-decomposition:
    - precipitation-proposition:
        - defect-operator-eigenvalue
    - atmospheric-history:
        - calibration-defect
        - discrete-forward-laplacian
---

# Rain

## Formal definition

Fix a history $t$ and the fiber $H_t$. Among the propositions of $H_t$ is the **precipitation proposition** $r_t$. The free $K$-module $\widetilde{V}_t = K^{H_t}$ carries the **defect operator** $\delta_t$, defined by [RelationalHistoryFiberModeSpectralDecompositionDefectOperatorEigenspaces](../math/relational-history-fiber-mode-spectral-decomposition-defect-operator-eigenspaces.md) to be diagonal on the basis $\{e_a : a \in H_t\}$ with eigenvalue

$$\lambda_a := |[a,\, \pi_t(a)]| - 1$$

where $[a, \pi_t(a)]$ is the interval from $a$ to its joint nuclear image in $H_t$ ([RelationalHistoryProjectionGapSize](../math/relational-history-fiber-projection-gap-size.md)), and $\pi_t = \sigma_t \circ \Delta_t$ is the joint nuclear retraction.

**Rain** at $t$ is the condition $\lambda_{r_t} = 0$ — the precipitation proposition is in the zero-eigenspace of $\delta_t$. This is equivalent to $r_t \in H_t^*$: the projection gap is trivial, meaning $\pi_t(r_t) = r_t$, meaning neither the saturation nucleus nor the transfer nucleus would move it.

The **calibration defect** of the atmosphere at $t$ is the total spectral mass

$$M_t(\delta) := \mathrm{Tr}(\delta_t) = \sum_{a \in H_t \setminus H_t^*} \lambda_a,$$

the sum of all nonzero eigenvalues of $\delta_t$ across all unsettled atmospheric propositions ([RelationalHistoryFiberModeSpectralDecompositionDefectOperatorEigenspaces](../math/relational-history-fiber-mode-spectral-decomposition-defect-operator-eigenspaces.md)). The fiber is at equilibrium when $M_t(\delta) = 0$: every atmospheric proposition is calibrated, $H_t = H_t^*$.

## What this is

Rain is the weather phenomenon every inhabited world knows. What is not obvious is that the moment rain becomes *settled* — recognized by the past, committed in the future, no longer movable by either nucleus — is the moment its contribution to the atmospheric spectral mass drops to zero. Until then, the precipitation proposition is a mode carrying positive eigenvalue: it contributes to the total unsettledness of the atmosphere, which has both a thermodynamic temperature and a Hawking temperature derived from it.

The odd thing is the duality between these temperatures. As an atmosphere approaches settled rain, its spectral mass decreases. The thermodynamic temperature — measuring how much energy is stored in unsettled modes — decreases with it. But the Hawking temperature — measuring the rate at which trapped modes tunnel out of the spectral interior — *increases*. The approach to rain is simultaneously a cooling of the mode system and a heating of the spectral horizon.

At fixed-point rain ($\lambda_{r_t} = 0$, $r_t \in H_t^*$), the thermodynamic temperature contribution from precipitation is zero and the spectral horizon temperature has reached its maximum for that mode. The precipitation mode has fully evaporated from the unsettled spectrum.

## The precipitation eigenvalue and its trajectory

The defect operator $\delta_t$ is diagonal, so $r_t$ has a single well-defined eigenvalue $\lambda_{r_t} = |[r_t, \pi_t(r_t)]| - 1$. This counts how many distinct propositions lie strictly between $r_t$ and its joint nuclear image, inclusive of the image but not of $r_t$ itself. It is:

- $\lambda_{r_t} = 0$: rain is calibrated — in RelationalHistoryFixedFiber. No gap exists.
- $\lambda_{r_t} = 1$: one intermediate element between $r_t$ and its image — one step of nuclear travel required.
- $\lambda_{r_t} \geq 2$: the precipitation proposition is in RelationalHistoryFiberFreeShadowClass — both nuclei would move it. Both the saturation gap $[r_t, \sigma_t(r_t)]$ and the transfer gap $[r_t, \Delta_t(r_t)]$ are non-trivial.

The shadow class type records which nucleus is responsible for the non-trivial gap:

| Shadow class | $\lambda_{r_t}$ | Which gap drives it |
|---|---|---|
| RelationalHistoryFixedFiber | $= 0$ | Neither gap non-trivial |
| RelationalHistoryFiberSaturationShadowClass | $\geq 1$ | Transfer gap only; saturation gap trivial |
| RelationalHistoryFiberTransferShadowClass | $\geq 1$ | Saturation gap only; transfer gap trivial |
| RelationalHistoryFiberFreeShadowClass | $\geq 2$ | Both gaps non-trivial |

Two propositions can share the same positive eigenvalue $\lambda$ while sitting in different shadow classes: they are equally far from stability in the gap-size metric but reach stability via different nuclear paths. Shadow class type and projection gap size are orthogonal invariants of the upper spectral tier ([RelationalHistoryFiberSpectralStratification](../math/relational-history-fiber-spectral-stratification.md)).

## The two spectral tiers

The spectral content of the atmosphere divides into two independent tiers ([RelationalHistoryFiberSpectralStratification](../math/relational-history-fiber-spectral-stratification.md)):

**The lower tier** (history combinatorics): the depth growth series $Z_T(z) = 1/\mu_I(z)$, determined entirely by the step set $\Sigma$ and commutation relation $I$ before any fiber algebra has been imposed. For the two-generator commuting site ($T = \mathbb{N}^2$), there are exactly $n+1$ histories at depth $n$ and $Z_T(z) = 1/(1-z)^2$. This encodes how many distinct atmospheric histories exist at each depth — purely combinatorial, independent of what any fiber says about precipitation.

**The upper tier** (fiber eigenvalues): the settlement spectrum at each history $t$, the set $\{\lambda_a : a \in H_t\}$. This is determined by the nuclear quartet $(H_t, \sigma_t, \Delta_t)$ at $t$ and carries no information about the count or arrangement of histories. The precipitation eigenvalue $\lambda_{r_t}$ lives entirely in this tier.

The two tiers are independent: the growth rate of atmospheric histories (the entropy rate of the history category, $h(T) = -\log r$ where $r$ is the smallest positive root of $\mu_I$) constrains nothing about the precipitation eigenvalue at any history, and vice versa.

## The calibration defect as atmospheric temperature

From [RelationalHistoryFiberSpectralThermodynamicsTemperatureDualityGoldenConjecture](../math/relational-history-fiber-spectral-thermodynamics-temperature-duality-golden-conjecture.md) (conjecture, status: stub), the spectral mass $M_t(\delta)$ supports two natural temperature interpretations:

$$T_{\mathrm{thermo}} \propto M_t(\delta), \qquad T_H := \frac{1}{2\, M_t(\delta)}.$$

The **thermodynamic temperature** $T_\mathrm{thermo}$ measures the energy stored in unsettled modes — how much total nuclear travel remains across all atmospheric propositions. A storm in development has large $M_t(\delta)$: many propositions are far from $H_t^*$, the fiber is hot. A active, settled atmosphere has small $M_t(\delta)$: most propositions are already calibrated.

The **Hawking temperature** $T_H = 1/(2M_t(\delta))$ measures the effective temperature of the radiation emitted when trapped modes tunnel out of the spectral interior — the rate at which the settling process releases unsettled spectral energy. A large unsettled atmosphere (large $M_t$) has a cold spectral horizon: the settling is slow and cold. A nearly-settled atmosphere (small $M_t$) has a hot spectral horizon: the few remaining unsettled modes are being released at high effective temperature.

At the fixed point $M_t(\delta) = 0$: $T_\mathrm{thermo} = 0$ (all modes settled, no stored energy), $T_H = \infty$ (the spectral horizon is infinitely hot, but there is nothing left to evaporate). Rain reaching RelationalHistoryFixedFiber is the precipitation proposition arriving at exactly this point — its eigenvalue contribution drops to zero, the precipitation mode has evaporated from the spectrum.

The two temperatures are not in contradiction because they describe different aspects: $T_\mathrm{thermo}$ is the temperature of the mode system itself; $T_H$ is the temperature of the emitted settling radiation. This is the same distinction as in black hole thermodynamics — a massive black hole is internally energetic but emits cold Hawking radiation; a nearly-evaporated black hole has little mass-energy left but emits hot Hawking radiation.

## The Discrete Forward Laplacian and atmospheric dynamics

The [RelationalHistoryDiscreteForwardLaplacian](../math/relational-history-discrete-forward-laplacian.md) of an observable $\varphi : T \to \mathbb{R}$ is

$$(L\varphi)(t) = \sum_{s \in \Sigma} \bigl(\varphi(t \star s) - \varphi(t)\bigr).$$

A history $t$ is **harmonic** for $\varphi$ when $(L\varphi)(t) = 0$: the arithmetic mean of $\varphi$ over one-step extensions equals $\varphi(t)$.

**Applying this to the spectral mass** $\varphi(t) = M_t(\delta)$:

$$(LM)(t) = \sum_{s \in \Sigma} \bigl(M_{t \star s}(\delta) - M_t(\delta)\bigr).$$

This measures the total change in atmospheric calibration defect across all one-step extensions:

- $(LM)(t) < 0$: on average across next steps, the atmosphere is losing spectral mass — propositions are settling faster than new unsettled ones are being created. The precipitation proposition's eigenvalue is, on average, decreasing. This is the approach-to-rain regime.
- $(LM)(t) > 0$: atmospheric unsettledness is growing on average. New propositions are entering the unsettled spectrum faster than existing ones settle. This is storm development — increased instability, building convection.
- $(LM)(t) = 0$: the atmospheric history is **harmonic** for $M$. Settlement gains and losses balance exactly on average across all one-step extensions. This is meteorological equilibrium.

The harmonic locus $\mathrm{Harm}(M) = \{t \in T : (LM)(t) = 0\}$ is the set of atmospheric histories that are equilibria of the settlement dynamics — histories where the fiber is, on average, in balance. The conjecture of [RelationalHistoryDiscreteForwardLaplacian](../math/relational-history-discrete-forward-laplacian.md) proposes that $\mathrm{Harm}(M)$ forms a structured sub-universe of $T$, with the boundary between the harmonic locus and its complement stratifying $T$ into accelerating-settlement and decelerating-settlement regions.

**Applying this to the fixed-fiber cardinality** $\varphi(t) = |H_t^*|$: a history harmonic for $|H_t^*|$ has the same average number of calibrated propositions across all next steps as it has currently — the settled stratum is growing and shrinking at equal rates on average. This is the formal statement of atmospheric steady state: neither drying out (calibrated propositions decreasing) nor settling (calibrated propositions increasing).

## The partition function and phase transition

The universe partition function ([RelationalUniversePartitionFunction](../math/relational-universe-partition-function.md)) combines the two spectral tiers. The universe content at depth $n$ is $C(n) = (n+1) \cdot F_{n+1}$: the product of the history count $(n+1)$ (from the two-generator commuting site) and the fixed-fiber count $F_{n+1}$ (the $(n+1)$-th Fibonacci number, conditional on exact recurrence). The partition function is

$$Z(\beta) = \sum_{n \geq 0} C(n)\, e^{-\beta n} = \frac{1 + q^2}{(1 - q - q^2)^2}, \qquad q = e^{-\beta}.$$

**The critical point** is at $\beta_c = \ln\varphi \approx 0.481$, where $Z(\beta)$ has a double pole with Laurent expansion

$$Z(\beta) \sim \frac{\varphi^3/5}{(\beta - \ln\varphi)^2} \qquad \text{as } \beta \to (\ln\varphi)^+.$$

The residue $\varphi^3/5 \approx 0.847$ is determined by the golden ratio identity $\varphi + \varphi^{-1} = \sqrt{5}$.

**What this means for rain**: $Z(\beta)$ counts, weighted by $e^{-\beta n}$, the total calibrated content of the universe at each depth. The critical inverse temperature $\beta_c = \ln\varphi$ is the boundary between:
- $\beta > \beta_c$ (below critical temperature $T_c = 1/\ln\varphi$): the partition function converges — the universe has controlled settled content, settlement is sparse relative to history growth.
- $\beta < \beta_c$ (above critical temperature): $Z$ diverges — the settled content grows faster than the depth-damping $e^{-\beta n}$ can absorb.

The critical temperature $T_c = 1/\ln\varphi$ is a topos invariant: it is determined entirely by the fiber's Fibonacci growth rate, which comes from the nuclear quartet. The critical exponent $\alpha = 2$ (the specific heat $C(\beta) = \partial^2_\beta \ln Z$ diverges as $(\beta - \beta_c)^{-2}$) is a site invariant: it counts the number of commuting generators in the history site.

For rain as a specific proposition within this system: the precipitation eigenvalue $\lambda_{r_t}$ is one contribution to the total fiber spectral content that $Z$ sums over. Rain becoming calibrated ($\lambda_{r_t} = 0$) is one proposition transitioning from the non-zero eigenspace to the zero eigenspace at a particular depth — one addend of $C(n)$ shifting from $C_t$ to $V_t$ in the mode decomposition $\widetilde{V}_t = V_t \oplus C_t$.

## The mode algebra and compound weather conditions

The sheaf of propositional modes $\widetilde{V}_t = K^{H_t}$ carries a $K$-algebra structure from the meet operation of $H_t$: the product is $e_a \cdot e_b = e_{a \wedge b}$. Under the Derivation Condition (open, conditional on interval-additivity), the defect operator $\delta_t$ satisfies the Leibniz rule

$$\delta_t(f \cdot g) = \delta_t(f) \cdot g + f \cdot \delta_t(g),$$

making $(\widetilde{V}_t, \cdot, \delta_t)$ an internal differential graded $K$-algebra. The eigenspaces multiply: $E_{t,\lambda} \cdot E_{t,\mu} \subseteq E_{t,\lambda+\mu}$.

**Applied to compound weather propositions**: the precipitation proposition $r_t \in E_{t,\lambda_{r_t}}$ and the heavy-wind proposition $w_t \in E_{t,\lambda_{w_t}}$ meet to give $r_t \wedge w_t \in E_{t,\lambda_{r_t} + \lambda_{w_t}}$ (under the Derivation Condition). A compound weather event — rain AND high winds — has eigenvalue equal to the sum of the constituent eigenvalues. It is harder to settle than either constituent alone: more nuclear travel is required to carry the conjunction to $H_t^*$.

Conversely, the stable modes compose to stable modes: $E_{t,0} \cdot E_{t,0} \subseteq E_{t,0}$. The meet of two calibrated atmospheric propositions is calibrated. Compound weather statements built from already-settled facts remain settled — this is the closure of $H_t^*$ under meet, now viewed as the multiplicative closure of the zero eigenspace.

## External grounding

**Peters and Neelin (2006)** (*Nature Physics* 2: 393–396): precipitation onset shows power-law behavior $P \sim (w - w_c)^{0.215}$ near the critical column water vapor $w_c$, consistent with directed percolation. In spectral terms: as $w \to w_c$, the precipitation eigenvalue $\lambda_{r_t}$ approaches zero and the variance in $\lambda_{r_t}$ across ensemble members diverges — the system is at maximum susceptibility near the phase boundary. The directed percolation exponent $\beta_\mathrm{DP} \approx 0.215$ is distinct from the thermodynamic exponent $\alpha = 2$ of the partition function; they characterize different aspects of criticality (precipitation rate vs. settled-content divergence).

**Lorenz (1969)** (*Journal of the Atmospheric Sciences* 26(4): 636–646): the predictability limit arises from finite Lyapunov exponents. In spectral terms: the Discrete Forward Laplacian of the precipitation eigenvalue $(L\lambda_r)(t) = \sum_s (\lambda_{r_{t \star s}} - \lambda_{r_t})$ becomes unpredictable beyond the Lorenz horizon because the atmospheric evolution sends histories along paths where eigenvalue trajectories are exponentially sensitive to initial conditions. Beyond the predictability limit, forecasting $\lambda_{r_{t+n}}$ from $\lambda_{r_t}$ is no better than forecasting from the partition function average.

**Kessler (1969)**: the autoconversion threshold $L_c \approx 1\ \mathrm{g/m^3}$ is the cloud liquid water content at which the precipitation proposition transitions from FreeShadow ($\lambda_{r_t} \geq 2$) to SaturationShadow or TransferShadow ($\lambda_{r_t} \geq 1$) — the first reduction in projection gap size, the first step of nuclear travel completed.

## Nuclear reading

**Proposition 1 (The defect operator is diagonal; the precipitation eigenvalue is the projection gap size; rain is the zero eigenspace).** The defect operator $\delta_t$ on $\widetilde{V}_t = K^{H_t}$ is diagonal with $\delta_t(e_{r_t}) = \lambda_{r_t} \cdot e_{r_t}$ where $\lambda_{r_t} = |[r_t, \pi_t(r_t)]| - 1$. Rain ($r_t \in H_t^*$) is the condition $\lambda_{r_t} = 0$, i.e., $r_t \in E_{t,0} = V_t = K^{H_t^*}$.

*Proof.* By [RelationalHistoryFiberModeSpectralDecompositionDefectOperatorEigenspaces](../math/relational-history-fiber-mode-spectral-decomposition-defect-operator-eigenspaces.md): $\delta_t$ is diagonal by construction; $E_{t,0} = V_t$ exactly, with every $a \in H_t \setminus H_t^*$ having eigenvalue $\lambda_a \geq 1$. $\square$

*Content.* Rain is not merely a presence/absence fact — it is the precipitation proposition arriving at a specific location in the spectral decomposition of the fiber: the zero eigenspace. Everything else in the fiber that is not calibrated contributes positive eigenvalue to the trace. The moment of rain is the moment the precipitation mode evaporates from the calibration defect sum.

**Proposition 2 (The forward Laplacian of spectral mass classifies approaching vs. developing rain; harmonic atmospheres are settlement-neutral).** $(LM)(t) = \sum_{s \in \Sigma}(M_{t \star s}(\delta) - M_t(\delta))$. If $(LM)(t) < 0$, the atmosphere is in the accelerating-settlement regime: approaching calibrated rain on average. If $(LM)(t) > 0$, unsettledness is growing: storm development. If $(LM)(t) = 0$, the history is harmonic for spectral mass: meteorological equilibrium.

*Proof.* By definition of [RelationalHistoryDiscreteForwardLaplacian](../math/relational-history-discrete-forward-laplacian.md) applied to $\varphi = M_\cdot(\delta)$. The sign of $(LM)(t)$ is exactly the difference between the average spectral mass over next steps and the current spectral mass. $\square$

*Content.* The harmonic locus $\mathrm{Harm}(M)$ separates the history category into approach-to-rain regions and storm-development regions. The Peters-Neelin critical point $w_c$ is, in this language, the boundary of $\mathrm{Harm}(M)$: below it, $(LM)(t) > 0$ (conditions building, eigenvalue growing); above it, $(LM)(t) < 0$ (precipitation onset, eigenvalue decreasing toward zero).

**Proposition 3 (The partition function has a double pole at $\beta_c = \ln\varphi$; the critical point is a topos invariant and the exponent is a site invariant).** Conditional on exact Fibonacci recurrence $d_t(n) = F_{n+1}$: $Z(q) = (1+q^2)/(1-q-q^2)^2$ with a double pole at $q = 1/\varphi$ (i.e., $\beta_c = \ln\varphi$). The specific heat diverges with exponent $\alpha = 2$. The critical point is determined by the fiber (nuclear quartet) and the exponent by the site (number of commuting generators).

*Proof.* By [RelationalUniversePartitionFunction](../math/relational-universe-partition-function.md): the closed form follows from differentiating $q/(1-q-q^2)$; the double pole arises from the Hadamard product of $f_T$ (double pole at $z=1$) and $f_H$ (simple pole at $z=1/\varphi$) by the singularity transfer principle. The specific heat computation follows from the Laurent expansion near $\beta_c$. $\square$

*Content.* Rain, as a phenomenon that occurs at all depths of the tower, is subject to this thermodynamic structure. The critical temperature $T_c = 1/\ln\varphi$ is the temperature at which the total calibrated content of the universe is on the verge of divergence — where the Fibonacci growth of the fixed fiber is just barely absorbed by the inverse-temperature damping. Rain becoming calibrated at any particular history is a local event; the phase transition is a global property of the entire tower.

**Proposition 4 (Under the Derivation Condition, compound weather conditions have additive eigenvalues; conjunctions of calibrated conditions are calibrated).** If the Derivation Condition holds and $r_t \in E_{t,\lambda_r}$, $w_t \in E_{t,\lambda_w}$, then $r_t \wedge w_t \in E_{t,\lambda_r + \lambda_w}$. The zero eigenspace $E_{t,0}$ is multiplicatively closed under meet.

*Proof.* From the graded algebra structure: $E_{t,\lambda} \cdot E_{t,\mu} \subseteq E_{t,\lambda+\mu}$ under the Leibniz rule ([RelationalHistoryFiberModeSpectralDecompositionDefectOperatorEigenspaces](../math/relational-history-fiber-mode-spectral-decomposition-defect-operator-eigenspaces.md)). For the zero eigenspace: $E_{t,0} \cdot E_{t,0} \subseteq E_{t,0}$. This recovers closure of $H_t^*$ under meet as the multiplicative closure of the zero eigenspace. $\square$

*Content.* Compound weather events — precipitation AND cold temperatures, or precipitation AND high winds — are harder to settle than any single constituent. Each conjunction increases the total eigenvalue by the additive contribution of the added condition. This is why multi-condition weather patterns (complex frontal systems requiring precipitation, wind shear, instability, and moisture simultaneously) have larger projection gaps and take longer to become calibrated than any single atmospheric condition alone.

**Proposition 5 (Temperature duality: spectral mass and Hawking temperature are inversely related; settled rain has zero thermodynamic temperature and divergent Hawking temperature, conditional on golden stability conjecture).** $T_\mathrm{thermo} \propto M_t(\delta)$ and $T_H = 1/(2M_t(\delta))$. At $\lambda_{r_t} = 0$: the precipitation contribution to $M_t(\delta)$ is zero and its contribution to $T_H$ is at its maximum effective value (infinite if it were the only mode).

*Proof.* From [RelationalHistoryFiberSpectralThermodynamicsTemperatureDualityGoldenConjecture](../math/relational-history-fiber-spectral-thermodynamics-temperature-duality-golden-conjecture.md): the thermodynamic temperature formula follows from defining $U = M_t(\delta)$ and $S = \log F_n \sim n \log\varphi$ and computing $T = \partial U/\partial S$; the Hawking temperature is from [RelationalHistoryFiberSpectralHawkingEvaporationOperatorPhysicsCorrespondence](../math/relational-history-fiber-spectral-hawking-evaporation-operator-physics-correspondence.md). The at-zero behavior: $T_\mathrm{thermo}(r_t) \to 0$ as $\lambda_{r_t} \to 0$; $T_H \to \infty$ for the degenerate case of a single evaporating mode. Conditional on the golden stability conjecture $M_t^{(n)} \propto \varphi^{-n}$. $\square$

*Content.* Rain is the arrival of the precipitation mode at thermal ground state. The thermodynamic interpretation is: a raining atmosphere that reaches RelationalHistoryFixedFiber has spent all its precipitation-related spectral energy. It is cold in the mode-energy sense. But it is hot in the Hawking sense: the spectral horizon for what little precipitation-mode energy remains has a divergently high effective temperature. The last degree of unsettledness in a rain event is the hottest degree — it is released at the highest rate.

## Open questions

- Whether the Peters-Neelin critical exponent $\beta_\mathrm{DP} \approx 0.215$ for precipitation onset corresponds to a ratio of eigenvalue-change rates near the Lorenz predictability boundary — whether the power-law behavior of precipitation rate near $w_c$ is the observable signature of the precipitation eigenvalue $\lambda_{r_t}$ approaching zero at a rate governed by the directed percolation universality class rather than the partition function critical exponent $\alpha = 2$.
- Whether the harmonic locus $\mathrm{Harm}(M)$ for the spectral mass observable forms a structured sub-universe and whether its boundary in $T$ corresponds to identifiable meteorological boundaries (fronts, convective initiation thresholds, inversion layers) that mark the transition from accelerating to decelerating settlement in the atmospheric history category.
- Whether the Derivation Condition (eigenvalues additive under meet) holds for atmospheric propositions — whether the projection gap of a compound weather condition equals the sum of its constituents' gaps, and whether the observed complexity of multi-condition weather patterns (frontal systems requiring all four precipitation ingredients simultaneously) is a consequence of eigenvalue additivity forcing the conjunction eigenvalue to the sum.
- Whether the critical temperature $T_c = 1/\ln\varphi \approx 2.078$ has a meteorological interpretation — whether there exists a natural observable on the atmosphere that, when varied, exhibits a phase transition at this value, and whether the Peters-Neelin observation that tropical precipitation self-organizes near criticality (QE regime as SOC) is the physical instance of the partition function approaching $\beta_c$.
- Whether the temperature duality ($T_\mathrm{thermo} \propto M_t$, $T_H = 1/(2M_t)$) has a direct meteorological signature — whether there exists a measurable atmospheric quantity that behaves like $T_H$ near precipitation onset (increasing as the atmosphere approaches settlement) that would provide empirical access to the Hawking temperature conjecture, and whether the rapid intensification of spectral releases near onset corresponds to the divergence of $T_H$ as $M_t \to 0$.
