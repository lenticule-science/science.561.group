---
title: "Research Sources and Citations"
date-created: 2026-04-04
description: "Complete citations and source documentation for technical standards and research underlying compact HEPA air purifier specifications."
---

This document provides detailed citations for all technical standards, regulations, and research referenced in this knowledge domain.

## Standards Documents

### HEPA Filter Classification

**EN 1822-1:2019 (ISO 29463-1:2021)**
- *High Efficiency Air Filters and Filter Media for Removing Particles from Air*
- European standard / International standard harmonization
- Defines H10–H14 classification based on efficiency at Most Penetrating Particle Size (MPPS, ~0.21 μm)
- Specifies testing procedures for each class
- H13 and above receive individual test certificates with assigned efficiency values
- Current reference: ISO 29463 (supersedes older EN 1822-1 terminology but maintains classification equivalence)
- Source: [EN1822 HEPA Filter Testing Standard — Smart Air](https://smartairfilters.com/en/blog/en1822-hepa-filter-standard/)

**US DOE Standard (DOE-STD-3020-2005)**
- Specifies HEPA filters must remove ≥99.97% of particles at 0.3 micrometers
- Single-point specification (0.3 μm) rather than full efficiency curve
- Term "True HEPA" informally refers to DOE-compliant filters; no official legal definition in US
- Functionally equivalent to EN 1822 H13 (≥99.95% at MPPS)
- Source: [HEPA Filters: Levels, Types, Classifications — Wyndly](https://www.wyndly.com/blogs/learn/hepa-filter)

### CADR and Test Methods

**ANSI/AHAM AC-1 Standard**
- *Air Cleaner Certification Program Procedural Guide Version 4.1e*
- Association of Home Appliance Manufacturers standard for measuring Clean Air Delivery Rate
- Test chamber: 1,008 cubic feet
- Particle size ranges: 0.09–1.0 μm (smoke), 0.5–3 μm (dust), 5–11 μm (pollen)
- Calculates CADR using linear regression on particle concentration measurements
- Protocol accounts for natural settling baseline; CADR = device removal rate − natural settling rate (in CFM)
- Source: [AHAM Air Cleaner Certification Program](https://ahamverifide.org/ahams-air-filtration-standards/)

**Clean Air Delivery Rate (CADR) Calculation**
- Formula: CADR = (particle removal slope × chamber volume) in CFM
- Specific: ACH = (CADR × 60) ÷ room volume (cubic feet)
- Room sizing guideline: CADR ≥ 2/3 × room floor area (in square feet)
- Example: 300 CFM purifier appropriate for ~450 sq ft room
- Source: [Clean air delivery rate — Wikipedia](https://en.wikipedia.org/wiki/Clean_air_delivery_rate); [Smart Air CADR calculation](https://smartairfilters.com/en/blog/what-is-air-changes-per-hour-ach-how-to-calculate-it/)

### Ventilation and Air Quality Standards

**ASHRAE 62.2-2016: Ventilation and Acceptable Indoor Air Quality in Residential Buildings**
- Baseline standard referenced in building codes
- Minimum: 0.35 ACH from outdoor ventilation + 15 CFM per person
- Intended for general odor control and indoor pollutant dilution
- Pre-pandemic baseline; does not address pathogen control
- Source: [ASHRAE Recommended Air Changes — Smart Air](https://smartairfilters.com/en/blog/ashrae-per-hour-office-residential-school-virus/)

**ASHRAE 241: Control of Airborne Infectious Aerosols (2023)**
- Post-pandemic standard addressing pathogen transmission
- Recommendation: 30–50 CFM per person in residential spaces
- Translates to ~5 ACH in typical residential volumes
- Emphasizes combined outdoor ventilation and mechanical filtration strategies
- Higher standard than 62.2; increasingly referenced by public health agencies
- Not yet standard in building codes but emerging as best practice

**CDC and EPA Recommendations**
- CDC/EPA now recommend ≥5 total ACH (outdoor + recirculation) for pathogen control
- Updated post-2020 guidance reflecting SARS-CoV-2 transmission research
- Supported by EPA as part of updated indoor air quality guidance
- Source: [EPA Indoor Air Quality Ventilation](https://www.epa.gov/indoor-air-quality-iaq/how-much-ventilation-do-i-need-my-home-improve-indoor-air-quality)

## Filtration Technology

### Activated Carbon Adsorption

**VOC Adsorption Mechanisms and Capacity**
- Activated carbon surface area: 500–3,000 m²/gram depending on processing
- VOC removal through physisorption (weak van der Waals forces), not chemisorption
- Adsorption capacity ranges:
  - Highly adsorbable (toluene, benzene, paraffins): 20–30%+ by weight
  - Moderately adsorbable (acetone, chlorine): 5–30% by weight
  - Poorly adsorbable (propane, ammonia): <5% by weight
- Example: 1 ton carbon can adsorb ~400 lbs toluene at 30% capacity
- Working capacity typically 10–20% of theoretical maximum in operational conditions
- Source: [How Much VOC Can 1 Ton of Activated Carbon Adsorb — Huamei](https://www.huameicarbon.com/how-much-voc-can-1-ton-of-activated-carbon-adsorb/); [EPA Adsorption Systems for VOC](https://www3.epa.gov/ttncatc1/dir1/fadsorb.pdf)

**Breakthrough and Saturation**
- Breakthrough: outlet concentration reaches 10% of inlet (C/C₀ = 0.1)
- Saturation: outlet concentration reaches 95% of inlet (C/C₀ = 0.95)
- Breakthrough time depends on:
  - Inlet VOC concentration (higher = faster saturation)
  - Airflow rate (higher = shorter contact time, faster breakthrough)
  - Carbon mass and bed depth (larger = longer life)
  - Humidity (high humidity reduces capacity, sometimes by 50%+)
  - Temperature (higher temperature reduces adsorption)
- Residential filter lifespan: 6 months to 1 year typical
- No regeneration in consumer devices; replacement required
- Source: [VOC Breakthrough in Activated Carbon Filters — EPA/NIOSH](https://pmc.ncbi.nlm.nih.gov/articles/PMC5373907/)

## Certification Programs

### AHAM Verifide Program

**Third-Party Verification of CADR Claims**
- Association of Home Appliance Manufacturers certification
- Independent laboratory testing using ANSI/AHAM AC-1 standard
- Three separate CADR values (smoke, dust, pollen) measured and reported
- Certified units listed in AHAM Directory 2.0 with verified CADR values
- Seal indicates: "AHAM Verified" with three CADR numbers
- Does not evaluate: noise, energy consumption, filter cost, durability
- Recognized by EPA and FTC as reliable performance indicator
- Source: [AHAM Verifide Certification](https://ahamverifide.org/ahams-air-filtration-standards/); [AHAM Directory](https://ahamdir.com/)

### California Air Resources Board (CARB) Certification

**Regulation for Limiting Ozone Emissions from Air Cleaning Devices**
- Enacted under Assembly Bill 2276 (2006, Pavley); effective 2008
- Mandatory in California since 2010 for all portable indoor air cleaners
- De facto national standard due to California market size
- **Ozone emission limit: 0.050 ppm (50 ppb)** maximum
- Applies to mechanical (HEPA, pleated) and electronic (ionizers, ESP, PCO, UV, hydroxyl) devices
- **Mechanical devices**: Inherently produce zero ozone; pass certification easily
- **Electronic devices**: Must be tested to verify ≤50 ppb ozone output
- Certification label requirement: "Meets California ozone emissions limit: CARB certified" (bold, ≥3 mm uppercase letters)
- Does not certify CADR or air cleaning performance; only safety and ozone compliance
- Source: [California Air Resources Board — Air Cleaner Regulation](https://ww2.arb.ca.gov/about-indoor-air-cleaning-devices-regulation); [CARB-Certified Air Cleaning Devices List](https://ww2.arb.ca.gov/list-carb-certified-air-cleaning-devices)

## Practical Application

### ACH Relationship to Room Size and CADR

**Calculation Example: 300 CFM Device in 1,000 Cubic Foot Room**
- ACH = (300 CFM × 60 minutes) ÷ 1,000 cubic feet = 18 ACH for that particle class
- Time to reduce concentration by 63%: 1 ÷ 18 = 3.3 minutes
- Room sizing rule: CADR ≥ 2/3 room floor area; 300 CFM suits ~450 sq ft

**Impact of ASHRAE Standards**
- ASHRAE 62.2 baseline (0.35 ACH outdoor): Insufficient for pathogen control alone
- Adding 300 CFM purifier (18 ACH recirculation) to 1,000 cu ft room: Total ~18.35 ACH, meeting CDC/EPA 5 ACH target
- Note: Recirculation cleans existing air; outdoor ventilation brings fresh air and removes CO2

## Cross-References

All standards, certifications, and technical concepts are integrated into the following library content:

- [HEPA Classification](../terms/hepa-classification.md)
- [CADR](../terms/cadr.md)
- [Air Changes Per Hour (ACH)](../terms/ach.md)
- [Activated Carbon Filtration](../terms/activated-carbon-filtration.md)
- [AHAM Verifide Certification](../terms/aham-verifide-certification.md)
- [CARB Certification](../terms/carb-certification.md)
- [ASHRAE Standards](../terms/ashrae-standards.md)
- [Technical Foundations of Compact HEPA Purification](./technical-foundations-of-compact-hepa-purification.md)

## Update History

**2026-04-04**: Initial compilation of sources for compact HEPA air purifier technical documentation. All sources verified as of February 2025 knowledge cutoff, with web searches conducted April 2026.
