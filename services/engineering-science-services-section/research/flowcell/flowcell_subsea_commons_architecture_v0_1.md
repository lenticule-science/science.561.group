# FlowCell Subsea Commons Architecture v0.1

**Date:** 2026-10-01  
**Program:** Turntide Islands / 561 Group  
**Status:** exploratory platform architecture

## 1. Reframing

FlowCell may be more valuable as **persistent underwater infrastructure** than as a standalone generator.

The architectural primitive becomes:

`ambient energy -> local storage/buffering -> sealed subsea utility node -> dockable clients`

Clients may include:
- environmental sensors;
- current profilers;
- cameras;
- acoustic modems;
- small AUVs/ROVs;
- cleaning robots;
- inspection crawlers;
- water-chemistry cartridges;
- mineral/ion experiments;
- temporary customer loads.

This creates a product whose value is not measured only in $/kWh.

A customer can buy:
- avoided boat trips;
- avoided diver hours;
- continuous data;
- persistent inspection;
- underwater autonomy;
- environmental monitoring;
- current energy.

## 2. FlowPort

A **FlowPort** is a sealed underwater docking face.

Primary goals:
- no exposed electrical contacts;
- no routine wet-mate connector cycles;
- tolerant of rotational/misalignment error;
- simultaneous power + data;
- mechanically simple capture geometry.

### Reference mechanism

Near-field inductive/resonant wireless power is the baseline.

Current literature reports:
- underwater WPT at kilowatt scale;
- ~3 kW experiments with ~92% DC/DC efficiency at millimeter gaps;
- scaled multi-kW systems;
- ~193 W simultaneous wireless power/data at 89.2% end-to-end efficiency in seawater.

These results do **not** imply FlowPort will achieve those numbers.
They establish that contactless underwater docking belongs in the practical design space.

### FlowPort v0 requirements

- operate in freshwater and seawater;
- automatic alignment funnel or compliant capture face;
- electrical isolation;
- positive mechanical latch independent of power transfer;
- foreign-object / marine-growth detection;
- low-power beacon for docking;
- data handshake before high-power enable;
- maximum power negotiated by client;
- fail-open electrical state;
- local thermal monitoring;
- cleanable face.

## 3. FlowHub

A FlowHub is the stationary or semi-stationary node.

Possible contents:
- rectifier/DC bus;
- pressure/hydraulic accumulator;
- battery/experimental storage cartridge;
- FlowPorts;
- local compute;
- acoustic/optical/radio communications;
- environmental sensors;
- recovery locator;
- emergency disconnect;
- antifouling/cleaning support.

The FlowHub may sit:
- on seabed;
- suspended below navigation depth;
- on mooring;
- on pier/shore;
- below a surface service buoy.

## 4. No-surface architecture

Surface buoys create:
- navigation hazards;
- ice exposure;
- wave loads;
- vandalism;
- visual footprint;
- vessel collision risk.

Therefore maintain two architecture branches:

### Visible service mode
Surface buoy provides:
- GNSS;
- radio/satellite;
- easy retrieval;
- large antenna;
- solar hybrid input.

### Subsurface mode
Everything remains below navigation/ice zone.

Communication:
- acoustic;
- short-range underwater RF where appropriate;
- optical during docking;
- cable to shore where available.

Recovery:
- acoustic release;
- pop-up messenger buoy;
- commanded buoyancy;
- ROV/AUV docking.

A Lake Superior product should strongly investigate seasonal or fully subsurface configurations because ice changes the surface-risk calculation.

## 5. Service organism

Instead of making every FlowCell completely self-cleaning, let the installation support a **resident maintenance robot**.

The robot can:
- inspect blades/fins;
- image fouling;
- inspect tether;
- clean surfaces;
- read fiducials;
- inspect seals;
- measure local flow;
- retrieve samples;
- clean FlowPorts.

It returns to the FlowHub to charge and upload data.

This shifts complexity:
from
`every component must self-maintain`
to
`one maintainable robot services many simple components`.

Both architectures remain in the tournament.

## 6. Human-intervention metric

Marine systems often fail economically through vessel/service cost rather than energy conversion.

Add:

`Boat Trips Avoided / year`

and

`Human Offshore Hours Avoided / MWh`

as primary system metrics.

A 500 W FlowCell that prevents monthly sensor-battery replacement trips can have more customer value than a 5 kW generator feeding an already-cheap grid.

## 7. Distributed observatory

FlowCell should be instrumented enough that every installation becomes a current/ecology/material observatory.

Measurements can include:
- current velocity/profile;
- turbulence;
- temperature;
- conductivity;
- pressure/depth;
- dissolved oxygen;
- acoustic environment;
- turbidity;
- fouling imagery;
- structural strain;
- generated power;
- maintenance interventions.

Commercial implication:
the installation produces both electricity **and longitudinal environmental data**.

Science implication:
real field traces continuously pressure-test the 561 Group's relational/fault/material theories.

## 8. Ecology modes

Do not globally claim that FlowCell is an artificial reef.

### Great Lakes mode

Initial objective:
- minimize new colonizable hard substrate;
- smooth/cleanable surfaces;
- decontamination protocol between waters;
- explicit invasive-species management;
- no habitat-enhancement claim without ecological evidence.

Reason:
Dreissenid mussels readily colonize stable artificial surfaces and can create severe infrastructure fouling and ecosystem effects.

### Marine habitat mode

Potentially explore nature-inclusive surfaces/geometry **only** where:
- native habitat goals are defined;
- colonization is monitored;
- turbine/harvester safety remains acceptable;
- invasive-species risk is assessed;
- regulators/local ecological expertise support it.

Ecology is therefore a site-specific design variable.

## 9. Energy multiplexing

The node may harvest different energy sources with one shared bus:

- current kinetic energy;
- surface wave energy;
- solar;
- salinity gradient;
- chemical/mineral gradient.

Do not force all branches into one product.

The shared bus lets site economics choose.

## 10. Matter multiplexing

The same hub may support research or commercial process cartridges:

- desalination;
- ion capture;
- magnesium/calcium recovery;
- environmental sample concentration;
- antifouling chemistry;
- corrosion monitoring.

A cartridge may consume energy rather than store it.

This is acceptable if its product/service value exceeds the energy cost.

## 11. Dockable storage

Storage itself can become removable.

A service vehicle could exchange:
- battery pod;
- IonCell cartridge;
- mineral cartridge;
- sensor package.

Instead of retrieving the generator, retrieve the **organ** that needs service.

This also allows rapid experiments without reopening the core wet end.

## 12. Morphological economy

Design around interfaces rather than monoliths.

Stable interfaces:
- DC bus;
- pressure bus;
- data schema;
- FlowPort mechanical envelope;
- telemetry;
- safety states.

Evolving organs:
- harvester;
- storage;
- chemistry;
- sensors;
- service robot;
- communications;
- surface/shore gateway.

The platform can evolve without invalidating deployed infrastructure.

## 13. Relation to 561 Group math

A distributed FlowCell Commons gives a richer mathematical testbed than one turbine.

Local observations exist on:
- each harvester;
- each storage organ;
- each FlowPort;
- each robot;
- environmental sensors.

Global questions:
- are local estimates mutually compatible?
- where is inconsistency localized?
- can the system settle to safe operation under contradictory observations?
- which components can disappear without loss of global function?
- when does local maintenance preserve global availability?

This supports direct empirical tests of:
- sheaf consistency;
- Laplacian fault energy;
- FOUR-valued support/contradiction;
- closure/fixed-point control;
- causal event structure.

## 14. New candidate products

### FlowCell Field Station
Current harvester + battery + sensor bus + communications.

Customer:
researchers, environmental monitoring, remote infrastructure.

### FlowCell Dock
Field Station + one or more FlowPorts.

Customer:
AUV/ROV/sensor operators.

### FlowCell Farm
Many harvesters + shared hub.

Customer:
remote microgrid / aquaculture / harbor.

### FlowCell Lab
Instrumented platform with swappable experimental chemistry/material modules.

Customer:
universities / R&D / internal 561 research.

### FlowCell Commons
Multiple hubs and mobile service agents sharing energy/data/service capacity.

Long horizon.

## 15. Cheap experiments

### C1 — FlowPort bench
Build aligned and misaligned inductive couplers in:
- air;
- freshwater;
- synthetic seawater.

Measure:
- power;
- efficiency;
- heating;
- alignment tolerance;
- data transfer;
- fouling surrogate gap.

### C2 — Blind docking
Small ROV approaches passive funnel and docks without exposed electrical contacts.

Pass:
repeatable capture + power handshake.

### C3 — Resident cleaner
Tiny tethered or free-swimming cleaner services a fouled coupon/mini-harvester and returns to dock.

Metric:
cleaning energy + robot wear versus recovered lifetime generation.

### C4 — Surface/no-surface trade
Model:
- buoy drag;
- waves;
- ice;
- comms;
- retrieval;
- navigation hazard;
- cost.

### C5 — Modular organ swap
Exchange sensor/storage cartridge without opening central housing.

### C6 — Commons fault test
Disconnect one harvester, one sensor, one storage unit and one comms path.

Measure:
continued useful service and fault localization.

## 16. Commercial selection criterion

For early customers optimize:

`annual value delivered - annual intervention cost`

not:

`annual kWh × retail electricity price`

This opens applications where persistent underwater operation is expensive enough that even modest energy production has high leverage.

## 17. External anchors

- 2026 review of underwater energy and wireless charging:
  https://www.mdpi.com/1996-1073/19/3/708
- 2024 review of underwater wireless power:
  https://www.mdpi.com/1996-1073/17/10/2305
- 2025 simultaneous underwater wireless power/data prototype:
  https://doi.org/10.1016/j.rineng.2025.108027
- 2025 overview of underwater WPT:
  https://www.sciopen.com/article/10.26599/OCEAN.2025.9470008
- PNNL marine-energy innovation / blue economy:
  https://www.pnnl.gov/marine-energy-innovation
- PNNL environmental monitoring:
  https://www.pnnl.gov/environmental-monitoring-marine-energy
- USGS Great Lakes zebra mussel profile:
  https://nas.er.usgs.gov/queries/greatLakes/FactSheet.aspx?HUCNumber=DGreatLakes&Potential=N&Species_ID=5&Type=1