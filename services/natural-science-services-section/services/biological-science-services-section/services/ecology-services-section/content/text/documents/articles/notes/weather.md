---
id: weather
description: "A Weather is a triple (W, t, ell) — an atmospheric state W in the atmospheric state fiber W_t, an analysis history t at which the state is evaluated, and a locale ell over which W is sampled — where the shadow class of W classifies the epistemic status of the atmospheric condition: W in W*_t (analyzed: doubly settled — assimilated against the full observational record by the RelationalHistoryFiberSaturatingNucleus and forward-committed by the RelationalHistoryFiberTransferringNucleus acting as the NWP forward operator), W in SatShadow_t (observed-unforecast: backward-recognized against observations but not forward-committed by the primitive-equation dynamics), W in TrShadow_t (forecast-unverified: forward-stable under NWP integration but not yet backward-recognized against incoming observations), W in FreeShadow_t (raw: neither assimilated nor forecast-stable; initial model output or unprocessed sensor data). Climate is the 30-year empirical measure over the sequence of W*_t elements — not a fiber element but a statistic on the fixed-fiber sequence, as standardized by the World Meteorological Organization. The non-adjointness of the data assimilation operator and the NWP forward operator is the formal content of Lorenz (1963) sensitivity: if the two were in Galois connection, both shadow classes would be empty, every observation would uniquely determine every forecast, and weather would be perfectly predictable. The predictability horizon — the depth k* above the analysis history at which TrShadow elements degrade to FreeShadow — is the Lyapunov time TL = 1 / lambda_1, approximately 10 days for the real atmosphere. Climate change is a Grothendieck topology change J to J' on the history site: former W*_t elements (pre-industrial climate normals) move to SatShadow^{J'}_t — still backward-recognized in the historical archive, but no longer forward-committed by the altered radiative dynamics."
defines: Weather
related: Quality, Locale, Environment, Gap, History, Precedent, Act, Situation, Foundation, Fitness
date-created: 2026-03-21
date-modified: 2026-03-21
params:
  atmospheric-state: relational-history-fiber-proposition
  analysis-history: relational-history
  locale: relational-universe
output: relational-history-fiber-proposition
ast:
  relational-history-fiber-element:
    - atmospheric-state:
        - analysis-history
        - locale
    - relational-history-fiber-saturating-nucleus:
        - atmospheric-state
        - analysis-history
    - relational-history-fiber-transferring-nucleus:
        - atmospheric-state
        - analysis-history
---

# Weather

## Formal definition

A **Weather** is a triple $(W, t, \ell)$:

$$(W \in W_t,\; t \in T,\; \ell \in \mathrm{Locale})$$

where:
- $W_t$ is the **atmospheric state fiber** at history $t$ — the complete Heyting algebra of atmospheric propositions at $t$; elements of $W_t$ are statements about temperature, pressure, humidity, and wind over locale $\ell$; the fiber inherits its Heyting algebra structure from the relational history fiber $H_t$ via the locale embedding $\ell : W_t \hookrightarrow H_t$
- $t \in T$ is the **analysis history** — the position in the history monoid at which the atmospheric state is evaluated; each step $s \in \Sigma$ corresponds to one forward timestep of the atmospheric dynamical system, advancing the history from $t$ to $t' = t \star \mathrm{gen}(s)$
- $\ell$ is the **locale** — the spatial domain over which the atmospheric state $W$ is sampled; $W_t$ is the presheaf fiber over $\ell$ at $t$; different locales (weather station, synoptic analysis grid, global model domain) yield sub-fibers related by locale restriction maps

**The atmospheric nuclear pair.** The fiber $W_t$ carries two canonical nuclei, inherited from $H_t$ and given meteorological content:

- The **data assimilation operator** — the [RelationalHistoryFiberSaturatingNucleus](../math/relational-history-fiber-saturating-nucleus.md) restricted to $W_t$, denoted $\sigma^W_t : W_t \to W_t$ — assigns to each atmospheric proposition $W$ the smallest backward-recognized state at or above $W$: $\sigma^W_t(W) = \bigwedge\{b \in W_t \mid b \geq W,\; \forall t' < t:\; H(t' \to t)(b) = H(t' \to t)(W)\}$. It is determined by the restriction-profile structure of prior histories — the accumulated observational record. $\sigma^W_t(W) = W$ iff $W$ is already consistent with all prior observations.

- The **NWP forward operator** — the [RelationalHistoryFiberTransferringNucleus](../math/relational-history-fiber-transferring-nucleus.md) restricted to $W_t$, denoted $\Delta^W_t : W_t \to W_t$ — assigns to each atmospheric proposition $W$ the smallest forecast-stable state at or above $W$: $\Delta^W_t(W) = \bigwedge\{b \in W_t \mid b \geq W,\; \forall s \perp t:\; W \in \mathrm{image}(H(t \star \mathrm{gen}(s) \to t))\}$. It is determined by the one-step-extension restriction structure above $t$ — what states every independent fresh timestep maps back onto. $\Delta^W_t(W) = W$ iff $W$ is present in the image of the restriction from every independent one-step NWP extension.

**The four shadow classes for weather.** The shadow class of $W \in W_t$ classifies the epistemic status of the atmospheric state:

| Shadow class | Condition | Operational name |
|---|---|---|
| $W \in W^*_t$ | $\sigma^W_t(W) = W$ and $\Delta^W_t(W) = W$ | **Analysis** — doubly settled |
| $W \in \mathrm{SatShadow}^W_t$ | $\sigma^W_t(W) = W$, $\Delta^W_t(W) > W$ | **Observation** — assimilated, not forecast-stable |
| $W \in \mathrm{TrShadow}^W_t$ | $\sigma^W_t(W) > W$, $\Delta^W_t(W) = W$ | **Forecast** — model output, not yet verified |
| $W \in \mathrm{FreeShadow}^W_t$ | $\sigma^W_t(W) > W$, $\Delta^W_t(W) > W$ | **Raw** — neither assimilated nor forecast-stable |

**The nuclear reflection and holographic projection.** The composite map

$$\pi_t \;:=\; \sigma_t \circ \Delta_t \;:\; H_t \to H_t$$

is the [RelationalHistoryPropositionFiberSaturatingTransferringCommutingNuclearReflection](../math/relational-history-fiber-saturating-transferring-commuting-nuclear-reflection.md) — a nucleus with $\mathrm{Fix}(\pi_t) = W^*_t$. The triple $(W_t, W^*_t, \pi_t)$ is the **canonical holograph** of the atmospheric fiber ([RelationalUniverseCanonicalHolograph](../math/relational-universe-canonical-holograph.md)): $W^*_t$ is the **boundary** $\mathsf{Phase}$, $W_t$ is the **bulk**, and $\pi_t = \mathsf{Stab}$ sends every atmospheric state to its nearest analysis. The [RelationalHistoryProjectionGap](../math/relational-history-fiber-projection-gap.md) of $W$ is the interval $[W, \pi_t(W)] \subseteq W_t$; its size

$$\lambda_W \;:=\; \bigl|[W,\, \pi_t(W)]\bigr| - 1 \;\geq\; 0$$

is the [RelationalHistoryProjectionGapSize](../math/relational-history-fiber-projection-gap-size.md) — the number of atmospheric states between $W$ and its analysis; zero iff $W \in W^*_t$. The [RelationalHistoryFiberSettlementDefectOperator](../math/relational-history-fiber-settlement-defect-operator-explicit-formula-projection-gap.md) $\delta_t : K^{W_t} \to K^{W_t}$ is the diagonal operator $\delta_t(e_W) = \lambda_W \cdot e_W$; its zero eigenspace is $K^{W^*_t}$ — the analysis sector of the mode sheaf.

**The weather analysis condition.** $(W, t, \ell)$ is **analyzed** iff $W \in W^*_t$ — equivalently, any of:
1. $W$ is in the boundary $\mathsf{Phase}$: $\pi_t(W) = W$
2. The [RelationalHistoryProjectionGap](../math/relational-history-fiber-projection-gap.md) is trivial: $[W, \pi_t(W)] = \{W\}$, i.e., $\lambda_W = 0$
3. $W$ is a zero-eigenmode of the defect operator: $\delta_t(e_W) = 0$
4. $W \in \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$: both assimilation and NWP operators fix $W$ simultaneously

## What this is

**Weather** is the condition of the atmosphere at a particular place and time — the answer to "what is it doing outside right now?" The World Meteorological Organization (*Guide to Climatological Practices*, WMO-No. 100, 1992) defines weather as "the state of the atmosphere at a specific time, as determined by the simultaneous occurrence of several meteorological elements." This definition is deliberately short-term: weather is what happens over hours to days; climate is the 30-year statistical envelope of weather.

The nuclear reading makes this temporal distinction precise. A **weather state** $W \in W_t$ is a single fiber element at a specific history $t$. **Climate** is not a fiber element but the long-time measure — the statistical density of $W^*_t$ elements over a 30-year sequence of histories, as standardized by the WMO. Climate is the coarse shape of the fixed fiber over time; weather is the particular fiber element at a particular history.

The shadow class structure adds three dimensions invisible in the WMO definition: the assimilation status (has this state been reconciled with all available observations?), the forecast status (does the NWP dynamics commit to this state persisting forward?), and the gap (how much further nuclear processing is required before the state enters $W^*_t$?).

## Atmospheric state space and the primitive equations

**The primitive equations** (Richardson 1922, *Weather Prediction by Numerical Process*, Cambridge; Charney, Fjörtoft, von Neumann 1950, *Tellus* 2, 237–254) are the conservation laws governing large-scale atmospheric dynamics. They encode four physical principles:

$$\frac{D\mathbf{u}}{Dt} = -\frac{\nabla p}{\rho} - 2\mathbf{\Omega} \times \mathbf{u} - \nabla \Phi + \mathbf{F} \quad \text{(momentum)}$$

$$\frac{\partial \rho}{\partial t} + \nabla \cdot (\rho \mathbf{u}) = 0 \quad \text{(mass)}$$

$$\frac{D\theta}{Dt} = \frac{Q}{c_p} \quad \text{(thermodynamic energy)}$$

$$\frac{\partial p}{\partial z} = -\rho g \quad \text{(hydrostatic approximation)}$$

These four equations jointly define the NWP forward operator: given the full atmospheric state $W \in W_t$, integration of these equations produces $W_{t'} \in W_{t'}$ at the next history $t' = t \star \mathrm{gen}(s)$, via the restriction map $H(t' \to t)(W_{t'}) = W$.

**The state space.** The full atmospheric state at history $t$ over the global locale $\ell_{\mathrm{global}}$ is the tuple $(\mathbf{u}(x,t), p(x,t), \rho(x,t), \theta(x,t))$ for all spatial coordinates $x \in \ell$. In a modern NWP model, this is a vector of approximately \$10^8$ components (grid points times state variables). The atmospheric state fiber $W_t$ is the frame of observable propositions about this state vector — it is the Heyting algebra of conditions on the full atmospheric phase space.

**The Lorenz attractor as the fixed fiber's geometry.** Despite the \$10^8$-dimensional full phase space, the atmospheric dynamics are attracted to a strange attractor with Hausdorff dimension approximately 27.1 (Lorenz 1969, *Bulletin of the American Meteorological Society* 50, 345–352 — estimate for the real atmosphere). The fixed fiber $W^*_t$ consists of those atmospheric propositions that are simultaneously backward-consistent and forward-stable — those compatible with the attractor's geometry. States that venture far from the attractor fail the transfer-stability condition: the NWP dynamics carry them back toward the attractor, so $\Delta^W_t(W) > W$ for states far from $W^*_t$.

## Quasigeostrophic theory and potential vorticity

**Quasigeostrophic (QG) theory** (Charney 1948, *Journal of Meteorology* 5, 289–321) is the reduced description of synoptic-scale atmospheric dynamics. At synoptic scale (1000–5000 km), the Rossby number $\mathrm{Ro} = U/(fL) \ll 1$ — the Coriolis force dominates inertia — and the flow is nearly geostrophic: nearly balanced between pressure gradient and Coriolis force. QG theory exploits this balance to reduce the full \$10^8$-dimensional primitive equations to a single conserved scalar field: the quasigeostrophic potential vorticity (QGPV).

**QGPV conservation.** The fundamental QG equation is conservation of QGPV following the geostrophic flow:

$$\frac{D Q}{Dt} = 0$$

where $Q$ is the QGPV, combining relative vorticity $\nabla^2 \psi$ (curvature of the flow, from the stream function $\psi$), planetary vorticity $f_0$ (Coriolis parameter), and stretching vorticity $(f_0^2/N^2)(\partial^2 \psi / \partial z^2)$ (vertical stratification). The stream function $\psi$ — from which the geostrophic wind is recovered as $u_g = -\partial\psi/\partial y$, $v_g = \partial\psi/\partial x$ — is the single scalar potential that determines the full synoptic flow.

**QGPV conservation as transfer-stability.** In nuclear terms: the QGPV field $Q(x,t)$ is a fiber element $Q \in W_t$. Conservation $DQ/Dt = 0$ is the statement that $Q$ is transfer-stable under the QG approximation of the NWP forward operator: $\Delta^W_t(Q) = Q$ — the NWP forward operator does not move $Q$ from its value along geostrophic trajectories. The QGPV is an element of $\mathrm{Fix}(\Delta^W_t)$ — it sits in the transfer-fixed sublocale of $W_t$.

**PV thinking.** The practitioner technique of **potential vorticity thinking** (Hoskins, McIntyre, Robertson 1985, *Quarterly Journal of the Royal Meteorological Society* 111, 877–946) diagnoses atmospheric development by tracking QGPV anomalies. A positive upper-level QGPV anomaly (jet-stream trough) induces cyclonic circulation below; a negative surface thermal anomaly induces anticyclonic flow above. Their mutual interaction drives **baroclinic instability** — the growth of mid-latitude weather systems from initially small perturbations. In nuclear terms: the upper and surface QGPV anomalies are elements of two sub-fibers of $W_t$ (upper-troposphere locale and surface locale); baroclinic growth is the process of their joint fiber element moving toward $W^*_t$ through mutual nuclear amplification.

## Chaos, Lyapunov exponents, and the predictability horizon

**Lorenz (1963)** (*Journal of the Atmospheric Sciences* 20, 130–141) demonstrated that deterministic atmospheric convection is chaotic: small differences in initial conditions grow exponentially. The formal content: the atmospheric dynamical system has a positive largest Lyapunov exponent $\lambda_1 > 0$, the maximum rate of exponential divergence of nearby trajectories in atmospheric phase space. For the real atmosphere, $\lambda_1 \approx 0.35$ day$^{-1}$ (Lorenz 1969), giving a Lyapunov time of $T_L = 1/\lambda_1 \approx 2.9$ days for the fastest-growing scales. Accounting for error cascade from small to large scales, practical predictability ends at approximately 10–14 days (ECMWF deterministic forecast skill verification 2019).

**The Lorenz attractor.** The Lorenz (1963) three-equation system — a model of Rayleigh-Bénard convection — exhibits a **strange attractor**: a bounded, aperiodic, fractal subset of phase space with Hausdorff dimension approximately 2.06 (Tucker 2002, *Foundations of Computational Mathematics* 2, 53–117 — the first rigorous proof of the Lorenz attractor's existence). The attractor has two wings (the "butterfly"); trajectories spiral around one wing for several cycles before switching to the other. The two wings correspond to two quasi-stationary circulation regimes; wing-switching is the dynamical analog of regime transitions in the real atmosphere.

**Lorenz sensitivity as nuclear non-adjointness.** The sensitive dependence on initial conditions is the operational symptom. The structural cause is the non-adjointness of the data assimilation operator and the NWP forward operator: because $\sigma^W_t \not\dashv \Delta^W_t$, there is a genuine gap between what the observational record commits to (the saturation fixed-fiber, assimilated states) and what the dynamics commit to (the transfer fixed-fiber, forecast-stable states). A weather state can be in one without being in the other — and closing the gap requires nuclear processing that cannot be shortened. If the two were adjoint, no such gap would exist: every observed state would be forecast-stable, and every forecast-stable state would be consistent with every observation. This is the nuclear expression of the impossibility of perfect weather prediction.

## Data assimilation and the observational topology

**4D-Var data assimilation** (Lorenc 1986, *Quarterly Journal of the Royal Meteorological Society* 112, 1177–1194) is the operational implementation of the saturation nucleus: it finds the element of $W^*_t$ nearest (in the background error covariance metric) to the prior forecast. The 4D-Var cost function:

$$J(W_0) = \|W_0 - W_b\|^2_{B^{-1}} + \sum_{k=0}^{N} \|H(\mathcal{M}^k(W_0)) - y_k\|^2_{R^{-1}}$$

where $W_b$ is the background (prior forecast, an element of $\mathrm{TrShadow}^W_t$), $y_k$ are observations (elements of $\mathrm{SatShadow}^W_{t+k}$), $H$ is the observation operator, $\mathcal{M}^k$ is the NWP model integrated $k$ steps forward, and $B$, $R$ are background and observation error covariance matrices. Minimization of $J$ moves $W_0$ from $\mathrm{TrShadow}$ toward $W^*_t$ — pulling the prior forecast into consistency with the observations by applying both nuclear operators simultaneously.

**The Ensemble Kalman Filter** (Evensen 1994, *Journal of Geophysical Research* 99, 10143–10162) is the stochastic alternative: instead of solving the 4D-Var optimization, it maintains an ensemble of $N$ atmospheric states $\{W^{(i)}_t\}_{i=1}^N$, each a fiber element in $W_t$, and updates each member toward observations using the sample covariance of the ensemble spread. The ensemble mean $\bar{W}_t = (1/N)\sum_i W^{(i)}_t$ is the analyzed state; the ensemble spread $\mathrm{Var}(\{W^{(i)}_t\})$ is the empirical estimate of the gap magnitude.

**The observational topology.** The Grothendieck topology $J_{\mathrm{obs}}$ on the history site encodes the observational network structure: a covering family $\{t' \to t\}_{t' \in S}$ in $J_{\mathrm{obs}}(t)$ is a set of observation histories sufficient to globally constrain the atmospheric state at $t$. The WMO Global Observing System — surface stations, radiosonde networks, satellite data streams, aircraft reports — jointly define the operational covering families. A gap in the observing system (Southern Ocean, central Africa, deep Arctic) corresponds to a hole in the covering sieve: the atmospheric state in that region is constrained only by the prior NWP forecast, not by direct observational coverage.

## Climate as fixed-fiber measure; climate change as topology change

**Climate** is not a weather state but a statistical property of the fiber sequence. The WMO standard (*Technical Regulations*, WMO-No. 49, Volume I, 2018): climate normals are computed over the 30-year WMO Standard Normal period (most recently 1991–2020). In nuclear terms:

$$\overline{Q}_\ell = \frac{1}{n} \sum_{i=1}^{n} Q_{t_i}(W^*_{t_i}(\ell))$$

where $(t_1, \ldots, t_n)$ is the 30-year sequence of analysis histories ($n \approx 10957$ days) and $Q_{t_i}(W^*_{t_i}(\ell))$ is the quality value (temperature, precipitation, wind, etc.) of the analyzed state at locale $\ell$ at history $t_i$. The climate normal $\overline{Q}_\ell$ is the empirical mean of quality values of fixed-fiber elements across the 30-year sequence. It is NOT a fiber element; it is a measure on the sequence of fixed-fiber elements.

**Climate change as topology change.** A shift in climate regime — the process by which new global mean temperatures, altered precipitation distributions, and changed extreme-event frequencies become established — is formally a change to the Grothendieck topology $J \to J'$ on the history site. The new topology $J'$ includes the altered radiative forcing (elevated CO$_2$ concentrations, changed albedo) as part of the standard covering data for global atmospheric state witnessing. Under $J'$:
- Former $W^{*J}_t$ elements (pre-industrial climate normals) move to $\mathrm{SatShadow}^{J'}_t$: they remain historically recognized (the observational archive has not changed) but are no longer forward-committed by the altered dynamics
- The new $W^{*J'}$ elements are higher-mean-temperature states that are now both observation-consistent and NWP-forward-stable under the new radiative forcing
- The WMO updates its Climate Normal period every decade precisely to track this topology shift: the 1991–2020 normals reflect $W^{*J'}_t$ rather than $W^{*J}_t$ for the pre-industrial topology

This is the exact formal analog of overruling a [Precedent](../../../../../../../../social-science-services-section/services/work-services-section/services/governance-services-section/content/text/glossary/terms/precedent.md): the climate norm was a $W^*_t$ element (doubly settled) under the old topology; the new topology renders it backward-recognized but no longer forward-committed.

## Etymology and meteorological grounding

**Weather** derives from Old English *weder* (wind, air, sky, storm), from Proto-Germanic **wedra-* (cognate with Old Norse *veðr*, German *Wetter*, Gothic *weidwo*), from Proto-Indo-European **ue-dh-ro-* from **ue-* (to blow) — the same root as Latin *ventus* (wind). The earliest recorded use is in *Beowulf* (~750 CE). Weather is etymologically the force that arrives on the wind — the atmospheric condition that comes from elsewhere, uncontrolled, and acts.

The scientific history of weather prediction as a formal enterprise:

**Vilhelm Bjerknes** (1904, *Meteorologische Zeitschrift* 21, 1–7): framed weather prediction as a problem in mathematical physics — exact knowledge of the atmospheric state at time $t_0$ plus physical laws determines the state at all future times. The first formal statement of the NWP forward operator.

**Lewis Fry Richardson** (1922, *Weather Prediction by Numerical Process*, Cambridge University Press): implemented the first numerical weather forecast — a 6-hour forecast over central Europe for 20 May 1910, computed by hand over six weeks in 1922. The computation was too slow for operational use (Richardson estimated 64,000 human computers would be needed to run forecasts in real time) but established the method.

**Jule Charney** (1950, *Tellus* 2, 237–254): led the first successful NWP computation on ENIAC at the Institute for Advanced Study — 24-hour forecasts of 500 hPa geopotential height, using QG theory to filter acoustic and gravity waves that would otherwise require prohibitively small timesteps. The first analyzed weather states in $W^*_t$ produced computationally.

**Edward Lorenz** (1963, *Journal of the Atmospheric Sciences* 20, 130–141): demonstrated the theoretical limit to NWP. Lorenz discovered chaos by accident: re-running a weather simulation with initial conditions rounded to 3 decimal places (instead of the stored 6), he found the trajectory diverged completely within a simulated month. This established the predictability horizon as a structural feature of atmospheric dynamics, not a remediable data problem.

**ECMWF** (European Centre for Medium-Range Weather Forecasts, founded 1975): the operational institution that extended the predictability horizon from 3 days (1975) to approximately 10 days (2020) through improved models, data assimilation, and observational coverage — demonstrating that the gap between $\mathrm{TrShadow}$ and $W^*_t$ is closable by better nuclear processing, up to the hard Lyapunov limit.

## Nuclear reading

**Definitions.** Fix an atmospheric state presheaf $W : T^{\mathrm{op}} \to \mathbf{HA}$ with nuclear reflection $\pi_t = \sigma_t \circ \Delta_t$. The **analyzed state** is $W^*_t = \mathrm{Fix}(\pi_t)$. The **projection gap** of $W$ is $[W, \pi_t(W)]$ with size $\lambda_W = |[W, \pi_t(W)]| - 1$. The **calibration defect** (total analysis debt of the fiber) is $M_t(\delta) = \mathrm{Tr}(\delta_t) = \sum_{W \notin W^*_t} \lambda_W$. The **$k$-step forecast** from analysis history $t_0$ is the fiber element $W_{t_0+k} \in W_{t_0+k}$ produced by $k$ applications of the NWP forward operator.

**Proposition 1 (Shadow class type classifies the epistemic status of a weather state).** For any $W \in W_t$, exactly one of the four shadow class conditions holds, and the classification is the epistemic status of $W$ in the operational NWP cycle:

| Shadow class | Condition | Operational status |
|---|---|---|
| $W^*_t$ | Both nuclei fix $W$ | Analysis — assimilated and forecast-stable |
| $\mathrm{SatShadow}^W_t$ | Saturation nucleus fixes $W$; transfer nucleus does not | Observation — assimilated, not forecast-stable |
| $\mathrm{TrShadow}^W_t$ | Transfer nucleus fixes $W$; saturation nucleus does not | Forecast — NWP-stable, not yet verified by observation |
| $\mathrm{FreeShadow}^W_t$ | Neither nucleus fixes $W$ | Raw — unprocessed sensor or model output |

*Proof.* By the shadow class partition theorem for the nuclear pair $(\sigma^W_t, \Delta^W_t)$: the four Boolean combinations of the nucleus-fixed conditions are exhaustive and mutually exclusive for every $W \in W_t$. $\square$

*Content.* The 4D-Var analysis cycle moves a $\mathrm{TrShadow}$ element (the prior 6-hour forecast, NWP-stable but observationally unrecognized) through both nuclear operators, using the observational constraints ($\mathrm{SatShadow}$ elements) to produce the unique nearest element of $W^*_t$. The analysis is the nuclear fixed point produced by resolving the gap between what the dynamics commit to and what the observations recognize.

**Proposition 2 (Non-adjointness of the atmospheric nuclear pair is the Lorenz sensitivity condition).** The data assimilation operator $\sigma^W_t$ and the NWP forward operator $\Delta^W_t$ are not in Galois connection in either direction:

$$\sigma^W_t \not\dashv \Delta^W_t \quad \text{and} \quad \Delta^W_t \not\dashv \sigma^W_t$$

*Proof.* Both shadow classes are non-empty. $\mathrm{TrShadow}^W_t \neq \emptyset$: every operational NWP system produces forecast states that are forward-committed by the primitive equation dynamics but have not yet been verified by incoming observations — these are $\Delta^W_t$-fixed but not $\sigma^W_t$-fixed. $\mathrm{SatShadow}^W_t \neq \emptyset$: every historical observational archive contains weather observations from before the current NWP analysis window — these are backward-recognized by the restriction profile of prior histories but not forward-committed by the current NWP dynamics. Non-emptiness of both shadow classes implies non-adjointness by the nuclear non-adjointness criterion. $\square$

*Content.* If $\sigma^W_t \dashv \Delta^W_t$, then $\mathrm{TrShadow}^W_t = \emptyset$ — every NWP-stable state would be observationally recognized — perfect predictability. If $\Delta^W_t \dashv \sigma^W_t$, then $\mathrm{SatShadow}^W_t = \emptyset$ — every observed state would be NWP-forward-stable — no sensitive dependence. The Lorenz result is the structural theorem that neither holds: chaotic sensitivity guarantees $\mathrm{TrShadow} \neq \emptyset$; the finite observational archive guarantees $\mathrm{SatShadow} \neq \emptyset$. Their non-adjointness is the mathematical expression of the irreducible gap between knowing what the atmosphere IS doing now and knowing what it WILL DO next.

**Proposition 3 (The canonical holograph encodes analysis distance; the defect operator grades atmospheric states by spectral forecast debt).** The triple $(W_t, W^*_t, \pi_t)$ is the canonical holograph of the atmospheric fiber. For any $W \in W_t$:

$$\lambda_W \;=\; |[W, \pi_t(W)]| - 1 \;\geq\; 0$$

is the defect eigenvalue: $\delta_t(e_W) = \lambda_W \cdot e_W$. The mode sheaf $K^{W_t}$ decomposes as $K^{W_t} \cong \bigoplus_{\lambda \geq 0} E_{t,\lambda}$ with $E_{t,0} = K^{W^*_t}$ (the analysis sector). The calibration defect $M_t(\delta) = \mathrm{Tr}(\delta_t) = \sum_{W \notin W^*_t} \lambda_W$ is the total spectral analysis debt of the atmospheric fiber at $t$.

*Proof.* By [DefectConstruction](../math/relational-history-fiber-settlement-defect-operator-explicit-formula-projection-gap.md): the defect operator is diagonal with $\lambda_W = |[W, \pi_t(W)]| - 1$; zero iff $\pi_t(W) = W$ iff $W \in W^*_t$; $E_{t,0} = K^{W^*_t}$. $\square$

*Content.* The projection gap $[W, \pi_t(W)]$ decomposes into the transfer gap $[W, \Delta_t(W)]$ (how far $W$ is from NWP-forward-stability — the forecast debt: intermediate states between the current atmospheric condition and the state the NWP dynamics commit to) and the saturation gap $[\Delta_t(W), \pi_t(W)]$ (how far the NWP-committed state is from full observational consistency). A TrShadow forecast $W$ has $\Delta_t(W) = W$ (zero transfer gap) but $\sigma_t(W) > W$ (non-zero saturation gap) — its defect eigenvalue is entirely in the saturation direction. A SatShadow observation has $\sigma_t(W) = W$ (zero saturation gap) but $\Delta_t(W) > W$ — its defect eigenvalue is entirely in the transfer direction. An analyzed state $W \in W^*_t$ has $\lambda_W = 0$ — zero-eigenmode of the defect operator, sitting on the holographic boundary.

**Proposition 4 (Forecast degradation and the predictability horizon).** Let $W \in W^*_{t_0}$ be an analyzed weather state. The **$k$-step forecast** $\hat{W}_{t_0+k}$ is produced by $k$ applications of the NWP forward operator from $W$. For small $k$, $\hat{W}_{t_0+k} \in \mathrm{TrShadow}^W_{t_0+k}$. At the **predictability horizon** $k^* = k^*(W)$, the forecast error exceeds the observational uncertainty threshold and $\hat{W}_{t_0+k^*}$ moves from $\mathrm{TrShadow}$ to $\mathrm{FreeShadow}$. The predictability horizon satisfies:

$$k^*(W) \leq \frac{1}{\lambda_1 \Delta t} \ln\!\left(\frac{\epsilon_{\mathrm{obs}}}{\epsilon_0}\right)$$

where $\lambda_1$ is the largest Lyapunov exponent, $\Delta t$ is the model timestep, $\epsilon_0$ is the initial condition uncertainty, and $\epsilon_{\mathrm{obs}}$ is the observational uncertainty at verification.

*Proof.* Forecast error grows exponentially: $\epsilon(k) \approx \epsilon_0 \exp(\lambda_1 k \Delta t)$ by definition of $\lambda_1$. The forecast is transfer-stable ($\hat{W}_{t_0+k} \in \mathrm{TrShadow}$) while $\epsilon(k) < \epsilon_{\mathrm{obs}}$ — while the NWP commitment is tighter than observational uncertainty. Setting $\epsilon(k^*) = \epsilon_{\mathrm{obs}}$ and solving gives $k^* = (1/\lambda_1 \Delta t) \ln(\epsilon_{\mathrm{obs}}/\epsilon_0)$. Since $\epsilon_{\mathrm{obs}}/\epsilon_0 = O(1)$, $k^* = O(T_L/\Delta t)$ where $T_L = 1/\lambda_1$. $\square$

*Content.* For the real atmosphere: $\lambda_1 \approx 0.35$ day$^{-1}$, $T_L \approx 2.9$ days. Accounting for the cascade of errors from small scales (where local $\lambda_1$ is larger) to synoptic scales (where verification occurs), the operational predictability horizon is 10–14 days (ECMWF 2019). Beyond this horizon, all $\mathrm{TrShadow}$ forecast elements have degraded to $\mathrm{FreeShadow}$ — the NWP forward operator no longer provides forward-commitment tighter than climatological uncertainty. Every element of $W_t$ at lead time beyond $k^*$ is in $\mathrm{FreeShadow}^W_t$; the only elements of $W^{*J}_{t_0+k}$ accessible from $t_0$ are those lying in $W^*_t$'s climatological envelope.

**Proposition 5 (Climate is the long-time empirical measure on the fixed fiber).** Let $(t_1, t_2, \ldots, t_n)$ be the sequence of $n$ analysis histories spanning 30 years ($n = 10957$ daily analyses in the WMO standard period). The **climate normal** for quality $Q$ at locale $\ell$ is:

$$\overline{Q}_\ell = \frac{1}{n} \sum_{i=1}^{n} Q_{t_i}(W^*_{t_i}(\ell))$$

This is the empirical mean of quality values of analyzed states over the 30-year fixed-fiber sequence. Climate is NOT a fiber element; it is a statistic on the sequence $\{W^*_{t_i}\}_{i=1}^n$ of fixed-fiber elements.

*Proof.* Each $W^*_{t_i}$ is a fixed-fiber element by construction: it satisfies $\sigma^W_{t_i}(W^*_{t_i}) = W^*_{t_i}$ and $\Delta^W_{t_i}(W^*_{t_i}) = W^*_{t_i}$. The quality map $Q_{t_i}$ is a natural transformation — a quality in the technical sense — applied to the fixed-fiber element. The mean $\overline{Q}_\ell$ is a statistic on the set $\{Q_{t_i}(W^*_{t_i}(\ell))\}_{i=1}^n$; it does not lie in any single fiber $W_t$. $\square$

*Content.* A weather event is "anomalous relative to climate" when $Q_t(W) - \overline{Q}_\ell$ is large — when the quality of the current weather state is far from the climate normal. An extreme weather event (heat wave, hurricane, flood) is a fiber element $W \in W_t$ with quality values several standard deviations beyond $\overline{Q}_\ell$ in the distribution of $\{Q_{t_i}(W^*_{t_i}(\ell))\}$. The WMO definitions of extreme weather (e.g., temperature exceeding the 90th percentile of the climate normal distribution) are thresholds in the quality space of the fixed-fiber sequence.

**Proposition 6 (Climate change moves former analyzed states to the saturation shadow class).** Let $J$ be the pre-industrial observational topology and $J'$ be the perturbed topology reflecting elevated greenhouse forcing. For pre-industrial temperature states $W \in W^{*J}_{t_0}$ with $Q_{\mathrm{temp}}(W) \leq T_{\mathrm{pre-industrial}}$:

$$W \;\in\; W^{*J}_{t_0} \;\implies\; W \;\in\; \mathrm{SatShadow}^{W,J'}_{t_0}$$

That is: former analyzed states become observationally recognized but no longer forecast-stable under the new topology.

*Proof.* Under $J'$, the NWP forward operator $\Delta^{W,J'}_{t_0}$ includes additional radiative forcing (elevated CO$_2$, altered albedo). For a pre-industrial temperature state $W$ with $Q_{\mathrm{temp}}(W) = T_0 < T_{\mathrm{new}}$: Newtonian relaxation toward the new radiative equilibrium temperature $T_{\mathrm{new}} > T_0$ means $\Delta^{W,J'}_{t_0}(W) > W$ — the NWP forward operator under $J'$ no longer has $W$ in its image for independent extensions, so transfer-stability fails. Meanwhile $\sigma^{W,J'}_{t_0}(W) = W$ still holds — the historical observational archive recognizes $T_0$ as a historically realized temperature; the backward restriction profile has not changed. Therefore $W \in \mathrm{SatShadow}^{W,J'}_{t_0}$. $\square$

*Content.* Climate change does not erase historical weather. Pre-industrial temperature states remain in $\mathrm{SatShadow}^{J'}$: the observational record still recognizes them, but the altered atmospheric dynamics no longer commit to producing them. The WMO updates its Climate Normal period (currently 1991–2020) to track this topology shift: the new normals reflect $W^{*J'}$ rather than $W^{*J}$, and the difference between the two normal sets is the observational signature of the topology change.

## Open questions

- Whether **analyzed atmospheric states** — the elements of $W^*_t$ — are **eigenpropositions** for atmospheric step generators in the sense of [IDEAS.md](../math/IDEAS.md): whether large-scale circulation patterns (blocking highs, NAO regimes, Madden-Julian Oscillation phases) that persist for weeks are resonant modes satisfying $G_s(W) \approx \chi_s(W) \cdot W$ for trophic generators, and whether their persistence timescales correspond to their $\chi_s$ eigenvalues.

- Whether the **Schwarzschild spectral threshold** $r_s(\delta_t) = 2 M_t(\delta)$ separates atmospheric states that can self-organize to $W^*_t$ through ordinary data assimilation from those that are spectrally trapped — requiring external observational input to reduce their defect eigenvalue below the threshold. States with $\lambda_W > M_t(\delta)$ would be in the spectral interior (trapped), while states with $\lambda_W \leq M_t(\delta)$ could be pulled to the analysis by the 4D-Var cycle alone. Whether the observation-poor regions of the atmosphere (Southern Ocean, central Africa) systematically produce states above the Schwarzschild threshold — regions where the calibration defect is too high for the existing observational topology to self-correct.

- Whether **ensemble forecasting** (running $N$ NWP integrations from perturbed initial conditions) has a direct nuclear reading: whether the ensemble spread at lead time $k$ corresponds to the gap $(\sigma^W_{t+k}(\bar{W}_{t+k}), \Delta^W_{t+k}(\bar{W}_{t+k}))$ of the ensemble-mean forecast, and whether the $N$-member ensemble is the empirical sampling of the transfer shadow class $\mathrm{TrShadow}^W_{t+k}$ at each lead time.

- Whether **weather regimes** (NAO positive/negative, atmospheric blocking, Scandinavian pattern) — recurrent quasi-stationary circulation patterns persisting 5–30 days — correspond formally to [Precedent](../../../../../../../../social-science-services-section/services/work-services-section/services/governance-services-section/content/text/glossary/terms/precedent.md) structures in the atmospheric state presheaf: doubly-settled $W^*_t$ elements that are transfer-stable across many independent synoptic-scale extensions. Blocking regimes (weeks of persistence) would have deep prescription depth; ordinary synoptic systems (2–5 days) would have shallow prescription depth. The Fibonacci prescription rate would then predict the growth rate of ensemble spread for each regime type.

- Whether the **observational topology** $J_{\mathrm{obs}}$ can be formally specified as a Grothendieck topology on the history site, and whether the known gaps in the WMO Global Observing System (Southern Ocean, central Africa, deep Arctic, high-altitude tropics) correspond to identifiable holes in the covering families — histories for which no observational sieve achieves global coverage of the atmospheric state.

- Whether the **Held-Suarez idealized GCM** (Held and Suarez 1994, *Bulletin of the American Meteorological Society* 75, 1825–1830) — a minimal atmospheric model with Newtonian temperature relaxation toward a prescribed equilibrium and Rayleigh drag on low-level winds — has a clean nuclear representation: whether the Newtonian relaxation is the saturation nucleus, the Rayleigh drag is a localized restriction map (boundary condition), and the Held-Suarez attractor is the fixed fiber $W^*_t$ of this idealized nuclear pair.

- Whether **numerical diffusion** — the artificial damping introduced by finite-difference NWP discretizations — corresponds to a pathological inflation of the transferring nucleus: if artificial dissipation causes $\Delta^W_t$ to lift well-analyzed states out of $W^*_t$ and into $\mathrm{FreeShadow}^W_t$, then the design criterion for numerically accurate schemes is nuclear fidelity — minimizing the nuclear inflation caused by discretization error, thereby preserving $W^*_t$ under the discrete dynamics.

- Whether the **WMO 30-year Normal period** has a structural justification within the nuclear framework: whether there is a convergence theorem stating that the empirical measure $\mu^{(n)}_{W^*} = (1/n)\sum_{i=1}^n \delta_{W^*_{t_i}}$ converges to a limiting invariant measure $\mu_{W^*}$ on the fixed fiber at a rate determined by the mixing time of the atmospheric attractor — and whether the WMO 30-year standard is an empirical estimate of the mixing timescale.

- Whether **sub-seasonal to seasonal (S2S) predictability** (2–6 weeks) — beyond the Lorenz horizon but before the climatological limit — corresponds to elements of $W_t$ that are in $\mathrm{TrShadow}^W_t$ but whose forward-stability derives not from initial-condition information but from slowly evolving boundary conditions (sea surface temperatures, soil moisture, sea ice extent). If so, S2S forecasting is the process of identifying which elements of $W_t$ are in $\mathrm{TrShadow}$ not because of the current $t$-fiber but because of the transfer structure of the slowly-varying lower-boundary presheaf.
