---
name: "Wang Tiles"
identity: wang-tiles
description: "A Wang tile is a unit square with a color on each of its four edges, placed on the integer grid without rotation; a finite tile set defines a valid tiling when every pair of adjacent tiles agrees on their shared edge color."
date-created: 2026-10-15
see-also:
  - sheaf-laplacian
  - global-section
  - restriction-map
  - domino-problem
  - aperiodic-tiling
  - subshift
  - cellular-sheaf
target: lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/content/text/glossary/terms/
provenance:
  sources:
    - "Wang tile note (`W`) `lib/emsenn/services/561-group/services/public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/documents/articles/notes/2026/07/01/wang_tiles_sheaf_laplacians.md`, sections 2.1 and 4.1"
    - "Read whole from `561-group/bare-cedar-fog` at d7cda6a4 (blob-less clone) by the 2026-10-15 reader reports in `content/research/`."
---
A **Wang tile** is written `t = (N(t), E(t), S(t), W(t))`, the colors on its north, east, south and west sides. A finite tile set `T` is a finite set of such quadruples. A configuration is a function `tau : Z^2 -> T`. It is a **valid Wang tiling** when, for every `(i,j)`, `E(tau(i,j)) = W(tau(i+1,j))` and `N(tau(i,j)) = S(tau(i,j+1))` (`W` section 2.1).

Tiles are not rotated or reflected. The note says: "A tile is not a shape up to Euclidean motion; it is a labeled state with a fixed orientation."

## As a sheaf
On a finite rectangular board, build the adjacency graph whose vertices are board cells. The stalk at each vertex is the tile set `T`; the stalk at a horizontal edge is the set of horizontal interface colors, and at a vertical edge the set of vertical interface colors. The `restriction-map`s send a tile to `E` and `W` (horizontal edges) or `N` and `S` (vertical edges). A `global-section` is a tile assignment on which both reports at every edge agree, and "this is exactly a valid Wang tiling of the finite board" (`W` section 4.1). Both sides are the same edge-matching condition, so the identification is by construction. Linearizing `T` to free vector spaces gives a `sheaf-laplacian` whose zero-energy one-hot vectors are the true tilings (`W` section 4.2).

## Questions asked of a tile set
The `domino-problem` asks whether a valid tiling of the plane exists. A tile set is aperiodic when it tiles the plane and admits no periodic tiling (see `aperiodic-tiling`). The valid tilings form a `subshift`. The note's spectral signatures, entropy links, persistent spectra and quantum variants are listed as open (`W` sections 5.4 and 12).

## Target
Target path: `lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/content/text/glossary/terms/` in `561-group/bare-cedar-fog`, the Mathematics Services Section glossary terms directory.
