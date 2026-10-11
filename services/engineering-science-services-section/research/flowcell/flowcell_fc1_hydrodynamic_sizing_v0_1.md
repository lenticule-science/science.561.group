# FlowCell FC-1 Hydrodynamic Sizing Model v0.1

**Date:** 2026-10-01  
**Status:** screening model before CFD/flume data

## 1. Purpose

This model fixes a falsifiable first rotor envelope for FC-1. It intentionally uses simple actuator-disk-style equations so that later CFD, flume and field results have a transparent baseline to beat.

It is **not** a blade-element/momentum model, CFD result, cavitation model, turbulence model, blockage correction or certified load analysis.

## 2. Equations

Swept area:

`A = π D² / 4`

Hydraulic kinetic power through the rotor plane:

`P_water = 1/2 ρ A v³`

Screening electrical output:

`P_e = min(P_rated, 1/2 ρ A Cp η v³)`

where:
- `ρ` = water density;
- `Cp` = rotor power coefficient;
- `η` = generator/drivetrain/power-conversion efficiency represented in this simple model;
- `v` = undisturbed reference current speed;
- `P_rated` = controller/generator output cap.

Axial rotor thrust:

`T = 1/2 ρ A Ct v²`

Target rotor speed at tip-speed ratio `λ`:

`rpm = 60 λ v / (π D)`

Torque requires two distinct screening quantities:

`Q_shaft = P_captured_mechanical / ω`

`Q_export_equiv = P_export / ω`

`Q_shaft` is the aerodynamic-equivalent rotor/generator shaft load only while the assumed `Cp` and target TSR are maintained. `Q_export_equiv` is exported electrical power divided by modeled shaft speed. Once the 1.2 kW export cap is active these are **not the same quantity**. A real above-rated controller must deliberately deload, brake/dump power, or allow TSR/Cp to move; v0.1 does not yet model that control law.

## 3. Screening assumptions

| Parameter | Value |
|---|---:|
| Rotor diameter | 0.60 m |
| Area | 0.283 m² |
| Freshwater density | 1000 kg/m³ |
| Seawater density | 1025 kg/m³ |
| Cp | 0.36 |
| Electrical/mechanical efficiency η | 0.88 |
| Combined Cp×η | 0.317 |
| Ct | 0.80 |
| Target TSR | 4.0 |
| Electrical power cap | 1200 W |
| Cut-in | 1.0 m/s |

`Cp=0.36` is deliberately a screening assumption. It is plausible relative to current commercial machines but is **not** a measured FC-1 coefficient. The design program must replace it with a measured `Cp(λ, Re, blockage, fouling)` surface.

## 4. Why 0.60 m

Candidate rotors at 3.0 m/s freshwater under identical assumptions:

|   rotor_diameter_m |   swept_area_m2 |   uncapped_power_at_3m_s_W |   rotor_thrust_at_3m_s_N |   rpm_at_TSR4_and_3m_s |
|-------------------:|----------------:|---------------------------:|-------------------------:|-----------------------:|
|               0.5  |           0.196 |                        840 |                      707 |                    458 |
|               0.55 |           0.238 |                       1016 |                      855 |                    417 |
|               0.6  |           0.283 |                       1209 |                     1018 |                    382 |
|               0.65 |           0.332 |                       1419 |                     1195 |                    353 |
|               0.7  |           0.385 |                       1646 |                     1385 |                    327 |

A 0.60 m rotor lands almost exactly on the desired ~1.2 kW class without needing a large, awkward wet end. Increasing to 0.70 m raises theoretical power by ~36% but also raises rotor thrust, diameter, transport volume, guard size and debris exposure by the same area scaling.

Therefore **0.60 m is the CAD baseline**, while 0.55 and 0.65 m remain the first sensitivity variants.

## 5. FC-1 screening power/thrust points

| water speed (m/s) | freshwater export (W) | seawater export (W) | freshwater thrust (N) | seawater thrust (N) | target rpm @ TSR 4 | freshwater shaft torque (N·m) | export-equivalent torque (N·m) |
|---:|---:|---:|---:|---:|---:|---:|---:|
| 1 | 44.8 | 45.9 | 113.1 | 115.9 | 127.3 | 3.82 | 3.36 |
| 1.5 | 151.2 | 154.9 | 254.5 | 260.8 | 191 | 8.59 | 7.56 |
| 2 | 358.3 | 367.2 | 452.4 | 463.7 | 254.6 | 15.27 | 13.44 |
| 2.5 | 699.8 | 717.3 | 706.9 | 724.5 | 318.3 | 23.86 | 20.99 |
| 3 | 1200 | 1200 | 1017.9 | 1043.3 | 382 | 34.35 | 30 |
| 3.5 | 1200 | 1200 | 1385.4 | 1420.1 | 445.6 | 46.76 | 25.71 |
| 4 | 1200 | 1200 | 1809.6 | 1854.8 | 509.3 | 61.07 | 22.5 |
| 4.5 | 1200 | 1200 | 2290.2 | 2347.5 | 573 | 77.29 | 20 |
At 3.0 m/s:
- uncapped freshwater electrical power ≈ **1209 W**;
- exported electrical power is capped at **1,200 W**;
- target rotor speed ≈ **382 rpm**;
- aerodynamic-equivalent shaft torque at the assumed `Cp`/TSR ≈ **34.4 N·m**;
- exported-power-equivalent torque ≈ **30.0 N·m**;
- freshwater rotor thrust ≈ **1.02 kN**.

This remains a useful direct-drive PM-generator neighborhood, but the model must not extend the 1.2 kW export cap into a claim that shaft torque falls above rated while `Cp=0.36` and TSR=4 remain fixed. At 4.5 m/s those assumptions imply about **77.3 N·m** aerodynamic-equivalent shaft torque even though exported power remains capped at 1.2 kW. A physically self-consistent above-rated control law is now an explicit open requirement.

## 6. Energy-yield screening

Two cases are shown:

1. **Constant freshwater current**, representative of a river/channel screening calculation.
2. **Idealized reversing tide** with `v(t)=V_peak |sin θ|`, seawater density, 1.0 m/s cut-in and a 1.2 kW cap.

The tidal values are not site forecasts; real tidal harmonics, asymmetry, turbulence, blockage and slack-water duration must come from measured current data.

|   speed_or_peak_speed_m_s |   constant_freshwater_power_W |   constant_freshwater_kWh_day |   idealized_tidal_avg_power_W |   idealized_tidal_kWh_day |   idealized_tidal_MWh_year |
|--------------------------:|------------------------------:|------------------------------:|------------------------------:|--------------------------:|---------------------------:|
|                       1.5 |                           151 |                          3.63 |                            60 |                      1.44 |                       0.52 |
|                       2   |                           358 |                          8.6  |                           152 |                      3.64 |                       1.33 |
|                       2.5 |                           700 |                         16.79 |                           301 |                      7.23 |                       2.64 |
|                       3   |                          1200 |                         28.8  |                           521 |                     12.51 |                       4.56 |
|                       3.5 |                          1200 |                         28.8  |                           658 |                     15.79 |                       5.76 |
|                       4   |                          1200 |                         28.8  |                           740 |                     17.77 |                       6.49 |

The consequence is important:

- A site that occasionally reaches 3 m/s is not equivalent to a river that sits near 3 m/s.
- FC-1 is attractive at moderate currents as a demonstrator, but high annual energy requires either persistent current or sufficiently strong tidal peaks.
- Nameplate power must never be used as an annual-energy shortcut.

## 7. Drag budget

Rotor thrust is not the whole mooring load.

At rated flow:
- rotor thrust ≈ **1018 N**;
- FC-1 allocates no more than **35% of rotor thrust (~356 N)** to frame/guard/tether steady drag before site-specific buoy/wave loads;
- this corresponds to an aggregate rated-flow **CdA budget ≈ 0.079 m²**.

This requirement puts immediate pressure on CAD:
- thin struts;
- aligned structural members;
- minimum frontal guard area;
- short/streamlined exposed tether;
- no decorative enclosure around the rotor.

## 8. Preliminary extreme-load screen

Using a purely provisional **4.5 m/s** current for early structural screening:

- rotor thrust ≈ **2.29 kN**;
- allowing non-rotor current drag at 35% yields ≈ **3.09 kN** steady current load;
- applying a screening dynamic factor of 1.5 yields ≈ **4.64 kN**.

Therefore v0.1 assigns a **6 kN static proof-load requirement** to the primary current load path.

This is deliberately conservative enough for prototype hardware selection but **must be superseded by site-specific IEC load cases** covering waves, turbulence, fatigue, abnormal/fault conditions, transport and anchor/foundation behavior.

## 9. Rotor-speed schedule

At target TSR=4:
- 1.0 m/s → 127 rpm
- 1.5 m/s → 191 rpm
- 2.0 m/s → 255 rpm
- 2.5 m/s → 318 rpm
- 3.0 m/s → 382 rpm

SMART Hydro's commercial 1 m rotor lists 90–230 rpm and maximum output around 3.1 m/s, which corresponds to a tip-speed-ratio neighborhood around four at the top of its stated speed range. This supports TSR≈4 as a reasonable **starting** target, not a FlowCell performance claim.

## 9A. Above-rated consistency correction — 2026-10-04

The original v0.1 table divided **capped exported electrical power** by shaft speed and labeled the result generator torque. That quantity is only an export-equivalent operating point. Above rated, simultaneously holding `Cp=0.36`, TSR=4, and export at 1.2 kW leaves unmodeled mechanical power; treating `1200/ω` as shaft torque therefore understates the load implied by the other assumptions.

This correction does **not** assert that a real FC-1 rotor will see the fixed-`Cp` shaft torques above rated. It establishes the opposite: above-rated torque is currently **unsettled until a control law is specified and tested**. The CSV now carries both the aerodynamic-equivalent shaft torque under the fixed-`Cp`/TSR screen and the exported-power-equivalent torque. Design/load decisions must use the former only as a conservative screen and must replace it with controlled-rotor data as soon as simulation/flume evidence exists.

## 9B. Above-rated control-envelope screen — 2026-10-04

A cheap reversible assay now computes two bounding interpretations without pretending either is the final controller:

1. **Fixed-Cp screen:** keep `Cp=0.36` and TSR=4. This gives a conservative aerodynamic-equivalent shaft load, but it leaves growing mechanical power that a real system must avoid or dissipate.
2. **Pure-deload screen:** keep target TSR and the 1.2 kW electrical export cap, and solve for the lower `Cp` that would make captured mechanical power equal the shaft power needed for that export at `eta=0.88`. This is a required operating target, not evidence that the present fixed-pitch rotor can achieve it.

| speed (m/s) | fixed-Cp shaft torque (N·m) | Cp setpoint under export cap | fixed-Cp excess mechanical power (W) | pure-deload shaft torque (N·m) | export-equivalent torque (N·m) |
|---:|---:|---:|---:|---:|---:|
| 3.0 | 34.35 | 0.3573 | 10.5 | 34.09 | 30.00 |
| 3.5 | 46.76 | 0.2250 | 818.4 | 29.22 | 25.71 |
| 4.0 | 61.07 | 0.1507 | 1893.6 | 25.57 | 22.50 |
| 4.5 | 77.29 | 0.1059 | 3274.1 | 22.73 | 20.00 |

At the provisional 4.5 m/s extreme, holding the electrical export to 1.2 kW without a separate dissipation path would require the rotor/control system to reduce effective `Cp` from 0.36 to about **0.106** under this simplified envelope. If it cannot, roughly **3.27 kW** of the fixed-Cp captured mechanical power is not explained by the present export model and must be handled by a physically specified control/brake/dump/runaway path. These figures are design-screen outputs, not measured loads or proof that a particular control strategy works.

The next controller assay should therefore test at least three explicit strategies—generator-load deload, mechanical/electrical braking with dump dissipation, and a runaway/failed-brake case—against rotor speed, shaft torque, thrust, thermal load, and fail-safe requirements.

## 10. What CFD/flume work must answer

Before blade geometry is frozen:

1. `Cp(λ)` and `Ct(λ)` for clean rotor.
2. Sensitivity to blade pitch/chord/twist and Reynolds number.
3. Reversing-flow / yaw behavior.
4. Frame and guard interference.
5. Turbulence intensity sensitivity.
6. Free-surface and bottom-clearance sensitivity.
7. Blockage correction in test facilities.
8. Debris-strike response.
9. Cavitation inception margin.
10. Fouling roughness sensitivity.
11. Startup torque and self-start behavior.
12. Generator-loading schedule that maximizes energy while preserving structural and acoustic limits.

## 11. First flume test matrix

Minimum matrix after a scale or full-size rotor exists:

- speeds: 0.75, 1.0, 1.25, 1.5, 2.0, 2.5, 3.0 m/s as facility permits;
- TSR targets: 2, 3, 4, 5, 6;
- measure torque, RPM, electrical output, axial thrust, vibration and upstream/current-plane velocity;
- repeat selected points in reversed orientation/current;
- repeat after deliberate surface roughness/fouling surrogate;
- test brake/dump-load transitions at 2.0 and 3.0 m/s;
- test one sensor-failure case while shadow fault logic runs.

## 12. Immediate CAD implications

Freeze for CAD v0:
- 0.60 m rotor envelope;
- 3-blade axial baseline;
- rated-point hub/generator capability of at least 40 N·m remains a useful minimum, **but is not an above-rated shaft-load requirement**;
- before shaft/generator sizing is frozen, define an above-rated control/load envelope (deload, brake/dump, overspeed/runaway) and either prove shaft torque stays within the selected design limit or size to the larger screened load;
- shaft/bearing system capable of ≥1.5 kN rated-flow axial load before structural factors;
- primary external load path proofed to 6 kN;
- frame/guard design constrained by CdA budget;
- no permanent shroud until flume data proves energy benefit exceeds drag/debris penalty;
- current-alignment/yaw architecture must be explicit;
- generator mounting and bearing/seal cartridge must be service-removable;
- rotor positive lock for deck handling.

## 13. Sources

- IEC TS 62600-2:2019 — https://webstore.iec.ch/en/publication/62399
- IEC TS 62600-201:2025 — https://webstore.iec.ch/en/publication/66064
- IEC TS 62600-200:2013 — https://webstore.iec.ch/en/publication/7242
- IEC TS 62600-202:2022 — https://webstore.iec.ch/en/publication/27906
- SMART Hydro Free Stream — https://www.smart-hydro.de/renewable-energy-systems/hydrokinetic-turbines-river-canal/
- Guinard P66 — https://www.guinard-energies.bzh/en/our-products/p66-hydrokinetic-turbine-3-5-kw/
- St. Anthony Falls Laboratory main channel — https://cse.umn.edu/safl/main-channel