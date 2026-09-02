---
title: "Levoit Compact HEPA Purifiers: Core Mini and LV-H132"
text-type: survey
date-created: 2026-04-04
description: "A technical comparison of two compact Levoit HEPA purifiers — the Core Mini and the LV-H132 — covering filtration class, CADR, noise, power, and independent test results. Maps the gap between manufacturer claims and independent measurement."
references:
  en-1822-2019:
    authors: ["European Committee for Standardization"]
    title: "EN 1822-1:2019 — High efficiency air filters (EPA, HEPA and ULPA)"
    publication: "CEN"
    year: 2019
  aham-ac-1-2020:
    authors: ["Association of Home Appliance Manufacturers"]
    title: "ANSI/AHAM AC-1-2020 — Method for Measuring Performance of Portable Household Electric Room Air Cleaners"
    publication: "AHAM"
    year: 2020
  ashrae-62-2-2022:
    authors: ["American Society of Heating, Refrigerating and Air-Conditioning Engineers"]
    title: "ASHRAE Standard 62.2-2022 — Ventilation and Acceptable Indoor Air Quality in Residential Buildings"
    publication: "ASHRAE"
    year: 2022
  ashrae-241-2023:
    authors: ["American Society of Heating, Refrigerating and Air-Conditioning Engineers"]
    title: "ASHRAE Standard 241 — Control of Infectious Aerosols"
    publication: "ASHRAE"
    year: 2023
  epa-residential-guide-2024:
    authors: ["U.S. Environmental Protection Agency"]
    title: "Guide to Air Cleaners in the Home"
    publication: "EPA"
    year: 2024
  carb-regulation-2010:
    authors: ["California Air Resources Board"]
    title: "Regulation for Limiting Ozone Emissions from Indoor Air Cleaning Devices"
    publication: "CARB"
    year: 2010
  housefresh-core-mini-2023:
    authors: ["HouseFresh"]
    title: "Levoit Core Mini Air Purifier Review"
    publication: "HouseFresh"
    year: 2023
  housefresh-lv-h132-2023:
    authors: ["HouseFresh"]
    title: "Levoit LV-H132 Air Purifier Review"
    publication: "HouseFresh"
    year: 2023
---

## The Problem

How well does a $40 air purifier actually clean air? Compact HEPA purifiers promise hospital-grade filtration in a device the size of a water bottle, but the relationship between filter class, airflow rate, room size, and real-world particle removal is not obvious from a spec sheet. Two numbers that sound similar — "H13 HEPA" and "True HEPA" — may or may not mean the same thing. A CADR rating of 45 CFM sounds low, but low compared to what, and for what room?

This survey examines two of Levoit's most popular compact models — the **Core Mini** and the **LV-H132** — as a concrete case study in reading air purifier specifications critically. The goal is not a purchase recommendation but an exercise in understanding what these numbers mean, where manufacturer claims and independent measurements diverge, and what the underlying standards actually require.

## Filtration Standards: What "HEPA" Means

The word "HEPA" is used loosely in consumer marketing. Two distinct standards define it.

**EN 1822 / ISO 29463** (European/international) classifies filters by efficiency at the Most Penetrating Particle Size (MPPS), typically around 0.12-0.25 micrometers. The relevant grades:

| Class | Efficiency at MPPS |
|-------|-------------------|
| H10   | 85%               |
| H11   | 95%               |
| H12   | 99.5%             |
| H13   | 99.95%            |
| H14   | 99.995%           |

**U.S. DOE standard** defines HEPA as 99.97% efficient at 0.3 micrometers. This is roughly equivalent to H13 under EN 1822, though the test particle size differs — 0.3 micrometers is larger than MPPS, so the DOE test is slightly less demanding at the hardest-to-capture size.

The marketing term **"True HEPA"** has no regulatory definition. It typically implies the DOE standard (99.97% at 0.3 micrometers) but is not verified by the use of the phrase alone. What matters is whether the filter has been tested to a named standard and whether a third party verified the claim.

### What These Two Units Claim

Both the **Core Mini** and the **LV-H132** are marketed with "H13 True HEPA" filters, claiming 99.97% capture of particles at 0.3 micrometers. Neither unit's AHAM Verifide certification covers filter efficiency class directly — AHAM verifies CADR, not filter grade. The H13 claim is manufacturer-stated.

Both use a **three-stage filtration** system:

1. **Pre-filter** — captures large particles (hair, lint, dust). The Core Mini uses an integrated fiber pre-filter; the LV-H132 uses a washable foam pre-filter.
2. **H13 HEPA media** — the primary particle capture stage.
3. **Activated carbon layer** — adsorbs VOCs, smoke compounds, and odors.

The carbon layer in both units is integrated into the replacement filter cartridge. Neither manufacturer discloses the weight of activated carbon in the filter. This matters because carbon adsorption capacity is directly proportional to mass — a thin impregnated sheet performs very differently from 200 grams of granular carbon, and without the weight, the VOC removal claim is unverifiable.

## CADR: What the Numbers Mean

Clean Air Delivery Rate measures the volume of filtered air a purifier delivers per minute, tested under the **AHAM AC-1** protocol. The test places the unit in a sealed 1,008-cubic-foot chamber, introduces a controlled pollutant, and measures the decay rate of airborne particles with the purifier running. CADR is reported in cubic feet per minute (CFM) for three particle types:

- **Smoke** (0.09-1.0 micrometers) — the smallest and hardest to capture
- **Dust** (0.5-3.0 micrometers) — mid-range
- **Pollen** (5.0-11.0 micrometers) — largest, easiest to capture

Higher CADR means more clean air delivered. CADR accounts for both filter efficiency and airflow — a perfect filter with no airflow has zero CADR.

### Measured CADR

| Metric | Core Mini | LV-H132 |
|--------|-----------|---------|
| **Smoke CADR** | 34 CFM | Not separately reported |
| **Dust CADR** | 45 CFM | 40 CFM (manufacturer-stated) |
| **Pollen CADR** | 32 CFM | Not separately reported |
| **AHAM Verifide** | Yes | Yes |

The LV-H132's CADR situation has a significant data quality problem. Various sources report wildly different numbers: the manufacturer states 35 CFM in some listings, Amazon listings cite an AHAM-verified 110 CFM for all three categories, and independent estimates land around 40-70 CFM. The 110 CFM figure appears on some retailer pages but is implausible for a 28W unit of this size — it would imply performance comparable to the much larger Levoit Core 300. Until the discrepancy is clarified against AHAM's directory directly, the manufacturer's own 35-40 CFM range is the most conservative and likely accurate figure.

The Core Mini's CADR is more consistent across sources: 45/34/32 (dust/smoke/pollen), confirmed by AHAM Verifide and roughly corroborated by HouseFresh's independent measurement of 41 CFM for PM2.5.

## Room Coverage and Air Changes Per Hour

CADR alone does not tell you whether a purifier works in your room. What matters is **air changes per hour (ACH)**: how many times per hour the purifier can filter the entire volume of air in the space.

The formula: **ACH = (CADR in CFM x 60) / Room Volume in cubic feet**

For an 8-foot ceiling, room volume is simply square footage times 8.

What ACH levels mean in practice:

- **1 ACH** — minimal effect; the purifier is barely keeping up with new pollutant introduction
- **2 ACH** — AHAM's "2/3 rule" suggests sizing a purifier so its CADR is 2/3 the room's square footage, yielding roughly 2 ACH
- **4-5 ACH** — effective allergen and particulate reduction. The CDC and EPA recommend at least 5 total ACH (from all sources, including HVAC) for pathogen reduction in occupied spaces.
- **6+ ACH** — clinical-grade air turnover; what hospitals target for patient rooms

### Calculated ACH by Room Size

Using manufacturer dust CADR (the most favorable number for each unit):

| Room Size | Core Mini (45 CFM) | LV-H132 (40 CFM) |
|-----------|--------------------|--------------------|
| **50 sq ft** (bathroom) | 6.8 ACH | 6.0 ACH |
| **100 sq ft** (small bedroom) | 3.4 ACH | 3.0 ACH |
| **150 sq ft** (bedroom) | 2.3 ACH | 2.0 ACH |
| **200 sq ft** (large bedroom) | 1.7 ACH | 1.5 ACH |
| **250 sq ft** (manufacturer-rated) | 1.4 ACH | 1.2 ACH |

Both manufacturers claim coverage of approximately 250 square feet. At that size, neither unit delivers even 2 ACH — they are performing barely above natural air exchange from infiltration alone. The EPA's guidance for portable air cleaners suggests a minimum of 4-5 ACH for meaningful particle reduction. By that standard, these units are effective in rooms of roughly 50-75 square feet: a bathroom, a walk-in closet, or an immediate desk area.

HouseFresh's independent testing corroborates this. They measured the Core Mini as effective in 61-72 square feet at 5 ACH. The LV-H132 took 98 minutes to clear pollutants in a 705-cubic-foot test room (approximately 88 square feet with an 8-foot ceiling), which HouseFresh characterized as poor performance.

## Noise

| Speed | Core Mini | LV-H132 |
|-------|-----------|---------|
| **Low / Sleep** | 25-27 dB | 25 dB |
| **Medium** | 34-38 dB | ~49 dB |
| **High** | 44-45 dB | 46-58 dB |

The Core Mini is notably quieter across all speeds. Its maximum of 44-45 dB is comparable to a quiet library. The LV-H132 shows significant measurement variance at high speed — HouseFresh measured 46 dB, while other sources report up to 58 dB, suggesting either measurement methodology differences or unit-to-unit variation.

For reference: 25 dB is near-silent (quieter than a whisper at 5 feet), 40 dB is a quiet room, 50 dB is moderate office noise, and 60 dB is normal conversation volume.

Both units are quiet enough at their lowest settings for nighttime use. At maximum speed — where they deliver their rated CADR — the LV-H132 may be noticeable in a quiet room.

## Power Consumption

| Metric | Core Mini | LV-H132 |
|--------|-----------|---------|
| **Rated maximum** | 7W | 28W |
| **Low speed** | 1.2W | 12.6W |
| **High speed** | 6.4-6.6W | 15-28W |
| **Standby** | Not specified | 0.8W |
| **Annual cost (24/7, high speed)** | ~$5 | ~$25 |

The Core Mini draws remarkably little power — less than a phone charger at full speed. The LV-H132 draws 4x more at the wall for roughly comparable (or slightly lower) CADR. Both are Energy Star certified, but the Core Mini is dramatically more efficient per CFM delivered.

Annual operating costs assume $0.12/kWh. Neither unit's electricity cost is significant in absolute terms.

## Filter Life and Replacement Cost

| Metric | Core Mini | LV-H132 |
|--------|-----------|---------|
| **Replacement interval** | 4-8 months | 6-8 months |
| **Filter part number** | Core Mini-RF | LV-H132-RF |
| **Replacement cost** | ~$25 | ~$23 |
| **Annual filter cost (est.)** | $38-75 | $35-46 |

Both units use proprietary cylindrical filter cartridges that integrate all three stages (pre-filter, HEPA, carbon) into a single replaceable unit. Filter life depends heavily on ambient air quality — a unit running in a dusty workshop will saturate its pre-filter far faster than one in a clean bedroom.

Neither manufacturer publishes filter life in hours or in particle loading capacity (grams of dust held before pressure drop exceeds threshold). The replacement interval is a rough guideline, not a measured endpoint.

## Certifications

Both units carry:

- **AHAM Verifide** — CADR independently tested and verified
- **Energy Star** — meets EPA energy efficiency criteria for room air cleaners
- **CARB certified** — meets California Air Resources Board ozone emission limits (below 0.050 ppm / 50 ppb). Neither unit produces ozone, as they use only mechanical filtration with no ionizer, UV, or electrostatic components
- **ETL listed** — electrical safety tested
- **FCC compliant** — electromagnetic interference standards

CARB certification is worth noting because it is functionally a national standard — any air purifier sold in California must meet it, and most manufacturers certify their full product line. Mechanical HEPA purifiers inherently comply because they generate no ozone, but the certification confirms the unit was tested.

## Independent Testing vs. Manufacturer Claims

The most instructive aspect of these two units is where independent measurement diverges from the spec sheet.

**Room coverage** is the largest gap. Both manufacturers claim ~250 square feet. Independent testing (HouseFresh) shows meaningful performance only in 60-100 square feet. The manufacturer number uses 1 ACH — technically true, practically useless for health-relevant air cleaning.

**CADR** is reasonably honest for the Core Mini (45 CFM claimed, 41 CFM measured independently). The LV-H132's CADR claims are confused across sources, ranging from 35 to 110 CFM, making verification essential.

**Noise** measurements vary by 10+ dB for the LV-H132 depending on the source, which is a large perceptual difference (10 dB is roughly a doubling of perceived loudness). The Core Mini's noise measurements are more consistent across sources.

**Filter class** (H13) is unverified by any third party cited in available sources. The AHAM Verifide program tests CADR, not filter media grade. Whether these filters truly meet EN 1822 H13 or DOE 99.97% standards at the filter media level, as opposed to system-level particle removal measured by CADR, is not independently confirmed in publicly available testing.

## Physical Comparison

| Dimension | Core Mini | LV-H132 |
|-----------|-----------|---------|
| **Size** | 6.5 x 6.5 x 10.4 in | 7.9 x 7.9 x 12.6 in |
| **Weight** | 2.2 lbs (1.0 kg) | 6 lbs (2.7 kg) |
| **Form factor** | Compact cylinder | Larger cylinder |
| **Fan speeds** | 3 | 3 |
| **Smart features** | None | None |

The Core Mini is genuinely portable — one kilogram, roughly the footprint of a large coffee mug. The LV-H132 is a small appliance at nearly 3 kg.

## What the Specifications Don't Tell You

Several specifications that would be necessary for rigorous evaluation are not publicly available for either unit:

- **Activated carbon mass** — without knowing the weight of carbon in the filter, VOC and odor removal claims cannot be evaluated. A few grams of carbon impregnated into a sheet is functionally decorative; 100+ grams of granular carbon provides meaningful adsorption.
- **Filter pressure drop** — how much the filter restricts airflow at various loading states, which determines real-world CADR degradation over the filter's life
- **Single-pass efficiency by particle size** — CADR tells you system-level performance but not what percentage of particles are captured in a single pass through the filter at a given particle size
- **Carbon breakthrough time** — how long before the carbon layer is saturated and stops adsorbing VOCs, which is almost certainly shorter than the 4-8 month HEPA replacement interval

## See Also

- EN 1822-1:2019 — the European standard defining HEPA filter classes H10 through H14
- AHAM AC-1-2020 — the standard protocol for CADR testing
- ASHRAE 241-2023 — the post-pandemic standard for control of infectious aerosols, which specifies minimum equivalent clean air delivery rates
- EPA "Guide to Air Cleaners in the Home" — the EPA's consumer guidance on portable air cleaner sizing and ACH recommendations
