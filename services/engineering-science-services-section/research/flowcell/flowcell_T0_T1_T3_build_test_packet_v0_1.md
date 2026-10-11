# FlowCell Tournament — T0/T1/T3 Build & Test Packet v0.1

**Date:** 2026-10-01  
**Status:** pre-fabrication experiment specification  
**Objective:** obtain comparable physical evidence before committing FlowCell to a rotor, oscillating foil, VIV harvester, or shared hydraulic architecture.

## 1. Common physical envelope

First-generation tournament articles use a nominal **projected/swept area of 0.018 m²**.

Reference RotorCell diameter:

`D = sqrt(4A/π) = 0.151 m` (~151 mm)

This is deliberately close to the **0.15 m model turbine scale previously used at the University of Minnesota St. Anthony Falls Laboratory** for hydrokinetic research.

The first controlled-flow matrix is:

- 0.50 m/s
- 0.75 m/s
- 1.00 m/s
- 1.25 m/s
- 1.50 m/s

Higher speeds are optional only after structural inspection.

## 2. Why this scale

At A=0.018 m² in freshwater:

|   speed_m_s |   water_power_through_ref_area_W |   rotor_screen_electrical_W |   rotor_screen_thrust_N |   rotor_target_rpm_TSR4 |
|------------:|---------------------------------:|----------------------------:|------------------------:|------------------------:|
|        0.5  |                             1.12 |                        0.29 |                    1.8  |                     252 |
|        0.75 |                             3.8  |                        0.97 |                    4.05 |                     378 |
|        1    |                             9    |                        2.3  |                    7.2  |                     505 |
|        1.25 |                            17.58 |                        4.5  |                   11.25 |                     631 |
|        1.5  |                            30.38 |                        7.78 |                   16.2  |                     757 |

This produces watt-scale output rather than milliwatts while keeping hydrodynamic loads in a manageable laboratory range.

The rotor numbers above use **screening assumptions only**:
- Cp = 0.32
- drivetrain/electrical efficiency = 0.80
- Ct = 0.80
- TSR = 4

They are not expected measurements.

## 3. Common instrumentation constitution

Every morphology uses the same synchronized data framework.

### Required channels

**Environment**
- reference water velocity;
- water temperature;
- water depth / test-section geometry;
- conductivity if saltwater/synthetic-water tests are used.

**Mechanical**
- streamwise load;
- morphology-specific reaction:
  - rotor torque, or
  - foil/flap linear force and displacement, or
  - VIV displacement and restraint force, or
  - hydraulic pressure and volume flow;
- vibration/acceleration where meaningful.

**Electrical**
- generator/load voltage;
- generator/load current;
- electrical output power;
- parasitic electrical input.

**State**
- RPM or oscillation frequency;
- pitch/heave/displacement;
- hydraulic accumulator pressure where present;
- valve state;
- controller mode.

### Sampling

- synchronized raw acquisition target: **≥1 kHz** for force/torque/displacement/electrical channels;
- flow-reference sampling may be slower if instrument-limited, but timestamps must align;
- preserve raw traces;
- derive 10 Hz and 1 Hz downsampled products after capture;
- high-speed video target: ≥120 fps for morphology/phase analysis when available.

### Calibration

Before each campaign:
- zero load cells submerged or in the mounted test condition;
- torque calibration with known lever arm + weights or traceable calibrator;
- voltage/current calibration against bench references;
- pressure sensor calibration;
- flow instrument facility calibration/current certificate recorded.

## 4. Common test procedure

For each configuration and flow speed:

1. inspect specimen and fasteners;
2. zero sensors;
3. establish target flow;
4. allow flow to stabilize;
5. run morphology at unloaded/free condition where safe;
6. sweep PTO/load through operating range;
7. identify the maximum **net** power operating point;
8. hold that point for 60 s minimum;
9. repeat three independent runs;
10. inspect for looseness, permanent deformation, leakage, wear or heating.

Report median and spread, not a single best run.

## 5. Common derived metrics

### Net power

`P_net = P_exported - P_controller - P_actuation - P_auxiliary`

Do not hide actuator/control consumption.

### Resource-normalized conversion

For comparison only:

`C_system = P_net / (0.5 ρ A_ref v³)`

Do not call this rotor Cp for non-rotor devices.

### Load-normalized output

`L = P_net / mean streamwise load`

Units: W/N.

This is a first-order proxy for energy earned per mooring burden.

### Wet-mass output

`M = P_net / wet mass`

### Interface tax

Count:
- bearings;
- dynamic seals;
- submerged electrical connectors;
- valves;
- hoses;
- exposed precision gaps;
- independently actuated DOFs.

Report count and failure modes; do not invent one magic weighting yet.

## 6. T0 — RotorCell reference article

### Geometry

- 3-blade axial rotor;
- diameter: **151 mm nominal**;
- hub diameter target: ≤25% rotor D;
- open rotor, no duct for baseline;
- fixed pitch for T0;
- removable blade set;
- streamlined support.

### Generator/PTO

For the tournament specimen, do **not** optimize a bespoke alternator yet.

Use either:
- small reversible PM machine used as generator; or
- shaft torque sensor + controllable magnetic/electrical dynamometer.

The experiment must allow systematic load sweeps.

### Control variable

Target TSR points:
- 2
- 3
- 4
- 5
- 6

Primary outputs:
- power-vs-TSR;
- thrust-vs-TSR;
- peak/mean torque;
- startup behavior.

### T0 acceptance

T0 is accepted when:
- repeatability at each primary operating point is within ±10% net power across three runs;
- flow reference is recorded independently;
- no structural damage after matrix;
- raw datasets are complete.

T0 exists to define the benchmark, not to win.

## 7. T1A — FinCell

### Geometry

Reference rectangular envelope:
- span ≈ 150 mm;
- chord ≈ 120 mm;
- nominal planform ≈ 0.018 m².

Start with a symmetric foil section or simple symmetric printed/formed profile.

Two versions:
1. rigid foil;
2. controlled-flexibility foil with identical outer geometry and similar mass.

### Motion

First controlled mode:
- pitching + heaving if rig allows;
- otherwise passive pitch with constrained heave/linear PTO.

Record:
- pitch angle;
- heave displacement;
- oscillation frequency;
- streamwise/transverse force;
- output.

### T1A survival gate

FinCell remains a product challenger if at one or more target speeds it achieves either:

**Gate F1**
- ≥50% of RotorCell net power at equal A,
- while mean streamwise load is ≤65% of RotorCell;

or

**Gate F2**
- ≥70% of RotorCell net power,
- while deleting at least half of the RotorCell's submerged bearing/dynamic-seal interface burden;

or

**Gate F3**
- materially better low-speed startup/bandwidth that raises integrated energy under a representative variable-current trace.

These are research gates, not product promises.

## 8. T1B — ReedCell / 2DOF VIV

### Geometry

Initial bluff body:
- cylinder or rounded bluff body;
- projected area normalized near 0.018 m²;
- example: 60 mm diameter × 300 mm span.

Mount on:
- cross-flow compliant restraint;
- in-line compliant restraint;
- adjustable stiffness/damping.

### Why 2DOF

A 2025 review found that allowing both cross-flow and in-line response can improve VIV energy-harvesting performance relative to 1DOF architectures.

### Measurements

- displacement x/y;
- phase;
- force x/y;
- frequency;
- PTO power;
- lock-in range;
- peak stress/fatigue proxy.

### T1B survival gate

ReedCell survives if:

- useful stable harvesting spans at least 40% of the tested speed range; and
- at its best stable region it achieves ≥35% of RotorCell power **or** materially lower peak load/interface burden sufficient to justify lower power density.

If it only performs inside a narrow resonance window with no compensating intervention advantage, demote it.

## 9. T3 — Vascular Reef shared hydraulic PTO

### Four-element test

Use **four nominally identical compliant harvesters**.

Each element has the same projected area as the selected single-element morphology.

Run two architectures:

### A — individual conversion
Each element drives its own PTO/load.

### B — shared vascular conversion
All four pump a common hydraulic manifold:
- check/rectifying valves or fluidic rectifier;
- pressure sensors per branch;
- common accumulator;
- one hydraulic motor/turbine/generator.

First working fluid:
**benign inert hydraulic surrogate** chosen for laboratory compatibility.

Do not begin with experimental electrochemical fluid.

### Critical measurements

Per branch:
- pressure;
- flow;
- motion/force.

Common:
- accumulator pressure;
- generator input/output;
- hydraulic temperature;
- manifold pressure loss.

### Deliberate fault

At stable operation:
- disable/block one of four harvester branches.

Required observation:
- whether remaining cells continue harvesting;
- pressure transient;
- output loss;
- controller response.

### T3 survival gate

Vascular Reef survives if all are true:

1. shared-PTO net electrical output is ≥65% of the aggregate mechanical/electrical potential of the four individually tested elements at the same flow condition;
2. one branch failure does not stop the remaining array;
3. wet generator count falls from four to one;
4. added valves/hoses/manifold do not create a larger service/interface tax than the electrical machines they replace.

A stretch target is ≥75% shared-PTO efficiency relative to the individual-conversion aggregate.

## 10. T3.1 — VIV-pumped-storage mutation

A March 2026 Ocean Engineering study experimentally validated a VIV-driven pumped-hydro concept, reporting:
- experimental validation and scale-up;
- peak energy-capture efficiency of 25.04% at 1.74 m/s;
- storage/generation integration.

That result makes a **ReedCell → hydraulic storage** hybrid a first-class mutation rather than a speculative footnote.

Test after T1B + T3:

`VIV body -> pump -> accumulator/head -> one generator`

Compare with:
`VIV body -> direct electrical PTO`.

## 11. T4 — electrofluid mutation

Only begin after T3 hydraulic losses and mechanical behavior are understood.

Question:
Can one circulating fluid provide both:
- hydraulic transmission/actuation;
- electrochemical energy storage?

External precedent exists in Cornell's electrolytic vascular robot, where a redox-flow electrolyte was used for hydraulic force transmission, actuation, and energy storage.

### Separation-first protocol

Phase A:
- duplicate T3 with inert fluid and characterize hydraulics.

Phase B:
- benchtop electrochemical cell with candidate electrolyte, independent of moving harvester.

Phase C:
- only if A and B work independently, combine them.

### T4 pass

Combined system must create a **multifunction dividend**:
it must remove enough separate battery/hydraulic hardware, or add enough usable stored energy, to offset electrochemical compatibility and pumping penalties.

Do not accept “both functions technically occur” as success.

## 12. Test-facility ladder

### Bench
Purpose:
- sensor calibration;
- dry mechanical PTO;
- hydraulic manifold;
- generator/dyno;
- electrochemistry.

### Small controlled water
Purpose:
- qualitative morphology;
- low-load performance;
- debugging.

### SAFL-class controlled flume
Purpose:
- publishable hydrodynamics;
- calibrated power/load curves;
- turbulence;
- sediment;
- array effects.

The St. Anthony Falls Laboratory has:
- a main channel historically used for 0.15 m and 0.5 m hydrokinetic turbine models;
- an Outdoor StreamLab supporting controlled physical/ecological experiments;
- a water tunnel with 18.9 cm × 18.9 cm test section and >20 m/s maximum speed for specialized high-speed/cavitation work.

The 0.15 m RotorCell is appropriate for a large flume, **not** for the 18.9 cm tunnel without severe blockage. A separate smaller water-tunnel article would be required.

## 13. Data package per specimen

Each test article gets:

`specimen.yaml`
- geometry revision;
- material;
- mass;
- interface count;
- manufacturing process;
- calibration references.

`run.csv/parquet`
- synchronized raw/processed traces.

`event.jsonl`
- startup;
- load changes;
- faults;
- interventions;
- observed anomalies.

`inspection.md`
- pre/post photos;
- damage;
- wear;
- leaks;
- deformation.

This structure is deliberately compatible with later relational/sheaf/event analysis.

## 14. First decision after T0/T1/T3

Do not choose one winner.

Classify:

### Control survivor
Most mature route to FC-1 product.

### Power challenger
Architecture with credible energy advantage.

### Intervention challenger
Architecture with credible maintenance/interface advantage.

### Science challenger
Architecture worth continuing for material/physics insight but not yet product-competitive.

A single architecture may occupy more than one class.

## 15. External anchors

- SAFL hydrokinetic array experiments:
  https://cse.umn.edu/safl/feature-stories/harnessing-clean-energy-rivers-through-hydrokinetic-turbine-arrays
- SAFL water tunnel:
  https://cse.umn.edu/safl/water-tunnel
- SAFL Outdoor StreamLab:
  https://cse.umn.edu/safl/outdoor-streamlab
- Demirhan et al., VIV-driven pumped storage, Ocean Engineering (2026):
  https://www.sciencedirect.com/science/article/pii/S0029801826000533
- Peretz et al., soft wave-energy harvester, Device (2026):
  https://www.sciencedirect.com/science/article/pii/S2666998626001183
- Aubin et al., electrolytic vascular systems, Nature (2019):
  https://www.nature.com/articles/s41586-019-1313-1