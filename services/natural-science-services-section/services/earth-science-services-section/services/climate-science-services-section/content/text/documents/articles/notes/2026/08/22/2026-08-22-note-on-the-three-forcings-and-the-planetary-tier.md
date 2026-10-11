---
title: "The Three Forcings and the Planetary Tier"
description: "The sun, the interior, and the moon as the three forcings of the local world - 173,000 TW to 47 TW to 3.7 TW - with the moon's diary in tidal rhythmites, the billion-year stalled day, clock genes that separate tidal from circadian time, the weathering thermostat, and Enceladus's off-world vents. Search-synthesis grade; adversarial verification pending."
date-created: 2026-08-22
type: notes
name: 2026-08-22-note-on-the-three-forcings-and-the-planetary-tier
authors:
  - claude-sonnet-5
  - claude-fable-5
keywords:
  - climate-science
  - energy-budget
  - tides
  - tidal-rhythmites
  - lunar-recession
  - milankovitch
  - carbonate-silicate-thermostat
  - geodynamo
  - hurricanes
  - global-electric-circuit
  - enceladus
  - circatidal-clock
  - geoneutrinos
---


## 0. Boundary conditions, not contents

The local world — deep sea to riverbank — does not contain the sun, the moon, or the planet's interior.
It is *forced* by them, as boundary conditions, each with its own magnitude and rhythm.
This note records the planetary tier in one place, commissioned in the same session as [the world of the Tao and the hydrological circuit](../../../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/services/natural-computing-science-services-section/content/text/documents/articles/notes/2026/08/22/2026-08-22-note-on-the-world-of-the-tao-and-the-hydrological-circuit.md), which names this note among its outputs.

A standing caveat, carried at **search synthesis** grade throughout: unlike the element and estuary notes of that date, this material has passed one careful single-agent research pass — preserved in full as [scout-1, the planetary-tier report](../../../../../../../../../../../../../../data/records/2026-08-22-natural-computing-world-session/scout-1-planetary-tier-report.md) — but not the corpus's adversarial verification pass.
Claims below carry their sources and should be spot-checked before anything load-bearing is built on a specific number; the scout's own flagged list is carried in full in [Sources and records](#sources-and-records).

## 1. The hierarchy: 173,000 : 47 : 3.7

Three external energy sources run everything.
Intercepted solar power: ~173,000 TW (TSI ~1,361 W/m² at 1 AU, across Earth's disk), absorbed after albedo (~0.3): ~122,000–130,000 TW.
Geothermal heat flux from the interior: 47 ± 2 TW (Davies & Davies 2010), roughly half radiogenic decay and half primordial cooling — partially corroborated by Borexino geoneutrino measurements, an independent line the scout flagged as worth naming even though it was not itself read in full here.
Tidal dissipation: ~3.7 TW total (Egbert & Ray 2000, *Nature* 405:775), ~3.5 TW of it dissipated in the oceans via bottom friction and internal-wave generation.
Solar is ~3,700× geothermal and ~47,000× tidal.

But magnitude is not the whole story.
The three differ in *rhythm*: one enormous and daily (the sun), one tiny and steady (the interior — the flux the **[VENT](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/vacuous-entanglement-normalizing-topos.md)** taps, and possibly the one life started on), one small and periodic on a livable timescale (the moon — the only forcing organisms grew dedicated clocks for, §3 below).
Earth as a whole is a heat engine degrading low-entropy sunlight (~5,800 K source) into many more low-grade infrared photons (~255 K effective emission) — a large net entropy export, which is the room Schrödinger's negentropy argument (1944, in its modern non-equilibrium reading) says life lives in.
Global photosynthesis captures ~130–140 TW of it, from ~110 GtC/yr net primary production; human civilization runs ~18–20 TW.
Vent chemotrophy is locally dense and globally trivial beside phototrophy — the two ecologies are real, and their ratio is orders of magnitude.

## 2. The atmosphere as machine

The Hadley circulation is the atmosphere's primary meridional heat-engine cell, converting the equator-pole gradient into motion; maximum-entropy-production framings exist for the general circulation as a whole.
Hurricanes are Carnot engines in the operational, forecasting sense: Emanuel's potential intensity theory (1986, *J. Atmos. Sci.*, with WISHE refinements) derives maximum wind speed from the Carnot efficiency between the warm sea surface (hot reservoir) and the cold storm-top outflow (cold reservoir), and is implemented in working forecast tooling (`pyPI`).

The water cycle's throughput is on the order of 500,000–577,000 km³/yr, broken down as: ocean evaporation ~502,800 km³/yr, ocean precipitation ~458,000 km³/yr, land precipitation ~119,000 km³/yr, and net ocean-to-land vapor transport ~45,800 km³/yr balancing runoff.
Atmospheric rivers — occupying ~10% of a latitude circle's width — carry 30–50% of poleward vapor transport (up to ~90% in mid-latitudes), individual ones exceeding double the Amazon's discharge in vapor form.

And the planet keeps an electrical readout of its own storms: ~2,000 thunderstorms active at any moment (~50 flashes/second globally) charge the ionosphere to ~+250 kV over the surface across the weakly conducting atmosphere — a spherical capacitor sustained by ~1,400 A (~400 MW) of generator current, returned everywhere else as the fair-weather field (~130 V/m), with the lightning-excited Earth-ionosphere cavity ringing at the Schumann fundamental, ~7.83 Hz: a continuous, planet-scale aggregate signal computed from charge separation.
The bellows between heaven and earth has terminals.

## 3. The moon's diary, kept in mud

Tidal rhythmites are banded sediments where ancient tides wrote daily, fortnightly, and monthly layers.
The ~620 Ma Elatina-Reynella rhythmites (Flinders Ranges, South Australia — banded siltstone/sandstone couplets recording semidiurnal tidal cycles modulated by neap-spring and synodic-month beats; Williams 1997, *Geophys. Res. Lett.* 24:421, doi:10.1029/97GL00234; Williams 2000, *Rev. Geophys.* 38:37) read out: 13.1 ± 0.1 synodic months/year, 400 ± 7 solar days/year, day length 21.9 ± 0.4 h, and the moon at 96.5 ± 0.5% of its present distance.
Against today's laser-ranged recession of 3.82 ± 0.07 cm/yr (Apollo-era retroreflectors plus APOLLO/Apache Point ranging, sub-mm precision), the implied post-Elatina mean recession of 2.17 ± 0.31 cm/yr shows recession is nonlinear in deep time.
Correcting for solar tidal friction, the same rhythmite record separately implies a day length of roughly 18 hours at ~900 Ma — a second checkpoint on the same curve.
Present-day recession runs by a legible mechanism: Earth's tidal bulge, dragged ahead of the Earth-Moon line by Earth's faster rotation, torques the moon forward — raising its orbit — while braking Earth's spin; atomic-clock records show the mean solar day lengthening by roughly 1–2 ms/century today.

The plot twist is recent: Mitchell & Kirscher (2023, *Nature Geoscience* 16:567, doi:10.1038/s41561-023-01202-6) compiled Precambrian length-of-day constraints and found day length **stalled near ~19.5 hours for roughly a billion years** through the mid-Proterozoic, because the sun-driven atmospheric thermal tide (which accelerates spin) nearly canceled the moon's oceanic braking (which decelerates it) — a resonance holding the day constant through the "boring billion."
A 2024 follow-up (Mitchell et al., *Nature Geoscience*) ties the same stalled-resonance regime to cloud organization and a warmer Precambrian climate — flagged lead; not read in full for this note.
The sun and moon spent an eon in tug-of-war over the length of the day.

The famous obliquity claim is kept in corrected form.
Laskar, Joutel & Robutel (1993, *Nature* 361:615) argued the moon's fast precession keeps Earth's spin axis confined (22–24.6° over recent Myr) against a large chaotic zone.
Lissauer, Barnes & Chambers (2012, *Icarus* 217:77, "Obliquity variations of a moonless Earth"), with higher-resolution numerics, found a moonless Earth's obliquity wanders only ~±10° beyond present on relevant timescales — citation corrected: the moon *helps* steady the record, it is not load-bearing for habitability, and the corpus mints nothing on the folklore version.

Biology keeps the moon's time internally, down to named genes.
In the intertidal isopod *Eurydice pulchra*, the circatidal (~12.4 h) rhythm is molecularly separable from the circadian (~24 h) one: knockdown of the core circadian genes *period*, *bmal1*, and *clock* disrupts circadian but not circatidal locomotor rhythm, though *bmal1* is still required to coordinate circatidal timing across behaviors (Wilcockson & Zhang lab, *PLOS Genetics* 2023; O'Neill et al., *Current Biology* 2013 and 2015).
Peroxiredoxin redox-oxidation rhythms suggest the tidal clock may ride a conserved non-transcriptional metabolic/redox oscillator underneath the transcriptional one — flagged lead, mechanism not yet settled.
In the annelid *Platynereis dumerilii*, a separate ~monthly circalunar clock in the forebrain is entrained by nocturnal moonlight via the photoreceptor L-Cry, and persists when the circadian clock is pharmacologically disabled by casein kinase 1δ/ε inhibition (Zantke et al., Tessmar-Raible lab, *Cell Reports* 2013; PMC3913041).

And the moon holds its own origin-of-life claim, complementary to the vents: tidal wet-dry cycling — pools that flood, concentrate, and bake — drives non-enzymatic polymerization of nucleotides into RNA-like oligomers and viroid-sized rings (Deamer group and successors: *Scientific Reports* 2022, PMC9226162; *Life* 2020, PMC7760185; a 2025 ChemRxiv preprint on 2′,3′-cyclic nucleotide polymerization), a second real prebiotic regime running on lunar rhythm rather than geothermal flow.

Off-world, tidal flexing is the vent-maker.
Europa carries the strong unconfirmed case: an induced magnetic field, a differentiated gravity structure, young surface geology, and surface chemistry together support a global salty subsurface ocean maintained by tidal flexing in the Laplace resonance, with seafloor hydrothermal circulation plausible but unconfirmed.
Enceladus is the confirmed case: Cassini's Cosmic Dust Analyser caught silica nanoparticles (2–8 nm) in the plume and E-ring, best explained by ~90 °C water-rock reaction at that moon's seafloor producing colloidal silica (Hsu et al. 2015, *Nature* 519:207), with the plume itself carrying H₂, CO₂, CH₄, silicates, and salts (Waite et al. 2017, *Science*) — a chondritic, alkaline, H₂- and CH₄-yielding ocean floor, the same redox couple that feeds vent chemotrophy here, on the chemistry side covered by [the hydrogen note](../../../../../../../../../../../physical-science-services-section/services/chemistry-services-section/content/text/documents/articles/notes/2026/08/22/2026-08-22-note-on-hydrogen-alone.md)'s serpentinization chemistry, and run on a tidal-heating budget with no plate tectonics and no sun.
Where orbital mechanics kneads a body hard enough, you get a sea with vents in it — and, per [the vent-electricity note](../../../../../../../../../../../physical-science-services-section/services/chemistry-services-section/content/text/documents/articles/notes/2026/08/22/2026-08-22-note-on-vent-electricity.md), possibly a standing electrical circuit pulsing on that same tide: the Iheya North cathode's current tracked the semidiurnal tide here on Earth, and Barge & White (2017, *Astrobiology*) extend the chemical-garden fuel-cell framework explicitly to Enceladus.

## 4. The body as control system and tape deck

The carbonate-silicate weathering thermostat (Walker, Hays & Kasting 1981, *J. Geophys. Res.* 86:9776): silicate weathering accelerates with temperature and rainfall, drawing down CO₂ into carbonate rock; cooling slows weathering; volcanic outgassing refills the atmosphere — negative feedback with a 10⁵–10⁶-year relaxation time, the standard resolution of the faint young sun paradox and the reason surface temperature has stayed within livable bounds for hundreds of millions of years.

The geodynamo's magnetosphere is what keeps the atmosphere on: Mars lost its dynamo ~4 Ga (remanent magnetization surviving only in ancient crust), kept only an induced magnetosphere, and MAVEN measures its atmosphere still streaming away today; modeling suggests a drastically weakened terrestrial field could raise oxygen-ion escape by a factor of order 1,000.
This same geodynamo field is the outermost rung of [the dark-compass hypothesis note](../../../../../../../../../../../physical-science-services-section/services/chemistry-services-section/content/text/documents/articles/notes/2026/08/22/2026-08-22-note-on-the-dark-compass-hypothesis.md)'s chain: the field orients the chemical remanence of serpentinization-made magnetite at ultramafic vents, one link that also runs through this note's tide (§3) and the hydrogen note's serpentinization chemistry — below, above, body, and moon, in one proposed mechanism.

Two self-writing archives close the tier.
Seafloor magnetic stripes: ridge basalt cooling through the Curie point locks in the field's direction by thermoremanent magnetization — the corpus already holds "settling and inscription are one event" — so the spreading seafloor is a continuous tape of every geomagnetic reversal, read back by magnetometer (the Vine–Matthews–Morley hypothesis, 1963), corroborated independently on land by Cox et al. (1964).
And Milankovitch cyclicity: eccentricity (~100 and ~405 kyr), obliquity (~41 kyr), and precession (~19–23 kyr) written into climate-sensitive sediment, tuned against celestial mechanics to build the Astronomical Time Scale — with the causality now running both directions, since Proterozoic sediment cycles are used to constrain the ancient Earth-moon distance independently of rhythmites (Meyers & Malinverno 2018, *PNAS* 115:6363).
The archive and the sky co-witness each other.

## 5. What this gives the estate

The local world gains its boundary conditions with real magnitudes and rhythms attached: the **[VENT](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/vacuous-entanglement-normalizing-topos.md)**'s flux is the small steady one; the sky's distillation, [the estuary note](../../../../../../../../../hydrology-science-services-section/content/text/documents/articles/notes/2026/08/22/2026-08-22-note-on-the-estuary-and-the-salt-to-fresh-gradient.md), runs on the enormous daily one; and the tide — the only rhythmic forcing — is the one life built clocks for, and the estuary's dominant mixer, where new **[MUD](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/modeled-union-dimension.md)** flocculates at the **[WEDGE](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/witness-exchanging-density-gradient-ecocline.md)** the estuary note names.
[MUD](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/modeled-union-dimension.md) archives the sky twice over (rhythmites and Milankovitch bands), the ridge keeps the field's journal, and Enceladus licenses the deep register of the bestiary for export off-world.
The candidate coinings this tier suggests — the tide, the thermostat, the circuit — are left unminted until this note's claims pass adversarial verification.

## Sources and records

This note's claims are drawn from a single-agent search-synthesis pass, not yet adversarially verified: [scout-1, the planetary-tier report](../../../../../../../../../../../../../../data/records/2026-08-22-natural-computing-world-session/scout-1-planetary-tier-report.md), whose own flagged load-bearing claims are: (1) the Elatina rhythmite figures (Williams 1997, 2000); (2) the mid-Proterozoic day-length stall via tidal resonance (Mitchell & Kirscher 2023); (3) the Enceladus silica nanoparticles as seafloor-hydrothermal evidence (Hsu et al. 2015); (4) the three-source energy ratio 173,000 : 47 : 3.7 TW; (5) photosynthesis (~130 TW) versus civilization (~19 TW); and (6) the weathering thermostat's 10⁵–10⁶ yr response time.
See also the session's [record-directory README](../../../../../../../../../../../../../../data/records/2026-08-22-natural-computing-world-session/README.md) and the synthesis note, [the world of the Tao and the hydrological circuit](../../../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/services/natural-computing-science-services-section/content/text/documents/articles/notes/2026/08/22/2026-08-22-note-on-the-world-of-the-tao-and-the-hydrological-circuit.md).
