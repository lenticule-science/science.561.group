---
name: fire-regime

description: "A Fire Regime is a triple (V, t, ell) — a vegetation state V in the fire-structured vegetation fiber at history t over locale ell — where V's shadow class classifies the fire-ecological status of the landscape: V in V*_t (fire-adapted climax: the fire-disturbance operator backward-recognizes V as consistent with the historical fire regime AND the succession-trajectory operator forward-commits V to persisting through the next fire cycle — doubly settled, periodically burned vegetation in durable equilibrium with its fire topology), V in SatShadow_t (post-fire pioneer: fire history backward-recognizes the post-fire state but the succession trajectory has not yet committed to it persisting forward — early recolonization after disturbance, temporally recognized but not succession-stable), V in TrShadow_t (fire debt: the succession-trajectory operator forward-commits V as mature or late-successional vegetation but the fire-disturbance operator does not backward-recognize it as fire-regime-active — fuel has accumulated beyond the fire-regime's normal range; the vegetation looks structurally mature but is not doubly settled, and the gap between operators is the fire debt that will discharge when ignition arrives), V in FreeShadow_t (catastrophically disrupted: neither fire history nor succession commits to V — the landscape has been burned at severity beyond the adaptive range of the incumbent vegetation and is in early recolonization before any operator fixes it). A fire event is an Act (A, alpha_combust, t, phi_burn) whose step advances the history; wildfire produces phi_burn in FreeShadow_t (behavior and severity determined by uncontrolled fuel-weather-topography interaction); prescribed fire is a constitutive Act whose burn prescription r_prescribe in H*_t doubly settles the burn severity directly, producing phi_burn in V*_t without requiring nuclear accumulation. Serotiny — seed retention behind fire-released resin seals in lodgepole pine, jack pine, and Banksia — is the nuclear structure of a TrShadow regeneration niche: forward-committed by the species' post-fire succession dynamics but not backward-recognized until the fire Act provides the thermal trigger. Fire suppression (Minnich 1983, Science 219, 1287-1294; Keeley et al. 2009) is a Grothendieck topology change J to J' that removes fire-Act steps from covering families: V*_t elements under J migrate to TrShadow^{J'} — succession-stable but fire-disturbance-unrecognized — accumulating fuel load as the structural fire debt."
defines: FireRegime
related: Weather, Phenology, Act, Quality, Gap, History, Precedent, Locale, Environment, Fitness
date-created: 2026-03-21
date-modified: 2026-03-21
---

## Formal definition

A **Fire Regime** is a triple $(V, t, \ell)$:

$$(V \in \mathcal{V}_t,\; t \in T,\; \ell \in \mathrm{Locale})$$

where:
- $\mathcal{V}_t$ is the **vegetation fiber** at history $t$ — the complete Heyting algebra of vegetation state propositions at $t$; elements of $\mathcal{V}_t$ are statements about the species composition, structural stage, fuel load, biomass, and post-fire age of the plant community over locale $\ell$; the fiber inherits its Heyting algebra structure from $H_t$
- $t \in T$ is the **analysis history** — the position in the history monoid at which the vegetation state is evaluated; each step $s \in \Sigma$ corresponds to a unit of vegetation time (one fire season, one year, one successional stage advancement); fire events are specific step atoms $s_{\mathrm{fire}} \in \Sigma$, distinct from ordinary growth steps
- $\ell$ is the **locale** — the spatial domain over which the fire regime operates; the locale determines the fire weather inputs (temperature, humidity, wind) and the topographic conditions (slope, aspect) that shape fire behavior

**The fire-ecological nuclear pair.** The fiber $\mathcal{V}_t$ carries two canonical nuclei, each encoding a distinct ecological force:

- The **fire-disturbance operator** $\sigma^{\mathcal{V}}_t : \mathcal{V}_t \to \mathcal{V}_t$ — the [RelationalHistoryFiberSaturatingNucleus](../math/relational-history-fiber-saturating-nucleus.md) restricted to the vegetation fiber. $\sigma^{\mathcal{V}}_t(V)$ is the smallest vegetation state backward-recognized by the accumulated fire-disturbance history up to $t$: it is determined by the restriction-profile structure of fire events in prior histories — when fires last burned, at what severity, how many times. $\sigma^{\mathcal{V}}_t(V) = V$ iff $V$ is consistent with the fire regime's historical record — iff the vegetation's age, structure, and composition are what the fire history would produce.

- The **succession-trajectory operator** $\Delta^{\mathcal{V}}_t : \mathcal{V}_t \to \mathcal{V}_t$ — the [RelationalHistoryFiberTransferringNucleus](../math/relational-history-fiber-transferring-nucleus.md) restricted to the vegetation fiber. $\Delta^{\mathcal{V}}_t(V)$ is the smallest vegetation state forward-committed by the successional trajectory above $t$: it is determined by which vegetation states the inter-fire growth dynamics will carry forward through every independent one-step extension. $\Delta^{\mathcal{V}}_t(V) = V$ iff every independent next step — every possible weather sequence or disturbance event above $t$ — carries $V$ forward; iff succession commits to $V$ persisting through the next fire cycle.

**The four shadow classes for fire-ecology.** The shadow class of $V \in \mathcal{V}_t$ classifies the fire-ecological status of the landscape:

| Shadow class | Condition | Ecological name | Structural status |
|---|---|---|---|
| $V \in \mathcal{V}^*_t$ | Both operators fix $V$ | **Fire-adapted climax** | Vegetation is in durable fire-topology equilibrium |
| $V \in \mathrm{SatShadow}^{\mathcal{V}}_t$ | Disturbance fixes $V$; succession does not | **Post-fire pioneer** | Fire history recognizes it; succession trajectory not yet committed |
| $V \in \mathrm{TrShadow}^{\mathcal{V}}_t$ | Succession fixes $V$; disturbance does not | **Fire debt** | Succession commits to mature vegetation; fire regime does not recognize it as stable |
| $V \in \mathrm{FreeShadow}^{\mathcal{V}}_t$ | Neither operator fixes $V$ | **Catastrophically disrupted** | Post-catastrophic-fire landscape; neither operator has stabilized it |

**The nuclear reflection and holographic projection.** The composite map

$$\pi_t \;:=\; \sigma_t \circ \Delta_t \;:\; H_t \to H_t$$

is the [RelationalHistoryPropositionFiberSaturatingTransferringCommutingNuclearReflection](../math/relational-history-fiber-saturating-transferring-commuting-nuclear-reflection.md) — a nucleus with $\mathrm{Fix}(\pi_t) = \mathcal{V}^*_t$. The triple $(\mathcal{V}_t, \mathcal{V}^*_t, \pi_t)$ is the **canonical holograph** of the vegetation fiber ([RelationalUniverseCanonicalHolograph](../math/relational-universe-canonical-holograph.md)): $\mathcal{V}^*_t$ is the **boundary** $\mathsf{Phase}$, $\mathcal{V}_t$ is the **bulk**, and $\pi_t = \mathsf{Stab}$ sends every vegetation state to its nearest fire-adapted climax. The [RelationalHistoryProjectionGap](../math/relational-history-fiber-projection-gap.md) of $V$ is the interval $[V, \pi_t(V)] \subseteq \mathcal{V}_t$; its size

$$\lambda_V \;:=\; \bigl|[V,\, \pi_t(V)]\bigr| - 1 \;\geq\; 0$$

is the [RelationalHistoryProjectionGapSize](../math/relational-history-fiber-projection-gap-size.md) — the structural fire debt of $V$ in lattice-theoretic terms; zero iff $V \in \mathcal{V}^*_t$. The [RelationalHistoryFiberSettlementDefectOperator](../math/relational-history-fiber-settlement-defect-operator-explicit-formula-projection-gap.md) $\delta_t : K^{\mathcal{V}_t} \to K^{\mathcal{V}_t}$ is the diagonal operator $\delta_t(e_V) = \lambda_V \cdot e_V$; its zero eigenspace is $K^{\mathcal{V}^*_t}$ — the fire-adapted climax sector. The calibration defect $M_t(\delta) = \mathrm{Tr}(\delta_t) = \sum_{V \notin \mathcal{V}^*_t} \lambda_V$ is the total spectral fire debt of the landscape fiber at $t$.

**The fire-regime equilibrium condition.** $(V, t, \ell)$ is **fire-adapted climax** iff $V \in \mathcal{V}^*_t$ — equivalently, any of:
1. $V$ is in the boundary $\mathsf{Phase}$: $\pi_t(V) = V$
2. The [RelationalHistoryProjectionGap](../math/relational-history-fiber-projection-gap.md) is trivial: $[V, \pi_t(V)] = \{V\}$, i.e., $\lambda_V = 0$
3. $V$ is a zero-eigenmode of the defect operator: $\delta_t(e_V) = 0$
4. $V \in \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$: both fire-disturbance and succession-trajectory operators fix $V$ simultaneously

## What this is

**Fire Regime** is the characteristic pattern of fire occurrence, behavior, and effect that shapes an ecosystem over time — the signature of fire as an ecological force at a particular place. Morgan, Hardy, Swetnam, Rollins, and Long (2001, *International Journal of Wildland Fire* 10, 329–342) define a fire regime by five axes: fire return interval, fire severity, fire type (surface, crown, ground), fire seasonality, and fire spatial pattern. These axes jointly characterize how fire shapes and is shaped by the vegetation it burns.

Bond and Keeley (2005, *Trends in Ecology and Evolution* 20, 387–394) reframed fire as a global "herbivore" — a consumer of plant biomass analogous to a grazing animal. Like a grazing animal, fire: consumes aboveground biomass at characteristic rates, favors certain plant chemistries over others (resins burn hot; silica-rich grasses resist fire; nitrogen-poor leaf litter smolders), exerts strong evolutionary selection on plant traits, and is excluded from certain habitats by physical or chemical barriers. The analogy extends: just as grasslands are maintained by grazing against the potential encroachment of woody vegetation, savannas and grasslands are maintained by fire — without fire, woody encroachment converts open vegetation to closed forest (Bond, Woodward, Midgley 2005, *New Phytologist* 165, 525–537).

The nuclear reading makes precise the distinction between fire-adapted climax and fire debt. A fire-adapted climax $V \in \mathcal{V}^*_t$ is a vegetation state that has BOTH been shaped by the fire regime (backward recognition) AND will persist through the next fire cycle (forward commitment). Fire debt $V \in \mathrm{TrShadow}^{\mathcal{V}}_t$ is the paradoxical condition of fire suppression: the vegetation looks mature and stable (succession commits to it) but the fire regime does not recognize it as stable (fuel load has exceeded the regime's normal range). It is forward-committed but not backward-recognized — structurally a TrShadow element, accumulating gap until the fire event resolves it.

## Fire behavior: Rothermel, Byram, and the fire triangle

**The fire triangle** identifies three necessary conditions for combustion: fuel, oxygen, and ignition. In the vegetation fiber: fuel load $w \in \mathcal{V}_t$ (fuel mass per unit area, kg/m²), atmospheric oxygen $O \in H_t$ (available from the ambient atmosphere — not limiting except in submarine or highly aerobic conditions), and ignition $I \in H_t$ (lightning, human spark, or embers from adjacent fire). Fire occurs at history $t$ iff the meet $w \wedge O \wedge I$ in $H_t$ exceeds the combustion threshold — iff the fiber element representing "sufficient fuel, oxygen, and ignition co-occur" is in $H^*_t$.

**Rothermel (1972)** (*Research Paper INT-115*, US Forest Service, Intermountain Forest and Range Experiment Station) provided the first mathematical model predicting fire spread rate in wildland fuels. The steady-state rate of spread $R$ (m/s) is:

$$R = \frac{I_R \cdot \xi \cdot (1 + \phi_w + \phi_s)}{\rho_b \cdot \epsilon \cdot Q_{ig}}$$

where $I_R$ is the reaction intensity (rate of heat release per unit area of fire front, kW/m²), $\xi$ is the propagating flux ratio (fraction of heat transferred to unburned fuel ahead of the fire), $\phi_w$ and $\phi_s$ are wind and slope coefficients (dimensionless amplifiers of spread rate), $\rho_b$ is bulk density of the fuel bed (kg/m³), $\epsilon$ is the effective heating number (dimensionless), and $Q_{ig}$ is the heat of preignition (kJ/kg). The Rothermel model is the NWP forward operator for fire behavior: given current fuel, weather, and topography, it predicts the spread rate and intensity of the fire Act.

**Byram (1959)** (*Forest Fire: Control and Use*, Davis ed.) defined **fireline intensity** — the rate of heat release per unit length of the fire front:

$$I_b = H \times w \times R$$

where $I_b$ is fireline intensity (kW/m), $H$ is the net heat of combustion of the fuel (kJ/kg), $w$ is the mass of fuel consumed in the flaming zone (kg/m²), and $R$ is the rate of spread (m/s). Byram's intensity is the quality map from the fire-Act output to the intensity-value presheaf: $I_b$ measures the fire's ecological effect — below approximately 500 kW/m, fire is a surface fire manageable by hand crews; above 4000 kW/m, fire transitions to crown fire behavior and is uncontrollable by direct attack. Byram's intensity threshold is a threshold in the quality space of the fire-Act output fiber.

**The Canadian Forest Fire Weather Index (FWI) system** (Van Wagner 1987, *Forestry Technical Report 35*, Canadian Forest Service) is the data assimilation system for fire weather — the operational implementation of the fire-disturbance operator's input from the weather presheaf. Six components track different aspects of fuel moisture and fire behavior:

| Component | What it tracks | Temporal lag |
|---|---|---|
| Fine Fuel Moisture Code (FFMC) | Moisture of litter and fine fuels | 0-hour lag |
| Duff Moisture Code (DMC) | Moisture of loosely compacted organics | 10–100 hour lag |
| Drought Code (DC) | Moisture of deep compact organics | 1000+ hour lag |
| Initial Spread Index (ISI) | Rate of fire spread potential | Derived from FFMC + wind |
| Buildup Index (BUI) | Available fuel for combustion | Derived from DMC + DC |
| Fire Weather Index (FWI) | Frontal fire intensity potential | Derived from ISI + BUI |

The FWI is the atmospheric fiber element that bridges the weather presheaf $\mathcal{W}_t$ and the vegetation-fire fiber $\mathcal{V}_t$: it is a restriction map $H(\mathcal{W}_t \to \mathcal{V}_t)$ that carries weather observations forward into the fire-behavior calculation.

## Fire return interval and the fire topology

**The fire topology** $J_{\mathrm{fire}}$ on the history site $(T, J_{\mathrm{fire}})$ is the Grothendieck topology whose covering families are the sets of fire-event histories that witness the fire regime at locale $\ell$. A covering family $\{t_n, t_{n-1}, \ldots, t_1\} \in J_{\mathrm{fire}}(t)$ is a record of fire events sufficient to characterize the fire regime's statistical structure — its return interval distribution, severity distribution, and seasonality. The fire regime is doubly settled iff the fire-topology covering families are in $\mathcal{V}^*_t$.

**Fire return interval (FRI)** is the mean depth between consecutive fire-Act histories in the history monoid:

$$\mathrm{FRI}(\ell) = \mathbb{E}[\mathrm{depth}(t_n) - \mathrm{depth}(t_{n-1})]$$

where $t_n$ and $t_{n-1}$ are consecutive fire-Act histories for locale $\ell$. Under the Poisson fire model (Van Wagner 1978, *Mitteilungen der Forstlichen Bundesversuchsanstalt Wien* 114, 119–136): fire events arrive as a Poisson process, the time between consecutive fires is exponentially distributed with rate $\lambda = 1/\mathrm{FRI}$, and the fraction of the landscape in post-fire age class $k$ decays as $\exp(-k/\mathrm{FRI})$.

**Characteristic fire return intervals** vary by four orders of magnitude across ecosystem types:

| Ecosystem | FRI (years) | Fire type | Regime class |
|---|---|---|---|
| Longleaf pine savanna (SE USA) | 1–3 | Surface | High-frequency, low-severity |
| Ponderosa pine forest (SW USA) | 5–15 | Surface | Frequent, low-to-moderate severity |
| Sierra Nevada mixed conifer | 11–16 (pre-suppression) | Mixed | Variable |
| Boreal forest (Alaska/Canada) | 50–200 | Crown | Infrequent, stand-replacing |
| Tropical rainforest | 500–1000+ | — | Fire-sensitive; no adaptive regime |

The FRI is the depth-scale parameter of the fire topology: ecosystems with short FRIs have fire-topology covering families that span short depth intervals; ecosystems with long FRIs have widely spaced covering families. The vegetation fixed fiber $\mathcal{V}^*_t$ at each ecosystem reflects its characteristic FRI: longleaf pine savanna $\mathcal{V}^*_t$ is grassy, open-canopied, and low-fueled because it is shaped by fire every 1–3 years; boreal forest $\mathcal{V}^*_t$ is dense, deep-fueled, and serotinous because it is shaped by infrequent stand-replacing crown fire.

## Fire-adapted ecosystems and serotiny

**Fire-adapted ecosystems** are locales whose vegetation fixed fiber $\mathcal{V}^*_t$ is shaped by and maintained by the fire regime. Pausas and Keeley (2009, *BioScience* 59, 593–601) estimated that fire-dependent ecosystems constitute approximately 53% of the Earth's ecoregions. These include: savannas and grasslands (fire-maintained against woody encroachment), Mediterranean shrublands (chaparral, fynbos, kwongan), temperate coniferous forests (longleaf pine, ponderosa pine, lodgepole pine), and boreal forests. In each, the vegetation fixed fiber $\mathcal{V}^*_t$ is a state that cannot exist without the fire topology: remove fire from a longleaf pine savanna and succession replaces it with closed scrub oak within decades.

**Pyrogeography** (Pausas and Keeley 2009; Archibald, Lehmann, Gómez-Dans, Bradstock 2013, *Global Ecology and Biogeography* 22, 76–88) is the quality map from locale to fire regime — the natural transformation $Q_{\mathrm{fire}} : \ell \mapsto J_{\mathrm{fire}}(\ell)$ assigning to each locale its characteristic fire topology. Pyrogeography is a quality in the technical sense: the fire regime of a locale is path-independent — it is determined by the locale's climate, vegetation, and ignition history, not by which historical path of events produced the current state. Locales with similar climate and vegetation have similar fire topologies regardless of their geographic locations: California chaparral, South African fynbos, and Chilean matorral all share a Mediterranean-type fire regime despite occupying different continents.

**Serotiny** — the retention of seeds in woody structures (cones, follicles) sealed by resin that melts at fire temperatures — is the nuclear structure of fire-obligate regeneration. A serotinous species' regeneration niche is an element $V_{\mathrm{seed}} \in \mathrm{TrShadow}^{\mathcal{V}}_t$: forward-committed by the species' post-fire succession dynamics (the succession trajectory commits to post-fire seedling establishment), but not yet backward-recognized by the fire-disturbance operator (no fire event has yet provided the 50–60°C thermal trigger to open the cones). The fire Act $(A_{\mathrm{fire}}, \alpha_{\mathrm{combust}}, t, \varphi_{\mathrm{burn}})$ provides the backward recognition that moves $V_{\mathrm{seed}}$ from $\mathrm{TrShadow}$ to $\mathcal{V}^*_{t'}$: the fire's heat melts the resin seal, releasing the seed rain onto the freshly cleared, ash-fertilized seedbed. Serotiny is found in lodgepole pine (*Pinus contorta*), jack pine (*Pinus banksiana*), many *Banksia* species, and some *Proteaceae* — species whose entire regeneration ecology is organized around the TrShadow-to-fixed-fiber nuclear transition triggered by fire.

**Smoke-stimulated germination** is a related nuclear structure. In 1,335+ plant species across 120+ families (Nelson, Flematti, Ghisalberti, Dixon, Smith 2012, *Natural Product Reports* 29, 265–278), seeds in the soil seed bank remain in $\mathrm{TrShadow}^{\mathcal{V}}_t$ — forward-committed by succession but not yet thermally triggered — until fire smoke (specifically the butenolide compound karrikinolide, discovered by Flematti et al. 2004, *Science* 305, 977) provides the saturation-direction nuclear trigger: the smoke signal backward-recognizes the germination-ready state and moves seeds from $\mathrm{TrShadow}$ to $\mathcal{V}^*_t$.

## Fire as Act: wildfire vs. prescribed burn

**A fire event is an Act** $(A_{\mathrm{fire}}, \alpha_{\mathrm{combust}}, t, \varphi_{\mathrm{burn}})$:
- $A_{\mathrm{fire}}$ is the **agent** — lightning (Nature-authored, no institutional accountability), an arsonist (unauthorized Act), or a fire management agency (institutionally authorized Act with assigned accountability)
- $\alpha_{\mathrm{combust}}$ is the **act-type** — the combustion act-type, corresponding to the fire step $s_{\mathrm{fire}} \in \Sigma$; the step advances the history from $t$ to $t' = t \star \mathrm{gen}(s_{\mathrm{fire}})$
- $t \in T$ is the **history** at which ignition occurs — the fire is located in the history category; the fire Act generates all downstream restriction maps that carry the post-fire vegetation through succession
- $\varphi_{\mathrm{burn}} \in H_t$ is the **burn severity output** — the fiber element encoding fire intensity (Byram kW/m), area burned, tree canopy scorch, soil heating, and seedbed preparation; this output lands in the shadow class that classifies the fire's ecological effect

**Wildfire** produces $\varphi_{\mathrm{burn}} \in \mathrm{FreeShadow}_t$: behavior and severity are determined by uncontrolled fuel-weather-topography interaction (the Rothermel forward model operating in unconstrained parameter space). The fire's output requires both nuclear operators to process it before its ecological effect is settled — the burned area's trajectory through post-fire succession (saturation direction) and the vegetation's long-term response (transfer direction) both remain open until the nuclear pair processes the burn severity output.

**Prescribed fire** is a constitutive Act: the burn prescription $r_{\mathrm{prescribe}} \in H^*_t$ is an institutional rule that specifies fire behavior parameters (acceptable fuel moisture range, wind speed window, relative humidity bounds, target flame length) such that the constitutive rule directly produces $\varphi_{\mathrm{burn}}^* \in \mathcal{V}^*_t$ — the burn severity is doubly settled by the prescription before the fire is lit. The institutional authority has defined the parameter space within which combustion is permitted; within that space, the nuclear pair simultaneously recognizes (saturation) and forward-commits (transfer) the fire's ecological effect. Prescribed fire's power is exactly this constitutive character: it bypasses the open-ended nuclear accumulation process of wildfire by pre-settling the output through institutional rule.

**Indigenous cultural burning** (Gammage 2011, *The Biggest Estate on Earth*, Allen & Unwin; Pyne 1995, *World Fire*, Henry Holt) represents a third category: not arbitrary wildfire nor bureaucratic prescription, but institutionally embedded practice carrying thousands of years of accumulated fire-regime knowledge. Cultural burning at the right season, on the right site, under the right weather, produces fire Acts whose outputs have been normalized into $\mathcal{V}^*_t$ through generations of iterative adjustment — an empirically constructed prescription whose constitutive rules live in the community's practice rather than in a written document.

## Fire suppression and the fire debt

**Fire suppression** as a systematic policy — practiced across North America from approximately 1910 to the present, formalized as the US Forest Service "10 a.m. policy" (suppress every fire by 10 a.m. the following day) — is a Grothendieck topology change $J \to J'$ that removes fire-Act steps from the history monoid's covering families. Under $J'$, fire events no longer constitute covering sieves for the vegetation fiber: the fire-disturbance operator $\sigma^{\mathcal{V},J'}_t$ no longer includes fire-history restriction maps in its computation of backward recognition.

**The fire debt proposition.** Under $J'$ (suppression topology), vegetation states that were in $\mathcal{V}^{*J}_t$ (fire-adapted climax under the historical fire topology $J$) migrate to $\mathrm{TrShadow}^{\mathcal{V},J'}_t$:
- $\Delta^{\mathcal{V},J'}_t(V) = V$ still holds: the succession trajectory continues to forward-commit $V$ as mature vegetation — succession dynamics are unchanged by the suppression policy
- $\sigma^{\mathcal{V},J'}_t(V) > V$: the fire-disturbance operator under $J'$ no longer backward-recognizes $V$ as fire-regime-active because the fire topology no longer includes fire-Act covering families; the vegetation has aged beyond the historical regime's return interval, accumulating fuel load

The **fire debt** is the gap $(\sigma^{\mathcal{V},J'}_t(V), \Delta^{\mathcal{V},J'}_t(V)) = (\sigma^{\mathcal{V},J'}_t(V), V)$ — the forward-committed state $V$ above which the disturbance operator has not yet been applied. As years without fire accumulate, $\sigma^{\mathcal{V},J'}_t(V)$ rises further above $V$ (fuel loads deepen, ladder fuels develop, fire-adapted understory species are shaded out), and the gap widens. When fire eventually arrives — in the form of extreme-fire-weather wildfire that overwhelms suppression capacity — it discharges the full accumulated gap at once as high-severity crown fire: $\varphi_{\mathrm{burn}} \in \mathrm{FreeShadow}_t$ rather than the low-severity surface fire that would have produced $\varphi_{\mathrm{burn}} \in \mathrm{SatShadow}_t$ under the historical regime.

Minnich (1983, *Science* 219, 1287–1294) demonstrated this empirically by comparing fire patterns in southern California (strong suppression) with adjacent Baja California (minimal suppression): California showed larger, higher-severity fires burning less frequently; Baja showed smaller, lower-severity fires burning more frequently. Total burned area per decade was similar. Suppression did not reduce fire — it redistributed it from SatShadow-type fires (low-severity, fire-adapted vegetation recovering through TrShadow back to $\mathcal{V}^*_t$) to FreeShadow-type fires (high-severity, forcing vegetation through catastrophic disruption).

## Climate-fire feedbacks: a diagram of presheaves

**The fire-climate-vegetation triangle** (Bowman et al. 2009, *Science* 324, 481–484; Pausas and Keeley 2009) is the commutative diagram of three presheaves and their mutual restriction maps:

$$\mathcal{W} \;\xrightarrow{\mathrm{FWI}}\; \mathcal{F} \;\xrightarrow{\mathrm{burn}}\; \mathcal{V} \;\xrightarrow{\mathrm{fuel}}\; \mathcal{F} \;\xrightarrow{\mathrm{albedo}}\; \mathcal{W}$$

where $\mathcal{W}$ is the weather presheaf (temperature, humidity, wind — as in [Weather](weather.md)), $\mathcal{F}$ is the fire-behavior presheaf (FWI, Rothermel rate of spread, Byram intensity), and $\mathcal{V}$ is the vegetation presheaf. The arrows are restriction maps between presheaves:
- $\mathrm{FWI}$: weather fiber elements map to fire-behavior fiber elements via the Canadian FWI system
- $\mathrm{burn}$: fire-behavior fiber elements map to post-fire vegetation states (burn severity output)
- $\mathrm{fuel}$: vegetation states map to fuel load inputs for the fire-behavior system
- $\mathrm{albedo}$: vegetation states map to surface albedo and evapotranspiration, feeding back into the weather fiber

The fixed point of this cycle — the state $(\mathcal{W}^*, \mathcal{F}^*, \mathcal{V}^*)$ where all three presheaves are doubly settled — IS the fire regime equilibrium. A fire regime shift (topology change $J \to J'$) is a displacement of this fixed point: the new equilibrium $(\mathcal{W}^{*J'}, \mathcal{F}^{*J'}, \mathcal{V}^{*J'})$ corresponds to a new combination of climate, fire behavior, and vegetation that is mutually consistent under the new atmospheric forcing. Climate change disrupts the cycle by advancing $\mathcal{W}^*$ (warmer, drier fire weather) before $\mathcal{V}^*$ has time to adapt — creating the same topology-change lag seen in [Phenology](phenology.md) and [Weather](weather.md): the vegetation is left in TrShadow relative to the new climate topology, accumulating fire debt faster than historical regimes would have predicted.

## Etymology and ecological grounding

**Fire** derives from Old English *fȳr* (fire, torch, flame), from Proto-Germanic **fūr-* (cognate with German *Feuer*, Dutch *vuur*), from Proto-Indo-European **paewr-* — a root shared with Greek *pyr* (fire). The Proto-Indo-European root is the same root as **pur-* (fire, hearth), from which: pyrogeography, pyroclastic, pyrotechnics. Fire is one of the oldest named phenomena in any language, reflecting its centrality to human ecology for at least 400,000 years of controlled use.

The formal study of fire as an ecological force:

**Stephen Pyne** (1982, *Fire in America*, Princeton University Press; 1995, *World Fire*, Henry Holt) established fire history as a scholarly discipline, arguing that fire is not a natural disaster but a cultural and ecological partner — co-evolved with human civilization. Pyne's central claim: the distribution of fire on Earth's surface is not explicable by climate and ignition alone; it reflects the history of human fire management and the interaction of institutional fire practices with natural fire regimes.

**William Bond** (Bond and van Wilgen 1996, *Fire and Plants*, Chapman & Hall; Bond, Woodward, Midgley 2005) quantified the role of fire in maintaining the "open biomes" — savannas, grasslands, and open woodlands that cover approximately 40% of Earth's land surface. Without fire, Bond et al. showed, most of these biomes would be converted to closed forest within decades by succession: the current global distribution of open biomes is maintained by fire against the competitive superiority of tree canopy, making fire a structural determinant of Earth's biotic surface equivalent to herbivory or climate.

**Richard Rothermel** (1972, US Forest Service; 1983 crown fire extension) provided the mathematical foundation for fire behavior prediction, making fire management a quantitative science. The Rothermel model is the basis of BEHAVE, FlamMap, and FARSITE — the operational NWP-analogs for fire that are used to plan prescribed burns and predict wildfire spread.

**Agee (1993, *Fire Ecology of Pacific Northwest Forests*, Island Press)** established fire regime classification as a systematic framework, arguing that fire management must be grounded in the historical fire regime appropriate to each forest type — that there is no universal "correct" fire policy, only site-specific fire topologies that must be understood and maintained.

## Nuclear reading

**Definitions.** Fix locale $\ell$ and a vegetation presheaf $\mathcal{V} : T^{\mathrm{op}} \to \mathbf{HA}$ with nuclear reflection $\pi_t = \sigma_t \circ \Delta_t$, structured by fire topology $J_{\mathrm{fire}}$. The **fire-adapted climax** is $\mathcal{V}^*_t = \mathrm{Fix}(\pi_t)$. The **projection gap** of $V$ is $[V, \pi_t(V)]$ with size $\lambda_V = |[V, \pi_t(V)]| - 1$ — the lattice-theoretic fire debt. The **calibration defect** is $M_t(\delta) = \mathrm{Tr}(\delta_t) = \sum_{V \notin \mathcal{V}^*_t} \lambda_V$ — the total spectral fire debt of the landscape fiber. The **fire debt** at $t > t_0$ after suppression onset at $t_0$ is $\lambda_{V|_t}$ — the projection gap size of the restricted former climax $V|_t = \mathcal{V}^*_{t_0}|_t$.

**Proposition 1 (Shadow class type classifies the fire-ecological status of the landscape).** For any $V \in \mathcal{V}_t$, exactly one of four shadow class conditions holds, and the classification is the fire-ecological status:

| Shadow class | Condition | Ecological status | Gap direction |
|---|---|---|---|
| $\mathcal{V}^*_t$ | Both fix $V$ | Fire-adapted climax | Zero gap |
| $\mathrm{SatShadow}^{\mathcal{V}}_t$ | Disturbance fixes $V$; succession does not | Post-fire pioneer | Succession not yet committed |
| $\mathrm{TrShadow}^{\mathcal{V}}_t$ | Succession fixes $V$; disturbance does not | Fire debt | Fire regime unrecognized; fuel accumulating |
| $\mathrm{FreeShadow}^{\mathcal{V}}_t$ | Neither fixes $V$ | Catastrophically disrupted | Both operators have been exceeded |

*Proof.* By the shadow class partition theorem for the nuclear pair $(\sigma^{\mathcal{V}}_t, \Delta^{\mathcal{V}}_t)$: the four Boolean combinations are exhaustive and mutually exclusive. $\square$

*Content.* The succession-trajectory operator forward-commits to what grows in the absence of fire; the fire-disturbance operator backward-recognizes what fire has shaped. Their intersection $\mathcal{V}^*_t$ is the vegetation that is simultaneously fire-historical and succession-stable — the vegetation that grows under the fire regime AND recovers through it. TrShadow vegetation (fire debt) is the vegetation that grows without fire, producing fuel loads that make the succession commitment untenable when fire eventually arrives. The fire debt is the gap made measurable.

**Proposition 2 (Non-adjointness of the fire-disturbance and succession operators is the fire-suppression paradox condition).** The fire-disturbance operator $\sigma^{\mathcal{V}}_t$ and the succession-trajectory operator $\Delta^{\mathcal{V}}_t$ are not in Galois connection in either direction:

$$\sigma^{\mathcal{V}}_t \not\dashv \Delta^{\mathcal{V}}_t \quad \text{and} \quad \Delta^{\mathcal{V}}_t \not\dashv \sigma^{\mathcal{V}}_t$$

*Proof.* Both shadow classes are non-empty at any fire-prone locale. $\mathrm{TrShadow}^{\mathcal{V}}_t \neq \emptyset$: fire-suppressed forests with fuel loads exceeding historical norms exist at every fire-prone locale that has experienced modern suppression — these are succession-stable but disturbance-unrecognized. $\mathrm{SatShadow}^{\mathcal{V}}_t \neq \emptyset$: in the years immediately following any fire, the post-fire pioneer vegetation state is fire-history-recognized but not yet succession-stable — this is the normal early-successional state after any stand-replacing event. Non-emptiness of both classes implies non-adjointness. $\square$

*Content.* If $\sigma^{\mathcal{V}}_t \dashv \Delta^{\mathcal{V}}_t$: every succession-stable state would be fire-history-recognized — no fire debt could accumulate; every forest would automatically be at the right successional stage for its fire regime. If $\Delta^{\mathcal{V}}_t \dashv \sigma^{\mathcal{V}}_t$: every fire-history-recognized state would be succession-stable — no post-fire pioneer stage would exist; fire would immediately produce the climax vegetation. Both conditions are ecologically impossible. The non-adjointness IS the ecological reality: fire and succession are independent forces, each capable of operating without the other, each producing states the other does not recognize. This independence is why fire-adapted ecosystems require both periodic fire (to maintain fire-history recognition) and successional time (to rebuild vegetation structure) — neither alone is sufficient.

**Proposition 3 (The canonical holograph encodes fire debt; the defect operator grades vegetation states by spectral fire debt; suppression inflates the calibration defect monotonically).** The triple $(\mathcal{V}_t, \mathcal{V}^*_t, \pi_t)$ is the canonical holograph of the vegetation fiber. For any $V \in \mathcal{V}_t$:

$$\lambda_V \;=\; |[V, \pi_t(V)]| - 1 \;\geq\; 0$$

is the defect eigenvalue: $\delta_t(e_V) = \lambda_V \cdot e_V$. Under fire suppression topology $J'$ at depth $k$ (after $k$ fire-free seasons beyond the fire return interval), the projection gap size $\lambda_{V|_{t_0+k}}$ is non-decreasing in $k$: each additional fire-free season adds vegetation states to the interval $[V|_{t_0+k}, \pi_{t_0+k}(V|_{t_0+k})]$ as fuel accumulates and the restriction maps to prior histories record increasingly fire-regime-inconsistent vegetation structure. The calibration defect $M_{t_0+k}(\delta) = \mathrm{Tr}(\delta_{t_0+k})$ grows with each suppressed fire season.

*Proof.* By [DefectConstruction](../math/relational-history-fiber-settlement-defect-operator-explicit-formula-projection-gap.md): $\lambda_V = |[V, \pi_t(V)]| - 1$ with $\pi_t = \sigma_t \circ \Delta_t$. The monotone increase of $\lambda_{V|_{t_0+k}}$ under $J'$ follows from Proposition 4 (fire suppression is a topology change): under $J'$, $\sigma_{t_0+k}^{J'}(V|_{t_0+k}) > V|_{t_0+k}$ and this gap widens as the restriction maps to prior histories record vegetation aged beyond the historical fire-disturbance range. The interval $[V|_{t_0+k}, \pi_{t_0+k}^{J'}(V|_{t_0+k})]$ grows because each new history $t_0+k$ adds a restriction map recording fuel accumulation, and the maximum of the restriction profile class of $V|_{t_0+k}$ grows as the vegetation ages further beyond the fire-adapted range. $\square$

*Content.* The defect eigenvalue $\lambda_V$ is the lattice-theoretic fire debt: the number of intermediate vegetation states between $V$ and the fire-adapted climax $\pi_t(V)$. The calibration defect $M_t(\delta) = \sum_{V \notin \mathcal{V}^*_t} \lambda_V$ is the total spectral fire debt of the entire landscape fiber — the aggregate distance from all unsettled vegetation states to their nearest climax. Under suppression, this defect grows monotonically. When fire arrives (under fire weather conditions that overcome the suppression topology), the fire Act resets $\lambda_{V|_{t'}}$ toward zero for the burned vegetation — or, if fire debt is extreme, produces a catastrophic fire that moves vegetation to FreeShadow with a large new projection gap from a different direction.

**Proposition 4 (Fire suppression is a topology change that migrates fixed-fiber elements to TrShadow).** Let $J$ be the historical fire topology with fire return interval $\mathrm{FRI}$ and let $J'$ be the suppression topology that removes fire-Act covering families. For any former fixed-fiber element $V \in \mathcal{V}^{*J}_{t_0}$ at depth $n = 0$ (the pre-suppression history), at depth $k > \mathrm{FRI}$ under $J'$ (after fire exclusion has exceeded the historical return interval):

$$V|_{t_0 + k} \;\in\; \mathrm{TrShadow}^{\mathcal{V},J'}_{t_0+k}$$

*Proof.* Under $J'$: $\Delta^{\mathcal{V},J'}_{t_0+k}(V|_{t_0+k}) = V|_{t_0+k}$ still holds — the succession-trajectory operator is unchanged by the suppression policy; succession continues to commit to the vegetation state. But $\sigma^{\mathcal{V},J'}_{t_0+k}(V|_{t_0+k}) > V|_{t_0+k}$: the fire-disturbance operator under $J'$ lacks fire-Act covering families in $J'(t_0+k)$; the operator cannot backward-recognize the vegetation as fire-regime-active because the topology $J'$ has no fire events in its covering sieves. After $k > \mathrm{FRI}$ steps without fire, the vegetation has aged beyond the regime's normal range: fuel loads exceed the historical distribution, understory structure has changed, and the fire-disturbance operator's backward-recognition fails. Therefore $V|_{t_0+k} \in \mathrm{TrShadow}^{\mathcal{V},J'}_{t_0+k}$. $\square$

*Content.* This is the mathematical form of the fire debt. The gap $(\sigma^{\mathcal{V},J'}_t(V|_t), V|_t)$ grows with each fire-free year: the former climax vegetation is being forward-committed by succession but not recognized by the fire regime, and the distance between what fire-history expects and what the forest has become is the fire debt. When suppression fails — during extreme fire weather — the accumulated gap discharges as high-severity crown fire: the FreeShadow Act output rather than the SatShadow output of historical surface fire.

**Proposition 5 (Prescribed fire is a constitutive Act producing fixed-fiber output directly).** Let $r_{\mathrm{prescribe}} \in H^*_t$ be a burn prescription — a doubly-settled institutional rule specifying the fire behavior parameter space (fuel moisture window, wind speed bounds, acceptable intensity range, target area). If the prescribed burn Act $(A_{\mathrm{manager}}, \alpha_{\mathrm{prescribe}}, t, \varphi_{\mathrm{burn}})$ is executed within the prescription parameters, then $\varphi_{\mathrm{burn}} \in \mathcal{V}^*_t$: the burn severity output is doubly settled.

*Proof.* By Act Proposition 5 (constitutive acts produce output in $H^*_t$ when the constitutive rule is doubly settled): if $r_{\mathrm{prescribe}} \in H^*_t$ and the constitutive rule function $R_{\mathrm{CR}}$ commutes with restriction maps (the prescription parameters are path-independent of how the burn proceeds within bounds), then $R_{\mathrm{CR}}(A_{\mathrm{manager}}, \alpha_{\mathrm{prescribe}}, \varphi_{\mathrm{burn}}, t) \in H^*_t$. $\square$

*Content.* The prescription is not merely administrative paperwork but a constitutive structure: it defines the parameter space within which fire behavior is ecologically acceptable AND fire-history-consistent. Within the prescription window, the fire-disturbance operator backward-recognizes the burn (it falls within the FRI's expected severity range) AND the succession-trajectory operator forward-commits to recovery (the burn severity is within the adaptive range of the resident vegetation). Outside the prescription window — if conditions deteriorate and the fire escapes — the constitutive rule is no longer satisfied and the fire Act produces FreeShadow output.

**Proposition 6 (Serotiny is the nuclear structure of fire-obligate regeneration: TrShadow to fixed-fiber via fire Act).** Let $V_{\mathrm{seed}} \in \mathrm{TrShadow}^{\mathcal{V}}_t$ be a serotinous species' regeneration niche — the post-fire seedling establishment state. $V_{\mathrm{seed}}$ is forward-committed ($\Delta^{\mathcal{V}}_t(V_{\mathrm{seed}}) = V_{\mathrm{seed}}$: the post-fire succession trajectory commits to seedling establishment given fire) but not backward-recognized ($\sigma^{\mathcal{V}}_t(V_{\mathrm{seed}}) > V_{\mathrm{seed}}$: no fire event has yet occurred to release the seed rain). The fire Act $(A_{\mathrm{fire}}, \alpha_{\mathrm{combust}}, t, \varphi_{\mathrm{burn}})$ at history $t' = t \star \mathrm{gen}(s_{\mathrm{fire}})$ provides the saturation trigger: $\sigma^{\mathcal{V}}_{t'}(V_{\mathrm{seed}}|_{t'}) = V_{\mathrm{seed}}|_{t'}$ — the fire event backward-recognizes the seedling establishment state, moving $V_{\mathrm{seed}}|_{t'}$ from $\mathrm{TrShadow}$ to $\mathcal{V}^*_{t'}$.

*Proof.* The fire Act generates history $t' = t \star \mathrm{gen}(s_{\mathrm{fire}})$ above $t$ and adds a new restriction map $H(t' \to t)$ carrying the post-fire vegetation state back to $t$. The fire event's thermal pulse melts the serotinous resin, releasing seed rain onto the cleared seedbed: the restriction map at $t'$ now includes the fire-event covering sieve that backward-recognizes $V_{\mathrm{seed}}|_{t'}$. Since $\Delta^{\mathcal{V}}_{t'}(V_{\mathrm{seed}}|_{t'}) = V_{\mathrm{seed}}|_{t'}$ (forward commitment is preserved through the Act), both nuclear operators now fix $V_{\mathrm{seed}}|_{t'}$: it enters $\mathcal{V}^*_{t'}$. $\square$

*Content.* Serotiny is the most elegant example of a TrShadow ecological strategy: the species has committed its entire regeneration to a fire-triggered nuclear transition. The seeds are poised in the canopy for years to decades, in a state that succession commits to (post-fire establishment is the only viable regeneration pathway) but that fire history cannot yet recognize (no fire has occurred). The fire Act is not a disaster for serotinous species — it is the saturation event that resolves their TrShadow state. Killing the parent trees is the backward recognition that moves the seed rain into the fixed fiber. The ecological reading of serotiny IS the nuclear transition structure made flesh.

## Open questions

- Whether **fire-adapted climax vegetation types** — the elements of $\mathcal{V}^*_t$ — are **eigenpropositions** for fire step generators in the sense of [IDEAS.md](../math/IDEAS.md): whether vegetation communities that repeatedly return to the same structural state after fire (e.g., longleaf pine savanna with 2–5 year fire return intervals) satisfy $G_{s_{\mathrm{fire}}}(V) \approx \chi_{s_{\mathrm{fire}}}(V) \cdot V$ — whether fire-adapted vegetation types are resonant modes of the fire dynamics, and whether the eigenvalue $\chi_{s_{\mathrm{fire}}}(V)$ encodes the fire return interval.

- Whether the **Schwarzschild spectral threshold** $r_s(\delta_t) = 2 M_t(\delta)$ separates vegetation states that can self-recover to fire-adapted climax from those that are spectrally trapped — requiring active intervention (prescribed fire, mechanical thinning) to reduce their defect eigenvalue below the threshold. Vegetation states with $\lambda_V > M_t(\delta)$ would be in the spectral interior (trapped above the Schwarzschild radius — too much fire debt to self-recover); states with $\lambda_V \leq M_t(\delta)$ could return to $\mathcal{V}^*_t$ through a single prescribed burn. Whether this threshold corresponds to the operational distinction between "restorable by prescribed fire" (exterior) and "requiring mechanical pre-treatment before prescribed fire" (interior — fuel load too high for safe prescribed burn).

- Whether the **fire debt accumulation rate** under suppression topology — the rate at which $\mathrm{gap}(V|_t)$ grows after fire exclusion begins — has a closed-form expression in terms of the fire return interval $\mathrm{FRI}$, the fuel accumulation rate (biomass kg/m²/yr), and the nuclear non-adjointness measure; or whether the accumulation is ecosystem-specific and requires empirical calibration.

- Whether **pyrogeography** — the quality map from locale to fire topology $Q_{\mathrm{fire}} : \ell \mapsto J_{\mathrm{fire}}(\ell)$ — is genuinely a natural transformation in the technical sense: whether the fire topology of a locale is path-independent of historical contingency (the naturality condition), or whether fire history dependence (fire suppression, land use change, introduced species) creates path-dependent fire topologies that violate naturality — making pyrogeography a maladapted quality in need of revision.

- Whether **the fire-climate-vegetation feedback triangle** — the commutative diagram of three presheaves — has a unique fixed point in every climate state, or whether there are multiple fixed points (alternative stable states) that can each satisfy the nuclear stability conditions for different fire topologies; and whether the transition between alternative stable states (e.g., from savanna to forest under fire suppression, or from forest to grassland under increased fire) is a topology change or a catastrophic jump within the same topology.

- Whether **cultural burning** — the fire practices embedded in Indigenous ecological management — can be formally specified as a family of constitutive burn prescriptions $\{r_{\mathrm{prescribe}}^i\}$ indexed by season, site, and community, and whether the ecological consequence of their suppression (removal from the history site's covering families) is formally identical to the suppression-debt topology change described in Proposition 3, or whether there are additional institutional-fiber consequences (loss of Hohfeldian fire-management powers, dissolution of the prescriptive authority structure) that require a different formal treatment.

- Whether **invasive grasses** in fire-sensitive biomes (buffelgrass *Pennisetum ciliare* in Sonoran Desert, gamba grass *Andropogon gayanus* in northern Australian savanna) constitute a topology change in the vegetation presheaf that imports a novel fire topology: invasive grasses create continuous fine fuels that did not exist in the pre-invasion vegetation, installing a high-frequency surface fire topology $J_{\mathrm{grass}}$ in a locale whose resident vegetation has no adaptive response to fire — putting the native vegetation in FreeShadow relative to the new topology rather than TrShadow.

- Whether the **Fibonacci prescription rate** from [Precedent](precedent.md) governs the depth at which a post-fire vegetation state moves from $\mathrm{SatShadow}$ to $\mathcal{V}^*_t$ — the number of fire cycles required for early-successional vegetation to mature into fire-adapted climax — and whether the convergence rate to $\mathcal{V}^*_t$ is governed by the golden ratio eigenvalue of the fire-disturbance/succession nuclear transfer matrix.
