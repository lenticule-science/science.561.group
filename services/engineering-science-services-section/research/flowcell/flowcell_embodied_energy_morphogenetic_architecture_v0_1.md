# FlowCell Embodied-Energy / Morphogenetic Architecture v0.1

**Date:** 2026-10-01  
**Status:** exploratory architecture, pre-selection  
**Program:** Turntide Islands / 561 Group

## Core shift

FlowCell should not be defined as "a turbine plus battery."

The design target is an **embodied energy organism** in the engineering sense:
a machine in which structure, energy capture, storage, hydraulic transmission,
sensing, shape change, protection, and maintenance share physical substrates wherever
doing so reduces total intervention.

This is not a biological claim. It is a multifunctional systems-design strategy.

## 1. Functional anatomy

### Skeleton
Carries global loads and defines deployment/recovery geometry.

Candidate:
- tensegrity / cable-strut frame;
- compliant composite frame;
- folding/origami frame;
- modular docked lattice.

### Muscle
Changes geometry or converts flow-induced motion.

Candidate:
- compliant foil;
- soft origami pump;
- hydraulic bellows;
- oscillating reed;
- buoyancy bladder;
- passive morphing laminate.

### Blood
A circulating working fluid with more than one job.

Candidate roles:
- hydraulic power transmission;
- energy storage electrolyte;
- thermal transport;
- damage/leak sensing;
- ionic state carrier;
- stiffness/pressure control.

External precedent:
Cornell's electrolytic vascular systems used redox-flow electrolyte simultaneously
for electrical storage and hydraulic actuation.

### Lung
Stores pressure and controls buoyancy/depth.

Candidate:
- flexible compressed-air accumulator;
- phase-change buoyancy module;
- gas/liquid displacement bladder.

Potential multiple functions:
- energy storage;
- variable buoyancy;
- hydraulic smoothing;
- emergency surfacing;
- structural prestress.

### Gills
Exchange matter selectively with ambient water.

Candidate:
- ion-selective membranes;
- seawater-battery interface;
- reverse-electrodialysis membrane;
- mineral precipitation/dissolution reactor;
- water chemistry sampling.

### Skin
Boundary, sensor, repair system and flow interface.

Candidate:
- self-healing coating;
- antifouling/fouling-release layer;
- strain-sensitive hydrogel;
- triboelectric/piezoelectric sensing patches;
- architected drag/flow metamaterial.

### Nervous system
Distributed low-power sensing and local logic.

Candidate:
- self-powered strain/vibration/leak nodes;
- fluidic local controllers;
- simple threshold logic;
- shared digital telemetry.

### Brain
Slow supervisory optimization.

Responsibilities:
- site state estimation;
- depth/geometry selection;
- power loading;
- maintenance budgeting;
- fault isolation;
- swarm coordination;
- experiment scheduling.

Keep fast safety local.

## 2. Architecture A — Vascular Reef

### Physical form

A flexible cluster of 4–32 harvesting leaves/fins.

Each leaf:
- deforms in current;
- pumps a common fluid;
- contains local strain/pressure sensing;
- can fail independently.

Shared manifold:
- hydraulic accumulator;
- turbine or hydraulic motor/generator;
- pressure regulation;
- optional redox-flow electrochemistry.

Conceptual chain:

`flow -> flexure -> fluid pressure -> accumulator -> generator -> DC bus`

Optional embodied-energy loop:

`electrolyte pressure fluid <-> redox energy storage <-> hydraulic actuation`

### Why this is no longer speculative as a class

2026 Cornell work demonstrated:
- compliant origami pumping driven by ocean motion;
- seawater as pumped fluid;
- flow rectification;
- a turbine-generator;
- real-ocean operation;
- up to 65% modeled mechanical conversion efficiency.

Earlier Cornell work demonstrated:
- redox-flow electrolyte as energy storage;
- the same fluid as hydraulic force-transmission medium.

FlowCell's novel question is whether those concepts can be adapted from
wave/robot actuation into **current harvesting plus shape control plus storage**.

### Primary experiment

Build four identical flexible fins.

A. each fin gets its own tiny electrical generator;
B. all four pump one shared hydraulic circuit.

Compare:
- net Wh;
- wet component count;
- submerged seal count;
- loss under one-fin failure;
- mass;
- maintenance time;
- pressure ripple;
- scalability.

## 3. Architecture B — LungCell

Use hydrostatic pressure and compressed gas as an energy/control state.

### Core insight

An underwater air accumulator at depth stores energy against ambient hydrostatic
pressure. Field-scale underwater compressed-air storage has now been tested at
30–70 m depth, and flexible accumulators are an active development area.

For FlowCell, storage need not be grid-scale.

A small pressure bladder can serve simultaneously as:
- hydraulic accumulator;
- short-duration energy buffer;
- depth/buoyancy actuator;
- emergency surfacing reserve.

### Morphological coupling

State of charge changes buoyancy.

Rather than treating this as a nuisance, test whether it can be useful:

`surplus power -> compress gas -> alter buoyancy -> move to another depth`

`stored gas release -> generate/assist hydraulics -> alter depth again`

Thus:
**energy state becomes spatial state.**

This creates a coupled optimization problem:
- energy yield;
- pressure;
- depth;
- current profile;
- tether tension;
- fatigue.

### Kill condition

If compression/expansion losses plus buoyancy-management penalties exceed the value
of avoided battery/actuator mass, demote it to emergency buoyancy only.

## 4. Architecture C — MetaFin

A foil whose internal architecture controls how it interacts with water.

2026 fluid/structure metamaterial literature supports deliberately architecting
internal structures to manipulate fluid-structure, elastic, acoustic and vibration
responses.

Candidate internal structures:
- graded lattice stiffness;
- bistable ribs;
- auxetic regions;
- anisotropic flexures;
- liquid-filled channels;
- granular/jamming stiffness pockets.

### Target behavior

At low flow:
- high compliance;
- large harvesting oscillation.

At productive flow:
- energy-optimal mode.

At extreme flow:
- passive flattening/load shedding.

At debris strike:
- local deformation without global failure.

This can turn a structural safety function into a power-optimization function.

### Formal experiment

Search lattice parameters with simulation/evolutionary optimization.

Compare against uniform-material foil at:
- equal mass;
- equal projected area;
- equal material family.

Measure:
- Wh;
- peak force;
- fatigue damage proxy;
- recovery from overload.

## 5. Architecture D — Fluidic Nervous System

Do not make every local response travel through a microcontroller.

Fluidic soft-robot research demonstrates electronics-free oscillators and local
fluidic control.

For FlowCell, local fluidic logic could provide:
- overpressure bypass;
- fin phase coupling;
- passive oscillation;
- flow rectification;
- load-triggered stiffness change;
- resettable mechanical hysteresis.

The electronic controller then changes slow boundary conditions rather than
micromanaging every motion.

Goal:
**morphological computation for the fast loop; digital optimization for the slow loop.**

Potential advantage:
- fewer sensors;
- fewer wet connectors;
- safe behavior when electronics fail.

## 6. Architecture E — Self-Assembling Colony

A FlowCell installation need not arrive in its final geometry.

Recent aquatic-robot research demonstrates autonomous modules docking and
reconfiguring into larger water structures.

FlowCell extrapolation:
- each module is boat-handlable;
- modules dock mechanically/electrically/hydraulically;
- array geometry changes with site state.

Possible configurations:
- narrow-channel line;
- shallow-water reef;
- surface service raft;
- distributed river array;
- storm-safe compact cluster.

### Stronger idea

Do not require active propulsion on every energy cell.

Use a few "shepherd" / service modules to rearrange mostly passive harvesters.

This reduces cost and failure points.

## 7. Architecture F — Osmotic Skin

2026 self-healing hydrogel membranes have demonstrated osmotic energy harvesting
while autonomously recovering material damage.

This is not yet a main-power technology.

Use it first for:
- ionic sensing;
- salinity-gradient auxiliary power;
- membrane self-test;
- leak detection;
- seawater/freshwater chemistry characterization.

At estuaries and river mouths, however, the same installation may experience both:
- current kinetic energy;
- salinity-gradient free energy.

A mature FlowCell could harvest both through physically different organs.

## 8. Architecture G — Energy/Material Circulation

A radical long-term direction:

`ambient flow -> electricity -> chemical potential -> hydraulic/material maintenance`

The same circulation network can carry:
- electrolyte;
- hydraulic pressure;
- heat;
- diagnostic information;
- repair chemistry.

Potential maintenance actions:
- change foil stiffness;
- heal elastomer;
- flush fouling;
- reverse membrane scaling;
- alter local pH;
- precipitate/dissolve sacrificial mineral layers.

This directly converts generated energy into preservation of generator function.

## 9. Architecture H — Amphibious energy ecology

Do not constrain the system to one resource.

A Turntide installation may include:
- current harvesting underwater;
- wave harvesting at surface;
- solar on service buoy;
- salinity-gradient harvesting at estuary;
- storage in chemical/hydraulic/electrical form.

One DC/pressure/data ecology decides where free energy should go.

This is more robust than maximizing one converter.

## 10. Three-timescale controller

### Fast: milliseconds–seconds
Local physics:
- compliance;
- fluidic valves;
- passive rectification;
- mechanical limits;
- independent overspeed/overpressure protection.

### Middle: seconds–minutes
Embedded controls:
- generator load;
- pressure;
- geometry;
- buoyancy;
- depth;
- self-cleaning pulse.

### Slow: hours–months
Adaptive system:
- maintenance model;
- material aging;
- fouling;
- current-field learning;
- deployment geometry;
- array rearrangement;
- experiment selection.

This separation may be more important than any particular AI algorithm.

## 11. Relation-first modeling

FlowCell is unusually suitable for the 561 relational math because components do not
have context-free states.

A fin's relevant state is relational:
- relative to water velocity;
- relative to neighboring fin phase;
- relative to tether strain;
- relative to pressure manifold;
- relative to generator loading.

Likewise, "healthy" is not one scalar.

Model candidate relations:
- observations -> local sections;
- local consistency -> restriction compatibility;
- cycle inconsistency -> obstruction/fault signal;
- global steady operating state -> settlement/fixed point;
- array configuration -> graph/cell complex;
- failure isolation -> cut / obstruction localization.

Engineering criterion remains comparative predictive performance.

## 12. Morphogenesis program

Represent a FlowCell candidate as a graph:

Nodes:
- energy converters;
- storage volumes;
- membranes;
- structural joints;
- sensors;
- generators;
- anchors;
- buoyancy volumes.

Edges:
- mechanical force;
- hydraulic flow;
- electrical power;
- ion/material transport;
- information;
- thermal flow.

Evolution is allowed to change:
- topology;
- geometry;
- material;
- controller;
- multifunction assignment.

A component receives a "multifunction dividend" when one physical object replaces
multiple otherwise-required parts without unacceptable coupling risk.

Example:
redox electrolyte:
- battery medium;
- hydraulic fluid;
- thermal mass;
- chemical sensor medium.

## 13. New fitness metrics

Add to the earlier Pareto front:

### Functional density
`number of independently valuable functions / wet component`

### Interface tax
`wet seals + wet connectors + bearings + exposed precision interfaces`

Minimize.

### Intervention entropy
Measure diversity and uncertainty of maintenance actions.

A machine needing one predictable annual cartridge swap can beat one needing many
rare specialist procedures even at equal maintenance hours.

### Survival elasticity
Performance retained after:
- one cell loss;
- one sensor loss;
- one blocked fin;
- one leak;
- unexpected high flow.

### Embodied-maintenance fraction
`energy deliberately spent maintaining the machine / energy harvested`

Optimize against resulting preserved lifetime yield.

## 14. Immediate cheap experiments

### X1 — soft pump / current test
Adapt a Kresling-like elastomeric pump geometry to steady-current-driven fin motion.
Question: can unsteady fin deformation pump useful fluid under steady ambient current?

### X2 — electrohydraulic loop
Use a benign laboratory redox-flow or surrogate electrolyte in a flexible hydraulic loop.
First establish hydraulics. Then add electrochemical storage.

### X3 — flexible-metamaterial foil
Print/cast three equal-mass internal lattice designs and one uniform control.
Test passive shape response across speed.

### X4 — pneumatic depth/storage simulator
Bench + water-column model coupling gas state, buoyancy and pressure storage.
Determine whether "state of charge = useful depth change" is advantageous or nuisance.

### X5 — fluidic fast control
Build electronics-free overpressure/load-shedding logic for a flexible harvester.

### X6 — sacrificial colony
Build 8 tiny passive cells that dock to a common bus.
Deliberately fail/remove cells and quantify graceful degradation.

### X7 — active maintenance budget
Deliberately foul/roughen coupons or small foils.
Spend measured energy on an active cleaning/healing method.
Measure whether recovered harvest exceeds maintenance input.

## 15. Near-term branch ranking

Not a product ranking; this is research attention.

**Immediate high information value**
- Vascular Reef
- MetaFin
- active Skin
- torque-neutral RotorCell as control

**Medium-term**
- LungCell / variable depth
- Colony / swarm reconfiguration
- fluidic nervous system

**Longer horizon**
- multifunctional seawater/mineral Gills
- true electrohydraulic "blood" combining storage + actuation in the production system
- self-growing/self-repairing inorganic interfaces

## 16. External anchors

- Metamaterials and Fluid Flows, Nature Communications (2026):
  https://www.nature.com/articles/s41467-026-70163-2
- Bioinspired underwater soft robots, npj Robotics (2026):
  https://www.nature.com/articles/s44182-026-00088-x
- Modular, scalable, and resilient soft wave energy harvester, Device (2026):
  https://www.sciencedirect.com/science/article/pii/S2666998626001183
- Electrolytic vascular systems for energy-dense robots, Nature (2019):
  https://www.nature.com/articles/s41586-019-1313-1
- Multifunctional robotic electrofluid for soft fluidic actuation (2025):
  https://www.sciencedirect.com/science/article/pii/S2667141725000783
- Self-healing hydrogel osmotic energy conversion (2026):
  https://pubs.acs.org/doi/10.1021/acsami.6c01779
- Underwater compressed air field test (2025):
  https://doi.org/10.1002/est2.70300
- Flexible underwater CAES accumulator FSI (2026):
  https://doi.org/10.1016/j.oceaneng.2026.125353
- Self-reconfiguring modular robotic boats (2026):
  https://www.nature.com/articles/s41467-026-74527-6
- Flexible flapping foil FSI energy harvesting (2026):
  https://doi.org/10.1016/j.oceaneng.2026.125906