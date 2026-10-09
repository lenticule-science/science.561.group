---
id: aggregation-and-analysis
authors:
- emsenn
date-created: '2025-12-30'
type: topic
title: Aggregation and analysis
aliases:
  - "Aggregation and analysis"
  - "aggregation and analysis"
keywords:
  - i-naturalist
  - citizen-science
description: Aggregation pipelines can amplify bias if they treat iNaturalist data as uniform.
---

Aggregation pipelines can amplify bias if they treat iNaturalist data as uniform. Analysis must account for uneven effort and taxonomic detection probability.

## Practice guidance

- Use spatial thinning or bias surfaces when modeling.
- Track license and geoprivacy constraints during aggregation.
- Document filtering and exclusion criteria.
- Retain links to original observation media and comments for auditability.

## Common aggregation pitfalls

- Mixing data from different time windows without accounting for effort changes.
- Treating “Research Grade” as a uniform quality filter across taxa.
- Dropping coordinate uncertainty fields and then over-interpreting precision.

## What goes wrong if you do this poorly

Aggregated datasets can create false hotspots that reflect observer behavior rather than ecological reality. Without audit trails, errors can become “institutionalized” in derived datasets.

## Sources

- GBIF bias correction guidance: <https://www.gbif.org/document/82642>
- Elith et al. (2011) on presence-only modeling: <https://doi.org/10.1111/j.1461-0248.2010.01560.x>
- Zooniverse/Bonney et al. (2014) on citizen science data practices: <https://doi.org/10.1016/j.biocon.2014.11.028>
- Fithian et al. (2015) on presence-only modeling with bias: <https://doi.org/10.1111/biom.12281>

## Minimal bias-aware workflow

1. Filter by license, date range, and geoprivacy rules.
2. Remove records with missing or low-quality evidence.
3. Apply spatial thinning or bias surfaces.
4. Document all filters and publish code or configuration.

## Reporting uncertainty

- Report coordinate uncertainty and identification confidence.
- Provide maps with bias surfaces or effort overlays.
