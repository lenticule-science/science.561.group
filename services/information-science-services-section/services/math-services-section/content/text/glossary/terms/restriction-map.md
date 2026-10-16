---
name: "Restriction Map"
identity: restriction-map
description: "In a cellular sheaf, a restriction map is the map from the data at a cell to the data on an incident cell; it says how the data at the first cell is seen from the second."
date-created: 2026-10-15
see-also:
  - cellular-sheaf
  - sheaf
  - global-section
  - sheaf-laplacian
  - sheaf-condition
  - wang-tiles
target: lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/content/text/glossary/terms/
provenance:
  sources:
    - "Wang tile note (`W`) `lib/emsenn/services/561-group/services/public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/documents/articles/notes/2026/07/01/wang_tiles_sheaf_laplacians.md`, section 3.1"
    - "Cloud sovereignty paper (`C`) `lib/emsenn/services/561-group/services/science-services-section/content/text/documents/articles/notes/2026/07/07/2026-07-07-research-on-cloud-computing-sovereignty-and-sheaf-laplacians.md`, sections 2.2 and 4.3"
    - "Read whole from `561-group/bare-cedar-fog` at d7cda6a4 (blob-less clone) by the 2026-10-15 reader reports in `content/research/`."
---
For a graph `G = (V, E)`, a cellular sheaf of real vector spaces has a vector space `F(v)` at each vertex, a vector space `F(e)` at each edge, and for each incident pair `v <= e` a linear map `rho_{v->e} : F(v) -> F(e)`. The Wang tile note states: "The map rho_{v->e} says how data at vertex v is seen from, or reported to, the comparison space on edge e" (`W` section 3.1).

- A vertex assignment is a `global-section` when, for every edge `e = uv`, `rho_{u->e} x_u = rho_{v->e} x_v`.
- In the set-valued Wang sheaf the restriction maps are the color projections `E`, `W`, `N` and `S` (see `wang-tiles`).
- When every restriction map is the identity on the reals, the `sheaf-laplacian` is the ordinary graph Laplacian.
- The cloud sovereignty paper reads interfaces as restriction maps: "sovereignty is not located solely in vertices. It is enacted at restriction maps". That paper's own section 12 calls the application "a modeling direction, not a theorem".

## Relations
Restriction maps are the data a `cellular-sheaf` adds to a graph; the `sheaf-condition` is the gluing requirement on them.

## Target
Target path: `lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/content/text/glossary/terms/` in `561-group/bare-cedar-fog`, the Mathematics Services Section glossary terms directory.
