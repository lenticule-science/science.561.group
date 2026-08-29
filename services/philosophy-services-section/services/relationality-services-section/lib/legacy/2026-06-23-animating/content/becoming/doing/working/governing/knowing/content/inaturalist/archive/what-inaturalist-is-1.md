---
title: "What iNaturalist is (and is not)"
date-created: 2026-03-04T00:00:00
---
# What iNaturalist is (and is not)

iNaturalist is a platform for recording biodiversity observations, identifying organisms through community input, and sharing data to downstream aggregators such as GBIF. It is not a controlled survey instrument, and its outputs reflect the behaviors of observers, identifiers, and platform design.

## Platform mechanics that shape data

- **Observation workflow:** evidence (photos/sounds) + metadata (time, location) + community IDs.
- **Community ID:** a consensus label built from multiple identifications, with rules that can exclude or override minority expertise. This is a strength for common taxa and a risk for rare or cryptic taxa.
- **Data sharing:** Research Grade observations with open licenses are shared to GBIF by default, but those records still retain the biases of data collection and identification effort.
- **Computer vision suggestions:** suggested taxa can anchor early IDs and shape the direction of community review. This can speed ID but also reinforce common misclassifications.

## System properties practitioners must understand

- **Non-random sampling:** observations are driven by access, interest, and seasonality rather than a sampling plan.
- **Detectability:** organisms differ in visibility and identifiability; absence of records is rarely absence of organisms.
- **Review capacity:** some taxonomic groups have limited expert coverage, which affects correction rates and latency.
- **Metadata limits:** location accuracy is user-defined; imported records often have timestamp or coordinate errors.

## Strengths the platform enables

- **Scale:** large volumes of observations across regions and time.
- **Transparency:** open evidence and community discussion that document uncertainty.
- **Rapid response:** fast reporting of emerging invasions or phenological shifts.

## What this means for practice

Treat each observation as a hypothesis about an organism in place and time. Your job is to make that hypothesis testable, reviewable, and useful.

## What goes wrong if you do this poorly

If you rely on the platform to “fix” weak observations, poor evidence and missing context become persistent noise. Downstream data users may treat these records as equivalent to structured surveys, leading to spurious ecological conclusions. iNaturalist is not a sampling framework; it is a repository of opportunistic observations with variable review depth.

## Sources

- iNaturalist help on Community ID: <https://www.inaturalist.org/pages/help#identification>
- iNaturalist on GBIF sharing: <https://www.inaturalist.org/pages/gbif>
- iNaturalist computer vision FAQ: <https://www.inaturalist.org/pages/help#computer-vision>
- Newman et al. (2012) on citizen science as a socio-technical system: <https://doi.org/10.1145/2145204.2145235>

## Observation → ID → GBIF pipeline (text diagram)

1. **Observation created** (media + date + location).
2. **IDs added** (community review and consensus).
3. **DQA evaluated** (Research Grade or lower).
4. **License checked** (only open licenses are shared).
5. **Aggregator sync** (e.g., GBIF receives eligible records).

## License choices and data availability

- **CC BY / CC BY-SA / CC0:** eligible for broad sharing (including GBIF).
- **All Rights Reserved:** observation is visible on iNaturalist but not shared to aggregators.
- **Mixed licenses:** if media is restrictive but the observation is open, downstream users may still not see evidence. Choose licenses that match your data-sharing intent.
