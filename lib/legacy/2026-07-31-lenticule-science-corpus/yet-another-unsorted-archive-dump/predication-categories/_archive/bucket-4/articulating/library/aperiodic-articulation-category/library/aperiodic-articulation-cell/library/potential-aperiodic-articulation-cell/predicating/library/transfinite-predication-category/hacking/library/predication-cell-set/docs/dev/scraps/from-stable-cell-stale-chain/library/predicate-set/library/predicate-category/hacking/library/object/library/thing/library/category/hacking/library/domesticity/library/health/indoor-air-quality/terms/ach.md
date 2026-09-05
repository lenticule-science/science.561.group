---
name: "Air Changes Per Hour (ACH)"
date-created: 2026-04-04
description: "A measure of how many times the entire air volume in a room is completely replaced per hour, expressed as a count of complete air exchanges."
---

ACH quantifies how effectively air is being recirculated or exchanged in an enclosed space. It connects mechanical ventilation rates or air purifier performance to the time required to meaningfully improve air quality throughout a room.

## Definition and Calculation

ACH is calculated by dividing the total airflow rate (in cubic feet per minute) by the room's volume (in cubic feet), then multiplying by 60 to convert to hourly rate:

**ACH = (Airflow in CFM × 60) ÷ Room Volume (cubic feet)**

For example, a 300 CFM portable air purifier in a 1,000 cubic foot room delivers:
- (300 × 60) ÷ 1,000 = 18 ACH from that device alone

Note: This is the equivalent ACH contribution from the purifier; natural ventilation (windows, HVAC, infiltration) may contribute additional ACH.

## Standards and Recommendations

### ASHRAE 62.2 (Residential Ventilation Standard)

ASHRAE Standard 62.2-2016 specifies that homes receive at least **0.35 ACH** from outdoor air, plus at least 15 cubic feet per minute per person. This baseline is set to dilute indoor pollutants and odors but is not high enough for pathogen control.

### CDC and EPA Recommendations for Pathogen Control

For reducing airborne pathogens (especially relevant since the COVID-19 pandemic), the CDC recommends achieving at least **5 total ACH** in occupied spaces, which the EPA now supports as part of updated indoor air quality guidance.

### ASHRAE 241 (Infectious Aerosol Control)

ASHRAE 241 recommends delivering **30–50 CFM per person** in residential spaces. This typically translates to 5+ ACH depending on room size and occupancy.

## Application to Portable Air Purifiers

A portable air purifier's contribution to total ACH depends on its CADR and the room's volume. Because CADR measurements track specific particle sizes (smoke, dust, pollen), the effective ACH contribution varies by particle type:

- A 200 CFM smoke CADR in a 500 cubic foot room: (200 × 60) ÷ 500 = 24 ACH for smoke
- The same device may have higher CADR for dust or pollen, yielding proportionally higher ACH for those particles

## Why ACH Matters for Air Quality

- **Low ACH (0.35–1)**: Minimal air replacement; contaminants persist for hours.
- **Moderate ACH (2–5)**: Useful for general air cleaning; combined with natural ventilation, provides adequate IAQ for typical residential use.
- **High ACH (8–15+)**: Provides rapid air cleaning and is necessary when air quality is heavily compromised or when pathogen control is the priority.

The time to reduce airborne contaminant concentration by 63% is approximately **1 ÷ ACH** (in hours). For example:
- At 1 ACH, concentration drops 63% in 1 hour
- At 5 ACH, concentration drops 63% in 12 minutes
- At 12 ACH, concentration drops 63% in 5 minutes

## Interaction with Room Characteristics

ACH is a simplified measure that assumes perfect mixing. Real rooms have:

- **Dead zones** (corners, closets) where air moves slowly
- **Stratification** (warm air rising, cool air sinking)
- **Source proximity** (pollutants generated near the breathing zone or far from the purifier)

A purifier with high ACH but placed across the room from a pollution source is less effective than one positioned closer, because localized contaminant concentration takes longer to equilibrate.

## Outdoor Ventilation vs. Recirculation

- **Outdoor ventilation ACH**: Fresh air brought from outside; dilutes all indoor pollutants but requires conditioning (heating/cooling).
- **Recirculation ACH**: Air cleaned and returned indoors; removes specific particles or pollutants but does not dilute CO2, volatile compounds, or heat.

Portable air purifiers provide recirculation ACH only. Optimal IAQ typically requires a combination of outdoor ventilation (low ACH) and recirculation cleaning (high CADR/ACH) for specific contaminants.

## See Also

- [CADR](./cadr.md) — how to calculate ACH from a purifier's Clean Air Delivery Rate
- [ASHRAE Standards](./ashrae-standards.md) — current recommendations for residential and commercial air quality
