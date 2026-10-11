# FlowCell FC-1 Engineering Requirements + Preliminary FMEA v0.1

**Date:** 2026-10-01  
**Status:** pre-CAD / screening baseline  
**Purpose:** Freeze enough of FC-1 to support CAD, supplier RFQs, bench testing, and controlled-water testing without pretending that unmeasured coefficients or site loads are final.

## 1. Product definition

FC-1 is a retrievable, instrumented water-current electricity converter intended for early freshwater and saltwater field pilots. It is a **current-energy device**, not specifically a tidal device. The first version is designed to be deployed and retrieved from a small work boat with a winch, without requiring divers for routine service.

The initial storage system is external and commercially mature. Experimental IonCell / MineralCell storage remains a parallel R&D cartridge and is not allowed to become a launch-critical dependency.

## 2. Frozen screening design point

| Parameter | FC-1 v0.1 |
|---|---:|
| Rotor topology | Open axial-flow, 3-blade baseline |
| Rotor diameter | **0.60 m** |
| Swept area | **0.283 m²** |
| Rated electrical power | **1.2 kW** |
| Rated water speed | **3.0 m/s** |
| Control cut-in | **1.0 m/s** provisional |
| Target tip-speed ratio | **4.0** |
| Target rotor speed at rated flow | **382 rpm** |
| Rated aerodynamic-equivalent rotor/generator shaft torque (fixed-Cp/TSR screen) | **34.4 N·m** |
| Rated export-equivalent torque (`P_export/ω`) | **30.0 N·m** |
| Rated rotor axial thrust, freshwater | **1018 N** |
| Provisional screening extreme current | **4.5 m/s** |
| Screening 6 kN structural proof requirement | **6.0 kN** |
| Water types | Freshwater + seawater |
| Installation | Subsurface/current-aligned pod with seabed reaction; surface/retrieval hardware as site requires |
| Routine recovery | Boat + ≤250 kg WLL winch target; no diver required |
| Seasonal ice | **Recover before ice** for v1; no overwinter-under-ice claim |

These values are **engineering assumptions to be falsified by CFD/flume/field work**, not certified ratings.

**Torque interpretation correction (2026-10-04):** the original 30.0 N·m row was `P_export/ω` at the 1.2 kW export cap, not the fixed-`Cp` rotor shaft load. At 3.0 m/s the screening model gives about 34.4 N·m aerodynamic-equivalent shaft torque and 30.0 N·m export-equivalent torque. Above rated, the difference widens until an explicit control law replaces the fixed-`Cp`/TSR screen; see HYD-009.

## 3. Standards and external benchmark basis

- **IEC TS 62600-2:2019** applies design-integrity requirements to tidal and river current converters and explicitly treats normal, fault, parked, extreme, transport, serviceability, ultimate, fatigue and accidental conditions.
- **IEC TS 62600-201:2025** provides the current tidal-resource assessment methodology used with power performance to estimate annual energy production.
- **IEC TS 62600-200:2013** defines tidal/current converter power-performance assessment and power-curve reporting.
- **IEC TS 62600-202:2022** supplies a staged pre-prototype testing framework from hydraulic laboratory work through scaled open-water trials.
- Commercial benchmarks bracket FC-1's assumptions: SMART Hydro's 1 m Free Stream unit is rated to 5 kW and operates at 90–230 rpm with maximum output around 3.1 m/s; Guinard's P66 is rated 3.5 kW at 3 m/s, weighs 90 kg and lists a 1.2 m/s minimum current.

## 4. Traceable requirements

### SYS — system

| ID | Requirement | Verification |
|---|---|---|
| SYS-001 | FC-1 **shall** generate usable electrical power from steady freshwater or seawater currents without requiring a dam or pressure head. | Flume + field test |
| SYS-002 | FC-1 **shall** be operable as an off-grid generator with an external dry-end ESS/inverter. | Integration test |
| SYS-003 | Routine deployment and recovery **shall not require a diver**. | Demonstration |
| SYS-004 | Launch product functionality **shall not depend on experimental mineral/ion storage**. | Design review |
| SYS-005 | All stated power ratings **shall be tied to measured water velocity at the rotor plane or an IEC-compatible reference location**. | Test audit |

### HYD — rotor and hydrodynamics

| ID | Requirement | Verification |
|---|---|---|
| HYD-001 | Baseline rotor diameter **shall be 0.60 m ± manufacturing tolerance** until CFD/flume evidence justifies change control. | Inspection |
| HYD-002 | The design target **shall be 1.2 kW electrical at 3.0 m/s** in freshwater at the dry-end measurement point. | Flume |
| HYD-003 | Control cut-in **shall initially be 1.0 m/s** and may be raised if parasitic/control losses make lower-speed operation net-negative. | Dyno + flume |
| HYD-004 | The baseline controller **shall target TSR ≈ 4** over the primary operating range unless measured Cp indicates a better schedule. | RPM/flow test |
| HYD-005 | Total non-rotor steady drag at 3.0 m/s **shall not exceed 35% of measured rotor thrust**. | Tow/flume test |
| HYD-006 | Baseline non-rotor drag budget corresponds to **CdA ≤ 0.079 m²** at rated flow before tether/buoy site-specific allowances. | Geometry + tow test |
| HYD-007 | Rotor, frame and tether arrangement **shall tolerate flow reversal or permit passive/current-commanded realignment** without manual underwater intervention. | Reversing-flow test |
| HYD-008 | No cavitation-free claim **shall** be made until pressure/visual/acoustic evidence covers the intended operating envelope. | Flume/field |
| HYD-009 | Before shaft/generator sizing is frozen, the above-rated controller **shall** have a defined deload/brake/dump/overspeed load envelope; capped exported electrical power **shall not** be used as a proxy for rotor shaft torque above rated. | Control model + dyno/flume |
| HYD-010 | Above-rated stopping/control evidence **shall** distinguish normal controlled deload/shutdown, fast protective shutdown, and emergency/runaway arrest; each state shall record rotor speed, shaft torque, electrical/DC-bus load, brake/dump path, thermal burden, and whether the mechanism is repeatable or sacrificial. | Control model + dyno/flume + fault injection |
| HYD-011 | Performance, control, and load-envelope evidence intended for site extrapolation **shall** characterize inflow unsteadiness (at minimum mean speed and turbulence intensity, plus a temporal/spectral fluctuation descriptor). Steady-flow Cp/control results shall not be generalized to turbulent-site fatigue, shaft/generator-load, or power-quality behavior without representative turbulent-flow evidence. | Turbulent flume/field + signal analysis |
| HYD-012 | Any model/flume-to-FC-1 performance or load extrapolation **shall** report test-section blockage ratio and the relevant Reynolds-number range. Scale-model Cp/Ct/load results shall not be promoted to full-scale values unless blockage and Reynolds/scale effects are either corrected with a justified method or carried forward as an explicit uncertainty bracket. | Geometry audit + Reynolds/blockage analysis + corrected comparison |
| HYD-013 | Site/flume fatigue, peak-load or durability transfer for shallow, near-surface, floating or array-relevant deployment **shall characterize representative wave climate, rotor submergence and combined wave-current loading**; steady-current evidence alone shall not be generalized to wave-current peak/fatigue loads. | Wave/current tank or field spectra + load-cycle/DEL analysis |
| HYD-014 | Bidirectional/reversing-flow performance and load claims **shall characterize flood/ebb flow-direction misalignment and support/foundation shadowing** for the actual support geometry. Aligned free-stream Cp/Ct shall not be generalized across the reversed half-cycle when the rotor operates in a support wake or under materially different yaw/misalignment. | Directional site statistics + reversed/yawed flume/CFD cases + blade/thrust fluctuation analysis |

### MEC — structure, mooring, deployment

| ID | Requirement | Verification |
|---|---|---|
| MEC-001 | Primary current load **shall react to seabed/shore mooring hardware**, not to an ordinary service boat during unattended operation. | Design review |
| MEC-002 | Primary structural load path and retention hardware **shall survive a 6 kN axial static proof load** without fracture or release; final site design may require more. | Proof test |
| MEC-003 | Mooring design **shall be recalculated for every field site** using measured current extremes, water depth, bottom condition, waves/ice as applicable, buoy/tether drag and navigation exposure. | Site design review |
| MEC-004 | Routine wet-end mass **should be ≤65 kg per manually handled component**; heavier assemblies shall have defined lifting points and winch procedure. | Inspection/demo |
| MEC-005 | All lifting/recovery points **shall be physically distinct or clearly rated** so that operators cannot accidentally lift from an electrical cable. | Inspection |
| MEC-006 | Rotor **shall be positively locked/braked during launch, retrieval and deck handling**. | Functional test |
| MEC-007 | Rotor start **shall be inhibited** when the device is in handling/service mode. | Control test |
| MEC-008 | FC-1 v1 **shall be seasonally recoverable before lake/river ice**; overwinter-under-ice use is outside the initial operating envelope. | Documentation |

### ELEC — generator and power

| ID | Requirement | Verification |
|---|---|---|
| ELEC-001 | Wet end **shall use a three-phase permanent-magnet generator baseline** unless supplier evidence favors an alternative. | Design inspection |
| ELEC-002 | Generator/cable selection **shall keep full-load wet-cable conductor current below 10 A per phase** at rated output where practical. | Electrical test |
| ELEC-003 | Dry end **shall provide rectification, controllable loading/MPPT, overvoltage protection, electrical braking and a dump-load path independent of the ESS accepting charge**. | HIL + fault test |
| ELEC-004 | A single ESS or inverter disconnect/fault **shall not leave the turbine without an overspeed protection path**. | Fault injection |
| ELEC-005 | Wet electrical insulation **shall be continuously or periodically monitored for leakage/ground-fault degradation**. | Electrical safety test |
| ELEC-006 | Underwater connectors **shall be subsea/wet-environment rated for their actual use; dry-mate connectors shall not be treated as wet-mate connectors**. | BOM/design audit |
| ELEC-007 | External customer-facing storage for v1 **shall use an independently safety-certified commercial product appropriate to the destination market**. | Certification audit |

### CTRL/DATA — controls and instrumentation

| ID | Requirement | Verification |
|---|---|---|
| CTRL-001 | Controller **shall fail toward a bounded rotor state** on communications loss. | Fault injection |
| CTRL-002 | Overspeed detection **shall not depend on one telemetry sensor alone**. | FMEA + test |
| CTRL-003 | The device **shall log** timestamped RPM, electrical power, phase/current data, controller state, brake state, relevant temperatures, insulation/leak state and fault events. | Data audit |
| CTRL-004 | Field validation **shall include an independent water-velocity measurement**, not infer flow only from rotor RPM/power. | Field test |
| CTRL-005 | The control/data schema **shall preserve contradictory sensor evidence** rather than silently overwrite it, enabling FOUR/sheaf experiments alongside conventional controls. | Software test |
| CTRL-006 | Experimental relational fault logic **shall run shadow-mode until it meets preregistered performance criteria against conventional fault detection**. | Comparative test |

### MAT — materials and environmental durability

| ID | Requirement | Verification |
|---|---|---|
| MAT-001 | Every wetted metallic junction **shall be reviewed for galvanic compatibility in both freshwater and seawater.** | Materials review |
| MAT-002 | Dissimilar conductive materials **shall use isolation/coating/cathodic strategy where galvanic risk is material.** | Inspection |
| MAT-003 | Seals, potting and cable jackets **shall be screened for freshwater and saltwater immersion, UV where exposed, and intended temperature range.** | Coupon/immersion tests |
| MAT-004 | Biofouling **shall be treated as a performance and maintenance load**, with baseline inspection/cleaning intervals determined empirically. | Field inspection |
| MAT-005 | No coating or antifouling chemistry **shall be selected solely on power retention without environmental/regulatory review.** | Design review |

### TEST — development and evidence

| ID | Requirement | Verification |
|---|---|---|
| TEST-001 | Every power-curve release **shall state Cp/efficiency assumptions or measured values, water density, velocity-reference method and uncertainty.** | Report audit |
| TEST-002 | DVT release **shall require ≥100 cumulative wet operating hours** across controlled and/or field testing. | Test log |
| TEST-003 | DVT release **shall require at least 10 deployment/retrieval cycles** without loss of primary retention or sealing function. | Test log |
| TEST-004 | Early testing **shall follow the stage logic of IEC TS 62600-202:2022** where applicable. | Test-plan review |
| TEST-005 | Site energy predictions **shall integrate the measured current-speed distribution through the measured power curve** rather than multiply nameplate power by time. | Analysis audit |

## 5. Preliminary FMEA

Scales are provisional: **Severity (S), Occurrence (O), Detection difficulty (D): 1–5; RPN = S×O×D.** This ranks attention only; it is not a certification method.

| Failure mode | Effect | S | O | D | RPN | Primary design action |
|---|---|---:|---:|---:|---:|---|
| Galvanic/corrosion attack | Structural/electrical failure | 4 | 3 | 4 | **48** | Isolation map, coupons, sacrificial/cathodic strategy, inspection |
| Surface-buoy / vessel interaction | Injury, loss, navigation hazard | 5 | 2 | 4 | **40** | Minimize surface gear, marking, siting, retrieval architecture |
| Bearing degradation | Seizure, rotor damage, lost production | 4 | 3 | 3 | **36** | Sealed bearing strategy, vibration/current signature monitoring, retrieval interval |
| Biofouling | Power loss, imbalance, sensor degradation | 3 | 4 | 3 | **36** | Fouling monitoring, cleanable geometry, coating trial |
| Bad flow measurement | False performance/AEP claims | 3 | 3 | 4 | **36** | Independent ADCP/current meter, calibration, uncertainty reporting |
| Turbulence spectrum mismatch / steady-flow extrapolation | Understated fatigue, control effort and power-quality variability | 4 | 4 | 4 | **64** | Measure turbulence intensity/spectrum; turbulent-flow replay; compare filtered/unfiltered control response |
| Flume blockage / Reynolds-scale mismatch | False Cp/Ct or load transfer from model article to FC-1 | 4 | 4 | 4 | **64** | Record blockage ratio and Reynolds range; justified correction/scaling or explicit uncertainty bracket |
| Wave-current / submergence mismatch | Understated cyclic/peak loads and fatigue life | 4 | 4 | 4 | **64** | Representative wave-current cases; submergence sweep; DEL/load spectra; array-interaction check |
| Flood/ebb misalignment or support-shadow mismatch | Overstated bidirectional Cp and understated blade/thrust fluctuations | 4 | 4 | 4 | **64** | Site direction distribution; yaw/reversal sweep; support-shadow CFD/flume cases; fairing/yaw strategy comparison |
| Debris impact/jam | Blade/frame damage, overload | 4 | 4 | 2 | **32** | Debris-tolerant blades/guard geometry, torque/RPM fault logic |
| Mooring/anchor failure | Device loss / navigation hazard | 5 | 2 | 3 | **30** | Site-specific anchor design, proof load, redundant retention where warranted |
| Rotor overspeed / brake failure | Mechanical/electrical damage | 5 | 2 | 3 | **30** | Independent dump/brake path, overspeed sensors, fault test |
| Tether/cable entanglement | Damage, navigation/ecological hazard | 5 | 2 | 3 | **30** | Minimize exposed line, tension management, routing, site review |
| Retrieval failure | Lost prototype / prolonged hazard | 3 | 3 | 3 | **27** | Secondary recovery point, documented recovery method |
| Seal/water ingress | Generator/sensor failure | 4 | 3 | 2 | **24** | Pressure/immersion test, leak sensing, replaceable sealed modules |
| Cavitation/erosion | Blade damage, noise, efficiency loss | 3 | 2 | 4 | **24** | TSR limit, inspect/acoustic test, geometry iteration |
| Cross-environment material incompatibility | Premature aging | 3 | 2 | 4 | **24** | Separate FW/SW qualification matrices |
| Ice exposure outside envelope | Loss / structural failure | 5 | 2 | 2 | **20** | Seasonal recovery requirement and calendar lockout |
| Electrical leakage/ground fault | Shock/corrosion/fire risk | 5 | 2 | 2 | **20** | Isolation monitor/GFI strategy, bonding study, shutdown logic |
| Dump-load/DC-bus protection failure | Overvoltage/overspeed | 4 | 2 | 2 | **16** | Independent clamp/brake path and fault-injection test |
| External ESS thermal event | Fire / equipment loss | 5 | 1 | 2 | **10** | Certified ESS, separation, manufacturer installation rules |
| Communications loss | Loss of remote observability | 2 | 3 | 1 | **6** | Autonomous safe state + local logging |

### FMEA-driven design priorities before CAD freeze

1. **Corrosion/galvanic architecture** must be designed, not left to coatings after CAD.
2. **Surface hardware should be minimized.** The buoy is a service/retrieval aid, not necessarily where the turbine's reaction load terminates.
3. **Bearing and seal modules should be replaceable** without replacing the whole wet end.
4. **Independent braking/dump loading is mandatory** before open-water testing.
5. **Flow instrumentation is part of the product-development apparatus**, because without it we cannot know whether design changes actually improved Cp or just encountered different water.

## 6. Preliminary load screen

At the frozen 0.60 m rotor and Ct=0.80:

- Rated rotor thrust at 3.0 m/s freshwater: **1.02 kN**.
- Rotor thrust at 4.5 m/s freshwater: **2.29 kN**.
- If non-rotor steady drag is held to 35% of rotor thrust, total steady current load at 4.5 m/s is about **3.09 kN** before waves, buoy loads, turbulence and shock.
- Applying a **screening-only** dynamic multiplier of 1.5 gives ~**4.64 kN**, motivating the **6 kN proof target**.

This is **not** a final IEC design load. Site-specific extreme current, waves, turbulence, tether geometry, buoy load, bottom condition and fatigue cycles must replace the screening case before field deployment.

## 7. Sources

- IEC TS 62600-2:2019 — https://webstore.iec.ch/en/publication/62399
- IEC TS 62600-201:2025 — https://webstore.iec.ch/en/publication/66064
- IEC TS 62600-200:2013 — https://webstore.iec.ch/en/publication/7242
- IEC TS 62600-202:2022 — https://webstore.iec.ch/en/publication/27906
- Guinard P66 — https://www.guinard-energies.bzh/en/our-products/p66-hydrokinetic-turbine-3-5-kw/
- SMART Hydro Free Stream — https://www.smart-hydro.de/renewable-energy-systems/hydrokinetic-turbines-river-canal/
- OSTEC PTO design/integration/commissioning, EWTEC 2025, DOI 10.36688/ewtec-2025-1095 — comparator for normal/fast/emergency shutdown distinctions; not FC-1 validation.
- 2026 individual blade-pitch tidal-current-turbine semi-physical control study, Renewable Energy 256, 124353 — method comparator for separate power/load control evidence; not FC-1 validation.
- FERC hydrokinetic projects — https://www.ferc.gov/licensing/hydrokinetic-projects
- FERC pilot licensing — https://www.ferc.gov/licensing/hydrokinetic-pilot-project-licensing-process
- Tethys Engineering biofouling review (2026) — https://tethys-engineering.pnnl.gov/publications/long-term-deployment-marine-current-turbines-review-biofouling-effects-performance
- Han & Banerjee, *Wake momentum recovery of a horizontal axial tidal turbine under turbulence*, Phys. Rev. Fluids 10, 104601 (2025), DOI 10.1103/mg6l-ch54 — evidence that inflow turbulence changes wake recovery and is associated with increased rotor fatigue loading; not FC-1 validation.
- Ortega Malca et al., *Electro-mechanical tide-to-wire model of a horizontal-axis tidal turbine undergoing turbulent flow*, Ocean Engineering 343, 123272 (2026), DOI 10.1016/j.oceaneng.2025.123272 — coupled turbulence/control comparator showing mechanical/electrical variability and mitigation by control-signal filtering; not FC-1 validation.
- Dehtyriov, Vogel & Willden, *A two-scale blockage correction for an array of tidal turbines*, International Marine Energy Journal 8(1), 101–108 (2025), DOI 10.36688/imej.8.101-108 — laboratory blockage-correction method evidence; not FC-1 validation.
- Min et al., *Prediction of Scale Effects on Tidal Turbines with the Reynolds Scaling Method*, Journal of Marine Science and Engineering 14, 893 (2026), DOI 10.3390/jmse14100893 — evidence that Reynolds number varies materially with velocity/scale even at fixed TSR and therefore bounds model-to-full-scale transfer; not FC-1 validation.
- Xu et al., *Experimental analysis of hydrodynamic loadings on stationary tidal turbines under wave conditions*, Journal of Ocean Engineering and Marine Energy (2026), DOI `10.1007/s40722-026-00511-3` — physical-wave-tank evidence that fatigue-equivalent loads depend strongly on wave condition and submergence, and that twin-turbine/array geometry can amplify loads; external comparator, not FC-1 validation.
- *Performance and fatigue analysis of a tidal turbine under wave–current interactions*, Energy (2026), DOI `10.1016/j.energy.2026.141232` — current wave-current/fatigue study retained as an independent literature anchor for HYD-013; not FC-1 validation.
- Townley et al., *Modelling the impact of the foundation shadow effect and flow misalignment disparity on tidal stream turbine performance*, Ocean Engineering 363 (2026) 125873, DOI `10.1016/j.oceaneng.2026.125873` — validated-CFD comparator showing foundation-shadow and yaw/misalignment effects on power/thrust fluctuations in bidirectional tidal configurations; basis for HYD-014, not FC-1 validation.