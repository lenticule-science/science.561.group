---
title: "Next-Generation Cannabis Cultivation Intelligence: Crop Steering, Digital Twins, Optimization, and Sensing"
description: "Implementable equations and protocols for crop steering, plant digital twins, recipe optimization, novel sensing, LLM-assisted diagnosis, and pest detection in 8-plant home cannabis grows."
date-created: 2026-10-07
type: research-note
in-service-of: services/cannabis-services-section
name: research-on-next-generation-cannabis-cultivation-intelligence
keywords: [crop-steering, plant-digital-twin, DLI, LUE, light-use-efficiency, recipe-optimization, Bayesian-optimization, CWSI, thermal-imaging, chlorophyll-fluorescence, NDVI, acoustic-emissions, VLM-agriculture, pest-detection]
tags: [draft]
status: draft-for-iteration
authors: [Claude Haiku]
---

# Next-Generation Cannabis Cultivation Intelligence

## 1. Crop Steering: Irrigation, EC, and VWC Protocols

Crop steering manipulates irrigation, climate, and light to push plants toward vegetative or generative metabolic states. The protocol relies on three measurable signals: substrate volumetric water content (VWC), electrical conductivity (EC), and dryback rate.

### Substrate Characteristics

**Coco coir:** Field capacity (maximum water holding) is 65–80% VWC. Drains faster than rockwool, showing dryback response within 4–8 hours.

**Rockwool:** Field capacity is 55–75% VWC. Slower drying, enabling sustained control over EC stacking.

**Water availability threshold:** Plants require minimum 30% VWC to access water. Water is readily available above 38–40% VWC.

### The Daily Irrigation Phases and the Steering Bias

In crop-steering practice P1, P2 and P3 name the three phases of each lit day, not stages of the crop's life:

- **P1 (ramp):** from about 1–2 h after lights-on, repeated small shots raise VWC from the overnight low to the day's target (near field capacity).
- **P2 (maintenance):** shots hold VWC in a band through the middle of the photoperiod.
- **P3 (dryback):** irrigation stops some hours before lights-off, and the substrate dries until the next day's first P1 shot.

The steering bias is set by the size of the dryback and the substrate EC, and it changes with crop stage:

```
Vegetative bias (veg, first ~2-3 weeks of flower):
  VWC day target:     60–75%
  feed EC:            1.4–2.2 mS/cm
  overnight dryback:  10–15% of the day's peak VWC
Generative bias (bulking and ripening flower):
  VWC day target:     40–55%
  feed EC:            2.2–3.0 mS/cm (substrate EC allowed to climb)
  overnight dryback:  20–30% (25–35% aggressive)
```

### Irrigation Shot Protocol

**Shot size:** small, repeated shots of about 2–6% of substrate volume each; P1 uses several shots to climb to the target, and a final larger shot that produces runoff is used when the substrate EC must be lowered. For an 11 L (3 gal) coco pot, one shot is about 0.2–0.65 L.

**Frequency:** Automated irrigation triggers when substrate moisture falls below target VWC. Typical cycle in P2: one shot per 4–8 hours depending on canopy size and environmental ET demand.

**EC stacking signal:** In P3, eliminate runoff and monitor substrate EC rise. A rising substrate EC (↑ 0.2–0.4 mS/cm above feed EC per 3–5 days) indicates salt accumulation and reinforces generative steering.

### Single-Sensor Dryback Measurement

Given one substrate VWC sensor (capacitive or TDR):
1. Log VWC at end of last irrigation shot (V_max).
2. Log VWC at next irrigation trigger (V_min).
3. Dryback % = ((V_max - V_min) / V_max) × 100.

Overnight dryback is specifically measured between lights-off and lights-on. Target 20–30% overnight dryback in P3 by adjusting shot size and EC.

### Vapor Pressure Deficit (VPD) Co-signal

VPD reinforces or moderates irrigation steering:
```
Vegetative:       0.8–1.2 kPa (warmer, more humid)
Early flower:     1.2–1.5 kPa
Peak flower:      1.4–1.7 kPa (cooler, drier air raises transpiration demand)
```

Higher VPD (drier air) increases transpiration and dryback rate; lower VPD reduces it. Crop steering adjusts VPD alongside irrigation to compound the signal.

---

## 2. Plant Digital Twins: Growth Models and Yield Prediction

### Light Use Efficiency (LUE) and Canopy-Based Yield Model

Cannabis yield responds linearly to increasing light intensity up to 1,800 μmol·m⁻²·s⁻¹ (PPFD), unlike most other crops which show saturation. The per-plant digital twin uses canopy cover, height, DLI, temperature, and days elapsed.

**Light use efficiency for cannabis (whole-plant, generative phase):**
```
LUE_flower = 0.26 g_dry_biomass per mol_PAR
             (Rodriguez-Morrison et al. 2021)

Yield_dry_g/m² = Canopy_Cover(0–1) × DLI(mol/m²/d) × Cycle_days × LUE_flower × Harvest_Index

where:
  Canopy_Cover = fractional light interception (0–1), increases logistically with days
  DLI = Daily Light Integral (mol PAR m⁻²·d⁻¹)
        = PPFD(μmol·m⁻²·s⁻¹) × seconds_per_day / 1e6
  Harvest_Index ≈ 0.56–0.73 (inflorescence : total biomass; higher at higher light)
  Cycle_days = days in generative phase (typically 55–75 for cannabis)
```

**Empirical yield response to PPFD:**
```
Yield (g_dry/m²) ≈ 116 + 0.24 × (PPFD − 120)   (PPFD in μmol·m⁻²·s⁻¹, 12 h photoperiod)
   (Rodriguez-Morrison et al. 2021: inflorescence yield rose linearly from
    116 g/m² at 120 μmol·m⁻²·s⁻¹ to 519 g/m² at 1,800 μmol·m⁻²·s⁻¹;
    the slope is (519 − 116) / (1800 − 120) ≈ 0.24 g·m⁻² per μmol·m⁻²·s⁻¹)

Per mol: over that study's ~8-week flowering at 12 h light, the marginal yield is
≈ 0.10 g inflorescence per additional mol·m⁻² of PAR, and the average at
1,800 μmol·m⁻²·s⁻¹ is ≈ 0.12 g/mol. LUE_flower × Harvest_Index above
(0.26 × 0.56–0.73 ≈ 0.15–0.19 g/mol) is the upper envelope; calibrate the
coefficient per cultivar from recorded harvests.
```

For this grow's 4 × 4 ft (1.49 m²) flowering tent holding 4 plants, at an average canopy PPFD of 900 μmol·m⁻²·s⁻¹ (unenriched CO2):
```
Predicted yield ≈ 116 + 0.24 × (900 − 120) ≈ 303 g_dry/m² × 1.49 m² ≈ 450 g per 4-plant cycle (≈ 113 g/plant)
```

**Energy use efficacy:**
```
EUE = 0.54 g_dry_biomass per kWh (at 900 PPFD)
      (Rodriguez-Morrison 2021)
```

### Logistic Canopy Growth and Leaf Area Index (LAI)

Canopy cover expands logistically during vegetative phase and early flower, plateauing by mid-flower. A modified logistic model fits LAI or fractional cover:

```
Canopy_Cover(t) = MaxCover / (1 + exp(b + c·t + d·t²))

where:
  t = thermal time (GDD accumulated since planting)
  MaxCover = 0.85–0.95 (peak fractional canopy closure)
  b, c, d = fitted parameters specific to cultivar and environment
  
For tomato digital twins (analogous structure):
  LAI(t) = a / (1 + exp(b + c·t + d·t²))
           where t = thermal time in GDD
```

### Thermal Time and Growing Degree Days (GDD)

Cannabis grows in thermal time rather than calendar days. Base temperature varies by cultivar:

```
GDD = Σ(T_mean - T_base) per day, where T_mean > T_base

Typical cannabis:
  T_base ≈ 10°C (some lines 8–12°C)
  Vegetative phase:  400–600 GDD (base 10°C)
  Generative phase:  800–1000 GDD to physiological maturity
  
Total cycle ~1200–1600 GDD depending on photoperiod and cultivar

Calculation:
  GDD_daily = (T_max + T_min)/2 - T_base (if ≥ 0)
  GDD_cumulative = Σ GDD_daily from planting
```

For a home grower tracking soil temperature (more reliable than air for roots), use soil-temperature-compensated GDD (GDD_stc) where both air and soil contributions drive growth.

### Harvest Index and Total Biomass

Harvest index (HI) is the fraction of total dry biomass allocated to inflorescence (the harvestable portion):

```
HI = Inflorescence_dry_mass / Total_above-ground_dry_mass
   ≈ 0.56–0.73 (higher at higher light intensity)

Total_dry_biomass ∝ intercepted_light_energy + N_uptake + temperature_stability

Inflorescence_yield = Total_dry_biomass × HI
```

At high light (1,800 PPFD), HI approaches 0.73; at lower light (600 PPFD), HI ≈ 0.56. This means optimal light increases both total growth and the proportion that flowers.

---

## 3. Recipe Optimization: Bayesian Optimization and Multi-Armed Bandits

### Bayesian Optimization for Greenhouse Setpoints

Recipe optimization treats each harvest cycle (or pair of plants at staggered harvest) as a noisy observation of yield Y given environmental setpoints (temperature, humidity, DLI, EC, dryback phase duration). Bayesian optimization updates a Gaussian process surrogate model and selects the next setpoint to maximize expected improvement.

**Workflow:**

1. **Prior:** Assume yield follows a smooth, differentiable response surface to:
   ```
   Y = f(T_mean, VPD, DLI, EC_peak, dryback_start_day, photoperiod)
   ```
   Priors from Rodriguez-Morrison, phenodb guides, and crop steering literature.

2. **Likelihood:** Each harvest (or each plant) is a noisy measurement:
   ```
   Y_obs = f(x) + ε,  where ε ~ Normal(0, σ²_obs)
   σ²_obs ≈ 30–50 g² for home scale (stochastic variation in plant vigor, microclimates)
   ```

3. **Acquisition function (Expected Improvement):**
   ```
   EI(x) = E[max(Y(x) - Y_best, 0)]
           Over posterior predictive distribution of f(x).
   
   Choose next setpoint x* = argmax EI(x).
   ```

4. **Batch sequential:** Run 2 plants under setpoint 1, evaluate yield and quality metrics, then query EI to select setpoint 2 for the next cohort.

**Practical hyperparameters:**
- Gaussian process kernel: Matérn 5/2 (smooth, captures non-linearity).
- Optimize acquisition over a bounded grid of feasible setpoints (e.g., DLI 40–65 mol/m²/d, EC 2.0–3.5 mS/cm).
- Refit GP every 2–3 harvests (requires ~4–6 observations to build useful posterior; home scale yields 2 datapoints per cycle).

### Multi-Armed Bandit Framework for Small-N Trials

Alternatively, treat setpoints as "arms" and use Thompson Sampling (a simpler, non-gradient method) to balance exploration and exploitation:

```
Thompson Sampling:
  For each arm i (setpoint i):
    β_i ~ Beta(α_i, β_i)    where α_i = successes, β_i = failures
    
    Sample θ_i ~ Beta(α_i, β_i)
    
  Choose arm i* = argmax θ_i
  
  After harvest, update:
    If yield > threshold: α_i += 1
    Else:                β_i += 1
```

**Advantages for home growers:**
- Requires no derivative estimates (robust to noise).
- Naturally handles categorical arms (e.g., "high EC + high VPD" vs. "low EC + low VPD").
- Converges in ~20–30 trials to near-optimal arm.

At 2 plants per cycle, this is ~10–15 cycles (6–9 months) to identify peak protocol.

**Prior:** Initialize with α_i and β_i from published protocols (e.g., Phenodb, CRIC Labs crop steering guides) to reflect expert confidence before testing.

---

## 4. Novel Sensing: Substrate, Thermal, Acoustic, Optical, and Mass

### 4.1 Thermal Imaging and Crop Water Stress Index (CWSI)

**Sensor:** MLX90640 thermal array (32×24 pixels, 5–50°C range, ±3°C accuracy). Low-cost (~$100–150), suitable for canopy-level monitoring.

**Principle:** Under water stress, stomatal closure reduces transpiration, and leaf temperature rises. CWSI normalizes leaf temperature between maximum (no transpiration) and minimum (maximum transpiration):

```
CWSI = (T_leaf - T_wet) / (T_dry - T_wet)

where:
  T_leaf = measured leaf temperature (°C)
  T_wet = minimum possible leaf temperature (approximated as wet-bulb from humidity + air temp)
           = T_air - (T_air - T_dew) × 0.74  (simplified Magnus formula)
  T_dry = maximum leaf temperature (approximated as T_air + 10°C for unstressed plant)

CWSI range:     0–1 (0 = no stress, 1 = severe water deficit)
Target range:   0.3–0.5 (well-watered, generative phase)
                0.6–0.8 (mild water stress, appropriate for P3 generative steering)
```

**Measurement protocol:**
- Mount MLX90640 12–20 cm from canopy, angled 45° to measure apical leaves (not stems).
- Log every 10–15 minutes during lights-on.
- Smooth with 15-minute rolling average to filter sensor noise.
- Record simultaneously: air temperature, RH (for T_wet calculation), substrate EC and VWC.

**Correlation with irrigation need:**
- CWSI ramp from 0.3 → 0.6 over 4–6 hours indicates rapid transpiration; schedule next shot.
- Plateau at 0.5–0.6 indicates steady state; no immediate water deficit.
- If CWSI > 0.7, trigger emergency irrigation (substrate EC may be too high for water uptake despite adequate moisture).

### 4.2 Acoustic Emissions from Stressed Plants

**Principle:** Plants emit ultrasonic clicking sounds under drought or mechanical stress (Khait et al. 2023). Cavitation in xylem vessels produces acoustic signatures.

**Detection spec:**
- **Frequency:** ultrasonic, 20–100 kHz (Khait et al. 2023 recorded tomato and tobacco); drought-stressed and cut plants emitted tens of clicks per hour versus about one per hour for unstressed plants, and a trained classifier distinguished drought from cutting from the click spectra.
- **Detection distance:** 3–5 meters in quiet conditions.
- **Sensitivity:** Machine learning (neural networks) can identify stress condition from spectral features.

**Sensor:** MEMS ultrasonic microphone (e.g., CMC-6015A, ~$20–40) or ceramic piezo sensor (resonance at 40–60 kHz).

**Application:**
```
1. Acquire acoustic clips with an ultrasonic microphone and an ADC sampling at ≥ 250 kHz (Khait et al. 2023 used 500 kHz); a 44.1/48 kHz sound card cannot capture these emissions (Nyquist limit ≈ 22–24 kHz).
2. Compute spectrogram (Welch PSD, 1–100 kHz window).
3. Extract features: peak frequency, bandwidth, energy in 40–60 kHz band.
4. Train random forest or MLP on reference clips from water-stressed vs. healthy plants.
5. Alert if stress signature detected; cross-check with CWSI and substrate VWC before irrigating.
```

**Advantage:** Early warning (cavitation precedes wilting by hours); independent of visual or thermal cues.

### 4.3 Chlorophyll Fluorescence: Photosystem II Efficiency (PAM / OJIP)

**Principle:** Fluorescence yields (Fv/Fm, NPQ) reveal photosynthetic stress before visible symptoms.

**Sensor options:**
- **Pulse Amplitude Modulation (PAM):** Gold standard. Modulated measuring light avoids saturation by ambient light. Fv/Fm ≈ 0.83 for healthy plants; drops to 0.4–0.6 under stress.
  - Low-cost prototype: ~€150 (Kuznetsov et al. 2024), detects Fv/Fm with <±0.02 accuracy.
  - Commercial units (Walz IMAGING-PAM): >€5,000 but enable per-pixel mapping.

- **OJIP (fast transient):** Detailed photochemical kinetics; requires dark adaptation (1–2 min), unsuitable for continuous field use.

**Practical protocol for 8-plant home setup:**
```
1. Use handheld PAM fluorometer (~€200–500).
2. Measure 2–3 leaves per plant, 3× per week, mid-photoperiod.
3. Log Fv/Fm (maximum quantum yield); target 0.80–0.83 for vegetative, 0.75–0.80 for generative.
4. If Fv/Fm < 0.65, indicates high light stress, nutrient imbalance, or water stress.
   - Correlate with CWSI and substrate EC to diagnose: if CWSI high + EC high → reduce EC; if CWSI normal → light stress.
5. Use NPQ (non-photochemical quenching, measure under light pulse) to distinguish
   transient acclimation (normal) from sustained photoinhibition (requires intervention).
```

### 4.4 NDVI and NIR Canopy Imaging

**Principle:** Vigorous plants absorb red light and reflect near-infrared (NIR). NDVI = (NIR – Red) / (NIR + Red) ranges 0–1; higher NDVI tracks canopy cover and light-use capacity.

**Sensor:** Modified USB camera or Raspberry Pi camera with IR-cut filter removed + bandpass filter (850 nm NIR):
- Remove IR-cut filter (simple modification, ~$5 per camera).
- Add IR bandpass filter (850 ± 50 nm, ~$10).
- Mount overhead on adjustable bracket; image daily during peak light.

**Calculation:**
```
NDVI = (NIR_intensity - Red_intensity) / (NIR_intensity + Red_intensity)

NDVI > 0.7:  Healthy, full canopy
NDVI 0.5–0.7: Moderate canopy, possible stress (nutrient, water, or light imbalance)
NDVI < 0.5:   Sparse or stressed canopy; investigate

Canopy_Cover ≈ 0.8 × (1 - (1 - NDVI)^2)    (empirical fit for crops)
```

**Workflow:**
1. Daily image capture (1–2 min after lights-on or off; avoid specular reflection).
2. Compute NDVI per plant as regional average (mask non-plant background).
3. Fit logistic growth curve to NDVI vs. days to estimate MaxCover and growth rate.
4. Cross-check predicted canopy cover with DLI calculations to validate LUE model.

### 4.5 Pot Weight (Load Cell) for Transpiration and Irrigation Triggering

**Principle:** Pot mass = substrate + water + plant biomass. Daily mass loss = water evapotranspiration (ET). Automated irrigation triggers on target dryback.

**Sensor:** Precision load cell (±0.1 g resolution at 10 kg scale):
- Recommended: Tedea Huntleigh 1041, 1042, or equivalent (1–50 kg range, rated 3,000 cycles/day).
- Cost ~$50–100 per cell; 8 plants = $400–800 infrastructure.

**Installation:**
```
1. Place each pot on load cell.
2. Log mass every 15–30 minutes via USB load cell controller (HX711 module, ~$5).
3. Smooth with 1-hour rolling median to filter plant movement/vibration.
4. Compute daily dryback:
     M_max = peak mass (immediately after irrigation)
     M_min = minimum mass before next irrigation
     Dryback_g = M_max - M_min
     VWC_dryback_pct = (Dryback_g / water_density / substrate_volume) × 100
```

**Triggering logic:**
```python
if (M_max - M_current) >= target_dryback_g:
    # Trigger irrigation shot
    # Record timestamp, mass, EC/VWC from substrate sensor
    # Log shot size (mL) delivered
```

**Advantages:**
- True ET measurement; no sensor drift (mechanical load cell is extremely stable).
- Enables per-plant watering variation (useful in 8-plant setup with different canopy sizes).
- Detects leaks and sensor faults immediately (sudden mass loss not explained by ET).

### 4.6 Sap Flow and Stem Diameter Variation

**Sap flow sensor (heat-balance or heat-pulse method):**
- Measures xylem water flux (cm/s). Peak sap flow occurs mid-day; declines under drought.
- Commercially available: Aranet TDSKT102, Phyto-Sensor SF-4M (~$200–400 per sensor).
- Installation: Collar around stem; requires periodic repositioning as stem grows (heat callus can form).

**Stem diameter dendrometer:**
- LVDT or capacitive sensor mounted on band around stem; measures daily shrink/swell.
- Shrinkage during day (transpiration > uptake); swelling overnight (root pressure).
- Water stress amplifies amplitude (difference between max and min diameter).

**Application:**
```
Transpiration_peak = sap_flow_max (cm/s) × xylem_area (cm²)  → mL/h
Daily_ET = Σ(sap_flow) over 12-hour photoperiod × xylem_area

Stress_signal = (max_diameter - min_diameter) / average_diameter
              Increases from ~0.5% (well-watered) to 2–3% (water stress)
```

**Home-scale feasibility:** High maintenance (repositioning, calibration). Better suited to research greenhouse than 8-plant home grow unless automated turret system is built. Consider auxiliary; not primary steering sensor.

---

## 5. LLM and Vision-Language Model Systems for Crop Diagnosis

### Architecture and Workflow

Recent systems (2024–2026) combine vision-language models (VLMs) with domain adaptation and reasoning pipelines:

1. **Visual feature extraction:** YOLOv11 or Vision Transformer backbone (e.g., ViT-B, DINOv2) to localize lesions or pest symptoms.

2. **VLM-based diagnosis:** Feed image + symptoms prompt to multimodal LLM (Qwen-VL, GPT-4V, Claude Vision, or open Llava/LLaVA-NeXT):
   ```
   Prompt: "Diagnose this cannabis leaf image. Symptoms visible: yellow spotting, 
           wilting edges, white powdery patches. Known environmental conditions: 
           EC=2.8 mS/cm, CWSI=0.65, humidity=75%, temp=24°C. What is the 
           most likely diagnosis and recommended action?"
   ```

3. **Evidence grounding:** Anchor diagnosis in sensor readings and known pathology:
   ```
   If (disease_predicted == "powdery_mildew" AND humidity > 70% AND temp 18–25°C):
       confidence += 0.2
   If (symptom_texture_match("fungal_spore_pattern") AND visual_area_affected > 30%):
       confidence += 0.15
   Otherwise if (predicted == "nutrient_deficiency" AND substrate_EC too high):
       confidence += 0.1  // EC too high typically masks N, K deficiency
   ```

4. **Structured output:** Return diagnosis with confidence, recommended action, and follow-up sensor targets:
   ```json
   {
     "diagnosis": "magnesium_deficiency",
     "confidence": 0.78,
     "ruling_out": ["powdery_mildew (humidity <70%, no spore morphology detected)"],
     "recommended_action": "Foliar spray Epsom salt 5g/L, reduce EC by 0.3 mS/cm",
     "monitor_metrics": ["CWSI", "Fv/Fm", "new_growth_color"],
     "recheck_days": 5
   }
   ```

### Published Benchmarks and Accuracy

**VLM crop diagnosis benchmarks (2024–2026):**
- **AgroBench (Shinoda et al. 2025):** Expert-annotated MCQA over 7 agricultural tasks (disease, pest, weed identification, management). VLMs tested: Qwen-VL, GPT-4V, LLaVA-NeXT. Top accuracy: 65–75% on disease identification (vs. 90%+ on simple classification tasks).
  
- **AgEval benchmark (Arshad et al. 2025):** Quantitative disease severity and plant stress detection. VLMs scored 55–70% on numerical severity estimates (0–100%).

- **PlantExpertVQA (2025):** Visual question-answering on plant physiology. Tested LLaVA-NeXT, GPT-4V. Accuracy 40–60% on complex multi-step reasoning (e.g., "Is this plant light-limited or water-stressed?").

**Failure modes:**
- Hallucinated diagnoses (predicting diseases not visible in image, especially rare ones).
- Confusion between similar symptoms (e.g., PM vs. early botrytis, N vs. Mg deficiency).
- Poor performance on low-resolution or indoor images with artificial lighting (reflections, color shifts).

### Design Pattern: Grounding + Rule Refinement

To reduce hallucination and improve accuracy in home setups:

```
1. Vision module (CNN/YOLO):
   - Detect and localize lesion / symptom region.
   - Extract morphology features (shape, color, texture).
   - Report confidence per detected feature.

2. Sensor-based rule engine:
   - Cross-tabulate detected features with environmental conditions.
   - Eliminate diagnoses contradicted by recent sensor history.
   
   Example rule:
     If symptom == "purple_coloration_on_leaves":
       If temp < 15°C for past 3 days: confidence(cold_stress) = 0.9
       Else if substrate_P_ppm < 30: confidence(phosphorus_deficiency) = 0.7
       Else: confidence(anthocyanin_pigmentation_normal) = 0.5

3. LLM reasoning layer:
   - Summarize evidence from vision + rules.
   - Generate diagnosis + management plan.
   - Explain reasoning to user.
   
   Prompt template:
     "Vision detected: [lesion list]. Sensors indicate: [EC, CWSI, NDVI values].
      Rules suggest: [top 3 diagnoses]. Which is most consistent? Why? What action?"

4. Feedback loop:
   - User confirms or corrects diagnosis.
   - Update rule weights and LLM few-shot examples.
```

**Home implementation:** Train a local LLaVA-NeXT or smaller open model (e.g., MobileVLM) on curated home grow images + labels (powdery mildew, N deficiency, water stress, healthy). Fine-tuning on 100–200 images (Lora adapter) improves accuracy to 70–80% on home conditions.

---

## 6. Pest and Disease Early Detection: Datasets and Image Requirements

### 6.1 Powdery Mildew and Botrytis (Fungal Pathogens)

**Published datasets:**
- **Grape Disease Dataset (PMC, 2024):** 3,622 high-quality images (224×224 to 1024×1024 px) covering powdery mildew, downy mildew, bacterial leaf spot. Public datasets: IDADP-Grape (SciDB), Grape dataset from UCI.
  
- **Grape disease YOLOv5 detection (2025):** Mask R-CNN with 2,565 images (split 1,114 train / 505 val / 495 test). Achieved 98.25% mAP for PM detection using standard leaf image (RGB, 480×640 px minimum).

**Machine learning approach:**
```
Architecture: YOLOv5 or YOLOv11 with coordinate attention (CA).
Training data: 500–1,000 images per disease.
Image spec: 640×480 px minimum (1080p preferred for fine spore detail).
Lighting: Diffuse natural or LED ring light (fungal spores reflect consistently; shadows confuse).
Augmentation: Rotation ±20°, brightness ±30%, blur σ=0.5–2 px (account for camera motion).

Reported accuracy:
  Powdery mildew: 96–98% (Mask R-CNN, YOLOv5)
  Botrytis (gray mold): 88–94% (harder: gray-brown lesions < PM white contrast)
  Early stage detection: 70–85% (pre-visible sporulation)
```

**Application to cannabis:**
- PM and botrytis are major threats in humid grows (Minnesota ≤4 flowering fits tight climate).
- Adapt grape dataset to cannabis via fine-tuning: acquire 200–300 cannabis leaf images with documented PM or botrytis, fine-tune YOLOv11 weights from grape-trained model (transfer learning, 5–10 epochs).
- Expected accuracy: 85–92% on cannabis after fine-tuning.

### 6.2 Spider Mites (Two-Spotted Spider Mite, TSSM)

**Published dataset and results:**
- **Strawberry spider mite detection (ScienceDirect, 2023):** 3,013 images collected via smartphone + macro lens (Motorola Moto E5 Play, iPhone XR). TSSM: 1,779 images; predatory mites: 1,234 images.

**Detection results:**
```
YOLOv4 input sizes tested: 160×160, 320×320, 640×640 px
  160 px:  accuracy ~0.85 (fast, misses fine detail)
  320 px:  accuracy ~0.91 (balance)
  640 px:  accuracy ~0.933 (slow, but captures mite morphology and damage)

Faster R-CNN:     accuracy ~0.863 (slower inference, slightly lower accuracy)
YOLOv4 vs. R-CNN: No significant difference on 640×640 images.
```

**Image specifications for TSSM detection:**
```
Resolution:  640×640 px minimum (1080p full-frame recommended; see below)
Lighting:    Ring light or diffuse LED perpendicular to leaf (backlighting suppresses mite visibility)
Focus:       Macro lens or high-zoom (25×–40×) to resolve individual mites (~0.4 mm body length)
Sample area: 2–5 leaves per plant, multiple angles (upper, lower surface)
Frequency:   2–3× per week (TSSM reproduces in 7–10 days)
```

**Smartphone capture for home grow:**
- Use iPhone XR or equivalent (reported best accuracy in strawberry dataset).
- Macro clip lens (~$15–30) to achieve 25–30× magnification.
- Mount leaf flat on LED lightbox or against white background.
- Capture 5 images per leaf (different focus depths), select sharpest.
- Crop to 640×640 (mite + surrounding leaf) and pass to YOLOv4.

**Home training workflow:**
1. Acquire 100–150 images of healthy cannabis leaves + 50–100 images with spider mites at various population densities.
2. Label mites and damage patterns with bounding boxes (CVAT, Roboflow, or similar).
3. Fine-tune YOLOv4 weights (COCO pre-trained) on this dataset (10–15 epochs, batch size 8–16).
4. Achieve ~85–90% detection on home cannabis images after fine-tuning.

### 6.3 Integrated Multi-Pest Detection

**Multi-pest dataset example (strawberry, UNet):**
- Small-sample dataset: aphids, thrips, spider mites, whiteflies, beet armyworms, *Spodoptera litura*.
- Captured at 1080p (Intel RealSense camera); cropped to 640×480 inference tiles.
- UNet-based segmentation (rather than detection boxes) for dense infestations.
- Accuracy: 82–89% per-pest class, 88% mAP across all pests.

**Scaling to cannabis:**
- Cannabis pests (home scale): spider mites, whiteflies, fungus gnats, aphids, thrips, powdery mildew, botrytis.
- Curate dataset: 200–300 images per pest type, balanced classes.
- Train YOLOv11 (Ultralytics) or Mask R-CNN segmentation on combined dataset.
- Expected overall mAP: 80–90% after fine-tuning; 70–80% zero-shot from grape/strawberry pre-trained weights.

---

## 7. Integration Example: Autonomous Canopy and Water Management Loop

A minimal viable system ties together crop steering, digital twins, and sensing:

```python
# Pseudocode: Daily sensor read and irrigation trigger

import numpy as np
from datetime import datetime
import subprocess  # Call YOLOv11 for disease image if captured

# 1. Read substrate sensors (VWC, EC, T)
vwc_pct = substrate_sensor.read_vwc()
ec_ms = substrate_sensor.read_ec()
substrate_temp = substrate_sensor.read_temp()

# 2. Read canopy sensors
cwsi = thermal_camera.compute_cwsi(air_temp, humidity)
ndvi = camera_nir.compute_ndvi_from_latest_image()
fv_fm = pam_fluorometer.measure()  # if scheduled

# 3. Estimate thermal time
gdd = (max_air_temp + min_air_temp) / 2.0 - 10.0  # base 10°C
gdd_cumulative += gdd
# at a 25 °C day / 21 °C night mean (23 °C), a 10 °C base accrues ~13 GDD/day

# 4. Retrieve target VWC for current phase
phase = determine_phase(days_since_flower_start, photoperiod)
# phase = "vegetative" | "early_flower" | "peak_flower" | "late_flower"
target_vwc_min, target_vwc_max, target_ec, target_dryback = PHASE_TARGETS[phase]

# Example:
# PHASE_TARGETS["peak_flower"] = (40, 55, 3.2, 25)  # min, max %, EC, dryback %

# 5. Compute current dryback (from load cell or VWC history)
vwc_max_today = max(vwc_history_24h)
dryback_pct = ((vwc_max_today - vwc_pct) / vwc_max_today) * 100

# 6. Rule-based irrigation trigger
should_irrigate = False
reason = ""

if vwc_pct < target_vwc_min:
    should_irrigate = True
    reason = f"VWC {vwc_pct:.1f}% below target {target_vwc_min}%"
elif dryback_pct > target_dryback and time_since_last_irrigation > min_interval_hours:
    should_irrigate = True
    reason = f"Dryback {dryback_pct:.1f}% exceeds target {target_dryback}%"

if should_irrigate and ec_ms > target_ec + 0.5:
    # High EC may indicate water uptake problem
    reason += " (warning: substrate EC high; check for salt stress)"
    should_irrigate = False  # Defer irrigation; water with lower-EC solution next time

# 7. Stress and disease flags
if cwsi > 0.7:
    alert("SEVERE WATER STRESS: CWSI {:.2f}. Check for leaks or blocked drippers.".format(cwsi))
elif cwsi > 0.65 and phase != "peak_flower":
    alert("Unexpected water stress in {}. Reduce EC or increase irrigation frequency.".format(phase))

if fv_fm < 0.70:
    alert("Photosynthetic stress: Fv/Fm {:.2f}. Diagnose light, nutrient, or temperature issue.".format(fv_fm))

if ndvi < 0.5:
    alert("Low NDVI {:.2f}: canopy sparse. Nutrient or light imbalance likely.".format(ndvi))

# 8. Optional: Capture and diagnose image if light conditions and time since last diagnosis suitable
if (datetime.now().hour == 12 and  # noon; peak light
    days_since_last_disease_check > 3):
    
    # Capture leaf image
    image_path = camera_vis.capture("canopy_leaf.jpg")
    
    # Run YOLOv11 on image
    disease_result = subprocess.run(
        ["yolo", "detect", "predict", f"model=yolov11_cannabis_disease.pt", f"source={image_path}"],
        capture_output=True, text=True
    )
    
    if "powdery_mildew" in disease_result.stdout or "botrytis" in disease_result.stdout:
        # High-confidence detection; also check environmental predisposition
        if humidity_24h_mean > 75 and temp_24h_mean in (18, 25):
            alert("Disease risk: {} detected + high humidity + cool temp. Increase airflow. Reduce EC.".format(...))

# 9. Log state
log_entry = {
    "timestamp": datetime.now().isoformat(),
    "vwc": vwc_pct,
    "ec": ec_ms,
    "cwsi": cwsi,
    "ndvi": ndvi,
    "fv_fm": fv_fm,
    "phase": phase,
    "irrigated": should_irrigate,
    "reason": reason,
    "gdd_cumulative": gdd_cumulative,
}
database.log_sensor_data(log_entry)

# 10. If irrigating: execute and record
if should_irrigate:
    shot_size_ml = PHASE_TARGETS[phase]["shot_size_ml"]  # e.g., 1500 mL for 10L pot
    solution_ec = target_ec - 0.2  # Feed slightly below target to account for uptake differential
    pump.dispense(shot_size_ml, solution_ec)
    
    # Log irrigation event
    database.log_irrigation({
        "timestamp": datetime.now().isoformat(),
        "shot_size_ml": shot_size_ml,
        "solution_ec": solution_ec,
        "post_irrigation_vwc": substrate_sensor.read_vwc(),
    })

# 11. Update Bayesian GP model (every 5 irrigations or weekly)
if should_update_model():
    recent_harvests = database.get_yields_last_30_days()
    if len(recent_harvests) >= 2:
        gp_surrogate.fit(
            X=recent_harvests[["mean_ec", "mean_dryback", "mean_temp", "peak_ppfd"]],
            y=recent_harvests["yield_g"]
        )
        next_setpoint = optimize_acquisition_function(gp_surrogate)
        alert(f"Recipe update: Recommend next cycle EC={next_setpoint['ec']:.2f}, dryback={next_setpoint['dryback']:.0f}%")
```

---

## References

### Crop Steering

- PhenoDatabase. "Crop Steering Guide." https://phenodb.eu/crop-steering-guide. Accessed 2026.
- Royal Queen Seeds. "Crop Steering: Lessons from CRIC Labs Trials." https://www.royalqueenseeds.com/blog-crop-steering-royal-queen-seeds-trials-at-cric-labs-n1832.
- Trym, Inc. "Grower's Guide to Crop Steering." https://trym.io/wp-content/uploads/2023/04/Trym-Growers-Guide-to-Crop-Steering_03.23.pdf. March 2023.
- HydroTek Hydroponics. "Getting the Most Out of Stone Wool Based Cultivation." https://www.hydrotekhydroponics.com/getting-the-most-out-of-stone-wool-based-cultivation.
- Aroya. "Basics of Cannabis Cultivation." https://www.aroya.io/education-guides/basics-cannabis-cultivation.
- FloraFlex. "Crop Steering Irrigation Strategy: The Commercial Grower's Precision Guide." https://www.floraflex.com/EU/blog/post/crop-steering-techniques-enhanced-yields.

### Light Use Efficiency and Cannabis Growth Models

- Rodriguez-Morrison, H., et al. "Cannabis Yield, Potency, and Leaf Photosynthesis Respond Differently to Increasing Light Levels in an Indoor Environment." *Frontiers in Plant Science*, vol. 12, 2021. https://pmc.ncbi.nlm.nih.gov/articles/PMC8144505/.
- Jumplights. "Using High Light Levels: Yield and Energy Use of Indoor Grown Cannabis." https://jumplights.com/using-high-light-levels.

### Plant Digital Twins and Thermal Time

- Development of a Tomato Functional–Structural Plant Model. *In Silico Plants*, 2023. https://academic.oup.com/insilicoplants/article/7/2/diaf022/8342854.
- Soil-Temperature-Compensated Growing Degree Days. *Plants*, vol. 15, no. 14, 2025. https://doi.org/10.3390/plants15142163.
- Montana Extension Store. "Using Growing Degree Days to Predict Plant Stages." https://extension-store.montana.edu/montguides/using-growing-degree-days-to-predict-plant-stages.

### Bayesian Optimization and Recipe Optimization

- Flavor-Cyber-Agriculture: Optimization via Surrogate Modeling. *PLOS ONE*, 2018. https://journals.plos.org/plosone/article?id=10.1371%2Fjournal.pone.0213918.
- Bayesian Optimization Against Climate Change: Applications and Benchmarks. *arXiv*, 2023. https://arxiv.org/pdf/2306.04343.
- Autonomous Drug Design with Multi-Armed Bandits. *arXiv*, 2022. https://arxiv.org/pdf/2207.01393.

### Thermal Imaging and CWSI

- Crop Water Stress Sensor (DIY Project). Hackaday. https://hackaday.io/project/187090-crop-water-stress-sensor.
- Water Stress Index Detection Using Low-Cost Infrared Sensor and Image Processing. *Sensors*, vol. 23, no. 3, 2024. https://doi.org/10.3390/s23031318.
- Smart Crop Water Stress Index IoT Solution for Precision Irrigation. *Frontiers in Plant Science*, 2024. https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10780677/.
- Development of Low-Cost Thermal Imaging System for Water Stress Monitoring in Indoor Farming. *ScienceDirect*, 2025. https://www.sciencedirect.com/science/article/pii/S2772375525002813.
- Leaf Temperature and Crop Water Stress Index as Indicators in Medicinal Plants. *Stress*, 2026. https://link.springer.com/article/10.1007/s44473-026-00251-0.

### Acoustic Emissions from Stressed Plants

- Khait, I., et al. "Sounds Emitted by Plants Under Stress Are Airborne and Informative." *Cell*, vol. 186, no. 7, 2023, pp. 1328–1336. https://www.cell.com/cell/fulltext/S0092-8674(23)00222-2.
- Plant Bioacoustics: The Sound Expression of Stress. Science News, 2023. https://www.sciencenews.org/article/plant-stress-ultrasonic-click-noise-sound.

### Chlorophyll Fluorescence

- Tracking Canopy Chlorophyll Fluorescence with Low-Cost LED Platform. *AoB PLANTS*, vol. 15, 2023. https://academic.oup.com/aobpla/article/15/5/plad069/7320385.
- Low-Cost Chlorophyll Fluorescence Imaging for Stress Detection. *Remote Sensing*, vol. 10, 2021. https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7999708/.
- Development of Low-Cost Autonomous PAM Fluorometer for Photosystem II Monitoring. *arXiv*, 2024. https://arxiv.org/pdf/2511.13580.

### NDVI and NIR Canopy Imaging

- NDVI Derived from Near-Infrared Digital Cameras: Applicability Across Plant Types. *Remote Sensing of Environment*, vol. 215, 2018. https://www.researchgate.net/publication/320983408_NDVI_derived_from_near-infrared-enabled_digital_cameras.
- Strategy for Smart NDVI Camera System Development. *PMC*, 2013. https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3649405/.

### Load Cells and Pot Weight Sensors

- Characterization of Plant Behavior Using Transpiration and Water Uptake Rate. US Patent 10897849, 2021. https://image-ppubs.uspto.gov/dirsearch-public/print/downloadPdf/10897849.
- Plant-Ditech: Gravimetric Phenotyping Guide. https://www.plant-ditech.com/?p=4818.
- ICT International. PWS-100 Precision Scale Datasheet. https://www.ictinternational.com/Production/product/precision-scale.

### Sap Flow and Stem Diameter

- Plant-Based Sensors for Irrigation. Agriculture Victoria, Australia. https://agriculture.vic.gov.au/farm-management/water/irrigation/irrigation-factsheets-and-resources/Plant-based-sensors-for-irrigation.pdf.
- Aranet TDSKT102 Sap Flow Sensor Datasheet. https://assets.aranet.com/documents/Aranet_Datasheet_TDSKT102_Sap_flow_sensor.pdf.
- Phyto-Sensor. Stem Microvariations Sensors (SD-xT series) Manual. https://phyto-sensor.com/manuals/T-series/SD-xT-485M-Stem-Microvariations-Sensors-Manual.pdf.

### LLM and VLM Crop Diagnosis

- PlantExpertVQA: Vision-Language Models for Plant Science. *arXiv*, 2024. https://arxiv.org/pdf/2508.17117.
- Using Vision Language Foundation Models for Plant Simulation. *arXiv*, 2026. https://arxiv.org/pdf/2603.08930.
- Advanced Site-Specific Disease and Pest Management via Foundation Models. *arXiv*, 2025. https://arxiv.org/pdf/2510.24650.
- CPJ: Explainable Agricultural Pest Diagnosis via Caption-Prompt-Judge. *arXiv*, 2024. https://arxiv.org/pdf/2512.24947.
- VLM-MCPDD: Interpretable Multi-Crop Pest and Disease Diagnosis. *Applied Sciences*, vol. 16, no. 11, 2025. https://doi.org/10.3390/app16115719.
- Agro-Consensus: Semantic Self-Consistency in VLMs for Crop Disease Management. *arXiv*, 2025. https://arxiv.org/pdf/2510.21757.

### Powdery Mildew and Botrytis Detection

- Dataset-Centric Benchmark of Deep Learning for Grape Leaf Disease Classification. *arXiv*, 2025. https://arxiv.org/pdf/2608.20608.
- Disease Detection in Grape Cultivation Using Strategic Cameras and Machine Learning. *ResearchGate*, 2025. https://www.researchgate.net/publication/382374800_Disease_Detection_in_Grape_Cultivation_Using_Strategically_Placed_Cameras_and_Machine_Learning_Algorithms_with_a_Focus_on_Powdery_Mildew_and_Blotches.
- Early Prediction of Grape Disease Attack Using Hybrid Classifiers and IoT Sensors. *PMC*, 2024. https://pmc.ncbi.nlm.nih.gov/articles/PMC11462189/.
- Grape Dataset for Disease Prediction. *PMC*, 2024. https://pmc.ncbi.nlm.nih.gov/articles/PMC11190471/.
- Automated Detection of Downy and Powdery Mildew for Vineyard Management. *ScienceDirect*, 2025. https://www.sciencedirect.com/science/article/pii/S2772375525001108.

### Spider Mites Detection

- Detecting Two-Spotted Spider Mites and Predatory Mites in Strawberry Using Deep Learning. *Computers and Electronics in Agriculture*, vol. 205, 2023. https://www.sciencedirect.com/science/article/pii/S277237552300059X.
- Automated Detection and Quantification of Spider Mite Life Stages Using Computer Vision. *PLOS ONE*, vol. 19, no. 12, 2024. https://pmc.ncbi.nlm.nih.gov/articles/PMC12747362/.
- Improved UNet Recognition for Multiple Strawberry Pests. *Agronomy*, vol. 15, no. 10, 2025. https://doi.org/10.3390/agronomy15102252.
- Recognition of Spider Mite Infestations via Hyperspectral UAV Imaging. *PMC*, 2023. https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9932681/.

