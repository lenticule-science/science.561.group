---
title: "Limits: what iNaturalist data can and cannot support"
---

iNaturalist data are best suited for occurrence, phenology, and broad distribution questions. They are weak for abundance, population trends, and causality without additional structure.

## What iNaturalist data can support

- Range extensions or confirmations.
- Phenological timing of flowering, migration, or emergence.
- Presence-only modeling with appropriate bias correction.
- Early warning signals when paired with targeted follow-up surveys.

## What iNaturalist data cannot support alone

- Abundance or density estimates.
- Absence-based inference without structured effort.
- Fine-scale demographic conclusions.

## Fit-for-purpose checklist

- Is your question compatible with presence-only data?
- Do you have a plan to model or correct sampling bias?
- Are you combining iNaturalist with structured datasets where needed?

## Strengths and pitfalls in analysis

**Strengths**:

- Large sample sizes can support broad-scale distribution inference.
- Rich metadata can enable focused subsetting (e.g., life stage, behavior).

**Pitfalls**:

- Treating absence of records as absence of organisms.
- Ignoring uneven effort across time and space.

## What goes wrong if you do this poorly

Using presence-only data as abundance inflates or deflates perceived population trends, potentially misdirecting conservation actions. Reports that ignore uneven effort can confuse “no records” with “no organisms.”

## Sources

- Kéry et al. (2018) on citizen science data limitations: <https://doi.org/10.1111/2041-210X.13028>
- Johnston et al. (2020) on effort modeling in citizen science: <https://doi.org/10.1111/2041-210X.13351>

## Research question suitability table

| Question type | Suitability | Notes |
| --- | --- | --- |
| Range confirmation | High | Requires clear evidence and accurate location. |
| Phenology timing | Medium–High | Needs repeated observations across seasons. |
| Habitat association | Medium | Requires metadata and bias correction. |
| Abundance trends | Low | Presence-only data is not sufficient. |

## Mitigation strategies

- Pair iNaturalist records with structured surveys when inference requires absences or abundance.
- Use bias surfaces or effort proxies to down-weight over-sampled areas.
- Report uncertainty explicitly in outputs and avoid over-interpretation.

## See also

- [Aggregation and analysis](aggregation.md)
- [Export and citation](export-and-citation.md)
- [Glossary](../glossary.md)
