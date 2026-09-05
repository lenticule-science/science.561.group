---
title: "Fungal Decomposition"
---

## Fungal Decomposition: Mechanisms, Ecology, and Carbon Cycling

A reference file on the biochemistry and ecology of fungal wood decay.

**Provenance note:** This document was compiled from the training knowledge of an LLM (Claude, Anthropic) with a knowledge cutoff of early 2025. Web search was unavailable at time of compilation. All claims should be treated as well-sourced summaries of peer-reviewed literature, but specific numbers and recent findings (especially Section 7) should be verified against primary sources before citation in any formal work. Key references are provided throughout.

---

## 1. Lignin Degradation Enzymes

Lignin is the second most abundant terrestrial biopolymer after cellulose, comprising roughly 15-30% of wood dry weight. It is an irregular, heavily cross-linked aromatic polymer built from three monolignol precursors (p-coumaryl, coniferyl, and sinapyl alcohols), yielding a heterogeneous structure rich in C-C and C-O-C bonds. Its irregularity makes it resistant to hydrolytic enzymes, and its degradation requires oxidative attack.

Four major classes of ligninolytic enzymes are recognized:

### 1.1 Lignin Peroxidase (LiP) - EC 1.11.1.14

- **Discovery:** First isolated from *Phanerochaete chrysosporium* by Tien & Kirk (1983) and Glenn et al. (1983).
- **Cofactor:** Heme (iron protoporphyrin IX).
- **Mechanism:** LiP operates via a classic peroxidase catalytic cycle. The resting ferric enzyme reacts with H2O2 to form Compound I (a two-electron-oxidized intermediate, an oxoferryl porphyrin radical cation, Fe(IV)=O with a porphyrin pi-cation radical). Compound I oxidizes a substrate by one electron to form Compound II (Fe(IV)=O). Compound II oxidizes a second substrate molecule, returning the enzyme to its resting ferric state. The key distinguishing feature of LiP is its unusually high redox potential (~1.2 V at pH 3), which allows it to oxidize non-phenolic lignin substructures directly. This high potential is attributed to the enzyme's low optimal pH (~3) and an exposed tryptophan residue (Trp171 in *P. chrysosporium* LiP H8) that serves as a surface radical site for long-range electron transfer, allowing the enzyme to oxidize bulky lignin substrates that cannot access the heme active site directly.
- **Substrate range:** Oxidizes both phenolic and non-phenolic aromatic substrates. Notably oxidizes veratryl alcohol (3,4-dimethoxybenzyl alcohol) to veratryl aldehyde, which is used as a standard assay substrate and may also serve as a diffusible mediator in vivo.
- **Producers:** Primarily white-rot Basidiomycota. *Phanerochaete chrysosporium* is the model organism. Also found in *Trametes versicolor*, *Phlebia radiata*, and other white-rot species.

### 1.2 Manganese Peroxidase (MnP) - EC 1.11.1.13

- **Discovery:** Also first characterized from *P. chrysosporium* (Kuwahara et al., 1984; Glenn & Gold, 1985).
- **Cofactor:** Heme.
- **Mechanism:** MnP follows a similar peroxidase cycle to LiP (resting state -> Compound I -> Compound II -> resting state), but its physiological substrate is Mn(II), which it oxidizes to Mn(III). The Mn(III) ions are chelated by organic acids (primarily oxalate, also malonate), forming small, diffusible Mn(III)-organic acid complexes. These complexes act as the actual oxidizing agents that attack lignin. This is significant because Mn(III) chelates are small enough to penetrate the lignocellulose matrix, accessing sites that the enzyme itself (a ~46 kDa protein) cannot reach. The redox potential of the Mn(III)/Mn(II) couple (~1.5 V in chelated form) is sufficient to oxidize phenolic lignin structures but generally insufficient to oxidize non-phenolic structures directly.
- **Substrate range:** Primarily phenolic substrates. Can oxidize non-phenolic structures only in the presence of additional mediators (unsaturated fatty acids generating peroxyl radicals, or thiols).
- **Producers:** The most widely distributed ligninolytic peroxidase among white-rot fungi. Found in *P. chrysosporium*, *Ceriporiopsis subvermispora*, *Dichomitus squalens*, and many others. Notably, some species produce MnP but not LiP.

### 1.3 Versatile Peroxidase (VP) - EC 1.11.1.16

- **Discovery:** Characterized primarily from *Pleurotus eryngii* and *Bjerkandera adusta* in the late 1990s-2000s (Martinez et al., 1996; Camarero et al., 1999; Ruiz-Duenas et al., 2001).
- **Cofactor:** Heme.
- **Mechanism:** VP is a structural and functional hybrid of LiP and MnP. It possesses both the Mn(II) oxidation site of MnP (with the characteristic three acidic residues coordinating Mn binding) and the exposed catalytic tryptophan of LiP (enabling long-range electron transfer for oxidation of high-redox-potential substrates). This gives VP dual functionality: it can oxidize Mn(II) to Mn(III) like MnP, and it can directly oxidize high-redox-potential non-phenolic compounds and aromatic dyes like LiP, all in a single enzyme.
- **Substrate range:** Broadest of the ligninolytic peroxidases. Oxidizes Mn(II), phenolic aromatics, non-phenolic aromatics, and various dyes.
- **Producers:** *Pleurotus* species (*P. eryngii*, *P. ostreatus*), *Bjerkandera adusta*, and other white-rot fungi.

### 1.4 Laccase - EC 1.10.3.2

- **Discovery:** One of the earliest enzymes ever described. First reported from the lacquer tree *Rhus vernicifera* by Yoshida (1883). Fungal laccases recognized much later.
- **Cofactor:** Copper (typically four copper atoms per molecule, classified as Type 1 (T1), Type 2 (T2), and Type 3 (T3) copper centers).
- **Mechanism:** Laccase catalyzes the one-electron oxidation of substrates with concomitant reduction of molecular O2 to H2O (not H2O2). The catalytic cycle involves: (1) substrate oxidation at the T1 copper site, (2) intramolecular electron transfer from T1 to the T2/T3 trinuclear copper cluster, and (3) reduction of O2 to H2O at the trinuclear cluster. The T1 copper site gives laccase its characteristic blue color. The redox potential of fungal laccases ranges from ~0.4 to ~0.8 V, generally lower than LiP, which limits direct oxidation to phenolic substrates. However, in the presence of small-molecule mediators (such as ABTS, 1-hydroxybenzotriazole (HBT), or natural mediators like syringaldehyde or acetosyringone), the laccase-mediator system (LMS) can oxidize non-phenolic lignin structures. The mediator is first oxidized by laccase, then the oxidized mediator diffuses and attacks the substrate.
- **Substrate range:** Phenolic compounds directly. Non-phenolic compounds via mediators.
- **Producers:** Very widely distributed. Found in white-rot fungi (*Trametes versicolor* is a major producer), brown-rot fungi, soft-rot fungi, some bacteria, plants, and insects. Laccase is not specific to lignin degradation and participates in many biological processes (morphogenesis, pigmentation, pathogenesis, detoxification).

### 1.5 Accessory Enzymes and H2O2 Supply

Ligninolytic peroxidases (LiP, MnP, VP) all require H2O2 as a co-substrate. Fungi generate H2O2 via several accessory oxidases:
- **Glyoxal oxidase (GLOX):** A copper radical oxidase. Prominent in *P. chrysosporium*.
- **Aryl alcohol oxidase (AAO):** A flavoenzyme. Prominent in *Pleurotus* species.
- **Pyranose 2-oxidase:** Oxidizes glucose at C-2.
- **Methanol oxidase**
- **Cellobiose dehydrogenase (CDH):** Also connects cellulose and lignin degradation pathways.

### 1.6 Distribution by Rot Type

| Enzyme | White-rot | Brown-rot | Soft-rot |
|--------|-----------|-----------|----------|
| LiP | Yes (many spp.) | No | No |
| MnP | Yes (most spp.) | No | No |
| VP | Yes (some spp.) | No | No |
| Laccase | Yes (most spp.) | Some spp. | Some spp. |

**White-rot fungi** (order Polyporales and Agaricales, phylum Basidiomycota) are the only organisms known to completely mineralize lignin to CO2 and H2O. They produce class II peroxidases (LiP, MnP, VP) in addition to laccase.

**Brown-rot fungi** (Polyporales, Gloeophyllales, Boletales) do not produce class II peroxidases. They modify lignin (demethylation, partial oxidation) but do not mineralize it. See Section 6.

**Soft-rot fungi** (Ascomycota and some Basidiomycota, e.g., *Chaetomium*, *Xylaria*) may produce laccase and some non-ligninolytic peroxidases. They cause slow, superficial decay, primarily degrading cellulose with limited lignin modification.

---

## 2. The Carboniferous Hypothesis and the Floudas et al. (2012) Study

### 2.1 The Hypothesis

The Carboniferous period (358.9-298.9 Ma) saw massive accumulation of peat that eventually became coal deposits, particularly during the Pennsylvanian sub-period (~323-298.9 Ma). A longstanding geological hypothesis proposes that this accumulation occurred because the biochemical machinery to degrade lignin had not yet evolved in fungi. Since vascular land plants had evolved lignified cell walls by the Late Devonian/Early Carboniferous (~380-360 Ma), but fungi lacked the enzymatic toolkit to break lignin down, plant biomass accumulated without decomposition, producing the enormous coal beds that characterize this era.

### 2.2 Floudas et al. (2012)

**Citation:** Floudas, D., Binder, M., Riley, R., Barry, K., Blanchette, R.A., Henrissat, B., Martinez, A.T., Otillar, R., Spatafora, J.W., Yadav, J.S., et al. (2012). The Paleozoic origin of enzymatic lignin decomposition reconstructed from 31 fungal genomes. *Science*, 336(6089), 1715-1719.

**Key findings:**
- Comparative genomics of 31 fungal genomes, including 12 newly sequenced species.
- Molecular clock analysis placed the origin of class II peroxidases (the gene family including LiP and MnP) in the ancestor of the Agaricomycetes, estimated at the Late Carboniferous to Early Permian (~295 Ma, with a confidence interval of roughly 240-360 Ma).
- Ancestral state reconstruction suggested that the common ancestor of the Agaricomycetes had a relatively small number of class II peroxidase genes, and that the diversity of these enzymes expanded considerably in the Permian and Mesozoic.
- The timing roughly coincides with the sharp decline in coal formation at the Carboniferous-Permian boundary.
- The authors suggested a correlation: the evolution of efficient lignin-degrading peroxidases in white-rot fungi may have contributed to the end of the coal age by enabling the recycling of lignified biomass.

### 2.3 Subsequent Support and Criticism

The Floudas et al. hypothesis attracted significant attention but has been substantially challenged on several fronts:

**Geological/sedimentological criticism:**
- **Nelsen et al. (2016)** (*PNAS*, 113(9), 2442-2447, "Delayed fungal evolution did not cause the Paleozoic peak in coal production") argued that coal formation is better explained by tectonic and climatic factors. Specifically, the Carboniferous was characterized by extensive lowland tropical basins with high water tables (swamps), which inhibit aerobic decomposition regardless of enzymatic capability. As Pangaea assembled and the climate aridified in the Permian, these depositional environments disappeared, explaining the drop in coal formation without invoking fungal evolution. They noted that modern peat (pre-coal) accumulates in environments where decomposition is suppressed by waterlogging and acidity, not by absence of lignin-degrading organisms.
- Coal formation did not cease entirely after the Permian; significant coal deposits formed in the Mesozoic and Cenozoic (brown coals, lignites), demonstrating that coal formation is possible even with modern fungal communities, given appropriate depositional environments.

**Molecular clock uncertainties:**
- The confidence interval on the Floudas et al. date is broad (roughly 240-360 Ma), which makes it consistent with either a Late Carboniferous or Early Permian origin, but also potentially consistent with lignin-degrading enzymes predating the peak coal formation period.
- Subsequent phylogenomic analyses have not dramatically narrowed this date range.

**Current consensus (as of 2024-2025):**
The hypothesis that fungal evolution was the *sole* or *primary* cause of the end of coal formation is generally considered an oversimplification. Most researchers accept that the evolution of ligninolytic enzymes was likely significant and contributed to increased rates of lignin recycling, but the dominant controls on coal formation were depositional environment, tectonics, and climate. The "Carboniferous hypothesis" in its strong form (no fungi = coal; fungi = no coal) is not well supported when examined against the full geological record. A more nuanced view holds that fungal enzymatic evolution was one of several factors influencing the carbon cycle during the late Paleozoic.

**Additional reference:** Hibbett, D.S., Binder, M., Bischoff, J.F., et al. (2007). A higher-level phylogenetic classification of the Fungi. *Mycological Research*, 111(5), 509-547. (Provides the phylogenetic framework for understanding fungal evolution.)

---

## 3. Cellulose Degradation

### 3.1 Cellulose Structure

Cellulose is a linear polymer of glucose units linked by beta-1,4-glycosidic bonds. Individual chains form intra- and inter-molecular hydrogen bonds, producing highly ordered crystalline microfibrils interspersed with less-ordered amorphous regions. Native cellulose (cellulose I) has chains running in parallel. This crystallinity makes cellulose resistant to enzymatic hydrolysis.

### 3.2 Classical Cellulase System

The canonical model of fungal cellulase action involves three synergistic enzyme classes:

1. **Endoglucanases (EG, EC 3.2.1.4):** Cleave internal beta-1,4-glycosidic bonds in amorphous regions of the cellulose chain, creating new chain ends. GH (glycoside hydrolase) families 5, 7, 12, 45, and others.

2. **Cellobiohydrolases / Exoglucanases (CBH, EC 3.2.1.91 / 3.2.1.176):** Processive enzymes that attack from the chain ends. CBH I (Cel7A) attacks the reducing end; CBH II (Cel6A) attacks the non-reducing end. They thread a single cellulose chain through a tunnel-shaped active site and progressively cleave off cellobiose units. These are typically the most abundant secreted proteins during cellulose degradation. *Trichoderma reesei* (anamorph of *Hypocrea jecorina*) Cel7A is the model CBH.

3. **Beta-glucosidases (BGL, EC 3.2.1.21):** Hydrolyze cellobiose to glucose. Relieves product inhibition of CBH by cellobiose. GH families 1 and 3.

**Synergism:** The three enzyme types work synergistically. Endoglucanases create sites for CBH attachment; CBHs processively degrade the exposed chains; BGLs remove cellobiose that inhibits CBH activity. The combined activity is greater than the sum of individual activities, often by a factor of 5-10x.

### 3.3 Hemicellulases

Hemicelluloses (xylan, mannan, xyloglucan, glucuronoxylan, arabinoxylan, etc.) are heterogeneous branched polysaccharides that cross-link cellulose microfibrils and lignin. Their degradation requires a diverse set of enzymes:

- **Endo-xylanases (EC 3.2.1.8):** Cleave the xylan backbone. GH families 10 and 11.
- **Beta-xylosidases (EC 3.2.1.37):** Cleave xylose from xylooligosaccharides.
- **Endo-mannanases (EC 3.2.1.78):** Cleave mannan backbone.
- **Alpha-glucuronidases:** Remove glucuronic acid side chains.
- **Acetyl xylan esterases:** Remove acetyl groups from xylan.
- **Alpha-arabinofuranosidases:** Remove arabinose side chains.
- **Ferulic acid esterases:** Cleave ester bonds between hemicellulose and lignin (important for exposing cellulose).

### 3.4 Lytic Polysaccharide Monooxygenases (LPMOs)

LPMOs represent a paradigm shift in understanding polysaccharide degradation.

**Discovery and reclassification:**
- Previously classified as GH61 (fungal) and CBM33 (bacterial) -- proteins with weak or undetectable hydrolytic activity.
- Vaaje-Kolstad et al. (2010, *Science*, 330, 219-222) demonstrated that CBM33 proteins from *Serratia marcescens* are copper-dependent oxidative enzymes that cleave chitin.
- Quinlan et al. (2011) and Phillips et al. (2011) demonstrated analogous activity for GH61 proteins on cellulose.
- Reclassified into Auxiliary Activity (AA) families in the CAZy database: AA9 (formerly GH61, fungal, acting on cellulose), AA10 (formerly CBM33, bacterial, acting on cellulose and chitin), AA11 (fungal, acting on chitin), AA13 (fungal, acting on starch), AA14 (fungal, acting on xylan), AA15 (animal and oomycete), AA16 (fungal, acting on cellulose).

**Mechanism:**
- LPMOs are copper-dependent enzymes with a single copper atom at the active site, coordinated by a "histidine brace" (two histidine residues, one of which is the N-terminal histidine, often methylated at N-epsilon in fungal LPMOs).
- They catalyze oxidative cleavage of glycosidic bonds in crystalline polysaccharides. The copper center activates molecular oxygen (O2) or hydrogen peroxide (H2O2) to generate a reactive copper-oxyl species that abstracts a hydrogen atom from C1 or C4 of the glucose unit in the glycosidic bond.
- C1 oxidation produces an aldonic acid (lactone) at the cleaved end; C4 oxidation produces a 4-ketoaldose (geminal diol).
- **Electron donor requirement:** LPMOs require an external electron donor to reduce Cu(II) to Cu(I) for catalytic turnover. In vitro, ascorbate or gallate are used. In vivo, likely candidates include: cellobiose dehydrogenase (CDH), lignin fragments (phenolic compounds from lignin degradation), and reduced small molecules in the fungal secretome.
- **O2 vs H2O2 as co-substrate:** Bissaro et al. (2017, *Nature Chemical Biology*) demonstrated that H2O2 is a much more efficient co-substrate than O2, leading to the proposal that LPMOs are primarily peroxygenases rather than monooxygenases under physiological conditions. This has been a significant area of debate and research.

**Significance:**
- LPMOs act on the crystalline surface of cellulose, introducing chain breaks and creating new access points for classical cellulases. They are the "missing piece" that explains how fungi overcome the crystallinity barrier.
- Addition of LPMOs to cellulase cocktails increases cellulose saccharification yields by 10-25% or more, which has major practical implications for biofuel production.
- Fungal genomes typically encode multiple LPMO genes (often 10-40+ AA9 genes per genome), suggesting functional diversification.

### 3.5 Step-by-Step Cellulose Degradation

1. **Surface disruption:** LPMOs (AA9) bind to the crystalline cellulose surface and introduce oxidative nicks, disrupting the ordered hydrogen-bonding network.
2. **Amorphous region attack:** Endoglucanases cleave chains in accessible amorphous regions.
3. **Chain-end processing:** CBH I and CBH II attach to newly created and pre-existing chain ends, processively releasing cellobiose.
4. **Cellobiose hydrolysis:** Beta-glucosidases convert cellobiose to glucose.
5. **Hemicellulose removal:** Hemicellulases remove hemicellulose that physically blocks access to cellulose microfibrils.
6. **Continuous surface renewal:** Ongoing LPMO activity, combined with progressive peeling by CBHs, continually exposes fresh crystalline surface.

---

## 4. Decomposition Rates and Carbon Cycling

### 4.1 Terrestrial Carbon Pools

- **Soil organic carbon (globally):** Approximately 1,500-2,400 Gt C in the top 1 meter (estimates vary; the higher values include permafrost soils). The commonly cited figure is ~1,500 Gt C in the top meter, with up to ~2,400 Gt C in the top 2 meters. For comparison:
  - **Atmospheric CO2:** ~870 Gt C (as of ~2023, at ~420 ppm).
  - **Terrestrial vegetation (living biomass):** ~450-650 Gt C.
  - **Ocean (dissolved inorganic carbon):** ~38,000 Gt C.
- Soil contains roughly 2-3 times more carbon than the atmosphere and 2-4 times more than living vegetation.
- **Forest soils specifically:** Forest ecosystems store roughly 860 Gt C total (in biomass + soil), with approximately 40-70% of that in soil organic matter, depending on forest type and climate. Boreal forests have proportionally more carbon in soil than in biomass; tropical forests have more in biomass.

### 4.2 Role of Fungi in Carbon Cycling

- Fungi are estimated to be responsible for approximately 60-90% of litter decomposition in forest ecosystems, depending on litter type and environment. Bacteria play a secondary role in most upland forest soils; fungi dominate due to their hyphal growth form (allowing penetration of solid substrates), their ability to translocate nutrients via mycelial networks, and their production of the full suite of lignocellulolytic enzymes.
- Global heterotrophic soil respiration (total CO2 released from soil by decomposition and root respiration) is approximately 60-80 Gt C/year. Microbial decomposition (excluding root respiration) accounts for roughly 40-60 Gt C/year. Fungal decomposition is estimated to account for a substantial majority of this, but precise partitioning between fungi and bacteria remains an active area of research.
- **Wood decomposition specifically:** Dead wood in forests constitutes a carbon pool of roughly 36-73 Gt C globally. Wood decomposition rates vary enormously:
  - Tropical forests: wood half-life of ~3-10 years.
  - Temperate forests: wood half-life of ~5-25 years.
  - Boreal forests: wood half-life of ~20-100+ years.
  - These rates are driven primarily by temperature, moisture, and the fungal community composition.

### 4.3 Decomposition Rate Constants

Wood decomposition is often modeled as single exponential decay: mass remaining = e^(-kt), where k is the decomposition rate constant.

- Typical k values for coarse woody debris:
  - Tropical hardwoods: k = 0.1-0.5 yr^-1
  - Temperate hardwoods: k = 0.03-0.15 yr^-1
  - Temperate conifers: k = 0.01-0.07 yr^-1
  - Boreal conifers: k = 0.005-0.03 yr^-1

### 4.4 Lignin as a Rate-Limiting Factor

- Wood with higher lignin content decomposes more slowly overall. The lignin:nitrogen ratio of a substrate is one of the best predictors of its decomposition rate. High lignin:N ratios (>40) correlate with slow decomposition.
- During early stages of wood decay, cellulose and hemicellulose are preferentially lost, and lignin concentration increases as a proportion of remaining mass. In the later stages of white-rot decay, lignin is also mineralized, and total mass loss accelerates if a white-rot community is established.
- Brown-rot leaves behind a lignin-rich residue that is more recalcitrant and contributes disproportionately to long-term soil organic matter (humus). This is ecologically significant: brown-rot is dominant in boreal conifer forests, and the modified lignin residue contributes to the large soil carbon pool in these ecosystems.

---

## 5. Succession in Decomposer Communities

### 5.1 General Pattern

Fungal succession on dead wood follows a well-documented temporal sequence:

**Phase 1: Primary colonizers (0-2 years after tree death)**
- Fungi already present in living wood as latent endophytes are typically the first to fruit and dominate.
- Common early colonizers in temperate forests:
  - *Stereum* spp. (e.g., *S. hirsutum*) -- white-rot
  - *Hypoxylon* (now *Jackrogersella*) spp. -- soft-rot Ascomycetes, common on beech
  - *Biscogniauxia* spp. -- Ascomycetes latent in living bark
  - *Peniophora* spp. -- white-rot crusts
  - *Vuilleminia comedens* -- early white-rot on oak branches
  - Various "blue-stain" fungi (Ophiostomatales) -- primarily degrade easily accessible sugars and starch, not structural polymers
  - Sugar fungi and molds (*Trichoderma*, *Mucor*, *Penicillium*) -- degrade simple sugars, starch, and non-structural carbohydrates first

**Phase 2: Secondary colonizers (1-5 years)**
- More aggressive decomposers that establish via spore germination on exposed wood surfaces or via mycelial contact.
- Common species:
  - *Trametes versicolor* (turkey tail) -- white-rot, very common on hardwood logs
  - *Stereum* spp. continuing
  - *Pleurotus ostreatus* (oyster mushroom) -- white-rot, simultaneous cellulose and lignin degradation
  - Various polypore species
  - *Armillaria* spp. -- can act as both parasites on living trees and saprotrophs on dead wood; spread via rhizomorphs

**Phase 3: Late-stage decomposers (5-20+ years)**
- Species that colonize well-decayed, physically softened wood.
- Common species:
  - *Mycena* spp. -- small agarics, common in heavily decayed wood
  - *Xylaria* spp. (e.g., *X. hypoxylon*, dead man's fingers) -- soft-rot Ascomycetes that persist through multiple succession stages
  - *Ganoderma* spp. -- can persist for years as perennial brackets
  - *Fomitopsis* (e.g., *F. pinicola*) -- brown-rot, common on conifer logs
  - Cord-forming species like *Phanerochaete velutina*, *Hypholoma fasciculare* -- these forage across the forest floor and colonize new wood resources via mycelial cords

### 5.2 Competitive Mycelial Interactions

Fungi do not passively replace each other; succession is driven by active combative interactions at mycelial contact zones.

**Types of interactions (following Boddy, 2000, *FEMS Microbiology Ecology*):**
- **Deadlock:** Neither species replaces the other; a persistent interaction zone (often melanized demarcation line) forms. Both species retain their territories.
- **Replacement:** One species overtakes the territory of another. The winner's hyphae advance through the loser's territory. Often accompanied by melanin production, volatile organic compound release, and sometimes visible "zone lines" (spalting) in the wood.
- **Mutual replacement:** Rare; both species partially replace each other.

**Factors determining competitive outcomes:**
- **Inoculum size:** Larger mycelial territory = competitive advantage (resource access, metabolic reserves).
- **Species identity / combative ability:** Some species are consistently dominant (e.g., *Hypholoma fasciculare* is highly combative); others are consistently subordinate.
- **Environmental conditions:** Temperature, moisture, and gas composition influence relative competitiveness.
- **Priority effects:** The first colonizer often has a strong advantage (established territory, resource capture).

**Ecological significance of interactions:**
- Combative replacement drives species turnover and thus the succession of decay types (e.g., soft-rot Ascomycetes replaced by white-rot Basidiomycetes).
- Zone lines (spalted wood) are visual evidence of interaction zones and are of interest in woodworking/artisan wood.
- Volatile organic compounds (VOCs) produced during interactions may serve as chemical warfare agents and also contribute to forest ecosystem volatile emissions.

### 5.3 Succession and Decay Type

A generalized pattern in temperate hardwood forests:
1. Sugar fungi / molds consume non-structural carbohydrates (starch, free sugars).
2. Soft-rot Ascomycetes begin degrading cellulose in cell walls.
3. White-rot Basidiomycota establish and degrade both cellulose and lignin.
4. Late-stage specialists consume remaining fragments.
5. Soil fauna (mites, collembolans, earthworms) incorporate fragmented wood into soil.

In boreal conifer forests, brown-rot fungi often dominate the intermediate and late stages, leading to a different decomposition outcome (see Section 6).

---

## 6. Brown-Rot vs. White-Rot Biochemistry

### 6.1 White-Rot Decay

White-rot fungi degrade all three major wood cell wall polymers: cellulose, hemicellulose, and lignin. Two sub-types are recognized:

- **Simultaneous white rot:** All polymers degraded concurrently and approximately equally. Wood becomes lighter in color (white/bleached appearance) and fibrous/spongy. Example: *Trametes versicolor*, *Phanerochaete chrysosporium* (though *P. chrysosporium* shows some selectivity).
- **Selective (preferential) white rot:** Lignin and hemicellulose are degraded preferentially while cellulose is initially conserved. This is commercially desirable (biopulping). Example: *Ceriporiopsis subvermispora*, *Phlebia radiata*.

Enzyme systems: Full suite of class II peroxidases (LiP, MnP, VP) and/or laccase, plus hydrolytic cellulases and hemicellulases.

### 6.2 Brown-Rot Decay

Brown-rot fungi degrade cellulose and hemicellulose but leave behind a modified lignin residue. The decayed wood is brown (color of oxidized lignin), crumbly, and fractures in a characteristic cubical pattern ("cubical brown rot"). Brown-rot accounts for roughly 80% of wood decay in boreal conifer forests (Gilbertson, 1980) and only about 6% of Polyporales species, yet is ecologically dominant in these biomes.

**Model organism:** *Postia placenta* (syn. *Rhodonia placenta*, formerly *Poria placenta*) -- genome published by Martinez et al. (2009, *PNAS*).

### 6.3 The Brown-Rot Paradox

The "brown-rot paradox" is this: brown-rot fungi lack the ligninolytic peroxidases (LiP, MnP, VP) found in white-rot fungi, AND they have a dramatically reduced cellulase repertoire compared to white-rot fungi. *P. placenta* has very few cellobiohydrolase genes and lacks the processive CBH-type enzymes of the GH7 family that are crucial for crystalline cellulose hydrolysis in white-rot fungi and Ascomycetes. Yet brown-rot fungi degrade cellulose rapidly and efficiently. How?

### 6.4 Chelator-Mediated Fenton (CMF) Chemistry

The answer lies in a non-enzymatic oxidative pretreatment system based on Fenton chemistry.

**Fenton reaction:**
Fe(II) + H2O2 -> Fe(III) + OH* + OH-

The hydroxyl radical (OH*) is one of the most powerful biological oxidizing agents (redox potential ~2.3 V). It attacks all organic molecules non-selectively, including cellulose, hemicellulose, and lignin.

**The CMF system in brown-rot fungi (refined model, following Goodell et al., 1997; Arantes & Goodell, 2014):**

1. **Low-molecular-weight chelators:** Brown-rot fungi produce small iron-chelating compounds, notably 2,5-dimethoxyhydroquinone (2,5-DMHQ) and related hydroquinone derivatives, as well as oxalic acid. In *P. placenta* and *Gloeophyllum trabeum*, 2,5-DMHQ has been specifically identified.

2. **Iron mobilization and reduction:** Oxalic acid (secreted at high concentrations by brown-rot fungi) solubilizes Fe(III) from the wood cell wall and soil/substrate. The pH gradient between the fungal hypha (~pH 2.5 near the hyphal surface, due to oxalate secretion) and the cell wall interior (~pH 5) is critical. Oxalate-chelated Fe(III) diffuses into the cell wall, where the pH differential causes the oxalate to precipitate as calcium oxalate or to dissociate, releasing Fe(III).

3. **Hydroquinone redox cycling:** The 2,5-DMHQ chelator reduces Fe(III) to Fe(II) (the Fenton-reactive form) via a non-enzymatic electron transfer. The hydroquinone is oxidized to the semiquinone radical and then to the quinone form. This generates Fe(II) in the vicinity of the cellulose microfibrils, deep within the cell wall where enzymes cannot penetrate.

4. **H2O2 generation:** H2O2 is generated by several mechanisms: auto-oxidation of the hydroquinone/semiquinone redox cycling, dedicated oxidases (e.g., methanol oxidase), and possibly O2 reduction during Fe(II) auto-oxidation.

5. **Fenton reaction occurs in the cell wall:** Fe(II) + H2O2 react within the cell wall lumen, generating hydroxyl radicals that depolymerize cellulose and hemicellulose non-selectively. The radicals also attack lignin, causing demethylation and ring modification but not complete degradation.

6. **Enzymatic cleanup:** After the Fenton pretreatment has depolymerized cellulose into shorter, soluble fragments, the fungus uses its limited set of endoglucanases and beta-glucosidases (GH5, GH12, etc.) to hydrolyze the fragments to glucose for absorption. This is a "two-step" mechanism: non-enzymatic radical pretreatment followed by enzymatic saccharification.

### 6.5 Spatial Compartmentalization

Arantes et al. (2012) and others demonstrated that the Fenton reaction zone is spatially separated from the hyphal surface. The hydroxyl radicals are generated within the cell wall, at a distance from the hyphae. This protects the fungal hyphae and their secreted enzymes from damage by the indiscriminate hydroxyl radicals. The spatial separation is maintained by the diffusion characteristics of the small-molecule chelators and the pH gradient.

### 6.6 Lignin Modification vs. Mineralization

Brown-rot fungi modify lignin but do not mineralize it. The modifications include:
- Demethoxylation of aromatic rings (loss of -OCH3 groups).
- Partial oxidation and ring opening.
- Some depolymerization.
- Cross-linking and repolymerization of modified lignin fragments.

The resulting brown-rot residue is a heavily modified polymer that is more oxidized and has fewer methoxyl groups than native lignin. This material is relatively recalcitrant and contributes to stable soil organic matter.

### 6.7 Ecological Consequences

**In boreal forests:**
- Conifer wood (high in guaiacyl lignin, lower in syringyl lignin) favors brown-rot decomposition.
- Brown-rot residues contribute substantially to the thick organic soil horizons (mor humus) characteristic of boreal forests.
- Estimates suggest that brown-rot residues may persist in soil for decades to centuries, contributing to the large soil carbon pool in boreal ecosystems.
- Yasso soil carbon models and other biogeochemical models increasingly distinguish between white-rot and brown-rot decay pathways because of their different contributions to soil carbon stocks.

**In tropical and temperate hardwood forests:**
- White-rot dominates, and lignin is more completely mineralized.
- Hardwoods contain syringyl lignin (in addition to guaiacyl), which is more susceptible to peroxidase attack.
- Less brown-rot residue accumulates in soil; more carbon is returned to the atmosphere as CO2.
- Soil organic horizons tend to be thinner (mull humus).

---

## 7. Recent Research (2020-2025)

### 7.1 LPMO Biochemistry and the O2 vs H2O2 Debate

- The debate over whether LPMOs use O2 or H2O2 as their primary co-substrate continued through the early 2020s. Evidence accumulated in favor of H2O2 as the catalytically relevant co-substrate (peroxygenase mechanism) rather than O2 (monooxygenase mechanism), with several kinetic and structural studies supporting this view (Kuusk et al., 2019; Hedegard & Ryde, 2018; Bissaro et al., 2020). However, some researchers argue that O2-dependent activity is also physiologically relevant and that the question is not fully resolved.
- New LPMO families continue to be discovered. AA16 LPMOs (identified ~2019-2020 from *Aspergillus* species) act on cellulose and have distinct phylogenetic origins from AA9 LPMOs, suggesting convergent evolution.

### 7.2 Fungal Decomposition and Climate Change

- Multiple studies (2020-2024) investigated how warming affects fungal decomposition rates and community composition:
  - Warming experiments (e.g., the Harvard Forest Soil Warming experiment, running since 1991) showed that chronic warming (+5 C) initially accelerates decomposition but the effect diminishes over decades as labile carbon pools are depleted ("thermal acclimation" or "substrate depletion" effect). Fungal community composition shifts under warming.
  - Crowther et al. (2016, *Nature*) estimated that a 1 C increase in global temperature could release 30 +/- 30 Gt C from soil over decadal timescales due to enhanced microbial decomposition. This represents a significant positive feedback to climate warming. Subsequent studies have both supported and moderated these estimates.
  - Permafrost thaw exposes enormous stocks of previously frozen organic carbon (~1,500 Gt C in permafrost globally) to fungal decomposition, representing a potential major positive feedback loop.
  - Fernandez & Kennedy (2016, *New Phytologist*) and subsequent work showed that ectomycorrhizal fungi (Gadgil effect) can suppress saprotrophic fungal activity, creating a complex interaction between mycorrhizal community dynamics and carbon cycling.

### 7.3 Biofuel and Biotechnology Applications

- **Enzyme cocktail optimization:** Industrial cellulase cocktails (e.g., Novozymes Cellic CTec3) incorporate LPMOs alongside traditional cellulases. Continued protein engineering of LPMOs and cellulases for improved thermostability, pH tolerance, and catalytic efficiency.
- **Consolidated bioprocessing (CBP):** Research continues on using fungi like *Trichoderma reesei* or engineered *Saccharomyces cerevisiae* expressing cellulases for combined saccharification and fermentation of lignocellulosic biomass.
- **Lignin valorization:** Growing interest in using ligninolytic fungi (laccases, peroxidases) to convert lignin from a waste stream into valuable chemicals (vanillin, muconic acid, adipic acid) rather than burning it. Fungal laccases are used in kraft pulp bio-bleaching and in biosensor applications.

### 7.4 Bioremediation

- Ligninolytic enzymes, particularly laccase and MnP, have broad substrate specificity and can degrade many xenobiotic pollutants:
  - Polycyclic aromatic hydrocarbons (PAHs)
  - Synthetic dyes (azo dyes, anthraquinone dyes)
  - Endocrine disruptors (bisphenol A, nonylphenol)
  - Pharmaceuticals and personal care products (PPCPs)
  - Pesticides (DDT, atrazine -- though with variable efficiency)
  - Microplastics -- emerging research (2022-2024) on whether fungal enzymes can break down polyethylene (PE), polyurethane (PU), and other plastics. Several studies have reported limited but measurable degradation of polyethylene by *Pleurotus ostreatus* and other white-rot fungi, and PET by some Ascomycetes.
- *Trametes versicolor* and *Pleurotus ostreatus* are the most commonly studied species for bioremediation.
- Immobilized laccase on nanoparticle supports or in membrane reactors is an active area of applied research.

### 7.5 Genomics and Metagenomics Advances

- The 1000 Fungal Genomes Project (JGI/DOE) and related initiatives have greatly expanded the number of sequenced wood-decay fungal genomes, enabling comparative analysis of CAZyme (carbohydrate-active enzyme) repertoires across hundreds of species.
- Metatranscriptomic studies of decaying wood have revealed in situ gene expression patterns, showing that different decay stages are characterized by different enzyme expression profiles (e.g., LPMOs and oxidases dominate early; hydrolytic cellulases increase later in some systems).
- Riley et al. (2014, *PNAS*) and subsequent analyses demonstrated that the transition from white-rot to brown-rot has occurred multiple times independently in fungal evolution, and involves convergent loss of class II peroxidases and CBH genes. This evolutionary transition appears to be unidirectional (brown-rot lineages do not revert to white-rot) and is associated with gene loss (contraction of lignocellulose-active gene families) rather than gene gain.

### 7.6 Mycelium Materials and Carbon Sequestration

- Growing interest in using fungal mycelium as a sustainable material (packaging, insulation, building materials, leather alternatives). Companies like Ecovative Design and MycoWorks have commercialized mycelium-based products. While primarily a materials science topic, this connects to decomposition biology because the organisms used (often *Ganoderma* spp. or *Pleurotus* spp.) are wood-decay fungi, and the manufacturing process leverages their lignocellulose-degrading capabilities.
- Research into whether fungal decomposition pathways can be engineered or managed to increase soil carbon sequestration (e.g., promoting brown-rot communities in managed forests to increase recalcitrant lignin residue inputs to soil).

---

## Key References

1. Tien, M. & Kirk, T.K. (1983). Lignin-degrading enzyme from the Hymenomycete *Phanerochaete chrysosporium* Burds. *Science*, 221, 661-663.
2. Glenn, J.K., Morgan, M.A., Mayfield, M.B., Kuwahara, M., & Gold, M.H. (1983). An extracellular heme enzyme of *Phanerochaete chrysosporium* that catalyzes the oxidation of veratryl alcohol. *Biochemical and Biophysical Research Communications*, 114, 1077-1083.
3. Kuwahara, M., Glenn, J.K., Morgan, M.A., & Gold, M.H. (1984). Separation and characterization of two extracellular H2O2-dependent oxidases from a ligninolytic culture of *Phanerochaete chrysosporium*. *FEBS Letters*, 169, 247-250.
4. Martinez, A.T. (2002). Molecular biology and structure-function of lignin-degrading heme peroxidases. *Enzyme and Microbial Technology*, 30, 425-444.
5. Ruiz-Duenas, F.J. & Martinez, A.T. (2009). Microbial degradation of lignin: how a bulky recalcitrant polymer is efficiently recycled in nature and how we can take advantage of this. *Microbial Biotechnology*, 2(2), 164-177.
6. Vaaje-Kolstad, G., Westereng, B., Horn, S.J., Liu, Z., Zhai, H., Sorlie, M., & Eijsink, V.G.H. (2010). An oxidative enzyme boosting the enzymatic conversion of recalcitrant polysaccharides. *Science*, 330, 219-222.
7. Quinlan, R.J. et al. (2011). Insights into the oxidative degradation of cellulose by a copper metalloenzyme that exploits biomass components. *PNAS*, 108, 15079-15084.
8. Floudas, D., Binder, M., Riley, R. et al. (2012). The Paleozoic origin of enzymatic lignin decomposition reconstructed from 31 fungal genomes. *Science*, 336(6089), 1715-1719.
9. Nelsen, M.P., DiMichele, W.A., Peters, S.E., & Boyce, C.K. (2016). Delayed fungal evolution did not cause the Paleozoic peak in coal production. *PNAS*, 113(9), 2442-2447.
10. Goodell, B., Jellison, J., Liu, J., Daniel, G., Paszczynski, A., Fekete, F., Krishnamurthy, S., Jun, L., & Xu, G. (1997). Low molecular weight chelators and phenolic compounds isolated from wood decay fungi and their role in the fungal biodegradation of wood. *Journal of Biotechnology*, 53, 133-162.
11. Arantes, V. & Goodell, B. (2014). Current understanding of brown-rot fungal biodegradation mechanisms: a review. In *Deterioration and Protection of Sustainable Biomaterials*, ACS Symposium Series, Vol. 1158, pp. 3-21.
12. Martinez, D. et al. (2009). Genome, transcriptome, and secretome analysis of wood decay fungus *Postia placenta* supports unique mechanisms of lignocellulose conversion. *PNAS*, 106(6), 1954-1959.
13. Boddy, L. (2000). Interspecific combative interactions between wood-decaying basidiomycetes. *FEMS Microbiology Ecology*, 31, 185-194.
14. Riley, R. et al. (2014). Extensive sampling of basidiomycete genomes demonstrates inadequacy of the white-rot/brown-rot paradigm for wood decay fungi. *PNAS*, 111(27), 9923-9928.
15. Bissaro, B., Rohr, A.K., Muller, G. et al. (2017). Oxidative cleavage of polysaccharides by monocopper enzymes depends on H2O2. *Nature Chemical Biology*, 13, 1123-1128.
16. Crowther, T.W. et al. (2016). Quantifying global soil carbon losses in response to warming. *Nature*, 540, 104-108.

---

## Glossary

- **CAZyme:** Carbohydrate-Active Enzyme (classified in the CAZy database: www.cazy.org)
- **GH:** Glycoside Hydrolase family
- **AA:** Auxiliary Activity family (includes LPMOs and other redox enzymes)
- **CBH:** Cellobiohydrolase
- **CMF:** Chelator-Mediated Fenton (chemistry)
- **LPMO:** Lytic Polysaccharide Monooxygenase
- **CDH:** Cellobiose Dehydrogenase
- **LMS:** Laccase-Mediator System
- **Gt C:** Gigatons of carbon (10^9 metric tons)
- **Ma:** Mega-annum (millions of years ago)
