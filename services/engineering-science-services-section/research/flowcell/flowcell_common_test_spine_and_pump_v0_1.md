# FlowCell Common Dry-Side Test Spine + T3 Pump Cartridge v0.1

**Date:** 2026-10-01  
**Status:** build baseline

## Common idea

Keep precision hardware dry. The water-facing specimen contains only the mechanism needed to answer the hydrodynamic question.

## A. Rotary reaction dynamometer

Architecture:

`wet rotor -> shaft -> coupling -> PM generator on pivot cradle -> 100 mm torque arm -> 5 N load cell`

Torque:

`tau = F * L`

Design range:
- torque: 0–0.20 N·m
- lever arm: 100 mm
- full-scale reaction force: 2.0 N
- recommended load cell: 0–5 N
- generator/brake: >=20 W continuous, >=40 W intermittent, 0–1500 rpm, >=0.25 N·m shaft capability

Rotor screening points:

|   flow_m_s |   target_rpm_TSR4 |   screen_electrical_W |   screen_torque_Nm |   reaction_force_at_100mm_N |
|-----------:|------------------:|----------------------:|-------------------:|----------------------------:|
|       0.5  |               253 |                  0.29 |             0.0109 |                       0.109 |
|       0.75 |               379 |                  0.97 |             0.0245 |                       0.245 |
|       1    |               506 |                  2.3  |             0.0435 |                       0.435 |
|       1.25 |               632 |                  4.5  |             0.0679 |                       0.679 |
|       1.5  |               759 |                  7.78 |             0.0978 |                       0.978 |

A specialized rotary torque sensor can later validate the reaction rig, but it is not required for first EVT work.

Calibration:
1. lock shaft;
2. apply known force/weight to torque arm;
3. calibrate 0/25/50/75/100%;
4. reverse direction for hysteresis;
5. map fixture drag versus RPM;
6. subtract fixture losses from specimen results.

## B. Linear PTO

For FinCell:
- ±60 mm travel
- ±50 N design force
- displacement resolution <=0.1 mm
- adjustable spring/damping
- hard stops outside test travel

Mechanical power:
`P = F * velocity`

For ReedCell:
- inline x ±30 mm
- cross-flow y ±60 mm
- independent spring/damping on each axis

## C. VascularReef pump cartridges

Build two chambers:

**P0:** simple diaphragm/bellows control.  
**P1:** Kresling-inspired compliant/origami challenger.

P1 only matters if it beats P0.

### P0 screening geometry

- active diameter: 50 mm
- stroke: 12 mm
- geometric displacement: 23.6 mL/stroke
- planning volumetric efficiency: 60%
- effective planning displacement: 14.1 mL/stroke
- initial pressure range: 0–50 kPa gauge
- independent mechanical relief <=60 kPa

Screening output:

|   frequency_Hz |   effective_displacement_ml_per_stroke |   flow_L_min |   pressure_kPa |   hydraulic_power_W |
|---------------:|---------------------------------------:|-------------:|---------------:|--------------------:|
|            0.5 |                                   14.1 |         0.42 |             10 |                0.07 |
|            0.5 |                                   14.1 |         0.42 |             20 |                0.14 |
|            0.5 |                                   14.1 |         0.42 |             30 |                0.21 |
|            0.5 |                                   14.1 |         0.42 |             50 |                0.35 |
|            1   |                                   14.1 |         0.85 |             10 |                0.14 |
|            1   |                                   14.1 |         0.85 |             20 |                0.28 |
|            1   |                                   14.1 |         0.85 |             30 |                0.42 |
|            1   |                                   14.1 |         0.85 |             50 |                0.71 |
|            1.5 |                                   14.1 |         1.27 |             10 |                0.21 |
|            1.5 |                                   14.1 |         1.27 |             20 |                0.42 |
|            1.5 |                                   14.1 |         1.27 |             30 |                0.64 |
|            1.5 |                                   14.1 |         1.27 |             50 |                1.06 |
|            2   |                                   14.1 |         1.7  |             10 |                0.28 |
|            2   |                                   14.1 |         1.7  |             20 |                0.57 |
|            2   |                                   14.1 |         1.7  |             30 |                0.85 |
|            2   |                                   14.1 |         1.7  |             50 |                1.41 |

At about 1 Hz and tens of kPa, one little chamber is in the order-one-watt hydraulic range. Four branches are enough for a measurable shared-PTO experiment.

### P0 construction

- rigid removable end plates;
- clamped silicone or polyether-polyurethane diaphragm;
- inlet + outlet low-cracking-pressure check valves;
- branch pressure sensor;
- bleed/drain;
- mechanical compression pad.

### P1 construction

Keep the same ports, sensors, and envelope. Change only the compliant chamber geometry.

Published Kresling pump work and Cornell's 2026 soft marine harvester justify this comparison, but commercial geometry will need freedom-to-operate review.

## D. Leaf-to-pump coupling

`flexible leaf -> adjustable lever -> pump compression pad`

Lever ratios:
- 0.5:1
- 1:1
- 2:1

Measure:
- leaf force/displacement;
- pump displacement;
- branch pressure;
- branch flow.

Pump efficiency:
`eta_pump = (DeltaP * q) / (F_leaf * v_leaf)`

## E. Four-branch manifold

`4 pump branches -> isolation/checks -> common pressure header -> compliant accumulator -> calibrated hydraulic load`

First compare mechanical-to-hydraulic conversion. Add a hydraulic motor/generator only after the hydraulic accounting is stable.

## Acceptance

### Spine
- calibration residual <=2% FS over 0–0.2 N·m
- repeatability <=1% FS
- stable drag map
- working emergency brake/stop

### P0
- no leak for 30 min at 50 kPa
- self-primes
- >=10 mL effective displacement/cycle at low backpressure
- positive measured hydraulic efficiency

### P1
- passes P0 safety/leak criteria
- improves displacement/force, efficiency, fatigue, overload survival, or package volume without an unacceptable trade

### Four-branch reef
- all four feed common header
- one branch can be disabled without stopping the others
- bounded pressure
- positive average hydraulic power at shared load

## First fabrication order

1. ~600 mm aluminum-extrusion spine
2. pivoting PM-generator cradle
3. 100 mm torque arm + 5 N load-cell bracket
4. common specimen plate
5. P0 50 mm diaphragm pump
6. valve/manifold block
7. four-branch low-pressure manifold
8. adjustable leaf/pump linkage
9. P1 origami chamber

## External anchors

- Small hydrokinetic motor/torque-sensor test setup:
  https://www.mdpi.com/2076-3417/14/16/7164
- Miniature rotary torque sensor range:
  https://absolutegauge.com/product/dr-2494-miniature-torque-sensor/
- PM-generator dynamometer example:
  https://sce.nau.edu/capstone/projects/ME/2025/SP25toF25_CWCGen/assets/documents/reports/final-lab-report.pdf
- Cornell soft marine-energy pump:
  https://www.sciencedirect.com/science/article/pii/S2666998626001183
- Cornell Organic Robotics Lab:
  https://orl.mae.cornell.edu/
- Kresling pump-chamber study:
  https://www.sciencedirect.com/science/article/abs/pii/S0955598624001821