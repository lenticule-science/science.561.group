---
name: "Global Section"
identity: global-section
description: "In a cellular sheaf, a global section is a choice of local data at every cell that satisfies every restriction-map compatibility; it is an element of the kernel of the coboundary."
date-created: 2026-10-15
see-also:
  - cellular-sheaf
  - restriction-map
  - sheaf-laplacian
  - wang-tiles
  - section
  - sheaf-condition
target: lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/content/text/glossary/terms/
provenance:
  sources:
    - "Wang tile note (`W`) `lib/emsenn/services/561-group/services/public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/documents/articles/notes/2026/07/01/wang_tiles_sheaf_laplacians.md`, sections 1, 3.1, 3.3 and 4.1"
    - "Read whole from `561-group/bare-cedar-fog` at d7cda6a4 (blob-less clone) by the 2026-10-15 reader reports in `content/research/`."
---
A **global section** of a cellular sheaf is a choice of local data everywhere that satisfies every compatibility map (`W` section 1). On a graph it is a vertex assignment `x` with `rho_{u->e} x_u = rho_{v->e} x_v` at every edge `e = uv` (`W` section 3.1), and the vector space of global sections is `ker delta_0` (`W` section 3.3, 5.1).

- The `sheaf-laplacian` has global sections as its kernel and measures how far an assignment is from being one.
- Wang tilings of a finite board are exactly the global sections of the set-valued Wang sheaf (see `wang-tiles`); on a finite torus they are the periodic tilings; the note states that aperiodic tile sets are those whose infinite-plane section space is nonempty and whose finite-torus exact section spaces are all empty (`W` section 4.4; see `aperiodic-tiling`).
- Higher cohomology records obstructions and residual degrees of freedom that cannot be represented as globally consistent lower-dimensional data (`W` section 3.3).

## Not this
The glossary terms `section` name other notions (the emsenn-services-section and agency-services-section entries). This entry is the sheaf-theoretic sense only.

## Target
Target path: `lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/content/text/glossary/terms/` in `561-group/bare-cedar-fog`, the Mathematics Services Section glossary terms directory.
