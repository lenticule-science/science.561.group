---
name: "Sheaf Laplacian"
identity: sheaf-laplacian
description: "A sheaf Laplacian is a sum of local disagreement penalties over a cellular sheaf: its kernel is the space of global sections and its value on an assignment measures the total squared failure of that assignment to be a global section."
date-created: 2026-10-15
see-also:
  - cellular-sheaf
  - hodge-laplacian
  - sheaf
  - global-section
  - restriction-map
  - harmonic-extension
  - wang-tiles
  - bilattice
target: lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/content/text/glossary/terms/
provenance:
  sources:
    - "Wang tile note (`W`) `lib/emsenn/services/561-group/services/public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/documents/articles/notes/2026/07/01/wang_tiles_sheaf_laplacians.md`, sections 3.1 to 3.3: "A sheaf Laplacian is a sum of local disagreement penalties.""
    - "Memo on frontiers in sheaf Laplacians (`M`) `lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/services/obsmetrological-services-section/content/text/documents/articles/notes/2026/06/25/2026-06-25-memo-on-frontiers-in-sheaf-laplacians.md`, sections 1 to 3"
    - "Arena sheaf-Laplacian note (`A1`) `lib/emsenn/services/561-group/services/public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/documents/articles/notes/2026/06/25/2026-06-25-research-on-the-arena-sheaf-laplacian-and-best-response-reachability.md`"
    - "Read whole from `561-group/bare-cedar-fog` at d7cda6a4 (blob-less clone) by the 2026-10-15 reader reports in `content/research/`."
---
A **sheaf Laplacian** is an operator built from a cellular sheaf. For a cellular sheaf on a graph, with a vector space at each vertex and edge and a linear restriction map `rho_{v->e}` for each incident pair, the coboundary `delta_0` sends a vertex assignment `x` to its disagreement at each edge, `(delta x)_e = rho_{v->e} x_v - rho_{u->e} x_u`. The Laplacian is `L_0 = delta_0^T delta_0`, and its quadratic form is `<x, L_0 x> = ||delta_0 x||^2 = sum over e=uv of ||rho_{u->e} x_u - rho_{v->e} x_v||^2` (`W` section 3.3). The Wang tile note states: "Thus L_0 measures the total squared failure of a vertex assignment to be a global section."

- The kernel of `L_0` is the vector space of `global-section`s (`W` section 3.3, 5.1).
- Small eigenvalues are flexible, low-energy modes; large eigenvalues are stiff modes that produce high local inconsistency (`W` section 3.3).
- When every stalk is the reals and every `restriction-map` is the identity, the sheaf Laplacian is the ordinary graph Laplacian (`W` section 3.1).
- Higher-degree Laplacians `Delta_k = (delta^k)^T delta^k + delta^{k-1}(delta^{k-1})^T` give cohomology, which records obstructions around cycles (`M` section 1.3 algorithm).
- With some vertices fixed as boundary data, the free values are fixed by `harmonic-extension`.

## Three operators under one name
The held notes use the name for three operators (`M` sections 1 to 3): the Hodge operator on real vector stalks, which needs inner products; the Tarski operator on complete lattices, `(Tx)_v = meet over incident e of beta_{v,e}(meet over w in boundary(e) of alpha_{w,e}(x_w))`, settled by `x := x meet T(x)` and terminating on finite-height lattices; and the Lawvere operator on quantale-enriched categories, which `M` calls "a schema" and "not a single matrix formula". `M` says the Tarski and Lawvere operators "generally do not" have spectra. The arena note `A1` has no inner product on event stalks and so does not use the Hodge operator. No source derives one definition that covers all three. This entry states the Hodge case only; the other two are stated by `M`.

## Limit
The Laplacian "does not solve the domino problem" (`W` section 4.4): no uniform finite spectral computation decides the infinite problem, because that would contradict undecidability (see `domino-problem`).

## Relations
Applications in the held notes: `wang-tiles` as global sections, the `arena` of a concurrent game where best-response `reachability` is the kernel fixed point (a conjecture, `A1`), and cloud sovereignty as a sheaf over an infrastructure complex (a modeling direction, not a theorem, `C` section 12). Hodge case: `hodge-laplacian`. Sheaf data: `cellular-sheaf`.

## Target
Target path: `lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/content/text/glossary/terms/` in `561-group/bare-cedar-fog`, the Mathematics Services Section glossary terms directory.
