---
name: "Harmonic Extension"
identity: harmonic-extension
description: "A harmonic extension of boundary data on a cellular sheaf is the minimum-energy assignment on the free vertices, found by solving L_UU x_U = -L_UB b."
date-created: 2026-10-15
see-also:
  - sheaf-laplacian
  - cellular-sheaf
  - global-section
  - hodge-laplacian
target: lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/content/text/glossary/terms/
provenance:
  sources:
    - "Memo on frontiers in sheaf Laplacians (`M`) `lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/services/obsmetrological-services-section/content/text/documents/articles/notes/2026/06/25/2026-06-25-memo-on-frontiers-in-sheaf-laplacians.md`, section 1.4 "Algorithm: harmonic extension with boundary constraints""
    - "Wang tile note (`W`) `lib/emsenn/services/561-group/services/public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/documents/articles/notes/2026/07/01/wang_tiles_sheaf_laplacians.md`, section 3.4 (names harmonic extension among sheaf Laplacian applications)"
    - "Read whole from `561-group/bare-cedar-fog` at d7cda6a4 (blob-less clone) by the 2026-10-15 reader reports in `content/research/`."
---
Suppose some vertex values are fixed as boundary data `b` on a set `B`, and `U = V \ B` is free. Block the sheaf Laplacian as `L = [[L_UU, L_UB], [L_BU, L_BB]]`. The **harmonic extension** solves `L_UU x_U = -L_UB b` and returns `x = (x_U, b)` (`M` section 1.4). The algorithm is: extract the blocks `L_UU` and `L_UB`, solve, return `x`, and report the residual energy `||delta x||^2`. The result is the minimum-energy extension.

The memo gives the open edge: "what becomes of harmonic extension when the stalk category is not a Hilbert space?" It also reads the forward pass of a ReLU network as the unique harmonic extension of the input boundary data, citing a 2026 preprint that these notes could not confirm (`M` section 6.1).

## Relations
A harmonic extension is computed from a `sheaf-laplacian`. When the free values can make every edge agree, the extension is a `global-section`.

## Target
Target path: `lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/content/text/glossary/terms/` in `561-group/bare-cedar-fog`, the Mathematics Services Section glossary terms directory.
