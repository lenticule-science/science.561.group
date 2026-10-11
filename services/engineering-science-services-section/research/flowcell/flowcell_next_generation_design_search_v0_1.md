# FlowCell Next-Generation Design Search v0.1

**Date:** 2026-10-01  
**Program:** Turntide Islands / 561 Group  
**Status:** design-space reopening before further CAD freeze

## 0. Governing question

Do not ask:

> What is the best small water-current turbine?

Ask:

> What is the lowest-intervention material system that can enter moving water, organize itself around the local flow, extract useful free energy, maintain bounded operation, and export electricity and information?

The axial-rotor FC-1 remains the **control architecture**, not the definition of FlowCell.

## 1. Selection function

Instantaneous power coefficient is necessary but insufficient.

Every candidate should be evaluated on a vector, not a single score:

- net electrical energy delivered over deployment;
- energy per unit wet mass;
- energy per unit mooring/foundation load;
- energy per unit swept/projected area;
- energy per deployment/retrieval event;
- energy per human maintenance hour;
- expected time between interventions;
- number of submerged precision interfaces;
- failure containment / graceful degradation;
- freshwater + saltwater portability;
- debris tolerance;
- fish/wildlife interaction;
- manufacturability at 10 / 100 / 1,000 units;
- replaceable-part count;
- sensor observability;
- ability to self-maintain;
- ability to use or improve 561 Group science.

Primary program objective:

`maximize lifetime useful energy / intervention`

subject to:
- safe recoverability;
- bounded environmental impact;
- bounded installed cost;
- falsifiable performance claims.

Keep a Pareto front rather than forcing all objectives into one scalar too early.

## 2. Morphology families

### R — RotorCell

Reference/control.

Variants:
- axial open rotor;
- ducted rotor;
- cross-flow / vertical-axis rotor;
- counter-rotating coaxial rotor;
- rim-driven rotor-generator.

Why retain:
- highest maturity;
- straightforward power measurement;
- direct benchmark against commercial hydrokinetics;
- easiest route to first field hardware.

High-value mutations:
- **counter-rotation** to cancel rotor torque;
- **rim-drive** to remove central shaft/transmission and potentially use a water-filled magnetic gap with static sealing;
- passive compliant blades for load shedding.

Kill condition:
if another morphology delivers comparable lifetime energy with materially lower mooring, service, or submerged-seal burden.

### K — KiteCell

A tethered wing flies cross-current trajectories so rotor-relative speed exceeds ambient current.

Variables:
- wing area/aspect ratio;
- tether length;
- rotor placement;
- path;
- buoyancy;
- control surfaces;
- generator loading;
- counter-rotating rotor;
- depth.

Strength:
can make slower ambient currents useful.

Cost:
controls, tether fatigue, collision envelope, recovery complexity.

Special experiment:
co-optimize path + tether + power take-off instead of optimizing them sequentially.

### F — FinCell

Oscillating pitching/heaving hydrofoil or compliant manta-like foil.

Strengths:
- potentially shallow-water friendly;
- no exposed high-speed propeller;
- may tolerate debris better;
- lends itself to compliant structures and linear/hydraulic PTO.

Mutations:
- passive pitch;
- bistable snap-through;
- asymmetric flexibility;
- distributed strain sensing;
- paired foils;
- spanwise arrays.

Key metric:
`net electrical Wh / peak structural load`, not just hydrodynamic efficiency.

### V — ReedCell

Vortex-induced-vibration or flutter harvester.

Concept:
let the current excite a body and harvest the oscillation instead of suppressing it.

Potential advantages:
- mechanically simple;
- no conventional rotor;
- debris-tolerant shapes;
- possible flexible/polymer construction.

Known risk:
lower power density and narrow lock-in regimes unless geometry/stiffness adapt.

Next-gen branch:
2-degree-of-freedom oscillators harvesting in both cross-flow and in-line motion.

### H — Hydraulic Reef

Distributed flexible foils/flaps/diaphragms pump a common hydraulic circuit.

Architecture:

`many cheap wet harvesters -> pressure manifold -> accumulator -> one serviceable hydraulic motor/generator`

Why this is interesting:
- one generator can serve many harvesting surfaces;
- hydraulic accumulator naturally smooths pulsed harvest;
- wet devices can be mostly polymer + check/rectifying geometry;
- one failed flap need not stop the array;
- power electronics/generator can remain on buoy/shore.

Variants:
- oil hydraulic loop;
- freshwater closed-loop hydraulic circuit;
- direct seawater pumping with corrosion/fouling-tolerant fluid machinery;
- elastomeric bellows;
- oscillating foils;
- VIV cylinders.

Key research question:
can shared PTO savings outweigh manifold/check-valve/hydraulic losses?

### D — Fluidic-Diode Cell

Use geometry to rectify reversing/oscillatory flow without mechanically switching valves.

Possible architecture:

`reversing ambient flow -> passive fluidic rectifier -> unidirectional internal flow -> generator`

This is established in wave-energy research, but not assumed to transfer efficiently to tidal-current geometry.

Interesting because:
- no yaw actuator;
- potentially no reversing generator logic;
- fluidic logic can be 3D-printed and evolved.

Risk:
pressure-drop cost may destroy the energy benefit.

Cheap kill experiment:
3D-print candidate rectifier loops and compare net generator power against a bidirectional baseline at equal external pressure/flow.

### T — TendonCell

Keep rotor/foil underwater but transmit mechanical work through a flexible tether/torsion member to a dry or surface generator.

Potential:
- removes submerged generator;
- reduces electrical wet penetrations;
- generator service from deck/buoy.

Risk:
torsional fatigue, dynamic loss, cable twist, bending/torsion coupling.

Program question:
is a replaceable tendon cheaper over lifetime than a pressure-sealed subsea generator?

### B — Buoyancy-Seeking Cell

A tethered current converter changes buoyancy/lift to move vertically and seek the best current layer.

System senses:
- current speed;
- turbulence;
- debris;
- temperature;
- power;
- tether load.

Then selects depth that maximizes a constrained objective, not simply maximum velocity.

This turns the water column into an active spatial energy field.

Potential objectives:
- maximize energy;
- reduce fatigue;
- avoid vessels/ice/debris;
- minimize ecological exposure;
- surface for service automatically.

### S — SwarmCell

Many small independent harvesters sharing a DC/data network.

Benefits:
- graceful degradation;
- one-person handling;
- incremental purchase;
- ecological routing;
- array learning;
- customer can start small and expand.

Do not assume identical cells.
A useful swarm may combine RotorCells, ReedCells, sensors, and storage nodes.

### G — Gills

Electrochemical / membrane subsystem that exchanges matter with surrounding water.

Branches:
- ambient-seawater sodium chemistry;
- selective ion capture;
- salinity-gradient storage;
- pH-gradient storage;
- Ca/Mg precipitation/dissolution;
- low-power hydrovoltaic/streaming-potential sensor harvesting.

Rule:
Gills do **not** need to beat LFP on round-trip efficiency to survive.
They can survive by providing stacked value:
- storage;
- desalination;
- mineral recovery;
- water chemistry management;
- antifouling;
- self-powered sensing.

### SK — Skin

The surface is an active subsystem rather than passive paint.

Functions:
- self-heal scratches;
- resist/release fouling;
- sense strain;
- sense leakage;
- alter roughness;
- alter stiffness;
- electrochemically passivate;
- shed load by deforming.

Research target:
a skin that spends a bounded fraction of harvested energy to preserve more generation than it consumes.

This directly instantiates the R5 question:
does ongoing free-energy throughput maintain function?

## 3. Architectures that should *not* lead the program

### Direct seawater MHD generation

Attractive because it has no mechanical rotor, but seawater conductivity is too low for practical ordinary-current direct MHD generation without severe magnet/electrode problems. Literature also flags electrolysis/chlorine evolution.

Status:
keep as science watch, not FC-1 candidate.

### Bulk hydrovoltaics as primary kW converter

Flow/evaporation-induced hydrovoltaic systems are scientifically active, but current power densities are suited far better to sensors and small auxiliary loads than kW generation.

Status:
use as self-powered sensing / surface instrumentation branch.

### Experimental chemistry as launch-critical storage

No.

A failed MineralCell experiment must not delay a customer receiving electricity.

## 4. Cross-cutting architecture mutations

### 4.1 Torque cancellation

Counter-rotating rotor pairs can cancel reaction torque.

Possible benefits:
- simpler tether attitude;
- reduced roll-control burden;
- lower rotational speed per rotor for a given aggregate conversion target.

Test against:
single rotor + stator reaction structure.

### 4.2 Rim drive

Move PM rotor/stator to blade perimeter.

Potential:
- no central drive shaft;
- compact direct drive;
- improved cooling;
- elimination of rotating shaft seal with separately sealed stator/rotor and water-filled gap.

Questions:
- fouling in air gap;
- sediment;
- magnet protection;
- bearing/rim support;
- debris clearing.

### 4.3 Passive morphing

Use load itself to alter blade/foil pitch/twist/camber.

Design objective:
`normal flow -> energy-optimal shape`
`gust/debris -> load-shedding shape`

The material becomes part of control law.

### 4.4 Mechanical power bus

Instead of an electrical cable from each cell:
- torsional cable;
- hydraulic pressure line;
- common oscillating shaft;
- magnetic coupling.

Compare reliability + efficiency + serviceability, not conversion efficiency alone.

### 4.5 Self-deploying geometry

A compact package dropped from a work boat could:
1. sink with ballast/anchor;
2. release buoyant harvesting body at set depth;
3. tension tether;
4. self-align;
5. run a diagnostic;
6. begin generation;
7. surface or expose retrieval messenger on command.

The product is the deployment behavior, not just the generator.

## 5. The FlowCell science contract

561 Group mathematics and physics may influence the design only through a preregistered engineering claim.

Template:

**Theory:** formal structure / material hypothesis.  
**Mechanism:** what physical/control mechanism it predicts.  
**Intervention:** what design change follows.  
**Comparator:** conventional baseline.  
**Observable:** measurable output.  
**Pass:** quantitative threshold.  
**Fail:** result that retires or narrows the hypothesis.

Examples:

### Sheaf/Laplacian sensing
Claim:
local sensor sections and restriction inconsistencies localize failures earlier than conventional residual methods.

Pass:
lower median fault-localization delay at equal false alarm rate.

### FOUR-valued fault logic
Claim:
keeping support and contradiction separately permits safer degraded operation under sensor disagreement.

Pass:
fewer unnecessary shutdowns without increasing missed unsafe states.

### Settling / closure control
Claim:
fixed-point control state converges reliably under missing/inconsistent observations.

Pass:
equal or better stability with lower communications/sensor dependence.

### Material memory
Claim:
history-dependent compliant foil changes improve energy/load tradeoff.

Pass:
higher deployment-integrated net energy at equal peak load than memoryless material.

### R5 energy-maintenance
Claim:
ongoing harvested energy maintains a functional skin/membrane state that decays when the energy source is interrupted.

Pass:
ON -> OFF -> RESTART loss/recovery pattern with energy accounting and controls.

## 6. Cheap falsification ladder

Do not build full machines first.

### Experiment A — equal-area morphology derby

Build five ~10–20 cm-class harvesters:
- axial rotor;
- oscillating foil;
- VIV reed;
- flexible fin;
- hydraulic flap.

Test in identical current.

Measure:
- electrical/mechanical output;
- axial load;
- projected area;
- wet mass;
- startup;
- debris response;
- complexity;
- noise/vibration.

Primary comparison:
`W / N of mooring load`
and
`W / wet kg`.

### Experiment B — passive compliance

Rigid foil vs controlled-flexibility foil.

Measure:
- power;
- peak load;
- fatigue proxy;
- startup;
- performance under gusts.

### Experiment C — hydraulic reef

Use 4–8 small flaps to pump one closed hydraulic circuit into an accumulator and one motor/generator.

Compare:
- total generated Wh;
- smoothing;
- individual-flap failures;
- pressure losses;
- service part count.

### Experiment D — torque-neutral rotor

Single rotor vs coaxial counter-rotating pair.

Measure:
- net power;
- axial thrust;
- body roll torque;
- tether twist;
- generator mass.

### Experiment E — rim generator

Small printed/machined rim rotor with encapsulated magnets and stationary outer coils.

Test:
- flooded gap loss;
- sediment/fouling tolerance;
- thermal behavior;
- seal count;
- efficiency.

### Experiment F — fluidic rectification

Bidirectional flow loop with 3D-printed fluidic diodes.

Compare net electrical power against:
- reversing generator;
- self-rectifying turbine;
- ordinary electrical rectification.

Kill quickly if pressure loss dominates.

### Experiment G — depth-seeking digital twin

Use measured or synthetic vertical current profiles.

Controller controls:
- buoyancy;
- lift;
- generator loading.

Objective:
maximize:
`energy - fatigue penalty - intervention risk`.

Only build variable buoyancy if simulation predicts a meaningful gain.

### Experiment H — active skin

Immersion coupons:
- ordinary marine coating;
- self-healing coating;
- fouling-release coating;
- dynamic/self-healing coating.

Apply controlled scratches and flow.

Measure:
- adhesion/fouling;
- impedance/corrosion proxy;
- drag proxy;
- recovery;
- required maintenance energy if actively stimulated.

### Experiment I — distributed self-powered sensing

Mount hydrovoltaic / piezo / triboelectric sensor patches on tether/foil.

Goal:
not main power.

Pass if:
sensor + intermittent radio/data transfer can operate from local deformation/water interaction without wiring from central bus.

## 7. Candidate convergence paths

### Conservative product path
RotorCell -> rim drive or standard PM generator -> external certified ESS.

### High-upside hydro path
KiteCell + counter-rotating rotor + variable depth.

### Low-intervention path
FinCell/ReedCell + Hydraulic Reef + one dry generator.

### Distributed path
SwarmCell + multiple cheap morphologies + common DC/data bus.

### Material path
passive morphing Skin + self-healing/fouling maintenance.

### Matter/energy path
Gills + storage/resource recovery/maintenance.

## 8. New program principle

**Do not choose the future machine by intuition. Build an evolutionary tournament.**

Each architecture produces:
- a genome;
- simulation phenotype;
- physical test phenotype;
- failure record;
- maintenance record;
- manufacturing estimate.

Selection happens on the empirical Pareto front.

The axial FC-1 survives only if it keeps winning.

## 9. External anchors

- ARPA-E SHARKS system-level co-design:
  https://arpa-e.energy.gov/programs-and-initiatives/view-all-programs/sharks
- Minesto Dragon 12 tether/performance:
  https://www.minesto.com/news/minestos-tidal-power-plant-dragon-12-in-operation-reaching-key-production-performance-milestone/
- 2DOF vortex-induced vibration review:
  https://www.sciencedirect.com/science/article/pii/S0029801825000915
- Counter-rotating undersea kite:
  https://www.sciencedirect.com/science/article/pii/S0029801825000046
- Coaxial counter-rotating ocean-current turbine modeling:
  https://www.sciencedirect.com/science/article/pii/S0960148124023498
- Fluidic diode under periodic flow:
  https://www.sciencedirect.com/science/article/pii/S0029801822026646
- Rim-driven marine current generator:
  https://www.sciencedirect.com/science/article/pii/S2352484723006698
- Rim-drive design:
  https://sam.ensam.eu/handle/10985/8712
- Variable-buoyancy underwater platform:
  https://pubmed.ncbi.nlm.nih.gov/39275682/
- Self-healing antifouling marine coating:
  https://www.sciencedirect.com/science/article/pii/S1385894725044754
- Hydrovoltaic review:
  https://doi.org/10.1016/j.ecmx.2025.101126
- Reverse electrodialysis / concentration storage:
  https://www.sciencedirect.com/science/article/pii/S0306261918306792