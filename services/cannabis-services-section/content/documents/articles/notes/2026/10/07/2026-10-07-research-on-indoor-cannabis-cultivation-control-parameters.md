---
title: "Indoor Cannabis Cultivation Control Parameters: Evidence Base for Autonomic Control Systems"
description: "Peer-reviewed and extension-service data on environmental, root-zone, plant management, pest/disease, harvest, and AI/CV parameters for 8-plant home grows (max 4 flowering) in Minnesota."
date-created: 2026-10-07
type: research-note
in-service-of: services/cannabis-services-section
name: research-on-indoor-cannabis-cultivation-control-parameters
keywords: [cannabis, indoor cultivation, PPFD, DLI, VPD, environmental control, root zone, EC, pH, HLVd, botrytis, computer vision, crop steering]
tags: [draft]
status: draft-for-iteration
authors: [Claude Haiku]
---

## 1. Environment: Air Temperature, Humidity, VPD, CO₂, Light, Photoperiod

### Temperature Targets

Rodriguez-Morrison et al. (2021) maintained stable conditions at 25.3 ± 0.4°C day and 25.2 ± 0.3°C night across all light treatments. Alternative recommendations place day temperature at 81–83°F (27–28°C) and night at 72–75°F (22–24°C) when operating at high PPFD (≈1,500 μmol·m⁻²·s⁻¹). Temperature is the key determinant of plant metabolic rates; as light delivery increases, plant temperature must rise proportionally.

Under HPS lamps, whose infrared heats leaves, growers targeted leaf temperatures 2–3°C below air; under LED fixtures, which emit little infrared, a transpiring leaf sits about 0–2°C below air, so leaf VPD must be computed from a measured leaf temperature rather than an assumed offset. Leaf temperature is the physiologically relevant metric; if leaf temperature exceeds ~30°C, stomata close, CO₂ uptake stops, and photosynthesis declines.

### Relative Humidity and Vapor Pressure Deficit (VPD)

Rodriguez-Morrison et al. maintained 60.5 ± 4.8% RH day and 53.1 ± 3.3% RH night. VPD—the saturation vapor pressure deficit between leaf and air—ranges from ~0.8–1.2 kPa during vegetative growth and may be slightly higher during early flowering, with exact targets dependent on strain and cultivar.

Excessively high VPD (>2.0 kPa) triggers drought-stress responses: stomata close and transpiration shuts down, blocking CO₂ uptake and nutrient transport. Conversely, low VPD (<0.3 kPa) prevents transpiration, stopping mineral nutrient uptake and promoting fungal disease.

For botrytis and powdery mildew prevention: keep RH ≤50% throughout flowering and drying. At 60% RH and 20°C, botrytis spore germination is inhibited; at 94% RH and 21°C, mycelial growth is rapid. Powdery mildew can produce at RH below 50%, but maintains threshold control near 50% RH.

### CO₂ Concentration

Ambient indoor CO₂ is typically 437–479 ppm (Rodriguez-Morrison). Elevated CO₂ to 800–1,000 ppm can increase yield 10–25% and boost photosynthetic water-use efficiency by 111%. However, enrichment equipment costs $500–$1,500 and is generally not economically justified for home growers. Above 1,500 ppm becomes uneconomical. Home growers should plan for ambient (~400 ppm) unless dedicated enrichment infrastructure is present.

### PPFD and Daily Light Integral (DLI)

Rodriguez-Morrison et al. (2021) demonstrated linear yield increase with PPFD from 120 to 1,800 μmol·m⁻²·s⁻¹, with no saturation point observed. Dry inflorescence yield increased 4.5× (116 to 519 g·m⁻²) across this range.

Specific recommendations:
- **Seedling/early vegetative**: 200–400 μmol·m⁻²·s⁻¹
- **Vegetative**: 600–1,000 μmol·m⁻²·s⁻¹
- **Early flowering**: 800–1,200 μmol·m⁻²·s⁻¹
- **Mid/late flowering**: 1,000–1,800 μmol·m⁻²·s⁻¹

Daily Light Integral (DLI = PPFD × photoperiod hours × 0.0036) ranged from 5.2 to 78 mol·m⁻²·d⁻¹ across Rodriguez-Morrison's treatments.

### Photoperiod

Vegetative phase: 18 hours light / 6 hours dark (18/6). Flowering phase: 12 hours light / 12 hours dark (12/12). Autoflowering strains transition to flowering regardless of photoperiod (~8–10 weeks total cycle). Photoperiod cannabis requires uninterrupted 12-hour darkness during flowering; light leaks as small as 0.01 µmol·m⁻²·s⁻¹ PAR during the dark period can delay flowering or induce hermaphroditism. Red light produces the strongest photoperiod response; a 10-minute red-light exposure mid-dark-period can prevent flowering.

### Light Spectrum and UV-B

Rodriguez-Morrison used a B18:G5:R77 spectral ratio. Evidence for UV-B (280–320 nm) effects on cannabinoid content is mixed: UV-B exposure can increase trichome production and trigger stress-response cannabinoid synthesis, but field evidence is weak. For home systems, focus on red and blue photons at high efficiency; add UV-B only if system is designed for it and grower can monitor phototoxicity.

---

## 2. Root Zone: Substrate, EC, pH, Irrigation Strategy (Crop Steering)

### Substrate Choices

**Coco coir**: Hydrophobic (requires pre-buffering with Ca²⁺/Mg²⁺); inert, reusable, excellent aeration. Requires frequent fertigation. Preferred for autonomous control systems due to consistent water-release characteristics.

**Rockwool**: Inert, consistent, excellent drainage and aeration control. Propagation rockwool slabs maintain EC 1.6–2.4 mS/cm. Requires careful pH management and frequent watering.

**Living soil**: Organic, biologically active, self-regulating nutrient cycling via microbial biomass. Requires 2–4 week cooking period pre-plant. Nutrient uptake is less directly controllable; unsuitable for tight setpoint control in autonomic systems.

**DWC/NFT**: Inert, fast growth, high control; requires active aeration and monitoring. Viable for small systems.

### EC and pH Targets (Coco)

**pH**: Target 5.8–6.2 in solution (5.6–6.0 runoff in coco).

**EC by stage** (measured in root-zone solution):
- Seedling (0–2 weeks): 1.0–1.5 mS/cm
- Vegetative (2–6 weeks): 2.0–2.8 mS/cm (adjust per strain; some cultivars reach 4–5 mS/cm)
- Early flowering (weeks 1–3): 2.5–3.5 mS/cm
- Mid/late flowering (weeks 4–8): 2.8–4.0 mS/cm

Under high PPFD (1,500+ μmol·m⁻²·s⁻¹) and LEDs, EC baselines may rise to 8–11+ mS/cm as plants increase nutrient uptake. Monitor runoff EC; if it climbs above solution EC by >0.5 mS/cm, nutrients are accumulating and a partial water exchange is warranted.

### Irrigation Strategy and Crop Steering

Crop steering manipulates irrigation timing, substrate water content, and EC to guide vegetative vs. generative growth.

**Vegetative steering**: Higher substrate volumetric water content (VWC) (~60–70%), shorter dry-back periods, frequent light irrigations. Encourages leaf/stem/root expansion.

**Generative steering**: Lower VWC (~40–50%), longer dry-back periods (allow substrate to dry 30–40% between irrigations), triggers mild drought-stress signals. Plants redirect energy to reproduction: denser flowers, increased trichome production, higher cannabinoid concentration.

Deficit irrigation (generative steering) is typically applied from mid-vegetative stage through mid-flowering. Substrate water tension (pF or kPa) is physiologically more relevant than VWC; growers with soil-moisture sensors should target pF 1.5–2.5 during vegetation and pF 2.0–3.0 during flowering.

---

## 3. Plant Management: Veg Duration, Training, Flowering Length, Perpetual Harvest Under 4-Flowering Cap

### Vegetative Duration and Scaling

Seedlings require 2–3 weeks to develop roots and multiple leaf sets. Vegetative growth phase ranges from 2 to 16 weeks depending on desired plant size; for a 4-flowering perpetual harvest at home scale, plan 4–8 weeks vegetation to allow adequate node development for training and flower-site initiation without excessive vegetative biomass.

### Training: LST, SCROG

Low-stress training (LST) bends and ties branches to create a flat, even canopy, distributing light exposure and creating multiple cola sites. Screen of Green (SCROG) uses a horizontal trellis net; branches grow through the net and are tucked horizontally as they emerge. Goal: uniform canopy height, all bud sites equidistant from light, improved airflow.

SCROG mesh size: 4-inch grid provides dense anchor points and works for high-node-count strains. LST and SCROG delay flowering slightly (growers stop training 2–3 weeks pre-flip) but increase yield per plant by 20–40% through better light distribution.

### Flowering Duration by Cultivar Class

- **Indica-dominant**: 6–9 weeks (typical 7–8 weeks)
- **Sativa-dominant**: 9–14 weeks (typical 10–12 weeks)
- **Hybrid**: 7–11 weeks (genetic composition dependent)
- **Autoflowering**: 8–10 weeks total (germination to harvest), photoperiod-independent

### 4-Flowering Perpetual Harvest Design

Minnesota regulations: max 8 plants total, max 4 flowering at once. Schedule:
- A mother plant counts toward the 8-plant limit; with 4 flowering, a mother leaves 3 slots for vegetating clones.
- Start 2 clones/seedlings in vegetative rack every 2 weeks.
- Transition 2 plants to flowering every 2 weeks when 2 existing flowering plants enter late cycle (weeks 6–7 of 9–10 week total).
- Harvest every 2 weeks.

This requires staggered flip timing:
- Week 0: Plants A, B enter flowering; Plants C, D vegetate.
- Week 3: Plants A, B at week 3 flower; Plants C, D transition to flower; Plants E, F start veg.
- Week 6: Plants A, B harvest; Plants C, D at week 3 flower; Plants E, F transition; Plants G, H start veg.
- And so on.

Clones are preferred over seed for perpetual harvest: identical genetics, female guarantee, shorter time to flowering (no germination/early veg delay), uniform canopy heights.

---

## 4. Pests and Disease: HLVd, Powdery Mildew, Botrytis, Russet Mites, Fungus Gnats

### Hop Latent Viroid (HLVd)

Prevalence: 90% of California cannabis facilities test HLVd-positive (Dark Heart Nursery survey, 2021). HLVd reduces inflorescence density and cannabinoid production (~50% THC reduction vs. healthy plants). Symptoms appear in flowering: smaller, less dense, less frosty buds.

Detection: RT-qPCR (reverse transcription quantitative PCR) available through licensed testing labs and home kits (e.g., PathoSEEK Hop Latent Viroid Detection Assay). Leaf tissue is suitable for sampling; viroid titer increases with plant age. Sensitivity is high with proper sampling.

Transmission: via propagation material (clones, contact), contaminated tools, insects, water in recirculating systems. Quarantine new clones and test before integration into mother/production stock.

### Powdery Mildew

Thrives at RH >95% but produces even at RH <50%. Spores germinate during brief high-humidity periods. Prevention: maintain RH ≤50% throughout the grow, ensure airflow (1.25–1.5 m/s at canopy), prune dead/dense foliage.

### Botrytis (Bud Rot)

Fungal disease favored by high humidity, poor airflow, and dense canopy structure. At 20°C and 60% RH, spore germination is inhibited; at 94% RH and 21°C, mycelial growth accelerates. Prevention during flowering: maintain RH 40–50%, ensure 1–2 air changes per minute, thin lower/interior canopy to improve airflow, monitor leaf-surface temperature (keep it below air temperature via evaporative cooling).

During drying (about 60°F/60% RH: 15–18°C, 55–62% RH, 10–14 days): hold RH near 60% and active circulation to prevent bud-surface moisture retention. During curing (58–62% RH, 10–21 days): water activity 0.55–0.65 aw (equilibrium RH ~55–65%); above 65% RH, botrytis and other molds germinate.

### Russet Mites (Aculops cannabicola)

Microscopic (easily missed). Early detection is critical. Biological control agents: *Neoseiulus fallacis, N. californicus, Amblyseius andersoni, A. cucumeris*. Preventive releases of beneficial mites before infestation are effective.

### Fungus Gnats

Larvae damage fine roots; prefer wet substrate. Prevention: avoid overwatering, maintain good drainage, allow periodic drying between cycles. Yellow sticky traps for adult monitoring. Biological controls: *Stratiolaelaps scimitus* (predatory mite), *Hypoaspis miles*.

### IPM Schedule

Week 1–4 (all stages): Scout weekly (leaf undersides, soil surface, leaf base). Remove dead/dense foliage. Maintain RH and airflow. Introduce beneficial insects (mites, parasitic wasps) preventively in vegetative stage.

Week 5–finish flowering: Increase scouting frequency (every 3 days). Monitor RH closely; do not exceed 50%. Avoid foliar applications 2+ weeks before harvest (residue risk).

Post-harvest: Inspect buds closely for botrytis. Remove any affected material before drying.

---

## 5. Harvest and Post-Harvest: Trichome Maturity, Drying, Curing, Water Activity

### Trichome Maturity and Harvest Window

Cannabinoid development follows trichome color progression:

- **Clear trichomes**: THCA still accumulating; potency not yet peaked. Harvest at this stage yields lower THC and less pronounced effects.
- **Cloudy/milky trichomes**: Peak THC (THCA) levels. Trichome heads opaque due to cannabinoid/terpene accumulation. Most growers targeting high THC harvest at this stage (80–90% cloudy, 10–20% amber).
- **Amber trichomes**: THCA degrading to CBN (cannabinol), which produces a more sedative, "couch-lock" effect. Harvest with 20–30% amber for balanced THC/CBN blend; >50% amber for maximum sedation.

Assessment requires magnification (10–30×): jeweler's loupe, digital USB microscope, or phone macro lens with loupe adapter. Some growers use smartphone microscopy apps with good results.

### Drying

Duration: 10–14 days at about 60°F/60% RH (15–18°C, 55–62% RH); drier air dries the outside of the bud before the inside and strips terpenes, with passive air circulation (ceiling fan) or active ventilation (2–4 air exchanges per minute).

Hanging whole plants or branch-trimmed buds: Smaller buds (0.5–2 g) dry in 7–10 days; large colas need 14+ days. Monitor for mold (black spots, white mycelium on bud surface) daily. If RH climbs above 55% or temperature drops below 55°F, extend drying time and increase airflow.

Bud dryness checkpoint: outer buds should "snap" when bent; stem should crack (not bend) when folded. Do not over-dry (<10% water content); terpenes volatilize and cannabinoids degrade.

### Curing

After drying, trim buds and place in airtight glass jars at 58–62% RH (equilibrium water activity 0.55–0.65 aw). Open jars daily ("burp") for 5–10 minutes during the first week to release excess moisture and CO₂, then reduce burping frequency. Cure duration: minimum 10 days; optimal 21–30 days. Longer curing (60+ days) can improve flavor complexity.

Water activity (aw) <0.6 prevents mold and bacterial growth; aw 0.55–0.65 is optimal for preserved terpenes and active cannabinoids.

---

## 6. AI and Computer Vision in Cannabis Cultivation

### Published Work: Plant Phenotyping and Disease Detection

Plant phenotyping via computer vision is an established field in horticulture. Applications relevant to cannabis:

**Trichome Maturity Detection**: A 2025 study (Zvirin et al., *Journal of Forensic Sciences*) identified non-glandular trichomes using deep learning. Multiple model architectures tested:
- Basic CNN: 92.77% accuracy
- Deep Layer Aggregation (DLA): 95.89% accuracy
- YOLO-V4: 92.12% accuracy
- DETR (Detection Transformer): 85.30% accuracy
- **Composite YOLO + bounding-box classifier: 97.61% accuracy**

Imaging equipment: OLYMPUS SZX16 microscope with Pixelink PL-D799CU camera (4,096 × 1,710 px, RGB JPG format). Dataset: 2,826 annotated images (1,286 cannabis, 1,540 non-cannabis).

**Flower Maturity Estimation**: A 2025 MDPI *Agriculture* article described a two-stage pipeline:
- Faster R-CNN for trichome detection: precision 0.815, recall 0.802
- YOLOv8 classifier for color categorization (clear/milky/amber): 98.6% accuracy

**Leaf Disease Detection**: General plant pathology models (DWT+PCA+GLCM+CNN) achieve 99.09% accuracy. Computer-vision-based plant phenotyping saves 90% labor time vs. manual visual assessment.

### Commercial Platforms and Sensor Stacks

**TrolMaster Hydro-X**: MBS-PRO 4-in-1 sensor measures temperature, RH, CO₂ (up to 5,000 ppm), and basic light intensity. Pairs with MBS-PAR quantum sensor for true PPFD measurement. Closed-loop PPFD dimming maintains setpoint as LED fixtures age (degradation typically 10–15% over 3,000 hours). Also offers MBS-TH (temperature, humidity, VPD calculation).

**Growlink ClimaLINK**: Real-time monitoring of temperature, humidity, light, optional CO₂. VPD calculation built-in. Aspirated sensor design ensures reliable canopy-level readings.

**Aroya**: Known for multi-sensor platforms with automated irrigation and environmental management. (Specific technical specifications unavailable in public sources; proprietary.)

### Feasibility at Home Scale: Phone/USB Microscope/Raspberry Pi

**Trichome Classification**: USB microscope (30–100× magnification, $30–100) paired with a trained YOLOv8 or simple CNN can classify trichome maturity. Inference on Raspberry Pi 4B or laptop is feasible; real-time classification of individual trichome images takes <1 second per image. Practical workflow: snapshot of bud with USB microscope, process image with Python + OpenCV/PyTorch, return maturity estimate (% clear/cloudy/amber).

**Canopy Segmentation and Leaf Health**: Smartphone camera with macro lens can capture 2–3 megapixel images of leaf disease and canopy structure. Pre-trained models (e.g., ResNet, EfficientNet on PlantVillage dataset) can detect powdery mildew, botrytis lesions, nutritional deficiencies. Inference via cloud API (Roboflow, Hugging Face) or local edge device (Raspberry Pi with ONNX runtime).

**NDVI / Hyperspectral**: Requires multispectral camera (e.g., Parrot Sequoia, $2–3k). Single-band red/NIR NDVI measurement is possible with modified Raspberry Pi camera (removed IR filter, paired with bandpass filters, $50–200 DIY). Useful for stress detection (mild drought stress elevates NDVI).

**Environmental Monitoring**: Cheap sensors available: DHT22 (temperature/RH, $5), BME680 (temp/RH/pressure/VOC, $15), MH-Z19C (CO₂, $20), BH1750 (light intensity, $5). All integrate with Raspberry Pi via GPIO or I²C. VPD calculation in Python trivial. PPFD requires quantum sensor (expensive, typically $1–5k).

---

## Key Takeaways for Autonomic Control

1. **Light intensity is the primary yield lever**: Linear response to PPFD up to 1,800 μmol·m⁻²·s⁻¹ (Rodriguez-Morrison). DLI and PPFD are inter-dependent; design lighting infrastructure to deliver 1,200–1,500 μmol·m⁻²·s⁻¹ at canopy height during flowering.

2. **VPD and leaf temperature are more relevant than air-only metrics**: Target 1.0–1.5 kPa during vegetation, adjust based on strain during flowering. Measure leaf temperature (IR) and compute leaf VPD from it; under LED a healthy leaf runs 0–2°C below air.

3. **Botrytis and powdery mildew control hinges on RH ≤50% and airflow**: Environmental setpoints are the strongest pest/disease preventatives. Humidity control is harder than temperature; plan for active dehumidification.

4. **Crop steering via irrigation (VWC / water tension) can boost trichome production and cannabinoid concentration**: Generative steering (lower VWC, longer dry-backs) in mid-to-late flowering is evidence-based.

5. **HLVd is endemic in propagation stock**: RT-qPCR testing of clones/new cultivars is essential; one infected plant can vector to others in recirculating systems.

6. **Computer vision for trichome maturity is near-commercial**: YOLOv8 + bounding-box classifiers achieve 97.6% accuracy on laboratory images. Home-scale USB microscopy + edge inference (Raspberry Pi) is viable and can automate harvest-timing decision.

7. **Setpoint-driven autonomic systems benefit from substrate-moisture sensing**: pF (water tension) sensors or capacitive VWC probes with real-time feedback enable crop steering without manual watering.

---

## References

- Bugbee, B., Harborside Inc. Strategic Research Agreement on Cannabis Crop Steering. Utah State University Crop Physiology Lab.
- Dark Heart Nursery. (2021). HLVd prevalence survey: 90% of California cannabis facilities infected.
- FloraFlex Media. (2025). Cannabis cultivation guides on SCROG, crop steering, VPD management, botrytis prevention.
- Rodriguez-Morrison, H., Llewellyn, D., Zheng, Y. (2021). "Light Intensity Effects on Inflorescence Yield and Quality of Cannabis." *Frontiers in Plant Science*, https://pmc.ncbi.nlm.nih.gov/articles/PMC8144505/
- Zheng Lab (Guelph). Cannabis nutrient and fertigation research.
- Zvirin, et al. (2025). "Identification of non-glandular trichome hairs in cannabis using vision-based deep learning methods." *Journal of Forensic Sciences*, https://pmc.ncbi.nlm.nih.gov/articles/PMC12223337/
- MDPI *Agriculture*. (2025). "Estimating Cannabis Flower Maturity in Greenhouse Conditions Using Computer Vision."
- Vermont Cannabis Control Board. HLVd testing and guidance.
- Medicinal Genomics. PathoSEEK Hop Latent Viroid Detection Assay.
- Quest Climate, Aroya, Royal Brinkman, TrolMaster, Growlink. Humidity, VPD, and environmental control guidance.
- University of Mississippi. Leaf temperature and cannabis cultivation optimization.
