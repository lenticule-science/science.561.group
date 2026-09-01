---

description: "An AtmosphericStability triple (A, t, ell) — an atmospheric column state A in the column fiber at history t over locale ell — has shadow class determined by two independent directions of convective regulation: the thermodynamic instability history operator (saturation nucleus) and the convective commitment operator (transfer nucleus). A in A*_t (doubly settled: the thermodynamic instability restriction profile backward-recognizes A as the maximum convective state consistent with the accumulated CAPE and lapse-rate history — the column has CAPE above zero, the parcel temperature trace lies above the environmental sounding between the LFC and EL, and sigma_t backward-recognizes this as the maximum convective state the accumulated heating and moistening history supports — AND the convective commitment operator forward-commits A through every independent vertical displacement step — the updraft has exceeded the LFC, the parcel is positively buoyant, and every independent perturbation in the sub-cloud layer or lower troposphere has a forward preimage in the potential convective state; active thunderstorm or cumulonimbus in progress), A in SatShadow_t (CAPE-loaded but capped: the thermodynamic restriction profile is deeply imprinted with instability — high CAPE, deep moist layer, large dewpoint — but a convective inhibition layer (CIN) prevents the convective commitment step; the atmosphere knows it wants to convect but the cap prevents the independent displacement steps from achieving positive buoyancy; the loaded-gun pre-storm sounding of the Great Plains with 3000 J/kg CAPE and 200 J/kg CIN; the most dangerous and the most common pre-severe weather state), A in TrShadow_t (committed but thermodynamically poor: convective commitment has been forced by external lifting — a cold front, an outflow boundary, orographic forcing — so the convective step is no longer independent of the current history, the updraft is committed through every perturbation in the sub-cloud layer, but the CAPE restriction profile is weak and the thermodynamic history does not backward-recognize deep, intense convection; high-based showers over a cold front, drizzle from forced ascent, shallow convection that cannot build the deep vertical extent that CAPE would support), A in FreeShadow_t (active fair weather: the environmental lapse rate is less than the moist adiabatic lapse rate throughout the column; every displaced parcel is cooler and denser than its environment; neither CAPE nor convective commitment; the anticyclone, the radiation-cooled nocturnal boundary layer, the marine inversion). The dry adiabatic lapse rate Gamma_d = g divided by C_p = 9.8 K/km is the rate at which an unsaturated air parcel cools when lifted dry-adiabatically (first law of thermodynamics: expansion work at constant entropy). The moist adiabatic lapse rate Gamma_m is 4-9.8 K/km depending on temperature (lower in warm moist tropical air where more latent heat is released per unit ascent, approaching Gamma_d in cold dry air). The three stability regimes are: absolutely stable (ELR < Gamma_m, no CAPE for any parcel), conditionally unstable (Gamma_m < ELR < Gamma_d, CAPE exists for saturated parcels that have reached their LCL), absolutely unstable (ELR > Gamma_d, every parcel is immediately buoyant). CAPE (Convective Available Potential Energy, J/kg) = g times integral from LFC to EL of (T_parcel minus T_env) divided by T_env dz is the restriction-profile quantity of the saturation nucleus: it is the accumulated positive buoyancy in the environmental sounding restriction profile. CIN (Convective Inhibition, J/kg) is the covering condition: it measures the negative buoyancy work that must be overcome before the LFC is reached; when CIN is large, the convective step s_conv is NOT independent of the current history (the cap prevents it regardless of how much CAPE is available). The trigger (cold front passage, dry line, sea breeze convergence, orographic lifting) is the Grothendieck topology change J to J' that removes or weakens CIN, making the convective ascent step genuinely independent of the column history. The Schwarzschild threshold is the transition to self-sustaining deep moist convection: once a supercell thunderstorm has established its rotating updraft, the calibration defect M_t(delta) falls below the spectral horizon and the convective mode is self-maintaining against any independent environmental perturbation."
date-created: 2026-03-21
date-modified: 2026-03-21
---

# Atmospheric Stability

## Formal definition

An **AtmosphericStability** triple $(A, t, \ell)$:

$$(A \in \mathcal{A}_t,\; t \in T,\; \ell \in \mathrm{Locale})$$

where:
- $\mathcal{A}_t$ is the **atmospheric column fiber** at history $t$ — the complete Heyting algebra of column state propositions at $t$; elements of $\mathcal{A}_t$ are statements about the vertical temperature profile (the sounding), the dewpoint profile, the wind profile, the potential temperature $\theta$ and equivalent potential temperature $\theta_e$ at each level, and the derived stability indices (CAPE, CIN, LFC height) of the atmospheric column at locale $\ell$ at history $t$
- $t \in T$ is the **analysis history** — the position in the history monoid; each step $s \in \Sigma$ advances the column through one forcing cycle: one episode of surface heating, one advection of warm/cold air, one convective initiation event; the onset of convection at the LFC and the triggering of a deep cumulonimbus are specific step atoms in $\Sigma$
- $\ell$ is the **locale** — the geographical column being analyzed; the locale's surface type, land-sea boundary, orography, and proximity to moisture sources determine the surface fluxes that build the thermodynamic history

**The stability nuclear pair.** The fiber $H_t$ at history $t$ carries the two canonical nuclei. Let $\Sigma$ be the step monoid for the column site $(T, J)$. Each step $s \in \Sigma$ represents one atmospheric perturbation — one vertical displacement event: a gust, a turbulent eddy, an orographic push, a frontal lifting pulse. The commutation condition $s \perp t$ means displacement $s$ is **genuinely independent** of the current column history $t$: a small vertical displacement in a cap-free atmosphere acts regardless of what the prior temperature history was.

**RelationalHistoryFiberSaturatingNucleus** ([math](../math/relational-history-fiber-saturating-nucleus.md)) — the **thermodynamic instability operator**:

$$\sigma_t(A) \;=\; \bigvee\bigl\{B \in \mathcal{A}_t \;\big|\; H(i_{t_0,t})(B) \leq H(i_{t_0,t})(A) \;\text{for all } t_0 < t\bigr\}$$

The restriction profile quantity is **CAPE** — the Convective Available Potential Energy accumulated in the sounding:

$$\mathrm{CAPE} \;=\; g \int_{\mathrm{LFC}}^{\mathrm{EL}} \frac{T_\mathrm{parcel}(z) - T_\mathrm{env}(z)}{T_\mathrm{env}(z)} \, dz \quad [\mathrm{J/kg}]$$

$H(i_{t_0,t})(A)$ is the column's thermodynamic state at prior history $t_0$ — the temperature and dewpoint profile before the current episode of heating or moistening. The restriction profile class of $A$ is the set of all column states with at most $A$'s accumulated lapse rate and moisture history; $\sigma_t(A)$ is the maximum convective state consistent with that record. $A \in \mathrm{Fix}(\sigma_t)$ iff $A$ is already the most convectively active state its CAPE record supports — the column has realized its thermodynamic potential.

**Operational CAPE thresholds** (NWS):

| Category | CAPE (J/kg) | Convective character |
|---|---|---|
| Stable | $0$ | No positive area on sounding |
| Marginally unstable | $0$–$1{,}000$ | Ordinary thunderstorms possible |
| Moderately unstable | $1{,}000$–$2{,}500$ | Strong thunderstorms likely |
| Very unstable | $2{,}500$–$3{,}500$ | Severe thunderstorms; supercell potential |
| Extremely unstable | $> 3{,}500$ | Violent convection; significant tornado risk |

The theoretical maximum updraft speed from CAPE: $w_\mathrm{max} = \sqrt{2 \cdot \mathrm{CAPE}}$ — so CAPE $= 2{,}500\,\mathrm{J/kg}$ gives $w_\mathrm{max} \approx 70\,\mathrm{m/s}$ (actual updrafts are typically $0.3$–$0.5\,w_\mathrm{max}$ due to entrainment and water loading).

**RelationalHistoryFiberTransferringNucleus** ([math](../math/relational-history-fiber-transferring-nucleus.md)) — the **convective commitment operator**:

$$\mathrm{Fix}(\Delta_t) \;=\; \bigcap_{\substack{s \in \Sigma \\ s \perp t}} \mathrm{image}\bigl(H(i_{s,t}) : \mathcal{A}_{s \star t} \to \mathcal{A}_t\bigr)$$

$A \in \mathrm{Fix}(\Delta_t)$ iff for every independent vertical displacement step $s \perp t$, there exists a post-displacement column state $A'$ at $s \star t$ that restricts back to $A$. Physically: the column is **convectively committed** iff every independent small displacement of an air parcel returns to the column state $A$ — i.e., the displaced parcel, whether upward or downward, finds itself colder and denser than its environment (stable) OR the column is already actively convecting and the updraft is self-sustaining against independent environmental perturbations.

The role of **CIN** (Convective Inhibition):

$$\mathrm{CIN} \;=\; g \int_\mathrm{surface}^{\mathrm{LFC}} \frac{T_\mathrm{parcel}(z) - T_\mathrm{env}(z)}{T_\mathrm{env}(z)} \, dz \quad [\mathrm{J/kg}, \leq 0]$$

CIN is the negative area on the sounding between the surface and the LFC — the energy that must be supplied to lift a parcel to the LFC before it becomes freely buoyant. When CIN is large (strongly negative, e.g., $-200\,\mathrm{J/kg}$), the lifting step $s_\mathrm{conv}$ from the surface to the LFC is **not** an independent step: it requires energy input equivalent to $|\mathrm{CIN}|$ before the parcel can self-accelerate. The topology $J$ with large CIN has $s_\mathrm{conv} \not\perp t$ — the convective step is blocked by the cap regardless of how much CAPE sits above it.

**The four shadow classes for atmospheric column states:**

| Shadow class | Condition | Stability name | Physical state |
|---|---|---|---|
| $A \in \mathcal{A}^*_t$ | Both operators fix $A$ | **Active deep convection** | Large CAPE realized; updraft self-sustaining; cumulonimbus in progress |
| $A \in \mathrm{SatShadow}^{\mathcal{A}}_t$ | CAPE fixes $A$; commitment does not | **Loaded-gun capped** | High CAPE, strong CIN; instability ready; trigger absent |
| $A \in \mathrm{TrShadow}^{\mathcal{A}}_t$ | Commitment fixes $A$; CAPE does not | **Forced shallow convection** | Trigger applied (frontal/orographic lift); weak CAPE; shallow, non-severe |
| $A \in \mathrm{FreeShadow}^{\mathcal{A}}_t$ | Neither operator fixes $A$ | **active fair weather** | ELR $<$ MALR; every parcel negatively buoyant; no CAPE; anticyclone |

**The nuclear reflection and holographic projection.**

$$\pi_t \;:=\; \sigma_t \circ \Delta_t \;:\; \mathcal{A}_t \to \mathcal{A}_t$$

is the [RelationalHistoryPropositionFiberSaturatingTransferringCommutingNuclearReflection](../math/relational-history-fiber-saturating-transferring-commuting-nuclear-reflection.md) with $\mathrm{Fix}(\pi_t) = \mathcal{A}^*_t$. The [RelationalHistoryProjectionGap](../math/relational-history-fiber-projection-gap.md) $[A, \pi_t(A)]$ has size $\lambda_A = |[A, \pi_t(A)]| - 1 \geq 0$ — the **convective gap** — zero iff $A$ is already in active deep convection. The defect operator $\delta_t(e_A) = \lambda_A \cdot e_A$ grades column states by their distance from deep-convective equilibrium; the calibration defect $M_t(\delta) = \mathrm{Tr}(\delta_t)$ is the total convective spectral debt of the column fiber.

**The internal holograph: boundary layer and free troposphere.**  $(\mathcal{B}, \mathcal{F}, \pi_\mathrm{conv})$:
- $\mathcal{B}$ = the **boundary layer bulk** — the lowest $1$–$2\,\mathrm{km}$ of the atmosphere where surface fluxes of heat and moisture directly modify the air; the domain where the saturation nucleus restriction profile is being actively written by surface heating and evaporation
- $\mathcal{F}$ = the **free troposphere boundary** — the layer above the boundary layer top (the capping inversion) that the convective updraft must penetrate to reach the LFC; the free troposphere is the boundary because it is where the environmental sounding that $\sigma_t$ reads is established by large-scale advection, independent of local surface forcing
- $\pi_\mathrm{conv} : \mathcal{B} \to \mathcal{F}$ = the convective projection — the operator that sends any boundary layer state to its free-troposphere-equilibrated partner; $\pi_\mathrm{conv}(b) = b$ iff the boundary layer has fully communicated its thermodynamic state to the free troposphere through convective mixing — the column is well-mixed and the capping inversion has been removed

The internal holograph is complete iff $\mathcal{B} = \mathcal{F}$ — when every boundary layer state is already expressed in the free troposphere. This is the state of a well-mixed, uncapped convective boundary layer in the afternoon: the surface has heated the boundary layer thoroughly, convective thermals have mixed the entire sub-LFC layer to a uniform potential temperature, and the cap has been eroded. The internal holograph is maximally incomplete in the nocturnal boundary layer: the surface has cooled, a stable nocturnal inversion has formed, and the boundary layer is completely decoupled from the free troposphere — $\pi_\mathrm{conv}$ has a large internal projection gap $\lambda_b^\mathrm{conv}$.

## What this is

**Atmospheric stability** is the answer to the single most important question in meteorology: will the air rise? Every other weather phenomenon — clouds, precipitation, thunderstorms, tornadoes, tropical cyclones — depends on air rising. Air rises when it is less dense (warmer) than its surroundings. Whether it will be warmer than its surroundings at the level it has been lifted to depends on the temperature structure of the column it is rising through — the environmental lapse rate — compared to the rate at which it cools as it rises — the adiabatic lapse rate. Atmospheric stability is the comparison between these two rates.

The nuclear reading makes precise the two-directional character of convective regulation. The thermodynamic direction is backward-looking: how much instability has the column accumulated through surface heating, moisture flux, and large-scale temperature advection? This is CAPE — the positive area on the sounding between the LFC and EL. The commitment direction is forward-committing: can the column carry its current state through every independent vertical displacement step? This is the stability condition: is every independently perturbed parcel returned to its starting point (stable), or does at least one perturbation produce runaway ascent (unstable, committed)?

## The lapse rates

**Potential temperature** $\theta$ is the temperature a dry air parcel would have if brought adiabatically to the $1000\,\mathrm{hPa}$ reference pressure:

$$\theta \;=\; T \cdot \left(\frac{P_0}{P}\right)^{R_d / C_p}$$

where $R_d / C_p \approx 0.286$. The potential temperature is **conserved** in dry adiabatic motion: when a parcel rises and cools at the DALR $\Gamma_d = g/C_p = 9.8\,\mathrm{K/km}$, its $\theta$ does not change. This is the invariant of the saturation nucleus: the restriction map $H(i_{t_0,t})(A)$ preserves $\theta$ for dry adiabatic columns.

A column with $d\theta/dz > 0$ (potential temperature increasing upward) is **stable**: a lifted parcel cools into a denser environment and returns. A column with $d\theta/dz = 0$ is **neutral**: a lifted parcel stays at its new level. A column with $d\theta/dz < 0$ is **absolutely unstable**: a lifted parcel is warmer than the environment at every level and accelerates away.

**Equivalent potential temperature** $\theta_e$ (Bolton 1980, *Monthly Weather Review* 108, 1046–1053) is conserved in both dry and saturated adiabatic processes:

$$\theta_e \;\approx\; \theta \cdot \exp\!\left(\frac{L_v \cdot r_s}{C_p \cdot T_\mathrm{LCL}}\right)$$

where $L_v$ is the latent heat of vaporization, $r_s$ is the saturation mixing ratio at the LCL, and $T_\mathrm{LCL}$ is the LCL temperature. A column with $d\theta_e/dz < 0$ is **convectively unstable** (also called **potentially unstable**): if the layer is lifted as a whole until it saturates, the layer becomes unstable and convection breaks out. This is the saturation nucleus condition for moist air.

**The three environmental stability regimes:**

| Regime | Condition | $d\theta/dz$ | Physical character |
|---|---|---|---|
| Absolutely stable | $\mathrm{ELR} < \Gamma_m$ | $> 0$ (strongly) | All parcels negatively buoyant at all levels |
| Conditionally unstable | $\Gamma_m < \mathrm{ELR} < \Gamma_d$ | Near $0$ or weakly positive | Dry parcels stable; saturated parcels may be unstable |
| Absolutely unstable | $\mathrm{ELR} > \Gamma_d$ | $< 0$ | All parcels positively buoyant immediately |

## CAPE, CIN, and the parcel method

**The parcel method** is the algorithm for computing $\sigma_t(A)$ from the environmental sounding. Given an atmospheric column state $A$ at history $t$:

1. Select a representative surface parcel (temperature $T_s$, dewpoint $T_d$, pressure $P_s$)
2. Lift the parcel dry-adiabatically at $\Gamma_d = 9.8\,\mathrm{K/km}$ until it reaches the **LCL** (Lifted Condensation Level, the cloud base) where $T_\mathrm{parcel} = T_d$
3. Above the LCL, lift the parcel moist-adiabatically at $\Gamma_m \approx 5.5$–$6.5\,\mathrm{K/km}$
4. Where $T_\mathrm{parcel} > T_\mathrm{env}$: the parcel is positively buoyant; this is the CAPE region above the **LFC** (Level of Free Convection)
5. Where $T_\mathrm{parcel} < T_\mathrm{env}$ below the LFC: this is the CIN region; the parcel must be forced through this layer by external lifting

The LFC is the boundary between the CIN barrier and the CAPE region — it is the topology boundary between the capped regime (convective step not independent) and the uncapped regime (convective step independent). Above the LFC, every vertical displacement step $s \perp t$ has a forward preimage: the buoyant parcel self-accelerates and returns (in the sense of continued ascent) regardless of perturbations.

**The EL** (Equilibrium Level) is where $T_\mathrm{parcel} = T_\mathrm{env}$ at the top of the CAPE region — the cloud top. Above the EL, the parcel is negatively buoyant again; overshooting tops momentarily penetrate above the EL as the inertia of the updraft carries it upward, but the parcel decelerates.

## The cap as topology condition

The **capping inversion** — the layer of warm, dry air at $2$–$5\,\mathrm{km}$ altitude that inhibits convection in the Great Plains — is the most consequential topology condition in North American severe weather. The cap is typically supplied by subsidence of warm dry air from the elevated terrain of the Rocky Mountains and the Mexican Plateau, creating a warm layer over the moist Gulf air in the boundary layer. The warm layer makes the displacement step $s_\mathrm{cap}$ non-independent: a parcel from the boundary layer cannot reach the LFC under its own buoyancy because it must first pass through the cap where $T_\mathrm{parcel} < T_\mathrm{env}$.

Under the capped topology $J_\mathrm{cap}$: $s_\mathrm{conv} \not\perp t$ — the convective step requires external energy to overcome CIN; $\mathrm{Fix}(\Delta^{J_\mathrm{cap}}_t)$ does not include any deep-convective column state. Under the triggered topology $J'$ (cap broken by daytime heating, cold front passage, or dry-line): $s_\mathrm{conv} \perp t$ — the boundary layer parcel now self-accelerates through the LFC; $\mathrm{Fix}(\Delta^{J'}_t)$ expands to include deep-convective states; the capped column moves from $\mathrm{SatShadow}^{J_\mathrm{cap}}_t$ to $\mathcal{A}^{*J'}_t$ once the cap is removed.

This is why cap strength is the central forecast parameter for severe weather in the Great Plains. A strong cap ($|\mathrm{CIN}| > 200\,\mathrm{J/kg}$) prevents convection entirely; a moderate cap ($50$–$100\,\mathrm{J/kg}$) holds until daytime heating or a synoptic trigger removes it, producing focused, discrete supercell storms; a weak or absent cap ($|\mathrm{CIN}| < 25\,\mathrm{J/kg}$) allows widespread, disorganized convection that dissipates the CAPE in many small cells rather than one large severe system.

## Sounding diagrams as restriction-profile displays

The **skew-T log-P diagram** (N.H. Herlofson 1947; adopted by the U.S. National Weather Service in the 1950s) is the standard display of the atmospheric sounding — the restriction profile of the saturation nucleus. The diagram plots temperature ($x$-axis, skewed $45°$) against pressure ($y$-axis, logarithmic) with three families of reference lines:
- **Isotherms** (solid lines, skewed): lines of constant temperature
- **Dry adiabats** ($\theta = \mathrm{const}$): lines along which an unsaturated parcel rises adiabatically at $\Gamma_d = 9.8\,\mathrm{K/km}$
- **Moist adiabats** ($\theta_e = \mathrm{const}$): lines along which a saturated parcel rises at $\Gamma_m$

The parcel method is performed graphically on the skew-T: trace the parcel from the surface along a dry adiabat to the LCL, then along a moist adiabat to the LFC and EL. The **CAPE area** is the region between the moist adiabat and the environmental temperature sounding where the parcel is warmer; the **CIN area** is the region below the LFC where the parcel is cooler. The area enclosed on the diagram is proportional to the energy (J/kg) because the diagram is constructed to preserve the area-equals-work property.

The skew-T is the graphical representation of $H(i_{t_0,t})(A)$ at every pressure level $t_0$: reading down the sounding IS reading the restriction map.

## Nuclear reading

**Proposition 1 (DALR is the saturation nucleus invariant; potential temperature is the conserved restriction-profile quantity).** The dry adiabatic lapse rate $\Gamma_d = g/C_p = 9.8\,\mathrm{K/km}$ is the rate at which the saturation nucleus's restriction invariant (potential temperature $\theta$) remains constant. A dry air parcel follows $\theta = \mathrm{const}$ under restriction: $H(i_{t_0,t})(A)$ maps the current column state back to the same $\theta$ profile along the dry adiabats. The saturation nucleus $\sigma_t(A)$ backward-recognizes the maximum column state consistent with the $\theta$ profile: $A \in \mathrm{Fix}(\sigma_t)$ iff the column's temperature profile IS the dry (or moist) adiabatic profile that the potential temperature history supports. An absolutely unstable column (ELR $> \Gamma_d$, $d\theta/dz < 0$) has $\sigma_t(A) > A$: the restriction profile supports a more convective state than currently exists — convection will immediately break out. $\square$

**Proposition 2 (CIN = topology condition; trigger = Grothendieck topology change; cap removal = independence restoration).** The cap (CIN) is the condition that the convective ascent step $s_\mathrm{conv}$ is NOT independent of the current history: the parcel must be pushed through the warm layer by external mechanical forcing, so $s_\mathrm{conv}$ is not freely available. $\mathrm{Fix}(\Delta^{J_\mathrm{cap}}_t)$ excludes all deep-convective column states. The trigger (cold front passage, dry-line collision, daytime heating eroding the cap) is the topology change $J_\mathrm{cap} \to J'$ that removes the warm layer: under $J'$, $s_\mathrm{conv} \perp t$; the independent step set $\{s \perp^{J'} t\}$ now includes the convective ascent step; $\mathrm{Fix}(\Delta^{J'}_t)$ expands to include deep-convective states; the column moves from $\mathrm{SatShadow}^{J_\mathrm{cap}}_t$ to $\mathcal{A}^{*J'}_t$. This is why forecasters watch cap strength as the central parameter: the topology change is the event, and its timing determines whether convection is discrete and severe (cap breaks once, focused) or widespread and weak (cap absent all day, CAPE dissipated). $\square$

**Proposition 3 (The parcel method computes σ_t; the CAPE integral is the restriction-profile deficit).** The parcel method is the algorithm for evaluating the saturation nucleus restriction profile: lift the parcel along the dry adiabat (tracing the $\theta = \mathrm{const}$ invariant), switch to the moist adiabat at the LCL (tracing the $\theta_e = \mathrm{const}$ invariant above saturation), and compare to the environmental sounding at each level. The CAPE integral $g \int_\mathrm{LFC}^\mathrm{EL} (T_\mathrm{parcel} - T_\mathrm{env})/T_\mathrm{env} \, dz$ is the projection-gap size $\lambda_A$ expressed in energy units: the height of the positive area on the sounding is the distance between the current column state and the potential-convection fixed fiber $\mathcal{A}^*_t$. CAPE $= 0$ iff $\lambda_A = 0$ iff $A \in \mathcal{A}^*_t$ in the saturation direction. $\square$

**Proposition 4 (Loaded-gun sounding = SatShadow; the Great Plains pre-storm environment as canonical SatShadow).** The classic Great Plains pre-severe-storm sounding — high CAPE ($2{,}000$–$4{,}000\,\mathrm{J/kg}$), strong cap ($|\mathrm{CIN}| = 100$–$300\,\mathrm{J/kg}$), sharp dewpoint in the boundary layer, warm dry air aloft — is $\mathrm{SatShadow}^{\mathcal{A}}_t$: the thermodynamic restriction profile is deeply imprinted with instability ($\sigma_t(A) = A$: the column is already the maximum CAPE state consistent with the accumulated surface heating and Gulf moisture advection history), but the cap prevents convective commitment ($\Delta_t(A) > A$: the convective step $s_\mathrm{conv}$ is blocked by CIN). The afternoon forecast question — "will the cap break, and when?" — is the question of when the topology change $J_\mathrm{cap} \to J'$ occurs. If the cap breaks cleanly in the late afternoon after CAPE has maximized, the column moves directly from maximum SatShadow to maximum $\mathcal{A}^{*J'}_t$: the ideal supercell environment. $\square$

**Proposition 5 (Fibonacci growth; Verlinde eigenvalues count convective stages).** By [RelationalHistoryFiberNuclearPairNonAdjointness](../math/relational-history-fiber-nuclear-pair-non-adjointness.md): $\mathrm{SatShadow}^{\mathcal{A}}_t$ (CAPE-loaded capped columns — thermodynamic history committed, convective commitment absent) and $\mathrm{TrShadow}^{\mathcal{A}}_t$ (forced shallow convection — commitment achieved via external forcing, CAPE restriction profile weak) are both non-empty. Both are observed routinely: the capped Great Plains sounding is SatShadow; the light showers from a warm-sector cold front over a cool moist surface are TrShadow. Non-emptiness of both implies the nuclear axes are independent. The Verlinde transfer matrix $M = \begin{pmatrix}1&1\\1&0\end{pmatrix}$ counts the number of distinct $k$-step convective initiation paths from FreeShadow fair weather to $\mathcal{A}^*_t$: at depth $n$ there are $F_n$ distinct initiation sequences (combinations of CAPE-building steps and CIN-removal steps), growing at the golden ratio asymptotically. $\square$

**Proposition 6 (Non-adjointness; loaded-gun and forced-shallow are genuinely orthogonal).** The thermodynamic instability and convective commitment operators are not in Galois connection. The witnesses: the loaded-gun sounding (SatShadow: enormous CAPE, no commitment, cap intact) and forced-shallow convection (TrShadow: frontal lifting forces commitment, minimal CAPE). If $\sigma_t \dashv \Delta_t$, every CAPE-loaded column would automatically produce committed convection — the cap would be irrelevant. If $\Delta_t \dashv \sigma_t$, every convectively committed column would automatically have large CAPE — forced shallow convection in a stable environment would be impossible. Both are observed daily. The non-adjointness is why cap forecasting and CAPE forecasting are independent tasks: a forecaster must assess both the thermodynamic potential AND the convective trigger separately to determine whether deep convection will occur. $\square$

## Open questions

- Whether the transition from ordinary convective cells to supercells (rotating updrafts with long lifetimes) satisfies the eigenproposition condition $G_s(A) \approx \chi_s(A) \cdot A$ — whether supercell storm modes are genuine eigenmodes of the atmospheric propagator with eigenvalue $\chi_s(A) \approx 1$ (self-sustaining against environmental perturbations) while ordinary cells have $\chi_s(A) < 1$ (decay on timescales shorter than their formation time), and whether this eigenvalue distinction predicts the observed bimodal distribution of convective cell lifetimes.
- Whether the Schwarzschild threshold for deep convection — the calibration defect $M_t(\delta)$ at which a supercell becomes self-sustaining and cannot be disrupted by any independent environmental perturbation — has a quantitative expression in terms of CAPE, CIN, and wind shear, and whether the SPC Supercell Composite Parameter (which normalizes CAPE by $1{,}000\,\mathrm{J/kg}$, effective shear by $20\,\mathrm{m/s}$, and CIN by $-40\,\mathrm{J/kg}$) is an empirical approximation to $r_s(\delta_t) = 2M_t(\delta)$.
- Whether the diurnal cycle of convective initiation over land — peak around 4–6 PM local time as surface heating erodes the morning cap — is the temporal signature of the saturation-gap closure timescale: the time for surface heating to build enough $\theta$ excess in the boundary layer to overcome CIN, and whether the variance of initiation time across different cap strengths and moisture regimes follows the Fibonacci-growth prediction for projection-gap closure.
- Whether potential instability ($d\theta_e/dz < 0$) is the saturation nucleus condition for the moist column — whether a layer with $d\theta_e/dz < 0$ satisfies $\sigma_t(A) > A$ at the column level (the layer-lift restriction profile recognizes a more unstable state), and whether the distinction between convective instability (triggered by layer lifting) and conditional instability (triggered by parcel lifting) corresponds to the distinction between $\sigma_t$-failure and $\Delta_t$-failure at the layer vs. parcel level.
- Whether the nocturnal low-level jet (NLLJ) — the supergeostrophic wind maximum that develops in the Great Plains boundary layer after sunset as the surface-friction influence decays — changes the topology $J$ by making nocturnal convective initiation steps independent: the NLLJ carries moist boundary-layer air northward into Kansas and Nebraska overnight, delivering it to convergence lines that become independent initiation triggers after midnight, and whether the NLLJ is precisely a topology change $J_\mathrm{day} \to J_\mathrm{night}$ that moves the nocturnal column from $\mathrm{SatShadow}$ to $\mathcal{A}^*_t$ via a different trigger mechanism than the daytime cap-break scenario.
