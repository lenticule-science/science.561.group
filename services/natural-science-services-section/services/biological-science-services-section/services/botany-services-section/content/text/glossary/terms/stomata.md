---
title: Stomata
date-created: 2026-03-06T00:00:00
type: term
aliases:
  - Stomata
  - stomata
  - Stoma
  - stoma
keywords:
  - Botany
  - PlantPhysiology
  - GasExchange
defines:
  - stomata
  - stoma
references:
  negi2008:
    authors: ["Juntaro Negi", "Olga Matsuda", "Takanori Nagasawa", "Yuriko Oba", "Hiroo Takahashi", "Masako Kawai-Yamada", "Hirofumi Uchimiya", "Michio Hashimoto", "Koh Iba"]
    title: "CO2 regulator SLAC1 and its homologues are essential for anion homeostasis in plant cells"
    publication: "Nature"
    year: 2008
  takahashi2013:
    authors: ["Yohei Takahashi", "Kristiina Ebisu", "Toshinori Kinoshita"]
    title: "Blue light and CO2 signals converge to regulate light-induced stomatal opening"
    publication: "Nature Communications"
    year: 2017
  kinoshita1999:
    authors: ["Toshinori Kinoshita", "Ken-ichiro Shimazaki"]
    title: "Blue light activates the plasma membrane H+-ATPase by phosphorylation of the C-terminus in stomatal guard cells"
    publication: "The EMBO Journal"
    year: 1999
  park2009:
    authors: ["Sang-Youl Park", "Pauline Fung", "Noriyuki Nishimura", "Davin R. Jensen", "Hiroaki Fujii", "Yang Zhao", "Shelley Lumba", "Julia Santiago", "Assaf Rodrigues", "Tsz-Fung F. Chow", "et al."]
    title: "Abscisic acid inhibits type 2C protein phosphatases via the PYR/PYL family of START proteins"
    publication: "Science"
    year: 2009
  chen2022:
    authors: ["Guowei Chen", "et al."]
    title: "Structure of Arabidopsis guard cell anion channel SLAC1 suggests activation mechanism"
    publication: "Nature Communications"
    year: 2022
  woodward1987:
    authors: ["F. Ian Woodward"]
    title: "Stomatal numbers are sensitive to increases in CO2 from pre-industrial levels"
    publication: "Nature"
    year: 1987
  jasechko2013:
    authors: ["Scott Jasechko", "Zachary D. Sharp", "John J. Gibson", "S. Jean Birks", "Yi Yi", "Peter J. Fawcett"]
    title: "Terrestrial water fluxes dominated by transpiration"
    publication: "Nature"
    year: 2013
---

# Stomata

Stomata are microscopic pores on the surfaces of leaves and other aerial plant organs, each bounded by a pair of specialized guard cells. By changing shape — swelling to open the pore or deflating to close it — guard cells regulate the exchange of gases between the plant's interior and the atmosphere. When stomata open, carbon dioxide enters the leaf for [photosynthesis](./photosynthesis-as-relation.md) and oxygen exits. Simultaneously, water vapor escapes through transpiration, which drives the upward movement of water through the [xylem](./xylem.md).

## Guard cell mechanics

Guard cells open stomata by accumulating solutes — primarily potassium ions (K+), chloride ions (Cl-), and malate — which lowers their internal water potential and draws water in by osmosis. As guard cells swell, their unique cell wall architecture forces them to bow outward: cellulose microfibrils are arranged radially around the pore, so that when turgor pressure increases, the cells elongate and curve apart rather than simply expanding uniformly. This pulls the pore open.

Stomatal opening is initiated by the activation of plasma membrane H+-ATPase proton pumps (AHA1 and AHA2 in Arabidopsis). These pumps export protons from the guard cell, hyperpolarizing the membrane and driving K+ uptake through voltage-gated inward-rectifying potassium channels (KAT1, KAT2). Anions enter through co-transport mechanisms, and malate is synthesized internally from starch breakdown.

Stomatal closure reverses this process. The hormone abscisic acid (ABA), produced throughout the plant under drought stress, is perceived by the PYR/PYL/RCAR receptor proteins in guard cells. Activated PYR/PYL receptors inhibit PP2C phosphatases, which releases SnRK2 kinases from inhibition. These kinases phosphorylate and activate S-type anion channels — particularly SLAC1 (whose three-dimensional structure was resolved by cryo-EM in 2022) and SLAH3 — causing chloride and malate efflux. They also activate the outward-rectifying potassium channel GORK and inhibit KAT1. The resulting ion loss causes water to exit the guard cells, turgor drops, and the pore closes.

## Signal integration

Guard cells integrate multiple environmental and internal signals to calibrate aperture:

**Light.** Blue light directly stimulates opening through the phototropin receptor kinases phot1 and phot2, which activate the kinase BLUS1 (BLUE LIGHT SIGNALING 1), which in turn activates H+-ATPase proton pumps by phosphorylating their C-terminal autoinhibitory domain (specifically Thr-947 in AHA1). Red light opens stomata indirectly by driving mesophyll photosynthesis, which lowers the intercellular CO2 concentration (Ci) — itself a signal for opening. A 2017 study in Nature Communications demonstrated that blue light and CO2 signals converge on the kinase HT1 (HIGH LEAF TEMPERATURE 1), providing a molecular mechanism for how guard cells integrate light quality and carbon status.

**CO2 concentration.** Elevated CO2 promotes closure. Guard cells sense CO2 through carbonic anhydrases (CA1 and CA4 in Arabidopsis), which convert CO2 to bicarbonate. Bicarbonate activates the kinase HT1 and downstream signaling that stimulates SLAC1 anion channels, causing ion efflux and closure. This response has global implications: as atmospheric CO2 rises, plants partially close their stomata, reducing transpiration and potentially altering regional water cycles.

**Humidity.** Low humidity (high vapor pressure deficit) triggers closure through both passive and active mechanisms. Passive hydropassive closure occurs when guard cells lose water directly to dry air faster than surrounding cells. Active hydroactive closure involves ABA signaling and ion channel regulation in response to desiccation cues.

**Temperature.** High temperature generally promotes opening (by increasing transpiration demand and metabolic rates), but extreme heat triggers ABA-mediated closure.

## The transpiration trade-off

Every stomatal opening event creates a trade-off: CO2 enters for photosynthesis, but water vapor escapes. C3 plants typically lose 200-400 molecules of water for every molecule of CO2 they fix. This transpiration ratio drops to roughly 100-200 in C4 plants, whose CO2-concentrating mechanism allows them to operate with partially closed stomata. CAM plants achieve even lower ratios by opening stomata only at night.

A large tree can transpire 200-400 liters of water per day through its stomata. Globally, roughly 60-70% of terrestrial evapotranspiration passes through stomata, making stomatal behavior a significant driver of the water cycle. Forests measurably increase regional rainfall through the moisture they release.

## Stomatal development

Stomatal density — the number of stomata per unit leaf area — is determined during leaf development by the EPF/EPFL (EPIDERMAL PATTERNING FACTOR / EPFL-LIKE) peptide signaling pathway. EPF peptides signal through the ERECTA family of receptor-like kinases to regulate the division and differentiation of stomatal precursor cells. The "one-cell spacing rule" ensures that no two stomata develop in directly adjacent positions, guaranteeing each stoma has neighboring pavement cells that can supply water. Typical stomatal densities range from 50 to 300 per mm2 of leaf surface, depending on species and growing conditions.

Stomatal identity is determined by a cascade of three basic helix-loop-helix transcription factors: SPEECHLESS initiates the stomatal cell lineage, MUTE terminates asymmetric divisions and specifies the guard mother cell, and FAMA drives the final symmetric division that produces the two guard cells. The EPF peptides act upstream, regulating SPEECHLESS activity through the ERECTA signaling pathway.

Plants adjust stomatal density in response to atmospheric CO2 concentration. Plants grown under elevated CO2 develop fewer stomata per unit area. This response has been calibrated using herbarium specimens spanning the last two centuries and used as a paleoecological tool: fossil leaf cuticles with high stomatal density indicate low atmospheric CO2, and vice versa. The stomatal index of fossil leaves from the late Paleozoic through the Cenozoic provides an independent proxy for reconstructing past CO2 levels.

## Related terms

- [Photosynthesis](./photosynthesis-as-relation.md) — the process that stomatal opening serves
- [Xylem](./xylem.md) — the vascular tissue whose transpiration stream depends on stomatal evaporation
- [Phloem](./phloem.md) — carrier of hormonal signals (including ABA) regulating stomatal behavior
- [Homeostasis](../../terms/homeostasis.md) — the dynamic balance that stomatal regulation maintains
- [Leaf](./leaf.md) — the organ where stomata are concentrated
