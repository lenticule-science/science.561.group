---
title: "How identification works"
---

Identification on iNaturalist is a consensus system with rules. It is robust for common, well-documented taxa and fragile for rare or cryptic ones.

## Mechanics

- IDs are weighted by taxonomic alignment and agreement.
- Community ID can override a single expert if not supported by evidence.
- IDs can be withdrawn or replaced, but downstream data may already be synced.
- Early IDs can anchor subsequent identifications, especially when CV suggestions or popular taxa are involved.

## Evidence thresholds by taxon (general pattern)

- **Conspicuous species:** often identifiable with minimal evidence but still prone to look-alikes.
- **Cryptic complexes:** may require microscopic or genetic evidence; iNaturalist cannot capture this directly.
- **Juveniles:** many taxa are unidentifiable to species at early life stages.

When evidence cannot support a species-level ID, the responsible choice is to stop at the lowest confident rank.

## Practice guidance

- Identify only when you can justify the taxon with observable traits.
- Leave detailed notes explaining reasoning for difficult IDs.
- Use “ID cannot be improved” sparingly; it can freeze records at a coarse level even when better evidence exists.

## What goes wrong if you do this poorly

Overconfident IDs can “stick” and be propagated to GBIF, where corrections may not be reflected in analyses already performed. In practice, IDs for under-reviewed taxa can remain incorrect for years.

## Sources

- iNaturalist help on identifications: <https://www.inaturalist.org/pages/help#identification>
- Bird et al. (2014) on expert review in citizen science: <https://doi.org/10.7717/peerj.89>
- iNaturalist identification FAQ: <https://www.inaturalist.org/pages/help#identification>

## Example: conflicting IDs resolving

- Observer uploads a photo and suggests *Genus A*.
- Two identifiers suggest *Species A1* and one suggests *Species A2*.
- Evidence is ambiguous, so the community ID remains at *Genus A* until clearer evidence appears.

## When to use “complex” or “aggregate” taxa

Use complex/aggregate taxa when species-level diagnosis requires microscopy, genetics, or specialist structures not visible in the media. This keeps records scientifically honest and avoids false precision.
