---
title: Textile Mathematics at the 2026 Frontier Topology, computation, mechanics, symmetry, pattern, and textile epistemologies
date-created: 2026-06-26
description: Current as of June 2026.
---
# Textile Mathematics at the 2026 Frontier **Topology, computation, mechanics, symmetry, pattern, and textile epistemologies**

_Current as of June 2026.
I label preprints when they are preprints.
The bibliography is selective but intentionally cross-field._

## I. Executive summary

“Textile mathematics” is not one field.
It is a convergence zone where mathematicians, physicists, computer scientists, materials scientists, textile engineers, designers, historians of craft, and ethnomathematicians study filamentary material systems: yarns, threads, ribbons, loops, braids, crossings, knots, drafts, charts, looms, instructions, and embodied procedures.
A useful abstract definition is: textile mathematics studies **flexible one-dimensional or ribbon-like elements embedded, interlaced, looped, knotted, twisted, or constrained so as to produce fabric-like structures**, together with their symbolic descriptions, fabrication processes, mechanical behavior, cultural meanings, and design spaces.

The current frontier is driven by three simultaneous shifts.
First, textiles are now being treated as **mechanical metamaterials**, where stitch topology, weave interlacement, yarn friction, and contact geometry determine macroscopic elasticity, memory, auxeticity, anisotropy, resilience, and failure.
A 2026 review explicitly frames woven and knitted materials as a relatively underexplored regime of condensed matter, characterized by symmetry, topology, knots/links in thickened tori, yarn-level geometry, dissipation, and defects.
([arxiv.org](https://arxiv.org/html/2604.09005v2)) Second, textile fabrication is becoming a **compiler and programming-language problem**.
Machine knitting research has moved from geometry-to-pattern pipelines toward formal semantics for knitout, instruction graphs, equivalence algorithms, and proof-like guarantees about whether a program fabricates the same textile object.
([cdfg.mit.edu](https://cdfg.mit.edu/publications/compiler-3d-machine-knitting)) Third, ethnomathematics and Indigenous mathematics are forcing a methodological correction: textile mathematics cannot only mean “Western mathematics found inside craft.” It must also ask how living textile traditions encode, transmit, validate, and transform mathematical knowledge without reducing those traditions to decorative examples.
([arxiv.org](https://arxiv.org/abs/2406.16921))

The most active mathematical objects are **yarn paths**, **loop graphs**, **stitch graphs**, **weave drafts**, **crossing relations**, **periodic links in thickened surfaces**, **layer groups**, **finite local constraint systems**, **braid words**, **fabric state spaces**, and **homogenized elastic energies**.
Knitting emphasizes loop intermeshing and serial yarn topology; weaving emphasizes families of strands crossing with over/under data; lace and braiding emphasize braid-group-like local permutations; crochet emphasizes hook-generated loop surfaces and serial growth; sprang and nålbinding suggest underdeveloped mathematical models of warp interlinking and single-element loop construction.

The sharpest 2020–2026 frontiers are these:

1. **Topological knitting and loop complexes.** Knitted structures are being modeled as tangles in tori, yarn topology graphs, directed multigraphs, and categorical/string-diagram semantics.
  ([2020.bridgesmathart.org](https://2020.bridgesmathart.org/regular/103.html))

2. **Computational knitting and inverse design.** The field has moved from “generate instructions” to “prove equivalence, schedule safely, optimize programs, and compile high-level design intent into low-level machine actions.” ([cdfg.mit.edu](https://cdfg.mit.edu/publications/compiler-3d-machine-knitting))

3. **Mechanics and metamaterials.** Stitch-by-stitch mechanics, frictional metastability, 3D printed knits, 3D woven lattices, woven baskets, and double-network woven/truss composites show that textile topology can program nonlinear material response.
  ([arxiv.org](https://arxiv.org/abs/2302.13467))

4. **Weaving symmetry and interlacement algebra.** Classical isonemal-fabric theory is being extended using layer groups, color symmetry, crystallographic methods, and cultural case studies such as Batak weaves.
  ([link.springer.com](https://link.springer.com/article/10.1007/BF01264067))

5. **Formal languages, automata, and graph models.** Textile patterns are naturally symbolic systems: charts, drafts, braid words, stitch grammars, loom states, carrier schedules, and local compatibility constraints.
  This is where textile mathematics meets graph theory, combinatorics, PL semantics, CAD/CAM, and symbolic dynamics.
  ([arxiv.org](https://arxiv.org/abs/2407.00511))

6. **Aperiodic and quasiperiodic textiles.** This area is less mature than periodic weaving or computational knitting, but quasiperiodic bobbin lace, Penrose/Sturmian/Ammann constructions, quasicrystal weaving, and substitution tilings provide a serious entry point.
  ([arxiv.org](https://arxiv.org/abs/1910.07935))

7. **Ethnomathematics and textile epistemologies.** Recent work emphasizes multiple forms of knowing, Indigenous knowledge systems, and strength-based rather than deficit or extraction-oriented approaches.
  Textile epistemology includes pattern, count, rhythm, gesture, material discipline, social transmission, place, memory, and cosmology, not merely symmetry diagrams.
  ([arxiv.org](https://arxiv.org/abs/2406.16921))

The technically hard problems arise because textiles are **hybrid discrete-continuous systems**.
The same fabric is simultaneously a symbolic object, an embedded topological object, a contact/friction system, a programmable artifact, and a cultural practice.
A knit program may be topologically equivalent while mechanically different.
A weave draft may be algebraically simple but materially unstable.
A crochet surface may realize curvature but not at uniform gauge.
A culturally meaningful pattern may possess symmetry but not be epistemically exhausted by symmetry.

The next five years will likely see textile mathematics develop along four axes: verified textile compilers; differentiable and multiscale textile simulation; topological defect and damage-resistance theories; and better methodological frameworks for working with living textile traditions without extracting them into Western academic categories.

---

## II. Field map

| Subfield / method cluster | Objects studied | Mathematical tools | Representative sources | Current open problems |
|---|---|---|---|---|
| Periodic weaving symmetry | Warp/weft designs, isonemal fabrics, layer groups, colorings | Wallpaper groups, frieze groups, crystallographic layer groups, color symmetry | Grünbaum–Shephard; Roth’s 42 isonemal types; Roth’s perfect colorings; 2024 layer-group classifications ([faculty.washington.edu](https://faculty.washington.edu/moishe/branko/BG119.Satins%26twills.pdf)) | Higher-way/higher-fold classifications, finite-boundary corrections, multilayer and nonperiodic generalizations |
| Textile topology | Yarn diagrams, periodic links, tori, thickened surfaces | Knot theory, link diagrams, tangles, invariants, covering spaces | Grishanov–Meshkov–Omelchenko; Markande–Matsumoto; 2026 textile review ([journals.sagepub.com](https://journals.sagepub.com/doi/10.1177/0040517508095600)) | Complete invariants for textile links; relation between topological equivalence and manufacturability |
| Topological knitting | Loops, stitches, dropped loops, cables, lace, increases/decreases | Tangles in tori, graph theory, local rewrites, defect propagation | Knotty Knits; Wooly Graphs; TopoKnit; defect-propagation preprints ([2020.bridgesmathart.org](https://2020.bridgesmathart.org/regular/103.html)) | General knittability criteria; complexity boundaries; topological defect calculus |
| Computational knitting | Knitout programs, machine states, carriers, needle beds | DSLs, compilers, program semantics, scheduling, equivalence, graph rewriting | McCann compiler; KnitScript; KODA; UFO graphs; polynomial equivalence ([cdfg.mit.edu](https://cdfg.mit.edu/publications/compiler-3d-machine-knitting)) | Verified end-to-end compilers; metric-aware semantics; optimization under reliability and mechanics |
| Textile mechanics | Yarn rods, loops, contacts, friction, unit cells | Discrete elastic rods, FEM, homogenization, continuum mechanics, inverse parameter fitting | Singal et al.; Crassous–Poincloux–Steinberger; Sperl et al.; multilevel modeling ([arxiv.org](https://arxiv.org/abs/2302.13467)) | Frictional history, hysteresis, jamming, failure, validated multiscale reduction |
| Textile metamaterials | Stitch programs, woven lattices, 3D printed knits, baskets, actuators | Mechanical programming, topology optimization, graph-encoded architectures, nonlinear elasticity | 3D printed knits; woven metamaterials; woven baskets; double-network woven/truss systems ([arxiv.org](https://arxiv.org/html/2511.07404v1)) | Inverse design of nonlinear response; damage-resilient architectures; programmable failure |
| Lace, braiding, knotting | Bobbin lace grounds, braids, nets, crossings | Braid groups, graph embeddings on tori, combinatorial generation, graph drawing | Irvine–Ruskey; Irvine thesis; Biedl–Irvine; quasiperiodic lace ([arxiv.org](https://arxiv.org/abs/1406.1532)) | Manufacturable nonperiodic lace; braid-word constraints; automated lace design |
| Crochet and loop surfaces | Crochet graphs, amigurumi, hyperbolic crochet, minimal surfaces | Differential geometry, discrete surfaces, graph construction, geodesic distances | Taimina tradition; AmiGo; crochet stitch meshes; Bour minimal surfaces ([arxiv.org](https://arxiv.org/html/2508.10597v1)) | Inverse curvature design, stitch-level mechanics, formal crochet semantics |
| Aperiodic textile patterns | Penrose, Sturmian, Ammann, substitutions, quasicrystal weavings | Symbolic dynamics, tiling theory, local rules, diffraction, combinatorics | Quasiperiodic bobbin lace; Weaving Quasicrystals ([tandfonline.com](https://www.tandfonline.com/doi/abs/10.1080/17513472.2020.1752999)) | Local manufacturability rules; finite machine approximants; mechanical signatures of aperiodicity |
| Color, pattern, information | Colorwork, jacquard pixels, floats, color symmetry, charts | Graph coloring, CSPs, entropy, binary matrices, color group actions | Roth colorings; SPEERLoom matrix drafts; KnitScape slip/tuck colorwork ([link.springer.com](https://link.springer.com/article/10.1007/BF01263572)) | Float-length optimization, multicolor constraints, chart equivalence, color/mechanics coupling |
| Ethnomathematics | Textile processes, Indigenous and traditional knowledge, craft pedagogy | Ethnography, decolonial methodology, situated mathematical analysis, symmetry where appropriate | Xu–Ball; Hunter–Hunter; Bonilla-Tumialán; Batak layer groups ([arxiv.org](https://arxiv.org/abs/2406.16921)) | Non-extractive formalization, community coauthorship, living archives, epistemic pluralism |

---

## III. Historical foundations

### 1. Symmetry in weaving

The classical mathematical study of weaving begins with periodic structures.
A simple woven design can be encoded as a black/white array: black may mean “warp over weft,” white “weft over warp.” This immediately connects weaving to wallpaper groups, frieze groups, color symmetry, crystallography, and matrix algebra.
Grünbaum and Shephard’s 1980 work on satins and twills helped establish the geometry of fabrics as a mathematical topic, while Roth’s 1993 classification of periodic isonemal fabrics identified 42 symmetry types using layer groups and the condition that the fabric symmetry group acts transitively on strands.
([faculty.washington.edu](https://faculty.washington.edu/moishe/branko/BG119.
Satins%26twills.pdf))

The important notion here is **isonemality**: a woven fabric is isonemal when its symmetry group is transitive on strands, so every strand is symmetry-equivalent to every other strand.
This is stronger than merely having a periodic drawdown.
It says the fabric has a global regularity at the strand level.
Roth’s later work on perfect colorings studies when coloring strands is compatible with the fabric symmetry group, either preserving or reversing colors under symmetries.
([link.springer.com](https://link.springer.com/article/10.1007/BF01263572))

Recent group-theoretic weaving work extends this tradition.
De Las Peñas, Tomenes, and collaborators treat two-way twofold and three-way threefold fabrics using layer groups, deriving possible symmetry structures and connecting weaving to crystallographic methods.
([researchgate.net](https://www.researchgate.net/publication/377048588_Symmetry_groups_of_two-way_twofold_and_three-way_threefold_fabrics)) The Batak-weave paper applies layer-group analysis to decorative weave patterns in baskets and household objects of the Batak, an Indigenous community in the Philippines, confirming 15 realized layer groups.
([arxiv.org](https://arxiv.org/abs/2402.17054)) This is mathematically valuable, but it also illustrates a methodological danger: symmetry classification is one valid lens, not the totality of Batak textile knowledge.

### 2. Knot theory, braid theory, and textile topology

The topological view treats a textile as an embedded collection of curves in a thickened surface.
For doubly periodic fabrics, the natural quotient is often a thickened torus \(T^2 \times I\).
Grishanov, Meshkov, and Omelchenko’s 2009 work formalized textile structures as knots and links represented by diagrams on a torus and developed polynomial and numerical invariants, including a Kauffman-type invariant for doubly periodic textile structures.
([journals.sagepub.com](https://journals.sagepub.com/doi/10.1177/0040517508095600))

Knitting pushed this further.
Markande and Matsumoto’s “Knotty Knits are Tangles in Tori” provides an algebra for joining periodic knitted stitches and shows how familiar knitting operations correspond to topological moves.
Their examples include garter, rib, cables, lace, increases, and decreases.
([2020.bridgesmathart.org](https://2020.bridgesmathart.org/regular/103.html)) This was important because it made knitting something more precise than “loops in a grid”: a knitted swatch becomes a tangle-like object whose topology can be composed.

Lace and braiding provide a parallel history.
Bobbin lace involves many threads braided locally, so braid theory and graph embeddings are natural tools.
Irvine and Ruskey introduced a mathematical model for bobbin lace that supports enumeration and generation of patterns via combinatorial search.
([arxiv.org](https://arxiv.org/abs/1406.1532)) Irvine’s thesis models lace grounds as a topological embedding of a 2-regular directed graph on a torus together with vertex labels by braid words.
([dspace.library.uvic.ca](https://dspace.library.uvic.ca/items/867c403c-4f45-4c54-89d1-1c8d138dfe92))

### 3. Hyperbolic crochet and mathematical art/craft

Hyperbolic crochet is the most famous public-facing example of textile mathematics.
Daina Taimina’s 1997 insight was that crochet could produce physical models of hyperbolic planes far more robustly than paper constructions.
Recent mathematical-craft writing continues this lineage, including work on crocheting Bour’s minimal surfaces.
([arxiv.org](https://arxiv.org/html/2508.10597v1))

Belcastro’s 2009 paper “Every topological surface can be knit” is another foundation: it gave an idealized rubber-sheet topology model of knitting with a single strand and proved, using surface classification ideas, that every topological surface can be knit in that model.
([tandfonline.com](https://www.tandfonline.com/doi/abs/10.1080/17513470902896561)) That result is topological rather than mechanical: it says little about gauge, drape, tension, or practical fabrication difficulty.
But it established a clear proof-oriented bridge between fiber craft and low-dimensional topology.

### 4. Textile engineering mechanics

Textile mechanics has older roots in textile engineering, but the current mathematical frontier is newly tied to soft matter physics, contact mechanics, discrete elastic rods, and metamaterials.
A key historical problem remains basic: predicting the relaxed shape and mechanical response of a knitted fabric from yarn length, stitch topology, friction, and boundary conditions.
Crassous, Poincloux, and Steinberger’s 2024 Physical Review Letters work shows that even a simple jersey knit can have a continuous family of metastable rest states stabilized by dry friction in contact zones.
([arxiv.org](https://arxiv.org/abs/2404.07811))

This is the mechanics version of the textile problem: topology alone is not enough; geometry alone is not enough; material law alone is not enough.
The fabric lives in their coupling.

### 5. Computational fabrication and textile compilers

The modern computational-knitting lineage begins with representing fabrication as a compiler problem.
McCann et al.’s 2016 “Compiler for 3D Machine Knitting” takes high-level shape primitives such as sheets and tubes and compiles them into low-level machine instructions, using transfer planning and machine constraints.
([cdfg.mit.edu](https://cdfg.mit.edu/publications/compiler-3d-machine-knitting)) Later work moved from design interfaces toward formal semantics: knitout instructions, fenced tangles, rewrite rules, graph representations, scheduling, equivalence, and optimization.
([researchgate.net](https://www.researchgate.net/publication/372669682_Semantics_and_Scheduling_for_Machine_Knitting_Compilers))

Weaving has an older computational story through Jacquard looms and binary control.
Modern educational and computational work still uses the fact that drafts can be represented as binary matrices: threading, tie-up, treadling, and drawdown can be treated algebraically, with the drawdown obtained from the interaction of those matrices.
([kyliepeppler.com](https://kyliepeppler.com/pubs/uist23-12-accessible.pdf))

---

## IV. Current frontier clusters

## A. Topological knitting and loop complexes

**Core objects.** A knitted fabric can be viewed at several levels: a yarn centerline, a loop diagram, a stitch graph, a tangle in a thickened torus, or a program trace of local stitch operations.
The minimal local operations include knit, purl, tuck, miss, split, transfer, rack, drop, increase, decrease, and cable-like reorderings.
In formal machine-knitting semantics, operations such as tuck, knit, split, drop, rack, and transfer change a topological object while ignoring metric parameters like stitch length when topology is the question.
([computationaldesign.group](https://www.computationaldesign.group/assets/papers/ICFP-2025-Polynomial-Time-Program-Equivalence-for-Machine-Knitting.pdf))

**State of the art.** Markande and Matsumoto gave a topological algebra for periodic knitted stitches as tangles in tori.
([2020.bridgesmathart.org](https://2020.bridgesmathart.org/regular/103.html)) TopoKnit gives a process-oriented yarn-scale topology data structure for weft-knitted textiles, supporting efficient queries between machine/process space and fabric space.
([arxiv.org](https://arxiv.org/abs/2101.04560)) Wooly Graphs proposes graph models for knit objects and shows that deciding existence of a knit object for a graph is NP-hard in general, while special knitting classes admit linear or polynomial algorithms.
([arxiv.org](https://arxiv.org/abs/2407.00511))

The newest topological frontier is defect propagation.
Shimamoto et al.’s 2025 preprint proposes a criterion distinguishing knits and crochets from other textile structures using topological constraints and propagating defects, connecting manufacturability to fragility and damage resistance.
([arxiv.org](https://arxiv.org/abs/2506.22369)) Shimamoto’s 2026 preprint goes further, using controlled unraveling in knitted textiles to implement topology-defined computation: NOT, AND, OR, and a half-adder are implemented by propagation rules on stitch topology rather than by exact geometry.
([arxiv.org](https://arxiv.org/html/2606.14062))

**Why it is hard.** Knitting is locally simple but globally treacherous.
A stitch is not just a vertex in a graph; it is a loop pulled through previous loops with an over/under relation, a yarn order, a direction, a tension history, and a possible machine state.
Topological equivalence can ignore metric data, but physical knittability cannot.
Dropped stitches and laddering are topology-changing events that also require mechanics.

**Likely five-year directions.** Expect categorical or operadic semantics of stitch composition; complete defect calculi for common stitch families; software libraries that carry both topology and metric constraints; and proof-carrying machine-knit programs that certify topological equivalence before fabrication.

---

## B. Computational knitting and inverse design

**Core objects.** The objects are high-level designs, stitch meshes, instruction graphs, knitout programs, carrier schedules, needle-bed states, and physical swatches.
The compiler problem is:

\[ \text{design intent} \longrightarrow \text{topological fabric object} \longrightarrow \text{machine program} \longrightarrow \text{physical textile}. \]

**State of the art.** McCann et al.’s compiler for 3D machine knitting showed how to translate high-level sheet/tube primitives into low-level instructions.
([cdfg.mit.edu](https://cdfg.mit.edu/publications/compiler-3d-machine-knitting)) Narayanan et al. later transformed 3D meshes directly into machine-knitting instructions.
([publications.ri.cmu.edu](https://publications.ri.cmu.edu/automatic-machine-knitting-of-3d-meshes)) KnitScript provides a DSL and virtual machine model for machine knitting, designed to be extensible from Python and usable by knitters and tool builders.
([make4all.org](https://make4all.org/portfolio/knitscript-a-domain-specific-scripting-language-for-advanced-machine-knitting/))

The PL-theoretic frontier is now formal correctness.
Lin et al.’s semantics-and-scheduling work defines a formal knitout semantics using fenced tangles and proves correctness of rewrite rules.
([researchgate.net](https://www.researchgate.net/publication/372669682_Semantics_and_Scheduling_for_Machine_Knitting_Compilers)) UFO instruction graphs establish conditions under which instruction graphs are machine-knittable.
([dl.acm.org](https://dl.acm.org/doi/10.1145/3687948)) KODA optimizes knit programs by dependency analysis, reordering and reducing instructions to improve time and reliability while keeping programs readable.
([pgl.jp](https://pgl.jp/papers/670e0a501c967c002a949423)) Hurtig et al.’s 2025 ICFP work gives a polynomial-time canonicalization/equivalence algorithm for machine-knitting programs using categorical semantics and string-diagram-like representations.
([computationaldesign.group](https://www.computationaldesign.group/assets/papers/ICFP-2025-Polynomial-Time-Program-Equivalence-for-Machine-Knitting.pdf))

**Inverse design.** The inverse problem asks: given a target shape, elasticity tensor, deformation path, sensor response, or color pattern, find a manufacturable stitch program.
Current methods are piecemeal: geometry-to-knit compilers, stitch-mesh generation, yarn-level simulation fitting, and optimization over stitch motifs.
The hard version combines all of them: topology, machine constraints, mechanics, and appearance.

**Why it is hard.** Machine knitting is a constrained distributed manipulation system.
Hundreds of loops sit on needles; transfers can collide; carriers have paths; yarn tension matters; multiple programs may produce equivalent topological objects; and equivalent topology may not produce equivalent mechanics.

**Likely five-year directions.** Verified knitting compilers; e-graph or rewriting-based optimization; differentiable simulation loops for inverse mechanics; libraries of certified stitch transformations; and human-readable high-level languages with compiler-grade guarantees.

---

## C. Textile metamaterials and mechanical programming

**Core objects.** Textile metamaterials use topology and geometry as design variables.
In knitting, changing knit/purl/tuck/cable/decrease patterns changes loop topology and hence stiffness, anisotropy, curling, swelling, and failure.
In weaving, changing interlacement graph and ribbon architecture changes stiffness, resilience, stretchability, and failure modes.

**State of the art.** Singal et al. showed that knitted elasticity can be programmed stitch by stitch: knit and purl stitches, local stitch order, and crossing topology produce yarn-independent mechanical trends.
Their model treats yarn as a space curve with bending energy

\[ E_{\mathrm{bend}}=\frac{B}{2}\int |\partial_s \hat t|^2\,ds, \]

with contact and periodic-cell constraints. ~~~~~~~~~~~~~~~~~~~~~~ Crassous et al. showed that frictional contact gives simple knits many history-dependent rest states, so relaxed fabric shape is not unique.
([arxiv.org](https://arxiv.org/abs/2404.07811))

Recent preprints and articles widen the design space.
Multilevel mechanical modeling combines high-fidelity finite-element yarn models with reduced-order strain-energy models to design heterogeneous weft-knitted fabrics, including an optimized compression sleeve.
([arxiv.org](https://arxiv.org/html/2501.07567v3)) Multiscale 3D-printed knits use exact stitch descriptions and friction/contact simulation to program anisotropic and dissipative response across scales.
([arxiv.org](https://arxiv.org/html/2511.07404v1)) Programmable 3D woven metamaterials encode woven topology as a graph structure, enabling heterogeneous woven lattices with tunable anisotropic stiffness and large stretch.
([arxiv.org](https://arxiv.org/abs/2507.14130)) Woven baskets have now been modeled as stiff yet resilient metamaterials whose corner topologies allow elastic local buckling under large deformation.
([arxiv.org](https://arxiv.org/abs/2506.18197))

**Why it is hard.** The mechanics is nonlinear, dissipative, history-dependent, and multiscale.
Yarn bending, stretching, torsion, contact, sliding, jamming, frictional hysteresis, and boundary effects all contribute.
A stitch library can be measured empirically, but predicting a large heterogeneous textile from local motifs is not yet solved.

**Likely five-year directions.** A serious “materials genome” for stitch and weave motifs; differentiable design maps from stitch graphs to effective moduli; programmable failure and damage arrest; and textile soft robots whose actuation is designed through interlacement topology rather than post-hoc embedded hardware.

---

## D. Weaving, symmetry, and interlacement algebra

**Core objects.** A simple woven fabric has warp strands \(w_i\), weft strands \(v_j\), and a crossing matrix

\[ D_{ij} = \begin{cases} 1 & \text{warp } w_i \text{ passes over weft } v_j,\\ 0 & \text{weft } v_j \text{ passes over warp } w_i. \end{cases} \]

A shaft-loom draft decomposes this into threading, tie-up, treadling, and drawdown matrices.
SPEERLoom’s paper gives the standard educational/computational formulation: because weaving is binary, the components of a draft can be represented as binary matrices whose multiplication yields a drawdown matrix.
([kyliepeppler.com](https://kyliepeppler.com/pubs/uist23-12-accessible.pdf))

**State of the art.** Classical isonemal theory remains foundational.
Roth’s 1993 classification gives 42 symmetry types for two-way twofold periodic isonemal fabrics.
([link.springer.com](https://link.springer.com/article/10.1007/BF01264067)) Roth’s color-work studies show how perfect colorings are constrained by symmetry.
([link.springer.com](https://link.springer.com/article/10.1007/BF01263572)) Recent work by De Las Peñas, Tomenes, and collaborators derives layer-group structures for two-way twofold and three-way threefold fabrics.
([researchgate.net](https://www.researchgate.net/publication/377048588_Symmetry_groups_of_two-way_twofold_and_three-way_threefold_fabrics))

Cultural-historical weaving studies also contribute to mathematical structure.
Bier’s 2022 paper on seventeenth-century Persian velvets analyzes compound woven textiles, drawloom protocols, technical repeat, and symmetry groups such as \(pg\), \(cm\), and \(cmm\).
([digitalcommons.unl.edu](https://digitalcommons.unl.edu/textileresearch/5/)) The Batak-weaves paper demonstrates that Indigenous decorative weave patterns instantiate crystallographic layer groups.
([arxiv.org](https://arxiv.org/abs/2402.17054))

**Why it is hard.** The periodic infinite idealization is mathematically clean, but real cloth is finite, has selvedges, errors, tension differences, yarn thickness, multilayer effects, and cultural pattern logics.
Jacquard looms can actuate individual warp threads, but the resulting design space is enormous.
The algebra of drafts is not just linear algebra over \(\mathbb{F}_2\); it is constrained by loom mechanics, cloth integrity, float lengths, layer separation, and material behavior.

**Likely five-year directions.** Algebraic theories of draft transformations; groupoid models for loom setup changes; finite-boundary and defect-corrected symmetry theory; formal Jacquard compilers; and integration of weave algebra with mechanical simulation.

---

## E. Textile defects, chirality, and topological transitions

**Core objects.** Defects include dropped stitches, ladders, missed tucks, broken yarns, mis-crossings, wrong transfers, weave floats, dislocations, disclinations, holes, and boundary singularities.
Chirality appears in knit/purl structure, twist direction, braid handedness, cable crossings, and yarn ply.

**State of the art.** Singal et al. explicitly connect stitch topology to mechanics and note that knit and purl stitches are related by rotation but can produce different mechanical responses because local crossing order changes topology. ~~~~~~~~~~~~~~~~~~~~~~ Loop order analysis gives algorithms for determining front-to-back ordering of overlapping loops in weft-knitted textiles, which matters for simulating electrical current, water, heat, and force flow through textile structures.
([mdpi.com](https://www.mdpi.com/2673-7248/2/2/15)) Defect-propagation work treats dropped-loop behavior as a topological classifier and design lever.
([arxiv.org](https://arxiv.org/abs/2506.22369))

Topology-defined textile computation is the most striking 2026 example: controlled unraveling propagates discrete states through knitted cells and implements logic gates.
([arxiv.org](https://arxiv.org/html/2606.14062)) This is not just metaphorical “computation”; it uses the topology of loop dependencies to define state transitions.

**Why it is hard.** Defects are topological, geometric, and mechanical at once.
A dropped loop is a topological event; whether it propagates depends on friction, tension, yarn hairiness, stitch density, and neighboring topology.
Chirality can be a diagrammatic sign, a material twist, or a mechanical asymmetry.

**Likely five-year directions.** Topological charges for textile defects; damage-arresting stitch motifs; formal laddering/unraveling automata; chirality measures tied to elastic response; and textile logic devices whose correctness is topological but whose executability is mechanical.

---

## F. Formal languages, automata, and graph models for textile patterns

**Core objects.** Textile instructions are languages.
A knitting chart is a word or two-dimensional word over stitch symbols.
A weave draft is a matrix expression.
A bobbin lace pattern is a graph plus braid words.
A machine-knit program is a sequence of operations over a changing machine state.
A colorwork chart is a constrained coloring problem with float-length, gauge, and motif constraints.

**State of the art.** Wooly Graphs turns knit objects into graph-theoretic structures and studies complexity of realization.
([arxiv.org](https://arxiv.org/abs/2407.00511)) Gray, Bell, and Kobourov model simple knitting patterns as planar graphs with prescribed edge lengths and no crossings, producing a layout algorithm for visualizing patterns.
([arxiv.org](https://arxiv.org/abs/2406.13800)) Machine knitting semantics now uses fenced tangles, categorical/string-diagram ideas, instruction graphs, canonicalization, and program equivalence.
([researchgate.net](https://www.researchgate.net/publication/372669682_Semantics_and_Scheduling_for_Machine_Knitting_Compilers)) Bobbin lace has formal graph and braid-word models supporting generation and enumeration.
([arxiv.org](https://arxiv.org/abs/1406.1532))

**Why it is hard.** Textile formal languages are not purely syntactic.
A string may be grammatical but unknittable; a graph may be drawable but mechanically impossible; a draft may be binary-valid but produce structurally weak cloth.
The “language” has semantics in topology, machine state, and material behavior.

**Likely five-year directions.** Textile subshifts of finite type; proof-carrying patterns; graph-rewrite systems for stitch transformations; compiler IRs shared across CAD tools; and constraint solvers that handle topology, machine actions, color, and mechanics together.

---

## G. Simulation, finite elements, and multiscale mechanics

**Core objects.** At yarn scale, a textile is a set of elastic rods or ribbons with contact and friction.
At fabric scale, it is an anisotropic continuum with effective energy.
Between them lies a difficult homogenization problem.

**State of the art.** Sperl et al. estimate yarn-level simulation models from physical tests on production fabrics, creating a pipeline between measured fabric-level data and yarn-level simulation parameters.
([mslab.es](https://mslab.es/projects/YarnLevelFabrics/)) Ding, Sanchez, Bertoldi, and Rycroft’s hierarchical geometric representation captures mechanical response and anisotropy from yarn rearrangements in knitted fabrics.
([arxiv.org](https://arxiv.org/abs/2307.12360)) The 2025 multilevel modeling framework combines volumetric finite elements, yarn anisotropy, contact, experimentally validated models, and reduced-order strain energy for design.
([arxiv.org](https://arxiv.org/html/2501.07567v3))

**Representative equation.** A yarn-level model often begins with rod energy:

\[ E_{\text{rod}} = \sum_i \int_{\gamma_i} \left[ \frac{EA_i}{2}(\lambda_i-1)^2 + \frac{B_i}{2}\kappa_i^2 + \frac{C_i}{2}(\tau_i-\tau_{0,i})^2 \right]ds + E_{\text{contact}} + E_{\text{friction}}. \]

A homogenized model seeks an effective energy

\[ W_{\mathrm{hom}}(F) = \frac{1}{|\Omega|} \min_{u \ \Lambda\text{-periodic}} \int_{\Omega} W_{\mathrm{micro}}(FX+u(X), \nabla u(X))\,dX, \]

where \(F\) is a macroscopic deformation gradient and \(u\) is a periodic microfluctuation.

**Why it is hard.** Contact is nonsmooth.
Friction is path-dependent.
Yarn sliding causes topological-near transitions without necessarily changing crossing class.
Hysteresis and jamming are common.
Simulations need to resolve tiny contact regions but predict large swatch behavior.

**Likely five-year directions.** Differentiable contact/friction solvers; uncertainty-aware inverse parameter fitting; benchmark datasets of swatches, yarns, and tests; neural surrogates constrained by topology; and multiscale design loops that remain interpretable to textile engineers.

---

## H. Aperiodic, quasiperiodic, and substitution textile patterns

**Core objects.** Aperiodic textile mathematics asks how nonperiodic order can be realized under textile constraints.
Relevant objects include substitution tilings, Sturmian words, Penrose rhombs, Ammann bars, cut-and-project sets, quasiperiodic colorings, and finite approximants.

**State of the art.** The strongest textile-specific formal work is in bobbin lace.
Irvine, Biedl, and Kaplan construct quasiperiodic bobbin lace patterns using Sturmian words, Penrose rhombs, and Ammann-bar decorations.
([arxiv.org](https://arxiv.org/abs/1910.07935)) The published version frames these as nonperiodic lace patterns with long-range order.
([tandfonline.com](https://www.tandfonline.com/doi/abs/10.1080/17513472.2020.1752999)) Artistic-mathematical work such as Weaving Quasicrystals explores woven patterns derived from higher-dimensional quasicrystal constructions, including deformation of a 2D tiling surface in 5D space.
([philip-engel.github.io](https://philip-engel.github.io/weaving_quasicrystals/))

**Why it is hard.** Textile fabrication often wants repeats: loom setup repeats, knitting charts repeat, machine memory repeats, swatches are finite.
Aperiodicity therefore requires either finite approximants, local rules, or adaptive fabrication.
Aperiodic order also interacts with floats, tension, yarn paths, and mechanical heterogeneity.

**Likely five-year directions.** Aperiodic metamaterials whose nonperiodic order changes wave propagation or fracture; local-rule textile patterns with manufacturability proofs; quasicrystalline jacquard/knit CAD; and symbolic-dynamics models of textile charts.

---

## I. Ethnomathematics and textile epistemologies

**Core objects.** Here the “objects” are not only patterns.
They include loom setup, counting practices, gesture sequences, apprenticeship, material selection, cosmology, social obligations, memory, naming, repair, seasonal timing, and relations to land and community.

**State of the art.** Xu and Ball’s 2024 scoping review identifies 169 studies of ethnomathematics and Indigenous mathematics, maps research stages from 1984 to 2023, and emphasizes two central problems: where to look for mathematical knowledge and how to decode it from cultural practices without remaining trapped inside Eurocentric boundaries.
([arxiv.org](https://arxiv.org/abs/2406.16921)) Hunter and Hunter’s work in Aotearoa/New Zealand uses an Indigenous research model, Tivaevae, and argues for centering Indigenous knowledge systems through strength-based mathematics education rather than treating Pacific students as a deficit problem.
([link.springer.com](https://link.springer.com/article/10.1007/s10649-023-10256-7))

Textile-specific ethnomathematical work includes Bonilla-Tumialán’s study of Peruvian Andean weaving on a four-stake loom in Puno, which uses ethnographic fieldwork, participant observation, and interviews to identify mathematical knowledge in Quechua loom-weaving processes.
([link.springer.com](https://link.springer.com/chapter/10.1007/978-3-031-31293-9_13)) The Batak-weaves layer-group paper shows one way formal symmetry can participate in cultural textile analysis, while also reminding us that group theory is only one layer of textile meaning.
([arxiv.org](https://arxiv.org/abs/2402.17054))

**Why it is hard.** There is an epistemic risk: taking a living tradition, extracting a symmetry group or graph, and calling that “the mathematics” can erase the people whose knowledge made the structure possible.
The mathematical frontier here is also methodological: how to produce formal analysis that is accountable to the knowledge holders and not merely to academic disciplines.

**Likely five-year directions.** Coauthored textile mathematics with makers and communities; living archives that preserve process rather than only pattern; formal models that include gesture and fabrication sequence; and stronger protocols for consent, attribution, benefit, and refusal.

---

## V. Mathematical formalism

### 1. Textile graph

A **textile graph** is a tuple

\[ \mathcal{T}=(G,\Gamma,\pi,\rho,C,\epsilon,\lambda), \]

where:

- \(G=(V,E)\) is a combinatorial graph of textile events: crossings, loops, transfers, joins, boundaries, or stitch sites.
- \(\Gamma=\{\gamma_1,\dots,\gamma_m\}\) is a set of yarn paths.
- \(\pi:\Gamma\to |G|\) records how yarns traverse the graph.
- \(\rho_i>0\) is yarn radius or effective thickness.
- \(C\) is a set of crossings or contacts.
- \(\epsilon:C\to\{+1,-1\}\) is an over/under crossing relation.
- \(\lambda\) labels local structure: knit, purl, tuck, warp-over, weft-over, braid generator, etc.

For periodic textiles, \(G\) may be finite only after quotienting by a lattice \(\Lambda\cong\mathbb{Z}^2\), so the textile graph lives on a torus.

### 2. Yarn path

A **yarn path** is a continuous or piecewise-smooth embedded curve

\[ \gamma_i:S_i\to M, \]

where \(S_i\) is an interval or circle and \(M\) is usually \(\mathbb{R}^3\), a thickened plane, or a thickened surface \(\Sigma\times I\).
Nonpenetration requires

\[ \|\gamma_i(s)-\gamma_j(t)\|\ge \rho_i+\rho_j \]

except where contact is explicitly allowed as inequality saturation.

### 3. Crossing relation

Given a projection \(p:M\to\Sigma\), a crossing occurs when

\[ p(\gamma_i(s))=p(\gamma_j(t)), \qquad (i,s)\neq(j,t), \]

with distinct heights.
The crossing sign or over/under relation is

\[ \epsilon(i,s;j,t)= \operatorname{sgn}(z_i(s)-z_j(t)). \]

In weave notation, this becomes the binary drawdown entry \(D_{ij}\).
In knot theory, it is part of a link diagram.
In knitting, it participates in loop dependency.

### 4. Stitch graph / loop graph

A **loop graph** for weft knitting can be modeled as

\[ L=(V,E_{\mathrm{yarn}},E_{\mathrm{support}},E_{\mathrm{course}},E_{\mathrm{wale}},\sigma), \]

where:

- \(V\) are loop segments or stitch heads.
- \(E_{\mathrm{yarn}}\) follows the continuous yarn order.
- \(E_{\mathrm{support}}\) records “loop pulled through loop” relations.
- \(E_{\mathrm{course}}\) records row/course adjacency.
- \(E_{\mathrm{wale}}\) records column/wale adjacency.
- \(\sigma\) labels local operations: knit, purl, tuck, miss, split, transfer, decrease, increase.

A dropped stitch deletes or releases support edges and may induce a cascade.

### 5. Weave draft

For a shaft loom, let:

- \(Th\) be the threading matrix: warp ends to shafts.
- \(Tu\) be the tie-up matrix: shafts to treadles.
- \(Tr\) be the treadling matrix: weft picks to treadles.
- \(D\) be the drawdown.

In a simplified Boolean or binary algebra,

\[ D = Tr \cdot Tu^{T}\cdot Th. \]

The exact algebra depends on convention: ordinary arithmetic, Boolean semiring, or mod-2 arithmetic are different formalizations.
The textile meaning is over/under selection, not abstract multiplication alone.
SPEERLoom uses this matrix structure to teach weaving as mathematics and engineering.
([kyliepeppler.com](https://kyliepeppler.com/pubs/uist23-12-accessible.pdf))

### 6. Local compatibility constraint

Let \(A\) be a finite alphabet of local textile states: stitch symbols, crossing symbols, yarn-carrier states, colors, or draft cells.
A **local compatibility system** is a set

\[ \mathcal{F}\subseteq A^N \]

of allowed neighborhoods.
A global textile chart is

\[ x\in A^{\mathbb{Z}^2} \]

such that every finite neighborhood of \(x\) lies in \(\mathcal{F}\).
This is a textile version of a subshift of finite type.
Machine constraints, float limits, lace-braid consistency, or aperiodic local rules can all be encoded this way.

### 7. Periodic textile pattern

A textile pattern \(P\subset M\) is **periodic** if there exists a rank-two lattice \(\Lambda\subset \mathrm{Isom}(M)\) such that

\[ \lambda(P)=P\quad\forall\lambda\in\Lambda. \]

The quotient \(P/\Lambda\) lives in a thickened torus.
This is why both woven and knitted periodic fabrics naturally connect to torus links and layer groups.

### 8. Symmetry group of a textile pattern

The **symmetry group** is

\[ \mathrm{Sym}(P)=\{g\in \mathrm{Isom}(M):g(P)=P\}. \]

For colored textiles, with color map \(c:P\to K\), one may require either strict color preservation,

\[ c(gx)=c(x), \]

or color symmetry,

\[ c(gx)=\varphi_g(c(x)) \]

for a permutation \(\varphi_g\in \mathrm{Sym}(K)\).
Roth’s perfect colorings are an example of symmetry-compatible textile coloring.
([link.springer.com](https://link.springer.com/article/10.1007/BF01263572))

### 9. Fabric state space

Fix a textile topology class \(\mathcal{K}\), material parameters \(\theta\), boundary data \(B\), and admissible contacts.
The **fabric state space** is

\[ \mathcal{S}(\mathcal{K},B,\theta) = \{q=(\gamma_i,\text{frames},\text{contacts}) : q \text{ realizes } \mathcal{K}, \ q|_{\partial}=B, \ q \text{ satisfies nonpenetration}\}. \]

A mechanical state is a point \(q\in\mathcal{S}\).
Equilibria minimize or locally extremize an energy \(E(q;\theta)\), often with inequality constraints and frictional history.

### 10. Topological defect

A **topological defect** is a local or global obstruction to extending a regular textile structure.
Formally, it can be:

- a violation of local compatibility;
- a nontrivial holonomy around a loop;
- a missing support relation;
- a changed crossing sign;
- a local surgery on the textile graph;
- a nonzero element in a defect-charge group.

For knitting, dropped stitches and laddering are topological transitions.
For weaving, a wrong over/under crossing is a defect in the drawdown.
For lace, a wrong braid generator changes the braid word.

### 11. Inverse design problem

Given a compiler \(C\), simulator \(S\), and target property \(y^\*\), textile inverse design is:

\[ \min_{p\in\mathcal{L},\,\theta} \mathcal{L}_{\mathrm{target}} \big(S(C(p),\theta),y^\*\big) + R(p,\theta) \]

subject to

\[ \mathrm{Manufacturable}(p)=\mathrm{true}. \]

Here \(p\) may be a stitch program, weave draft, lace grammar, crochet graph, or color chart.

### 12. Homogenized elastic energy

If \(\Omega\) is a periodic unit cell and \(F\) a macroscopic deformation gradient, the homogenized energy is:

\[ W_{\mathrm{hom}}(F) = \frac{1}{|\Omega|} \min_{u\in\mathcal{U}_{\mathrm{per}}} E_{\mathrm{micro}}(F X+u(X)). \]

The frontier problem is to choose \(E_{\mathrm{micro}}\) rich enough to include yarn bending, stretching, contact, friction, and topology, but cheap enough for inverse design.

---

## VI. Connections across subfields

**Knitting vs weaving.** Weaving is primarily an interlacement of strand families: over/under data at crossings of warp and weft.
Knitting is primarily an intermeshing of loops: new loops are pulled through old loops, producing support dependencies.
Weaving’s simplest algebra is a binary matrix; knitting’s simplest algebra is closer to a local graph rewrite system or tangle composition.

**Textiles as embedded graphs or links.** Almost every textile can be projected to a graph with over/under data.
For periodic structures, the quotient graph often lives on a torus.
This is why knot theory, braid theory, graph embeddings, and crystallographic groups recur across weaving, knitting, lace, and braiding.

**Charts as formal languages.** A chart is a two-dimensional word; a draft is a matrix program; a machine-knit instruction sequence is a DSL program; a lace ground is a graph grammar with braid labels.
Correctness requires semantics: what object does the language denote?

**Mechanics as topology plus geometry plus material law.** Topology tells which strands pass through which loops or crossings.
Geometry gives lengths, curvatures, and contact locations.
Material law gives bending, stretching, torsion, friction, and dissipation.
Mechanical behavior is their coupled consequence.

**Computational fabrication as compiler theory.** The modern textile compiler must type-check topology, schedule machine actions, optimize efficiency, preserve semantics, and respect physical constraints.
Machine knitting has already reached formal semantics and polynomial equivalence; weaving and crochet are less developed but structurally similar compiler domains.

**Color and pattern as constraints.** Colorwork, jacquard design, and patterned lace are graph/coloring/CSP problems with material side conditions: float length, yarn dominance, gauge, strand order, layer integrity, and manufacturability.

**Defects as local violations, singularities, or charges.** A dropped stitch, a wrong crossing, and a dislocation can all be treated as local failures of a regular rule.
The frontier is to connect this symbolic defect to mechanical propagation and damage resistance.

---

## VII. Open problems and research opportunities

| # | Problem | Why it matters | Required background / source literatures | Tractability |
|---:|---|---|---|---|
| 1 | Define a unified category of textile structures covering weaving, knitting, crochet, lace, braiding, sprang, and nålbinding. | Would clarify which transformations preserve textile identity. | Knot theory, category theory, textile engineering, craft notation | Speculative |
| 2 | Characterize general knittability of loop graphs. | Turns “can this graph be knit?” into a theorem/procedure. | Wooly Graphs, machine knitting, graph theory | Medium-term |
| 3 | Find sharp complexity boundaries for knittability subclasses. | Distinguishes tractable design tools from NP-hard search. | Graph algorithms, computational knitting | Near/medium |
| 4 | Build complete invariants for doubly periodic textile links in thickened tori. | Needed for topological classification beyond examples. | Knot theory, periodic links, textile topology | Medium/speculative |
| 5 | Relate topological equivalence to mechanical equivalence. | Same topology can behave differently; design needs both. | Mechanics, knot theory, homogenization | Speculative |
| 6 | Create a defect-propagation algebra for dropped stitches and laddering. | Enables damage-resistant knits and topological logic. | Defect propagation, automata, soft matter | Near/medium |
| 7 | Extend defect propagation to crochet and lace. | Tests whether “loop dependency” generalizes beyond knitting. | Crochet graphs, braid theory, topology | Medium |
| 8 | Formalize chirality in stitches, yarn twist, and braid operations. | Chirality strongly affects actuation and anisotropy. | Differential geometry, knot theory, mechanics | Medium |
| 9 | Prove metric realizability of textile graphs with finite yarn thickness. | A topological pattern may be impossible at real gauge. | Geometric topology, contact geometry, CAD | Speculative |
| 10 | Develop verified machine-knitting compilers. | Prevents machine crashes and guarantees object equivalence. | PL semantics, knitout, formal methods | Near |
| 11 | Add metric/mechanical semantics to current topological knit semantics. | Correct topology is insufficient for wearable function. | PL, simulation, mechanics | Medium |
| 12 | Build an intermediate representation common to knitting CAD tools. | Avoids fragmented tooling and enables optimization passes. | Compiler IRs, textile CAD | Near |
| 13 | Solve inverse design for target elastic tensors using stitch patterns. | Direct route to programmable knitted metamaterials. | Optimization, mechanics, machine knitting | Medium |
| 14 | Solve inverse design for nonlinear/hysteretic textile response. | Needed for damping, soft robotics, and adaptive structures. | Frictional mechanics, nonlinear optimization | Speculative |
| 15 | Create differentiable yarn-level simulators with robust contact/friction. | Enables gradient-based inverse design. | DER, FEM, differentiable simulation | Medium |
| 16 | Build benchmark datasets of yarns, stitches, swatches, and mechanical tests. | Field lacks shared validation standards. | Experimental mechanics, data standards | Near |
| 17 | Homogenize textile mechanics while preserving topology. | Bridges yarn-scale simulation and garment-scale design. | Homogenization, continuum mechanics | Medium |
| 18 | Model metastable rest-shape continua in common fabrics. | Fabric shape depends on history, not just pattern. | Friction, elastica, PRL-style soft matter | Near/medium |
| 19 | Develop algebraic theory of weave drafts over appropriate semirings. | Clarifies what draft multiplication really means. | Linear algebra, Boolean algebra, weaving | Near |
| 20 | Classify higher-way/higher-fold woven symmetry groups. | Extends isonemal theory to richer textiles. | Crystallography, group theory | Medium |
| 21 | Include finite boundaries, selvedges, and errors in symmetry theory. | Real textiles are finite and defectful. | Group actions, finite patterns | Medium |
| 22 | Connect jacquard matrix design to mechanical weave properties. | Pattern design and structural design are usually separated. | Weaving, mechanics, optimization | Medium |
| 23 | Formalize float-length and color-dominance constraints as graph/CSP problems. | Important for practical stranded colorwork and jacquard. | Graph coloring, constraint programming, craft practice | Near |
| 24 | Develop entropy and enumeration theory for textile pattern classes. | Counts design spaces and measures complexity. | Combinatorics, symbolic dynamics | Medium |
| 25 | Construct manufacturable aperiodic knit/weave/lace systems from local rules. | Brings aperiodic order into physical textile fabrication. | Tiling theory, automata, CAD | Medium/speculative |
| 26 | Study mechanical properties of quasiperiodic textile metamaterials. | Aperiodicity may tune waves, fracture, or anisotropy. | Quasicrystals, mechanics, textile fabrication | Speculative |
| 27 | Generalize bobbin-lace braid models to broader lace traditions. | Prevents overfitting to one lace ground formalism. | Braid theory, ethnographic lace knowledge | Medium |
| 28 | Formalize sprang as a braid/interlinking dynamical system. | Sprang is mathematically natural but under-modeled. | Braid theory, textile archaeology, craft practice | Medium |
| 29 | Formalize nålbinding loop structures and Hansen-code-like notation mathematically. | Distinguishes nålbinding from knitting/crochet in loop topology. | Loop theory, craft notation, archaeology | Medium |
| 30 | Inverse design of crochet curvature and stuffed 3D shape. | Connects hyperbolic crochet, amigurumi, and geometry processing. | Discrete differential geometry, crochet graphs | Near/medium |
| 31 | Topological textile computation beyond Boolean gates. | Opens mechanical computing and programmable matter. | Automata, topology, metamaterials | Speculative |
| 32 | Integrate sensors and conductive yarns into formal textile design. | Smart textiles need topology-aware circuit/material design. | E-textiles, circuits, textile CAD | Medium |
| 33 | Develop ethical protocols for mathematical work with living textile traditions. | Avoids extraction and misattribution. | Ethnomathematics, Indigenous studies, research ethics | Near |
| 34 | Build community-controlled textile-math archives. | Preserves process, language, gesture, and attribution. | Digital humanities, ethnography, archival science | Medium |
| 35 | Study textile repair as mathematics. | Repair changes topology, mechanics, and meaning. | Topology, maintenance studies, craft ethnography | Speculative |

---

## VIII. Annotated bibliography

### Broad reviews and field-defining sources

**Dresselhaus, Elizabeth J.; Mahmoudi, Sonia; Niu, Lauren; Poincloux, Samuel; Sanchez, Vanessa; Dimitriyev, Michael S. “Textiles: from twisted yarn to topology and mechanics.” arXiv:2604.09005v2, 2026.** A current review framing textiles as condensed-matter/metamaterial systems involving yarn mechanics, symmetry, topology, knots/links in thickened tori, defects, and mechanical response.
Type: theoretical/review.
([arxiv.org](https://arxiv.org/html/2604.09005v2))

**Grünbaum, Branko; Shephard, Geoffrey C. “Satins and Twills: An Introduction to the Geometry of Fabrics.” Mathematics Magazine, 1980.** Classical entry point to the geometry of woven fabrics, especially periodic weave structures.
Type: theoretical/foundational.
([faculty.washington.edu](https://faculty.washington.edu/moishe/branko/BG119.
Satins%26twills.pdf))

**Belcastro, sarah-marie. “Every topological surface can be knit: a proof.” Journal of Mathematics and the Arts, 2009.
DOI: 10.1080/17513470902896561.** Idealized topological model showing every topological surface can be knit.
Important as a proof-based bridge from fiber craft to topology.
Type: theoretical/mathematical craft.
([tandfonline.com](https://www.tandfonline.com/doi/abs/10.1080/17513470902896561))

### Textile topology

**Grishanov, S.A.; Meshkov, V.R.; Omelchenko, A.V. “A Topological Study of Textile Structures.
Part I.” Textile Research Journal, 2009.** Models textile structures as knots/links represented by diagrams on a torus.
Type: theoretical/topological.
([journals.sagepub.com](https://journals.sagepub.com/doi/10.1177/0040517508095600))

**Grishanov, S.A.; Meshkov, V.R.; Omelchenko, A.V. “A Topological Study of Textile Structures.
Part II: Topological Invariants in Application to Textile Structures.” Textile Research Journal, 2009.** Develops numerical and polynomial invariants, including Kauffman-type invariants for doubly periodic textile structures.
Type: theoretical/topological.
([agris.fao.org](https://agris.fao.org/search/en/providers/122535/records/65de9b227c7033e84beb1836))

**Markande, Shashank G.; Matsumoto, Elisabetta A. “Knotty Knits are Tangles in Tori.” Bridges, 2020.** Formalizes periodic knitted stitches as tangles in tori and gives operations corresponding to knitting moves.
Type: theoretical/topological.
([2020.bridgesmathart.org](https://2020.bridgesmathart.org/regular/103.html))

### Knitting topology, graph theory, and defects

**Kapllani, Levi; Amanatides, Chelsea; Dion, Genevieve; Shapiro, Vadim; Breen, David E. “TopoKnit: A Process-Oriented Representation for Modeling the Topology of Yarns in Weft-Knitted Textiles.” arXiv:2101.04560, 2021.** Defines a yarn-scale topology data structure for weft knitting, bridging machine/process and fabric spaces.
Type: computational/topological.
([arxiv.org](https://arxiv.org/abs/2101.04560))

**Kapllani, Amanatides, Dion, Breen. “Loop Order Analysis of Weft-Knitted Textiles.” 2022.** Develops algorithms for front-to-back loop ordering, relevant to physical flow and topology-aware simulation.
Type: computational/topological.
([mdpi.com](https://www.mdpi.com/2673-7248/2/2/15))

**Gray, Kathryn; Bell, Brian; Sieper, Diana; Kobourov, Stephen; Schreiber, Falk; Klein, Karsten; Hong, Seokhee. “Wooly Graphs: A Mathematical Framework for Knitting.” arXiv:2407.00511, 2024.** Graph models for knit objects, with complexity results including NP-hardness in general and tractable cases.
Type: theoretical/computational.
([arxiv.org](https://arxiv.org/abs/2407.00511))

**Gray, Kathryn; Bell, Brian; Kobourov, Stephen. “A Graph Model and a Layout Algorithm for Knitting Patterns.” arXiv:2406.13800, 2024.** Models simple knitting patterns as planar graphs with edge-length constraints and no crossings.
Type: computational/graph drawing.
([arxiv.org](https://arxiv.org/abs/2406.13800))

**Shimamoto, Daisuke S.; Shimamoto, Keiko; Mahmoudi, Sonia; Poincloux, Samuel. “Topological Defect Propagation to Classify Knitted Fabrics.” arXiv:2506.22369, 2025 preprint.** Uses topological defect propagation to distinguish knits/crochets and reason about fragility/damage resistance.
Type: theoretical/preprint.
([arxiv.org](https://arxiv.org/abs/2506.22369))

**Shimamoto, Daisuke S. “Topology-defined computation in knitted textiles.” arXiv:2606.14062, 2026 preprint.** Implements logic gates and a half-adder through controlled unraveling of knitted topology.
Type: theoretical/experimental preprint.
([arxiv.org](https://arxiv.org/html/2606.14062))

### Computational knitting and textile compilers

**McCann, James; Albaugh, Lea; Narayanan, Vidya; Grow, April; Matusik, Wojciech; Mankoff, Jennifer; Hodgins, Jessica. “A Compiler for 3D Machine Knitting.” ACM TOG, 2016.
DOI: 10.1145/2897824.2925940.** Foundational compiler from high-level 3D knit primitives to machine instructions.
Type: computational fabrication.
([cdfg.mit.edu](https://cdfg.mit.edu/publications/compiler-3d-machine-knitting))

**Narayanan, Vidya; Albaugh, Lea; Hodgins, Jessica; Coros, Stelian; McCann, James. “Automatic Machine Knitting of 3D Meshes.” ACM TOG, 2018.** Transforms 3D meshes into machine-knitting instructions.
Type: computational fabrication.
([publications.ri.cmu.edu](https://publications.ri.cmu.edu/automatic-machine-knitting-of-3d-meshes))

**Lin, Jenny; McCann, James. “An Artin Braid Group Representation of Knitting Machine State with Applications to Validation and Optimization of Fabrication Plans.” ICRA, 2021.** Uses braid-group ideas for machine-state validation and optimization.
Type: computational/topological robotics.
([dl.acm.org](https://dl.acm.org/doi/10.1109/ICRA48506.2021.9562113))

**Lin, Jenny; Narayanan, Vidya; Ikarashi, Yuka; Ragan-Kelley, Jonathan; Bernstein, Gilbert; McCann, James. “Semantics and Scheduling for Machine Knitting Compilers.” ACM TOG, 2023.
DOI: 10.1145/3592449.** Defines formal semantics for knitout using fenced tangles and correctness-preserving rewrites.
Type: PL semantics/computational fabrication.
([researchgate.net](https://www.researchgate.net/publication/372669682_Semantics_and_Scheduling_for_Machine_Knitting_Compilers))

**Hofmann, Megan et al. “KnitScript.” UIST, 2023.** A DSL and virtual machine model for machine knitting, with Python extensibility and user studies.
Type: HCI/DSL/computational fabrication.
([make4all.org](https://make4all.org/portfolio/knitscript-a-domain-specific-scripting-language-for-advanced-machine-knitting/))

**Hofmann, Megan. “KODA: Knit-program Optimization by Dependency Analysis.” UIST, 2024.
DOI: 10.1145/3654777.3676405.** Optimizes knit programs by reordering and reducing instructions while preserving intended fabric behavior.
Type: program optimization.
([pgl.jp](https://pgl.jp/papers/670e0a501c967c002a949423))

**Lin, Jenny Han; Ikarashi, Yuka; Bernstein, Gilbert; McCann, James. “UFO Instruction Graphs Are Machine Knittable.” ACM TOG, 2024.
DOI: 10.1145/3687948.** Characterizes instruction graphs that correspond to machine-knittable programs.
Type: computational/theoretical.
([dl.acm.org](https://dl.acm.org/doi/10.1145/3687948))

**Hurtig, Nathan; Lin, Jenny Han; Price, Thomas; McCann, James; Bernstein, Gilbert. “Polynomial-Time Program Equivalence for Machine Knitting.” PACMPL / ICFP, 2025.** Gives polynomial-time canonicalization/equivalence for topological semantics of machine-knitting programs.
Type: PL theory/formal methods.
([computationaldesign.group](https://www.computationaldesign.group/assets/papers/ICFP-2025-Polynomial-Time-Program-Equivalence-for-Machine-Knitting.pdf))

### Mechanics, simulation, and metamaterials

**Singal, Kartik; Dimitriyev, Michael S.; Gonzalez, Sofia E.; Cachine, Alyssa P.; Quinn, Sarah; Matsumoto, Elisabetta A. “Programming Mechanics in Knitted Materials, Stitch by Stitch.” Nature Communications, 2024.** Shows how local stitch topology programs elastic response; combines experiments and simulation.
Type: experimental/computational mechanics. ~~~~~~~~~~~~~~~~~~~~~~

**Crassous, Jérôme; Poincloux, Samuel; Steinberger, Audrey. “Metastability of a Periodic Network of Threads: Shapes of a Knitted Fabric.” Physical Review Letters, 2024.
DOI: 10.1103/PhysRevLett.
133.248201.** Shows history-dependent metastable rest states in a simple knit due to frictional contact.
Type: experimental/theoretical soft matter.
([arxiv.org](https://arxiv.org/abs/2404.07811))

**Sperl, Georg; Narain, Rahul; Wojtan, Chris. “Estimation of Yarn-Level Simulation Models for Production Fabrics.” ACM TOG, 2022.** Fits yarn-level simulation models from real fabric tests.
Type: computational simulation/experimental fitting.
([mslab.es](https://mslab.es/projects/YarnLevelFabrics/))

**Ding, X.; Sanchez, V.; Bertoldi, K.; Rycroft, C.H. “Unravelling the Mechanics of Knitted Fabrics Through Hierarchical Geometric Representation.” Proceedings of the Royal Society A, 2024.** Hierarchical yarn model for knitted fabric mechanics and anisotropy.
Type: computational/theoretical mechanics.
([arxiv.org](https://arxiv.org/abs/2307.12360))

**du Pasquier et al. “Multi-level mechanical modeling and computational design framework for weft knitted fabrics.” arXiv, 2025 preprint.** High-fidelity FEM plus reduced-order models for design of heterogeneous knitted textiles.
Type: computational mechanics/preprint.
([arxiv.org](https://arxiv.org/html/2501.07567v3))

**Cline et al. “Entanglement-driven responses through multiscale 3D-printed knits.” arXiv / PNAS-linked, 2025–2026.** Uses 3D printed knitted architectures to study entanglement-driven mechanics and scaling.
Type: experimental/computational mechanics.
([arxiv.org](https://arxiv.org/html/2511.07404v1))

**Carton, Molly; Surjadi, James Utama; Aymon, Bastien F.G.; Portela, Carlos M. “Design framework for programmable three-dimensional woven metamaterials.” arXiv:2507.14130, 2025 preprint.** Graph-encoded woven topology for tunable 3D woven lattices with anisotropic stiffness and stretchability.
Type: computational/experimental preprint.
([arxiv.org](https://arxiv.org/abs/2507.14130))

**Tu, Guowei Wayne; Filipov, Evgueni T. “Corner Topology Makes Woven Baskets into Stiff, yet Resilient Metamaterials.” Physical Review Research, 2025 / arXiv:2506.18197.** Shows basket-corner topologies provide stiffness and resilience through local buckling.
Type: experimental/computational mechanics.
([arxiv.org](https://arxiv.org/abs/2506.18197))

### Weaving, symmetry, and cultural-historical textile mathematics

**Roth, Richard L. “The Symmetry Groups of Periodic Isonemal Fabrics.” Geometriae Dedicata, 1993.** Classifies 42 symmetry types of two-way twofold periodic isonemal fabrics.
Type: theoretical/group theory.
([link.springer.com](https://link.springer.com/article/10.1007/BF01264067))

**Roth, Richard L. “Perfect Colorings of Isonemal Fabrics Using Two Colors, Thin Striping, and Thick Striping.” Geometriae Dedicata, 1995.** Studies colorings compatible with textile symmetries.
Type: theoretical/color symmetry.
([link.springer.com](https://link.springer.com/article/10.1007/BF01263572))

**De Las Peñas, Ma.
Louise Antonette; Tomenes, Mark; Liza, Jan. “Symmetry groups of two-way twofold and three-way threefold fabrics.” Acta Crystallographica A, 2024.** Uses layer groups and color symmetry to derive symmetry structures for fabric classes.
Type: theoretical/crystallographic.
([researchgate.net](https://www.researchgate.net/publication/377048588_Symmetry_groups_of_two-way_twofold_and_three-way_threefold_fabrics))

**De Las Peñas, Ma.
Louise Antonette; Garciano, Agnes; Verzosa, Debbie Marie; Tomenes, Mark. “Layer Groups of Batak Weaves.” arXiv:2402.17054, 2024 preprint.** Analyzes symmetry structures of Batak decorative weaves and identifies 15 layer groups.
Type: mathematical/cultural case study.
([arxiv.org](https://arxiv.org/abs/2402.17054))

**Bier, Carol. “Persian Velvets of the 17th Century: Symmetry, Craft, and Technology.” 2022.** Connects compound weaving, drawloom technology, technical repeat, and plane symmetry.
Type: historical/mathematical textile study.
([digitalcommons.unl.edu](https://digitalcommons.unl.edu/textileresearch/5/))

**Speer, Samantha et al. “SPEERLoom: An Open-Source Loom Kit for Interdisciplinary Engagement in Math, Engineering, and Textiles.” UIST, 2023.
DOI: 10.1145/3586183.3606724.** Uses Jacquard weaving to teach matrix algebra, engineering, and textile construction.
Type: HCI/education/computational weaving.
([kyliepeppler.com](https://kyliepeppler.com/pubs/uist23-12-accessible.pdf))

### Crochet, lace, aperiodicity

**Irvine, Veronika; Ruskey, Frank. “Developing a Mathematical Model for Bobbin Lace.” arXiv:1406.1532, 2014.** Defines a combinatorial/braid-theoretic model for generating bobbin lace patterns.
Type: theoretical/computational.
([arxiv.org](https://arxiv.org/abs/1406.1532))

**Irvine, Veronika. “A mathematical model for bobbin lace.” PhD thesis, 2016.** Develops lace grounds as graph embeddings on tori with braid-word labels.
Type: theoretical/computational.
([dspace.library.uvic.ca](https://dspace.library.uvic.ca/items/867c403c-4f45-4c54-89d1-1c8d138dfe92))

**Biedl, Therese; Irvine, Veronika. “Drawing Bobbin Lace Graphs.” 2017.** Graph-drawing and verification algorithms for periodic lace graphs on a torus.
Type: graph theory/computational.
([arxiv.org](https://arxiv.org/abs/1708.09778))

**Irvine, Veronika; Biedl, Therese; Kaplan, Craig. “Quasiperiodic Bobbin Lace Patterns.” 2020.** Constructs quasiperiodic lace families using Sturmian words, Penrose rhombs, and Ammann bars.
Type: aperiodic/combinatorial textile design.
([tandfonline.com](https://www.tandfonline.com/doi/abs/10.1080/17513472.2020.1752999))

**Edelstein, Michal; Peleg, Hila; Itzhaky, Shachar; Ben-Chen, Mirela. “AmiGo: Computational Design of Amigurumi Crochet Patterns.” SCF, 2022 / arXiv:2211.01178.** Generates crochet instructions from 3D models using crochet graphs.
Type: computational fabrication.
([arxiv.org](https://arxiv.org/abs/2211.01178))

**Guo, Runbo; Lin, Jenny; Narayanan, Vidya; McCann, James. “Representing Crochet with Stitch Meshes.” SCF, 2020.** Represents crochet patterns as stitch meshes to expose yarn layout and structure.
Type: computational fabrication.
([dl.acm.org](https://dl.acm.org/doi/fullHtml/10.1145/3424630.3425409))

**Kekkonen, H. “Crocheting Bour’s Minimal Surfaces.” 2024.** Provides precise crochet constructions for minimal-surface models, extending the hyperbolic crochet lineage.
Type: mathematical craft/geometric construction.
([research.tudelft.nl](https://research.tudelft.nl/en/publications/crocheting-bours-minimal-surfaces/))

### Ethnomathematics and textile epistemologies

**Xu, Hongzhang; Ball, Rowena. “Multiple Forms of Knowing in Mathematics: A Scoping Literature Study.” arXiv:2406.16921, 2024 preprint.** Scoping review of ethnomathematics and Indigenous mathematics across 169 studies; argues for broadening what counts as mathematical knowledge.
Type: review/methodological.
([arxiv.org](https://arxiv.org/abs/2406.16921))

**Hunter, Jodie; Hunter, Roberta. “Weaving together the threads of Indigenous knowledge and mathematics.” Educational Studies in Mathematics, 2024.
DOI: 10.1007/s10649-023-10256-7.** Uses the Indigenous research model Tivaevae to center Pacific and Māori knowledge systems in mathematics education.
Type: ethnomathematics/education.
([link.springer.com](https://link.springer.com/article/10.1007/s10649-023-10256-7))

**Bonilla-Tumialán, María del Carmen. “Ethnomathematics and Complexity: A Study of the Process of Elaboration of a Peruvian Andean Textile.” In Ubiratan D’Ambrosio and Mathematics Education, 2023.** Ethnographic study of mathematical knowledge in Quechua loom-weaving processes in Puno, Peru.
Type: ethnographic/ethnomathematical.
([link.springer.com](https://link.springer.com/chapter/10.1007/978-3-031-31293-9_13))

---

## IX. Glossary: craft terms and mathematical translations

| Craft term | Mathematical translation |
|---|---|
| Yarn / thread | Embedded curve, elastic rod, one-dimensional material body |
| Ply / twist | Framed curve, helicity, chirality, torsional structure |
| Warp | One strand family in weaving; often vertical index set |
| Weft | Crossing strand family in weaving; often horizontal index set |
| Drawdown | Binary over/under matrix of woven cloth |
| Threading | Map from warp ends to shafts; incidence matrix |
| Tie-up | Matrix relating shafts to treadles |
| Treadling | Time sequence or matrix of treadle activations |
| Jacquard control | Individually addressable binary warp actuation |
| Float | Long unconstrained segment; graph/path constraint issue |
| Isonemal fabric | Periodic fabric whose symmetry group is transitive on strands |
| Layer group | Crystallographic group with two-dimensional translational symmetry |
| Knit stitch | Local loop-pulling operation; graph/tangle rewrite |
| Purl stitch | Opposite-facing knit-like operation; chirality/orientation variant |
| Tuck | Operation adding a loop without dropping previous loop; local dependency change |
| Miss/slip | Carrier/yarn bypass operation; local absence of new loop |
| Split | Operation forming new loops while moving existing loops |
| Transfer | Move loops between needles; machine-state transformation |
| Rack | Shift needle-bed alignment; geometric machine parameter |
| Drop | Remove loop support; possible topological defect |
| Laddering | Propagating dropped-loop defect |
| Course | Row-like direction in knit; one lattice direction |
| Wale | Column-like direction in knit; second lattice direction |
| Gauge | Metric scale: stitches/rows per length; discretization density |
| Stitch chart | Two-dimensional word over stitch alphabet |
| Colorwork chart | Graph/coloring/CSP with float and gauge constraints |
| Cable | Local crossing/permutation of stitch columns |
| Increase/decrease | Local change in graph valence or lattice count |
| Crochet stitch | Hook-generated loop operation; serial surface growth |
| Amigurumi | Stuffed crochet surface; inverse geometry problem |
| Bobbin lace ground | Periodic or finite graph with braid labels |
| Braid | Element of braid group; crossing sequence |
| Sprang | Warp interlinking system; braid/interlacement dynamics |
| Nålbinding | Single-needle loop construction; non-unraveling loop topology |
| Defect | Local rule violation, missing edge, crossing error, or topological charge |
| Fabric drape | Macroscopic deformation behavior under gravity/contact |
| Homogenization | Passing from yarn-scale mechanics to continuum effective law |
| Textile metamaterial | Fabric whose structure, not just material, programs response |
| Inverse textile design | Optimization from target shape/mechanics/pattern to manufacturable instructions |
