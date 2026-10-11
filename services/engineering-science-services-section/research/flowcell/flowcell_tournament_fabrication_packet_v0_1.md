# FlowCell Tournament Fabrication Packet v0.1

**Date:** 2026-10-01  
**Scope:** T0 RotorCell, T1A FinCell, T1B ReedCell, T3 VascularReef  
**Status:** geometry/BOM baseline for low-cost first articles

## 1. Common test-fixture interface

Do not force all morphologies through one PTO.

Standardize only these interfaces:

- **carriage datum plane:** one rigid mounting plate above the water;
- **streamwise load pickup:** common load-cell axis;
- **specimen origin:** one defined x/y/z datum in the test section;
- **electrical/data connector:** dry-side harness;
- **timebase:** one synchronized DAQ;
- **flow reference:** same calibrated current measurement.

Each morphology may use its own mechanical PTO.

### Common coordinate frame

- `+x`: downstream;
- `+y`: cross-stream;
- `+z`: upward.

All geometry and load data use this frame.

## 2. T0 RotorCell — fabrication geometry

### Rotor

Nominal diameter: **151 mm**

Hub:
- OD: **30 mm**
- axial thickness: **18 mm**
- center bore: **8 mm**
- three blade sockets at 120°.

Blade active span:
- root radius: **15 mm**
- tip radius: **75.5 mm**
- active radial span: **60.5 mm**

First-pass blade section:
- **NACA 4412**

The choice is intentionally conservative. A published hydrokinetic experimental turbine used NACA 4412 blades with a tapered chord and root-to-tip twist, and small hydrokinetic literature also uses low-Re sections including NACA 44-series profiles. The tournament will replace this geometry later if measured data justifies it.

### Blade stations

| r/R | radius mm | chord mm | local pitch/twist |
|---:|---:|---:|---:|
| 0.20 | 15 | 29 | 21° |
| 0.40 | 30 | 25 | 15° |
| 0.60 | 45 | 21 | 10° |
| 0.80 | 60 | 18 | 6° |
| 1.00 | 75.5 | 15 | 2° |

Interpolate linearly between stations for the v0 blade.

This is a **test geometry**, not a BEM-optimized production rotor.

### Material

First articles:
- PA12, PETG, or ABS printed blade, sealed;
- printed/machined polymer hub;
- 316 stainless 8 mm shaft.

Use identical print orientation and post-processing for all three blades.

For saltwater testing, rinse and inspect after each session. Do not infer long-term marine life from short flume exposure.

### PTO interface

Specimen terminates in:
- **8 mm shaft**
- minimum exposed coupling length: **25 mm**
- one machined flat or clamp-collet region.

The fixture may connect this to:
- torque transducer + motor/generator;
- controllable magnetic brake;
- generator + programmable load.

Do not build the final subsea generator into T0.

### Sensor provisions

Rotor fixture should accept:
- RPM encoder target;
- streamwise load cell through the whole support;
- optional torque sensor;
- hub vibration accelerometer.

### Support

Nacelle/strut projected frontal area must be recorded and kept as small as practical.
Use a streamlined symmetric strut rather than a rectangular post.

## 3. T1A FinCell — fabrication geometry

### Outer geometry

- symmetric **NACA 0012**
- chord: **120 mm**
- span: **150 mm**
- planform: **0.018 m²**
- maximum thickness: **14.4 mm**

This is directly in the scale neighborhood used in oscillating-hydrofoil research.
Recent work has used NACA0012 and NACA0015 sections, while earlier experiments found cross-section shape less important than kinematics over the geometries tested.

### Pitch axis

Provide interchangeable pitch-axis inserts at:
- **0.25c = 30 mm from leading edge**
- **0.50c = 60 mm**

Start at 0.25c for the semi-passive prototype.

### Motion envelope

Initial fixture:
- heave travel: **±60 mm**
- pitch mechanical limit: **±80°**
- normal initial testing: ≤ ±60° until loads are characterized.

### Rigid article

Suggested construction:
- printed shell;
- carbon tube or 316 shaft;
- internal printed ribs;
- epoxy seal coat if required.

### Flexible article

Keep the same external NACA0012 envelope.

Suggested construction:
- internal carbon/GFRP leading-edge spine;
- segmented ribs;
- **polyether-based TPU** or another hydrolysis-resistant flexible skin.

Polyether TPU is preferred over generic polyester TPU for sustained wet exposure because hydrolysis resistance differs strongly by TPU chemistry. Production material remains a test variable, not a frozen choice.

### Instrument interface

Pitch shaft exits vertically to dry hardware.

Dry-side fixture:
- encoder on pitch axis;
- optional servo for prescribed pitch;
- linear carriage encoder;
- load cell / linear PTO on heave axis.

This intentionally keeps precision bearings and most actuation out of the water.

## 4. T1B ReedCell — 2DOF VIV article

### Bluff body

Baseline:
- OD: **60 mm**
- span: **300 mm**
- projected area: **0.018 m²**
- thin-wall cylinder or printed shell;
- removable end caps;
- internal central spine.

Start with a circular section because its VIV behavior is extensively characterized.

### Mount

The body itself is submerged.
The 2DOF mechanism stays above water wherever the facility allows.

DOF:
- `x`: inline
- `y`: cross-flow

Target mechanical travel:
- x: **±30 mm**
- y: **±60 mm**

Provide hard safety stops outside the normal experimental travel.

### Springs

Use interchangeable spring cartridges.

Do not freeze stiffness before the dry oscillator mass is known.

For each axis:

`f_n = (1 / 2π) sqrt(k / m_eff)`

Prepare at least three stiffness levels per axis so the lock-in region can be moved across the 0.5–1.5 m/s test matrix.

### PTO

Initial:
- adjustable eddy-current damping or linear-generator damping.

Avoid friction brakes as the primary experimental PTO because Coulomb friction makes damping harder to interpret.

### Sensors

- x displacement;
- y displacement;
- x force;
- y force;
- body acceleration optional;
- PTO voltage/current if electrically harvested.

## 5. T3 VascularReef — four-element article

T3 is not a scaled production reef. It is a **shared-PTO falsification rig**.

### Harvester leaf

Start with four identical leaves.

Nominal single-leaf envelope:
- 150 mm span;
- 120 mm chord/width;
- projected area ≈ 0.018 m².

The first leaf can reuse the FinCell flexible-body construction but does not need active pitch.

### Mechanical-to-fluid conversion

Each leaf drives one compliant pump element.

First architecture:
- flexure/bellows or origami-style displacement chamber;
- two low-cracking-pressure check valves;
- branch pressure tap.

The pump must be mechanically removable independently of the leaf.

### Hydraulic interface standard

Each branch terminates at the manifold with:
- **G1/8 or equivalent small lab port**
- branch isolation valve
- pressure tap
- quick disconnect located **outside** the high-motion wet zone when possible.

### Common accumulator

For initial benchtop/flume work:
- small compliant bladder/reservoir sized to smooth pulse flow;
- pressure relief independent of controller;
- transparent or externally measurable volume preferred.

Do not use a high-energy gas accumulator until the low-pressure hydraulic circuit has been characterized.

### Shared generator

First test may use:
- hydraulic motor driving a PM generator;
- miniature turbine;
- calibrated hydraulic load if a generator is unavailable.

The important first number is hydraulic power:

`P_h = Δp × q`

Electrical conversion can be layered on after hydraulic accounting is trustworthy.

### Fault test

Every branch must be isolatable individually.

At stable operation:
1. close one branch;
2. record pressure transient;
3. record surviving branch flow;
4. record shared output;
5. reopen branch.

## 6. Material strategy

### Metals

For short-duration wet prototypes:
- 316 stainless for shafts and wet fasteners;
- keep aluminum above water or electrically isolated.

### Rigid polymers

Candidate lab materials:
- PA12;
- PETG;
- ABS;
- POM/HDPE for manifolds and low-load wet parts.

### Water-lubricated bearings

If a wet journal bearing is unavoidable, test:
- PEEK;
- UHMWPE-based material;
- other dedicated water-lubricated polymer bearing materials.

Water-lubricated polymer bearings are established in marine propellers, pumps, and water turbines. Recent PEEK work specifically studies salt/sand water service. Do not use generic printed polymer as the final bearing without wear testing.

### Flexible polymers

For deliberately flexible wet structures:
- polyether polyurethane/TPU;
- silicone elastomer;
- fiber-reinforced elastomer.

A material called merely “TPU” is not specific enough for submerged qualification.

## 7. Fabrication tolerances

For first articles:

### Hydrodynamic external surfaces
- target printed/machined dimensional accuracy: **±0.25 mm**
- blade/foil leading edge: visually smooth, no print-support scars
- blade-to-blade mass variation: **<1%** after finishing where practical

### Shafts / couplings
Use normal machine-shop fits, not printed holes, for torque-carrying precision interfaces.

### Flexible articles
Record actual:
- thickness;
- mass;
- Shore hardness if known;
- spine geometry;
- cured state.

The manufactured article, not CAD nominal, is the experimental specimen.

## 8. Manufacturing files to create next

For each article:

### RotorCell
- NACA4412 coordinate generator;
- blade station loft;
- 3-blade hub;
- shaft collar;
- streamlined strut.

### FinCell
- NACA0012 rigid shell;
- pitch-axis insert at 0.25c and 0.50c;
- flexible internal spine/ribs;
- dry carriage adapter.

### ReedCell
- cylinder;
- end caps;
- central spine coupler;
- x/y carriage;
- spring cartridge brackets.

### VascularReef
- leaf;
- pump chamber;
- branch manifold;
- pressure-tap block;
- accumulator mount.

## 9. Safety before first wet rotation

- polycarbonate operator barrier;
- rotor physically locked during installation;
- no hands in flow/test section while rotor can move;
- emergency load/brake;
- mechanical travel stops on Fin/Reed;
- pressure relief on hydraulic rig;
- inspect printed parts for layer cracks before every high-speed run;
- replace any rotor blade after a strike rather than relying on visual appearance alone.

## 10. External design anchors

- Small NACA4412 hydrokinetic rotor experiment:
  https://www.sciencedirect.com/science/article/pii/S0029801820303012
- Low-velocity 3-blade hydrokinetic rotor geometry:
  https://doi.org/10.3390/environsciproc2022021062
- Oscillating NACA0012 experimental apparatus:
  https://www.sciencedirect.com/science/article/pii/S0960148126013121
- Finite-span oscillating hydrofoil experiments:
  https://www.sciencedirect.com/science/article/pii/S0889974616305114
- Semi-active hydrofoil experiments:
  https://www.sciencedirect.com/science/article/pii/S0360544226003166
- Water-lubricated marine/turbine bearing research:
  https://www.sciencedirect.com/science/article/pii/S0301679X15005733
- PEEK water-lubricated bearing in salt/sand water:
  https://doi.org/10.3390/lubricants13110470
- Soft hydraulic marine harvester:
  https://www.sciencedirect.com/science/article/pii/S2666998626001183