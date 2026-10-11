# FlowCell Mundane Survivability + Ecology Tournament v0.1

**Date:** 2026-10-01  
**Status:** mandatory gate before open-water product claims  
**Purpose:** make ordinary mud, organisms, ice, debris, users, and maintenance capable of killing a FlowCell candidate before expensive scale-up.

## 1. Governing rule

The morphology tournament asks:

> Can this mechanism turn moving water into useful energy?

This second tournament asks:

> Can it remain a responsible, recoverable machine in an actual waterbody?

A morphology does **not** graduate because it wins on watts.

It must survive both tournaments.

## 2. Product-level objective

Optimize:

`useful service delivered over life / human intervention`

subject to:
- ecological harm being bounded and monitored;
- no dependence on impossible cleanliness;
- recoverability after loss of power/software;
- portability that does not spread aquatic invasive species;
- site-specific permitting and monitoring.

## 3. Sediment: mud is part of the fluid

FlowCell models must stop treating water as pure H2O plus density.

Real currents carry:
- clay/silt;
- sand;
- organic matter;
- detritus;
- bedload.

Sediment can:
- abrade blades and flexible skins;
- jam hydraulic check valves;
- enter rim-drive gaps;
- clog pressure taps;
- blind cameras/current sensors;
- alter bearing wear;
- settle into low spots;
- create or respond to scour around anchors/hubs.

Marine-renewable-energy guidance treats scour as a real siting, design, installation and operations problem because structures alter local seabed flow and morphology.

### M1 — suspended sediment screen

Proposed accelerated lab challenges:
- 0.1 g/L fine sediment;
- 1 g/L;
- 5 g/L;
- followed by short pulses of washed ~100–500 µm sand.

These are **screening challenges, not claims about natural Lake Superior concentration**.

Measure:
- power/load change;
- pressure loss;
- valve sticking;
- bearing/hinge friction;
- sensor drift;
- visible abrasion;
- time to return to clean-water performance.

### M2 — scour/burial screen

Use a mobile sediment bed and sacrificial scale anchor/hub/cable arrangement.

Before/after:
- photograph/scan bed;
- measure scour depth;
- measure deposition;
- note exposed/buried cable;
- note whether FlowPort or recovery points remain accessible.

## 4. Debris and fishing gear

Debris is not one category.

### Rigid
- woody branches;
- ice chunks;
- hard trash.

### Flexible
- weeds;
- rope;
- plastic bags;
- monofilament;
- braided fishing line;
- net fragments.

A morphology can survive impact but fail by wrapping.

Tests M3–M5 therefore separate:
- strike;
- soft blockage;
- line/net entanglement.

Safety:
all debris introduction is remotely controlled behind guarding. No operator reaches into a running device.

A candidate should prefer **shedding** an object over grinding it apart.

## 5. Fish and aquatic animals

Do not reduce this to “will a blade chop a fish?”

Relevant stressors include:
- collision;
- shear;
- pressure change;
- turbulence;
- trapping/entanglement;
- noise;
- electromagnetic fields;
- attraction/avoidance;
- habitat change;
- array-scale displacement or barrier effects.

The literature is encouraging for small deployments: field/lab studies often observe avoidance/evasion and low collision frequency, and the 2024 State of the Science considers operational noise relatively low-risk for small numbers of devices. But collision consequences and population-scale risk remain uncertain enough that turbine interaction is still a major permitting concern.

PNNL's 2025 Sensor Fish work is a useful design model: flexible instrumented bodies can record collision impacts, pressure gradients, turbulence and shear.

### M6 — mechanical fish-exposure surrogate

Before any live-animal experiment:
- flexible inert fish-shaped/sensor-fish-like bodies;
- multiple sizes;
- multiple approach trajectories;
- high-speed imaging;
- collision acceleration/load;
- pressure/shear where instrumentation permits;
- trapping and escape clearance.

Important:
surrogate tests **do not establish fish injury thresholds**.

They identify bad geometry and define later biological study needs.

### Later ecological field work

Use:
- conventional video in clear water;
- acoustic camera/sonar where turbidity/light makes video unreliable;
- site-specific ecological partners;
- proper animal-study/regulatory approvals if live controlled exposures are ever warranted.

## 6. Invasive species: portability creates a new risk

A portable FlowCell can become a vector between waters.

Minnesota DNR notes that microscopic zebra-mussel veligers can remain in water-containing equipment. State rules require cleaning and draining, and DNR guidance uses:
- **140°F / 60°C water for at least 10 seconds**, or
- **120°F / 49°C water for at least 2 minutes**
for zebra-mussel decontamination.

Therefore portability becomes a hardware requirement.

### AIS-001
Every flooded volume shall be:
- intentional;
- visible/inspectable where practical;
- drainable at a low point;
- flushable/decontaminable.

### AIS-002
Portable wet hardware should survive the applicable hot-water decontamination cycle without:
- seal failure;
- adhesive failure;
- polymer distortion;
- demagnetization;
- damaged coating;
- unreadable identification.

### AIS-003
No production design may contain an undocumented “mystery cavity” that retains water during transport.

### M8 — decon qualification
Cycle representative components through both DNR temperature/time regimes and inspect/function-test afterward.

## 7. Fouling

Fouling can:
- increase drag;
- change foil/rotor roughness;
- imbalance rotating parts;
- clog small hydraulic passages;
- blind optics;
- cover acoustic/pressure surfaces;
- prevent wireless/docking alignment.

Do not deliberately cultivate or transport regulated invasive species for ordinary engineering tests.

Use:
- repeatable roughness surrogates;
- removable artificial attachment surrogates;
- passive settlement coupons in field deployments when permitted.

Measure both lost performance and **cleaning intervention**.

A 5% power loss that takes 30 seconds to clean is different from one requiring a diver.

## 8. Ice

Lake/river winter is not merely “solid ice on top.”

Relevant mechanisms:
- frazil crystals in supercooled turbulent water;
- anchor ice adhering to submerged surfaces/bottom;
- slush;
- moving/broken ice;
- freeze-thaw in trapped water;
- surface icing from spray.

NOAA/USGS descriptions of Great Lakes/river ice emphasize that frazil forms in turbulent supercooled water and can adhere to submerged objects; freshwater frazil can also incorporate substantial sediment.

### Initial design decision
**No v1 overwinter-under-ice claim.**

Default Great Lakes product behavior:
- seasonal retrieval before hazardous ice conditions.

Winter operation becomes a later branch requiring dedicated testing.

### M9
Freeze-thaw test all residual-water locations.

### M10
Frazil/slush challenge through a cold-regions facility or purpose-built controlled screening setup before any overwinter claim.

## 9. Hydraulic and electrochemical leakage

VascularReef introduces a new environmental hazard:
the machine has circulating fluid.

Early field prototypes therefore use:
- benign, visible/tracer-compatible working fluid;
- minimum practical inventory;
- branch isolation;
- whole-system drain/recovery plan.

### M11 — branch rupture
Deliberately open one branch.

Measure:
- total release before isolation;
- whether remaining branches continue;
- cleanup;
- refill/service time.

An electrochemical fluid does not enter open-water field trials merely because it works electrically. Its ecological release consequence must also be acceptable.

## 10. Dead-machine recovery

The system must have two operational identities:

### Alive
software, telemetry, actuators and energy available.

### Dead
none of those exist.

Recovery design must work in the second state.

### M12
Disable:
- main generation;
- storage;
- telemetry;
- active buoyancy;
- network.

Then recover with:
- passive attachment/recovery points;
- mechanical winch;
- planned boat procedure.

Record:
- people;
- time;
- peak line force;
- tools;
- failures.

“No diver required” is not credible until demonstrated in the dead state.

## 11. Tether reality

The tether is not a line in a diagram.

It is:
- a structural member;
- an abrasion surface;
- a debris collector;
- an entanglement opportunity;
- often a power/data path;
- a colonization surface;
- a fatigue component.

Test:
- bending;
- tension cycling;
- abrasion with sediment;
- fairlead contact;
- outer-jacket damage;
- retrieval after partial failure.

Minimize loose line in the water.

## 12. Humans and navigation

Assume:
- somebody ties a boat to the buoy;
- somebody hooks it;
- somebody drags an anchor near it;
- somebody steals/removes a marker;
- somebody runs a propeller over it;
- somebody ignores instructions.

### M14
Test representative misuse loads and snag scenarios.

Field siting must independently address:
- vessel routes;
- fishing activity;
- marking;
- minimum clearance;
- emergency removal.

## 13. Sensor blindness

The monitoring system inhabits the same hostile environment as the generator.

Test:
- blocked pressure port;
- fouled camera;
- biased current meter;
- lost encoder;
- condensation;
- intermittent connector;
- acoustic obstruction.

The system must not transform a fouled sensor into false certainty.

This is also an unusually good trial for FOUR/sheaf diagnostics:
contradiction should remain represented instead of silently selecting one sensor.

## 14. Surface-component indignities

Surface hardware adds:
- UV;
- rain/spray;
- freeze/thaw;
- icing;
- bird perching/guano;
- lightning exposure;
- vandalism;
- collision.

This strengthens the case for a subsurface architecture where it is otherwise practical, but subsurface operation has its own communications and recovery costs.

## 15. Permitting gate

For U.S. field deployment, jurisdiction is site-specific.

As of September 2026, FERC states that hydrokinetic projects generate directly from waves/flow in oceans, tides or inland waterways. Its pilot process is intended for small, removable/shutdown-capable projects in non-sensitive locations with environmental monitoring and safeguards. Projects at identified state-water sites may require a preliminary permit to establish priority while studies proceed.

Therefore:

**No field site gets selected by hydrodynamics alone.**

Site screen includes:
- jurisdiction;
- tribal consultation context where applicable;
- fish/wildlife sensitivity;
- navigation;
- AIS status;
- bottom habitat;
- fishing/recreation;
- current resource;
- recovery access.

## 16. Graduation rule

A morphology can advance toward open-water DVT only after:

- clean-water performance is repeatable;
- M1 sediment completed;
- M3/M4 debris completed;
- M5 line/net snag completed;
- M6 inert fish-exposure screen completed;
- M8 decontamination design passes for portable Great Lakes hardware;
- M11 leak response completed if any working fluid exists;
- M12 dead recovery demonstrated;
- site-specific scour/ice/navigation/ecology plan exists.

For Great Lakes field work:
- seasonal recovery remains default until M9/M10 winter evidence exists.

## 17. External anchors

- Minnesota DNR zebra mussels:
  https://www.dnr.state.mn.us/invasives/aquaticanimals/zebramussel/index.html
- Minnesota DNR decontamination:
  https://www.dnr.state.mn.us/invasives/watercraft_inspect/courtesydecon.html
- PNNL Sensor Fish (2025):
  https://www.pnnl.gov/publications/autonomous-sensor-suite-evaluating-fish-turbine-interactions-and-environmental-impacts
- PNNL fish/MRE review:
  https://www.pnnl.gov/publications/are-fish-danger-review-environmental-effects-marine-renewable-energy-fishes
- Tethys 2024 State of the Science stressor-receptor chapter:
  https://tethys.pnnl.gov/publications/2024-state-science-report-chapter-3-marine-renewable-energy-stressor-receptor
- Acoustic camera fish monitoring:
  https://www.pnnl.gov/publications/capabilities-acoustic-camera-inform-fish-collision-risk-current-energy-converter
- Seabed scour considerations:
  https://tethys.pnnl.gov/publications/seabed-scour-considerations-marine-renewable-energy-facilities
- NOAA Great Lakes ice manual:
  https://repository.library.noaa.gov/view/noaa/30360/noaa_30360_DS1.pdf
- USGS frazil/anchor ice + sediment:
  https://www.usgs.gov/publications/interactions-frazil-and-anchor-ice-sedimentary-particles-a-flume
- FERC hydrokinetic projects:
  https://www.ferc.gov/licensing/hydrokinetic-projects
- FERC pilot licensing:
  https://www.ferc.gov/licensing/hydrokinetic-pilot-project-licensing-process