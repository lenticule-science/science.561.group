---
title: "Clean Air Delivery Rate (CADR)"
date-created: 2026-04-04
description: "A laboratory measurement of an air purifier's ability to remove specific particle types from a test chamber, expressed in cubic feet per minute."
---

CADR is the volume of filtered air an air purifier delivers per minute for a specific pollutant type, measured under controlled laboratory conditions. It connects theoretical filter efficiency to real-world performance by accounting for both the filter's removal capability and the device's airflow rate.

## Definition and Formula

CADR is calculated as the fraction of particles removed by the purifier (accounting for natural settling), multiplied by the room airflow rate in cubic feet per minute (CFM).

The AHAM testing protocol uses linear regression analysis on particle concentration measurements over time to determine the rate of particle removal, then multiplies this by the test chamber volume to obtain CADR in CFM.

## Three CADR Scores

Air purifiers receive three separate CADR ratings for different particle types, each within a defined size range:

- **Smoke CADR** (particles 0.09–1.0 μm): Simulates tobacco smoke and fine particulate matter. This is often the most stringent test and typically yields the lowest CADR number.
- **Dust CADR** (particles 0.5–3 μm): Simulates household dust, including dust mites and their debris.
- **Pollen CADR** (particles 5–11 μm): Simulates outdoor pollen and larger particles. Typically yields the highest CADR number because large particles are easier to capture.

## AHAM AC-1 Testing Standard

The ANSI/AHAM AC-1 standard specifies the testing protocol. A standardized test chamber of 1,008 cubic feet is used to ensure fair comparison between devices. The test procedure:

1. **Baseline phase**: Particles (smoke, dust, or pollen) are injected into the chamber with the air purifier off. The natural settling rate is measured.
2. **Active phase**: The purifier is turned on and particle removal rate is measured until the air is sufficiently clean.
3. **Calculation**: The difference in removal rate between the potential and baseline phases is converted to CFM.

## CADR and Room Size

As a practical rule of thumb, an air purifier's CADR should be at least two-thirds of the room's floor area (in square feet). For example, a 300 CFM purifier is appropriate for a room up to approximately 450 square feet (300 ÷ 0.667).

This guideline assumes a single air change per hour of the room's total volume, which provides baseline air cleaning but not deep purification.

## AHAM Verifide Certification

AHAM Verifide is a third-party certification program that independently verifies manufacturer CADR claims through laboratory testing. Certified units display an AHAM Verifide seal listing the three CADR numbers. Unverified products may claim higher CADR ratings than independently tested alternatives.

## Limitations

CADR measures performance in an ideal test chamber and does not account for:

- Room air mixing patterns (dead zones, stratification)
- Placement of the purifier relative to sources of contamination
- Continuous pollution generation during operation
- Changes in filter effectiveness over time as the filter loads

A device with high CADR but poor room placement may be less effective than a lower-CADR device positioned optimally.

## Relationship to ACH

CADR can be converted to equivalent air changes per hour (ACH) by the formula:

ACH = (CADR × 60) ÷ Room Volume (cubic feet)

A 300 CFM CADR in a 1,000 cubic foot room equals (300 × 60) ÷ 1,000 = 18 ACH for that specific pollutant class.

## See Also

- [Air Changes Per Hour (ACH)](./ach.md) — how to translate CADR into room-level air quality improvement
- [HEPA Classification](./hepa-classification.md) — the filter technology underlying CADR performance
- [AHAM Verifide Certification](./aham-verifide-certification.md) — third-party verification of CADR claims
