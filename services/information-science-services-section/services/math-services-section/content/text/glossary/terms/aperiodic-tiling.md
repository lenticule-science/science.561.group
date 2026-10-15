---
name: "Aperiodic Tiling"
identity: aperiodic-tiling
description: "A finite tile set is aperiodic when it tiles the plane but admits no periodic tiling; in the sheaf reading, its infinite-plane section space is nonempty while every finite-torus section space is empty."
date-created: 2026-10-15
see-also:
  - wang-tiles
  - domino-problem
  - subshift
  - global-section
  - compactness
target: lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/content/text/glossary/terms/
provenance:
  sources:
    - "Wang tile note (`W`) `lib/emsenn/services/561-group/services/public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/documents/articles/notes/2026/07/01/wang_tiles_sheaf_laplacians.md`, sections 2.1 and 4.4"
    - "Read whole from `561-group/bare-cedar-fog` at d7cda6a4 (blob-less clone) by the 2026-10-15 reader reports in `content/research/`."
---
A tiling `tau : Z^2 -> T` is **periodic** if there is a nonzero vector `p` with `tau(z+p) = tau(z)` for every `z`; equivalently, it descends to a tiling of a finite torus `Z_m x Z_n`. A finite tile set is **aperiodic** if it tiles the plane but admits no periodic tiling (`W` section 2.1).

In the sheaf reading, exact set-valued `global-section`s on the `(m,n)` torus are exactly the `(m,n)`-periodic tilings. The note states: "Aperiodic tile sets are precisely finite local sheaves whose infinite-plane section space is nonempty but whose finite-torus exact section spaces are all empty" (`W` section 4.4).

## History as the note gives it
Wang showed that a decision procedure for the `domino-problem` would follow if every tileable finite set had a periodic tiling. Berger disproved that hypothesis by proving undecidability and constructing a tile set that can tile only nonperiodically (`W` section 2.1). Robinson introduced hierarchical tilings (`W` section 6.3). The note names the Jeandel-Rao set as the aperiodic set minimal in number of tiles and colors. These are literature claims, cited in the note and not derived there.

## Relations
Aperiodic sets are Wang tile sets (`wang-tiles`) whose `subshift` is nonempty with no periodic point. By `compactness`, the infinite problem is the inverse limit of its finite shadows (`W` section 2.2).

## Target
Target path: `lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/content/text/glossary/terms/` in `561-group/bare-cedar-fog`, the Mathematics Services Section glossary terms directory.
