---
title: "Indoor cannabis cultivation: stages, setpoints, crop steering, and the AI-assisted grow"
description: "The agronomy of a small indoor Cannabis sativa grow (eight plants, four flowering) as the house holds it: growth stages and their environmental bands, vapor-pressure deficit and daily light integral, the uninterrupted dark period, substrate crop steering, drying and curing, perpetual harvest under a flowering cap, and what an AI-assisted grow adds. Research ahead of the grow-assist ASSIST instances and the indoor-grow controller."
date-created: 2026-10-10
research-as-of: 2026-10-10
type: research-note
in-service-of: lib/emsenn/services/561-group/services/science-services-section/services/natural-science-services-section/services/biological-science-services-section/services/agricultural-science-services-section
name: 2026-10-10-note-on-indoor-cannabis-cultivation
keywords: [agronomy, controlled-environment-agriculture, cannabis, vapor-pressure-deficit, daily-light-integral, crop-steering, photoperiod, drying, curing, perpetual-harvest, mape-k]
status: draft-for-iteration
authors: [lenticule-science-senior]
utterances:
  - "ni:///sha-256;iOEf1dsqSmKb_UpuMDTvvhHBO52eH5FtabD-CdpaJJM"
  - "leader message 2026-10-10T01:08Z, quoted in the grow-assist brief of 2026-10-09-leader-words-pass-order.md"
carried-from:
  - "red-cup-engineering/computer-services-section#49 (closed 2026-10-09), head refs/archive/2026-10-09/senior/indoor-grow-autonomic-system at dcc986bd19: services/indoor-grow-autonomic-system/data/stage-setpoints.json (as of 2026-10-07), README.md, deploy/README.md"
references:
  rodriguez_morrison_2021:
    authors: [Rodriguez-Morrison, V., Llewellyn, D., Zheng, Y.]
    title: "Cannabis Yield, Potency, and Leaf Photosynthesis Respond Differently to Increasing Light Levels in an Indoor Environment"
    venue: "Frontiers in Plant Science 12:646020 (2021)"
    url: https://pmc.ncbi.nlm.nih.gov/articles/PMC8144505/
  chandra_2008:
    authors: [Chandra, S., Lata, H., Khan, I. A., ElSohly, M. A.]
    title: "Photosynthetic response of Cannabis sativa L. to variations in photosynthetic photon flux densities, temperature and CO2 conditions"
    venue: "Physiology and Molecular Biology of Plants 14:299-306 (2008)"
  kephart_chess_2003:
    authors: [Kephart, J. O., Chess, D. M.]
    title: "The Vision of Autonomic Computing"
    venue: "IEEE Computer 36(1):41-50 (2003)"
  pr49_sources:
    note: "The stage-setpoint record of #49 cites FloraFlex crop-steering guidance, Quest Climate humidity/VPD guidance, Hydrotek substrate EC/pH targets, TSRgrow crop-steering material and Cannabis Business Times; these are trade sources, not peer-reviewed, and are carried here as practice, not as settled science."
---

# Indoor cannabis cultivation

## What this note holds

The Leader asked on 2026-10-07 for the Group's science, engineering and operations to be extended for cannabis, for finding cannabis, and for running a small eight-plant indoor grow in Minnesota, and asked for "the most AI assisted grow we can possibly imagine". On 2026-10-10 the Leader named the products that carry it: `grow.assist.561.group`, `cannabis.grow.assist.561.group`, `indoor.cannabis.grow.assist.561.group` and, as the top leaf for now, `minnesota.indoor.cannabis.grow.assist.561.group`, and required that in-repo resources be thicker than out-of-repo resources so that other agents can carry the work forward. This note is the agronomy that those products and the indoor-grow controller rest on. The plant itself (taxonomy, trichomes, chemotypes) is held in the botany note [Cannabis: Trichomes, Chemotypes, and the Plant's Own Compartments](../../../../../../../../../botany-services-section/content/text/documents/articles/notes/2026/08/26/2026-08-26-note-on-cannabis-trichomes-and-chemotypes.md); the law is held in the law-science note [Minnesota adult-use home cultivation](../../../../../../../../../../../../../social-science-services-section/services/law-science-services-section/content/text/documents/articles/notes/2026/10/10/2026-10-10-note-on-minnesota-adult-use-home-cultivation.md). The per-stage numbers live as data in the botany section's record `data/records/2026-10-10-minnesota-indoor-cannabis-cultivation.json`, so that the controller and every Assist instance read one source.

## The crop and its stages

Indoor cannabis is a photoperiod crop grown for female inflorescences. Most cultivars are short-day plants: they stay vegetative under long days (18 hours of light) and initiate flowers when the dark period lengthens to about 12 hours; autoflowering cultivars, carrying *C. sativa* var. *ruderalis* ancestry, flower on age regardless of photoperiod. A home grow moves each plant through seven stages, and every stage has its own environmental band:

- **Seedling** (days 0-14): germination and early root growth under reduced light (PPFD 150-300 µmol m⁻² s⁻¹), high humidity (RH 55-70 %), VPD 0.6-1.1 kPa, 18 h light.
- **Vegetative** (days 15-60): leaf, stem and root expansion; PPFD 400-600, VPD 0.9-1.4 kPa, 18 h light; training (low-stress training, screen of green) is set up here.
- **Early flower** (days 0-21 of 12/12): the photoperiod change to 12 h light initiates flowering; stems stretch; PPFD 800-1200, VPD 1.0-1.5 kPa, RH 45-60 %.
- **Mid flower** (days 22-42): bulking; PPFD 900-1500, VPD 1.1-1.6 kPa, RH 40-55 %, cooler nights (18-23 °C); generative steering begins.
- **Late flower** (days 43-63): trichome maturation; VPD 1.2-1.7 kPa, RH 35-50 %, nights 16-22 °C; humidity is held low against bud rot.
- **Drying** (10-14 days after harvest): dark, about 60 °F and 60 % RH (15-18 °C, 55-62 % RH), gentle air movement, no light.
- **Curing** (10-30+ days): trimmed flower in airtight glass at 58-62 % RH and water activity 0.55-0.65; jars are opened ("burped") once or twice daily in the first week.

Substrate bands follow the stages: in coco coir, volumetric water content (VWC) runs 50-70 % in seedlings, 55-75 % in vegetative growth, then is stepped down to 40-65 % in mid flower and 30-55 % in late flower; substrate EC rises from 0.8-1.2 mS/cm in seedlings to 2.0-3.5 mS/cm in flower; nutrient-solution pH is held at 5.5-6.2. The full bands, day and night, are the record's.

## Light: PPFD, DLI and the dark period

Light is the strongest lever on yield. Rodriguez-Morrison, Llewellyn and Zheng (2021) grew a drug-type cultivar indoors across canopy PPFDs of about 120 to 1800 µmol m⁻² s⁻¹ in flowering and found inflorescence yield rising linearly over the whole range (from 116 to 519 g m⁻²) while cannabinoid potency did not change with light; leaf photosynthesis did not saturate below about 1500. Yield per mole of light was about 0.12 g dry flower per mole on average and about 0.10 g/mol at the margin. The house takes this as its yield model's prior: predicted dry flower equals a cultivar constant times the light the canopy intercepted, the constant starting at N(0.12, 0.04²) g/mol and updated by each harvest (the plant twin of #49).

The daily light integral is DLI = PPFD × photoperiod hours × 0.0036 mol m⁻² d⁻¹; the setpoint record derives its DLI bands from its PPFD bands this way so that the two never disagree.

The dark period of a flowering room must be uninterrupted. A light leak above about 0.01 µmol m⁻² s⁻¹, or a brief red-light exposure mid-dark, can delay or prevent flowering and can induce hermaphroditic flowers. This is the one constraint whose failure costs a whole crop, so the house holds it as a safety property with layered guards (the indoor-grow controller requirements R3).

## Air: temperature, humidity, VPD, CO2

Vapor-pressure deficit (VPD) is the difference between the saturation vapor pressure at leaf temperature and the actual vapor pressure of the air; it drives transpiration. Leaf temperature, read by an infrared sensor, is used where it exists, because leaf and air differ under strong light. Bands rise from 0.6-1.1 kPa for seedlings to 1.2-1.7 kPa late in flower: low VPD early keeps young roots from desiccation; high VPD late keeps flowers dry. Chandra et al. (2008) measured the net photosynthesis of *C. sativa* peaking near 25-30 °C under high light and rising with CO2 enrichment; an unenriched, ventilated tent under light draws CO2 below ambient (about 350 ppm), which is normal, and below about 300 ppm photosynthesis is CO2-limited and more air exchange is the fix. The house's band for an unenriched tent is 300-1500 ppm.

Bud rot (*Botrytis cinerea*) is the late-flower and drying hazard: relative humidity above about 50 % in late flower and during drying sharply raises its risk, and a leaf or flower surface at or below the dew point is where it starts. Active dehumidification and air movement are required, not optional; water activity above 0.65 in a curing jar is unsafe.

## Substrate: crop steering

Crop steering is irrigation scheduled to push a plant toward vegetative or generative growth by the size of the daily substrate dryback. A lit day has three phases: **P1**, a ramp of irrigation shots after lights-on until the substrate reaches its peak VWC; **P2**, maintenance shots that hold VWC above a floor; **P3**, no irrigation, timed so that the dryback projected from the measured evapotranspiration rate reaches its target by the next lights-on. A **vegetative** strategy (seedling, vegetative, early flower) uses a small dryback (about 12 %) and small shots (about 2 % of substrate volume); a **generative** strategy (mid and late flower) uses a large dryback (about 25 %), larger P1 shots (about 3 %) and no irrigation in the last four hours before lights-off. A shot is a percentage of the substrate volume per plant. Water tension, not water volume, is what the root feels, so VWC targets shift with the coco brand and its buffering. Substrate EC climbing above its band, or above the feed EC by more than about 0.4 mS/cm, signals salt accumulation and calls for a flush. Under very high PPFD with LED lighting, runoff EC can climb far higher, and runoff EC is the measure to watch.

## Harvest timing, drying and curing

Harvest timing is read from the trichome heads under 10-30× magnification: clear, then cloudy, then amber. Computer vision on a USB microscope, with inference at the edge, is a viable aid to timing. After harvest, drying at about 60 °F and 60 % RH preserves terpenes; overdrying below about 10 % bud water content degrades terpenes and cannabinoids. Curing runs at least 10 days and best 21-30.

## Perpetual harvest under a flowering cap

A household under a cap of eight plants with at most four mature and flowering (Minnesota's cap; see the law note) can harvest every two weeks by keeping mother plants as a clone source, staggering starts, and flipping plants to the flowering room every other week so that no more than four ever flower. A plant is counted as flowering from the photoperiod flip. A possession ceiling (two pounds of flower at the residence in Minnesota) makes harvests a stock-and-flow problem: projected stock is harvests times a cure-loss factor (about 0.97), minus gifts, minus use; a start or flip whose harvest would carry projected stock past the ceiling is delayed to the earliest date that fits.

## Plant health hazards

Hop latent viroid (HLVd) causes "dudding" (stunting, small and less resinous flowers) and spreads through clones and tools; it was reported in cannabis in California in 2019 and has since been found widely in commercial clone stock. A clone without an HLVd test claim is a risk to a home grow. Other common hazards are spider mites, fungus gnats, thrips, powdery mildew and root rot.

## What an AI-assisted grow adds

An autonomic grow is a MAPE-K loop (Kephart and Chess 2003; the house term [MAPE-K](../../../../../../../../../../../../../engineering-science-services-section/services/systems-engineering-science-services-section/content/text/glossary/terms/mape-k.md)) over a controlled environment: Monitor reads sensors and derives VPD and DLI; Analyze names the room's stage and its symptoms; Plan proposes setpoints, irrigation and tasks; Execute commands devices; Knowledge holds the stage bands, the legal limits and the journal of everything observed and done. The "next-gen" additions the house holds, carried from #49, are:

- **Perception**: camera frames per room (canopy top, canopy side, a night dark-check) yield canopy cover and height, growth, trichome maturity, pest signs and light leaks.
- **A plant twin** per plant: canopy, height, days in stage, growing degree-days above 10 °C (30 °C cutoff), DLI, intercepted light, a crop water stress index, predicted dry yield and predicted harvest date (thermal time of about 63 days × 14 GDD/day nominal, bounded at 0.7-1.4 of the calendar remainder).
- **A recipe optimizer**: each harvest is an observation of the recipe the plant lived (day temperature, day VPD, DLI, overnight dryback, flower days) and its yield, scaled by a quality score; a Gaussian process with expected improvement, bounded by hard safety limits and the flowering bands, proposes the next recipe once three harvests exist; Thompson sampling on yield picks the next cultivar.
- **Agents as proposers, the loop as decider**: every agent output is a proposal that the loop admits, queues for the grower, or refuses with its reason, and every proposal and decision is journaled.

An Assist instance is the human-facing side of this: decision support, never automation, every fact with its provenance, and the grower makes every decision the controller does not hold by policy.

## Open questions

- Which of the trade-source numbers above have peer-reviewed support for drug-type cannabis in coco at home scale; the VWC and dryback targets in particular are commercial practice.
- Whether the Group's chemotype classes (botany note) shift any setpoint band; no source located relates chemotype class to environmental optimum.
- What yield constant a home-scale tent at 900-1500 µmol m⁻² s⁻¹ realizes, and how fast the per-cultivar posterior converges in a perpetual-harvest rhythm.
- Whether HLVd testing services are available to Minnesota home growers, and at what cost.
