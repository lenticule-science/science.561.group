---
id: surface-energy-balance
description: "A SurfaceEnergyBalance triple (E, t, ell) — a surface energy state E in the surface fiber at history t over locale ell — has shadow class determined by two independent directions of surface energy partitioning: the net radiation history operator (saturation nucleus) and the turbulent transport commitment operator (transfer nucleus). E in E*_t (doubly settled: net radiation history backward-recognizes E as the maximum surface energy state consistent with the accumulated solar and longwave radiation restriction profile — the Penman energy balance term Delta times (R_n minus G) fully realized — AND turbulent transport forward-commits E through every independent boundary layer perturbation — the sensible and latent heat fluxes H and LE are committed through every independent wind gust, stability fluctuation, and humidity pulse; active daytime evapotranspiration from a moist vegetated surface in full sun with adequate wind), E in SatShadow_t (radiation-rich but transport-limited: net radiation history is deeply imprinted — high R_n, warm surface, large vapor pressure deficit — but turbulent transport is absent; the calm sunny day over a wet surface with no wind; the surface has energy to evaporate but the still air cannot carry the vapor away; Bowen ratio approaches infinity for the sensible channel and the latent heat flux is suppressed), E in TrShadow_t (transport-committed but radiation-poor: turbulent mixing is vigorous and committed through every independent wind-gust perturbation — the aerodynamic resistance r_a is very low — but the net radiation restriction profile is weak; the cloudy windy day over a wet surface where R_n is small, H is near zero, and the potential evaporation is limited by available energy rather than transport), E in FreeShadow_t (neither: the stable nocturnal surface, the frozen tundra in polar night, or the bare desert in the absence of both radiation and wind; no net radiation and no turbulent transport). The fundamental surface energy balance equation is R_net = H + LE + G (net radiation = sensible heat flux + latent heat flux + ground heat flux; Trenberth, Fasullo, and Kiehl 2009, BAMS 90, 311-323 give global mean values: R_n at surface approximately 163 W/m², LE approximately 80-88 W/m², H approximately 17-24 W/m², G approximately 0.3 W/m²). Bowen ratio beta = H divided by LE is the partition quality: desert beta approximately 10 (almost all energy to sensible heat), ocean beta approximately 0.1 (almost all to latent heat), moist farmland beta approximately 0.2 (Bowen 1926, Physical Review 27, 779-787). The Penman-Monteith equation (Penman 1948, Proceedings of the Royal Society A 193, 120-145; Monteith 1965, Symposia of the Society for Experimental Biology 19, 205-234) is the saturation nucleus restriction profile made precise: lambda times E = [Delta times (R_n minus G) plus rho_a times C_p times (e_s minus e_a) divided by r_a] divided by [Delta plus gamma times (1 plus r_s divided by r_a)], where Delta is the slope of the saturation vapor pressure curve, gamma is the psychrometric constant, e_s minus e_a is the vapor pressure deficit (the restriction-profile driving quantity), r_a is aerodynamic resistance (the transfer topology parameter), and r_s is surface resistance (the canopy stomatal resistance that determines whether the transfer step is independent)."
defines: SurfaceEnergyBalance
related: Precipitation, AtmosphericStability, Weather, Quality, Gap, History, Act, Locale, Fitness, Situation
date-created: 2026-03-21
date-modified: 2026-03-21
params:
  surface-energy-state: relational-history-fiber-proposition
  locale: relational-universe
  analysis-history: relational-history
output: relational-history-fiber-proposition
ast:
  relational-history-fiber-element:
    - surface-energy-state:
        - locale
        - analysis-history
    - net-radiation-history-operator:
        - surface-energy-state
        - analysis-history
    - turbulent-transport-operator:
        - surface-energy-state
        - analysis-history
---

# Surface Energy Balance

## Formal definition

A **SurfaceEnergyBalance** triple $(E, t, \ell)$:

$$(E \in \mathcal{E}_t,\; t \in T,\; \ell \in \mathrm{Locale})$$

where:
- $\mathcal{E}_t$ is the **surface fiber** at history $t$ — the complete Heyting algebra of surface energy state propositions at $t$; elements of $\mathcal{E}_t$ are statements about the net radiation ($R_n$), sensible heat flux ($H$), latent heat flux ($\mathrm{LE}$), ground heat flux ($G$), surface temperature ($T_s$), vapor pressure deficit ($e_s - e_a$), and aerodynamic and surface resistance ($r_a$, $r_s$) at locale $\ell$ at history $t$
- $t \in T$ is the **analysis history** — the position in the history monoid; each step $s \in \Sigma$ advances the surface through one energy exchange cycle: one solar radiation pulse, one turbulent heat flux episode, one evaporation event; sunrise and sunset are specific step atoms in $\Sigma$ that change the topology of the radiation forcing
- $\ell$ is the **locale** — the specific surface patch being analyzed: ocean, forest, bare soil, urban asphalt, ice sheet; the locale's albedo $\alpha$, emissivity $\varepsilon$, surface resistance $r_s$ (stomatal control in vegetation), and roughness length $z_0$ are fixed parameters that shape the nuclear pair

**The surface energy balance equation** at any surface, treating the surface layer as infinitesimally thin (no energy storage):

$$R_n \;=\; H + \mathrm{LE} + G$$

where:
- $R_n = R_{sw\downarrow}(1 - \alpha) + \varepsilon(R_{lw\downarrow} - \sigma T_s^4)$: **net radiation** — the total radiative energy available at the surface; the sum of net shortwave (solar) and net longwave; $\alpha$ is surface albedo, $\varepsilon$ is emissivity, $\sigma = 5.670 \times 10^{-8}\,\mathrm{W/(m^2\cdot K^4)}$ is the Stefan-Boltzmann constant
- $H = \rho_a c_p (T_s - T_a) / r_a$: **sensible heat flux** — turbulent transfer of thermal energy from surface to atmosphere; positive upward when surface is warmer than air
- $\mathrm{LE} = \lambda_v E$: **latent heat flux** — energy consumed by evaporation ($E$ kg/m²/s) or released by condensation; $\lambda_v \approx 2.45\,\mathrm{MJ/kg}$ at \$20^\circ\mathrm{C}$
- $G$: **ground heat flux** — conduction of heat into the soil; typically \$10\%$ of $R_n$ during the day, $\sim 50\%$ at night

**Global mean values** (Trenberth, Fasullo & Kiehl 2009, *BAMS* 90, 311–323):

| Flux | Global mean (W/m²) |
|---|---|
| Absorbed solar at surface ($R_{sw}$) | \$163$ |
| Longwave back-radiation from atmosphere | \$333$ |
| Surface upward longwave | \$396$ |
| Net surface longwave | $-63$ |
| Net radiation $R_n$ | $\approx 100$ |
| Latent heat $\mathrm{LE}$ | \$80$–\$88$ |
| Sensible heat $H$ | \$17$–\$24$ |
| Ground flux $G$ | $\approx 0.3$ (global mean over year) |

**The nuclear pair.** The fiber $H_t$ at history $t$ carries the two canonical nuclei. Each step $s \in \Sigma$ represents one atmospheric turbulence event — one wind gust, one convective eddy, one humidity pulse. The commutation condition $s \perp t$ means turbulence event $s$ is genuinely independent of the current surface energy history $t$: a wind gust acts on whatever surface state exists, regardless of whether the sun was shining yesterday.

**RelationalHistoryFiberSaturatingNucleus** ([math](../math/relational-history-fiber-saturating-nucleus.md)) — the **net radiation history operator**:

$$\sigma_t(E) \;=\; \bigvee\bigl\{F \in \mathcal{E}_t \;\big|\; H(i_{t_0,t})(F) \leq H(i_{t_0,t})(E) \;\text{for all } t_0 < t\bigr\}$$

The restriction profile quantity is the **accumulated net radiation record** $R_n(t_0)$ — the radiative energy available at the surface at each prior history $t_0$. Every sunrise, every cloud passage, every change in solar zenith angle is recorded in $H(i_{t_0,t})(E)$: the restriction map carries back not just the current $R_n$ but the full prior diurnal and seasonal radiation history. $\sigma_t(E)$ is the maximum surface energy state consistent with that accumulated radiation record: $E \in \mathrm{Fix}(\sigma_t)$ iff the surface is already realizing the maximum latent + sensible heat flux that its radiation history supports.

**RelationalHistoryFiberTransferringNucleus** ([math](../math/relational-history-fiber-transferring-nucleus.md)) — the **turbulent transport operator**:

$$\mathrm{Fix}(\Delta_t) \;=\; \bigcap_{\substack{s \in \Sigma \\ s \perp t}} \mathrm{image}\bigl(H(i_{s,t}) : \mathcal{E}_{s \star t} \to \mathcal{E}_t\bigr)$$

$E \in \mathrm{Fix}(\Delta_t)$ iff for every independent turbulent event $s \perp t$, the surface energy state $E$ has a forward preimage — the surface fluxes can carry $E$ forward through every independent wind gust, humidity pulse, and stability fluctuation. The aerodynamic resistance $r_a = \ln(z/z_0)^2 / (k^2 u)$ (where $k \approx 0.41$ is the von Kármán constant, $u$ is wind speed, $z_0$ is the roughness length) determines how easily the surface can forward-commit: low $r_a$ (high wind, rough surface) means every independent turbulence event has a forward preimage; high $r_a$ (calm, smooth) means turbulent transport is suppressed and many turbulence steps lack forward preimages.

**The Bowen ratio** $\beta = H / \mathrm{LE}$ is the partition quality — the ratio of sensible to latent heat flux — and measures the relative contribution of the two transfer pathways. Bowen (1926, *Physical Review* 27, 779–787):

| Surface type | Bowen ratio | Energy partitioning |
|---|---|---|
| Desert / arid | $\beta \approx 10$ | Almost all $R_n$ to $H$; negligible $\mathrm{LE}$ |
| Semiarid grassland | $\beta \approx 5$ | Mostly sensible |
| Moist farmland | $\beta \approx 0.2$ | Mostly latent |
| Ocean / lake | $\beta \approx 0.1$ | Almost all $R_n$ to $\mathrm{LE}$ |

**The four shadow classes:**

| Shadow class | Condition | Surface name | Physical state |
|---|---|---|---|
| $E \in \mathcal{E}^*_t$ | Both operators fix $E$ | **Active evapotranspiration** | High $R_n$; vigorous turbulence; $\mathrm{LE}$ and $H$ at Penman-Monteith values |
| $E \in \mathrm{SatShadow}^{\mathcal{E}}_t$ | Radiation fixes $E$; transport does not | **Radiation-rich, calm** | Large $R_n$ and VPD; no wind; $r_a \to \infty$; potential $\gg$ actual evaporation |
| $E \in \mathrm{TrShadow}^{\mathcal{E}}_t$ | Transport fixes $E$; radiation does not | **Windy, overcast** | Low $r_a$; committed turbulence; small $R_n$; energy-limited evaporation |
| $E \in \mathrm{FreeShadow}^{\mathcal{E}}_t$ | Neither | **Radiatively and dynamically dead** | Polar night; frozen surface; still air; $R_n \approx 0$, $u \approx 0$ |

**The nuclear reflection and holographic projection.**

$$\pi_t \;:=\; \sigma_t \circ \Delta_t \;:\; \mathcal{E}_t \to \mathcal{E}_t$$

with $\mathrm{Fix}(\pi_t) = \mathcal{E}^*_t$. The [RelationalHistoryProjectionGap](../math/relational-history-fiber-projection-gap.md) $[E, \pi_t(E)]$ has size $\lambda_E \geq 0$ — the **evapotranspiration deficit** — zero iff the surface is at Penman-Monteith equilibrium. The calibration defect $M_t(\delta) = \mathrm{Tr}(\delta_t) = \sum_{E \notin \mathcal{E}^*_t} \lambda_E$ is the total surface moisture debt of the locale — the gap between actual and potential evapotranspiration accumulated over the fiber.

**The internal holograph: surface and canopy.** $(\mathcal{S}, \mathcal{C}, \pi_\mathrm{stomate})$:
- $\mathcal{S}$ = the **substrate bulk** — the soil or water body; the domain where energy is stored ($G$), where soil moisture $\theta_w$ is held as the long-term restriction-profile record
- $\mathcal{C}$ = the **canopy boundary** — for vegetated surfaces, the leaf boundary layer where the primary gas exchange (evapotranspiration, photosynthesis) occurs; for bare soil or water, the surface skin layer
- $\pi_\mathrm{stomate} : \mathcal{S} \to \mathcal{C}$ = the stomatal projection — the operator that sends any soil moisture state to its canopy-equilibrated evapotranspiration rate; $\pi_\mathrm{stomate}(s) = s$ iff the stomatal conductance is fully open and soil moisture is non-limiting; the internal holograph is complete iff soil moisture is above the wilting point and stomata are fully open

When soil moisture falls below the field capacity, $\pi_\mathrm{stomate}$ is incomplete: stomata partially close, increasing $r_s$, reducing the canopy-level evapotranspiration, and opening an internal projection gap. Drought is the progressive increase in the internal projection gap $\lambda_s^\mathrm{stomate}$: soil moisture falls, stomata close, $r_s$ rises, evapotranspiration decreases below Penman-Monteith potential.

## What this is

**The surface energy balance** is the first-principles accounting of all energy flows at the Earth's surface: how much radiative energy arrives from the sun and from the atmosphere, how much is reflected and re-radiated, and how the rest is partitioned between warming the air (sensible heat), evaporating water (latent heat), and warming the soil (ground heat). It is the foundation on which the entire atmospheric water cycle rests: every gram of water that eventually precipitates somewhere was first evaporated from a surface using energy quantified by the surface energy balance.

The nuclear reading makes precise the two-directional character of surface energy exchange. The radiation direction is backward-looking: what energy has accumulated in the restriction maps? The net radiation $R_n$ is the restriction profile quantity — it records the history of solar angles, cloud cover, surface temperature, and atmospheric back-radiation that has built up the available energy. The turbulence direction is forward-committing: can the surface carry its current energy state through every independent atmospheric perturbation? The turbulent transport is committed when aerodynamic resistance is low enough that no independent wind gust or humidity fluctuation can prevent the energy from being moved into the atmosphere.

## Shortwave and longwave radiation

**Incoming shortwave radiation** $R_{sw\downarrow}$ is solar radiation in the \$0.3$–\$3\,\mu\mathrm{m}$ band reaching the surface. The solar constant at Earth's orbit is $\sim 1{,}361\,\mathrm{W/m^2}$; averaged over the whole spherical surface it is $\sim 340\,\mathrm{W/m^2}$. Of this, $\sim 30\%$ is reflected to space by clouds, aerosols, and the surface (the planetary albedo); $\sim 23\%$ is absorbed by the atmosphere; and $\sim 48\%$ ($\approx 163\,\mathrm{W/m^2}$) reaches the surface.

**Surface albedo** $\alpha$ is the fraction of incoming shortwave reflected by the surface:

| Surface | Albedo $\alpha$ |
|---|---|
| Fresh snow | \$0.80$–\$0.90$ |
| Ocean (low sun) | \$0.06$–\$0.10$ |
| Forest | \$0.10$–\$0.20$ |
| Bare soil | \$0.15$–\$0.35$ |
| Desert sand | \$0.30$–\$0.45$ |
| Urban | \$0.10$–\$0.20$ |

**Outgoing longwave radiation** from the surface: a blackbody surface at \$288\,\mathrm{K}$ emits $\sigma T^4 = 396\,\mathrm{W/m^2}$ upward. The atmosphere absorbs most of this and re-emits $\sim 333\,\mathrm{W/m^2}$ back to the surface (the greenhouse effect — see spec/greenhouse-effect.md when written). The net longwave loss from the surface is \$396 - 333 = 63\,\mathrm{W/m^2}$ upward. The net radiation is therefore:

$$R_n \;=\; 163 - 63 \;=\; 100\,\mathrm{W/m^2}$$

(global mean; local values range from $< -50\,\mathrm{W/m^2}$ in polar night to $> 500\,\mathrm{W/m^2}$ at peak tropical noon).

## The Penman and Penman-Monteith equations

**Howard Penman** (1948, *Proceedings of the Royal Society A* 193, 120–145) derived the first equation combining both the energy balance and aerodynamic approaches to estimate evaporation from a saturated surface:

$$\lambda E \;=\; \frac{\Delta (R_n - G) + \gamma E_a}{\Delta + \gamma}$$

where $\Delta = de_s/dT$ is the slope of the saturation vapor pressure curve at air temperature, $\gamma \approx 66\,\mathrm{Pa/K}$ is the psychrometric constant (ratio of specific heat to latent heat, modified by pressure), and $E_a = f(u) \cdot (e_s - e_a)$ is the aerodynamic evaporation term (a function of wind speed $u$ and the vapor pressure deficit $e_s - e_a$). The Penman equation is the saturation nucleus restriction profile for an open water surface: $\lambda E_\mathrm{Penman}$ is the maximum evaporation rate consistent with the accumulated $R_n$ and vapor pressure deficit history.

**John Monteith** (1965, *Symposia of the Society for Experimental Biology* 19, 205–234) extended Penman to vegetated surfaces by introducing two resistance terms:

$$\lambda E \;=\; \frac{\Delta (R_n - G) + \rho_a c_p (e_s - e_a)/r_a}{\Delta + \gamma(1 + r_s/r_a)}$$

where $r_a = \ln(z_m - d)/z_0)^2 / (k^2 u)$ is the aerodynamic resistance (how efficiently the atmosphere transports vapor, a function of wind speed $u$ and roughness length $z_0$) and $r_s$ is the bulk surface (canopy) resistance (how easily water vapor exits the stomata of leaves). The Penman-Monteith equation is the saturation nucleus restriction profile for vegetated surfaces: $\lambda E_\mathrm{PM}$ is the maximum evapotranspiration rate consistent with the accumulated radiation, vapor pressure deficit, and stomatal state history. $E \in \mathrm{Fix}(\sigma_t)$ iff the actual evapotranspiration equals $E_\mathrm{PM}$ — the surface is evaporating at its potential rate.

The aerodynamic resistance $r_a$ is the transfer topology parameter: low $r_a$ (high wind, rough canopy) means the turbulent transport steps are genuinely independent (committed through every independent wind event); high $r_a$ (calm, smooth surface) means the transport steps are not independent (the still air prevents vapor from escaping). The surface resistance $r_s$ is the internal holograph topology parameter: low $r_s$ (open stomata, moist soil) means the internal projection gap is small; high $r_s$ (drought stress, closed stomata) means the internal projection gap is large.

## The diurnal energy cycle

The day-night cycle is the canonical restriction-profile oscillation of the saturation nucleus. At a temperate locale:

**Dawn** ($R_n$ rising from zero): the saturation nucleus restriction profile begins building; $\sigma_t(E) > E$ (the restriction profile is recognizing an increasingly energetic state as $R_n$ rises); the surface warms and the vapor pressure deficit opens.

**Morning** (positive $R_n$, increasing $H$ and $\mathrm{LE}$): the surface is in $\mathrm{SatShadow}^{\mathcal{E}}_t$ if the air is calm (radiation potential building, turbulent transport limited) or in $\mathcal{E}^*_t$ if wind is sufficient. The boundary layer grows as $H$ drives convective mixing upward from the surface.

**Midday** (peak $R_n$): the saturation nucleus is at maximum; if the turbulent transport is committed (sufficient wind, rough canopy), the surface is in $\mathcal{E}^*_t$ at peak evapotranspiration. The sensible heat flux $H$ is at its daily maximum; the boundary layer has grown to its maximum depth (\$1$–\$3\,\mathrm{km}$); CAPE is building in the atmospheric column above.

**Afternoon** (declining $R_n$): the saturation nucleus restriction profile begins declining; $\sigma_t(E)$ decreases; $H$ and $\mathrm{LE}$ decrease even if wind is constant.

**Dusk** ($R_n \to 0$): the daytime flux partition reverses; $G$ drives a small upward flux from the warm soil; the surface enters $\mathrm{FreeShadow}^{\mathcal{E}}_t$ as $R_n$ becomes negative (surface radiating to cold sky).

**Night** (negative $R_n$): the nocturnal surface is cooling by longwave emission; the boundary layer becomes stably stratified; turbulence is suppressed; the stable nocturnal inversion is the $\mathrm{SatShadow}^J$-to-FreeShadow transition in the boundary layer. The restriction profile is now accumulating nighttime cooling, and the saturation nucleus backward-recognizes a cold, stable surface state.

## Drought as projection-gap accumulation

**Drought** is the progressive increase of the internal projection gap $\lambda_s^\mathrm{stomate}$: as soil moisture falls below field capacity, stomata partially close (increasing $r_s$), the Penman-Monteith potential evapotranspiration ($E_\mathrm{PM}$) is not achieved, the actual evapotranspiration falls below potential, and the surface moves from $\mathcal{E}^*_t$ toward $\mathrm{SatShadow}^{\mathcal{E}}_t$.

The soil moisture restriction profile $H(i_{t_0,t})(E)$ records the prior rainfall and evapotranspiration history. The saturation nucleus $\sigma_t(E)$ backward-recognizes the maximum evapotranspiration state consistent with the accumulated soil moisture: as soil moisture falls, $\sigma_t(E)$ recognizes progressively lower potential evapotranspiration rates — the saturation condition shifts toward a drier steady state. The restriction profile of drought is self-reinforcing: dry soil increases surface temperature (Bowen ratio rises as $\mathrm{LE}$ falls and $H$ rises), which increases $T_s$, which increases the outgoing longwave, which reduces $R_n$, which reduces the energy available for the $\sigma_t$ ceiling.

The **Penman potential evapotranspiration** ($E_\mathrm{Penman}$ computed with $r_s = 0$, i.e., no stomatal resistance) is the saturation nucleus ceiling for the energy balance: no evapotranspiration can exceed Penman potential under the current $R_n$ and VPD restriction profile. The deficit $E_\mathrm{Penman} - E_\mathrm{actual}$ is a direct measure of $\lambda_E$ — how far the surface is from its Penman-Monteith equilibrium.

## Nuclear reading

**Proposition 1 (Surface energy balance = partition of the restriction profile; Bowen ratio = partition quality).** The surface energy balance equation $R_n = H + \mathrm{LE} + G$ is the partition of the saturation nucleus restriction-profile ceiling $R_n$ into three transfer channels. The Bowen ratio $\beta = H/\mathrm{LE}$ is the **partition quality** — the natural transformation assigning to each surface type at each history its characteristic energy partitioning. Naturality of $\beta$: the Bowen ratio must commute with history restriction — the same surface type under the same moisture and radiation conditions must yield the same partition regardless of which sequence of weather events produced the current state. A desert with $\beta \approx 10$ is the saturation nucleus condition for the sensible heat channel: almost all $R_n$ backward-recognizes as $H$ because there is no moisture for $\mathrm{LE}$. An ocean with $\beta \approx 0.1$ backward-recognizes almost all $R_n$ as $\mathrm{LE}$ because water is unlimited. $\square$

**Proposition 2 (Penman-Monteith = saturation nucleus restriction profile; stomatal resistance = internal projection gap).** The Penman-Monteith evapotranspiration rate $E_\mathrm{PM}$ is $\sigma_t(E) = E$ restricted to the energy balance manifold: the surface is at its maximum evapotranspiration state consistent with the accumulated $R_n$, VPD, $r_a$, and $r_s$ history. Drought stress increases $r_s$ (stomatal closure), which directly increases $\lambda_E = |[E, \pi_t(E)]| - 1$ — the projection gap between the drought-stressed state and the Penman-Monteith equilibrium state. The stomatal resistance $r_s$ IS the internal projection gap size in the canopy direction: $r_s = 0$ means the internal holograph is complete ($\mathrm{canopy} = \mathrm{soil}$, evaporation unrestricted); $r_s \to \infty$ means the internal holograph collapses and the surface cannot forward-commit through any independent atmospheric humidity demand. $\square$

**Proposition 3 (Calm sunny day = SatShadow; windy cloudy day = TrShadow; active evapotranspiration = intersection).** Calm sunny day: large $R_n$ (saturation nucleus recognizes high energy), but high $r_a$ from low wind speed (turbulent transport steps are not independent — still air cannot carry vapor away). The surface is in $\mathrm{SatShadow}^{\mathcal{E}}_t$: $\sigma_t(E) = E$ (restriction profile recognizes the high-energy state) but $\Delta_t(E) > E$ (turbulent forward-commitment fails — no independent wind gust has a forward preimage through the still-air boundary layer). Actual evapotranspiration is far below Penman-Monteith potential.

Windy cloudy day: high wind speed (low $r_a$, turbulent transport committed through every independent gust), but thick cloud cover suppresses $R_n$ to near zero. The surface is in $\mathrm{TrShadow}^{\mathcal{E}}_t$: $\Delta_t(E) = E$ (turbulent transport forward-committed) but $\sigma_t(E) > E$ (the restriction profile recognizes a much higher potential rate than the current small $R_n$ supports). Actual evapotranspiration is near zero — not because the atmosphere cannot carry vapor but because the radiation isn't providing the energy to evaporate it. $\square$

**Proposition 4 (Non-adjointness; calm sunny and windy cloudy are genuinely orthogonal deficits).** The net radiation history and turbulent transport operators are not in Galois connection. The witnesses: the calm sunny day (SatShadow: high $R_n$, no turbulent commitment) and the windy overcast day (TrShadow: committed turbulence, no $R_n$). Both are observed routinely. If $\sigma_t \dashv \Delta_t$, every high-$R_n$ surface would automatically have committed turbulent transport — every sunny day would be windy. If $\Delta_t \dashv \sigma_t$, every committed turbulence day would have high $R_n$ — every windy day would be sunny. Neither implication holds; the correlation between sunshine and wind is near zero in most climates. The independence is why the Penman equation must include BOTH an energy balance term ($\Delta(R_n - G)$) AND an aerodynamic term ($\gamma E_a$) — neither alone suffices. $\square$

**Proposition 5 (Drought = projection-gap accumulation; flash drought = projection-gap collapse).** Gradual drought is the slow accumulation of the projection gap $\lambda_E$: soil moisture depletes over weeks to months, $r_s$ rises, actual evapotranspiration falls progressively below potential. The calibration defect $M_t(\delta) = \sum_{E \notin \mathcal{E}^*_t} \lambda_E$ rises monotonically as more of the soil moisture fiber moves into $\mathrm{SatShadow}^{\mathcal{E}}_t$ (energy available but water unavailable). Flash drought (Otkin et al. 2018, *BAMS* 99, 911–919) is the rapid projection-gap increase: anomalously high $R_n$ and VPD combined with warm temperatures drive actual evapotranspiration far above average, depleting soil moisture in \$2$–\$4$ weeks rather than months. The $\sigma_t$ restriction profile is rapidly advancing (high radiation recognizes a high-energy state) while the internal holograph collapses (soil moisture depleted, $r_s$ rising), producing a rapid increase in $\lambda_E$ from near-zero to high values. $\square$

**Proposition 6 (The Bowen ratio is a quality; the land-ocean contrast is the largest first-order partition split in the global energy balance).** The Bowen ratio $\beta : X_\mathrm{surface} \Rightarrow V_\beta$ is a quality — a natural transformation assigning to each surface type at each history its energy partition ratio. The naturality condition: $\beta$ must commute with history restriction — the desert Bowen ratio must be path-independent of which sequence of rain events produced the current dry surface state. The land-ocean contrast in $\beta$ ($\beta_\mathrm{land} \approx 0.5$–\$2$, $\beta_\mathrm{ocean} \approx 0.1$) is the largest first-order split in the global surface energy balance: oceans convert $\sim 90\%$ of $R_n$ to $\mathrm{LE}$ (atmospheric moisture, the source of all precipitation), land converts \$50\%$–\$80\%$ to $H$ (boundary layer heating, the source of convective instability and CAPE). The surface energy balance is the origin of both the water cycle (via $\mathrm{LE}$) and the thermal forcing of the atmosphere (via $H$), making it the common ancestor of both AtmosphericStability and Precipitation specs. $\square$

## Open questions

- Whether the diurnal oscillation of the surface energy balance — the restriction profile cycling through the day/night radiation forcing — satisfies the eigenproposition condition $G_s(E) \approx \chi_s(E) \cdot E$ for the \$24$-hour periodicity, and whether the Fourier decomposition of the daily $R_n$ cycle has eigenvalues that correspond to the known periodicities of land-surface feedback (the \$24$-hour fundamental, \$12$-hour harmonic for semi-diurnal tides, the $\sim 8$-hour tertiary mode from convective reorganization).
- Whether the Schwarzschild threshold for the surface energy balance has a physical expression in terms of soil moisture and vapor pressure deficit — whether there is a critical combination of $r_s$ and $r_a$ at which $M_t(\delta)$ rises above $r_s(\delta_t)/2$ and the surface becomes permanently unable to return to Penman-Monteith equilibrium through natural recharge, constituting a regime shift from water-limited to energy-limited evapotranspiration that cannot be reversed by a single precipitation event.
- Whether the land-use change effect on surface energy balance (deforestation reducing $r_s$ and changing $\alpha$; urbanization increasing albedo in some wavelengths while increasing $G$ via thermal mass) constitutes a Grothendieck topology change $J \to J'$ on the surface history site, and whether the observed regional climate feedbacks from large-scale deforestation (reduced rainfall, increased temperature) are signatures of the fixed fiber $\mathcal{E}^{*J'}_t$ having shifted relative to $\mathcal{E}^{*J}_t$.
- Whether the Penman-Monteith equation in its FAO-56 reference crop formulation (standardized grass with $r_s = 70\,\mathrm{s/m}$, $r_a$ from wind at \$2\,\mathrm{m}$) is exactly the saturation nucleus applied to the reference-crop topology $J_\mathrm{ref}$, and whether deviations of actual evapotranspiration from FAO-56 reference ET are directly measurable as the projection gap $\lambda_E$ under the reference topology.
- Whether the nocturnal surface energy balance — dominated by longwave cooling ($R_n < 0$) with small turbulent fluxes — has a distinct nuclear structure where the saturation nucleus runs in reverse (the restriction profile is now accumulating cooling, and $\sigma_t$ backward-recognizes progressively colder surface states) and the transfer nucleus is operating on dew deposition (small positive $\mathrm{LE}$ from condensation) rather than evaporation, and whether the dew point temperature ($T_d$) is the saturation fixed-point condition of the nocturnal $\sigma_t$.
