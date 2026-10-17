---
name: "Subshift"
identity: subshift
description: "A subshift is a closed, translation-invariant subset of a product space of symbols; the valid tilings of a Wang tile set form a subshift of finite type."
date-created: 2026-10-15
see-also:
  - wang-tiles
  - domino-problem
  - aperiodic-tiling
  - compactness
target: lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/content/text/glossary/terms/
provenance:
  sources:
    - "Wang tile note (`W`) `lib/emsenn/services/561-group/services/public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/documents/articles/notes/2026/07/01/wang_tiles_sheaf_laplacians.md`, section 2.2 "Wang shifts and finite type constraints""
    - "Read whole from `561-group/bare-cedar-fog` at d7cda6a4 (blob-less clone) by the 2026-10-15 reader reports in `content/research/`."
---
Give `T^{Z^2}` the product topology and let `Z^2` act by translations. The valid tilings of a Wang tile set form `Omega_T = { tau in T^{Z^2} : all matching equations hold }`, a closed, shift-invariant subset (`W` section 2.2). Because the forbidden patterns are exactly the adjacent mismatches, `Omega_T` is a **subshift of finite type**.

In one dimension, subshifts of finite type are governed by finite directed graphs: nonemptiness is decidable, and a bi-infinite path exists exactly when a cycle exists. In two dimensions the note states that the finite-type local description no longer yields decidability (see `domino-problem`).

The note separates three questions: local admissibility (which finite patterns appear), global existence (is `Omega_T` nonempty), and dynamical structure (periodic points, entropy, invariant measures, minimal subsystems, nonexpansive directions, factor maps).

## Relations
`wang-tiles`, `aperiodic-tiling`, `compactness`.

## Target
Target path: `lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/content/text/glossary/terms/` in `561-group/bare-cedar-fog`, the Mathematics Services Section glossary terms directory.
