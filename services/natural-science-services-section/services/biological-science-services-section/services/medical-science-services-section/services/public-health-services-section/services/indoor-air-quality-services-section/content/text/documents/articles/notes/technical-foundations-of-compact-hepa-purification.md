---
title: "Technical Foundations of Compact HEPA Purification"
date-created: 2026-04-04
description: "A technical survey of the standards, measurement protocols, and technologies underlying portable HEPA air purifier performance."
---

Portable HEPA air purifiers are evaluated using multiple independent standards and certifications. Understanding these standards—HEPA classification, CADR measurement, ACH calculation, carbon adsorption, AHAM verification, and CARB compliance—provides the foundation for assessing purifier design and selecting devices appropriate for specific applications.

## HEPA Filter Standards: EN 1822 vs. DOE

The fundamental specification is the HEPA filter itself. Two major standards define HEPA performance:

The European standard **EN 1822** (now ISO 29463) classifies HEPA filters by their efficiency at the **Most Penetrating Particle Size (MPPS)**, approximately 0.21 micrometers. This size is chosen because it represents the weakest point in filtration: too small for efficient interception or impaction, too large for diffusion. EN 1822 establishes a hierarchy from H10 (85% at MPPS) through H14 (99.995% at MPPS), with H13 and above receiving individual test certificates.

The U.S. **DOE standard** specifies HEPA filters must remove 99.97% of particles at 0.3 micrometers. This is a single-point specification rather than a full efficiency curve. The term "True HEPA" (informal in the US, with no legal definition) typically refers to DOE-compliant filters and is functionally equivalent to EN 1822 H13.

For compact residential purifiers, both approaches achieve similar performance. H13 filters are standard in quality devices marketed as "True HEPA."

## Measuring Real-World Performance: CADR

HEPA efficiency in the lab does not directly translate to usable air cleaning. The **Clean Air Delivery Rate (CADR)** standard bridges this gap by measuring how much filtered air a complete device delivers—accounting for both filter efficiency and the device's airflow rate.

CADR is measured in the ANSI/AHAM AC-1 protocol using a standardized test chamber of 1,008 cubic feet. Three separate scores are reported:

- **Smoke CADR** (0.09–1.0 μm particles): Represents fine particulates and often yields the lowest score
- **Dust CADR** (0.5–3 μm particles): Represents household dust and dust mites
- **Pollen CADR** (5–11 μm particles): Represents larger particles; usually yields the highest score

The test measures particle removal by comparing how fast particles clear from the chamber when the device is on versus off, using linear regression to calculate CFM of cleaned air.

A practical guideline: CADR should be at least two-thirds of the room's floor area. A 300 CFM device suits rooms up to about 450 square feet.

## From Performance to Room Impact: ACH

While CADR measures device performance, **Air Changes Per Hour (ACH)** translates that performance into room-level air quality change. ACH is calculated as:

**ACH = (CADR × 60) ÷ Room Volume (cubic feet)**

A 300 CFM purifier in a 1,000 cubic foot room delivers (300 × 60) ÷ 1,000 = 18 ACH from recirculation alone.

Current standards recommend:

- **ASHRAE 62.2**: Minimum 0.35 ACH from outdoor ventilation (baseline, pre-pandemic)
- **CDC/EPA**: Minimum 5 total ACH for pathogen control (post-2020 guidance)
- **ASHRAE 241**: 30–50 CFM per person in residential spaces

The relationship between ACH and pollution removal is logarithmic: at higher ACH values, contaminant concentration drops faster. Specifically, concentration drops by 63% in a time of 1 ÷ ACH hours. At 5 ACH, this is 12 minutes. At 1 ACH, it is 1 hour.

Portable purifiers provide **recirculation ACH only**—they clean existing air but do not introduce fresh outdoor air. Optimal IAQ typically requires both outdoor ventilation (low ACH, continuous CO2 and humidity control) and mechanical purification (high CADR/ACH for specific contaminants).

## Complementary Filtration: Activated Carbon

HEPA filters remove particles but not gases or volatile organic compounds (VOCs). Activated carbon filters address this gap through **adsorption**, a physical process in which VOCs adhere to the surface of porous carbon material.

Activated carbon has enormous surface area—up to 3,000 square meters per gram—and can adsorb VOCs at capacities ranging from 5% to 30%+ by weight depending on the compound. Toluene (highly adsorbable) can reach 30% capacity; ammonia (poorly adsorbable) typically remains under 5%. The exact capacity depends on humidity (high humidity competes with VOCs for binding sites), temperature (higher temperatures reduce adsorption), and the carbon's pore structure.

Breakthrough occurs gradually. Penetration (10% of inlet concentration escaping) to saturation (95% penetrating) may span weeks to months depending on airflow and inlet concentrations. In residential applications, carbon filters typically require replacement every 6–12 months.

Activated carbon is not regenerated in consumer devices; saturation is invisible and requires scheduled replacement.

## Third-Party Verification: AHAM Verifide

Manufacturers can claim any CADR number without verification. The **AHAM Verifide** certification program mitigates this risk by testing devices in accredited third-party laboratories using the AC-1 standard. Only verified products receive the AHAM seal and are listed in the AHAM directory.

Certified devices often have lower claimed CADR values than uncertified competitors, yet the certified claims are reliable. This reflects manufacturer testing practices: some companies test aggressively (or selectively report results), while AHAM testing is uniform and transparent.

AHAM certification does not evaluate noise, energy consumption, filter cost, or longevity. It certifies only that the measured CADR meets the advertised number.

## Regulatory Compliance: CARB Ozone Emissions

The California Air Resources Board (CARB) enforces a **50 ppb (0.050 ppm) ozone emission limit** on all air cleaners, mechanical or electronic. This regulation protects against secondary ozone pollution from electrostatic precipitators, ionizers, UV devices, and other technologies that generate ozone as a byproduct.

Mechanical filters (HEPA, pleated) inherently produce no ozone. Electronic filters must be tested and certified to remain below 50 ppb. Because California represents a large market, most manufacturers pursue CARB certification nationwide rather than maintaining separate product lines.

CARB certification verifies safety and ozone compliance but not air cleaning performance.

## Integration in Compact Design

A compact HEPA purifier integrates these technologies and standards:

1. **HEPA filter core** (certified to H13 or DOE 99.97%) removes particles efficiently at all sizes
2. **Activated carbon layer** (often pre-filter or interleaved) removes VOCs and extends HEPA life by reducing non-particle contaminants
3. **Blower and housing** designed to maximize airflow while containing bypass
4. **CADR testing** to establish real-world performance in standard chamber
5. **AHAM Verifide certification** (optional) to verify CADR claims independently
6. **CARB compliance** to ensure safe operation in ozone-sensitive markets

The result is a device specified by three numbers—smoke/dust/pollen CADR—and several certifications. These translate to room-level impact through ACH calculation and ASHRAE guidance, providing a complete picture of indoor air quality improvement.

## Sources

- [EN 1822 / ISO 29463 Standard](https://smartairfilters.com/en/blog/en1822-hepa-filter-standard/)
- [ANSI/AHAM AC-1 Test Method](https://ahamverifide.org/ahams-air-filtration-standards/)
- [ASHRAE 62.2-2016 Residential Ventilation](https://smartairfilters.com/en/blog/ashrae-per-hour-office-residential-school-virus/)
- [EPA Ventilation Guidance](https://www.epa.gov/indoor-air-quality-iaq/how-much-ventilation-do-i-need-my-home-improve-indoor-air-quality)
- [Activated Carbon Adsorption](https://www3.epa.gov/ttncatc1/dir1/fadsorb.pdf)
- [CARB Air Cleaner Regulation](https://ww2.arb.ca.gov/about-indoor-air-cleaning-devices-regulation)
- [U.S. DOE HEPA Standard](https://www.wyndly.com/blogs/learn/hepa-filter)

## See Also

- [HEPA Classification](../terms/hepa-classification.md) — the fundamental filter standard
- [CADR](../terms/cadr.md) — how purifier performance is measured
- [Air Changes Per Hour (ACH)](../terms/ach.md) — translating CADR to room-level impact
- [Activated Carbon Filtration](../terms/activated-carbon-filtration.md) — VOC removal complementary to particle filtration
- [AHAM Verifide Certification](../terms/aham-verifide-certification.md) — third-party verification
- [CARB Certification](../terms/carb-certification.md) — ozone emissions compliance
