---
id: greenhouse-effect
description: "A GreenhouseRadiation triple (F, t, ell) — a radiative flux state F in the column fiber at optical-depth history t over locale ell — has shadow class determined by two independent directions of radiative regulation: the optical-depth history operator (saturation nucleus) and the effective-radiating-level commitment operator (transfer nucleus). F in F*_t (doubly settled: the optical-depth restriction profile backward-recognizes F as the maximum flux state consistent with the accumulated spectral absorption history — every prior atmospheric layer has contributed its full absorption and emission record to the flux state, and sigma_t backward-recognizes this as the maximum emission consistent with that history — AND the effective-radiating-level commitment operator forward-commits F through every independent spectral wavelength channel — for every independent band s perpendicular to t, there exists a radiative state at the adjacent optical-depth layer that restricts back to F; local thermodynamic equilibrium emission at the effective radiating level; outgoing longwave radiation 239 W per m squared equals absorbed shortwave; T_eff = 255 K for Earth). F in SatShadow_t (absorption-committed but effective radiating level not yet established: the optical-depth restriction profile is fully imprinted — the atmospheric composition has changed, each spectral channel carries the new absorption record, sigma_t backward-recognizes the full accumulated optical depth — but the temperature profile has not yet adjusted to find a new effective radiating level that commits through every independent wavelength channel; the atmospheric state immediately after a radiative forcing perturbation; after CO2 doubling the optical depth history is fully updated but the temperature response has not yet established a new ERL; the projection-gap size is the instantaneous radiative forcing delta_F approximately equal to 3.7 W per m squared for CO2 doubling and 5.35 times the natural log of the ratio C over C0 in general by Myhre et al. 1998). F in TrShadow_t (ERL-committed but optically thin: the flux state is already committed through every independent spectral channel — for every wavelength band s perpendicular to t, there exists a state at the next atmospheric layer that restricts back to F, because the atmosphere is nearly transparent at these wavelengths and surface radiation passes through without modification — but the optical-depth history is thin, the absorption record is weak; the 8 to 12 micrometer atmospheric window flux that passes from the surface to space nearly unimpeded; the direct surface emission visible to space at window wavelengths; also a dry cold high-latitude winter column where the tropospheric water vapor history is nearly absent and the atmosphere commits to radiating at nearly the surface temperature). F in FreeShadow_t (transient forcing: neither the optical-depth history has been organized into a coherent absorption restriction profile nor has ERL commitment been established; volcanic aerosol injection states where sulfate aerosols simultaneously disrupt the absorption history by scattering outgoing longwave and prevent ERL commitment by altering the temperature profile discontinuously; also the pre-atmospheric early Earth bare-rock state before any greenhouse atmosphere existed; a post-catastrophic warming state where water vapor feedback has made the optical-depth record incoherent and the ERL unconstrained). The Stefan-Boltzmann law F = epsilon times 5.67 times 10 to the negative 8 W per m squared per K to the fourth governs emission; the effective temperature T_eff = (S_0 times (1 minus alpha) divided by 4 divided by 5.67 times 10 to the negative 8) to the one-fourth power = 255 K is the temperature Earth must maintain at the effective radiating level to balance absorbed incoming solar 239 W per m squared; the actual surface temperature 288 K exceeds T_eff by 33 K — the greenhouse effect — because the effective radiating level is lifted 5 to 9 km above the surface and emits from there at 255 K while the surface below is warmer by the lapse-rate descent. The logarithmic forcing formula delta_F = 5.35 times ln(C over C_0) W per m squared is the saturation nucleus signature: the central CO2 absorption band near 15 micrometers is already optically thick at pre-industrial concentrations, so each new CO2 doubling saturates only the increasingly distant spectral wings and adds the same fixed increment of forcing — the restriction profile's marginal content decreases as the band saturates, producing logarithmic growth exactly as the saturation nucleus does at the ceiling of the restriction-profile class. The runaway greenhouse Schwarzschild threshold is the Simpson-Komabayashi-Ingersoll limit: when absorbed solar exceeds the maximum possible OLR of approximately 310 W per m squared for a water-vapor-dominated atmosphere, no equilibrium ERL exists; Venus at 735 K surface temperature and 90 bar CO2 atmosphere has crossed this threshold and is a FreeShadow planet — neither the optical-depth history is bounded nor is ERL commitment possible."
date-created: 2026-03-21
date-modified: 2026-03-21
params:
  radiative-flux-state: relational-history-fiber-proposition
  locale: relational-universe
  optical-depth-history: relational-history
output: relational-history-fiber-proposition
ast:
  relational-history-fiber-element:
    - radiative-flux-state:
        - locale
        - optical-depth-history
    - optical-depth-history-operator:
        - radiative-flux-state
        - optical-depth-history
    - effective-radiating-level-operator:
        - radiative-flux-state
        - optical-depth-history
title: Greenhouse Effect
---

# Greenhouse Effect

## Formal definition

A **GreenhouseRadiation** triple $(F, t, \ell)$:

$$(F \in \mathcal{F}_t,\; t \in T,\; \ell \in \mathrm{Locale})$$

where:
- $\mathcal{F}_t$ is the **radiative flux fiber** at optical-depth history $t$ — the complete Heyting algebra of radiative flux state propositions at $t$; elements of $\mathcal{F}_t$ are statements about the spectral irradiance field $I(\nu, z)$ at wavelength $\nu$ and altitude $z$, the longwave and shortwave irradiance profiles $F_{\downarrow}(z)$ and $F_{\uparrow}(z)$, the net flux $F_\mathrm{net}(z)$, and the derived radiative quantities (optical depth profile $\tau(\nu, z)$, brightness temperature $T_b(\nu)$, outgoing longwave radiation at the top of atmosphere) at locale $\ell$ at history $t$
- $t \in T$ is the **optical-depth history** — the position in the history monoid; each step $s \in \Sigma$ advances the column through one absorbing layer (one pressure-altitude increment from the top of atmosphere downward); the composition $s \star t$ adds one more layer of gas below the current top-of-column level; the independence structure $s \perp t$ captures the fact that different spectral wavelength bands absorb independently of each other in the first approximation — adding optical depth in the CO$_2$ 15 $\mu$m band does not change the optical depth in the H$_2$O 6.3 $\mu$m band or the atmospheric window
- $\ell$ is the **locale** — the geographical column; the locale's surface type, temperature, and emissivity determine the boundary condition at the surface (the lower-boundary constraint on the optical-depth history)

**The greenhouse nuclear pair.** The fiber $\mathcal{F}_t$ at optical-depth history $t$ carries the two canonical nuclei. Let $\Sigma$ be the step monoid for the column site $(T, J)$. Each step $s \in \Sigma$ represents one spectral absorption event at wavelength $\nu_s$: a unit increment of optical depth in one spectral band. The commutation condition $s \perp t$ means the absorption event at wavelength $\nu_s$ is **genuinely independent** of the current optical-depth history $t$ — absorbing in one spectral channel does not alter the absorption state in any other channel (the independent-band approximation that underlies radiative transfer in the atmosphere).

**RelationalHistoryFiberSaturatingNucleus** ([math](../math/relational-history-fiber-saturating-nucleus.md)) — the **optical-depth history operator**:

$$\sigma_t(F) \;=\; \bigvee\bigl\{G \in \mathcal{F}_t \;\big|\; H(i_{t_0,t})(G) \leq H(i_{t_0,t})(F) \;\text{for all } t_0 < t\bigr\}$$

The restriction profile quantity is the **spectral optical depth profile** — the accumulated absorption $\tau(\nu, z)$ at each wavelength $\nu$ through every prior layer $z$ above the current history position:

$$\tau(\nu, z_1 \to z_2) \;=\; \int_{z_1}^{z_2} k(\nu, z') \cdot \rho(z') \, dz'$$

where $k(\nu, z)$ is the absorption coefficient (m$^2$ kg$^{-1}$) and $\rho(z)$ is the absorber density. $H(i_{t_0,t})(F)$ is the radiative flux state at the shallower (higher-altitude) prior history $t_0$ — what the radiation field looked like at that layer before the current absorbing column was added. The restriction profile class of $F$ is the set of all flux states with at most $F$'s accumulated optical depth through every prior layer; $\sigma_t(F)$ is the maximum flux state consistent with that record.

$F \in \mathrm{Fix}(\sigma_t)$ iff the current flux state $F$ is already the maximum emission state the accumulated absorption history supports — it has **thermalized** to local thermodynamic equilibrium (LTE): the material at this layer is emitting the Planck function $B(\nu, T)$ at the local temperature, no more can be extracted from the optical depth history without accessing a hotter layer below.

**The Planck function as saturation ceiling.** The saturation nucleus $\sigma_t$ at each layer is bounded by the Planck function:

$$B(\nu, T) \;=\; \frac{2h\nu^3}{c^2} \cdot \frac{1}{e^{h\nu / k_B T} - 1}$$

where $h = 6.626 \times 10^{-34}$ J s is the Planck constant, $c = 3 \times 10^8$ m s$^{-1}$, and $k_B = 1.38 \times 10^{-23}$ J K$^{-1}$. The Stefan-Boltzmann law integrates over all frequencies: the total flux emitted by a blackbody is

$$F_\mathrm{BB} \;=\; \varepsilon \cdot (5.67 \times 10^{-8}\,\mathrm{W\,m^{-2}\,K^{-4}}) \cdot T^4$$

where $\varepsilon \leq 1$ is the emissivity. The saturation nucleus at each layer cannot produce a flux exceeding $F_\mathrm{BB}$ — the Planck function is the saturation ceiling for $\sigma_t$.

**RelationalHistoryFiberTransferringNucleus** ([math](../math/relational-history-fiber-transferring-nucleus.md)) — the **effective-radiating-level commitment operator**:

$$\mathrm{Fix}(\Delta_t) \;=\; \bigcap_{\substack{s \in \Sigma \\ s \perp t}} \mathrm{image}\bigl(H(i_{s,t}) : \mathcal{F}_{s \star t} \to \mathcal{F}_t\bigr)$$

$F \in \mathrm{Fix}(\Delta_t)$ iff for every independent spectral channel $s \perp t$, there exists a flux state $F'$ at the adjacent (one-step-deeper) atmospheric layer $s \star t$ that restricts back to $F$ — i.e., $F$ is already present in the image of every spectral restriction map from below. Physically: the flux state $F$ is **transfer-stable** iff for every independent wavelength band, adding one more absorbing layer of that band's gas still leaves $F$ as a consistent upstream radiative state. This is exactly the condition for $F$ to lie at or above the **effective radiating level (ERL)** for the relevant spectral band: the ERL at wavelength $\nu$ is the altitude $z_\mathrm{ERL}(\nu)$ where $\tau(\nu, z_\mathrm{ERL} \to \infty) \approx 1$ — the level from which photons at $\nu$ can escape to space. A flux state at or above the ERL for all bands is transfer-stable: every additional atmospheric layer below it has a preimage that restricts back.

**The four shadow classes for radiative flux states:**

| Shadow class | Condition | Radiative name | Physical state |
|---|---|---|---|
| $F \in \mathcal{F}^*_t$ | Both operators fix $F$ | **Radiative equilibrium** | OLR = 239 W/m²; T$_\mathrm{eff}$ = 255 K; absorbed solar = outgoing longwave |
| $F \in \mathrm{SatShadow}^{\mathcal{F}}_t$ | Optical depth fixes $F$; ERL commitment does not | **Forced unbalanced state** | Post-forcing: absorption record updated, temperature profile not yet adjusted; forcing $\Delta F \approx 3.7$ W/m² is the projection gap |
| $F \in \mathrm{TrShadow}^{\mathcal{F}}_t$ | ERL commitment fixes $F$; optical depth does not | **Window flux** | Atmosphere transparent at these wavelengths; surface radiation reaches space directly; 8–12 $\mu$m atmospheric window |
| $F \in \mathrm{FreeShadow}^{\mathcal{F}}_t$ | Neither operator fixes $F$ | **Transient disrupted state** | Volcanic aerosol injection; catastrophic composition perturbation; pre-atmospheric bare-rock surface |

**The nuclear reflection and holographic projection.**

$$\pi_t \;:=\; \sigma_t \circ \Delta_t \;:\; \mathcal{F}_t \to \mathcal{F}_t$$

is the [RelationalHistoryPropositionFiberSaturatingTransferringCommutingNuclearReflection](../math/relational-history-fiber-saturating-transferring-commuting-nuclear-reflection.md) with $\mathrm{Fix}(\pi_t) = \mathcal{F}^*_t$. The [RelationalHistoryProjectionGap](../math/relational-history-fiber-projection-gap.md) $[F, \pi_t(F)]$ has size $\lambda_F = |[F, \pi_t(F)]| - 1 \geq 0$ — the **radiative forcing gap** — zero iff $F$ is already at radiative equilibrium. The defect operator $\delta_t(e_F) = \lambda_F \cdot e_F$ grades radiative states by their distance from equilibrium; the calibration defect $M_t(\delta) = \mathrm{Tr}(\delta_t)$ is the total unresolved radiative forcing accumulated in the fiber at history $t$.

**The internal holograph: troposphere and tropopause.** $(\mathcal{T}, \mathcal{P}, \pi_\mathrm{trop})$:
- $\mathcal{T}$ = the **tropospheric bulk** — the lowest $\sim 10$–\$16$ km of atmosphere where temperature decreases with altitude at the environmental lapse rate, where the bulk of greenhouse absorption and emission occurs, where convection sets the temperature profile near the moist adiabatic lapse rate; the domain where the saturation nucleus restriction profile is being actively written by surface emission, water vapor absorption, and CO$_2$ and CH$_4$ absorption at every layer
- $\mathcal{P}$ = the **tropopause boundary** — the boundary between the convectively-mixed troposphere and the radiatively-controlled stratosphere; the tropopause is the natural boundary because it is where the tropospheric greenhouse effect terminates: above the tropopause, temperature increases with altitude (stratospheric ozone heating), and the independent-band structure changes
- $\pi_\mathrm{trop} : \mathcal{T} \to \mathcal{P}$ = the tropopause projection — sends any tropospheric flux state to its tropopause-level commitment; $\pi_\mathrm{trop}(F) = F$ iff the tropospheric column has fully committed its radiative state to the tropopause — the OLR at the tropopause equals the OLR at the top of atmosphere without any further stratospheric modification

The internal holograph is **complete** iff $\mathcal{T} = \mathcal{P}$ — when every tropospheric flux state is already expressed at the tropopause. This is the state of a well-mixed troposphere in exact radiative-convective equilibrium: the temperature profile follows the moist adiabatic lapse rate all the way from the surface to the tropopause, and the emission from each layer is already the tropopause-committed state. The internal holograph has a large internal projection gap in a strongly forced, rapidly evolving atmosphere: the tropospheric absorption history diverges from the tropopause-level OLR commitment, producing a $\pi_\mathrm{trop}$-gap that is the **tropospheric radiative imbalance**.

The **stratospheric cooling fingerprint** is the diagnostic signature of the internal holograph: when tropospheric greenhouse forcing increases (more CO$_2$), the tropospheric bulk $\mathcal{T}$ heats (the ERL rises, the lower ERL now emits from a higher, colder level), but the stratosphere above the tropopause $\mathcal{P}$ cools (it loses its radiation to space more efficiently because the tropopause OLR decreases). This simultaneous tropospheric warming and stratospheric cooling — the clearest observational fingerprint of greenhouse forcing as opposed to solar forcing (which would warm both) — is the internal holograph splitting: the bulk and boundary evolve in opposite directions under the projection $\pi_\mathrm{trop}$.

## What this is

The **greenhouse effect** is the mechanism by which the atmosphere traps thermal radiation from the surface and re-emits it at a colder temperature, maintaining the surface at a temperature well above what the planet would have if it radiated directly to space. It is not a malfunction but the default state of any atmosphere containing polyatomic molecules: the same mechanism that makes Earth habitable (average surface temperature 288 K vs. a bare-rock effective temperature of 255 K) also makes Venus an extreme case (735 K vs. a bare-rock effective temperature of 227 K).

The physics is straightforward: the surface absorbs incoming shortwave solar radiation and re-emits as longwave (thermal infrared, roughly 4–100 $\mu$m). Greenhouse gases in the atmosphere absorb this outgoing longwave and re-emit it in all directions. The upward half of that re-emission reaches space; the downward half returns to the surface (back-radiation). The effect is that the surface must be warmer than the effective radiating level to maintain the energy balance — the planet radiates the same total energy to space as it absorbs from the sun, but does so from the effective radiating level (altitude $\sim$ 5–9 km, temperature $\sim$ 255 K) rather than from the surface (temperature $\sim$ 288 K). The greenhouse effect is the 33 K difference.

The nuclear reading makes precise the two-directional character of radiative regulation. The optical-depth direction is backward-looking: how much absorption has accumulated in every spectral channel through every prior atmospheric layer? This is the restriction profile — the spectral optical depth $\tau(\nu)$ at each wavelength. The ERL-commitment direction is forward-committing: for every independent spectral channel, does the current flux state have a preimage in the adjacent layer? This is the ERL condition — whether the flux state is already committed to outgoing longwave at the level where each spectral band becomes optically thin.

## Earth's energy budget

The global-mean energy budget (Trenberth, Fasullo, and Kiehl 2009, *Bulletin of the American Meteorological Society* 90, 311–323):

| Quantity | Value (W/m²) | Radiative role |
|---|---|---|
| Incoming solar (top of atmosphere) | 340.4 | Input |
| Reflected solar (clouds, surface, atmosphere) | 100.0 | Albedo loss ($\alpha \approx 0.30$) |
| Absorbed solar (surface + atmosphere) | 238.5–240.0 | Net forcing |
| Surface emission (longwave, upward) | 396 | Thermal emission from 288 K surface |
| Back-radiation (downwelling longwave from atmosphere) | 333 | Greenhouse re-emission |
| Net surface radiation (upward longwave minus back-radiation) | 63 | Net longwave loss from surface |
| Outgoing longwave radiation (top of atmosphere) | 238.5–240.0 | Must equal absorbed solar at equilibrium |

The greenhouse effect is numerically the difference between surface emission (396 W/m²) and OLR (239 W/m²): 157 W/m² of the surface's thermal emission is intercepted by the atmosphere and returned. The effective radiating temperature is:

$$T_\mathrm{eff} \;=\; \left(\frac{239}{5.67 \times 10^{-8}}\right)^{1/4} \;=\; 255\,\mathrm{K}$$

The surface is 288 K, so the greenhouse effect supplies \$288 - 255 = 33\,\mathrm{K}$ of surface warming.

## The spectral structure: greenhouse gases and their absorption bands

The greenhouse effect is spectrally inhomogeneous. Different gases dominate different wavelength regions:

| Gas | Primary absorption bands | Contribution to greenhouse warming | Independence structure |
|---|---|---|---|
| Water vapor (H$_2$O) | 6.3 $\mu$m vibrational; rotational $>$ 20 $\mu$m; continuum | $\sim 50\%$ of total; largest contributor | Depends on surface temperature via Clausius-Clapeyron |
| Carbon dioxide (CO$_2$) | 15 $\mu$m bending mode; 4.3 $\mu$m (weaker) | $\sim 20\%$ direct; $\sim 50\%$ with water vapor feedback | Well-mixed; $s \perp t$ for CO$_2$ steps vs. H$_2$O steps |
| Ozone (O$_3$) | 9.6 $\mu$m; stratosphere | $\sim 5\%$; stratospheric heating | Independent from tropospheric greenhouse bands |
| Methane (CH$_4$) | 7.7 $\mu$m | $\sim 5\%$ | Independent from CO$_2$ and H$_2$O bands |
| Nitrous oxide (N$_2$O) | 7.8 $\mu$m and 8.6 $\mu$m | $\sim 5\%$ | Overlaps with CH$_4$ |
| Atmospheric window | 8–12 $\mu$m | Cooling escape route | TrShadow channel: no absorption history |

The **atmospheric window** (8–12 $\mu$m, partially blocked by O$_3$ at 9.6 $\mu$m) is the TrShadow region: this is where surface emission escapes to space with minimal absorption. Surface-temperature satellites (AVHRR, MODIS) measure the surface through the window; weather forecasters use window-channel imagery to see through clouds. Window-channel photons are $\mathrm{TrShadow}^{\mathcal{F}}_t$: the ERL commitment operator fixes them (they pass through every independent atmospheric layer and always find a surface preimage), but the optical-depth history operator does not (there is no absorption history to saturate in the window).

## The restriction profile: spectral optical depth

The **spectral optical depth profile** $\tau(\nu, z_1 \to z_2)$ is the restriction-profile quantity of the saturation nucleus. The Beer-Lambert law gives the fraction of radiation at frequency $\nu$ transmitted through a path from $z_1$ to $z_2$:

$$\mathcal{T}(\nu, z_1 \to z_2) \;=\; \exp\!\bigl(-\tau(\nu, z_1 \to z_2)\bigr)$$

At each wavelength $\nu$, the atmosphere has an **effective radiating level** $z_\mathrm{ERL}(\nu)$ defined by $\tau(\nu, z_\mathrm{ERL} \to \infty) = 1$: the level where the atmosphere becomes optically thin to space. The brightness temperature at the top of atmosphere:

$$T_b(\nu) \;=\; T\!\bigl(z_\mathrm{ERL}(\nu)\bigr)$$

is the temperature at the effective radiating level for that wavelength. The total OLR integrates the Planck function at the ERL temperature over all frequencies.

When greenhouse gas concentration increases, $z_\mathrm{ERL}(\nu)$ rises (the atmosphere becomes optically thick at lower optical depths — higher altitudes). The temperature at the new, higher ERL is colder (following the lapse rate). So OLR decreases, creating a radiative imbalance — the instantaneous forcing. This is the projection gap $[F, \pi_t(F)]$: the current flux state $F$ (with updated optical depth history but old temperature profile) is not in $\mathcal{F}^*_t$ (the ERL is not yet at the right temperature to balance incoming solar).

## Logarithmic forcing and the saturation nucleus ceiling

The forcing formula derived by Myhre, Highwood, Shine, and Stordal (1998, *Geophysical Research Letters* 25, 2715–2718):

$$\Delta F \;=\; 5.35 \cdot \ln\!\left(\frac{C}{C_0}\right) \;\mathrm{W\,m^{-2}}$$

applies to CO$_2$ in the range $C \in [180, 1000]\,\mathrm{ppm}$. For a doubling ($C = 2C_0$): $\Delta F = 5.35 \ln(2) \approx 3.7\,\mathrm{W\,m^{-2}}$.

The logarithmic form is the saturation nucleus signature. The central CO$_2$ absorption band near 15 $\mu$m is already optically thick at pre-industrial concentrations: $\tau(15\,\mu\mathrm{m}) \gg 1$ through the entire troposphere. Adding more CO$_2$ cannot add more absorption at 15 $\mu$m — the restriction profile at the band center is saturated in the sense of the saturation nucleus: $\sigma_t(F_\mathrm{center}) = F_\mathrm{center}$ at the band center, because the profile-class maximum is already achieved. Only the **spectral wings** of the 15 $\mu$m band (at wavelengths slightly away from the center, where $\tau < 1$) are in $\mathrm{SatShadow}$ — their restriction profile has room to grow. Each doubling of CO$_2$ adds the same finite increment of wing-channel absorption. This produces the logarithm: $\Delta F \propto \ln(C/C_0)$, not linearly proportional, because each marginal CO$_2$ doubling saturates one more increment of the spectral wing, but the band center is already fixed.

This is the saturation nucleus's marginal-content behavior: once the restriction profile of a spectral channel is saturated ($\sigma_t$ fixes it), no further forcing is added by increasing that absorber. Growth continues only in the not-yet-saturated channels. The logarithm counts how many saturation events have occurred across the spectral wing profile.

## Nuclear reading

**Proposition 1 (Planck function = saturation nucleus ceiling; LTE = saturation fixed point).** The local thermodynamic equilibrium (LTE) condition — that matter emits the Planck function $B(\nu, T)$ at its local temperature — is the condition $\sigma_t(F) = F$ for the spectral flux state $F$ at the layer. LTE holds when the layer has thermalized with the radiation field: every possible higher flux state in the restriction-profile class would require a hotter local temperature than the layer actually has. At altitudes below $\sim 70$ km (the homosphere), LTE is satisfied and the saturation nucleus is at its fixed point at every layer. Above $\sim 70$ km (the thermosphere), LTE fails: collisional de-excitation is rarer than radiative de-excitation, the populations of excited molecular states depart from the Boltzmann distribution, and $\sigma_t(F) > F$ — the saturation nucleus has a non-trivial gap: the radiative state is below its restriction-profile maximum because the population cannot equilibrate fast enough. $\square$

**Proposition 2 (ERL = transfer fixed point; atmospheric window = canonical TrShadow).** A spectral flux state at wavelength $\nu$ is in $\mathrm{Fix}(\Delta_t)$ iff the altitude $z$ satisfies $\tau(\nu, z \to \infty) \leq 1$ — i.e., the altitude is at or above the effective radiating level for $\nu$. Below the ERL ($\tau(\nu, z \to \infty) > 1$), the flux state is not transfer-stable: for the independent channel consisting of absorption at $\nu$, adding one more layer of absorber below $z$ changes the restriction to the surface, so the current state at $z$ cannot be found as the image of a state at the adjacent layer. Above the ERL ($\tau(\nu, z \to \infty) < 1$), the flux state is transfer-stable: every independent spectral step from below has a preimage that restricts up to the current state — the atmosphere is optically thin here and surface radiation passes through. The atmospheric window at 8–12 $\mu$m satisfies $\tau < 1$ through the entire troposphere: it is in $\mathrm{Fix}(\Delta_t)$ throughout — transfer-stable from the surface to space. But the window has no optical depth history ($\sigma_t(F) > F$ because there is no accumulated absorption to back-recognize the surface emission as the maximum). Window flux is $\mathrm{TrShadow}^{\mathcal{F}}_t$: ERL-committed, not optically thick. $\square$

**Proposition 3 (Radiative forcing = projection-gap size; CO2 doubling as SatShadow perturbation).** When CO$_2$ concentration doubles, the optical-depth history is updated: $\tau(\nu, z)$ increases throughout the 15 $\mu$m band (and wings). The saturation nucleus $\sigma_t$ is now fixed at the new, higher optical depth: $F_\mathrm{new} \in \mathrm{Fix}(\sigma_t^{\mathrm{new}})$ — the absorption record is fully committed to the doubled CO$_2$. But the temperature profile has not changed: the ERL at 15 $\mu$m has risen by $\sim 160$ m (using a 6.5 K/km lapse rate: a new ERL at 1 K colder temperature radiates $\sim 1.9$ W/m² less). The transfer nucleus is not yet fixed: the new, higher ERL level does not yet have the right temperature to make $F$ transfer-stable in every spectral channel — there is no state in the adjacent (warmer, deeper) layer that restricts back to the new ERL-level flux. The projection gap $[F, \pi_t(F)]$ has size $\lambda_F$ corresponding to $\Delta F \approx 3.7\,\mathrm{W\,m^{-2}}$ of instantaneous forcing — the forcing that must be overcome before the planet reaches a new radiative equilibrium. The warming required to close the gap: $\delta T = \Delta F / \lambda_\mathrm{climate} \approx 3.7 / 0.8 \approx 3\text{--}5\,\mathrm{K}$ for a climate sensitivity parameter $\lambda_\mathrm{climate} \approx 0.8\,\mathrm{W\,m^{-2}\,K^{-1}}$ (including feedbacks). $\square$

**Proposition 4 (Runaway greenhouse = Schwarzschild threshold; Venus as the crossed case).** The [RelationalHistoryFiberSpectralSchwarzschildCriticalEigenvalueHorizonOperator](../math/relational-history-fiber-spectral-schwarzschild-critical-eigenvalue-horizon-operator.md) gives the Schwarzschild threshold $r_s(\delta_t) = 2M_t(\delta)$ — the value of the calibration defect at which no equilibrium projection exists. In the greenhouse context: the runaway greenhouse threshold is the **Simpson-Komabayashi-Ingersoll limit**, approximately 310 W/m² for a water-vapor-dominated atmosphere. Above this limit, increasing surface temperature increases water vapor (positive feedback), which increases absorption, which reduces OLR below the incoming solar flux, making the imbalance larger, not smaller. The calibration defect $M_t(\delta)$ grows without bound: no radiative equilibrium state exists in the fiber. At or above the threshold, $\mathcal{F}^*_t = \emptyset$: the doubly-settled set is empty. Venus has crossed this threshold: incoming solar (absorbed, after clouds reflect most) $\approx 160\,\mathrm{W/m^2}$, but Venus's massive CO$_2$ atmosphere creates an optical depth so large that the ERL is at the top of the cloud deck, far from any equilibrium temperature that would satisfy both the saturation and transfer conditions simultaneously. The surface at 735 K emits 16,600 W/m² at the Stefan-Boltzmann law, all of which is re-absorbed by the 90 bar atmosphere before it can escape. Venus is in $\mathrm{FreeShadow}^{\mathcal{F}}_t$: neither the optical-depth history admits a maximum consistent state (the atmosphere is opaque at all wavelengths) nor is ERL commitment achievable (there is no spectral window through which a stable ERL can be established). $\square$

**Proposition 5 (Stratospheric cooling fingerprint = internal holograph diagnostic; troposphere-stratosphere split).** The internal holograph $(\mathcal{T}, \mathcal{P}, \pi_\mathrm{trop})$ predicts the greenhouse fingerprint: when tropospheric CO$_2$ increases, the tropopause-level OLR decreases (the internal projection gap $\lambda_F^\mathrm{trop}$ grows), so the stratosphere, which is heated by solar UV absorption in ozone and cooled by CO$_2$ emission, finds its CO$_2$ cooling channel enhanced: more CO$_2$ means more emission from the stratosphere (which is in LTE but not optically thick), so the stratosphere cools. Troposphere warms, stratosphere cools — the two sides of the internal holograph boundary move in opposite directions. This is the primary observational fingerprint distinguishing greenhouse forcing from solar forcing: solar increases would warm both troposphere and stratosphere (more energy input); greenhouse increases warm the troposphere and cool the stratosphere (the ERL shifts, not the total input). Balloon radiosonde records and satellite MSU (Microwave Sounding Unit) data since 1979 show this split: tropospheric warming of $+0.13\,\mathrm{K/decade}$ and lower stratospheric cooling of $-0.5\,\mathrm{K/decade}$ (Santer et al. 2013, *Proceedings of the National Academy of Sciences*). $\square$

**Proposition 6 (Non-adjointness; optically thin and optically thick are orthogonal shadow classes).** The optical-depth history operator and the ERL commitment operator are not in Galois connection. The witnesses: the CO$_2$-forced SatShadow state (high optical depth, fully saturated absorption record, but ERL not yet established at the new equilibrium temperature — the instantaneous post-forcing state after CO$_2$ doubling) and the window-channel TrShadow state (ERL-committed from surface to space, but no optical depth history). If $\sigma_t \dashv \Delta_t$, every optically thick atmosphere would automatically produce a committed ERL — radiative forcing would be instantaneously self-resolved, and climate sensitivity would be zero. If $\Delta_t \dashv \sigma_t$, every ERL-committed state would automatically accumulate optical depth — the atmospheric window would not exist. Both witnesses are observed at every moment: the atmosphere contains CO$_2$ (SatShadow in the band), water vapor absorption lines (SatShadow in those bands), and the atmospheric window (TrShadow). Non-adjointness is why climate sensitivity is positive and finite: the optical-depth forcing and the ERL response are genuinely independent operations that must both be resolved to reach equilibrium. $\square$

## Open questions

- Whether the climate sensitivity parameter $\lambda_\mathrm{climate} \approx 0.8\,\mathrm{W\,m^{-2}\,K^{-1}}$ (from GCM ensemble) can be derived as the inverse of the projection-gap closure rate: the rate at which the system moves from the post-forcing SatShadow state toward the equilibrium $\mathcal{F}^*_t$ state via feedback-driven ERL adjustment, and whether the spread in equilibrium climate sensitivity across models (roughly 2.5 K to 4.0 K per doubling in CMIP6) corresponds to variation in the projection-gap closure dynamics.
- Whether the logarithmic forcing formula $\Delta F = 5.35 \ln(C/C_0)$ admits a derivation from the saturation nucleus restriction-profile structure: whether the number of not-yet-saturated spectral wing intervals at CO$_2$ concentration $C$ is proportional to $\ln(C/C_0)$, and whether the constant 5.35 W/m² per unit of the logarithm corresponds to the spectral width of the band-wing restriction-profile space available for each e-fold of CO$_2$ addition.
- Whether water vapor feedback — the amplification of CO$_2$ forcing by the Clausius-Clapeyron-driven increase in water vapor as the surface warms — is a topology change $J \to J'$ in the greenhouse framework: whether water vapor's dependence on surface temperature makes the H$_2$O absorption steps no longer independent of the surface-temperature history, and whether the transition from a dry cold atmosphere (H$_2$O steps independent of CO$_2$ steps) to a moist warm atmosphere (H$_2$O steps correlated with CO$_2$ and temperature history) is precisely the topology change that doubles the effective forcing from \$3.7\,\mathrm{W\,m^{-2}}$ to $\sim 7$–\$8\,\mathrm{W\,m^{-2}}$ per CO$_2$ doubling.
- Whether the **effective radiating level** altitude as a function of surface forcing traces a path in the projection-gap space: whether rising ERL altitude (ERL at 6 km for 280 ppm CO$_2$ moving to 7 km for 560 ppm CO$_2$) is the physical trajectory from SatShadow toward $\mathcal{F}^*_t$ as the temperature profile warms to close the forcing gap, and whether the Schwarzschild threshold in the greenhouse context corresponds to the altitude where the ERL would need to exceed the tropopause to achieve equilibrium — the point at which no tropospheric ERL can close the forcing gap.
- Whether the **atmospheric window** narrowing under increasing water vapor (in a warming climate, the near-continuum absorption by water vapor slightly fills in the 8–12 $\mu$m window, reducing TrShadow flux) is a topology change $J' \to J$ in the transfer direction: whether increased window absorption converts TrShadow states into SatShadow states (adding optical depth to the previously transparent channel), and whether this window narrowing is captured by a decrease in $\mathrm{Fix}(\Delta_t)$ — fewer propositions satisfy the transfer-stability condition — corresponding to the observed reduction in window-channel OLR in a warming climate.
- Whether the diurnal cycle of longwave cooling — surface radiates $\sim 396\,\mathrm{W/m^2}$ continuously but incoming solar is zero at night — represents a fiber at history $t_\mathrm{night}$ where the SatShadow condition is temporarily removed (the solar-forced component of the projection gap closes) and a new, purely greenhouse-dominated equilibrium state emerges in $\mathcal{F}^*_{t_\mathrm{night}}$, and whether the nocturnal surface cooling rate ($\sim 1$–\$3\,\mathrm{K/hour}$ in clear-sky conditions) is the projection-gap closure timescale for the overnight greenhouse fiber.
