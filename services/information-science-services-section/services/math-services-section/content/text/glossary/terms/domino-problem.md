---
name: "Domino Problem"
identity: domino-problem
description: "The domino problem asks, given a finite Wang tile set, whether at least one valid tiling of the plane exists; it is undecidable."
date-created: 2026-10-15
see-also:
  - wang-tiles
  - aperiodic-tiling
  - subshift
  - sheaf-laplacian
  - compactness
target: lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/content/text/glossary/terms/
provenance:
  sources:
    - "Wang tile note (`W`) `lib/emsenn/services/561-group/services/public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/documents/articles/notes/2026/07/01/wang_tiles_sheaf_laplacians.md`, sections 2.1, 4.4 and 6.2"
    - "Read whole from `561-group/bare-cedar-fog` at d7cda6a4 (blob-less clone) by the 2026-10-15 reader reports in `content/research/`."
---
The **domino problem** asks whether, given a finite Wang tile set `T`, there exists at least one valid tiling `Z^2 -> T` (`W` section 2.1; see `wang-tiles`). Berger proved that no algorithm decides it for every finite tile set, and that result also refuted Wang's periodicity conjecture (`W` section 6.2). By `compactness`, tileability of the plane holds exactly when every finite patch can be tiled, so non-tileability has finite obstructions while tileability need not have a periodic witness (`W` section 2.2).

The `sheaf-laplacian` changes the geometry of the problem and does not remove this limit. The note states: "no uniform finite spectral computation over all tori can decide the infinite domino problem in full generality, because that would contradict undecidability" (`W` section 4.4; also 9.4 and 13).

## Relations
See `aperiodic-tiling` for the tile sets that tile the plane only nonperiodically, and `subshift` for the dynamical reading.

## Target
Target path: `lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/content/text/glossary/terms/` in `561-group/bare-cedar-fog`, the Mathematics Services Section glossary terms directory.
