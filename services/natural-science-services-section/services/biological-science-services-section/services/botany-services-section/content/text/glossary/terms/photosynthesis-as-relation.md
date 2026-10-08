---
name: Photosynthesis
date-created: 2026-03-06
type: concept
aliases:
  - Photosynthesis
  - photosynthesis
  - oxygenic photosynthesis
keywords:
  - Photosynthesis
  - Botany
  - Biochemistry
  - Plant Physiology
description: The biochemical process by which plants, algae, and cyanobacteria use light energy to fix carbon dioxide into organic molecules, releasing oxygen as a byproduct.
references:
  bhowmick2023:
    authors: ["Rana Bhowmick", "Asmit Bhowmick", "Iris D. Young", "Philipp S. Simon", "Margaret D. Doyle", "Junko Yano", "Vittal K. Yachandra"]
    title: "Structural evidence for intermediates during O2 formation in photosystem II"
    publication: "Nature"
    year: 2023
  bhowmick2024:
    authors: ["Rana Bhowmick", "et al."]
    title: "Oxygen-evolving photosystem II structures during S1-S2-S3 transitions"
    publication: "Nature"
    year: 2024
  zhu2008:
    authors: ["Xin-Guang Zhu", "Stephen P. Long", "Donald R. Ort"]
    title: "What is the maximum efficiency with which photosynthesis can convert solar energy into biomass?"
    publication: "Current Opinion in Biotechnology"
    year: 2008
  south2025:
    authors: ["Paul F. South", "et al."]
    title: "Synthetic photorespiratory bypass improves rice productivity"
    publication: "The Plant Cell"
    year: 2025
  engstrom2007:
    authors: ["Gregory S. Engel", "Tessa R. Calhoun", "Elizabeth L. Read", "Tae-Kyu Ahn", "Tomáš Mančal", "Yuan-Chung Cheng", "Robert E. Blankenship", "Graham R. Fleming"]
    title: "Evidence for wavelike energy transfer through quantum coherence in photosynthetic systems"
    publication: "Nature"
    year: 2007
  cao2020:
    authors: ["Jianxin Cao", "et al."]
    title: "Nature does not rely on long-lived electronic quantum coherence for photosynthetic energy transfer"
    publication: "Proceedings of the National Academy of Sciences"
    year: 2020
  lorenz2025:
    authors: ["Lorenzo Lorenz", "et al."]
    title: "Full microscopic simulations uncover persistent quantum effects in primary photosynthesis"
    publication: "Science Advances"
    year: 2025
  orr2024:
    authors: ["Donald R. Ort", "et al."]
    title: "Rubisco is evolving for improved catalytic efficiency and CO2 specificity"
    publication: "Nature Plants"
    year: 2024
  wang2022:
    authors: ["Youzhong Wang", "et al."]
    title: "Molecular basis of plastoquinone reduction in plant cytochrome b6f"
    publication: "Nature Plants"
    year: 2024
  vonhaefen2023:
    authors: ["Henning von Haefen", "et al."]
    title: "Photosynthesis and food security: the evolving story of C4 rice"
    publication: "Photosynthesis Research"
    year: 2023
---


Photosynthesis converts light energy into chemical energy stored in organic molecules. The net reaction is:

**6 CO2 + 6 H2O + light energy -> C6H12O6 + 6 O2**

This reaction takes place in chloroplasts and proceeds in two coupled stages: the light reactions, which capture photon energy and split water, and the Calvin-Benson cycle, which uses that captured energy to fix carbon dioxide into sugar.

## Chloroplast structure and evolutionary origin

Chloroplasts descend from cyanobacteria that were engulfed by an ancestral eukaryotic cell roughly 1.5 billion years ago. This endosymbiotic origin is supported by several lines of evidence: chloroplasts retain their own circular genome, they have double membranes (the inner membrane corresponding to the original cyanobacterial membrane), they replicate by binary fission, and their ribosomal RNA sequences cluster with cyanobacterial sequences in phylogenetic analyses.

The chloroplast genome in land plants typically encodes about 80-100 proteins, roughly 30 transfer RNAs, and 4 ribosomal RNAs. This is a small fraction of the roughly 3,000 proteins that function in the chloroplast. The rest are encoded in the nuclear genome, translated in the cytoplasm, and imported into the chloroplast through translocon complexes (TIC/TOC machinery) in the double membrane. Comparative genomic analyses estimate that over 1,700 genes were transferred from the cyanobacterial ancestor's genome to the host nucleus over evolutionary time.

Inside the chloroplast, the internal membrane system forms flattened sacs called thylakoids. Thylakoids stack into structures called grana (singular: granum), connected by unstacked regions called stroma lamellae. Photosystem II concentrates in the appressed (stacked) grana membranes, while Photosystem I and ATP synthase concentrate in the non-appressed stroma lamellae and grana end membranes, where the bulky stromal domains of these complexes have room to protrude. This spatial separation has consequences for how electron transport is regulated. The fluid-filled space surrounding the thylakoids is the stroma, where the Calvin-Benson cycle operates.

## The light reactions

The light reactions take place in the thylakoid membranes and involve four major protein complexes: Photosystem II (PSII), the cytochrome b6f complex, Photosystem I (PSI), and ATP synthase. Together they execute a chain of electron transfers known as the Z-scheme, so called because when the redox potentials of the intermediates are plotted in sequence, the path traces a shape resembling the letter Z.

### Photosystem II and water splitting

PSII absorbs photons through an antenna system of chlorophyll a, chlorophyll b, and carotenoid molecules. Absorbed energy migrates to the reaction center, where a special pair of chlorophyll a molecules called P680 (named for its absorption peak at 680 nm) undergoes charge separation: it donates an excited electron to pheophytin, becoming the strongest biological oxidant known, with a redox potential of approximately +1.2 V.

This oxidizing power is what makes the thermodynamically demanding splitting of water possible. The oxygen-evolving complex (OEC), a Mn4CaO5 metal cluster located on the lumenal side of PSII, catalyzes the reaction:

**2 H2O -> O2 + 4 H+ + 4 e-**

The OEC cycles through five oxidation states called S-states (S0 through S4), as described by the Kok cycle. Each photon absorbed by P680 advances the OEC by one S-state. After four successive photon-driven oxidation events (S0 -> S1 -> S2 -> S3 -> S4), two water molecules are oxidized and one molecule of O2 is released. The S4 -> S0 transition, in which the O-O bond actually forms, is the fastest step and was long unresolved. Serial femtosecond X-ray crystallography studies published in Nature in 2023 and 2024 captured structural intermediates during the S2 -> S3 and S3 -> S4 transitions, revealing that a substrate water molecule enters through a specific channel (the O1 channel) during the S2 -> S3 transition and that an oxo-oxyl radical coupling mechanism forms the O-O bond during S4.

All oxygen gas in Earth's atmosphere that supports aerobic life is produced by this reaction. Every molecule of O2 you breathe was made by a Mn4CaO5 cluster in a PSII complex.

### Electron transport chain

From PSII, electrons pass through a series of carriers:

1. **Plastoquinone (PQ):** A mobile lipid-soluble carrier in the thylakoid membrane. PQ accepts two electrons and two protons from the stromal side, becoming plastoquinol (PQH2), and diffuses to the cytochrome b6f complex.

2. **Cytochrome b6f:** This complex oxidizes PQH2, releasing protons into the thylakoid lumen (contributing to the proton gradient) and passing electrons to plastocyanin. The b6f complex also runs a Q-cycle that pumps additional protons across the membrane, increasing the proton motive force per electron transferred.

3. **Plastocyanin (PC):** A small copper-containing protein that diffuses through the thylakoid lumen, carrying electrons from cytochrome b6f to PSI.

4. **Photosystem I (PSI):** PSI absorbs photons through its own antenna system and uses the energy to re-energize the electrons arriving from plastocyanin. Its reaction center chlorophyll, P700 (absorption peak at 700 nm), donates an excited electron through a series of iron-sulfur clusters to ferredoxin on the stromal side.

5. **Ferredoxin-NADP+ reductase (FNR):** This enzyme transfers electrons from ferredoxin to NADP+, producing NADPH.

The proton gradient generated by water splitting (which releases H+ into the lumen) and by the Q-cycle of cytochrome b6f drives ATP synthase, which catalyzes the phosphorylation of ADP to ATP as protons flow back across the thylakoid membrane into the stroma.

### Photon budget

Producing one molecule of O2 requires the extraction of four electrons from two water molecules. Each electron requires one photon at PSII and one at PSI (two photon-driven excitation events per electron). Therefore, a minimum of 8 photons are needed to produce one O2 and to generate the NADPH and ATP required to fix one CO2 in the Calvin-Benson cycle. In practice, the requirement is closer to 10-12 photons per CO2 fixed, because of cyclic electron flow around PSI (which generates additional ATP without producing NADPH) and other inefficiencies.

## The Calvin-Benson cycle

The Calvin-Benson cycle operates in the stroma and uses the ATP and NADPH produced by the light reactions to fix CO2 into three-carbon sugars. It proceeds in three phases:

### 1. Carbon fixation

The enzyme ribulose-1,5-bisphosphate carboxylase/oxygenase (RuBisCO) catalyzes the attachment of CO2 to the five-carbon sugar ribulose-1,5-bisphosphate (RuBP), producing two molecules of the three-carbon compound 3-phosphoglycerate (3-PGA).

RuBisCO is the most abundant protein on Earth, with an estimated global mass of approximately 700 million metric tons. This abundance compensates for the enzyme's remarkably slow catalytic rate: RuBisCO fixes only about 2-5 CO2 molecules per second, compared to typical enzyme turnover rates of hundreds or thousands of reactions per second. A 2024 study in Nature Plants analyzing RuBisCO across hundreds of species found evidence that the enzyme is still undergoing natural selection for improved catalytic efficiency, with trade-offs between CO2 specificity and maximum catalytic rate constraining how fast evolution can improve it.

### 2. Reduction

ATP and NADPH from the light reactions are used to convert 3-PGA into glyceraldehyde-3-phosphate (G3P), a three-carbon sugar phosphate. This is the actual step where light energy is stored in the chemical bonds of an organic molecule.

### 3. Regeneration

Most of the G3P molecules are used to regenerate RuBP so the cycle can continue. For every three CO2 molecules fixed (producing six G3P), five G3P are recycled to regenerate three RuBP, and one G3P represents the net gain — the fixed carbon that the plant can use to build glucose, starch, cellulose, amino acids, and lipids.

### Stoichiometry

Fixing three molecules of CO2 (one full turn of the cycle for net carbon gain) requires 9 ATP and 6 NADPH. Per CO2 fixed: 3 ATP and 2 NADPH.

## The photorespiration problem and C4/CAM solutions

### Photorespiration

RuBisCO's active site cannot perfectly distinguish CO2 from O2. When O2 binds to RuBP instead of CO2, the result is one molecule of 3-PGA and one molecule of 2-phosphoglycolate, a two-carbon compound that the plant must salvage through an energy-expensive pathway called photorespiration. Photorespiration consumes ATP and releases already-fixed CO2, wasting energy. In C3 plants at 25 degrees C in current atmospheric conditions, photorespiration reduces photosynthetic efficiency by roughly 20-30%.

Photorespiration increases with temperature because RuBisCO's oxygenase activity increases faster than its carboxylase activity as temperature rises, and because the solubility of CO2 in water decreases more steeply than that of O2 at higher temperatures. This makes photorespiration a particularly significant problem for crops growing in hot climates.

### C4 photosynthesis

C4 plants (including maize, sugarcane, sorghum, and many tropical grasses) suppress photorespiration by concentrating CO2 around RuBisCO. They do this using a two-step spatial separation:

1. In mesophyll cells, the enzyme PEP carboxylase (which has no oxygenase activity and a high affinity for CO2) fixes CO2 into the four-carbon compound oxaloacetate, which is converted to malate or aspartate.

2. These four-carbon acids are transported to bundle sheath cells, which are tightly packed around the vascular tissue in a distinctive arrangement called Kranz anatomy. There, the four-carbon acid is decarboxylated, releasing CO2 at concentrations up to 10 times higher than atmospheric levels. RuBisCO in the bundle sheath cells fixes this concentrated CO2 through the normal Calvin-Benson cycle with minimal oxygenase activity.

C4 photosynthesis has evolved independently at least 66 times across flowering plant lineages. C4 plants have higher photosynthetic rates than C3 plants in hot, high-light environments, and they use roughly 50-70% less water per unit of carbon fixed because they can operate with partially closed stomata (the CO2-concentrating mechanism compensates for lower stomatal conductance).

### CAM photosynthesis

Crassulacean acid metabolism (CAM) plants (including cacti, agaves, pineapple, and many epiphytic orchids) solve the same problem with a temporal rather than spatial separation. They open their stomata at night, when temperatures are lower and humidity is higher, and fix CO2 into malic acid using PEP carboxylase. The malic acid is stored in large vacuoles. During the day, stomata close to conserve water, and the stored malic acid is decarboxylated, releasing CO2 for fixation by RuBisCO in the Calvin-Benson cycle.

CAM plants achieve extraordinary water use efficiency — up to 10 times that of C3 plants — but at the cost of slower growth rates, because the amount of CO2 they can fix is limited by the storage capacity of their vacuoles.

## Stomatal regulation

Stomata are pores on leaf surfaces, each bounded by two specialized guard cells, that control gas exchange. When stomata open, CO2 enters the leaf for photosynthesis, but water vapor escapes (transpiration). Plants lose roughly 200-400 molecules of water for every molecule of CO2 they fix. This ratio is called the transpiration ratio, and minimizing it while maintaining carbon gain is a central challenge of plant physiology.

Guard cells open stomata by accumulating potassium ions (K+), chloride ions (Cl-), and malate, which lowers their water potential and causes water to enter by osmosis, swelling the cells and pulling the pore open. Closure involves the reverse: the hormone abscisic acid (ABA), produced under drought stress, triggers calcium signaling cascades that activate anion channels (including the SLAC1 channel, whose structure was resolved by cryo-EM in 2022) and deactivate inward K+ channels, causing ion efflux and guard cell deflation.

Blue light directly stimulates stomatal opening through the phototropin receptor kinases phot1 and phot2, which activate plasma membrane H+-ATPases. This proton pumping hyperpolarizes the guard cell membrane, driving K+ uptake. Red light opens stomata indirectly, by driving photosynthesis in the guard cell chloroplasts and in the mesophyll (which lowers intercellular CO2 concentration, a signal for stomatal opening). A 2017 study in Nature Communications demonstrated that blue light and CO2 signals converge on the same signaling pathway through the kinase HT1 (HIGH LEAF TEMPERATURE 1), providing a molecular mechanism for how plants integrate light and carbon status to regulate stomatal aperture.

## Photosynthetic efficiency

The theoretical maximum efficiency with which photosynthesis can convert total incident solar radiation into biomass energy is approximately 4.6% for C3 plants and 6.0% for C4 plants. These ceilings account for losses at each step: about 47% of solar radiation falls outside the photosynthetically active wavelength range (400-700 nm), roughly 30% of absorbed light energy is lost as heat during the two photosystem excitations, and additional losses occur from photorespiration (in C3 plants), respiration for maintenance, and incomplete light absorption.

In practice, the best-performing crops achieve roughly 1-2% conversion efficiency over a growing season. The global average for croplands is well below 1%. The gap between theoretical and actual efficiency represents one of the largest opportunities in agricultural science.

## Contemporary research

### Engineering photorespiratory bypasses

The RIPE (Realizing Increased Photosynthetic Efficiency) project at the University of Illinois has demonstrated that engineering alternative photorespiratory pathways into crop plants can increase yields. A 2025 study in The Plant Cell showed that introducing a synthetic glycolate-malate shuttle (GMS) bypass into rice chloroplasts increased biomass and grain yield under field conditions. A separate 2024 RIPE study demonstrated a similar photorespiratory bypass in potato that increased tuber mass. These bypasses work by recycling the glycolate produced by RuBisCO's oxygenase reaction within the chloroplast, recovering the carbon as CO2 and avoiding the energetically expensive peroxisomal and mitochondrial steps of normal photorespiration.

### The C4 Rice Project

The international C4 Rice Project, funded through multiple phases (currently Phase IV, funded through the Max Planck Institute and partner institutions), aims to engineer C4 photosynthesis into rice, a C3 crop that feeds more than half the world's population. This requires introducing Kranz-like anatomy into rice leaves and expressing the C4 biochemical cycle. The project has identified many of the genetic regulators controlling bundle sheath cell development and vein spacing, but engineering the full anatomical and biochemical C4 pathway into a C3 plant remains one of the most ambitious goals in plant synthetic biology. A 2023 review in Photosynthesis Research noted that while the C4 biochemistry can be partially reconstituted in rice, achieving the necessary leaf anatomical changes has proven more difficult.

### Quantum effects in photosynthetic energy transfer

In 2007, Graham Fleming's lab at UC Berkeley reported long-lived quantum coherence in the energy transfer dynamics of the Fenna-Matthews-Olson (FMO) photosynthetic antenna complex from green sulfur bacteria, measured at 77 K using two-dimensional electronic spectroscopy (published in Nature). This sparked a decade of debate about whether quantum mechanical wave-like effects play a functional role in making photosynthetic energy transfer efficient.

Subsequent work showed that the long-lived coherences observed at cryogenic temperatures largely vanish at physiological temperatures and that much of the coherent signal arises from vibrational (nuclear) rather than electronic quantum states. A 2017 study in PNAS concluded that "nature does not rely on long-lived electronic quantum coherence" for photosynthetic function.

However, the question is more nuanced than a simple yes or no. A 2025 study in Science Advances used full microscopic quantum simulations (without the approximations of earlier models) and found that while long-lived electronic coherence does not persist, short-lived quantum effects during the initial energy transfer steps (on femtosecond timescales) do influence the pathways energy takes through antenna complexes. The current consensus is that photosynthetic energy transfer operates in an intermediate regime — neither fully quantum-coherent nor fully classical — where the interaction between electronic states and the protein-solvent vibrational environment produces highly efficient directional energy flow. The protein scaffold appears tuned to exploit this intermediate regime, but the efficiency gain attributable to quantum effects specifically (as opposed to the classical energy-transfer mechanisms that operate alongside them) remains a subject of active research.

### Artificial photosynthesis

Efforts to build artificial systems that mimic photosynthetic water splitting and CO2 reduction have intensified. As of 2025, artificial photosynthetic systems can split water using semiconductor photoelectrodes with solar-to-hydrogen efficiencies exceeding 10%, and can reduce CO2 to carbon monoxide, formate, or simple hydrocarbons using molecular catalysts or engineered microbial systems. The main challenges remain catalyst durability, cost, and scaling. The biological OEC remains the benchmark for water-oxidation catalysis under mild conditions: it operates in water at ambient temperature and neutral pH, using earth-abundant manganese and calcium rather than precious metals.

## Evolutionary history

Anoxygenic photosynthesis — using reductants other than water (such as hydrogen sulfide, ferrous iron, or hydrogen gas) as electron donors — evolved first, likely before 3.5 billion years ago. These early photosynthetic organisms (ancestors of modern green sulfur bacteria, purple bacteria, and heliobacteria) used a single photosystem and did not produce oxygen.

Oxygenic photosynthesis, which uses two linked photosystems and can oxidize water, evolved in cyanobacteria. Geochemical evidence suggests this capability existed by at least 3.0 billion years ago, roughly 600 million years before its atmospheric effects became unmistakable. The Great Oxidation Event (GOE), beginning approximately 2.4 billion years ago, marks the point at which oxygen produced by cyanobacterial photosynthesis began accumulating in Earth's atmosphere after overwhelming the planet's oxygen sinks (primarily dissolved ferrous iron in the oceans and reduced volcanic gases). Banded iron formations — layered sedimentary rocks in which alternating iron oxide-rich and iron oxide-poor bands record the episodic oxidation of dissolved iron — provide direct geological evidence of this transition. Before the GOE, Earth's atmosphere contained less than 0.001% oxygen. After it, atmospheric oxygen rose to at least 1-10% of present levels, fundamentally restructuring the planet's chemistry and enabling the evolution of aerobic metabolism and, eventually, complex multicellular life.

## Related concepts

- [Stomata](./stomata.md) — pores that regulate gas exchange during photosynthesis
- [Homeostasis](../../terms/homeostasis.md) — dynamic maintenance of internal conditions
- [Niche Construction](../../../../../../content/text/glossary/terms/niche-construction.md) — organisms shaping the conditions of life for others
