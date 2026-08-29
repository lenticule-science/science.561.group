---
title: "Plant Signaling: Molecular Mechanisms"
date-created: 2026-03-28T00:00:00
type: reference
aliases:
  - Plant Signaling Molecular
  - Plant Defense Signaling
  - Plant Hormone Signaling
keywords:
  - Botany
  - PlantScience
  - MolecularBiology
  - Phytohormones
  - PlantDefense
  - Signaling
description: >
  Technical reference on the molecular mechanisms of plant signaling,
  covering phytohormones, volatile compounds, electrical signals,
  systemic acquired resistance, root self/non-self recognition,
  defense priming, and recent advances (2020-2026).
---

# Plant Signaling: Molecular Mechanisms

This file covers the biochemistry and molecular biology of plant signaling systems. For the ecological and relational framing, see [plant-signaling.md](./plant-signaling.md).

---

## 1. Phytohormone Signaling

Plants use at least nine major classes of hormone. Each is synthesized through specific enzymatic pathways, perceived by identified receptor proteins, and transduced through defined signaling cascades.

### 1.1 Auxin (Indole-3-Acetic Acid, IAA)

**Function.** Cell elongation, apical dominance, tropisms (photo- and gravitropism), vascular differentiation, lateral root initiation, embryo patterning.

**Biosynthesis.** Primarily via the TAA/YUC (tryptophan aminotransferase / YUCCA flavin monooxygenase) pathway, converting tryptophan to indole-3-pyruvic acid (IPA) and then to IAA. The TAA1 gene encodes the aminotransferase; the YUC gene family (YUC1-YUC11 in Arabidopsis) encodes the monooxygenases. Earlier proposed pathways (indole-3-acetonitrile, tryptamine, indole-3-acetamide) are considered minor or species-specific.

**Perception and signaling.** The receptor is TIR1/AFB (TRANSPORT INHIBITOR RESPONSE 1 / AUXIN SIGNALING F-BOX), an F-box protein that forms part of the SCF^TIR1/AFB ubiquitin ligase complex. When auxin binds, TIR1/AFB interacts with Aux/IAA transcriptional repressor proteins, targeting them for ubiquitin-mediated proteasomal degradation. This releases ARF (AUXIN RESPONSE FACTOR) transcription factors, which then activate auxin-responsive genes. Key papers: Dharmasiri et al. (2005) *Nature* 435:441-445; Kepinski & Leyser (2005) *Nature* 435:446-451.

**Transport.** Polar auxin transport is mediated by PIN-FORMED (PIN) efflux carriers and AUX1/LAX influx carriers. ABCB/PGP transporters also contribute. The directionality of PIN protein localization on the plasma membrane determines the direction of auxin flow through tissues.

### 1.2 Cytokinins (CKs)

**Function.** Cell division, shoot initiation, delay of senescence, chloroplast development, nutrient mobilization.

**Biosynthesis.** The rate-limiting step is catalyzed by isopentenyltransferase (IPT) enzymes, which transfer an isopentenyl group from dimethylallyl diphosphate (DMAPP) to adenine nucleotides. CYP735A cytochrome P450 enzymes convert isopentenyladenine (iP)-type cytokinins to trans-zeatin (tZ)-type. LONELY GUY (LOG) phosphoribohydrolases convert inactive cytokinin nucleotides to bioactive free bases.

**Perception and signaling.** A two-component phosphorelay system: membrane-localized histidine kinases (AHK2, AHK3, AHK4/CRE1/WOL in Arabidopsis) autophosphorylate upon cytokinin binding, transfer the phosphoryl group to histidine phosphotransfer proteins (AHPs), which shuttle to the nucleus and activate type-B ARR (ARABIDOPSIS RESPONSE REGULATOR) transcription factors. Type-A ARRs act as negative regulators. Inoue et al. (2001) *Nature* 409:1060-1063.

### 1.3 Gibberellins (GAs)

**Function.** Stem elongation, seed germination, flowering induction, fruit development, mobilization of seed storage reserves (alpha-amylase induction in cereal aleurone).

**Biosynthesis.** Terpenoid pathway: geranylgeranyl diphosphate (GGDP) → ent-copalyl diphosphate (via ent-CPS) → ent-kaurene (via ent-KS) → ent-kaurenoic acid (via CYP701A) → GA12 (via CYP88A) → bioactive GAs (GA1, GA3, GA4) via GA 20-oxidases and GA 3-oxidases. GA 2-oxidases catalyze deactivation.

**Perception and signaling.** The receptor is GID1 (GIBBERELLIN INSENSITIVE DWARF 1), a soluble nuclear receptor. GA binding to GID1 promotes interaction with DELLA proteins (growth repressors, named for their conserved N-terminal DELLA domain: GAI, RGA, RGL1-3 in Arabidopsis; SLR1 in rice). The GA-GID1-DELLA complex is recognized by the SCF^SLY1/GID2 ubiquitin ligase, leading to DELLA ubiquitination and proteasomal degradation, thereby releasing growth. Ueguchi-Tanaka et al. (2005) *Nature* 437:693-698.

### 1.4 Ethylene (C₂H₄)

**Function.** Fruit ripening, abscission, senescence, flooding response (aerenchyma formation), defense signaling against necrotrophic pathogens. Interacts with JA pathway synergistically for defense against necrotrophs.

**Biosynthesis.** Yang cycle: methionine → S-adenosylmethionine (SAM, via SAM synthetase) → 1-aminocyclopropane-1-carboxylic acid (ACC, via ACC synthase / ACS) → ethylene (via ACC oxidase / ACO). ACS is the rate-limiting enzyme and is encoded by a multigene family regulated at both transcriptional and post-translational levels (phosphorylation by MPK3/MPK6 stabilizes certain ACS isoforms). ACC can also be conjugated to malonyl-ACC or gamma-glutamyl-ACC for storage/inactivation.

**Perception and signaling.** Unique among plant hormones: receptors are negative regulators. The ethylene receptors are a family of ER membrane-localized histidine kinase-like proteins: ETR1, ETR2, ERS1, ERS2, EIN4 in Arabidopsis. They require a copper cofactor (delivered by the RAN1 copper transporter) for ethylene binding. Without ethylene, receptors activate CTR1 (CONSTITUTIVE TRIPLE RESPONSE 1), a Raf-like MAP kinase kinase kinase, which phosphorylates and inactivates EIN2 (ETHYLENE INSENSITIVE 2), an ER-membrane protein. When ethylene binds, receptor activity ceases, CTR1 is inactivated, EIN2's C-terminal domain is cleaved and translocated to the nucleus, where it stabilizes EIN3/EIL1 transcription factors (by suppressing their ubiquitination by the SCF^EBF1/EBF2 complex). EIN3/EIL1 then activate ethylene-responsive genes including ERF (ETHYLENE RESPONSE FACTOR) transcription factors. Chang et al. (1993) *Science* 262:539-544; Alonso et al. (1999) *Science* 284:2148-2152.

### 1.5 Abscisic Acid (ABA)

**Function.** Stomatal closure, seed dormancy, stress tolerance (drought, salinity, cold), inhibition of growth under water deficit. Major hormone of abiotic stress response.

**Biosynthesis.** Indirect pathway via carotenoid cleavage: zeaxanthin → violaxanthin (via zeaxanthin epoxidase, ZEP/ABA1) → neoxanthin → xanthoxin (via 9-cis-epoxycarotenoid dioxygenase, NCED, the rate-limiting step; NCED3 is the key drought-induced isoform in Arabidopsis) → abscisic aldehyde (via short-chain dehydrogenase ABA2) → ABA (via abscisic aldehyde oxidase AAO3, with molybdenum cofactor from ABA3). CYP707A cytochrome P450 enzymes catalyze ABA 8'-hydroxylation for catabolism.

**Perception and signaling.** The PYR/PYL/RCAR receptor family (PYRABACTIN RESISTANCE 1 / PYR1-LIKE / REGULATORY COMPONENT OF ABA RECEPTOR), a family of soluble START-domain proteins (14 members in Arabidopsis). ABA binding to PYR/PYL creates a surface that inhibits type 2C protein phosphatases (PP2Cs: ABI1, ABI2, HAB1, PP2CA). In the absence of ABA, PP2Cs dephosphorylate and inactivate SnRK2 kinases (SNF1-RELATED KINASE 2: SnRK2.2, SnRK2.3, SnRK2.6/OST1). When ABA binds PYR/PYL and PP2Cs are inhibited, SnRK2s auto-activate by autophosphorylation and phosphorylate downstream targets: AREB/ABF transcription factors (activating ABA-responsive element-containing genes), SLAC1 anion channel (causing stomatal closure), and KAT1 potassium channel (inhibited, contributing to guard cell depolarization). Ma et al. (2009) *Science* 324:1064-1068; Park et al. (2009) *Science* 324:1068-1071.

### 1.6 Jasmonic Acid (JA) and Jasmonates

**Function.** Defense against herbivorous insects and necrotrophic pathogens, wound response, reproductive development (anther dehiscence, pollen maturation), secondary metabolite production (alkaloids, terpenoids, phenylpropanoids). Central hormone of induced defense.

**Biosynthesis.** Octadecanoid pathway: alpha-linolenic acid (18:3, released from chloroplast membrane galactolipids by phospholipase A / DAD1) → 13-HPOT (13(S)-hydroperoxyoctadecatrienoic acid, via 13-LOX lipoxygenase) → 12,13-EOT (12,13-epoxyoctadecatrienoic acid, via AOS allene oxide synthase) → 12-OPDA (12-oxo-phytodienoic acid, via AOC allene oxide cyclase). 12-OPDA is then transported from the chloroplast to the peroxisome, where OPR3 (OPDA reductase 3) reduces the cyclopentenone ring, followed by three rounds of beta-oxidation to yield (+)-7-iso-JA. The bioactive form is jasmonoyl-isoleucine (JA-Ile), conjugated by JAR1 (JASMONATE RESISTANT 1), a GH3-family amino acid conjugase.

**Perception and signaling.** JA-Ile is perceived by the COI1 (CORONATINE INSENSITIVE 1) receptor, an F-box protein in the SCF^COI1 ubiquitin ligase complex. JA-Ile acts as "molecular glue" bridging COI1 and JAZ (JASMONATE ZIM-DOMAIN) repressor proteins (JAZ1-JAZ13 in Arabidopsis). This leads to JAZ ubiquitination and proteasomal degradation, releasing MYC2 (and MYC3, MYC4) bHLH transcription factors (and other TFs like MYB, ERF, WRKY) to activate JA-responsive gene expression. The JAZ-MYC module is central. JAZ proteins recruit the co-repressor TOPLESS (TPL) via the adaptor protein NINJA (NOVEL INTERACTOR OF JAZ). Thines et al. (2007) *Nature* 448:661-665; Sheard et al. (2010) *Nature* 468:400-405.

**JA-SA antagonism.** JA and SA signaling are generally mutually antagonistic. SA-mediated signaling (via NPR1) suppresses JA-responsive gene expression, and vice versa. This allows plants to prioritize defense: SA pathway for biotrophic pathogens, JA pathway for necrotrophs and herbivores. The antagonism is modulated by GRX480, WRKY transcription factors, and other intermediaries. Pathogens exploit this: *Pseudomonas syringae* produces coronatine (a JA-Ile mimic) to activate JA signaling and suppress SA-mediated defenses.

### 1.7 Salicylic Acid (SA)

**Function.** Defense against biotrophic and hemibiotrophic pathogens, systemic acquired resistance (SAR), hypersensitive response (HR) cell death. Also involved in thermogenesis, flowering.

**Biosynthesis.** Two pathways from chorismate:
1. **Isochorismate synthase (ICS) pathway** — the major route in Arabidopsis (>90% of pathogen-induced SA). ICS1/SID2 (SALICYLIC ACID INDUCTION DEFICIENT 2) converts chorismate to isochorismate in the chloroplast. The subsequent conversion to SA was long debated; the PBS3 (avrPphB SUSCEPTIBLE 3) enzyme conjugates isochorismate with glutamate to form isochorismate-9-glutamate, which spontaneously decomposes to SA. EPS1 (ENHANCED PSEUDOMONAS SUSCEPTIBILITY 1) may accelerate this last step. Rekhter et al. (2019) *Science* 365:498-502; Torrens-Spence et al. (2019) *Science* 365:498-502.
2. **Phenylalanine ammonia lyase (PAL) pathway** — phenylalanine → trans-cinnamic acid → benzoic acid → SA. Contributes more in some species (e.g., rice, tobacco).

**Perception and signaling.** The receptor is NPR1 (NONEXPRESSER OF PR GENES 1), though NPR3 and NPR4 also bind SA and function as SA receptors (with different affinities). In the absence of SA, NPR1 exists as oligomers in the cytoplasm, held together by intermolecular disulfide bonds. SA accumulation triggers cellular redox changes (via thioredoxins TRX-h3, TRX-h5) that reduce these disulfide bonds, releasing NPR1 monomers that translocate to the nucleus. There, NPR1 interacts with TGA transcription factors (bZIP family: TGA1-TGA7) to activate PATHOGENESIS-RELATED (PR) gene expression (PR-1, PR-2, PR-5, etc.). NPR1 is also regulated by ubiquitination (by the CUL3-based E3 ligase involving NPR3/NPR4) and S-nitrosylation. Fu et al. (2012) *Nature* 486:228-232; Ding et al. (2018) *Cell* 173:1215-1227 (showed NPR1 is itself the SA receptor via its C-terminal transactivation domain).

### 1.8 Brassinosteroids (BRs)

**Function.** Cell elongation and division, vascular differentiation, photomorphogenesis, stress tolerance, male fertility. Mutants are severely dwarfed.

**Biosynthesis.** From campesterol, via a series of oxidation steps catalyzed by cytochrome P450 enzymes (CYP90 family): campesterol → campestanol → 6-deoxocastasterone → castasterone → brassinolide (the most bioactive BR). Key enzymes: DWF4 (CYP90B1, rate-limiting 22-alpha-hydroxylase), CPD (CYP90A1), DET2 (5-alpha-reductase), ROT3/CYP90C1, CYP85A1/2, CYP724B1 (in rice).

**Perception and signaling.** BRI1 (BRASSINOSTEROID INSENSITIVE 1), a leucine-rich repeat receptor-like kinase (LRR-RLK) at the plasma membrane, directly binds brassinolide in its extracellular island domain. BR binding promotes BRI1 association with co-receptor BAK1 (BRI1-ASSOCIATED RECEPTOR KINASE 1, also called SERK3). Transphosphorylation between BRI1 and BAK1 activates the kinase cascade. BRI1 phosphorylates BSK1 (BR-SIGNALING KINASE 1) and CDG1, which activate BSU1 phosphatase, which dephosphorylates and inactivates BIN2 (BRASSINOSTEROID INSENSITIVE 2), a GSK3-like kinase. Without active BIN2, the transcription factors BES1 (BRI1-EMS-SUPPRESSOR 1) and BZR1 (BRASSINAZOLE RESISTANT 1) accumulate in their dephosphorylated, active forms in the nucleus, driving BR-responsive gene expression. Wang et al. (2001) *Nature* 410:380-383; She et al. (2011) *Nature* 474:472-476.

### 1.9 Strigolactones (SLs)

**Function.** Inhibition of shoot branching (tillering), promotion of mycorrhizal symbiosis (hyphal branching of arbuscular mycorrhizal fungi), germination stimulant for parasitic plants (*Striga*, *Orobanche*), regulation of root architecture, involvement in phosphate-starvation responses, regulation of leaf senescence.

**Biosynthesis.** From all-trans-beta-carotene: D27 (DWARF 27) isomerase converts all-trans-beta-carotene to 9-cis-beta-carotene → carlactone (via sequential action of CCD7/MAX3 and CCD8/MAX4, carotenoid cleavage dioxygenases) → carlactonoic acid (via MAX1/CYP711A, a cytochrome P450) → further species-specific modifications yield canonical strigolactones (e.g., strigol, orobanchol, 5-deoxystrigol) or non-canonical SLs (e.g., methyl carlactonoic acid).

**Perception and signaling.** The receptor is D14 (DWARF 14) / DAD2, an alpha/beta-hydrolase that both binds and hydrolyzes strigolactones. Hydrolysis produces a covalently linked intermediate (D-ring-derived) that triggers a conformational change in D14, promoting interaction with the F-box protein MAX2/D3 (part of an SCF ubiquitin ligase complex). This complex targets D53/SMXL6/7/8 repressor proteins for ubiquitin-mediated degradation, releasing downstream transcriptional responses (involving BRC1/TCP transcription factors for branching control). Yao et al. (2016) *Nature* 536:469-473. SL signaling is unique in that the receptor irreversibly hydrolyzes its ligand as part of signal transduction.

---

## 2. Volatile Organic Compounds (VOCs) in Plant Communication

### 2.1 Compound Classes Released Upon Herbivore Damage

Plants emit complex blends of volatiles upon herbivore attack. These herbivore-induced plant volatiles (HIPVs) include:

**Green leaf volatiles (GLVs).** C6 aldehydes, alcohols, and esters produced via the lipoxygenase (LOX) pathway:
- (Z)-3-Hexenal — the first product, extremely reactive, major "green smell" of cut grass
- (E)-2-Hexenal — isomerized from (Z)-3-hexenal
- (Z)-3-Hexenol — reduced from the aldehyde by alcohol dehydrogenase
- (Z)-3-Hexenyl acetate — ester form
- Pathway: membrane lipids → linolenic acid (by lipase) → 13-HPOT (by 13-LOX) → (Z)-3-hexenal (by HPL, hydroperoxide lyase, CYP74B). GLVs are released within seconds to minutes of wounding.

**Terpenes/terpenoids.** Produced via the MEP (methylerythritol phosphate) pathway in plastids and the MVA (mevalonate) pathway in the cytosol:
- Monoterpenes (C10): linalool, ocimene (both (E)- and (Z)-beta-ocimene), limonene, myrcene. Produced by terpene synthases (TPS).
- Sesquiterpenes (C15): (E)-beta-farnesene, (E,E)-alpha-farnesene, (E)-beta-caryophyllene, (E)-nerolidol. (E)-beta-caryophyllene is also released from roots (attracts entomopathogenic nematodes; Rasmann et al. 2005 *Nature* 434:732-737).
- Homoterpenes: DMNT (4,8-dimethyl-1,3,7-nonatriene, a C11 homoterpene) and TMTT (4,8,12-trimethyltrideca-1,3,7,11-tetraene, a C16 homoterpene) — highly characteristic of herbivore-induced blends. Produced by cytochrome P450 CYP82G1 (in Arabidopsis) from their sesqui-/diterpene precursors.

**Methyl esters of hormones:**
- Methyl jasmonate (MeJA) — volatile derivative of JA, produced by JMT (JA carboxyl methyltransferase)
- Methyl salicylate (MeSA) — volatile derivative of SA, produced by BSMT1 (BENZOIC ACID/SALICYLIC ACID CARBOXYL METHYLTRANSFERASE 1)
- Both can be reconverted to active hormones (JA, SA) by esterases (MJE, MES) in receiving tissues.

**Indole** — derived from the indole-3-glycerol phosphate branch of tryptophan biosynthesis. BX1 (in maize) or IGL (INDOLE-3-GLYCEROL PHOSPHATE LYASE) cleaves indole-3-glycerol phosphate to release free indole. In maize, indole emission is strongly induced by herbivory and primes neighboring plants for enhanced defense. Erb et al. (2015) *eLife* 4:e04490.

### 2.2 Plant-Plant Communication via VOCs

**Key researchers.** The field was pioneered by work from David Rhoades (1983, unpublished but influential), Ian Baldwin & Jack Schultz (1983, *Science* 221:277-279), and significantly advanced by Martin Heil, Richard Karban, André Kessler, Junji Takabayashi, Marcel Dicke, and others.

**Heil & Karban (2010).** "Explaining evolution of plant communication by airborne signals" (*Trends in Ecology & Evolution* 25:137-144). Key arguments: (1) within-plant signaling via VOCs (from damaged to undamaged parts of the same plant) is likely the primary adaptive function — it is faster than vascular transport for large or modular plants; (2) eavesdropping by neighbors may be an unavoidable consequence; (3) kin selection or mutualistic interactions could maintain inter-plant signaling in some cases.

**Karban et al. (2006).** Field demonstration that sagebrush (*Artemisia tridentata*) VOCs reduced herbivore damage on neighboring wild tobacco (*Nicotiana attenuata*) under natural conditions. *Ecology* 87:922-930. Karban's group showed that communication was strongest between closely related (genetically similar) sagebrush individuals (Karban & Shiojiri 2009, *Ecology Letters* 12:502-506).

**Field vs. lab conditions:**
- **Confirmed in field conditions:** Sagebrush → wild tobacco priming (Karban 2001, *Oecologia*; Karban et al. 2006); sagebrush self-signaling (Karban et al. 2006); lima bean field studies (Heil & Silva Bueno 2007, *Journal of Ecology* 95:7-16); poplar leaf-to-leaf within-plant signaling (Frost et al. 2007, *New Phytologist* 174:752-762).
- **Important caveats for field results:** Effect sizes are generally smaller than in lab chambers; airflow, concentration, and distance are critical variables; most field studies show priming (faster/stronger defense induction) rather than direct defense induction.
- **Lab/chamber conditions only or debated:** Many early studies used sealed chambers that create unrealistically high VOC concentrations. The Rhoades and Baldwin & Schultz results were criticized for this. Dicke's work on spider mite-induced VOCs in lima bean was initially lab-based but later validated in field settings.

### 2.3 Mechanisms of VOC Perception

How plants perceive airborne VOCs is incompletely understood. Proposed mechanisms:
- **GLVs** may be perceived through reactive electrophile species (RES) activity — (E)-2-hexenal is an alpha,beta-unsaturated carbonyl that can modify proteins via Michael addition reactions, potentially activating signaling cascades. Farmer & Davoine (2007) *New Phytologist* 176:15-19.
- **MeJA and MeSA** are reconverted to JA and SA by esterases upon entering receiving plant cells, entering standard hormone signaling pathways.
- **Recent work** has identified TOPLESS-related proteins and changes in histone acetylation as downstream responses to VOC exposure.

---

## 3. Electrical Signaling in Plants

### 3.1 Types of Electrical Signals

Plants propagate at least three types of long-distance electrical signals:

1. **Action potentials (APs).** Self-propagating, all-or-nothing depolarizations that travel at relatively constant speed. Mediated by transient opening of anion channels (Cl⁻ efflux) and Ca²⁺ channels, followed by repolarization via K⁺ efflux and H⁺-ATPase activity. Speeds: typically 1-10 cm/s (up to 40 cm/s in *Dionaea muscipula* trigger hairs). Occur in the phloem sieve tubes and possibly companion cells. Best characterized in *Mimosa pudica* (leaf folding) and *Dionaea muscipula* (trap closure). Fromm & Lautner (2007) *Plant, Cell & Environment* 30:249-257.

2. **Variation potentials (VPs) / slow wave potentials.** Not self-propagating; instead, they are driven by a hydraulic pressure wave (a surge in xylem pressure caused by wounding). Speed decreases with distance from wound site. Characterized by a slow depolarization and very slow repolarization (minutes). Associated with transient inactivation of the plasma membrane H⁺-ATPase. Travel through xylem-associated cells. Speeds: 0.1-1 cm/s. VPs are the dominant wound signal in many species.

3. **System potentials (SPs).** Systemically propagating hyperpolarizations (increased membrane potential), recently described by Zimmermann et al. (2009) *New Phytologist* 183:1132-1143. Apoplastic, travel in the phloem. Driven by activation of H⁺-ATPases. May function in systemic wound signaling.

### 3.2 Glutamate Receptor-Like (GLR) Channels and Wound Signaling

**Mousavi et al. (2013).** "GLUTAMATE RECEPTOR-LIKE genes mediate leaf-to-leaf wound signalling." *Science* 339:1230-1232.

Key findings:
- Wounding of an Arabidopsis leaf triggers electrical signals (surface potential changes) that travel to distant leaves at speeds of approximately 8-9 cm/min (~1.5 mm/s).
- These electrical signals precede and are required for the systemic induction of JASMONATE ZIM-DOMAIN 10 (JAZ10) gene expression in unwounded leaves (a JA-pathway response marker).
- Double mutants in *glr3.3* and *glr3.6* (GLUTAMATE RECEPTOR-LIKE 3.3 and 3.6) showed strongly reduced electrical signal propagation and reduced systemic JA signaling.
- GLR3.3 and GLR3.6 encode ligand-gated cation channels (permeable to Ca²⁺) homologous to animal ionotropic glutamate receptors (iGluRs).
- The proposed model: wounding releases glutamate (or other amino acids) into the apoplast, activating GLR channels, causing Ca²⁺ influx, membrane depolarization, and propagation of the electrical/calcium signal via the phloem.

This paper was pivotal in connecting electrical signaling to defined ion channels and to the JA defense pathway.

### 3.3 Calcium Waves

**Toyota et al. (2018).** "Glutamate triggers long-distance, calcium-based plant defense signaling." *Science* 361:1112-1115.

Key findings:
- Used genetically encoded calcium indicator GCaMP (expressed in Arabidopsis) to visualize cytosolic Ca²⁺ dynamics in real time.
- Wounding triggered Ca²⁺ waves that propagated from damaged to distal leaves through the vasculature at approximately 1 mm/s.
- Exogenous glutamate application at wound sites was sufficient to trigger Ca²⁺ waves.
- *glr3.3 glr3.6* double mutants had severely reduced Ca²⁺ wave propagation.
- Ca²⁺ waves preceded and were required for systemic JA accumulation and JAZ10 expression.
- This provided direct visual evidence for the glutamate → GLR → Ca²⁺ → JA model proposed by Mousavi et al.

**Subsequent work:**
- Shao et al. (2020) showed that TPC1 (TWO PORE CHANNEL 1), a vacuolar Ca²⁺-permeable cation channel, contributes to systemic Ca²⁺ signaling. *Plant Cell* 32:3564-3581.
- Fichman et al. (2021) linked reactive oxygen species (ROS) waves (produced by RBOHD, RESPIRATORY BURST OXIDASE HOMOLOG D) to Ca²⁺ waves, showing that ROS and Ca²⁺ signals propagate interdependently in a "ROS-Ca²⁺ wave" feedback loop. *PNAS* 118:e2016878118.

### 3.4 Speed Comparison

| Signal Type | Speed | Medium |
|---|---|---|
| Action potential | 1-40 cm/s | Phloem (sieve tubes) |
| Variation potential | 0.1-1 cm/s | Xylem-associated cells |
| Ca²⁺ wave (wound) | ~1 mm/s (≈6 cm/min) | Vasculature |
| ROS wave | ~8.4 cm/min | Apoplast (cell-to-cell) |
| Auxin transport | ~1 cm/h | Polar transport through parenchyma |

---

## 4. Systemic Acquired Resistance (SAR)

### 4.1 Overview

SAR is a whole-plant immune response triggered by a local pathogen infection (typically a biotrophic or hemibiotrophic pathogen that induces a hypersensitive response). SAR provides broad-spectrum, long-lasting (weeks to months) resistance against subsequent infections throughout the plant, including in tissues distant from the initial infection site. SAR is SA-dependent and involves the accumulation of PATHOGENESIS-RELATED (PR) proteins (PR-1, beta-1,3-glucanases/PR-2, chitinases/PR-3, thaumatin-like proteins/PR-5).

### 4.2 Mobile SAR Signals

For SAR to occur, a signal must travel from the locally infected leaf (via the phloem) to distal leaves. Multiple mobile signals have been identified, and current understanding suggests they act cooperatively:

**Methyl salicylate (MeSA).** Proposed as a mobile signal by Park et al. (2007) *Science* 318:113-116 (in tobacco). SA is methylated by BSMT1 to the volatile MeSA, which travels via phloem (and possibly air) to distant leaves, where it is converted back to SA by SABP2 (SA-BINDING PROTEIN 2, a methyl esterase). However, MeSA's role as the primary mobile SAR signal has been debated; it may be more important in some species (tobacco, potato) than others (Arabidopsis).

**Azelaic acid (AzA).** A C9 dicarboxylic acid derived from oxidation of C18 unsaturated fatty acids (likely from membrane lipids during the oxidative burst). Identified by Jung et al. (2009) *Science* 324:89-91. AzA accumulates locally and systemically and primes SA biosynthesis in distal tissues. The lipid transfer protein AZI1 (AZELAIC ACID INDUCED 1) is required for AzA-mediated SAR, and AZI1 is plasmodesmata-localized.

**Glycerol-3-phosphate (G3P).** Identified by Chanda et al. (2011) *Science* 334:1266-1268. G3P levels increase in local and systemic leaves. GLY1 (G3P dehydrogenase) and SFD1/GLY1 are required for SAR. G3P works with DIR1 (DEFECTIVE IN INDUCED RESISTANCE 1), a lipid transfer protein that facilitates movement of a lipid signal through the phloem. G3P and AzA appear to work in the same pathway.

**Dehydroabietinal (DA).** A diterpene identified by Chaturvedi et al. (2012) *Plant Cell* 24:3159-3179 as a potent SAR inducer at very low (nanomolar) concentrations. Its exact mechanism and phloem mobility remain under investigation.

**Pipecolic acid (Pip) and N-hydroxypipecolic acid (NHP).** The most significant recent advance in SAR signaling.

- **Pipecolic acid.** An L-lysine-derived, non-proteinogenic amino acid. Navarova et al. (2012) *Plant Cell* 24:5123-5141 showed that Pip accumulates in locally infected and systemic leaves, is required for SAR, and amplifies SA signaling. Pip is synthesized from L-lysine by ALD1 (AGD2-LIKE DEFENSE RESPONSE PROTEIN 1, an aminotransferase) producing dehydropipecolic acid, which is reduced to Pip by SARD4 (SAR DEFICIENT 4, a reductase).

- **N-hydroxypipecolic acid (NHP).** Hartmann et al. (2018) *Cell* 173:456-469. NHP is the bioactive derivative of Pip, produced by the flavin-dependent monooxygenase FMO1 (FLAVIN-DEPENDENT MONOOXYGENASE 1). FMO1 N-hydroxylates Pip to NHP. Key findings:
  - *fmo1* mutants accumulate Pip but cannot make NHP and are completely SAR-deficient.
  - Exogenous NHP application fully restores SAR in *fmo1* mutants.
  - NHP is a bona fide mobile signal: it accumulates in petiole exudates of infected leaves.
  - NHP is both necessary and sufficient for SAR induction.
  - NHP triggers SA accumulation and PR gene expression in a dose-dependent manner.
  - NHP can be glycosylated to NHP-OGlc (by UGT76B1) for storage/inactivation; Holmes et al. (2021) *Cell Host & Microbe* 29:1277-1286.

- **Chen et al. (2018).** *Cell* 173:1468-1479. Independently confirmed NHP as critical for SAR in Arabidopsis, showing that NHP induces transcriptional reprogramming and SA-independent defense gene expression.

### 4.3 SAR Signaling Model (Current)

1. Local pathogen infection triggers SA accumulation and the hypersensitive response.
2. L-lysine is converted to Pip (by ALD1 and SARD4) and then to NHP (by FMO1).
3. NHP (and potentially MeSA, AzA, G3P/DIR1) moves through the phloem to systemic leaves.
4. In systemic leaves, NHP amplifies SA biosynthesis via ICS1 and activates NPR1-dependent defense gene expression.
5. NHP also activates FMO1 expression systemically, creating a positive feedback loop (NHP → FMO1 → more NHP).
6. PR proteins and other defense compounds accumulate throughout the plant, conferring broad-spectrum resistance.

---

## 5. Root Signaling and Self/Non-Self Recognition

### 5.1 Root Self-Recognition

Plants can distinguish their own roots from roots of other individuals, both conspecific and heterospecific. This is observed as altered root growth patterns: roots growing near "self" roots tend to reduce growth or branching (avoiding competition with self), while roots near "non-self" roots may increase growth or alter architecture to compete for resources.

**Root-self inhibition.** In split-root experiments (pioneered by Mahall & Callaway 1991, 1996 in *Ambrosia dumosa*), a plant's own roots inhibit each other's growth less than the roots of strangers. Mechanism likely involves secreted chemical signals in the rhizosphere or physical contact signals.

### 5.2 Kin Recognition

**Susan Dudley's work.** Dudley & File (2007) *Biology Letters* 3:435-438. Working with *Cakile edentula* (American sea rocket, Brassicaceae — note: not *Canna glabra*, which has sometimes been misattributed), they showed that plants grown with siblings allocated less biomass to roots than plants grown with strangers, suggesting reduced competitive effort among kin. This was a landmark paper in plant kin recognition.

**Subsequent studies:**
- Dudley's group extended this to other species and showed that kin recognition can affect root exudate profiles, allelopathic compound production, and above-ground traits.
- Biedrzycki et al. (2010) *Communicative & Integrative Biology* 3:28-31, proposed that root exudates (secreted chemicals) mediate kin recognition, possibly involving species-specific chemical profiles.
- Crepy & Casal (2015) *New Phytologist* 205:329-338, showed that *Arabidopsis* can distinguish kin from non-kin via above-ground light signaling (red/far-red ratio changes), not only through roots.
- Semchenko et al. (2014) *Proceedings of the Royal Society B* 281:20131466, showed kin recognition in *Deschampsia caespitosa* (tufted hair-grass) and linked it to root exudate profiles.

**Work in *Impatiens pallida*:** (sometimes cited in the context of kin recognition) Murphy & Dudley (2009) *American Journal of Botany* 96:1990-1996, found kin recognition effects on biomass allocation in *Impatiens pallida*.

### 5.3 Mechanisms of Self/Non-Self and Kin Recognition

The molecular mechanisms are still not fully resolved. Proposed mechanisms include:

- **Root exudate chemical profiles.** Roots secrete complex mixtures of organic acids, amino acids, sugars, flavonoids, strigolactones, and other secondary metabolites. The specific composition may encode identity information. Strigolactones in root exudates stimulate AM fungal hyphal branching and are recognized by parasitic plants.
- **Receptor-based recognition.** By analogy with pollen self-incompatibility (S-locus), some have proposed that root cells may express polymorphic receptor-ligand pairs that allow self-recognition. No specific receptor has been conclusively identified for root self/non-self recognition.
- **Allele-specific volatile or exudate signals.** Genetic variation at multiple loci could produce kin-specific exudate blends.
- **MHC-like systems.** Speculative, but some authors have drawn parallels to animal immune self-recognition.
- **Cell wall contact.** Physical contact between root tips may elicit recognition responses; root cap cells and border cells secrete mucilage with specific chemical signatures.

### 5.4 Allelopathy

Related to self/non-self root interactions, plants secrete allelopathic compounds that inhibit the growth of competitors:
- Juglone (5-hydroxy-1,4-naphthoquinone) from black walnut (*Juglans nigra*)
- (-)-Catechin from spotted knapweed (*Centaurea stoebe*) — though the importance of this has been debated (Blair et al. 2006)
- Benzoxazinoids (DIMBOA, DIBOA) from grasses (wheat, maize, rye)
- Sorgoleone from sorghum (*Sorghum bicolor*) root hairs

---

## 6. Defense Priming

### 6.1 Concept

Defense priming is a state in which a plant, after exposure to a priming stimulus (a low dose of pathogen, herbivore attack, certain chemicals, or VOCs), shows faster, stronger, and/or more sustained activation of defense responses upon subsequent ("challenge") attack. Priming is distinguished from direct defense induction: a primed plant does not constitutively express defense genes at high levels but rather responds more efficiently when attacked.

Priming is ecologically advantageous because constitutive defense expression is metabolically costly, while priming imposes minimal costs in the absence of attack but provides substantial benefit when attack occurs. Van Hulten et al. (2006) *Plant Cell* 18:3132-3147 demonstrated that the fitness cost of priming (by BABA treatment) was much lower than that of constitutive defense activation.

### 6.2 Priming Agents

- **Beta-aminobutyric acid (BABA).** A non-protein amino acid that primes SA-dependent and ABA-dependent defenses. Its receptor was identified as IBI1 (IMPAIRED IN BABA-INDUCED IMMUNITY 1), an aspartyl-tRNA synthetase: BABA binds to IBI1 as a non-canonical amino acid, and the resulting accumulation of uncharged tRNAs activates defense signaling. Luna et al. (2014) *Nature Chemical Biology* 10:450-456.
- **Methyl jasmonate (MeJA).** VOC that primes JA-dependent defenses.
- **Hexanoic acid.** Primes JA and SA pathways.
- **(Z)-3-Hexenol and other GLVs.** Engelberth et al. (2004) *PNAS* 101:1781-1785, showed that GLV exposure primes maize for enhanced JA and terpene production upon caterpillar attack.
- **Benzothiadiazole (BTH / Acibenzolar-S-methyl).** Commercial SA analog that primes SAR.
- **Azelaic acid, pipecolic acid, NHP.** SAR signals that also act as priming agents for systemic tissues.

### 6.3 Molecular Mechanisms of Priming

**Inactive MAP kinases and transcription factors.** Beckers et al. (2009) *Plant Cell* 21:944-953 showed that priming (by BTH) involves accumulation of inactive MPK3 and MPK6 proteins. Upon pathogen challenge, these pre-accumulated kinases are rapidly phosphorylated and activated, providing a faster signal transduction response. Similarly, WRKY transcription factors (WRKY6, WRKY29, WRKY53) accumulate in a primed but inactive state.

**Chromatin modifications (epigenetic priming).** Jaskiewicz et al. (2011) *Plant Cell* 23:4171-4187 demonstrated that priming is associated with changes in histone modifications at defense gene promoters:
- Trimethylation of histone H3 at lysine 4 (H3K4me3) — a mark of active or poised transcription — is enriched at WRKY gene promoters in primed plants.
- Acetylation of histone H3 (H3K9ac, H3K14ac) is also increased.
- These chromatin modifications persist for days and facilitate more rapid transcriptional activation upon challenge.

**DNA methylation.** Changes in cytosine methylation at defense gene loci have been observed following priming. Hypomethylation of defense gene promoters can increase their transcriptional responsiveness.

### 6.4 Transgenerational Priming

Plants can transmit a primed defense state to their offspring — without changes in DNA sequence — via epigenetic inheritance.

**Luna et al. (2012).** *Plant Physiology* 158:844-853. Showed that Arabidopsis plants infected with *Pseudomonas syringae* pv. tomato DC3000 produced offspring with enhanced resistance to the same and related pathogens. The progeny showed primed SA-dependent defense gene expression.

**Rasmann et al. (2012).** *eLife* 1:e00183. Showed transgenerational priming for herbivore resistance in Arabidopsis and tomato. Caterpillar-damaged Arabidopsis parents produced offspring with higher JA-dependent defenses.

**Slaughter et al. (2012).** *Plant Physiology* 158:854-863. BABA-treated Arabidopsis parents produced offspring with enhanced resistance and primed defense gene expression for one generation.

**Mechanisms of transgenerational priming:**
- **DNA methylation changes.** Heritable changes in CG, CHG, and CHH methylation at defense loci, maintained by DNA methyltransferases (MET1, CMT3, DRM2) and potentially destabilized by demethylases (ROS1, DME). *drm1 drm2 cmt3* mutants show constitutively elevated SA-dependent defenses, suggesting that removal of non-CG methylation can de-repress defense genes.
- **Small RNA pathways.** Changes in siRNA populations (especially 24-nt siRNAs produced by the RdDM/RNA-directed DNA methylation pathway: RNA Pol IV → RDR2 → DCL3 → AGO4) can direct DNA methylation changes to specific loci, heritably altering their expression.
- **Histone modifications.** Less understood in terms of transgenerational transmission in plants, but H3K27me3 (deposited by Polycomb Repressive Complex 2, PRC2) and H3K4me3 (deposited by COMPASS-like complexes) are candidates.

---

## 7. Recent Advances (2020-2026)

### 7.1 Cell-Type Resolution of Plant Immunity (Single-Cell Transcriptomics)

- Farmer et al. (2021) and several groups have applied single-cell RNA sequencing (scRNA-seq) to plant immune responses, revealing that different cell types within a leaf (mesophyll, bundle sheath, epidermis, vasculature) mount distinct transcriptional programs in response to pathogens and wounds. This challenges the view of a uniform "leaf" response.
- Rich-Griffin et al. (2020) *Nature Plants* 6:1419-1434 applied scRNA-seq to Arabidopsis roots infected with *Ralstonia solanacearum*, showing cell-type-specific immune responses.

### 7.2 Peptide Signaling in Plant Immunity

- **SCOOP (SERINE-RICH ENDOGENOUS PEPTIDE) peptides.** Gully et al. (2019) and subsequent work identified propeptides processed into mature signaling peptides that activate immune responses through the receptor MIK2 (MDIS1-INTERACTING RECEPTOR LIKE KINASE 2). Rhodes et al. (2021) *Plant Cell* 33:2855-2872.
- **PEP (PLANT ELICITOR PEPTIDE) signaling.** The Pep1-PEPR1/PEPR2 system (endogenous damage-associated molecular patterns, DAMPs): PROPEP propeptides are processed to release Pep peptides upon wounding or pathogen attack, which bind LRR-RLK receptors PEPR1/PEPR2 to amplify immune signaling. Extensively studied 2020-2025.
- **Phytocytokine concept.** Gust et al. and others have proposed "phytocytokines" as endogenous peptide signals analogous to animal cytokines, including PEPs, RALFs (RAPID ALKALINIZATION FACTORs), PIPs (PAMP-INDUCED PEPTIDES), and others. Reviewed by Rzemieniewski & Stegmann (2022) *New Phytologist* 235:1700-1716.

### 7.3 Pattern-Triggered Immunity (PTI) Molecular Details

- The PRR (pattern recognition receptor) co-receptor BAK1/SERK3 was shown to be central to multiple immune pathways: FLS2 (flagellin receptor), EFR (EF-Tu receptor), PEPR1, LORE, and others all recruit BAK1 as co-receptor.
- **RBOHD-mediated ROS burst.** Kadota et al. showed that RBOHD (NADPH oxidase producing apoplastic ROS) is phosphorylated by BIK1 (BOTRYTIS-INDUCED KINASE 1) upon immune activation. RBOHD-produced ROS are now understood as both local antimicrobial agents and long-distance systemic signals (ROS waves; Fichman & Mittler 2020, *Trends in Plant Science* 25:1104-1113).

### 7.4 Calcium Channel Identification

- Beyond GLR3.3/3.6, the **CNGC (CYCLIC NUCLEOTIDE-GATED CHANNEL)** family has been implicated in immune calcium signaling. CNGC2 and CNGC4 form a channel complex important for pathogen-triggered Ca²⁺ influx and hypersensitive response (Tian et al. 2019, *Cell Reports* 27:7-17).
- **OSCA1.3.** Yuan et al. (2021) *Nature* 592:768-772, identified OSCA1.3 as a BIK1-phosphorylated calcium-permeable channel required for stomatal closure during immune responses. This was a major finding linking kinase signaling to defined calcium channels in immunity.

### 7.5 NLR Resistosome Structure

- ZAR1 (HOPZ-ACTIVATED RESISTANCE 1), a CC-NLR (coiled-coil nucleotide-binding leucine-rich repeat) immune receptor, was crystallized in its activated pentameric form — the "resistosome." Wang et al. (2019) *Science* 364:eaav5870. The ZAR1 resistosome inserts into the plasma membrane and forms a calcium-permeable channel, directly linking NLR activation to Ca²⁺ influx and cell death. Bi et al. (2021) *Nature* 592:110-115 showed ZAR1 resistosome functions as a Ca²⁺ channel.
- This resolved a long-standing question about how intracellular NLR receptors trigger cell death and defense signaling — they form membrane pores.
- TIR-NLR (Toll/Interleukin-1 receptor domain NLRs) were shown to have NADase (NAD⁺ hydrolase) activity: activated TIR domains cleave NAD⁺ to produce signaling molecules (including cyclic ADP-ribose variants). Wan et al. (2019) *Science* 365:793-799; Horsefield et al. (2019) *Science* 365:793-799.

### 7.6 Lipid Signaling and Cuticle Perception

- Recent work has highlighted the role of cutin monomers and free fatty acids as signals. Damage to the cuticle (by pathogens or mechanical wounding) releases cutin monomers that are perceived by plant cells as damage signals. This connects wounding perception to lipid metabolism.

### 7.7 Systemic ROS and Ca²⁺ Waves — Integration

- Fichman & Mittler (2020-2023) have elaborated the systemic signaling network, showing that ROS, Ca²⁺, electrical signals, and hormones (JA, SA) form an interconnected rapid signaling system. RBOHD-produced ROS propagate cell-to-cell at ~8.4 cm/min and activate Ca²⁺ channels; Ca²⁺ in turn activates RBOHD (via CDPKs/CPKs — calcium-dependent protein kinases), creating a self-propagating wave. Zandalinas et al. (2020) *The Plant Cell* 32:3474-3490.

### 7.8 Advances in Strigolactone and Karrikin Signaling

- The karrikin signaling pathway (KAR/KAI2 pathway), mediated by the alpha/beta-hydrolase receptor KAI2 (KARRIKIN INSENSITIVE 2) and the F-box protein MAX2, has been recognized as an ancient paralog of the strigolactone pathway. The endogenous KAI2 ligand (KL, karrikin ligand) is still unidentified as of 2026. Flematti et al. and Waters et al. have driven this field.
- Strigolactone/KAR signaling convergence on SMXL/D53 degradation targets was further elucidated, with SMAX1 and SMXL2 being KAI2 targets, and SMXL6/7/8 being D14/SL targets.

### 7.9 Mechanical and Touch Signaling

- Touch-responsive gene expression (thigmomorphogenesis) has been connected to calcium signaling through mechanosensitive channels. MSL (MscS-LIKE), PIEZO, MCA (MID1-COMPLEMENTING ACTIVITY), and DEK1 channels are all under active investigation. The Arabidopsis PIEZO homolog was shown to be involved in mechanical sensing for proper root growth (Mousavi et al. 2021, *PNAS* 118:e2102188118).

### 7.10 Plant Microbiome and Immune Signaling

- Extensive work (2020-2025) has shown that plants actively shape their root and phyllosphere microbiomes through immune outputs (secreted metabolites, antimicrobial peptides). The "cry for help" hypothesis (Rolfe et al. 2019, *ISME Journal* 13:1642-1654 and subsequent work) proposes that stressed plants alter their root exudate profiles to recruit beneficial microbes. Castrillo et al. and Stringlis et al. have shown that specific biosynthetic pathways (e.g., coumarins via MYB72/BGLU42/F6'H1/S8H) are induced during iron deficiency and pathogen attack to recruit beneficial Pseudomonas and Bacillus strains.
- Induced systemic resistance (ISR), triggered by beneficial root-associated microbes (e.g., *Pseudomonas simiae* WCS417), operates through a JA/ET-dependent, SA-independent priming pathway, mediated by MYB72, MYC2, and NPR1.

---

## Key Researcher Directory

| Researcher | Institution (approx.) | Key Contributions |
|---|---|---|
| Mark Estelle | UCSD | Auxin receptor TIR1/AFBs, auxin signaling |
| Ottoline Leyser | Cambridge / Sainsbury | Auxin/strigolactone signaling, shoot branching |
| Sheng Yang He | Duke / HHMI | SA signaling, pathogen effectors, stomatal immunity |
| Xinnian Dong | Duke | NPR1, SAR, SA signaling |
| Gregg Howe | Michigan State | JA signaling, COI1-JAZ, herbivore defense |
| John Browse | Washington State | JA biosynthesis, octadecanoid pathway |
| Ted Farmer | Univ. Lausanne | Wound signaling, JA, GLR channels, electrical signals, VOCs |
| Ron Mittler | Univ. of Missouri | ROS signaling, systemic signals, stress combinations |
| Martin Heil | CINVESTAV, Mexico | VOC-mediated plant communication, extrafloral nectar |
| Richard Karban | UC Davis | Plant-plant VOC communication, field studies in sagebrush |
| Ian Baldwin | MPI Chemical Ecology | VOC ecology, *Nicotiana attenuata* system |
| Marcel Dicke | Wageningen | Tritrophic interactions, HIPVs |
| Jurriaan Ton | Univ. Sheffield | Defense priming, BABA, epigenetic defense |
| Michael Hartmann | Univ. Tübingen | NHP/pipecolic acid SAR signaling |
| Jian-Min Zhou | Chinese Acad. Sciences | PTI signaling, resistosomes, BIK1, OSCA channels |
| Jijie Chai | Westlake Univ. / Cologne | NLR structures, ZAR1 resistosome |
| Susan Dudley | McMaster Univ. | Kin recognition in plants (*Cakile*) |
| Cara-Lyn Liske-Clark & Harsh Bais | Univ. Delaware | Root exudate-mediated self/non-self recognition |
| Hanhui Kuang | Huazhong Agri. Univ. | NLR evolution |
| Kenichi Tsuda | Huazhong / MPIPZ | Immune network architecture, SA-JA-ET interactions |

---

## Citation-Dense Summary of Key Papers

1. **Auxin receptor:** Dharmasiri et al. (2005) *Nature* 435:441. Kepinski & Leyser (2005) *Nature* 435:446.
2. **Ethylene receptor:** Chang et al. (1993) *Science* 262:539. Alonso et al. (1999) *Science* 284:2148.
3. **ABA receptor:** Ma et al. (2009) *Science* 324:1064. Park et al. (2009) *Science* 324:1068.
4. **JA receptor:** Thines et al. (2007) *Nature* 448:661. Sheard et al. (2010) *Nature* 468:400.
5. **SA receptor/NPR1:** Ding et al. (2018) *Cell* 173:1215. Fu et al. (2012) *Nature* 486:228.
6. **SA biosynthesis via ICS/PBS3:** Rekhter et al. (2019) *Science* 365:498.
7. **BR receptor:** Wang et al. (2001) *Nature* 410:380. She et al. (2011) *Nature* 474:472.
8. **SL receptor:** Yao et al. (2016) *Nature* 536:469.
9. **GA receptor:** Ueguchi-Tanaka et al. (2005) *Nature* 437:693.
10. **GLR wound signaling:** Mousavi et al. (2013) *Science* 339:1230.
11. **Ca²⁺ waves:** Toyota et al. (2018) *Science* 361:1112.
12. **NHP and SAR:** Hartmann et al. (2018) *Cell* 173:456. Chen et al. (2018) *Cell* 173:1468.
13. **Pipecolic acid:** Navarova et al. (2012) *Plant Cell* 24:5123.
14. **ZAR1 resistosome:** Wang et al. (2019) *Science* 364:eaav5870.
15. **NLR NADase:** Wan et al. (2019) *Science* 365:793.
16. **OSCA1.3 calcium channel:** Yuan et al. (2021) *Nature* 592:768.
17. **Kin recognition:** Dudley & File (2007) *Biology Letters* 3:435.
18. **Transgenerational priming:** Luna et al. (2012) *Plant Physiology* 158:844. Rasmann et al. (2012) *eLife* 1:e00183.
19. **Priming epigenetics:** Jaskiewicz et al. (2011) *Plant Cell* 23:4171.
20. **BABA receptor IBI1:** Luna et al. (2014) *Nature Chemical Biology* 10:450.
21. **Root terpene signal:** Rasmann et al. (2005) *Nature* 434:732.
22. **VOC plant-plant (field):** Karban et al. (2006) *Ecology* 87:922.
23. **ROS-Ca²⁺ wave integration:** Fichman & Mittler (2020) *Trends in Plant Science* 25:1104.
24. **ZAR1 as Ca²⁺ channel:** Bi et al. (2021) *Nature* 592:110.
25. **Indole priming:** Erb et al. (2015) *eLife* 4:e04490.

---

## Related Files

- [plant-signaling.md](./plant-signaling.md) — ecological and relational framing of plant communication
- [phloem.md](./phloem.md) — vascular transport system for mobile signals
- [root.md](./root.md) — root structure and function
- [leaf.md](./leaf.md) — leaf as site of defense signaling
- [stomata.md](./stomata.md) — guard cell regulation (ABA, immune signaling)
