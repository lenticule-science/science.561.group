# FlowCell Program Charter v0.2

**Program:** Turntide Islands / 561 Group  
**Date:** 2026-10-01  
**Status:** active R&D / pre-prototype

## 1. Product thesis

FlowCell is a deployable **water-current energy platform** for remote, island, waterfront, research, emergency, and off-grid users. The system is not limited to astronomical tides: the same wet-end should work in tidal streams, rivers, channels, estuaries, and other persistent currents.

The product architecture is deliberately split into:

1. **Wet end** — turbine, generator, structure, mooring, cable, sensors.
2. **Dry end** — rectification, protection, controls, telemetry, DC bus and standardized storage interface.
3. **Storage organ** — initially third-party certified conventional storage; later interchangeable experimental electrochemical/mineral-gradient modules.
4. **Site model** — current measurement, expected energy yield, anchoring, deployment/retrieval, environmental constraints, permitting.

The v1 product must not depend on experimental storage chemistry. Experimental chemistry is a parallel program connected through the same DC bus.

## 2. Reference product family

### FC-1 field demonstrator

Purpose: first crowdfundable, boat-deployable, independently testable system.

Provisional targets:
- 0.5–1.5 kW rated electrical output depending on final rotor/site design.
- roughly 0.5–0.7 m rotor class at high-flow sites.
- two-person or small-winch deployment.
- variable-frequency three-phase permanent-magnet generator.
- shore/buoy-side rectification and control.
- standard external certified ESS/inverter rather than an integrated battery.
- fresh- and salt-water material stack.
- instrumented power curve and public operating dataset.

FC-1 exists to establish manufacturability, installation workflow, reliability, measured power curves, service intervals and customer demand.

### FC-5 community unit

Purpose: remote microgrid, research station, aquaculture, harbor, island and critical-load supply.

Benchmark neighborhood:
- Guinard P66: 3.5 kW at 3 m/s, 90 kg, 1.5 m minimum depth.
- SMART Free Stream: 5 kW, 1 m rotor, 300 kg, maximum power near 3.1 m/s.
- New Energy EVG-005s: salt-water-rated 5 kW turbine demonstrated on a bidirectional floating mount.

Provisional targets:
- 3.5–5 kW rated.
- approximately 1 m rotor class.
- recoverable moored/subsurface deployment.
- direct-drive PM generator where practical.
- full instrumentation and fail-safe electrical braking.
- optional PV hybridization.
- compatible with certified stationary storage and grid-forming inverters.

## 3. Mechanical architecture

Preferred first deployment geometry:

**surface service buoy → tether/electrical umbilical → positively buoyant turbine pod → seabed mooring**

The seabed mooring carries hydrodynamic loads. The surface buoy provides:
- retrieval reference;
- communications/GNSS;
- status indication;
- optional dry electronics;
- optional quick-disconnect/service interface.

Do not make an ordinary anchored boat the permanent reaction structure.

Key requirements:
- reversible-current alignment by yaw/free orientation or validated bidirectional rotor architecture;
- debris-tolerant rotor/guard design;
- recoverability without divers for routine service where feasible;
- corrosion-resistant material pairing;
- galvanic isolation;
- replaceable sacrificial protection where used;
- subsea-rated connectors;
- inspectable seals;
- ice-season removal capability for Great Lakes deployments;
- no single submerged electronics enclosure whose failure requires replacing the whole turbine.

## 4. Electrical architecture

Do not freeze a 48 V underwater transmission architecture. At 5 kW it produces excessive cable current over useful distances.

Engineering trade study must compare:
- variable-frequency three-phase export to the dry end;
- rectified higher-voltage DC export;
- conversion efficiency;
- touch/shock protection;
- connector and cable availability;
- fault isolation;
- underwater leakage detection;
- electromagnetic compatibility;
- maximum practical shore distance.

Dry-end functions:
- active rectifier / hydro MPPT;
- overvoltage and overspeed protection;
- electrical brake;
- dump load;
- isolation;
- instrumentation;
- telemetry;
- DC bus;
- interface to certified ESS/inverter;
- optional solar DC input.

For U.S. products, certification planning should avoid unnecessarily making FlowCell itself a novel battery or inverter. UL 1741 covers relevant inverter/controller equipment; UL 1973 covers stationary battery systems; UL 9540 covers complete ESS equipment. A major v1 strategy is therefore to integrate already-certified storage/inverter products rather than recertify an entire custom ESS.

## 5. Marine-energy standards basis

Design and test planning should map to the IEC 62600 family, especially:
- IEC TS 62600-2:2019 — marine energy systems design requirements.
- IEC TS 62600-201:2025 — tidal resource assessment and characterization.
- IEC TS 62600-200 — tidal/current converter power performance.
- relevant power-quality and prototype-testing parts as the design matures.

A serious site assessment must use measured current profiles rather than tide-table height alone.

## 6. Freshwater / saltwater design

FlowCell is a **current converter**, not inherently a tidal device.

Saltwater design threats:
- chloride corrosion;
- galvanic couples;
- marine fouling;
- higher conductivity / leakage paths;
- biofilm and organism growth.

Great Lakes / freshwater threats:
- ice;
- debris;
- seasonal recovery;
- lower conductivity;
- different fouling community;
- site-specific river/channel sediment and turbidity.

The mechanical/electrical wet end should be shared between water types as far as possible. Storage chemistry may differ by environment.

## 7. Storage program

### Baseline storage

Use third-party certified LFP or another commercially mature stationary ESS for prototype and launch.

This is the control condition. Experimental storage must beat it on a defined criterion before replacing it.

### IonCell-S — seawater battery branch

Research basis: modern seawater batteries directly use sodium ions from seawater during charge/discharge via selective solid electrolytes and electrochemical reactions.

Questions:
- Can an ambient-seawater positive side coexist with a maintainable marine-energy platform?
- Can fouling/scaling be controlled for long-duration unattended use?
- Is system-level specific energy, cost and service life competitive for stationary maritime deployment?

### GradientCell — concentration battery branch

Closed-loop electrodialysis/reverse-electrodialysis storage.

Advantages:
- energy capacity and power capacity can be scaled somewhat independently;
- benign aqueous electrolytes are possible;
- freshwater and saltwater sites can use the same internal chemistry.

Known challenge:
- published experimental round-trip efficiencies remain much lower than LFP, with osmosis and membrane resistance important losses.

### MineralCell-X — mineral-coupled research branch

Test whether reversible ion/pH/mineral state changes can store useful recoverable electrical energy.

The pass criterion is **not** “we precipitated a mineral.” It is:
- measured charge energy;
- measured discharge energy;
- repeatable cycling;
- mass balance;
- ion balance;
- pH/redox accounting;
- defined round-trip efficiency;
- comparison against simpler electrochemical baselines.

Relevant directions include:
- Ca/Mg precipitation and dissolution;
- electrochemically switched pH gradients;
- selective ion membranes;
- self-organizing inorganic membranes;
- anti-scaling / self-shedding electrode surfaces.

## 8. Connection to 561 Group science

FlowCell should be an experimental pressure source for existing research, not a prop used to “confirm” it.

### A. Sheaf / cohomology sensor fusion

Represent local measurements from:
- rotor RPM;
- phase currents;
- voltage;
- bearing vibration;
- tether load;
- depth;
- current profiler;
- temperature;
- leakage;
- salinity/conductivity;
- battery/controller states

as local sections with explicit restriction maps into shared physical quantities.

Compare:
- ordinary residual/Kalman/Bayesian fault detection;
- sheaf-Laplacian inconsistency energy;
- obstruction-like cycle residuals.

Engineering pass condition:
the relational model must detect, classify, or localize faults earlier or more reliably than simpler baselines.

### B. FOUR-valued fault logic

For each safety claim, retain evidence **for** and **against** rather than forcing premature Boolean collapse.

Example:
“bearing healthy” may have vibration evidence against while temperature/current evidence still supports.

Test:
- false-trip rate;
- unsafe-miss rate;
- recovery after sensor failure;
- graceful operation under contradictory telemetry.

### C. Closure / settling dynamics

Use fixed-point/settling models for distributed control and state estimation.

Test whether the proposed closure dynamics improve:
- convergence under missing observations;
- controller stability;
- fault isolation;
- restart after communication loss.

### D. Material memory and self-repair

Marine hardware is a strong assay environment for dynamic-siloxane / self-healing materials.

Candidate real engineering tests:
- seal or encapsulant damage;
- repeated crack/heal cycles;
- immersion;
- insulation resistance;
- water ingress;
- mechanical recovery;
- history dependence.

### E. Energy-coupled maintenance / chemical gardens

The existing R5 program already asks whether ongoing free-energy throughput is causally required to maintain a mineral-membrane function.

FlowCell can supply a real hydraulic/electrical energy source and an instrumented current environment for:
- flow-fed mineral membranes;
- interruption/restart experiments;
- transport/selectivity measurements;
- electrochemical potential/current;
- rupture/reseal tests.

This is a genuine bridge between product engineering and the Artificial Abiogenesis / Smartgoo program.

### F. Causal/event models

Every prototype event should be logged:
- sensed state;
- controller action;
- power state;
- protection action;
- human intervention;
- failure/recovery.

Use these traces for causal fault hypotheses. A formalism only graduates from “interesting analogy” when it produces falsifiable predictions or better control/diagnosis.

## 9. Prototype ladder

### EVT-0 — digital / analytical

Deliverables:
- requirements tree;
- architecture;
- rotor/generator sizing model;
- mooring load cases;
- corrosion/material compatibility table;
- cable-loss model;
- FMEA;
- environmental hazard register;
- permitting map;
- manufacturing split;
- preliminary BOM;
- CFD plan;
- control simulation;
- chemistry bench protocols.

### EVT-1 — benchtop

Build:
- generator/controller dyno rig;
- dummy load / brake;
- telemetry stack;
- wet connector/leak test;
- material coupons;
- IonCell/GradientCell/MineralCell rigs.

### EVT-2 — scaled water test

Build a scale wet end for:
- rotor curves;
- yaw/reversal;
- debris;
- vibration;
- tether loads;
- controls;
- fish/environmental observation method development.

Minnesota opportunity:
the University of Minnesota St. Anthony Falls Laboratory has a main channel used for marine hydrokinetic research and offers applied/third-party testing and fabrication.

### DVT-1 — full functional prototype

One full-size unit must demonstrate:
- measured power curve;
- sustained operation;
- braking/protection;
- deployment/retrieval;
- current reversal or alignment;
- fault telemetry;
- wet-environment durability.

### DVT-2 — field pilot

Minimum suggested launch gate:
- 100+ cumulative wet operating hours;
- multiple deployment/retrieval cycles;
- documented faults and corrective actions;
- independent or third-party measurements where practical;
- power curve tied to measured flow;
- service procedure;
- preliminary environmental observations;
- stable BOM.

### PVT — production validation

Target quantities are planning assumptions, **not supplier commitments**:
- 3 EVT units;
- 10 DVT units;
- 25 PVT units;
- 50–100 first commercial run if demand and supplier economics support it.

No Kickstarter goal should be set from these targets until real RFQs are received.

## 10. Manufacturing strategy

Do not ask one factory to invent the entire product.

Split the supply chain:
- rotor/blades;
- marine frame/structure;
- PM generator;
- bearings/seals;
- subsea cable/connectors;
- controller PCB/PCBA;
- dry enclosure;
- sensors;
- mooring/anchor hardware;
- packaging.

Final integrator receives controlled drawings, approved-vendor list, firmware, calibration procedure and end-of-line test fixtures.

Avoid tooling-heavy cosmetic parts in v1. Prefer:
- machined/welded structures;
- standard enclosures;
- standard fasteners;
- replaceable wear parts;
- low-volume PCBA.

Current low-volume PCB assembly services explicitly support quantities from a few boards through thousands, so electronics need not force a large initial MOQ. The likely MOQ drivers are custom generator, rotor/blade manufacturing, marine castings/composites and final assembly economics.

Factory selection:
1. identify 10;
2. diligence 5;
3. sample/RFQ 3;
4. select 1 primary plus qualified alternates for critical components.

## 11. Crowdfunding strategy

Kickstarter is reward crowdfunding, **not equity investment**. Backers do not receive ownership or financial returns.

Launch only after a working prototype exists. Kickstarter states that hardware creators should demonstrate major promised functionality with real prototypes; photorealistic renderings cannot substitute for actual operation.

Current U.S. fee planning:
- 5% Kickstarter platform fee;
- approximately 3–5% payment processing.

Funding goal model:

`goal = NRE + tooling + certification/testing + production deposit + freight/logistics + fulfillment + warranty reserve + taxes/duties + platform/payment fees + contingency`

Do not use an artificially tiny goal for marketing optics.

Current opportunity:
the Google × Kickstarter **Next Wave Fund** is accepting eligible early-stage U.S. technology companies on a rolling basis. Selected projects receive campaign support and a $10,000 pledge if the campaign funds successfully.

## 12. Kickstarter product choice

The strongest campaign sequence is:

**FC-1 first, FC-5 second.**

Why:
- FC-1 is easier to show operating;
- lower shipping and deployment burden;
- larger potential backer base;
- cheaper pilot batch;
- validates the same generator/control/service architecture;
- produces real reliability and manufacturing data needed by FC-5.

FC-5 should remain the community/industrial product and can use the campaign as lead generation for higher-value pilot customers.

## 13. Kickstarter launch gate

Do not launch until all are true:

- working FC-1 prototype exists;
- the campaign video can show actual water-to-electric operation;
- measured current and output are shown together;
- 100+ wet hours completed;
- retrieval demonstrated;
- at least three manufacturers have quoted the production packet;
- the chosen supplier has produced a sample/PVT article;
- landed cost is known within a bounded tolerance;
- certification/compliance path is written;
- fulfillment packaging has been tested;
- warranty reserve is budgeted;
- no reward depends on MineralCell/experimental chemistry.

## 14. Local research leverage

### UMD / Lake Superior

Current UMD work is directly adjacent:
- new maritime-engineering coursework includes Lake Superior field experience;
- current undergraduate research includes low-cost marine monitoring systems and river-turbine efficiency;
- the Large Lakes Observatory operates instrumented Lake Superior buoys;
- LLO researchers work on large-lake circulation, tides/seiches, internal waves and turbulence.

### St. Anthony Falls Laboratory

SAFL can potentially support:
- physical current testing;
- hydrokinetic turbine experiments;
- data acquisition;
- third-party testing;
- fabrication;
- CFD validation.

Its main channel is approximately 2.75 m wide × 1.8 m deep × 83.8 m long, up to 300 cfs, and explicitly lists marine hydrokinetic research among its uses.

## 15. Immediate work packages

### WP-01 Requirements and hazard model
Produce system requirements, operating envelope, misuse cases, FMEA and traceable verification method.

### WP-02 Hydrodynamic model
Rotor sizing, Cp/Ct assumptions, cavitation margin, thrust, yaw/reversal, debris and annual energy model.

### WP-03 Mooring/retrieval
Design drop/retrieve sequence, tether geometry, anchor sizing, buoyancy and emergency recovery.

### WP-04 Electrical/control
Generator selection, cable trade, rectifier/MPPT, protection, dump load, data system and external ESS interface.

### WP-05 Materials
Fresh/salt compatibility, galvanic table, coatings, seals, biofouling and ice/removal design.

### WP-06 Science instrumentation
Sheaf/FOUR/settling models implemented alongside conventional baselines with preregistered performance metrics.

### WP-07 Storage R&D
IonCell-S, GradientCell and MineralCell-X benchtop assays with strict energy/mass accounting.

### WP-08 DFM and sourcing
RFQ-quality drawings, BOM, supplier search, sample plan, QC and end-of-line testing.

### WP-09 Testing
Bench → flume → field test matrix aligned to IEC marine-energy methods where applicable.

### WP-10 Commercialization
Customer discovery, FC-1/FC-5 pricing model, Kickstarter campaign economics, Next Wave Fund application, pilot-partner pipeline.

## 16. Sources used in v0.2

- IEC TS 62600-2:2019 — https://webstore.iec.ch/en/publication/62399
- IEC TS 62600-201:2025 — https://webstore.iec.ch/en/publication/66064
- FERC hydrokinetic licensing — https://www.ferc.gov/licensing/hydrokinetic-projects
- Guinard P66 — https://www.guinard-energies.bzh/en/our-products/p66-hydrokinetic-turbine-3-5-kw/
- SMART Hydro Free Stream — https://www.smart-hydro.de/renewable-energy-systems/hydrokinetic-turbines-river-canal/
- New Energy rapid deployment EVG-005s — https://www.newenergycorp.ca/news-updates/rapidly-deployable-turbines
- Seawater batteries review (2026) — https://www.nature.com/articles/s44359-026-00158-1
- Concentration battery — https://www.sciencedirect.com/science/article/abs/pii/S0376738815300181
- Chemical-garden electrochemistry — https://onlinelibrary.wiley.com/doi/full/10.1002/anie.201501663
- Mg(OH)2 seawater recovery (2026) — https://www.sciencedirect.com/science/article/pii/S0926337326000901
- UL 1741 — https://www.shopulstandards.com/ProductDetail.aspx?productId=UL1741
- UL 1973 — https://www.shopulstandards.com/ProductDetail.aspx?productId=UL1973_3_S_20220225
- UL 9540 — https://www.shopulstandards.com/ProductDetail.aspx?productId=UL9540_3_S_20230628
- Kickstarter prototype/manufacturing guidance — https://updates.kickstarter.com/how-to-launch-a-product-on-kickstarter-part-1-creating-your-prototype-and-manufacturing-plan/
- Kickstarter fees — https://www.kickstarter.com/help/fees
- Google × Kickstarter Next Wave Fund — https://start.kickstarter.com/next-wave-fund
- UMN St. Anthony Falls Laboratory main channel — https://cse.umn.edu/safl/main-channel
- UMD maritime engineering — https://d.umn.edu/news/umds-new-maritime-engineering-track