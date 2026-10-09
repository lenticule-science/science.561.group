---
title: "Stomatal Biology"
date-created: 2026-03-28T00:00:00
description: "Detailed scientific reference on stomatal mechanics, signaling, development, transpiration, and climate interactions."
keywords:
  - biology
  - botany
  - plant-physiology
  - gas-exchange
  - climate-science
requires:
  - "Cells and Metabolism"
teaches:
  - "Stomatal Biology"
id: stomatal-biology
type: lesson
---

## Assumed audience

Someone familiar with basic cell biology and plant anatomy who wants the specific molecular, quantitative, and ecological details of stomatal function.

---

## 1. Guard Cell Mechanics

### Basic anatomy

Each stoma consists of a pore flanked by two kidney-shaped guard cells (in dicots) or dumbbell-shaped guard cells (in grasses/monocots). Guard cells are the only epidermal cells that contain chloroplasts.

### How guard cells change shape

Guard cell opening depends on a mechanical principle rooted in cell wall architecture. The cell walls of guard cells have **radially oriented cellulose microfibrils** -- the microfibrils run perpendicular to the long axis of the cell, wrapping around it like hoops on a barrel. When the guard cell takes up water and becomes turgid, internal hydrostatic pressure (turgor) pushes outward. Because the radial cellulose hoops resist lateral expansion, the cell can only elongate. But the guard cells are attached to each other at their ends, and the inner wall (facing the pore) is thicker than the outer wall. The result: as turgor increases, the thinner outer wall stretches more, causing each guard cell to bow outward, pulling the pore open. This was first clearly described by Aylor et al. (1973) and elaborated by Sharpe et al. (1987) using finite element models.

In grasses, dumbbell-shaped guard cells operate differently: the bulbous ends swell, pushing the thin central portion apart.

### Ion transport -- the molecular machinery

Stomatal opening and closing is driven by ion fluxes that change guard cell osmotic potential and thus turgor.

**Opening (light/low CO2 conditions):**

1. **H+-ATPase proton pumps (AHA1, AHA2 in Arabidopsis)** -- Blue light activates these plasma membrane proton pumps via phosphorylation of the C-terminal autoinhibitory domain (specifically Thr-947 in AHA1). The pump extrudes H+ from the guard cell, hyperpolarizing the membrane (making the interior more negative, to approximately -150 to -200 mV). This was characterized by Kinoshita and Shimazaki (1999, *Plant Cell*). The 14-3-3 protein binds the phosphorylated C-terminus to lock the pump in its active state (Kinoshita and Shimazaki, 2002).

2. **KAT1 (K+ inward-rectifying channel)** -- The hyperpolarized membrane drives K+ influx through KAT1 and its homolog KAT2. KAT1 was cloned by Anderson et al. (1992, *PNAS*) and was one of the first plant ion channels identified. It activates at membrane potentials more negative than about -100 mV, conducting K+ into the cell.

3. **Anion uptake and organic solute accumulation** -- Cl- enters the cell, and malate2- is synthesized internally from starch breakdown. Sucrose is also imported or produced photosynthetically. Together these solutes lower the osmotic potential, driving water uptake via aquaporins.

4. Total solute accumulation can increase guard cell K+ concentration from ~100 mM to ~400-500 mM during opening. Guard cell volume increases by 40-100% upon opening (Franks et al., 2001).

**Closing (ABA/high CO2/darkness):**

1. **SLAC1 (Slow Anion Channel-Associated 1)** -- The primary anion efflux channel. SLAC1 conducts Cl- and malate2- out of the guard cell. Cloned simultaneously by Negi et al. (2008, *Current Biology*) and Vahisalu et al. (2008, *Nature*). Loss-of-function *slac1* mutants have constitutively open stomata and are hypersensitive to drought and ozone.

2. **SLAH3 (SLAC1 Homolog 3)** -- Preferentially conducts nitrate (NO3-) out of the guard cell. Activated by the calcium-dependent kinase CPK21. Geiger et al. (2011, *PNAS*) showed SLAH3 is important for stomatal closure particularly when nitrate is the dominant anion.

3. **GORK (Guard Cell Outward-Rectifying K+ Channel)** -- Once anion efflux depolarizes the membrane, GORK activates (at potentials more positive than about -50 mV) and conducts K+ out of the cell. Hosy et al. (2003, *Plant Physiology*) demonstrated that *gork* knockout mutants show impaired stomatal closure.

4. The net loss of K+, Cl-, malate, and other solutes raises the osmotic potential, water exits via aquaporins, turgor drops, and the elastic cell walls pull the pore shut.

**Speed:** Full stomatal opening typically takes 15-60 minutes. Closing can be faster -- ABA-induced closure often occurs within 10-15 minutes. However, partial adjustments of aperture occur continuously.

---

## 2. Signal Integration

Guard cells are among the most signal-integrative cells in plants. They simultaneously process:

### Blue light -- phototropin signaling

- **Receptors:** Phototropin 1 (phot1) and phototropin 2 (phot2), blue-light-activated serine/threonine kinases with LOV (Light, Oxygen, Voltage) domains. Kinoshita et al. (2001, *Nature*) demonstrated that blue light activates stomatal opening via phot1/phot2.
- **Mechanism:** Blue light --> phot1/phot2 autophosphorylation --> signal cascade including BLUS1 kinase (Takemiya et al., 2013, *PNAS*) --> phosphorylation of AHA1 H+-ATPase --> proton extrusion --> K+ influx --> opening.
- **Sensitivity:** Guard cells respond to blue light fluence rates as low as 1 micromol m-2 s-1. The blue light response operates under a background of red light, which explains why stomata open most efficiently under white light.

### Red light -- indirect via photosynthesis

- Red light drives photosynthesis in mesophyll cells, which lowers the internal CO2 concentration (Ci) in the leaf airspaces. Reduced Ci is sensed by guard cells and promotes opening.
- Guard cell chloroplasts also photosynthesize, but their direct contribution to opening is debated. Lawson et al. (2003) showed that guard cell photosynthesis may contribute to blue-light-independent opening in some species.

### CO2 concentration -- carbonic anhydrase pathway

- **Sensors:** Beta-carbonic anhydrases CA1 and CA4 (encoded by *CA1* and *CA4* in Arabidopsis) convert CO2 to bicarbonate (HCO3-) inside the guard cell. Hu et al. (2010, *Nature Cell Biology*) demonstrated that *ca1 ca4* double mutants fail to close stomata in response to elevated CO2.
- **Kinase HT1 (High Temperature 1):** HT1 is a protein kinase that acts as a negative regulator of CO2-induced closure. Under low CO2, HT1 is active and prevents closure. Under high CO2, the elevated HCO3- (produced by CA1/CA4) inhibits HT1, relieving the block. Hashimoto et al. (2006, *Plant Journal*) identified HT1; Hiyama et al. (2017, *Nature Communications*) showed HT1 phosphorylates and inhibits the convergence point between CO2 and ABA signaling pathways.
- **Downstream:** The CO2 signal converges on activation of SLAC1 via OST1/SnRK2.6 kinase and the calcium-dependent kinases CPK3, CPK6, CPK21, CPK23.

### ABA (abscisic acid) -- the drought hormone

The ABA signaling pathway in guard cells is one of the best-characterized hormone pathways in plants:

1. **Receptors:** PYR/PYL/RCAR family (14 members in Arabidopsis). PYR1 was identified by Park et al. (2009, *Science*); simultaneously RCAR1 was identified by Ma et al. (2009, *Science*). These are soluble START-domain proteins.
2. **PP2C phosphatases:** In the absence of ABA, PP2C phosphatases (ABI1, ABI2, HAB1, PP2CA) dephosphorylate and inactivate SnRK2 kinases, keeping the system off.
3. **ABA binding:** ABA binds to PYR/PYL, and the ABA-PYR/PYL complex binds and inhibits PP2Cs, relieving their suppression of SnRK2s.
4. **SnRK2 kinases (especially OST1/SnRK2.6):** Now freed from PP2C inhibition, OST1 autophosphorylates and then phosphorylates SLAC1 (activating anion efflux) and the NADPH oxidase RbohF (producing reactive oxygen species that activate Ca2+ channels). Geiger et al. (2009, *PNAS*) reconstituted the minimal system: OST1 directly phosphorylates SLAC1 at Ser-120, activating it.
5. **Ca2+ signaling:** ABA also triggers cytosolic Ca2+ increases via Ca2+-permeable channels in the plasma membrane and tonoplast, further activating CPK kinases that phosphorylate SLAC1.
6. **Result:** Anion efflux through SLAC1 --> depolarization --> K+ efflux through GORK --> solute loss --> water loss --> turgor decrease --> closure.

### Humidity -- hydropassive and hydroactive responses

- **Hydropassive:** Direct evaporation of water from guard cells when humidity drops causes a rapid, transient partial closure (the Iwanoff effect). This is purely mechanical, not signaling-mediated.
- **Hydroactive:** Guard cells sense humidity changes and actively close via ABA-dependent pathways. Merilo et al. (2018, *New Phytologist*) showed that the ABA signaling pathway is required for the active component of humidity-induced closure. The *ost1* mutant (lacking SnRK2.6) has severely impaired vapor pressure deficit (VPD) responses.

### Signal convergence

The CO2 and ABA pathways converge on the same effectors -- primarily SLAC1 and the OST1 kinase. This explains why elevated CO2 and ABA produce synergistic stomatal closure. Merilo et al. (2013, *Plant Physiology*) mapped this convergence point. Light signals oppose closure signals through the proton pump. The guard cell integrates all these inputs into a single output: aperture width.

---

## 3. Stomatal Density and Development

### The stomatal development pathway

Stomatal development in Arabidopsis is controlled by a peptide-receptor signaling system:

**Peptide ligands -- EPF/EPFL family:**
- **EPF2 (Epidermal Patterning Factor 2):** Secreted by protodermal cells entering the stomatal lineage (meristemoid mother cells). EPF2 inhibits neighboring cells from adopting stomatal fate, enforcing spacing. Hunt and Gray (2009, *Current Biology*).
- **EPF1:** Secreted by later-stage precursors (guard mother cells). EPF1 enforces the **one-cell spacing rule** -- the principle that no two stomata are directly adjacent; at least one non-stomatal epidermal cell always separates them. Hara et al. (2007, *Plant Cell Physiology*).
- **STOMAGEN/EPFL9:** Secreted by mesophyll (internal) cells, acts as a positive regulator of stomatal density. STOMAGEN competes with EPF1/EPF2 for binding to the same receptors. Sugano et al. (2010, *Nature*). This is how internal tissue controls surface patterning.

**Receptors -- ERECTA family:**
- **ERECTA (ER), ERECTA-LIKE 1 (ERL1), ERECTA-LIKE 2 (ERL2):** Leucine-rich repeat receptor-like kinases. ER primarily processes EPF2 signals; ERL1 processes EPF1 signals. They act with the co-receptor TMM (TOO MANY MOUTHS), a receptor-like protein lacking a kinase domain. Shpak et al. (2005, *Science*) showed that *er erl1 erl2* triple mutants produce epidermes composed almost entirely of stomata.

**Transcription factors:**
- **SPEECHLESS (SPCH):** Initiates stomatal lineage entry. *spch* mutants produce epidermis with no stomata at all.
- **MUTE:** Drives transition from meristemoid to guard mother cell. *mute* mutants arrest at the meristemoid stage.
- **FAMA:** Controls final guard cell differentiation. *fama* mutants produce guard mother cells that divide indefinitely without differentiating.
- These three bHLH transcription factors were characterized by Ohashi-Ito and Bergmann (2006), Pillitteri et al. (2007), and MacAlister et al. (2007).

### The one-cell spacing rule

The one-cell spacing rule ensures that stomata are always separated by at least one intervening epidermal (pavement) cell. This spacing is functionally important: it allows each stoma to be surrounded by subsidiary cells that can exchange ions with the guard cells and provide mechanical leverage. The rule is enforced by EPF1/EPF2 signaling through ERECTA family receptors, which inhibit stomatal identity in cells adjacent to developing stomata.

### Environmental modulation of stomatal density

**CO2 response:** Plants grown under elevated CO2 typically develop 10-40% fewer stomata than those grown under ambient CO2. The mechanism involves the signaling peptide CRSP (CO2 Response Secreted Protease), identified by Engineer et al. (2014, *Nature*). CRSP cleaves and activates EPF2 under high CO2, increasing EPF2-mediated repression of stomatal development.

**Light response:** High light intensity increases stomatal density (more stomata per mm2). The systemic signal from mature leaves that communicates light conditions to developing leaves involves the HIC (HIGH CARBON DIOXIDE) gene and long-distance peptide signals. Lake et al. (2001, *Nature*) demonstrated that the CO2 concentration experienced by mature leaves, not developing leaves, determines stomatal density -- indicating a systemic signal.

---

## 4. Quantitative Data

### Stomatal density

- **Typical range for broadleaf species:** 100-300 stomata per mm2 of leaf surface (abaxial/lower surface). Many species have stomata only on the lower surface (hypostomatous). Some have them on both (amphistomatous), such as grasses and many crop plants.
- **Arabidopsis thaliana:** ~150-200 stomata/mm2 on abaxial surface (Bergmann and Sack, 2007).
- **Grasses (wheat, maize):** 40-80 stomata/mm2, but both surfaces.
- **Xerophytes (drought-adapted):** Often sunken stomata with lower density, e.g., Nerium oleander ~50 stomata/mm2 in crypts.
- **Floating aquatic plants (e.g., water lily):** Stomata only on upper (adaxial) surface.

### Whole-tree stomatal counts

A mature oak tree (*Quercus*) has approximately 250,000-700,000 leaves, each with roughly 20,000-50,000 stomata (both surfaces of ~100 cm2 leaf area). This gives an order-of-magnitude estimate of **~10^10 stomata per tree** (roughly 10 billion). Estimates vary with species, canopy size, and leaf area index.

### Transpiration rates

- **Large deciduous tree (e.g., mature oak or maple):** Transpires approximately **150-400 liters (40-100 gallons) of water per day** during the growing season. Some tropical trees can exceed 500 L/day.
- **A single mature corn (maize) plant:** ~3-4 liters per day during peak growth.
- **Forest stand:** A temperate deciduous forest transpires roughly 2-4 mm of water per day during summer, equivalent to 20,000-40,000 liters per hectare per day.
- **Amazon rainforest:** Transpires roughly 2.5-4.5 mm/day, contributing about 25-50% of regional rainfall through moisture recycling (Salati and Vose, 1984; Staal et al., 2018).

### Transpiration ratio (water use efficiency)

The transpiration ratio is the mass of water transpired per mass of CO2 (or dry matter) fixed:

- **C3 plants (most trees, wheat, rice, soybeans):** Transpiration ratio of approximately **400-800 mol H2O per mol CO2 fixed** (or roughly 400-800 g H2O per g dry matter gained). This means C3 plants lose 400-800 water molecules for every CO2 molecule they fix.
- **C4 plants (maize, sugarcane, many tropical grasses):** Transpiration ratio of approximately **150-350 mol H2O per mol CO2 fixed**. C4 plants are roughly 2x more water-use efficient because the CO2-concentrating mechanism allows them to operate at lower stomatal conductance.
- **CAM plants (cacti, agaves):** Transpiration ratio as low as **50-100 mol H2O per mol CO2**, because stomata open only at night when evaporative demand is low.

---

## 5. Stomata and Climate

### Global water cycling

- **Stomata control ~60-80% of terrestrial evapotranspiration** (the rest is soil evaporation and interception). Jasechko et al. (2013, *Nature*) estimated that transpiration (almost entirely stomatal) accounts for 80-90% of terrestrial evapotranspiration, though subsequent analyses by Coenders-Gerrits et al. (2014) revised this downward to ~60-70%. A synthesis by Good et al. (2015, *Science*) estimated transpiration at 64 +/- 13% of terrestrial evapotranspiration.
- Total terrestrial evapotranspiration is approximately 65,000-75,000 km3/year (about 65% of terrestrial precipitation). Of this, roughly 40,000-50,000 km3/year passes through stomata.

### CO2 responses and water cycle implications

- Under elevated CO2, stomata partially close. **FACE (Free-Air CO2 Enrichment) experiments** show that doubling CO2 reduces stomatal conductance by approximately 20-40% across species (Ainsworth and Rogers, 2007, *Plant Cell and Environment*).
- Reduced transpiration at the leaf level does not necessarily translate linearly to reduced evapotranspiration at the canopy level. Increased leaf area under elevated CO2 can partially compensate (the "fertilization effect"). But the net effect is generally reduced ecosystem water loss.
- **Implications for regional hydrology:** Gedney et al. (2006, *Nature*) argued that CO2-induced stomatal closure contributed to the observed increase in continental runoff during the 20th century. If plants transpire less, more water remains in the soil and runs off into rivers.
- **Implications for drought:** Reduced stomatal conductance conserves soil moisture, potentially buffering droughts. But the same reduction decreases evaporative cooling at the leaf and canopy level, potentially raising leaf and surface temperatures by 1-2 degrees C under doubled CO2 (Cao et al., 2010, *PNAS*).
- Sellers et al. (1996, *Science*) showed in global climate models that physiological (stomatal) responses to CO2, not just radiative effects, significantly affect surface temperature projections.

### Stomata and the terrestrial carbon sink

The balance between stomatal conductance (controlling water loss) and mesophyll conductance (controlling CO2 supply to Rubisco) determines whole-plant carbon gain. Flexas et al. (2012, *New Phytologist*) argued that mesophyll conductance may be as limiting as stomatal conductance for many species.

---

## 6. Fossil Stomata as CO2 Proxies

### The stomatal index method

- **Principle:** Plants produce fewer stomata per unit leaf area when CO2 is high (because less stomatal opening is needed). This relationship, calibrated in living plants, can be applied to fossil leaves to estimate past CO2 concentrations.
- **Stomatal index (SI):** SI = [number of stomata / (number of stomata + number of epidermal cells)] x 100. SI is preferred over raw stomatal density because it corrects for cell size changes (which can vary with leaf expansion unrelated to CO2).
- **Pioneer work:** Woodward (1987, *Nature*) demonstrated that herbarium specimens collected over 200 years showed declining stomatal density correlated with rising CO2. This was a landmark paper establishing the method.
- **Calibration:** McElwain and Chaloner (1995, 1996) developed the stomatal ratio method using nearest living equivalents (NLEs) of fossil species. The stomatal ratio of the fossil taxon to its NLE is compared to the known CO2 at the time the NLE was growing.

### Applications

- **Cretaceous CO2:** Retallack (2001) and Beerling et al. (2002, *American Journal of Science*) used fossil Ginkgo and other taxa to estimate Cretaceous CO2 at 1000-2000 ppm, consistent with warm greenhouse climates.
- **End-Triassic mass extinction:** McElwain et al. (1999, *Science*) used fossil stomatal data to demonstrate a sharp CO2 spike (~2000-4000 ppm) at the Triassic-Jurassic boundary, coincident with Central Atlantic Magmatic Province volcanism.
- **Cenozoic CO2 decline:** Royer (2001, *Paleobiology*) and Beerling and Royer (2011, *Nature Geoscience*) compiled stomatal-based CO2 estimates showing the long-term decline from ~1000 ppm in the early Cenozoic to preindustrial ~280 ppm, correlated with Antarctic glaciation.

### Limitations

- The stomatal-CO2 relationship is species-specific and can be confounded by other environmental variables (light, humidity, temperature).
- The relationship saturates at very high CO2 (>800-1000 ppm in many species), limiting the precision of stomatal proxies in deep-time greenhouse climates.
- Fossil preservation must be good enough to count individual cells -- typically requiring cuticle preservation.

---

## Key References

- Ainsworth, E.A. and Rogers, A. (2007). The response of photosynthesis and stomatal conductance to rising CO2. *Plant, Cell and Environment* 30: 619-630.
- Anderson, J.A. et al. (1992). Functional expression of a probable Arabidopsis thaliana potassium channel in *Saccharomyces cerevisiae*. *PNAS* 89: 3736-3740.
- Beerling, D.J. and Royer, D.L. (2011). Convergent Cenozoic CO2 history. *Nature Geoscience* 4: 418-420.
- Engineer, C.B. et al. (2014). Carbonic anhydrases, EPF2, and a novel protease mediate CO2 control of stomatal development. *Nature* 513: 246-250.
- Geiger, D. et al. (2009). Activity of guard cell anion channel SLAC1 is controlled by drought-stress signaling kinase-phosphatase pair. *PNAS* 106: 21425-21430.
- Good, S.P. et al. (2015). Hydrologic connectivity constrains partitioning of global terrestrial water fluxes. *Science* 349: 175-177.
- Hashimoto, M. et al. (2006). Arabidopsis HT1 kinase controls stomatal movements in response to CO2. *Plant Journal* 46: 164-173.
- Hu, H. et al. (2010). Carbonic anhydrases are upstream regulators of CO2-controlled stomatal movements in guard cells. *Nature Cell Biology* 12: 87-93.
- Jasechko, S. et al. (2013). Terrestrial water fluxes dominated by transpiration. *Nature* 496: 347-350.
- Kinoshita, T. and Shimazaki, K. (1999). Blue light activates the plasma membrane H+-ATPase by phosphorylation of the C-terminus in stomatal guard cells. *EMBO Journal* 18: 5548-5558.
- Kinoshita, T. et al. (2001). phot1 and phot2 mediate blue light regulation of stomatal opening. *Nature* 414: 656-660.
- Ma, Y. et al. (2009). Regulators of PP2C phosphatase activity function as abscisic acid sensors. *Science* 324: 1064-1068.
- McElwain, J.C. et al. (1999). Fossil plants and global warming at the Triassic-Jurassic boundary. *Science* 285: 1386-1390.
- Merilo, E. et al. (2013). PYR/RCAR receptors contribute to ozone-, reduced air humidity-, darkness-, and CO2-induced stomatal regulation. *Plant Physiology* 162: 1652-1668.
- Negi, J. et al. (2008). CO2 regulator SLAC1 and its homologues are essential for anion homeostasis in plant cells. *Nature* 452: 483-486.
- Park, S.Y. et al. (2009). Abscisic acid inhibits type 2C protein phosphatases via the PYR/PYL family of START proteins. *Science* 324: 1068-1071.
- Sellers, P.J. et al. (1996). Comparison of radiative and physiological effects of doubled atmospheric CO2 on climate. *Science* 271: 1402-1406.
- Shpak, E.D. et al. (2005). Stomatal patterning and differentiation by synergistic interactions of receptor kinases. *Science* 309: 290-293.
- Vahisalu, T. et al. (2008). SLAC1 is required for plant guard cell S-type anion channel function in stomatal signalling. *Nature* 452: 487-491.
- Woodward, F.I. (1987). Stomatal numbers are sensitive to increases in CO2 from pre-industrial levels. *Nature* 327: 617-618.

## Related

- [Stomata](../../../../../services/botany-services-section/content/text/glossary/terms/stomata.md) -- conceptual overview
- [Photosynthesis](../../../../../services/botany-services-section/content/text/glossary/terms/photosynthesis.md) -- the process stomata serve
- [Xylem](../../../../../services/botany-services-section/content/text/glossary/terms/xylem.md) -- transpiration stream
- [Niche Construction](../../../glossary/terms/niche-construction.md) -- stomata as planetary-scale niche construction
- [Plants in Ecosystems](../../../../../services/botany-services-section/content/text/glossary/terms/plants-in-ecosystems.md) -- ecological context
