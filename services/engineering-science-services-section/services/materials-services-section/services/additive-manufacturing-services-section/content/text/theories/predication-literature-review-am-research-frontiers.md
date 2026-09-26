---
type: prose
class: literature-review
status: draft
title: A literature review of the additive-manufacturing research frontier (2018–2026)
description: This narrative surveys the active research frontiers in AM as of mid-2026 and is intended as the orienting literature review for a researcher entering the field.
---

# A literature review of the additive-manufacturing research frontier (2018–2026)

This narrative surveys the active research frontiers in AM as of mid-2026 and is intended as the orienting literature review for a researcher entering the field. It is organized by problem rather than by process family; the same problem (e.g., residual stress, in-situ monitoring) recurs in different forms across processes and the cross-process view is more useful than a per-process one.

## 1. The process–structure–property (PSP) chain

The unifying frame established by [DebRoy et al. (2018)](./predication-debroy-et-al-2018.md) is that all of AM is one problem: predict the local thermal (or photochemical, for VPP) history from the deposition parameters, predict the resulting microstructure from that history, and predict the mechanical and functional properties from that microstructure. Each link is partially understood:

- **Process → thermal history.** For metal LPBF the [Rosenthal moving-source](https://en.wikipedia.org/wiki/Rosenthal%27s_equation) solution and its corrections (Eagar–Tsai, modern multi-physics CFD via FLOW-3D AM, ALE3D, ExaAM) give melt-pool dimensions to within ~15% on common alloys. For FFF the analog is Bellini's pressure-driven non-isothermal melt extrusion model; less mature.
- **Thermal history → microstructure.** For metals: well-developed maps for AlSi10Mg, Ti-6Al-4V, IN718, 316L (DebRoy 2018, Bourell 2017). For polymers: layer adhesion is a chain-interdiffusion problem, modeled by Yang–Pitchumani (2002) for FDM, extended by Spoerk et al. (2017–2020).
- **Microstructure → properties.** Best understood for static tensile properties; fatigue and fracture toughness still depend on porosity and surface roughness in ways that are difficult to predict (Sanaei & Fatemi, 2021).

The PSP framing is the implicit basis of every modern AM process-modeling paper. Polymer AM is roughly a decade behind metal AM on each link.

## 2. In-situ monitoring and digital pedigree

The promise: instrument every layer of every build, detect defects as they form, either correct in-process or build a per-part pedigree that lets the part be certified individually rather than by lot statistics. The literature divides into:

- **Sensing.** [Everton et al. (2016)](./predication-everton-et-al-2016.md) cataloged the modalities; thermal imaging, photodiode pyrometry, acoustic emission, optical tomography, high-speed imaging. The hardware is mature.
- **Detection.** Deep-learning models trained on labeled defect datasets (Scime & Beuth 2018, Snow et al. 2021) achieve >95% defect classification accuracy on lab benchmarks. The gap is in *generalization* across machines, materials, and part geometries.
- **Closed-loop control.** Thermal feedback to laser power has been demonstrated in lab settings (Renken et al. 2019) but is not yet in production systems. The control-theory problem is hard because the disturbances are fast (microsecond) and the actuators (laser, scanner) are correspondingly fast but the diagnostic loop must run at that rate.
- **Pedigree-based qualification.** Proposed in principle (NIST AM CoE roadmap, 2020–) but no regulator has yet accepted a per-part pedigree in lieu of statistical qualification. This is the choke-point. See [Seifi et al. (2017)](./predication-seifi-et-al-2017.md).

## 3. Residual stress, distortion, and cracking

Distinguish:

- **In-process distortion** (warping during build, before removal from build plate): in metal AM driven by thermal contraction; in FFF by polymer cooling shrinkage. The cooling–warping tradeoff is captured in the [cooling-warping-tradeoff](./predication-cooling-warping-tradeoff.md) theorem.
- **Post-process distortion** (springback after removal from plate, after stress-relief heat treatment): driven by *integrated* residual stress through the part. Predictable in principle (inherent strain method, FEA) but practically requires expensive simulation.
- **Cracking.** In metal AM, hot cracking is the failure mode that has prevented AM of high-strength aluminum alloys (7000-series) and most nickel superalloys until the recent (2020–) wave of "AM-tailored" alloys (e.g., Scalmalloy, ABD-900AM).

The simulation tools (Ansys AM, Simufact AM, Netfabb Local Simulation, ESI's PSP suite) are now usable in production engineering offices; the research frontier has moved to faster surrogate models, often deep-learning-based, replacing FEA for design-time iteration.

## 4. Topology optimization, lattices, and design-for-AM

AM's design freedom enables — and standard topology optimization (TO) algorithms produce — geometries that conventional machining cannot make. The research questions are:

- **TO with AM constraints.** Self-supporting overhang constraints, minimum feature size, build orientation as a TO variable (Allaire et al. 2017, Langelaar 2018, Mirzendehdel & Suresh 2019).
- **Lattice design.** TPMS (gyroid, Schwarz-P), strut-based (octet, BCC), stochastic (Voronoi). Mechanical homogenization is well-established; functional behavior (heat exchange, energy absorption) is the active frontier (Maskery et al. 2018, Al-Ketan & Abu Al-Rub 2019).
- **Generative AI for design.** Neural-network-generated geometry for AM is a 2022– research wave; commercial tools (nTopology, Carbon Design Engine) are productizing what was a research curiosity in 2020.

The corresponding library frontier: a [generative-design-for-am](./predication-generative-design-for-am.md) entry asking when ML-generated geometry will reach engineering acceptability.

## 5. Multi-material and functionally-graded AM

Single-material AM is largely solved as a research problem. Multi-material AM — printing parts with spatially-varying composition — is the frontier:

- **Polymer-polymer multi-material.** PolyJet (Stratasys) routinely combines rigid and flexible photopolymers. Multi-nozzle FFF (Prusa XL, Bambu AMS) does discrete material switching. The materials-interface adhesion problem is mostly empirical.
- **Metal-metal.** DED is the dominant modality (Hofmann et al. 2014); LPBF multi-material is research-grade only.
- **Polymer-metal hybrid.** Aerosol jet, embedded electronics, conductive-thermoplastic FFF (Espalin et al. 2014). The 3D-printed-electronics frontier.

The [multi-material-interface-strength](../../../services/fused-filament-fabrication-services-section/content/text/theories/predication-multi-material-interface-strength.md) question covers the FFF case.

## 6. Sustainability, recycling, and circularity

A 2020– research frontier driven by the realization that distributed manufacturing is only "green" if the feedstock loop is closed:

- **Recyclate FFF feedstock.** Open-source projects (Precious Plastic, RecycleBot) and commercial extruders (Filabot, 3devo) make local recycling feasible. The mechanical properties of recycled feedstock degrade with each cycle; the open question is how many cycles a polymer can sustain (Sanchez et al. 2017, Cruz Sanchez et al. 2020).
- **Bio-based feedstocks.** PLA was the first; PHA, lignin-filled, cellulose-filled feedstocks are the active frontier.
- **End-of-life of metal AM parts.** Currently no different from forged or cast metal — recycle as scrap. The interesting question is whether the *near-net-shape* nature of AM reduces the embodied energy enough to offset the higher in-process energy of LPBF (DebRoy et al. argue yes for low-volume aerospace; the LCA literature is contested).

## 7. Standardization and certification

The institutional frontier. Four bodies matter: ASTM F42, ISO TC261 (jointly publishing the 52900 series, see [iso-astm-52900-2021](./predication-iso-astm-52900-2021.md)), America Makes (US national institute), and the EU's AMable / Manufuture roadmaps. The current state:

- **Process and feedstock standards.** Mature (52907 metal powders, 52911 DED design, 52915 AMF data format).
- **Test methods.** Mostly mature, with active work on fatigue (52909) and surface finish (52911-2).
- **Qualification frameworks.** The frontier. NIST AM CoE, FDA, and FAA are running parallel programs. The medical-device community is ahead (FDA AM guidance 2017, updated 2024); aerospace is following.

Without certification frameworks, AM remains a low-volume technology in the regulated sectors that have the most to gain from it.

---

## What this review does not cover

Construction-scale AM (Buswell et al. 2018), bio-printing (Murphy & Atala 2014), food printing, and ceramic AM each deserve their own review. They are excluded here because the AM theory in this library currently focuses on polymer (FFF, vat photopolymerization) and metal (PBF, DED) for engineered components.
