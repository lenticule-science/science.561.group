---
title: The mathematical frontier of beadwork mathematics A graduate-to-research-level survey, current to June 2026
date-created: 2026-06-26
description: "This survey treats your uploaded brief as the specification: beadwork is handled as a distinct mathematical, computational, material, and ethnomathematical domain, not as a minor case of “textiles with small parts.” fileciteturn0file0"
---
# The mathematical frontier of beadwork mathematics **A graduate-to-research-level survey, current to June 2026**

This survey treats your uploaded brief as the specification: beadwork is handled as a distinct mathematical, computational, material, and ethnomathematical domain, not as a minor case of “textiles with small parts.” fileciteturn0file0

---

## I. Executive summary

Beadwork mathematics is the study of structures made from discrete, usually rigid or semi-rigid units joined by one or more thread-like paths under local stitch constraints, visible color/pattern constraints, and material constraints such as friction, tension, bead contact, and thread slack.
Its natural mathematical objects are not just “patterns,” but ported particles, thread walks, embedded graphs, cyclic cells, ribbon or port graphs, tilings, helical lattices, cell complexes, discrete surfaces, finite-state stitch grammars, and programmable mechanical assemblies.

The key distinction from knitting, crochet, weaving, and braiding is structural.
In knitting, the yarn itself forms the load-bearing loop topology; in weaving, continuous strands interlace in ordered over-under systems; in beadwork, the visible and mechanical skeleton comes from rigid or semi-rigid beads whose holes constrain thread routing.
Recent mechanics work makes this distinction explicit: beaded materials can be modeled as continuous threads linking discrete rigid volumetric beads, where the thread programs geometric order while friction, tension, and bead-bead contact generate stiffness and even “superjamming.” ([nature.com](https://www.nature.com/articles/s41467-025-61809-8))

The established mathematical beadwork literature is scattered but real.
One lineage begins with tiling theory and angle weaves: Gwen Fisher and Blake Mellor showed how periodic tilings generate bead-weaving angle weaves, classified angle weaves induced by normal tilings, and introduced “star tilings” as a beadwork-specific construction rather than merely borrowing textile notation.
([digitalcommons.lmu.edu](https://digitalcommons.lmu.edu/math_fac/185/)) Another lineage centers bead crochet: Susan Goldstine, Ellie Baker, and collaborators studied bead-crochet bracelets, wallpaper groups, torus maps, torus knots, and seven-color torus constructions, showing that bead crochet gives a concrete mathematical medium for symmetry, topology, graph coloring, and knot theory.
([tandfonline.com](https://www.tandfonline.com/doi/abs/10.1080/17513472.2012.654423?utm_source=chatgpt.com))

A third lineage is geometric beadwork: polyhedra, fullerenes, high-genus surfaces, triply periodic forms, beaded spheres, tori, and sculptural beadwork.
Here beadwork enters mathematical sculpture, chemical graph theory, and discrete surface geometry.
Work around Horibe Kazunori, Bih-Yaw Jin, Chia-Chin Tsoo, and others uses right-angle weave and related methods to build bead models of fullerenes, high-genus fullerenes, Goldberg polyhedra, and molecular or topological surfaces.
([pubs.acs.org](https://pubs.acs.org/doi/10.1021/ed200142g?utm_source=chatgpt.com)) Practitioner lineages such as Kate McKinnon’s *Contemporary Geometric Beadwork* are not peer-reviewed mathematics in the narrow sense, but they contain rich experimental geometry: folded polygons, kaleidocycles, tetrahedral and polygonal architectures, hyperbolic forms, hinges, joins, zippers, increases, and bead-scale design rules.
([gallery.bridgesmathart.org](https://gallery.bridgesmathart.org/exhibitions/2019-bridges-conference-fashion-show/kate-mckinnon?utm_source=chatgpt.com))

The most recent frontier is mechanical and computational.
The 2025 Nature Communications paper “Beaded metamaterials” frames beaded assemblies as programmable mechanical metamaterials: rigid beads plus inextensible or nearly inextensible thread, tension, slack, bead contact, and friction can produce load-bearing forms, strain stiffening, and deployable structures.
([nature.com](https://www.nature.com/articles/s41467-025-61809-8)) Related 2024 work on contracting-cord metamaterials uses threaded bead networks with conical interfaces and active contraction to tune stiffness and damping, connecting beadwork-like structures to soft robotics, architecture, and deployable engineering.
([pubs.rsc.org](https://pubs.rsc.org/en/content/articlelanding/2024/mh/d4mh00584h))

A second recent computational frontier is graph threading.
Demaine, Kirkpatrick, Lin, and collaborators formalized a problem inspired by beadwork and himmeli: thread a single string through a set of tubes so that pulling the string tight realizes a desired graph.
Their 2024 ITCS work gives polynomial-time algorithms via closed walks and matching reductions.
This is one of the clearest examples of beadwork-adjacent topology becoming theoretical computer science.
([arxiv.org](https://arxiv.org/abs/2309.10122))

A third recent computational frontier is algorithmic beadwork.
Gwen Fisher, Roger Antonsen, and Zelda Lin’s recent work on cellular automata in peyote stitch treats bead-by-bead construction as an algorithmic system.
Their project explicitly connects peyote grids to hexagonal or staggered-square lattices and studies symmetry, reversibility, periodicity, automorphisms, counting, and rule-based generation.
([gathering4gardner.org](https://www.gathering4gardner.org/com-2025-07-21/?utm_source=chatgpt.com)) Commercial bead-chart tools also increasingly support image-to-bead translation, palette constraints, stitch-specific charting, and 3D visualization, though these tools generally remain pattern editors rather than rigorous compilers from geometry/topology/mechanics to verified stitch paths.
([loomerly.com](https://loomerly.com/?utm_source=chatgpt.com))

Ethnomathematics is not an “optional application” here.
Many beadwork traditions are living mathematical knowledge systems involving counting, symmetry, kinship, place, memory, diplomacy, pedagogy, trade, aesthetics, and cosmology.
Recent work by Sarah Plosker and Cathy Mattes uses Indigenous beadwork to teach linear algebra in an explicitly Indigenizing framework.
([arxiv.org](https://arxiv.org/abs/2509.10477?utm_source=chatgpt.com)) The Indigenous Math Education Network’s beadwork projects similarly frame beading as mathematical activity involving patterns, relationships, spatial reasoning, measurement, and Indigenous knowledge systems.
([indigenous.mathnetwork.educ.ubc.ca](https://indigenous.mathnetwork.educ.ubc.ca/beadwork-mathwork/?utm_source=chatgpt.com)) Earlier ethnomathematical studies of Zulu beadwork treat bead patterns as coded visual communication involving symmetry, color order, signification, and geometric motifs, while southern African flat beadwork has been studied through frieze and wallpaper symmetry groups.
([journalofmathematicsandculture.wordpress.com](https://journalofmathematicsandculture.wordpress.com/wp-content/uploads/2016/05/chahine-71.pdf))

The central thesis of this survey is that beadwork mathematics is emerging as a field whose objects require a combined formalism:

\[ \text{beadwork} = \text{ported rigid units} + \text{thread paths} + \text{local stitch grammar} + \text{surface embedding} + \text{visible color function} + \text{material law} + \text{cultural protocol}. \]

No single source states that formula.
It is a synthesis of the literature.
But it captures why beadwork should not simply be absorbed into textile mathematics.
Beadwork has textile-like thread topology, tiling-like local cells, graph-like connectivity, knot-like paths, surface-like embeddings, code-like charts, metamaterial-like mechanical response, and culturally situated design logics.

The major research opportunity is a general beadwork formalism: a way to encode beads with holes/ports, thread routing, local stitch rules, visible patterns, mechanical constraints, and cultural metadata in a form usable by mathematicians, artists, engineers, computational designers, and community archives.
Such a formalism would support classification, enumeration, inverse design, simulation, verified bead charts, machine-readable archives, and ethical protocols for what should not be formalized or extracted.

---

## II. Field map

| Subfield | Beadwork objects studied | Mathematical tools | Representative sources | Current open problems | Relation to textile mathematics |
|---|---|---|---|---|---|
| Angle-weave and tiling beadwork | RAW, CRAW, angle weaves, tiling-derived bead networks | Tilings, planar graphs, cyclic cells, local compatibility rules | Fisher & Mellor’s tiling theory of angle weaves ([digitalcommons.lmu.edu](https://digitalcommons.lmu.edu/math_fac/185/)) | Classify stitch grammars beyond normal tilings; characterize realizable 3D angle-weave complexes | Closest to weaving/crochet as local cell construction, but beads are rigid vertices/edges rather than flexible strands |
| Bead crochet | Bead ropes, bracelets, cylinders, tori, Möbius bands, torus knots | Helical lattices, frieze/wallpaper groups, torus maps, knot theory, graph coloring | Goldstine, Baker, Sommer, Torrence ([tandfonline.com](https://www.tandfonline.com/doi/abs/10.1080/17513472.2012.654423?utm_source=chatgpt.com)) | General theorem relating bead string order to visible surface order; inverse crochet charting for target surfaces | Shares crochet’s spiral construction, but bead order becomes a symbolic surface code |
| Geometric beadwork | Beaded polyhedra, fullerenes, spheres, tori, high-genus surfaces | Polyhedral combinatorics, Euler characteristic, discrete curvature, chemical graph theory | Horibe, Jin, Tsoo, high-genus fullerene work ([pubs.acs.org](https://pubs.acs.org/doi/10.1021/ed200142g?utm_source=chatgpt.com)) | Classify curvature defects under bead-size and thread constraints; avoid self-intersection in high genus | Similar to mathematical sculpture and crochet surfaces, but local bead geometry strongly constrains curvature |
| Thread-path topology | Threaded bead networks, tubes, himmeli-like frames, port graphs | Graph embeddings, Euler walks, matching, knot/link theory, ribbon graphs | Demaine et al. graph threading ([arxiv.org](https://arxiv.org/abs/2309.10122)) | Equivalence under local moves; minimal thread length; classification of stitch isotopy | Textile topology usually studies strands; beadwork adds ports, holes, and bead-body obstacles |
| Color, pattern, and symmetry | Loom beadwork, bead panels, bead crochet charts, bead embroidery | Graph coloring, wallpaper/frieze groups, substitution, coding theory | Southern African flat beadwork symmetry; bead crochet wallpaper groups ([academia.edu](https://www.academia.edu/96384038/Symmetry_and_pattern_in_southern_African_flat_beadwork_panels?utm_source=chatgpt.com)) | Enumeration under stitch and palette constraints; aperiodic beadwork; color/topology coupling | Similar to textile pattern theory, but bead color is attached to discrete physical units |
| Algorithmic beadwork | Peyote CA, bead charts, procedural patterns | Cellular automata, formal languages, automata, symbolic dynamics | Fisher–Antonsen–Lin CA peyote work ([gathering4gardner.org](https://www.gathering4gardner.org/com-2025-07-21/?utm_source=chatgpt.com)) | Verified bead compilers; stitch-specific automata; reversible and universal bead systems | Analogous to knitting compilers, but bead charts must compile to ported thread paths |
| CAD/CAM and inverse design | Pattern software, image-to-bead, 3D bead layout | Optimization, constraint solving, geometry processing, parsing | Loomerly, PlanBead, Bead Pattern Creator; adjacent crochet/knitting inverse design ([loomerly.com](https://loomerly.com/?utm_source=chatgpt.com)) | Given target surface/mechanics/image, compute layout plus manufacturable thread path | Knitting has stronger compiler literature; beadwork CAD remains fragmented |
| Mechanics and metamaterials | Beaded networks, active cords, jammed bead assemblies, soft robotic fingers | Rigid-body dynamics, contact mechanics, friction, jamming, homogenization | Dreier et al. 2025; Yan et al. 2024 ([nature.com](https://www.nature.com/articles/s41467-025-61809-8)) | Predict stiffness from topology; design superjamming; infer friction/slack/tension | Textile mechanics focuses yarn deformation; beadwork mechanics centers rigid-body contact plus thread tension |
| Ethnomathematics and pedagogy | Indigenous beadwork, Zulu beadwork, Ndebele beadwork, Métis floral beadwork, wampum | Symmetry, counting, coding, spatial reasoning, relational pedagogy, community protocol | Plosker & Mattes; Chahine; Indigenous Math Education Network ([arxiv.org](https://arxiv.org/abs/2509.10477?utm_source=chatgpt.com)) | Formalize without extraction; create community-governed archives; distinguish sacred/restricted knowledge | Textile ethnomathematics overlaps, but beadwork has distinct protocols, materials, and historical economies |
| Material culture and conservation | Glass beads, trade beads, shell beads, museum collections | Archaeometry, materials science, provenance, degradation chemistry | Museum/community collections and conservation studies ([mnhs.org](https://www.mnhs.org/ojibwematerialculture?utm_source=chatgpt.com)) | Link physical bead material to mathematical reconstruction without reducing cultural meaning | Complements textile conservation but bead materials preserve different evidence |

---

## III. Historical foundations

### 1. Symmetry and pattern

One older mathematical entry point is symmetry.
Flat beadwork panels are natural finite samples of frieze and wallpaper patterns: rows, columns, bilateral symmetries, translations, rotations, glide reflections, and color symmetries can all appear, although the cultural meaning of a pattern is not exhausted by its symmetry group.
Becker, Getz, and Martinson’s work on southern African flat beadwork is a key example, explicitly using frieze and planar symmetry groups to study bead panels.
([academia.edu](https://www.academia.edu/96384038/Symmetry_and_pattern_in_southern_African_flat_beadwork_panels?utm_source=chatgpt.com))

Ethnomathematical symmetry work around Native bead looms similarly treats loom beadwork as a coordinate-like grid, but the best versions of this pedagogy avoid the claim that Indigenous beadwork “is really Cartesian geometry.” Ron Eglash and collaborators’ Culturally Situated Design Tools discuss Native beadwork through algorithms, fourfold symmetry, and row-column structures, while also making visible how Western mathematical notation is not the only way to encode pattern.
([csdt.org](https://csdt.org/culture/beadloom/origins.html?utm_source=chatgpt.com))

### 2. Geometric beadwork and mathematical art

Mathematical art gave beadwork a second foundation.
Beaded beads, beaded polyhedra, and right-angle weave models allow mathematicians and artists to build physical realizations of finite symmetry groups, fullerenes, tori, and high-genus surfaces.
Fisher and Mellor’s work on beaded beads studies finite point group symmetry through bead structures, while Horibe Kazunori’s mathematical beadwork popularized bead models of polyhedra, fullerenes, and surfaces.
([blakemellor.lmu.build](https://blakemellor.lmu.build/research/BeadedBeads.pdf?utm_source=chatgpt.com))

Chemical graph theory and beadwork meet in models of fullerenes.
Bih-Yaw Jin and collaborators describe using right-angle weave to build fullerene models from beads, including ordinary fullerenes, toroidal shapes, nanotube-like forms, and high-genus structures.
The mathematical content is not merely representational: fullerene graphs, spiral codes, genus, handles, and curvature defects become bead construction rules.
([pubs.acs.org](https://pubs.acs.org/doi/10.1021/ed200142g?utm_source=chatgpt.com))

### 3. Bead crochet: cylinders, tori, knots, and maps

Bead crochet contributes a different formal lineage.
A bead crochet rope is made by pre-stringing beads, then crocheting so that bead sequence, crochet order, and visible surface order differ.
This creates a mathematical translation problem: a one-dimensional string order maps to a helical surface order.
Goldstine’s “Building a better bracelet” studies wallpaper patterns in bead crochet and shows that bead crochet bracelets realize many, but not all, wallpaper groups.
([tandfonline.com](https://www.tandfonline.com/doi/abs/10.1080/17513472.2012.654423?utm_source=chatgpt.com))

The seven-color torus bead-crochet work is especially important because it makes graph coloring physically visible.
Sophie Sommer, Ellie Baker, and Susan Goldstine developed bead-crochet torus bracelets representing seven-color maps on a torus, connecting bead crochet to the Heawood map-coloring theorem and topological graph theory.
([jstor.org](https://www.jstor.org/stable/pdf/10.4169/mathhorizons.
21.1.22.pdf?utm_source=chatgpt.com))

### 4. Tiling theory and angle weave

Fisher and Mellor’s angle-weave paper is one of the strongest foundations for bead weaving as mathematics.
They treat bead weaving as a process in which beads are placed near vertices or edges of a tiling and thread is woven through them according to local angle rules.
They prove that every normal tiling induces an angle weave and then classify induced angle weaves using tiling theory.
([digitalcommons.lmu.edu](https://digitalcommons.lmu.edu/math_fac/185/))

This matters because it gives beadwork a bridge from craft stitch names to mathematical generators. “Right-angle weave” becomes not just a technique but a family of cyclic cell rules; “angle weave” becomes a functor-like passage from tiling data to stitch structure.
That is one of the clearest precedents for a beadwork compiler.

### 5. Graph, knot, braid, and surface perspectives

Thread paths through beads are naturally graph-theoretic: beads may be vertices, holes may be ports, and thread segments may be edges or walks.
Demaine et al.’s graph-threading work formalizes a related problem: how to thread a single string through a graph-like structure so that tightening realizes a desired graph.
Their solution uses closed walks and minimum-weight perfect matching.
([arxiv.org](https://arxiv.org/abs/2309.10122))

Older Bridges literature also contains beadwork path-optimization problems that resemble Eulerian path questions with additional local entry/exit constraints.
The important beadwork-specific twist is that a thread path is not merely a path in a graph: it must enter and exit bead holes legally, avoid impossible local turns, respect thread order, and often return through already-used beads.

### 6. Ethnomathematics and beadwork as living knowledge

Ethnomathematics is foundational rather than decorative.
Chahine’s study of Zulu beadwork treats bead patterns as concretized information systems: color, order, line, triangle, symmetry, sequence, and motif can function as visual communication, especially in iNcwadi “love letter” beadwork.
([journalofmathematicsandculture.wordpress.com](https://journalofmathematicsandculture.wordpress.com/wp-content/uploads/2016/05/chahine-71.pdf)) Indigenous North American beadwork is likewise a living mathematical practice, but one must distinguish public pedagogical or museum knowledge from restricted, sacred, or community-specific knowledge.
The First Americans Museum’s “Sewn Symmetry” exhibition frames Plains beadwork as visual language carrying cultural knowledge, family histories, social roles, and intergenerational transmission.
([famok.org](https://famok.org/sewn-symmetry/?utm_source=chatgpt.com))

Recent mathematical pedagogy has begun to treat beadwork not just as an example for teaching Western math, but as a knowledge system that can reshape classroom relations.
Plosker and Mattes describe Indigenous beadwork as a method for teaching linear algebra through an Indigenizing framework centered on relationship-building, not simply “beadwork as matrices.” ([arxiv.org](https://arxiv.org/abs/2509.10477?utm_source=chatgpt.com))

### 7. Computational pattern generation and bead-chart software

Beadwork has long had charting software, but charting is not yet the same thing as a beadwork compiler.
Current tools such as Loomerly, PlanBead, and Bead Pattern Creator support loom, peyote, brick, square stitch, RAW, image conversion, palette libraries, word charts, and sometimes 3D visualization.
([loomerly.com](https://loomerly.com/?utm_source=chatgpt.com)) The frontier is to move from drawing visible patterns to verifying stitch topology, thread path, bead collisions, curvature, and mechanical behavior.

---

## IV. Current frontier clusters

### A. Bead weaving as tiling, graph, and stitch grammar

**Core objects.** The basic objects are bead sets, holes/ports, thread passes, cyclic cells, and local stitch rules.
Peyote, brick, square stitch, herringbone/Ndebele stitch, right-angle weave, cubic right-angle weave, netting, ladder stitch, spiral ropes, loom beadwork, and bead embroidery can all be described by local compatibility constraints, but no general formal grammar covers them all.

**State of the art.** Fisher and Mellor’s tiling-theoretic angle weave remains the strongest formal foundation.
Its insight is that bead weaving can be generated from tiling data: local cycles in a tiling become thread loops; vertices or edges become bead positions; angle choices become stitch rules.
([digitalcommons.lmu.edu](https://digitalcommons.lmu.edu/math_fac/185/)) The 2025 beaded-metamaterials paper independently uses angle-weave-like cellular bead networks as mechanical objects, showing that the same local cell structures matter for stiffness and load transfer.
([nature.com](https://www.nature.com/articles/s41467-025-61809-8))

**Technical difficulty.** A stitch grammar must encode more than adjacency.
It must know whether a bead can be entered from a port, whether the thread can pass again through the same hole, whether local tightening is physically possible, whether bead geometry blocks a proposed path, and whether the visible face order matches the intended pattern.
This makes bead weaving closer to typed graph rewriting with embedding constraints than to ordinary tiling.

**Next five years.** The likely next step is a beadwork intermediate representation: a formal data model that stores beads, ports, thread segments, local cells, color, and embedding constraints.
That would allow the field to classify stitches by grammar rather than by craft names.

---

### B. Bead crochet: helices, tori, knots, and symmetry

**Core objects.** Bead crochet studies one-dimensional bead strings embedded as helical bead sequences on cylinders, tori, Möbius bands, and knots.
The mathematical difficulty is the mismatch between string order, crochet order, and visible surface order.

**State of the art.** Goldstine and Baker’s bead-crochet work connects bead crochet to wallpaper groups, topological graph coloring, torus maps, Möbius structures, and torus knots.
Goldstine showed that bead crochet bracelets can represent exactly thirteen of the seventeen wallpaper groups, which is a strong structural result: the medium itself imposes symmetry restrictions.
([tandfonline.com](https://www.tandfonline.com/doi/abs/10.1080/17513472.2012.654423?utm_source=chatgpt.com)) The seven-color torus bracelets show how bead crochet can embody a topological graph-coloring theorem.
([jstor.org](https://www.jstor.org/stable/pdf/10.4169/mathhorizons.
21.1.22.pdf?utm_source=chatgpt.com))

**Technical difficulty.** In ordinary surface patterning, one assigns colors directly to surface cells.
In bead crochet, one assigns colors to a string, then a crochet process maps the string onto a helical surface.
The inverse problem—given a desired visible torus or cylinder pattern, compute the bead string—is a nontrivial arithmetic and topological problem.

**Next five years.** Expect stronger formal models of bead-crochet charts as morphisms from \(\mathbb{Z}\) to a quotient lattice such as \(\mathbb{Z}^2/\Lambda\), with closure constraints determining cylinders, tori, and knots.

---

### C. Geometric beadwork, polyhedra, curvature, and discrete surfaces

**Core objects.** Beaded polyhedra, fullerenes, stars, flowers, spheres, tori, high-genus surfaces, and sculptural beadwork can be modeled as discrete surfaces or cell complexes whose cells are bead cycles and whose curvature is concentrated at defects.

**State of the art.** Fullerene beadwork is the clearest formal lineage.
Fullerenes are trivalent carbon cage graphs built from pentagons, hexagons, and sometimes higher genus arrangements; beadwork can realize these graphs as physical models.
Jin and collaborators use right-angle weave and mathematical beading to construct fullerenes and topologically nontrivial fullerene-like structures.
([pubs.acs.org](https://pubs.acs.org/doi/10.1021/ed200142g?utm_source=chatgpt.com)) Horibe-related work extends this to Goldberg polyhedra and mathematical bead models inspired by Japanese geometry and molecular forms.
([archive.bridgesmathart.org](https://archive.bridgesmathart.org/2014/bridges2014-503.pdf?utm_source=chatgpt.com))

**Technical difficulty.** Discrete curvature formulas are easy to write but hard to realize materially.
A pentagon in a hexagonal network suggests positive curvature, and a heptagon suggests negative curvature, but actual bead geometry, hole orientation, thread slack, and bead size determine whether the structure lies flat, buckles, jams, or self-intersects.

**Next five years.** The promising frontier is a theory of bead-realizable cell complexes: given a combinatorial surface, bead dimensions, hole geometry, and thread tolerance, decide whether there is a physically realizable embedding.

---

### D. Beaded metamaterials and programmable mechanical response

**Core objects.** Beaded metamaterials are threaded networks of rigid or semi-rigid beads whose mechanical response is programmed by bead geometry, thread topology, tension, slack, friction, and contact.

**State of the art.** Dreier et al. show that beading can transform flexible fiber networks into load-bearing structures by incorporating rigid discrete elements in programmable weave patterns.
Their experiments and models identify superjamming: a state where bead-bead contacts and thread tension create sudden, high load-bearing capacity.
([nature.com](https://www.nature.com/articles/s41467-025-61809-8)) Yan et al.’s contracting-cord metamaterials use active contraction through bead-like elements with conical concavo-convex interfaces to self-assemble and tune stiffness and damping, connecting bead networks to soft robotics and deployable engineering.
([pubs.rsc.org](https://pubs.rsc.org/en/content/articlelanding/2024/mh/d4mh00584h))

**Technical difficulty.** These are hybrid systems: topology determines what can contact what; geometry determines contact normals; thread tension determines available slack; friction creates path dependence; and bead motion is constrained by rigid-body exclusion.
Smooth continuum elasticity alone is not enough.

**Next five years.** Expect beadwork-inspired materials that are actively tensioned, robotically actuated, reversible, and computationally designed for target stiffness, damping, deployability, and shape change.

---

### E. Thread-path topology, port graphs, and stitch equivalence

**Core objects.** A thread path through beadwork is a curve through bead ports with possible repeated bead visits, local turns, crossings, over-under data, and tightening behavior.
A natural encoding is a port graph: bead ports are vertices, within-bead hole segments are internal edges, and thread runs are external edges.

**State of the art.** Graph threading gives a formal theoretical-computer-science version of this problem: find a threading walk whose tightened realization induces a desired graph.
([arxiv.org](https://arxiv.org/abs/2309.10122)) But beadwork adds port constraints and bead-body obstacles not present in ordinary graph theory.

**Technical difficulty.** Two beadworks may look identical but have different thread paths; two thread paths may be topologically equivalent but mechanically different; and a local move may preserve visible pattern while changing unraveling behavior.
This suggests a beadwork analogue of Reidemeister moves, but with bead ports and material constraints.

**Next five years.** A serious classification program would define local moves preserving beadwork isotopy, then distinguish topological equivalence from mechanical equivalence and craft equivalence.

---

### F. Cellular automata, formal languages, and algorithmic beadwork

**Core objects.** Algorithmic beadwork treats a bead pattern as generated by rules rather than drawn bead-by-bead.
Peyote stitch is especially suitable because its staggered grid can be modeled as hexagonal or offset-square neighborhoods.

**State of the art.** Fisher, Antonsen, and Lin’s cellular-automata peyote work applies one-dimensional cellular automata to peyote stitch, replacing a fixed chart with rule-based generation and studying periodicity, reversibility, automorphism, isomorphism, counting, and symmetry.
([gathering4gardner.org](https://www.gathering4gardner.org/com-2025-07-21/?utm_source=chatgpt.com)) Culturally Situated Design Tools also frame beadwork algorithms as sequences of instructions embedded in Indigenous design practice, though such educational tools must be handled carefully so that “algorithm” does not become a colonial extraction of craft knowledge.
([csdt.org](https://csdt.org/culture/whte/en/beadworkalgorithm.html?utm_source=chatgpt.com))

**Technical difficulty.** Formal-language models must compile to manufacturable beadwork.
A string accepted by an automaton may still produce an impossible bead path, an unwearable curvature, or a culturally inappropriate pattern.

**Next five years.** Expect formal stitch languages with type systems: bead size, stitch family, edge joins, increases/decreases, color palette, and allowable motifs become checked constraints.

---

### G. Color, pattern, graph coloring, symmetry, and aperiodicity

**Core objects.** Bead color is a function on physical units, not just pixels.
A color chart assigns colors to beads, but the same visible pattern can correspond to different thread topologies.

**State of the art.** Bead crochet already has strong connections to wallpaper groups and graph coloring through Goldstine, Baker, and collaborators.
([tandfonline.com](https://www.tandfonline.com/doi/abs/10.1080/17513472.2012.654423?utm_source=chatgpt.com)) Ethnomathematical sources show that color also encodes meaning, sequence, social relation, and memory; Chahine’s Zulu beadwork study emphasizes that color order and symmetry can carry structured information.
([journalofmathematicsandculture.wordpress.com](https://journalofmathematicsandculture.wordpress.com/wp-content/uploads/2016/05/chahine-71.pdf))

**Technical difficulty.** Mathematical color equivalence is not cultural equivalence.
A palette permutation may preserve graph-theoretic coloring but destroy meaning.
Conversely, a culturally meaningful substitution may not be a symmetry in the formal group-theoretic sense.

**Next five years.** The technical frontier is enumeration and classification under multiple equivalences: geometric, graph-theoretic, perceptual, manufactural, and culturally governed.

---

### H. Inverse design and computational fabrication

**Core objects.** The inverse beadwork design problem asks: given a target image, surface, topology, mechanical property, or cultural protocol, compute a bead layout, color function, and legal thread path.

**State of the art.** Consumer tools support image-to-bead conversion, bead palettes, loom/peyote/brick/RAW charts, word charts, and 3D previews.
([loomerly.com](https://loomerly.com/?utm_source=chatgpt.com)) Adjacent textile fields are ahead: computational crochet work such as AmiGo generates amigurumi crochet patterns from 3D models, and machine-knitting research has produced compilers and neural inverse design systems.
([arxiv.org](https://arxiv.org/abs/2211.01178?utm_source=chatgpt.com))

**Technical difficulty.** Beadwork inverse design must solve at least five coupled problems: surface discretization, bead packing, thread routing, color assignment, and mechanical feasibility.
Existing chart tools usually solve only the color assignment problem.

**Next five years.** A realistic first system would target a restricted family, such as peyote cylinders, bead-crochet tori, or RAW polyhedra, then prove that generated charts compile to valid thread paths.

---

### I. Simulation, mechanics, friction, tension, and multiscale modeling

**Core objects.** Beadwork mechanics spans bead-level rigid-body contact, thread elasticity, thread bending, friction, jamming, continuum homogenization, and failure/unraveling.

**State of the art.** Dreier et al. combine experiment and modeling to show that beadwork-like structures can undergo superjamming and load-bearing transitions.
([nature.com](https://www.nature.com/articles/s41467-025-61809-8)) Yan et al. show active contracting-cord bead networks with tunable stiffness and damping.
([pubs.rsc.org](https://pubs.rsc.org/en/content/articlelanding/2024/mh/d4mh00584h)) Robotic and granular-jamming literature gives adjacent models for stiffness-tunable grippers and bead-string manipulators, though these are usually not beadwork in the craft sense.
([pnas.org](https://www.pnas.org/doi/10.1073/pnas.
1003250107?utm_source=chatgpt.com))

**Technical difficulty.** Friction is history-dependent, contact is nonsmooth, and thread tension is globally coupled through the path.
A single local pull can redistribute stress across the entire beadwork.

**Next five years.** The frontier is differentiable or hybrid simulation: enough contact/friction realism to predict stiffness, but enough differentiability or surrogate modeling to support inverse design.

---

### J. Ethnomathematics, Indigenous beadwork, and beadwork epistemologies

**Core objects.** The objects here are not only patterns but practices: instruction, kinship, memory, trade, diplomacy, story, place, teaching, gifting, repair, refusal, and protocol.

**State of the art.** Plosker and Mattes use Indigenous beadwork to teach linear algebra in a way that foregrounds Indigenizing pedagogy rather than merely attaching Indigenous examples to a standard curriculum.
([arxiv.org](https://arxiv.org/abs/2509.10477?utm_source=chatgpt.com)) The Indigenous Math Education Network’s beadwork projects similarly connect beading to spatial reasoning, pattern, measurement, story, and Indigenous knowledge systems.
([indigenous.mathnetwork.educ.ubc.ca](https://indigenous.mathnetwork.educ.ubc.ca/beadwork-mathwork/?utm_source=chatgpt.com)) Museum and community sources on Plains, Dakota, Métis, Ojibwe, and wampum beadwork show that beadwork can carry family history, social role, diplomacy, memory, and intergenerational knowledge.
([famok.org](https://famok.org/sewn-symmetry/?utm_source=chatgpt.com))

**Technical difficulty.** The hard problem is methodological.
Formalization can clarify structure, but it can also extract, flatten, or expose restricted knowledge.
A beadwork mathematics adequate to living traditions must include refusal, attribution, community governance, provenance, and limits on publication.

**Next five years.** The best direction is not “formalize all cultural beadwork.” It is community-led mathematical documentation where beadworkers decide what may be abstracted, what must remain contextual, and what should not be encoded at all.

---

## V. Mathematical formalism

This section proposes a unified formal language.
It is a synthesis, not an established standard.
It draws on tiling-angle weave work, bead crochet topology, graph threading, beaded metamaterials, and computational pattern systems.
([digitalcommons.lmu.edu](https://digitalcommons.lmu.edu/math_fac/185/))

### 1. Bead

A **bead** is a rigid or semi-rigid body with one or more holes.
Mathematically, model a bead as

\[ b=(K,H,P,\rho,\mu), \]

where:

- \(K\subset\mathbb{R}^3\) is the bead body;
- \(H=\{h_1,\dots,h_m\}\) is a set of holes or tunnels through \(K\);
- \(P\) is the set of ports, usually boundary disks where thread enters or exits holes;
- \(\rho\) records bead type, dimensions, color capacity, and orientation marks;
- \(\mu\) records material/contact parameters such as friction coefficient and stiffness.

For a seed bead with one hole, \(m=1\) and there are typically two main ports.
Multi-hole beads require a richer port graph.

### 2. Bead port or hole

A **port** is an oriented entry/exit interface.
If bead \(b\) has hole \(h\), its two ends may be represented as \(p_h^-\) and \(p_h^+\).
A thread pass through the bead is an internal edge

\[ e_h=(p_h^-,p_h^+). \]

For multi-hole beads, the internal structure is a graph \(I_b=(P_b,E_b)\) telling which ports are connected through holes.

### 3. Thread path

A **thread path** is a curve

\[ \gamma:[0,L]\to \mathbb{R}^3\setminus \bigcup_i \operatorname{int}(K_i) \]

with designated intervals passing through bead holes.
Combinatorially, it is a word

\[ \Gamma = (b_{i_1},p_{i_1}^{\text{in}},p_{i_1}^{\text{out}}) (b_{i_2},p_{i_2}^{\text{in}},p_{i_2}^{\text{out}}) \cdots (b_{i_N},p_{i_N}^{\text{in}},p_{i_N}^{\text{out}}). \]

The same bead may occur multiple times.
This is essential: beadwork thread topology is a walk, not merely a graph edge set.

### 4. Beadwork graph

A **beadwork graph** is a graph

\[ G_B=(V_B,E_B) \]

where \(V_B\) is the set of beads and \(E_B\) records adjacency.
But there are different adjacency notions:

- **thread adjacency:** two beads are consecutive along \(\Gamma\);
- **contact adjacency:** two bead bodies touch or jam;
- **cell adjacency:** two beads share a stitch cell;
- **visible adjacency:** two beads appear adjacent on the visible surface.

A rigorous model should keep these separate:

\[ G_{\text{thread}},\quad G_{\text{contact}},\quad G_{\text{cell}},\quad G_{\text{vis}}. \]

Many confusions in beadwork formalization come from collapsing these graphs.

### 5. Port graph

A **port graph** is

\[ P_B=(V_P,E_{\text{hole}},E_{\text{thread}},E_{\text{contact}}), \]

where \(V_P\) is the set of bead ports, \(E_{\text{hole}}\) are within-bead hole connections, \(E_{\text{thread}}\) are thread segments between ports, and \(E_{\text{contact}}\) are bead-body contacts.
This is probably the natural low-level data structure for beadwork topology.

### 6. Stitch graph

A **stitch graph** is a graph or hypergraph whose hyperedges are local stitch units.
For right-angle weave, a local unit may be a four-bead cycle:

\[ \sigma_{\text{RAW}}=(b_1,b_2,b_3,b_4), \]

with thread passing cyclically through the four beads.
For netting, a local unit may be a larger cycle or mesh opening.
For peyote, local units may be staggered bead adjacencies.

A stitch family is a set of allowed local configurations:

\[ \mathcal{C}_{\tau}=\{C_1,\dots,C_k\}, \]

where \(\tau\) is the stitch type.

### 7. Angle weave

An **angle weave** can be modeled as a cell complex induced by a tiling \(T\).
Let \(T=(V,E,F)\) be a planar tiling.
A bead placement is a map

\[ \beta: V(T)\ \text{or}\ E(T)\to B, \]

and a thread rule assigns to each face \(f\in F\) a cyclic thread path through the beads incident to \(f\).
Fisher and Mellor’s key result is that normal tilings induce angle weaves; the mathematical novelty is the passage from tiling data to bead-thread structure.
([digitalcommons.lmu.edu](https://digitalcommons.lmu.edu/math_fac/185/))

### 8. Beadwork cell complex

A **beadwork cell complex** is

\[ X=(X^0,X^1,X^2,\dots), \]

where:

- \(X^0\) may be bead centers or bead ports;
- \(X^1\) may be thread segments, contact edges, or stitch adjacencies;
- \(X^2\) are stitch faces such as RAW squares, netting openings, or polygonal bead cycles.

An embedding is a map

\[ f:X\to \mathbb{R}^3 \]

with collision and port constraints.

### 9. Visible pattern graph and color function

A **visible pattern graph** \(G_{\text{vis}}\) records bead adjacencies as seen on a surface.
A **color function** is

\[ c:V_B\to \Sigma, \]

where \(\Sigma\) is a palette.
If beads have orientation or multiple visible faces, use

\[ c: (V_B\times F_{\text{visible}})\to \Sigma. \]

Color equivalence may be graph-theoretic, perceptual, or culturally governed.
These are not the same.

### 10. Crossing relation

For projected diagrams, define a **crossing relation**

\[ \chi:\{(e_i,e_j): \pi(e_i)\cap \pi(e_j)\neq\varnothing\}\to \{+,-,0\}, \]

where \(+\) and \(-\) encode over/under data and \(0\) encodes non-crossing contact or unresolved crossing.
In beadwork, crossing data may also include port ordering and thread layering inside bead holes.

### 11. Local compatibility constraint

A **local compatibility constraint** is a predicate

\[ C_\tau(N_v)=1 \]

where \(N_v\) is the local neighborhood of bead or port \(v\), and \(\tau\) is the stitch type.
Constraints may include:

- allowed number of thread passes through a bead;
- allowed port entry/exit pairs;
- bead size compatibility;
- no forbidden crossings;
- no impossible local curvature;
- color or motif restrictions;
- cultural protocol restrictions.

### 12. Stitch grammar

A **stitch grammar** is

\[ \mathcal{G}=(\Sigma,\mathcal{N},\mathcal{R},S_0,\mathcal{C}), \]

where \(\Sigma\) is the alphabet of bead and thread tokens, \(\mathcal{N}\) is a set of nonterminals or abstract partial structures, \(\mathcal{R}\) is a set of rewrite rules, \(S_0\) is the starting structure, and \(\mathcal{C}\) is a constraint checker.

A rule might look like:

\[ \text{edge}(b_i,b_j)\Rightarrow \text{RAW-cell}(b_i,b_j,b_k,b_\ell), \]

subject to port and thread constraints.

### 13. Periodic beadwork pattern

A beadwork pattern is **periodic** if a lattice \(\Lambda\cong\mathbb{Z}^d\) acts on the beadwork state by automorphisms preserving stitch structure and color:

\[ \lambda\cdot (X,\Gamma,c,f)=(X,\Gamma,c,f) \quad \text{for all } \lambda\in\Lambda. \]

For a bead-crochet bracelet, the natural symmetry group may be a quotient of a helical lattice by a closure relation.

### 14. Beadwork state space

The **beadwork state space** for a stitch family \(\tau\) is

\[ \mathcal{S}_{\tau} = \{(B,P_B,\Gamma,X,c,f,q): C_\tau=1,\ \text{no forbidden collision},\ \text{protocol constraints hold}\}/\sim, \]

where \(q\) denotes bead positions and orientations, and \(\sim\) is an equivalence relation such as isotopy, local stitch equivalence, or mechanical equivalence.

### 15. Surface embedding

A **surface embedding** is a map

\[ f:X^2\to M\subset\mathbb{R}^3 \]

from a beadwork cell complex to a target surface \(M\).
A beadwork is embedded if bead bodies do not illegally overlap:

\[ K_i(q_i)\cap K_j(q_j)=\varnothing \]

except for allowed contacts.

### 16. Curvature defect

For a beadwork cell complex with polygonal cells, define combinatorial curvature at an interior vertex \(v\) by

\[ \kappa(v)=2\pi-\sum_{f\ni v}\theta_{v,f}. \]

At a boundary vertex,

\[ \kappa_{\partial}(v)=\pi-\sum_{f\ni v}\theta_{v,f}. \]

In hexagonal fullerene-like structures, pentagonal defects create positive curvature and heptagonal defects create negative curvature, but actual beadwork curvature must be corrected for bead dimensions and thread slack.
Fullerene bead models make this curvature-defect idea physically visible.
([pubs.acs.org](https://pubs.acs.org/doi/10.1021/ed200142g?utm_source=chatgpt.com))

### 17. Topological defect

A **topological defect** is a local violation or change of regular coordination that cannot be removed by allowed local moves.
Examples include:

- an increase or decrease in peyote or brick stitch;
- a pentagon in a hexagonal fullerene network;
- a handle in a high-genus bead surface;
- a twist creating a Möbius band;
- a knotting change in a bead-crochet rope.

For a closed orientable beadwork surface,

\[ \chi=V-E+F=2-2g, \]

where \(g\) is genus.

### 18. Inverse beadwork design problem

Given:

- target geometry \(M\);
- target topology \(T\);
- target visible pattern \(I\);
- target mechanical response \(A^\ast\);
- stitch family \(\tau\);
- bead library \(\mathcal{B}\);

find a beadwork state \(s=(X,\Gamma,c,f,q)\in \mathcal{S}_\tau\) minimizing

\[ \mathcal{L}(s) = d(f(X),M) + \lambda_1\,\operatorname{Err}_{\text{pattern}}(c,I) + \lambda_2\,\operatorname{Err}_{\text{mech}}(A(s),A^\ast) + \lambda_3\,\Phi_{\text{manufact}}(s), \]

subject to stitch, port, collision, and protocol constraints.

### 19. Bead-level mechanical energy

A simplified beadwork energy may be written:

\[ E(q,\Gamma) = \sum_{\text{thread}} \int \left[ \frac{EA}{2}\epsilon(s)^2 + \frac{B}{2}\kappa(s)^2 \right]\,ds + \sum_{i<j}U_{\text{contact}}(K_i,K_j) + E_{\text{fric}} + E_{\text{tension}}. \]

This formula is schematic.
Friction is generally nonconservative, so it is better treated by complementarity constraints or history-dependent dissipation than by a simple potential.
This is why beadwork mechanics is hard.

### 20. Homogenized elastic energy

For large periodic beadwork, one may seek a continuum energy

\[ E_{\text{hom}}(y) = \int_{\Omega} W(F,\nabla F;\tau,\ell,\mu,T_0)\,dA, \]

where \(F=\nabla y\) is deformation gradient, \(\tau\) is stitch family, \(\ell\) is thread slack, \(\mu\) is friction/contact data, and \(T_0\) is pre-tension.
The open problem is deriving \(W\) from bead-scale geometry rather than fitting it phenomenologically.

### 21. Symmetry group of a beadwork pattern

The **symmetry group** of a beadwork pattern is

\[ \operatorname{Sym}(X,\Gamma,c,f) = \{g\in \operatorname{Isom}(\mathbb{R}^3): g f(X)=f(X),\ g\Gamma\simeq \Gamma,\ c\circ g=c \}. \]

If color permutations are allowed, replace \(c\circ g=c\) by \(c\circ g=\pi\circ c\) for some palette permutation \(\pi\).
In ethnomathematical contexts, palette permutation should not be assumed meaningful without cultural authorization.

### 22. Bead crochet surface map

Let \(a_k\) be the \(k\)-th bead on a pre-strung sequence.
If a rope has \(m\) beads around and helical offset \(\alpha\), then a simplified visible coordinate is

\[ \Phi(k)= \left( \left\lfloor \frac{k}{m}\right\rfloor,\, k+\alpha\left\lfloor \frac{k}{m}\right\rfloor \pmod m \right). \]

Closure into a torus imposes rational periodicity conditions.
More elaborate models must include stitch height, bead shape, handedness, and slippage.

### 23. Peyote cellular automaton

For a peyote grid, let \(c_{i,t}\in \Sigma\) be bead color at horizontal coordinate \(i\) and row \(t\).
A one-dimensional cellular automaton gives

\[ c_{i,t+1} = \varphi(c_{i-r,t},\dots,c_{i+r,t}), \]

with offset depending on peyote staggering.
This is the formal core of cellular-automata peyote beadwork.
([gathering4gardner.org](https://www.gathering4gardner.org/com-2025-07-21/?utm_source=chatgpt.com))

---

## VI. Connections across subfields

Bead weaving and bead crochet are both thread-order systems, but they differ in how thread order maps to surface order.
In bead weaving, local stitch cells are often explicitly built in surface order: a RAW square or netting opening corresponds to a visible cell.
In bead crochet, the bead string is one-dimensional, while the visible object is a helical cylinder or torus.
Thus bead crochet is naturally arithmetic and quotient-lattice-like, while bead weaving is naturally cell-complex-like.

Beadwork differs from knitting because knitting uses yarn loops as both topology and material.
Recent knitting mathematics studies the relation between stitch topology and emergent elasticity; textile topology studies yarns as knots or links in thickened spaces.
([nature.com](https://www.nature.com/articles/s41467-024-46498-z?utm_source=chatgpt.com)) Beadwork instead has rigid or semi-rigid bead bodies, holes, ports, and contact.
The thread can be flexible, but it is constrained by bead geometry.
This shifts the mathematics from loop topology alone to ported rigid-body topology plus contact mechanics.

Beadwork differs from weaving because weaving’s fundamental operation is interlacing continuous strands, while beadwork’s fundamental operation is routing thread through discrete units.
A loom beadwork chart may look like a woven grid, but its physical structure is still a set of beads with thread passes.
In formal terms, weaving is primarily over-under strand topology; beadwork is port graph plus bead placement.

Bead charts are formal languages.
A peyote chart, bead-crochet word chart, loom chart, or RAW diagram is a program whose execution produces a physical object.
The missing mathematical infrastructure is a verified compiler from chart to beadwork state.
Current tools solve parts of this problem but do not generally verify topology, curvature, collision, or mechanical feasibility.
([loomerly.com](https://loomerly.com/?utm_source=chatgpt.com))

Defects are the common currency across beadwork mathematics.
In geometric beadwork, a defect may be a pentagon, heptagon, handle, or twist.
In stitch grammar, it may be an increase, decrease, join, split, or local rule violation.
In mechanics, it may be a stress concentrator or jamming site.
In cultural pattern systems, it may not be a “defect” at all but a meaningful asymmetry, signature, teaching device, or relational marker.

The ethnomathematical connection requires care.
A formalist may see group actions, graph colorings, and algorithms; a beadworker may be working through kinship, memory, place, mourning, gifting, or ceremonial protocol.
Both can be mathematical, but they are not interchangeable.
The best beadwork mathematics will not translate living practice into Western notation and call the translation complete.

---

## VII. Open problems and research opportunities

| # | Problem | Why it matters | Background | Tractability | Kind |
|---:|---|---|---|---|---|
| 1 | General formal model of beadwork | Needed for a unified field | Graphs, topology, craft studies | Near-term | Theoretical/computational |
| 2 | Port-graph standard for beads | Multi-hole beads and thread passes need precise encoding | Graph theory, CAD | Near-term | Computational |
| 3 | Classification of stitch grammars | Moves beyond craft-name taxonomies | Formal languages, graph rewriting | Medium-term | Theoretical |
| 4 | Equivalence under local moves | Defines when two beadworks are “same” | Knot theory, Reidemeister moves | Medium-term | Theoretical |
| 5 | Minimal thread-length problem | Useful for design, cost, and structural integrity | Graph algorithms, optimization | Near-term | Computational |
| 6 | Beadwork isotopy with ports | Ordinary isotopy ignores holes and bead bodies | Low-dimensional topology | Medium-term | Theoretical |
| 7 | Rigorous bead-crochet surface map | Relates string charts to visible torus/cylinder patterns | Lattice theory, topology | Near-term | Theoretical/computational |
| 8 | Inverse bead-crochet charting | Compute string order from desired surface design | Number theory, algorithms | Near-term | Computational |
| 9 | Discrete curvature with bead geometry | Combinatorial curvature alone is insufficient | Discrete differential geometry | Medium-term | Theoretical/experimental |
| 10 | Bead-realizability of cell complexes | Decide whether a surface can be physically beaded | Geometry processing, contact | Medium-term | Computational |
| 11 | Self-intersection constraints for high genus | Needed for tori, handles, and sculptural forms | Topology, CAD | Medium-term | Computational |
| 12 | Aperiodic beadwork systems | Beadwork version of substitution/aperiodic tilings | Tiling theory, symbolic dynamics | Medium-term | Theoretical/artistic |
| 13 | Enumeration under stitch and symmetry constraints | Counts possible motifs and charts | Pólya theory, automata | Near-term | Theoretical |
| 14 | Color equivalence with cultural constraints | Palette permutations are not neutral | Ethnomath, graph coloring | Speculative | Cultural/theoretical |
| 15 | Verified bead-chart compiler | Prevents impossible instructions | PL theory, CAD | Medium-term | Computational |
| 16 | Machine-readable beadwork archive format | Needed for preservation and research | Metadata, linked data, ethics | Near-term | Computational/cultural |
| 17 | Protocol-aware archives | Some knowledge should not be public or formalized | Indigenous data sovereignty | Medium-term | Cultural |
| 18 | Community-governed formalization | Prevents extraction | Ethnography, governance | Medium-term | Cultural |
| 19 | Beadwork-specific CAD/CAM | Current software is pattern-oriented | Geometry processing, HCI | Medium-term | Computational |
| 20 | Robotic or assisted bead fabrication | Enables experimental materials | Robotics, manufacturing | Speculative | Experimental |
| 21 | Predict stiffness from stitch topology | Core metamaterial problem | Mechanics, graph theory | Medium-term | Experimental/theoretical |
| 22 | Superjamming design rules | Turns beadwork into programmable matter | Contact mechanics, friction | Medium-term | Experimental |
| 23 | Tension/slack inverse estimation | Needed for simulation and repair | Mechanics, inverse problems | Medium-term | Experimental |
| 24 | Differentiable beadwork simulator | Enables inverse mechanical design | Simulation, ML | Speculative | Computational |
| 25 | Failure and unraveling theory | Repair, durability, and safety | Topology, fracture, friction | Medium-term | Theoretical/experimental |
| 26 | Beadwork homogenization | Derive continuum material laws | Multiscale mechanics | Speculative | Theoretical |
| 27 | Active beadwork structures | Shape-change through actuated thread | Soft robotics | Medium-term | Experimental |
| 28 | Relation to quillwork and shellwork | Avoid bead exceptionalism | Material culture, topology | Medium-term | Comparative/cultural |
| 29 | Wampum as mathematical record | Requires protocol-sensitive semiotics | History, Indigenous studies | Speculative | Cultural |
| 30 | Linear algebra and beadwork pedagogy | Builds from current teaching experiments | Math ed, Indigenous pedagogy | Near-term | Pedagogical |
| 31 | Beadwork pattern compression | Useful for archives and charting | Information theory | Near-term | Computational |
| 32 | Beadwork and knot invariants | Classify ropes, links, and threaded forms | Knot theory | Medium-term | Theoretical |
| 33 | RAW and CRAW 3D grammar | Needed for cubic and volumetric beadwork | Cell complexes, PL topology | Medium-term | Theoretical/computational |
| 34 | Ethical image-to-bead conversion | Prevents appropriation and misuse | HCI, cultural protocol | Near-term | Cultural/computational |
| 35 | Benchmark library of bead structures | Allows reproducible research | Databases, CAD, craft studies | Near-term | Infrastructure |

---

## VIII. Annotated bibliography

### A. Tiling, stitch structure, and angle weave

**Gwen L.
Fisher and Blake Mellor, “Using Tiling Theory to Generate Angle Weaves with Beads,” *Journal of Mathematics and the Arts* 6(4), 2012, 141–158.
DOI: 10.1080/17513472.2012.736935.** A foundational peer-reviewed mathematics/art paper.
It proves that every normal tiling induces an angle weave and classifies resulting bead weaves.
Essential for any formal theory of bead weaving.
([digitalcommons.lmu.edu](https://digitalcommons.lmu.edu/math_fac/185/))

**Gwen Fisher and Blake Mellor, “Three-dimensional finite point groups and the symmetry of beaded beads.”** A mathematical-art source on beaded beads and finite point-group symmetry.
Important because it treats beadwork as a 3D symmetry medium, though it is less central to stitch grammar than the angle-weave paper.
([blakemellor.lmu.build](https://blakemellor.lmu.build/research/BeadedBeads.pdf?utm_source=chatgpt.com))

### B. Bead crochet, topology, and symmetry

**Susan Goldstine, “Building a better bracelet: wallpaper patterns in bead crochet,” *Journal of Mathematics and the Arts* 6, 2012, 5–17.** A key peer-reviewed bead-crochet paper.
It shows that bead-crochet bracelets can realize thirteen of the seventeen wallpaper groups.
Important for understanding how a craft constraint restricts symmetry.
([tandfonline.com](https://www.tandfonline.com/doi/abs/10.1080/17513472.2012.654423?utm_source=chatgpt.com))

**Ellie Baker and Susan Goldstine, *Crafting Conundrums: Puzzles and Patterns for the Bead Crochet Artist*, AK Peters/CRC Press, 2014.** A practitioner-mathematical book linking bead crochet to topology, graph theory, knot theory, tessellations, and wallpaper groups.
Reliable as a mathematically informed craft source, not a peer-reviewed research monograph.
([ravelry.com](https://www.ravelry.com/patterns/sources/crafting-conundrums-puzzles-and-patterns-for-the-bead-crochet-artist?utm_source=chatgpt.com))

**Sophie Sommer, Ellie Baker, Susan Goldstine, and collaborators, seven-color torus bead-crochet work.** A mathematical-art lineage realizing seven-color maps on bead-crocheted tori, connecting bead crochet to the Heawood theorem and topological graph coloring.
([jstor.org](https://www.jstor.org/stable/pdf/10.4169/mathhorizons.
21.1.22.pdf?utm_source=chatgpt.com))

**Eve Torrence, “Creativity and Rigor: A Bead Crochet Mathematics Course,” Bridges 2021.** A pedagogical source describing a 14-week bead-crochet mathematics course, including torus constructions and bead-crochet mathematical design.
Useful for teaching and curriculum design.
([archive.bridgesmathart.org](https://archive.bridgesmathart.org/2021/bridges2021-1.pdf?utm_source=chatgpt.com))

### C. Geometric beadwork and fullerenes

**Bih-Yaw Jin, “Molecular Modeling of Fullerenes with Beads,” *Journal of Chemical Education*.
DOI: 10.1021/ed200142g.** Peer-reviewed chemical education work showing how fullerenes can be modeled with beads via right-angle weave.
Important for connecting beadwork to chemical graph theory and discrete curvature.
([pubs.acs.org](https://pubs.acs.org/doi/10.1021/ed200142g?utm_source=chatgpt.com))

**Bih-Yaw Jin, “Constructing Molecules with Beads: The Geometry of Topologically Nontrivial Fullerenes,” Bridges 2010.** Bridges paper on bead models of fullerene structures from spiral codes and related constructions.
Reliable as mathematical-art/proceedings literature.
([archive.bridgesmathart.org](https://www.archive.bridgesmathart.org/2010/bridges2010-391.pdf?utm_source=chatgpt.com))

**Kazunori Horibe, Bih-Yaw Jin, and Chia-Chin Tsoo, “From Sangaku Problems to Mathematical Beading,” Bridges 2014.** Workshop/proceedings source connecting Japanese mathematical art and bead models of C20, C60, and Goldberg polyhedra.
Important as a bridge between practitioner lineage and formal geometry.
([archive.bridgesmathart.org](https://archive.bridgesmathart.org/2014/bridges2014-503.pdf?utm_source=chatgpt.com))

**Chuang, Jin, Tsoo, and collaborators, high-genus fullerene beadwork.** Bridges mathematical-art work on high-genus trivalent fullerene sculptures with handles.
Useful for topology, genus, and discrete surface realization.
([scispace.com](https://scispace.com/pdf/designing-sculptures-inspired-by-symmetric-high-genus-2kru1yyyrk.pdf?utm_source=chatgpt.com))

**Kate McKinnon and collaborators, *Contemporary Geometric Beadwork*.** Practitioner source and open collaborative project.
Not peer-reviewed mathematics, but highly significant as an experimental geometry corpus involving folded polygons, linkages, tessellations, tetrahedra, hyperbolic forms, and joins.
([gallery.bridgesmathart.org](https://gallery.bridgesmathart.org/exhibitions/2019-bridges-conference-fashion-show/kate-mckinnon?utm_source=chatgpt.com))

**Diane Fitzgerald, *Shaped Beadwork* and *Shaped Beadwork & Beyond*.** Practitioner books on shaped bead forms, increases, and 2D/3D bead geometry.
Useful for formalizing practical shape-generation operations.
([books.google.com](https://books.google.com/books/about/Diane_Fitzgerald_s_Shaped_Beadwork.html?id=uCjTQN539ugC&utm_source=chatgpt.com))

### D. Thread topology and graph algorithms

**Erik D.
Demaine, David G.
Kirkpatrick, Michael P.
Lin, and collaborators, “Graph Threading,” ITCS 2024 / arXiv 2023–2024.** Theoretical computer science paper inspired by beadwork and himmeli.
Gives polynomial algorithms for threading a string through graph-like structures so tightening realizes a connected graph.
Important for beadwork topology and fabrication algorithms.
([arxiv.org](https://arxiv.org/abs/2309.10122))

**R.
Asherov, “Finding Optimal Paths in Beadworks: What If Euler Were a Beader?” Bridges 2013.** Proceedings source on beadwork path constraints and Euler-like routing.
Useful as an early articulation of beadwork path optimization, though narrower than a full port-graph theory.
([archive.bridgesmathart.org](https://archive.bridgesmathart.org/2013/bridges2013-449.pdf?utm_source=chatgpt.com))

### E. Mechanics and metamaterials

**Lauren Dreier, Trevor J.
Jones, Abigail Plummer, Andrej Košmrlj, and P.-T.
Brun, “Beaded metamaterials,” *Nature Communications* 16, Article 7899, 2025.** Major recent peer-reviewed paper.
It frames beaded assemblies as mechanical metamaterials whose stiffness arises from programmable bead-thread geometry, contact, friction, tension, slack, and superjamming.
Central to the 2025–2026 frontier.
([nature.com](https://www.nature.com/articles/s41467-025-61809-8))

**Yan et al., “Self-deployable contracting-cord metamaterials with tunable mechanical properties,” *Materials Horizons* 11, 2024, 3805–3818.
DOI: 10.1039/D4MH00584H.** Peer-reviewed materials-science paper using threaded bead-like networks with active contraction, conical interfaces, self-assembly, tunable stiffness, and damping.
Important adjacent engineering source.
([pubs.rsc.org](https://pubs.rsc.org/en/content/articlelanding/2024/mh/d4mh00584h))

**Eric Brown et al., “Universal robotic gripper based on the jamming of granular material,” *PNAS*, 2010.** Foundational granular-jamming robotics paper.
Not beadwork, but crucial adjacent mechanics for understanding bead contact, jamming, and variable stiffness.
([pnas.org](https://www.pnas.org/doi/10.1073/pnas.
1003250107?utm_source=chatgpt.com))

**Westermann et al., “Compliant Beaded-String Jamming for Variable Stiffness Anthropomorphic Fingers,” arXiv 2025.** Recent preprint on beaded-string jamming in robotic fingers, showing stiffness tuning and manipulation performance.
Useful as an engineering cousin of beadwork mechanics.
([arxiv.org](https://arxiv.org/abs/2502.04190?utm_source=chatgpt.com))

**Walker et al., “A Modular, Tendon Driven Variable Stiffness Manipulator with Internal Cable Routing,” arXiv 2024.** Recent preprint on tendon-driven bead-style continuum manipulators.
Important for active thread routing and variable-stiffness bead-chain structures.
([arxiv.org](https://arxiv.org/abs/2405.01925?utm_source=chatgpt.com))

### F. Algorithmic beadwork and software

**Gwen Fisher, Roger Antonsen, and Zelda Lin, *Beading with Algorithms: Cellular Automata in Peyote Stitch*, World Scientific, 2025/2026.** Recent algorithmic beadwork source.
Treats peyote stitch as a medium for cellular automata, symmetry, periodicity, reversibility, automorphisms, isomorphism, and counting.
([gathering4gardner.org](https://www.gathering4gardner.org/com-2025-07-21/?utm_source=chatgpt.com))

**Culturally Situated Design Tools, “Beadwork Algorithm” and Native bead loom resources.** Educational/computational ethnomathematics resources connecting beadwork to algorithms, symmetry, coordinate structures, and design.
Useful but should be used with attention to community context and pedagogical framing.
([csdt.org](https://csdt.org/culture/whte/en/beadworkalgorithm.html?utm_source=chatgpt.com))

**Loomerly, Bead Pattern Creator, PlanBead, and related bead-pattern software.** Current craft software supporting stitch-specific charts, image conversion, palettes, word charts, and 3D visualization.
Reliable for software capabilities, not mathematical theory.
([loomerly.com](https://loomerly.com/?utm_source=chatgpt.com))

### G. Ethnomathematics, culture, and pedagogy

**Sarah Plosker and Cathy Mattes, “Indigenous Beadwork as a Method of Teaching Linear Algebra,” arXiv 2025.** Recent preprint on Indigenizing undergraduate linear algebra through Indigenous beadwork.
Important for current beadwork pedagogy and for avoiding extractive “examples only” approaches.
([arxiv.org](https://arxiv.org/abs/2509.10477?utm_source=chatgpt.com))

**Maya Chahine, “The iNcwadi: Zulu Beadwork as Mathematical Concretized Information,” *Journal of Mathematics & Culture*, 2013.** Peer-reviewed ethnomathematics article treating Zulu beadwork as visual information involving color, sequence, triangle motifs, symmetry, and social meaning.
Important for beadwork-as-code, but culturally specific and not generalizable to all beadwork.
([journalofmathematicsandculture.wordpress.com](https://journalofmathematicsandculture.wordpress.com/wp-content/uploads/2016/05/chahine-71.pdf))

**Becker, Getz, and Martinson, “Symmetry and pattern in southern African flat beadwork panels,” *de arte* 36(63), 2001, 26–48.
DOI: 10.1080/00043389.2001.11876971.** Foundational symmetry analysis of southern African beadwork panels using frieze and wallpaper groups.
Reliable peer-reviewed source, but formal symmetry analysis should not be mistaken for full cultural interpretation.
([academia.edu](https://www.academia.edu/96384038/Symmetry_and_pattern_in_southern_African_flat_beadwork_panels?utm_source=chatgpt.com))

**Indigenous Math Education Network, “Beadwork + Mathwork” and “Exploring Math and Stories through Geometric Beading.”** Pedagogical resources connecting beadwork to spatial reasoning, measurement, pattern, story, and Indigenous knowledge systems.
Important as living education practice rather than abstract theory alone.
([indigenous.mathnetwork.educ.ubc.ca](https://indigenous.mathnetwork.educ.ubc.ca/beadwork-mathwork/?utm_source=chatgpt.com))

**First Americans Museum, “Sewn Symmetry,” 2025.** Museum/community source on Arapaho, Cheyenne, and Kiowa beadwork, emphasizing visual language, cultural knowledge, family histories, social roles, and intergenerational transmission.
Reliable as museum interpretation, not a mathematical proof source.
([famok.org](https://famok.org/sewn-symmetry/?utm_source=chatgpt.com))

**MNopedia, “Evolution of Dakota Beadwork.”** Public history source describing historical changes in Dakota beadwork, including contrasting stripes, bilateral symmetry, stars, leaves, and flowers.
Useful for historical context.
([mnhs.org](https://www.mnhs.org/mnopedia/search/index/evolution-dakota-beadwork?utm_source=chatgpt.com))

**Canadian Museum of History and Indigenous Peoples Atlas resources on Métis floral beadwork.** Museum/public-history sources on Métis floral beadwork and its relation to First Nations beadwork and French-Canadian floral embroidery.
Useful for cultural and historical context.
([historymuseum.ca](https://www.historymuseum.ca/teachers-zone/history-box/colonial-canada/metis-floral-design?utm_source=chatgpt.com))

**McCord Stewart Museum and Hood Museum resources on wampum.** Museum sources on shell bead patterns as diplomatic, mnemonic, ceremonial, and record-keeping media.
Important for beadwork-as-information, with strong protocol cautions.
([musee-mccord-stewart.ca](https://www.musee-mccord-stewart.ca/en/exhibitions/wampum-beads-diplomacy/?utm_source=chatgpt.com))

### H. Adjacent textile mathematics

**Singal et al., “Programming mechanics in knitted materials, stitch by stitch,” *Nature Communications*, 2024.** Recent peer-reviewed knitting mechanics work.
Useful for contrast: knitting programs mechanics through yarn-loop topology, whereas beadwork programs mechanics through ported rigid units and thread tension.
([nature.com](https://www.nature.com/articles/s41467-024-46498-z?utm_source=chatgpt.com))

**Bright and Kurlin, “Encoding and Topological Computation on Textiles,” arXiv 2020.** Textile topology source extending Gauss-code-like encodings to periodic thread arrangements.
Useful for comparison with beadwork port graphs.
([arxiv.org](https://arxiv.org/abs/2007.14871?utm_source=chatgpt.com))

**Dresselhaus et al., “Textiles: from twisted yarn to topology and mechanics,” arXiv 2026.** Recent review/preprint on textile symmetry, topology, and mechanics.
Useful for locating beadwork relative to broader textile mathematics.
([arxiv.org](https://arxiv.org/abs/2604.09005?utm_source=chatgpt.com))

**AmiGo: Computational Design of Amigurumi Crochet Patterns, arXiv 2022.** Adjacent computational crochet work generating crochet instructions from 3D models.
Important comparison point for what beadwork inverse design currently lacks.
([arxiv.org](https://arxiv.org/abs/2211.01178?utm_source=chatgpt.com))

---

## IX. Glossary: beadwork terms and mathematical readings

| Term | Mathematical / computational reading |
|---|---|
| Bead | Rigid or semi-rigid body with holes/ports; discrete cell or particle |
| Seed bead | Approximately uniform small bead; often modeled as identical unit cell |
| Delica | Cylindrical seed bead with regular geometry; good for lattice-like models |
| Bugle bead | Long cylindrical bead; edge-like or rod-like unit |
| Hole | Internal tunnel through bead; constraint on thread path |
| Port | Oriented entry/exit endpoint of a bead hole |
| Thread path | Walk through bead ports; embedded curve with constraints |
| Pass | One traversal through a bead hole |
| Tension | Global or local force along thread path |
| Slack | Excess thread length allowing deformation |
| Friction | Dissipative contact law between bead/thread or bead/bead |
| Stitch | Local construction rule producing adjacency or cell |
| Peyote stitch | Staggered bead grid; often modeled as hexagonal/offset lattice |
| Brick stitch | Offset rows attached between beads; another staggered graph |
| Square stitch | Grid-like off-loom beadwork; near \(\mathbb{Z}^2\) adjacency |
| Herringbone / Ndebele stitch | Paired angled columns; craft stitch name with cultural naming cautions |
| Right-angle weave | Cyclic four-bead cell grammar |
| Cubic RAW | 3D extension of RAW cells into cubic or box-like complexes |
| Netting | Mesh-like bead cycles; graph with openings |
| Ladder stitch | Linear chain or strip; often a boundary or seed grammar |
| Spiral rope | Helical bead/thread structure |
| Loom beadwork | Row-column bead grid held by warp/weft-like thread system |
| Bead embroidery | Beads stitched to substrate; graph embedded on fabric surface |
| Bead crochet | Pre-strung bead sequence mapped to helical crochet surface |
| Word chart | Linear instruction sequence; formal string over bead-color alphabet |
| Color chart | Function from bead positions to palette |
| Palette | Finite color alphabet \(\Sigma\) |
| Motif | Subpattern; finite colored subgraph |
| Repeat | Periodic orbit under translation or screw symmetry |
| Increase | Local insertion causing curvature or boundary change |
| Decrease | Local removal or merging causing curvature or narrowing |
| Join / zipper | Boundary identification operation |
| Tube | Cylindrical quotient of a strip |
| Torus | Double-periodic closure; genus-one surface |
| Möbius band | Non-orientable strip closure with twist |
| Beaded bead | Beadwork object enclosing or forming a larger bead-like polyhedron |
| Angle weave | Stitch structure induced by angular cycles, often from tilings |
| Cell complex | Beads, edges, and stitch faces as combinatorial surface |
| Port graph | Graph whose vertices are bead ports and whose edges are holes/thread/contact |
| Ribbon graph | Graph with cyclic order data; useful for embedded thread/cell systems |
| Curvature defect | Local deviation from flat coordination |
| Topological defect | Local change not removable by allowed moves |
| Jamming | Rigidification through contact constraints |
| Superjamming | Strong beadwork stiffening via bead contact plus thread tension |
| Inverse design | Compute beadwork from target geometry/pattern/mechanics |
| Stitch grammar | Rewrite system generating legal beadwork |
| Manufacturability | Existence of legal construction sequence and thread path |
| Protocol | Cultural rule governing access, use, teaching, or formalization |

---

## X. Research entry guide

### Best first 10 sources

1. Fisher and Mellor, “Using Tiling Theory to Generate Angle Weaves with Beads.” Start here for formal bead weaving.
  ([digitalcommons.lmu.edu](https://digitalcommons.lmu.edu/math_fac/185/))
2. Goldstine, “Building a better bracelet.” Start here for bead crochet and symmetry.
  ([tandfonline.com](https://www.tandfonline.com/doi/abs/10.1080/17513472.2012.654423?utm_source=chatgpt.com))
3. Baker and Goldstine, *Crafting Conundrums*.
  Best broad bead-crochet mathematical-practitioner source.
  ([ravelry.com](https://www.ravelry.com/patterns/sources/crafting-conundrums-puzzles-and-patterns-for-the-bead-crochet-artist?utm_source=chatgpt.com))
4. Demaine et al., “Graph Threading.” Best theoretical computer science entry.
  ([arxiv.org](https://arxiv.org/abs/2309.10122))
5. Dreier et al., “Beaded metamaterials.” Essential for current mechanics/metamaterials.
  ([nature.com](https://www.nature.com/articles/s41467-025-61809-8))
6. Yan et al., “Self-deployable contracting-cord metamaterials.” Essential adjacent active-material work.
  ([pubs.rsc.org](https://pubs.rsc.org/en/content/articlelanding/2024/mh/d4mh00584h))
7. Jin, fullerene beadwork papers.
  Best entry to geometric beadwork and molecular/topological models.
  ([pubs.acs.org](https://pubs.acs.org/doi/10.1021/ed200142g?utm_source=chatgpt.com))
8. Fisher, Antonsen, and Lin, *Beading with Algorithms*.
  Best entry to cellular automata in peyote stitch.
  ([worldscientific.com](https://www.worldscientific.com/worldscibooks/10.1142/14357?srsltid=AfmBOopQ9OF6ObURQy2ZjKDvKB3P9OAKjyQtmyHKTuVjaJlj1gv3bc-5&utm_source=chatgpt.com))
9. Plosker and Mattes, “Indigenous Beadwork as a Method of Teaching Linear Algebra.” Best current beadwork pedagogy/math-ed entry.
  ([arxiv.org](https://arxiv.org/abs/2509.10477?utm_source=chatgpt.com))
10. Chahine, “The iNcwadi.” Best entry to beadwork as mathematical information in a specific ethnomathematical context.
  ([journalofmathematicsandculture.wordpress.com](https://journalofmathematicsandculture.wordpress.com/wp-content/uploads/2016/05/chahine-71.pdf))

### Prerequisite mathematics by subfield

For bead weaving and angle weave: graph theory, tiling theory, combinatorial topology, group actions, and formal grammars.

For bead crochet: modular arithmetic, lattice quotients, frieze/wallpaper groups, knot theory, graph coloring, and surface topology.

For geometric beadwork: Euler characteristic, polyhedral combinatorics, discrete curvature, triangulations, quadrangulations, fullerenes, and low-dimensional topology.

For mechanics: rigid-body mechanics, contact mechanics, friction, discrete elastic rods, granular jamming, finite elements, and homogenization.

For computation: graph algorithms, constraint solving, SAT/SMT, geometry processing, formal languages, cellular automata, and differentiable simulation.

For ethnomathematics: Indigenous studies, material culture, museum studies, math education, community-based research methods, and Indigenous data sovereignty.

### Software and tools worth learning

For mathematical modeling: Python, NetworkX, SageMath, polymake, Blender, Rhino/Grasshopper, and geometry-processing libraries.

For mechanics: SOFA, MuJoCo-style rigid-body simulation, finite-element tools, discrete elastic rod codes, and contact/friction solvers.

For pattern work: Loomerly, PlanBead, Bead Pattern Creator, BeadTool-like editors, and spreadsheet-based charting.

For archives: JSON-LD, CIDOC CRM, IIIF, linked open data, and culturally governed metadata systems.

For computational design comparison: machine-knitting compilers, crochet design systems such as AmiGo, and inverse-patterning research from textile computation.
([arxiv.org](https://arxiv.org/abs/2211.01178?utm_source=chatgpt.com))

### Research groups, journals, conferences, and communities to watch

The strongest venues are interdisciplinary rather than beadwork-specific: *Journal of Mathematics and the Arts*, Bridges Conference, *Math Horizons*, *Nature Communications*, *Materials Horizons*, soft robotics venues, computational fabrication venues, SIGGRAPH-adjacent design research, math-education journals, ethnomathematics journals, and museum/community research programs.

Communities to watch include mathematical artists, geometric beadworkers, bead-crochet designers, Indigenous math education networks, Culturally Situated Design Tools, computational fabrication groups, and mechanical metamaterials labs.

### Where the literature is strong

The literature is strongest in:

- bead crochet symmetry and topology;
- angle weave and tiling;
- geometric beadwork/fullerenes;
- beadwork-inspired metamaterials;
- ethnomathematical pedagogy in selected traditions;
- practitioner experimental geometry.

### Where the literature is fragmented or missing

The literature is thin in:

- general formal beadwork grammars;
- port-graph and thread-path standards;
- verified beadwork compilers;
- inverse design from arbitrary target surfaces;
- beadwork-specific mechanics simulators;
- rigorous equivalence/local-move theories;
- culturally governed mathematical archives;
- beadwork-specific studies outside a few well-documented traditions.

### Serious first research projects

A mathematically mature newcomer could make a real contribution by choosing one restricted family and formalizing it completely.
Good first projects include:

1. a port-graph formalization of right-angle weave and cubic right-angle weave;
2. an inverse chart generator for bead-crochet cylinders with prescribed wallpaper symmetry;
3. a classifier for peyote cellular automata patterns under shift, reflection, and color permutation;
4. a discrete-curvature model for RAW fullerene beadwork with bead-size corrections;
5. a verified JSON schema for bead charts that compiles to legal thread paths;
6. a small experimental mechanics study measuring stiffness versus thread tension in bead-weave cells;
7. a protocol-aware metadata model for public beadwork archives, designed with beadworkers and community authorities rather than imposed externally.

The deepest opportunity is to build a theory where the same object can be read as graph, surface, thread path, color pattern, mechanical material, algorithm, and cultural artifact—without pretending those readings are identical.
That is the frontier of beadwork mathematics.
