---
title: "Are hole regions, black-hole regions, or causal cuts treated as CW/cellular cells?"
date: 2026-07-01
status: "negative literature note"
query_scope:
  - "black hole region + cell complex"
  - "causal diamond + cellular decomposition"
  - "trapped region + cell"
  - "event horizon + cellular sheaf"
  - "causal cut + CW complex"
type: research-article

date-created: 2026-07-01
description: Is a hole region, black-hole region, trapped/black region, or order-theoretic causal cut such as
---


## Question

Is a **hole region**, **black-hole region**, **trapped/black region**, or order-theoretic causal cut such as

\[
M \setminus J^{-}(R)
\]

ever explicitly treated as a **cell** in the CW-complex / cellular-decomposition sense: one cellular building block of a larger space, attached to other cells by boundary/incidence data?

This note distinguishes that target from ordinary spacetime discretization. It does **not** count cases where spacetime is triangulated, tessellated by null polytopes, or represented by spin-foam cells, unless the black-region-shaped or causal-cut-shaped object itself is explicitly made one cell of a larger cellular space.

## Verdict

I found **no positive example** in which a hole-shaped region, black-hole region, trapped region, event-horizon-defined black region, or causal cut \(M \setminus J^-(R)\) is explicitly treated as a **single CW/cellular cell** in a larger cellular decomposition.

The literature contains several close-but-negative matches:

1. **Black-hole regions as topological regions or neighborhoods** inside a spacetime or spatial slice.
2. **Black-hole transition regions that are themselves decomposed into cells** in spin-foam/LQG calculations.
3. **Causal or Lorentzian cell complexes** whose cells are abstract combinatorial, simplicial, polyhedral, spin-foam, or null-polytopal objects.
4. **Rod diagrams and torus-manifold CW constructions** where black-hole horizons appear as rods or boundary features, while the CW complex is built for a different space.

Based on the searched literature, the precise construction asked for here appears **unexplored or at least not established under the searched terminology**.

## What would have counted

A positive hit would need to say, in effect, that a black-region-shaped or causal-cut-shaped object is a cell \(e^n\), a regular cell, a cellular stratum, or a named cellular building block in a larger CW/cellular complex, with other cells attached along its boundary or closure.

The following did **not** count:

- a black-hole region \(B\) as a submanifold, complement, regular neighborhood, or region of a single spacetime;
- a black-hole or causal-diamond region that is discretized internally into smaller cells;
- a spin foam, triangulation, Regge complex, causal set, or null-polytope tessellation of spacetime;
- a rod, horizon segment, boundary component, or diagrammatic marker that is not itself a CW cell representing a black region;
- a cellular sheaf or cell complex merely using the words “event,” “horizon,” or “causal” in another sense.

## Search audit

| Search target | Result | Assessment |
|---|---|---|
| `"black hole region" "cell complex"` | Found topological black-hole regions and CW/excision tools in five-dimensional black-hole topology. | Near miss: \(B\) is a region/neighborhood, not a cell. |
| `"black hole region" "CW complex"` | Same main near miss: maximal slices and standard black-hole regions. | Negative. CW complex appears as an algebraic-topology tool. |
| `"black hole region" "cellular decomposition"` | Found spin-foam/LQG work where a black-hole transition region \(B\) is discretized. | Near miss: \(B\) is the object decomposed, not a cellular building block. |
| `"causal diamond" "cellular decomposition"` | Found spin-foam and LQG material involving causal diamonds, polyhedral partitions, and 2-complexes. | Negative. Cells are polyhedra/faces/2-complex elements, not causal-diamond-as-cell. |
| `"causal diamond" "CW complex"` | Mostly unrelated CW/path-space remarks and quantum gravity discretization. | Negative. |
| `"trapped region" "cell"` | Mostly black-to-white-hole transition or unrelated usages. | Negative. |
| `"event horizon" "cellular sheaf"` | No relevant GR/cellular-sheaf hit. Hits drift to unrelated “event horizon” metaphors or generic sheaf ML/causal-inference material. | Negative. |
| `"causal cut" "CW complex"` | No relevant Lorentzian/order-theoretic causal-cut-as-cell hit. | Negative. |

## Closest matches

### 1. Alaee--Kunduri--Martínez-Pedroza: black-hole region \(B\) as a topological region, not a cell

Alaee, Kunduri, and Martínez-Pedroza study maximal slices of five-dimensional black holes and explicitly discuss a “black hole region” \(B\). They assume a decomposition of the form

\[
\mathbb{R}^4 \simeq \Sigma \cup B, \qquad H \simeq \Sigma \cap B,
\]

where \(H\) is the horizon, and they compare the homology of \(B\) to a standard black-hole region. They also define a standard black-hole region for horizon \(\#_m(S^1 \times S^2)\) as a smooth regular neighborhood of a subspace homeomorphic to a wedge of \(m\) circles in \(S^4\).[^alaee]

This is a strong near miss because the paper uses both “black hole region” and CW-complex language. However, the CW-complex theorem appears as an excision theorem for homotopy groups, with \(X\) decomposed as a union of subcomplexes \(A\) and \(B\). The black-hole region \(B\) is not declared to be a CW cell. It is a topological region / smooth regular neighborhood used in the topology of spatial slices.[^alaee-pdf]

**Verdict:** near miss, not the target.

### 2. Soltani--Rovelli--Martin-Dussaud: cellular decomposition of a black-hole transition region \(B\), not \(B\) as a cell

Soltani, Rovelli, and Martin-Dussaud derive a spin-foam transition amplitude for a black-to-white-hole transition. The paper’s arXiv record describes an explicit expression for the transition amplitude using covariant loop quantum gravity.[^soltani-arxiv]

Inside the construction, the graph \(\Gamma\) is dual to a three-dimensional triangulation of \(\Sigma\), and a two-complex \(C\), with boundary \(\partial C = \Gamma\), is defined by vertices, edges, and faces. The paper states that this construction defines the orientation of every element of the two-complex.[^soltani-pdf]

This is the most literal hit for “black hole” + “cellular decomposition,” but it has the wrong direction of cellularity. The black-hole transition region is the **ambient region being discretized**. The cells are the elements of the spin-foam/two-complex discretization. The black-hole region is not itself a single CW/cellular cell in a larger cellular complex.

**Verdict:** near miss, not the target.

### 3. Savoy: causal cobordisms from combinatorial cell complexes, but no black/hole/cut cells

Savoy’s thesis develops combinatorial cell complexes whose cells are finite vertex sets equipped with rank/dimension data. It also builds a notion of causal cobordism and a category of such cobordisms.[^savoy]

This is framework-adjacent because it connects “cell complex” and “causal structure.” But the cells are abstract combinatorial cells. I found no treatment of black-hole regions, trapped regions, causal diamonds, or causal-past complements \(M \setminus J^-(R)\) as cells.

**Verdict:** adjacent formalism, not a positive example.

### 4. Neiman: “causal cells” are null-faced spacetime polytopes, excluded by the prompt

Neiman’s “Causal cells: spacetime polytopes with null hyperfaces” constructs null polyhedra and null-faced four-polytopes in Minkowski spacetime. The abstract explicitly discusses a tiling of spacetime by copies of such a polytope, with possible relevance to discretizations of curved spacetime and quantum gravity.[^neiman]

This is precisely the ordinary-spacetime-tessellation class excluded by the prompt. The cells are null polytopes in spacetime, not hole-shaped or black-region-shaped cells in a larger moduli/cellular space.

**Verdict:** relevant false positive; excluded.

### 5. Han: causal-diamond language inside Lorentzian spin-foam amplitudes, but cells are spin-foam/polyhedral elements

Han’s 2025 arXiv preprint on Lorentzian spin-foam amplitudes introduces a spinfoam-stack framework to sum amplitudes over classes of 2-complexes.[^han-arxiv] In the local-amplitude discussion, the paper partitions the boundary of a vertex neighborhood into polyhedra. It denotes by \(B^+\) the union of polyhedra in the causal future and \(B^-\) the union of polyhedra in the causal past; their interface corresponds to the corner of a causal diamond.[^han-pdf]

Again, the causal diamond is not a cell. The cell-like objects are polyhedra, faces, links, and 2-complex elements used inside the spin-foam construction.

**Verdict:** near miss, not the target.

### 6. Rainone: black-hole horizon rods plus CW constructions for torus manifolds

Rainone’s thesis contains black-hole horizon rods in rod diagrams and also constructs CW complexes in the study of cohomogeneity-2 torus manifolds. The search hit shows “black hole horizon rod” language near a later construction of a CW complex for a manifold decomposed into pieces of several types.[^rainone]

This is not a positive hit. A horizon rod is a rod-diagram feature whose adjacent rod structures determine horizon cross-sectional topology. The CW complex is built for the torus-manifold/topological construction, not by taking a black-hole region itself as a CW cell.

**Verdict:** near miss, not the target.

## Interpretation

The literature has a well-developed vocabulary for all of the following:

- **black-hole regions** as subsets, complements, inner-boundary regions, or regular neighborhoods;
- **horizons** as boundaries, rods, null hypersurfaces, or causal interfaces;
- **causal diamonds** as spacetime regions, boundary/corner structures, or regions supporting local amplitudes;
- **cell complexes** for triangulations, spin foams, cellular decompositions, causal cobordisms, null-polytope tilings, and torus-manifold constructions.

What I did **not** find is the cross-construction:

> a hole-region / black-hole-region / causal-cut object treated as one cell in a larger CW or cellular indexing space.

That absence matters. It suggests that a proposal to use black-region-shaped objects as cells of a cellular base would likely be a new construction rather than a standard object imported from existing GR, LQG, causal-set, or algebraic-topological literature.

## Working conclusion

The closest established patterns are:

1. **Region-as-object:** a black-hole region is a subspace or submanifold whose topology is studied.
2. **Region-as-domain-of-discretization:** a black-hole or causal-diamond region is decomposed into spin-foam, polyhedral, simplicial, or cellular elements.
3. **Abstract causal cell complex:** causal/cobordism structure is imposed on combinatorial cells, without the cells being black-hole regions.

The target construction—**a hole-shaped, black-region-shaped, trapped-region-shaped, or causal-cut-shaped object as a single CW/cellular cell**—appears to be **unexplored in the searched literature**.

## References

[^alaee]: Aghil Alaee, Hari K. Kunduri, and Eduardo Martínez-Pedroza, “Notes on maximal slices of five-dimensional black holes,” *Classical and Quantum Gravity* 31 (2014): 055004. arXiv:1309.2613. DOI: 10.1088/0264-9381/31/5/055004. The arXiv record gives the title, authors, abstract, journal reference, and DOI.

[^alaee-pdf]: In the PDF, the relevant passage states the setup \(\mathbb{R}^4 \simeq \Sigma \cup B\), \(H \simeq \Sigma \cap B\), discusses the homology of \(B\), defines standard black-hole regions as smooth regular neighborhoods of wedges of circles, and then invokes an excision theorem for CW-complexes decomposed as unions of subcomplexes.

[^soltani-arxiv]: Farshid Soltani, Carlo Rovelli, and Pierre Martin-Dussaud, “The End of a Black Hole’s Evaporation -- Part II,” *Physical Review D* 104 (2021): 066015. arXiv:2105.06876. DOI: 10.1103/PhysRevD.104.066015. The arXiv record describes the paper as deriving a transition amplitude from black to white hole horizon using covariant loop quantum gravity.

[^soltani-pdf]: In the PDF, the graph \(\Gamma\) is defined as dual to a three-dimensional triangulation of \(\Sigma\), and the two-complex \(C\) is defined by vertices, edges, and faces; the paper states that this construction defines the orientation of every element of the two-complex.

[^savoy]: Maxime Savoy, “Combinatorial Cell Complexes: Duality, reconstruction and causal cobordisms,” arXiv:2201.12846, 2022. The abstract defines combinatorial cell complexes with cells as finite vertex sets subject to rank axioms and introduces causal cobordisms.

[^neiman]: Yasha Neiman, “Causal cells: spacetime polytopes with null hyperfaces,” *Geometriae Dedicata* 166 (2013): 237--257. arXiv:1212.2916. DOI: 10.1007/s10711-012-9823-0. The abstract describes null polyhedra, null-faced four-polytopes, and tilings of spacetime by such polytopes.

[^han-arxiv]: Muxin Han, “On the summation and triangulation independence of Lorentzian spinfoam amplitudes for all LQG,” arXiv:2510.26926, 2025. The arXiv abstract describes summing spinfoam amplitudes over infinite classes of 2-complexes generated by stacking faces on a root complex.

[^han-pdf]: In the PDF discussion of the local vertex amplitude, \(B^+\) and \(B^-\) are unions of boundary polyhedra in the causal future/past, and their interface is described as the corner of a causal diamond. The cells remain spin-foam/polyhedral elements.

[^rainone]: Jordan F. Rainone, “Black Holes, Manifolds, and Cohomogeneity-2 Torus Manifolds,” Ph.D. thesis, Stony Brook University, 2022. Search results show black-hole horizon rods in rod diagrams and a later CW-complex construction for torus-manifold pieces; this is a rod/torus-manifold construction, not a black-hole-region-as-cell construction.
