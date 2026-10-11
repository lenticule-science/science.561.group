# FlowCell Morphology Tournament v0.1

**Date:** 2026-10-01  
**Status:** execution framework  
**Purpose:** preserve radical design space while forcing rapid falsification.

## 1. Tournament rule

The 0.60 m axial FC-1 design is now the **reference/control**, not the presumed final product.

No challenger graduates because it is novel. It must beat the control on one or more
customer-relevant axes while remaining acceptable on the others.

Primary axes:

1. useful net Wh over deployment;
2. peak and fatigue mooring/structural load;
3. wet mass and deployment burden;
4. submerged precision-interface count;
5. human intervention hours;
6. predicted manufacturing cost at 10 / 100 / 1,000 units;
7. graceful degradation;
8. freshwater/saltwater portability;
9. environmental compatibility;
10. customer value beyond electricity.

Do **not** collapse these into one weighted score until measurements exist.
Maintain a Pareto set.

## 2. External evidence that changes the search

### Soft hydraulic harvesters are real enough to test

Peretz et al. (Device, 2026) report a soft, modular wave-energy harvester using a
Kresling-inspired elastomeric pump; pumped seawater drives a turbine. The key lesson
for FlowCell is not "copy a wave device," but that compliant marine structures can
turn distributed deformation into hydraulic flow with few rigid parts.

Cornell's prior electrolytic vascular robot demonstrated that a redox-flow
electrolyte can simultaneously serve as an energy-storage medium and hydraulic
force-transmission/actuation fluid. That makes the Vascular Reef's eventual
"battery blood" a legitimate research hypothesis rather than a purely fictional
analogy.

### Fluid-structure metamaterials are becoming an engineering design space

A 2026 Nature Communications review describes architected materials specifically as
tools for controlling fluid-structure interaction, vibration, drag, lift, acoustic
response, and flow-induced instabilities. This justifies testing MetaFin as a
material/control architecture rather than treating compliance as a nuisance.

### VIV is a legitimate challenger, not just a failure mode

A 2025 Ocean Engineering review concludes that two-degree-of-freedom VIV harvesters
can harvest in both cross-flow and in-line directions and can exceed corresponding
1DOF systems on several energy-related measures. ReedCell therefore deserves a
small physical trial even if its eventual power density loses to rotors.

### Modular aquatic reconfiguration is practical at small scale

FloatForm (Nature Communications, 2026) demonstrates eight autonomous water-surface
modules self-assembling, reconfiguring, and collectively moving while exposed to
hydrodynamic disturbances. FlowCell should not infer that an underwater energy farm
can already do this, but modular docking/reconfiguration is sufficiently mature to
justify Colony/Commons experiments.

### Flexible underwater accumulators have strong coupling to currents

Recent UWCAES work shows that current velocity and inflation state can strongly
affect flexible accumulator motion and mooring tension. LungCell therefore cannot
treat buoyancy/pressure storage as a passive add-on; the storage state becomes part
of hydrodynamics.

### Self-healing ionic membranes now produce measurable salinity-gradient power

A 2026 ACS Applied Materials & Interfaces paper reports a self-healing hydrogel
membrane producing 6.35 W/m² under seawater/river-water mixing. Another 2026 paper
reports substantially higher laboratory power density under a 50-fold NaCl
gradient. These are not kW powertrain results, but they justify keeping
self-healing ionic "skin/gill" modules alive for sensing, estuary energy, and
material-science experiments.

## 3. Candidate registry

See:
`flowcell_morphology_candidate_registry_v0_1.csv`

Current families:

- RotorCell — axial rotor control.
- RimCell — integrated rim generator.
- KiteCell — cross-current tethered wing.
- FinCell — pitching/heaving foil.
- ReedCell — VIV/flutter harvester.
- VascularReef — shared hydraulic/electrofluid PTO.
- LungCell — pressure storage + buoyancy/depth.
- MetaFin — architected compliant foil.
- SubseaCommons — persistent energy/data/service platform.

The registry includes each candidate's physical principle, interface burden, main
risk, cheap falsification test, and explicit demotion criterion.

## 4. Common experimental constitution

Every physical test reports:

### Resource
- water velocity and direction;
- turbulence proxy/intensity where measurable;
- water temperature;
- water density/conductivity as relevant;
- blockage/test-section geometry.

### Conversion
- gross mechanical/electrical output;
- parasitic consumption;
- **net** electrical output;
- startup/cut-in;
- operating bandwidth.

### Loads
- streamwise load;
- transverse load;
- torque or oscillatory load;
- peak and RMS values;
- load spectrum where possible.

### Intervention
- assembly time;
- deployment time;
- recovery time;
- cleaning/service time;
- number of seals, bearings, wet connectors, valves and precision wet interfaces.

### Failure
- deliberate single faults;
- debris surrogate;
- sensor loss;
- power-electronics load rejection;
- fouling/roughness surrogate where relevant.

No architecture gets to claim "simple" without counting interfaces and interventions.

## 5. Stage 0 — digital and table-top screening

Before fabricating full devices:

### 0A — morphology graph
Encode every candidate as:
- energy-input relation;
- mechanical transformation;
- PTO;
- storage;
- support/mooring;
- sensing;
- maintenance;
- deployment/recovery.

This enables structural comparison even when equations differ.

### 0B — equal-boundary numerical screen
Use common site cases:

**Case FW-Low:** 1.0 m/s persistent freshwater current  
**Case FW-Mid:** 1.5 m/s  
**Case FW-High:** 2.5 m/s  
**Case SW-Tidal:** idealized reversing current, 2.5 m/s peak  
**Case Gust:** short 1.5× speed excursion  
**Case Debris:** mechanical interruption / strike scenario

Not every model will have comparable fidelity. The goal is to identify impossible
requirements and expensive tests, not declare a winner by simulation.

### 0C — interface tax
For each candidate count:
- dynamic seals;
- bearings;
- submerged connectors;
- flexible hoses;
- valves;
- exposed precision gaps;
- controlled degrees of freedom;
- unique custom components.

This becomes a first-order maintenance prior.

## 6. Stage 1 — Morphology Derby

Build small physical specimens with similar projected area, similar material budget,
and the same test channel.

At minimum:
1. axial RotorCell;
2. FinCell;
3. 2DOF ReedCell;
4. one flexible pump element feeding a hydraulic load.

Primary outputs:

`W / projected m²`  
`W / N mean streamwise load`  
`Wh / wet kg`  
`operating bandwidth`  
`interfaces / 100 W`  

This test should be deliberately ugly and cheap. Precision comes after survival.

## 7. Stage 2 — multifunction mutations

Only surviving morphologies receive expensive mutations.

### MetaFin mutation
Rigid control vs equal-mass architected compliant foil.

Required win:
higher integrated useful energy at equal peak structural load,
or lower peak/fatigue load at equal energy.

### Vascular Reef mutation
Four or more harvesters feed one accumulator/PTO.

Required win:
a one-harvester fault does not stop the system, and shared PTO reduces total
generator/interface burden enough to offset hydraulic losses.

### Electrofluid mutation
After hydraulic behavior is understood, replace inert laboratory fluid with an
electrochemically active working fluid.

Required win:
combined storage/hydraulic architecture must delete enough parts or mass to justify
coupling the two functions.

### Rim mutation
Small flooded-gap rim alternator.

Required win:
lower wet-interface burden without unacceptable efficiency, sediment, fouling or
bearing penalties.

### Lung mutation
Pressure accumulator mechanically couples to buoyancy/depth.

Required win:
either useful short-duration storage/smoothing or a valuable autonomous
depth/recovery function; otherwise retain only as emergency buoyancy.

## 8. Stage 3 — Subsea Commons

After at least one harvester survives Stage 2:

### FlowPort
Build contactless power/data dock.

### Resident client
Small ROV/sensor node repeatedly:
1. finds hub;
2. docks;
3. negotiates;
4. charges/transfers data;
5. releases.

### Service trial
The client inspects or cleans a test harvester.

The platform graduates only if customer-value metrics improve:
- fewer retrievals;
- fewer wet-connector cycles;
- fewer boat hours;
- more data uptime.

## 9. Stage 4 — material metabolism

Run the FlowCell skin/gill program as a service-energy problem.

Candidate functions:
- active antifouling;
- self-healing coating;
- self-healing ionic membrane;
- corrosion passivation;
- reversible mineral deposition;
- local pH control.

Measure:

`maintenance energy invested`
versus
`lifetime generation/service value preserved`.

The correct comparison is not "active maintenance uses energy therefore it is bad."
The question is whether it reduces total intervention and preserves more useful
output than it consumes.

## 10. Science tournament

The 561 Group theories run in **shadow mode**.

They may consume the same telemetry but must not control safety-critical hardware
until they beat conventional baselines.

### Sheaf / Laplacian
Comparator:
ordinary residual/Kalman/Bayesian or rule-based diagnostics.

Pass:
statistically lower fault-localization delay at equal false-alarm rate, or same
performance with fewer sensors.

### FOUR
Comparator:
Boolean health-state logic.

Pass:
fewer unnecessary shutdowns under contradictory sensors without increasing missed
unsafe states.

### Settling / closure
Comparator:
conventional estimator/controller.

Pass:
better convergence/recovery under missing/inconsistent distributed observations.

### Material memory
Comparator:
memoryless rigid/uniform material.

Pass:
better deployment-integrated energy/load/fatigue tradeoff.

A failed comparison narrows or retires the engineering claim. It does not get
rescued by philosophical fit.

## 11. Explicit demotion rules

A branch is demoted when any one of these persists through two design iterations:

- cannot produce stable useful output in the target flow range;
- requires more human intervention than the control without creating compensating
  customer value;
- produces less useful lifetime energy and no major safety/ecological advantage;
- demands a submerged precision interface whose service burden dominates the system;
- only wins under unrealistic laboratory boundary conditions;
- requires launch-critical experimental chemistry/materials;
- cannot be manufactured/assembled at prototype scale without specialist processes
  that block learning.

Demoted does not mean deleted. It becomes a scientific branch until new evidence
changes the boundary conditions.

## 12. The first build order

1. **T0 RotorCell instrumentation rig** — reference.
2. **T1 FinCell + ReedCell derby specimens**.
3. **T3 four-element hydraulic manifold**.
4. **T2 MetaFin passive-compliance variants**.
5. **T5 miniature flooded RimCell generator**.
6. **T7 FlowPort bench coupler**.
7. **T8 active-skin coupon rig**.
8. Only then: larger wet hardware.

This order maximizes information gained per dollar and avoids premature commitment
to the 1.2 kW reference turbine.

## 13. Source anchors

- Peretz et al., *Device* (2026), “Modular, scalable, and resilient soft wave energy harvester”:
  https://www.sciencedirect.com/science/article/pii/S2666998626001183
- Cornell Organic Robotics Lab, current energy program:
  https://orl.mae.cornell.edu/
- Aubin et al., *Nature* (2019), “Electrolytic vascular systems for energy-dense robots”:
  https://www.nature.com/articles/s41586-019-1313-1
- “Metamaterials and Fluid Flows,” *Nature Communications* (2026):
  https://www.nature.com/articles/s41467-026-70163-2
- Rashki et al., *Ocean Engineering* (2025), 2DOF VIV review:
  https://www.sciencedirect.com/science/article/pii/S0029801825000915
- Wang et al., *Nature Communications* (2026), FloatForm:
  https://www.nature.com/articles/s41467-026-74527-6
- Huang et al., *Ocean Engineering* (2026), flexible UWCAES accumulator:
  https://doi.org/10.1016/j.oceaneng.2026.125353
- Zhang et al., *ACS Applied Materials & Interfaces* (2026), self-healing osmotic hydrogel:
  https://pubs.acs.org/doi/10.1021/acsami.6c01779