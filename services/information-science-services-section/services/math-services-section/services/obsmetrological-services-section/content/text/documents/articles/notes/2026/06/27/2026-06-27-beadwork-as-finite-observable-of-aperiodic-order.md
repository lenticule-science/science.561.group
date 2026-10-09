---
title: "Beadwork as a finite observable of aperiodic order"
subtitle: "A standalone education in stitch graphs, color, hierarchy, and the mathematics of patterned making"
author:
  - Morgan Sennhauser
  - The 561 Group
date: 2026-06-27
status: "standalone research paper"
keywords:
  - beadwork
  - aperiodic-order
  - graph-coloring
  - tiling-theory
  - symbolic-dynamics
  - finite-observables
  - info-tiles
  - rel-math
abstract: "Beadwork is often described through pattern, symmetry, and repetition. Those are real features, but they do not exhaust the mathematics. A bead object is also a finite visible sampling of a deeper rule system: beads occupy sites in a stitch graph; thread supplies adjacency and tension; colors act as finite observables; local stitch constraints generate global form; defects and changes of color carry information; and a finished band, cuff, rope, or patch is a record of a history of local moves. This paper develops a mathematical language for beadwork as a finite colored tiling system. Its central thesis is that bead color should not be treated merely as decoration. Color is an observable of order: it may be a proper graph coloring, a symbolic state, a matching-rule decoration, a diffraction weight, a provenance marker, or a bilattice-valued charge recording agreement, absence, and conflict. Beginning with ordinary bead practice, the paper builds up the relevant mathematics: graphs, lattices, words, substitutions, local derivability, Wang-style edge constraints, aperiodicity, cohomological obstruction, and spectral order. It then relates this beadwork model to the RelMath and InfoTiles spine, where a proper coloring is read as a factor map, Belnap FOUR supplies a four-valued information palette, and coordinated disagreement is measured by a first cohomology obstruction. The result is not a claim that bead traditions reduce to formal mathematics. It is a respectful technical proposal: beadwork gives one of the clearest material classrooms for learning how finite local actions can generate, observe, and preserve infinite or long-range informational structure."date-created: 2026-06-27
description: Beadwork is a mathematics of small local decisions.
---

# 1. Introduction: color is not only ornament

Beadwork is a mathematics of small local decisions.
A bead is selected, threaded, placed beside earlier beads, pulled into tension, and made to participate in a surface, rope, fringe, strap, medallion, cuff, or figure.
The maker does not manipulate an abstract plane.
They manipulate beads, thread, holes, handedness, needle paths, tension, color, sequence, edge, repair, and the memory of the work already done.
A finished piece is therefore not just an image.
It is a physical trace of a computation performed by hand.

The visible pattern is the easiest part to name.
We can point to stripes, diamonds, chevrons, flowers, waves, stars, letters, gradients, and symmetries.
We can count colors or repeats.
We can ask whether a motif is periodic.
These are useful first questions, but they miss the deeper structure.
A bead pattern is not only a colored picture on a surface.
It is a pattern constrained by a stitch graph.
The graph says which bead positions can be neighbors, which bead holes can be connected by thread, which rows offset from which other rows, which edges are exposed, which turns are possible, which defects can be absorbed, and which local choices force later consequences.

The central thesis of this paper is:

> A beadwork pattern is a finite observable of a stitch-generated order.

This phrase deliberately echoes the recent RelMath note "Color as a finite observable of aperiodic order."
In that note, color is not treated as a single mathematical object.
It can be a graph coloring, a matching-rule decoration, a Wang-tile edge alphabet, a Markov-partition state, or a diffraction weight.
The same shift is useful for beadwork.
Bead colors are not only aesthetic labels.
They are finite observations of a deeper object: the stitch graph, the local rule, the growing surface, the maker's history of choices, and the long-range order that appears when many local moves accumulate.

This paper is standalone.
It assumes no prior knowledge of tiling theory, symbolic dynamics, or the 561 Group corpus.
It does, however, borrow the discipline of that corpus: we distinguish what is proven, what is built, what is a research-grade interpretation, and what remains a roadmap.
The beadwork model here is research-grade.
It is a conceptual and mathematical synthesis, not a formal theorem about all bead traditions or all stitch systems.
The RelMath claims cited by name, such as `properColoring_iff_hom`, `K4_requires_FOUR`, `edge_colouring_entropy`, `sofic_of_decorated`, and `h1_vanishes_iff_forest`, are part of the existing formal spine.
The extension from those results to beadwork is a proposed interpretation.

The caution matters.
Beadwork is not a generic mathematical toy.
It belongs to many living communities, lineages, economies, ceremonies, fashions, and personal practices.
A mathematical account must not flatten that richness into "patterns on a grid."
The goal here is narrower and more useful: to explain how beadwork can educate us in the same mathematics that appears in aperiodic tilings, symbolic dynamics, information displays, and coherent records.
Beadwork is a material classroom for finite local constraints and visible global structure.

# 2. The bead object as graph, surface, and record

Begin with the simplest formal model.
A beadwork object has bead positions.
Make one vertex for each bead position.
Draw an edge when two positions are adjacent in the sense relevant to the stitch: they may touch, share thread, sit in the same row, constrain one another's placement, or form part of a local motif.
The result is a graph \(G\).
A color assignment is a function \[ c : V(G) \to A, \] where \(A\) is a finite alphabet of bead colors, finishes, sizes, materials, or roles.

This graph model is intentionally flexible.
In loom beadwork, the graph may look like a rectangular grid.
In brick stitch, rows are offset and beads sit between beads in neighboring rows.
In peyote stitch, the graph has a staggered structure where later beads lock into gaps.
In tubular peyote, the surface wraps around a cylinder, so the left and right edges of a flat diagram are identified.
In herringbone, right-angle weave, netting, fringe, bead crochet, or sculptural beadwork, the graph may be neither square nor planar in the naive sense.
The graph records the operative adjacency, not the drawing convention.

The bead object is also a surface.
A loom strip is close to a rectangle.
A tubular rope is close to a cylinder.
A medallion may approximate a disk.
A beaded covering can live on a sphere-like, cone-like, or irregular surface.
The same local stitch can therefore have different global topology depending on how the edges are joined.
A flat strip and a closed bracelet may use the same local bead sequence, but the bracelet adds a periodic boundary condition: the final bead must meet the first bead coherently.

Finally, a bead object is a record.
It is not born all at once.
It is made by a sequence of moves.
At step \(t\), a bead is added, a thread path is extended, a turn is made, tension is adjusted, or a defect is corrected.
If we write each move as an event, we obtain a log: \[ (event_0, event_1, event_2, \ldots, event_n). \] The visible object is a projection of this log.
The final color at a bead site may be all the viewer sees, but the maker's object also contains history: where the thread doubled back, where a bead broke, where a color ran out, where a repair was made, where the pattern shifted by one bead and had to be reconciled.

This threefold view -- graph, surface, record -- is the beadwork analogue of the InfoTiles view of data.
A poly-informational dataset is not just a table of values.
It has adjacency, provenance, time, conflict, and display.
Likewise a beadwork piece is not just a color array.
It is a stitched graph embedded in a surface and produced by a witnessed sequence of local operations.

# 3. Color as a finite observable

A finite observable is a finite label that lets us see something about a larger system.
A thermometer reading is a finite observable of a body's thermal state.
A pixel is a finite observable of a scene.
A bead color is a finite observable of a beadwork order.

The word "observable" is useful because it prevents a common mistake.
A color does not automatically preserve all the information in the object.
It sees some features and forgets others.
A black-white checker pattern sees parity but may forget row identity.
A four-color floral motif sees motif class but may forget the exact thread path.
A transparent bead may mark negative space in the visual image while still participating fully in the stitch graph.
A metallic bead may have the same graph color as a matte bead in a design chart but a different physical weight, reflectance, or friction in the object.

The recent aperiodic-color note distinguishes five roles of color.
Each has a direct beadwork reading.

First, color can be a proper graph coloring.
Adjacent beads may be required to have different colors, or a motif may require that certain positions never match their neighbors.
This is the ordinary graph-theoretic idea.

Second, color can be a matching-rule decoration.
A bead may carry a visible or hidden role that forces how it can sit next to other beads.
In beadwork, this role can be color, bead size, shape, orientation, hole count, or stitch function.
The decoration forces the next local move.

Third, color can be a symbolic state.
A sequence of beads can be read as a word over a finite alphabet.
A band can be a one-dimensional symbolic system; a surface can be a two-dimensional subshift.
Local forbidden patterns define what counts as legal.

Fourth, color can be a coordinate of a partition.
A repeating or hierarchical design may assign colors according to which region of a larger construction the bead occupies.
In such a design, color is not merely placed on a finished surface; it is the finite code by which the surface is generated.

Fifth, color can be a spectral weight.
Materials scatter light differently.
Metallic, matte, transparent, opaque, iridescent, and cut beads respond differently under illumination.
Even before physical optics, a mathematical weight assigned to bead colors can be used to study autocorrelation: which color pairs recur at which distances?

These roles overlap.
A single blue bead in a bracelet may be a color in a motif, a state in a word, part of a local matching rule, a parity marker, and a reflective weight.
The mathematical question is not "what is its true meaning?" but "which observable are we using, and what does it preserve?"

# 4. Proper coloring: adjacency, contrast, and local law

The most familiar mathematical coloring problem asks for a color assignment in which adjacent vertices differ.
If \(G\) is a bead adjacency graph, a proper coloring with alphabet \(A\) is a map \(c:V(G)\to A\) such that \(c(u)\ne c(v)\) whenever \(u\) and \(v\) are adjacent.

This definition looks simple, but beadwork makes it interesting quickly.
Which adjacency matters?
Physical touch?
Shared thread?
Visual neighborhood?
Same motif cell?
Diagonal contact?
Beads two steps apart that align in the next row?
Different answers give different graphs and therefore different chromatic questions.

For a square loom grid with horizontal and vertical adjacency, two colors suffice for a checkerboard.
The graph is bipartite: every vertex can be assigned one of two parities.
But if diagonal adjacency counts, the same square array may need four colors for a local no-touch rule, because every \(2\times2\) square forms a complete set of diagonal constraints.
If the strip wraps into a cylinder with an odd circumference, the two-color checkerboard may fail at the seam.
A local coloring that works on a flat patch can become globally obstructed by the closing seam.

This is the first lesson beadwork gives better than a chalkboard graph: global topology changes local colorability.
The same stitch and the same local rule can be easy on a strip and impossible on a closed loop of the wrong parity.
The bracelet teaches cohomology before the word "cohomology" appears.
There is a local assignment problem; around a cycle, the assignments may or may not glue.

Graph coloring also separates existence from method.
It may be true that a proper coloring exists, but the maker still needs a local rule for producing it without solving the whole graph at once.
A bead chart is valuable because it is not merely an existence proof.
It is an algorithm: at each position, it tells the maker what to do.
For aperiodic beadwork, the difference is crucial.
A coloring chosen by an all-seeing external solver is not the same as a coloring locally derivable from the growing patch.

In RelMath terms, the theorem `properColoring_iff_hom` says that a proper coloring is exactly a graph homomorphism into a complete graph on the color palette.
The beadwork reading is direct: coloring a bead graph is mapping the stitch adjacency graph into a finite color graph.
A design chart is therefore a factor of the bead graph.
It preserves adjacency constraints but forgets all information not visible in the chosen palette.

# 5. Words, bands, and bead sequences

Many bead patterns begin as one-dimensional words.
A bracelet may repeat a sequence such as \[ A B A C A B A D \] around a loop.
A fringe may use a vertical word.
A bead crochet rope may use a long stringing sequence that later winds into a tube.
Even when the final object is two- or three-dimensional, the maker may interact first with a word: a list of colors to string.

Formal language theory is the natural mathematics of bead words.
A finite alphabet \(A\) contains the bead types.
A word is a finite sequence in \(A^*\).
A bi-infinite or one-sided infinite sequence belongs to \(A^\mathbb{Z}\) or \(A^\mathbb{N}\).
A local rule can be expressed by forbidden subwords.
For example, "never place two red beads adjacent" forbids \(RR\).
"Every gold bead must be followed within two positions by black" forbids longer patterns.
The set of all sequences avoiding finitely many forbidden words is a shift of finite type.

A bead band makes this concrete.
Suppose a maker wants a band in which red beads never touch and blue beads always occur in pairs.
The legal patterns are not described by a single period.
They are described by a finite automaton: after a red bead, red is temporarily forbidden; after one blue bead, another blue is required; after the pair is completed, the system returns to a freer state.
The bead sequence is a walk in a finite state graph.

This is the simplest bridge from beadwork to symbolic dynamics.
The alphabet is finite, the rule is local, and the global object is the set of all legal sequences.
If the sequence is periodic, it repeats after some length.
If it is nonperiodic but generated by a deterministic substitution, it can still have long-range order.
If it is generated by an aperiodic finite rule, it may never repeat globally while every local patch remains legal.

The beadwork distinction between chart and object matters again.
A chart for a flat band may be a word.
A tubular object may read that word along a helix.
The same stringing sequence can produce different visible diagonals depending on the tube circumference.
Thus the observable word and the embedded bead surface are related by a coding map.
Some information is preserved; some is transformed into spiral slope, seam behavior, and phase.

# 6. Stitch graphs as tilings

A tiling is a covering by local pieces.
In beadwork, the local pieces are beads and the thread-mediated neighborhoods around them.
This is not always a tiling of the Euclidean plane by polygons, but it is a tiling in the broader combinatorial sense: positions are filled by finite types subject to local compatibility.

Brick stitch gives a useful example.
Rows are offset, so each bead in one row typically sits between two beads in the row below.
The adjacency graph resembles a triangular or hexagonal relation more than a square grid.
Peyote stitch similarly creates a staggered lattice.
Right-angle weave creates square-like units whose corners are beads and whose edges are thread paths.
Netting creates larger cells.
Bead crochet maps a stringing word onto a tube, producing diagonal stripes and helices from arithmetic relations between word period and tube circumference.

The stitch is therefore a local rule for building a combinatorial surface.
The beads are not just colored pixels.
Their holes and thread paths define incidence relations.
The same visual bitmap drawn on graph paper may be natural in loom work and awkward in peyote, because the underlying adjacency graph differs.

This is why bead mathematics should begin with the stitch graph rather than with the image.
The graph is the substrate.
Color is a function on it.
Motif is a pattern in that function.
Tension and material affect which graph embeddings are physically stable.
A chart is a projection, not the whole object.

In tiling theory, one often studies the hull of a tiling: all tilings locally indistinguishable from a given one, with a topology in which two tilings are close when they agree on a large neighborhood.
A beadwork analogue is the design space generated by a stitch rule and a palette: all bead surfaces whose local patches satisfy the same constraints.
A single bracelet is one point in that space.
A family of bracelets sharing the same local law is a hull-like object.

This hull perspective changes the questions.
Instead of asking only "what is the pattern on this object?" we ask:

- What local patches are allowed?
- Which global bead surfaces realize them?
- Which colorings are locally derivable from the uncolored stitch graph?
- Which defects can appear without leaving the hull?
- Which invariants survive changes of chart, seam, or material?

These are tiling questions in bead language.

# 7. Substitution, hierarchy, and nonperiodic bead patterns

Substitution is one of the most important ways local rules generate long-range order.
A substitution replaces each symbol or tile type by a larger word or patch.
Repeating the replacement builds larger and larger structures.
The Fibonacci substitution \[ A \mapsto AB,\qquad B \mapsto A \] generates the word \[ A,\ AB,\ ABA,\ ABAAB,\ ABAABABA,\ldots \] which is nonperiodic but highly ordered.
It has local recurrence, controlled frequencies, and a precise inflation ratio.

Beadwork can realize substitutions directly.
Let \(A\) and \(B\) be bead types, or better, bead motifs.
Replace each \(A\) motif by an \(AB\) block and each \(B\) motif by an \(A\) block.
At each scale the maker can bead the expanded word.
The result is not random.
It has no finite repeating period, but every finite patch that appears reappears with controlled spacing.
It is aperiodic order in the hand.

More complex substitutions operate on two-dimensional patches.
A small diamond motif may inflate into a cluster of diamonds and triangles.
A border unit may inflate into a border-with-corner unit.
A flower may become a flower surrounded by leaves that themselves become future flowers.
In a beadwork chart, this is often experienced as motif hierarchy: small units assemble into larger units, which assemble into larger fields.

Substitution separates two ideas that are often confused: repetition and order.
Periodic beadwork repeats a unit exactly after a translation.
Substitutional beadwork may never repeat globally, yet it is more ordered than a random sequence.
Its long-range structure comes from the inflation rule, not from a period.

This distinction is central to aperiodic tiling theory.
Penrose tilings, chair tilings, Ammann-Beenker tilings, Hat and Spectre monotile systems, and many Wang shifts all explore ways finite local rules can force nonperiodic global order.
The beadwork version is accessible: choose a finite set of local bead moves, but arrange them so no translational repeat can satisfy all scales at once.

There is an educational payoff.
Beading a substitution pattern teaches the difference between:

- a finite motif repeated periodically;
- a finite rule iterated hierarchically;
- a random-looking but deterministic nonperiodic sequence;
- an actually random sequence;
- and an aperiodic local rule whose legal completions are all nonperiodic.

Those distinctions are the heart of aperiodic order.

# 8. Matching rules: when decoration forces structure

In many bead projects, a color is not only a visual choice.
It tells the maker what kind of move is possible next.
A bead may mark a corner, a turn, a join, a decrease, an increase, a fringe root, a midline, or a seam.
Sometimes these markers remain visible.
Sometimes they are temporary or hidden in the structure.
Mathematically, they are matching-rule decorations.

Matching rules are local constraints that force global structure.
In classical tiling theory, one may decorate tile edges with arrows or colors so that only matching edges can meet.
The decorations can force a substitution hierarchy: every legal decorated tiling must decompose into supertiles, and those into larger supertiles, indefinitely.
Goodman-Strauss's work on matching rules and substitution tilings is a standard reference for this idea, and newer work studies broad finite-local-complexity conditions under which substitution and hierarchical tilings are sofic: obtained from decorated finite-rule systems by forgetting decoration.

Beadwork makes this idea tactile.
A two-hole bead has orientation.
A shaped bead may allow one connection on one side and a different connection on another.
A color-coded chart may mark beads that must be picked up in a turn but not in the straight run.
A larger shaped motif may require special transition beads at its boundary.
The decoration is local, but it controls the future.

The interesting question is not only whether decorations can force a structure.
It is how much decoration is needed.
A brute-force method can collar every bead by its surrounding patch: give each possible neighborhood its own label.
That works but explodes the alphabet.
The elegant method finds semantic colors: labels that record only the information needed to force the hierarchy.

For beadwork, this suggests a research program:

- Given a stitch graph and a desired hierarchical design, what is the smallest bead alphabet that forces the hierarchy locally?
- Can the hierarchy be forced by visible colors alone, or are bead shape, orientation, and thread path needed?
- Is the decorated bead system mutually locally derivable from the undecorated design, or does it add information that is forgotten in the final surface?
- Which decorations are structural and which are merely chart conveniences?

This is the bead analogue of minimizing matching rules for substitution tilings.
It treats color as an operational finite observable: color tells the work how to continue.

# 9. Wang-style bead systems

Wang tiles are square tiles with colored edges.
They tile the plane when adjacent edge colors match.
The model is famous because a finite set of such tiles can force aperiodic behavior, and because the general tiling problem is undecidable.
Jeandel and Rao's eleven-tile result is a modern benchmark: a tiny finite alphabet can force nonperiodic global order.

Beadwork has a natural Wang-style reading.
Instead of coloring the bead itself, color its connection ports: north, south, east, west, or the appropriate ports for the stitch.
A bead type is then a small connector with labeled interfaces.
Two beads may sit next to each other only when their facing ports match.
This is already close to how many shaped beads work physically.
Holes, edges, finishes, and orientations define compatibility.

For ordinary round seed beads, the ports are not visibly different, but the thread path can still create states.
A bead entered from below and exited to the right is not in the same local thread state as a bead entered from the left and exited upward.
If we label those states, we get a Wang-like local system on a stitch graph.

This view is powerful because it makes the rule finite.
A beadwork pattern need not be stored as an enormous chart.
It can be generated by a finite set of bead types and compatibility rules.
The chart is one legal configuration; the system is the set of all legal configurations.

Wang-style bead systems clarify three levels of design:

1. The tile or bead alphabet: what local pieces exist?
2. The matching rule: which interfaces may meet?
3. The factor map: what visible bead colors remain after hidden states are forgotten?

The third level is often the most important.
A hidden thread-state system may force a complex order, while the visible bead colors show only a simple motif.
The visible object is a factor of the hidden state tiling.
In RelMath language, this echoes `sofic_of_decorated`: forgetting decoration from a finite-type decorated system yields a sofic observable.
A bead chart can be the visible sofic projection of a stricter hidden stitch system.

# 10. Local derivability: when the chart and object know each other

Two descriptions of a beadwork object may contain the same information, or one may forget part of the other.
Local derivability gives a precise way to say which.

A colored bead surface is locally derivable from an uncolored stitch surface if the color at each bead can be determined from a bounded-radius patch of the uncolored surface.
Conversely, the uncolored surface is locally derivable from the colored surface if the stitch structure can be recovered from bounded color neighborhoods.
If both directions hold, the two descriptions are mutually locally derivable, or MLD.

MLD is stronger than looking similar.
It says the same local information is present in different alphabets.
For beadwork, examples help:

- A two-color parity pattern on an infinite square grid is locally derivable from a chosen origin and orientation, but not from the unmarked grid alone if the origin is forgotten.
  The color contains phase information.
- A stitch chart that marks every turn bead may make the thread path locally recoverable.
  If the turn markers are removed, the visible bead colors may no longer determine the path.
- A substitution hierarchy may be visible from large enough local bead patches if recognizability holds.
  If not, the same local patch may belong to different supertile decompositions.

The MLD question prevents overclaiming.
If a beaded Fibonacci band uses two bead colors, the colors may let us recover the symbolic substitution word.
But if the same colors are used in a more ambiguous design, the visible band may be a many-to-one factor of several possible hidden histories.
The bead object then does not "know" its construction locally, even if the maker does.

This is also where cultural and material knowledge re-enters the mathematics.
The same visible bead surface can have different meanings depending on method, community, and use.
Mathematical local derivability is not social meaning.
It is a statement about what information is recoverable from bounded formal patches.
It should be used carefully, as one layer of analysis rather than a total interpretation.

# 11. Boundary, seams, and cohomological obstruction

Every beadworker knows that seams matter.
A flat pattern may look perfect until it is joined.
A repeated unit may wrap cleanly only when the circumference is a multiple of its period.
A spiral rope may close with a phase shift.
An odd number of beads may force a mismatch in a two-color alternation.
A repair may be locally invisible but globally detectable.

This is cohomology in practice: local data must glue around cycles.
When it does not, the failure is not located at a single bead.
It is distributed around the loop.

Consider a two-color alternation \(A,B,A,B,\ldots\) around a bracelet with \(n\) bead positions.
If \(n\) is even, the alternation closes.
If \(n\) is odd, the final adjacency forces \(A\) next to \(A\) or \(B\) next to \(B\).
Locally, every segment of length less than \(n\) may look legal.
Globally, the cycle has an obstruction.

For a more complex example, imagine three panels joined around a cuff.
Each pair of panels agrees on its shared edge, but the three agreements impose an inconsistent phase when followed around the whole cuff.
No individual seam is the sole cause.
The obstruction belongs to the cycle of overlaps.

The RelMath/InfoTiles papers use first cohomology, especially a cover-nerve \(\check H^1\), as a coordination obstruction.
In the simplest graph case, the rank of \(H^1\) is the cycle rank: \[ |E| - |V| + |C|, \] where \(E\) is the edge set, \(V\) the vertex set, and \(C\) the number of connected components.
The theorem `h1_vanishes_iff_forest` captures the basic lesson: a forest has no cycle obstruction.
Cycles are where independent local choices can return with a mismatch.

For beadwork, this gives a clean educational account of seams:

- A strip is often tree-like in the direction of construction; choices can be propagated.
- A closed bracelet adds a cycle; phase must be checked.
- A netted surface adds many cycles; local motifs must coordinate around holes.
- A repaired region creates a new overlap cover; agreement on the boundary may or may not extend inside.

Thus cohomology is not an abstract afterthought.
It is the mathematics of "will this local pattern close?"

# 12. The bilattice palette: absence, assertion, denial, conflict

Most bead charts treat color as a single categorical value: red, blue, gold, white.
But some beadwork situations require a richer information state.
A bead position may be unknown, decided, forbidden, or conflicted.
A chart under development may have blank positions, planned positions, rejected positions, and positions where two constraints disagree.
A collaborative design may have one source asserting a bead should be red and another asserting it must not be red.
A repair may preserve both histories: what was originally there and what now replaces it.

Belnap's four-valued logic FOUR is an elegant carrier for this.
Its values are:

- \(\bot\): told nothing;
- \(\mathbf t\): told true, or evidence-for;
- \(\mathbf f\): told false, or evidence-against;
- \(\top\): told both, conflict held.

There are two orders.
The knowledge order \(\le_k\) measures how much information has been received: \(\bot\) is least, \(\top\) is greatest, and \(\mathbf t\) and \(\mathbf f\) are incomparable one-bit states.
The truth order \(\le_t\) measures assertion lean: false below, true above, with \(\bot\) and \(\top\) in the middle.
Negation swaps \(\mathbf t\) and \(\mathbf f\) while fixing \(\bot\) and \(\top\).

For beadwork, FOUR is not a replacement for ordinary color.
It is a meta-color, an information charge attached to a bead decision.
A site can be physically blue while its decision state is \(\mathbf t\) relative to one design rule and \(\top\) relative to another.
For example:

- \(\bot\): the bead has not been chosen.
- \(\mathbf t\): the bead satisfies the motif rule.
- \(\mathbf f\): the bead violates the motif rule or is ruled out.
- \(\top\): the bead is both required by one constraint and forbidden by another.

This is especially useful for design tools, collaborative charts, repairs, and analysis of defects.
Classical logic tends to explode under contradiction: if a position is both required and forbidden, the theory becomes unusable.
A paraconsistent bilattice holds the conflict as data.
The beadworker's practical version is familiar: "this bead is wrong for the chart but necessary for the repair" is not nonsense.
It is a held contradiction with provenance.

The InfoTiles math uses `K4_requires_FOUR` to connect the four-element palette to the complete graph \(K_4\): the four charges are forced as the four distinct corners of the palette.
The beadwork reading is research-grade but intuitive.
Four is the smallest palette that can distinguish no information, affirmative information, negative information, and conflict.
It is therefore a natural information overlay for bead decisions.

# 13. Entropy: how much choice is in a pattern?

Beadwork patterns vary in freedom.
Some charts determine every bead.
Others set constraints but leave choices open: use any of three accent colors, avoid adjacent repeats, choose a random but balanced distribution, improvise within a border.
Mathematics measures this freedom with entropy.

In a finite graph coloring problem, one simple information measure is: \[ h = \log_2(\#\text{legal colorings}). \] If there is only one legal coloring, \(h=0\) bits: no choice remains.
If there are two legal colorings, \(h=1\) bit.
If there are \(2^k\) legal colorings, \(h=k\) bits.

This is not the only entropy relevant to beadwork, but it is a useful first one.
Suppose a row of ten beads must alternate black and white.
If the first bead is fixed, every bead is determined: zero bits remain.
If the first bead is free, there are two choices: one bit.
Suppose instead each bead can be red, blue, or gold, but no two adjacent beads may match.
The number of legal rows is \[ 3\cdot 2^9, \] because the first bead has three choices and each later bead has two choices.
The row contains \(\log_2(3\cdot2^9)=9+\log_2 3\) bits of coloring freedom.

For growing patterns, entropy rate matters: bits per bead in the large-size limit.
A highly constrained substitution pattern may have low entropy even when it is nonperiodic.
A random-looking legal subshift may have positive entropy.
A periodic border has entropy rate zero once phase is fixed.

The RelMath theorem `edge_colouring_entropy` proves the worked edge case: a properly two-colored edge carries exactly one bit.
The beadwork classroom version is immediate.
Two adjacent beads constrained to differ, using two colors, have exactly two legal assignments: \(AB\) or \(BA\).
That is one bit.

Entropy helps distinguish pattern types:

- Periodic chart: low global entropy after the repeat is specified.
- Improvised within constraints: positive entropy, bounded by local rules.
- Substitutional aperiodic pattern: often zero entropy rate but nonperiodic long-range order.
- Random bead soup: high entropy but little structured recurrence.

The craft intuition is precise: some patterns feel free because they contain many legal continuations; others feel inevitable because each local move forces the next.

# 14. Diffraction and autocorrelation: what repeats at a distance?

If bead colors are weights on points, a beadwork object becomes a weighted point set.
For each bead position \(x_i\), assign a weight \(w_i\) depending on color, material, finish, or information charge.
The autocorrelation asks: for each displacement \(r\), how often do weighted bead pairs occur at that separation?
Diffraction is the Fourier transform of this autocorrelation.

Physically, beads do scatter light, though a full optical model is far more complicated than this point-weight abstraction.
Mathematically, the abstraction is already useful.
It asks what long-range order is visible when the beadwork is observed through weights.

A periodic bead pattern has sharp repeating frequencies.
A random pattern has diffuse behavior.
A substitutional aperiodic pattern may have sharp Bragg peaks, singular-continuous components, or mixed spectrum depending on the system.
Two different bead colorings may be homometric: they have the same autocorrelation and diffraction even though their local arrangements differ.
In such a case, the spectral observable cannot distinguish them.

This is a powerful warning.
A viewer may see a repeating visual rhythm and assume it captures the whole structure.
Diffraction formalizes one kind of rhythm, but it too can forget phase information.
Conversely, a pattern that looks irregular at a glance may have strong spectral order.

For beadwork, color-weighted diffraction suggests several research questions:

- Which bead color weights reveal the substitution hierarchy?
- Which weights cancel visible periodic components?
- Can two different bead charts have the same autocorrelation?
- How do seams or defects appear in the spectrum?
- Do metallic or transparent bead choices act like different scattering weights on the same underlying stitch graph?

These questions connect bead design to the modern aperiodic-order literature, including studies of Hat and Spectre diffraction.
The point is not that a cuff must be analyzed like a quasicrystal.
The point is that both are weighted local systems whose long-range order can be observed spectrally.

# 15. A beadwork InfoTile

We can now define a beadwork analogue of an InfoTile.
Given a beadwork dataset \(\mathcal B\), consisting of a stitch graph, bead positions, color/material assignments, construction events, and optional design constraints, its beadwork InfoTile is the tuple: \[ \mathsf{BIT}(\mathcal B) = (G,\kappa,\lambda,\eta,\delta,h). \]

Here:

- \(G\) is the stitch graph: bead positions and operative adjacencies.
- \(\kappa\) is the coloring or charge assignment.
  It may be ordinary bead color, a hidden stitch state, or a FOUR-valued information charge.
- \(\lambda\) is the layout: the embedding or generated word/surface, such as a band, tube, disk, net, or substitution patch.
- \(\eta\) is the coordination obstruction: a cycle/seam/gluing invariant, modeled by first cohomology of the relevant cover or adjacency structure.
- \(\delta\) is the spectral observable: autocorrelation or diffraction of the weighted bead set.
- \(h\) is an information invariant: the entropy or count of legal colorings, continuations, or chart completions.

This tuple does not replace the beadwork object.
It organizes questions about it.
For a simple two-color bracelet, \(G\) may be a cycle graph, \(\kappa\) a black-white coloring, \(\lambda\) the circular embedding, \(\eta\) the parity obstruction, \(\delta\) the periodic spectrum, and \(h\) the number of legal phase choices.
For an aperiodic peyote band, \(G\) is staggered, \(\kappa\) may come from a substitution word, \(\lambda\) is the bead surface, \(\eta\) records seam or panel gluing, \(\delta\) probes long-range order, and \(h\) distinguishes deterministic substitution from improvisational freedom.

The InfoTile perspective is valuable because it prevents one invariant from posing as the whole truth.
A bead pattern's chromatic number, entropy, diffraction, and seam obstruction measure different things.
They can agree or disagree.
A robust account of the object keeps them together.

# 16. Worked examples

## 16.1 The odd bracelet obstruction

Take a bracelet with \(n\) bead sites in a cycle and require adjacent beads to alternate black and white.
If \(n\) is even, there are two legal colorings: choose black at one site, and the rest follows, or choose white and invert.
The entropy is one bit.
If \(n\) is odd, there are no legal colorings.
Every local path can alternate, but the final seam fails.

This example teaches graph coloring, entropy, and cohomological obstruction at once.
The graph is \(C_n\).
Its two-colorability depends on whether the cycle is even.
The seam is not a minor detail; it is the global invariant.

## 16.2 A Fibonacci bead band

Let gold = \(A\) and blue = \(B\).
Use the substitution \(A\mapsto AB\), \(B\mapsto A\).
Bead the resulting word as a band.
The band is nonperiodic but not random.
Every finite patch recurs.
The ratio of \(A\) to \(B\) approaches the golden ratio.
The entropy rate of the deterministic substitution is zero once the substitution and phase are fixed, yet the diffraction can show long-range order.

This example teaches aperiodicity without chaos.
The design is finite-rule, predictable, and nonperiodic.

## 16.3 A hidden-state stitch chart

Suppose a visible bead chart uses three colors, but the maker also tracks hidden states: straight, turn, increase, and join.
The hidden state determines thread path.
If the hidden states are forgotten, the visible chart may still look legal, but it may no longer determine how to make the object.

This is a sofic factor situation.
The hidden decorated system has finite local rules.
Forgetting hidden states produces the visible color system.
The visible system may be easier to inspect but less informative.

## 16.4 A repaired contradiction

A design rule says a bead at a location should be white.
A structural repair requires replacing it with a stronger dark bead.
Classical validation says the site is wrong.
A bilattice validation says more: relative to the motif rule it is negative; relative to the repair rule it is positive; as a design record it is \(\top\), a held conflict with provenance.
That is not failure.
It is a more honest record.

This example teaches paraconsistency.
The object can contain a contradiction without becoming meaningless.

# 17. What this buys for mathematics education

Beadwork is an unusually good educational medium for advanced mathematics because it joins several abstractions in one hand-scale practice.

Graph theory appears as adjacency.
A beadworker can feel why the graph matters: diagonal contact, shared thread, and visual neighborhood are different edge relations.

Topology appears as seam and surface.
A strip, cylinder, disk, and net are not the same global object.
Closing a loop changes the problem.

Formal language theory appears as bead words.
A stringing sequence is literally a word over an alphabet.
Forbidden subwords are easy to demonstrate.

Symbolic dynamics appears as the space of all legal bead sequences.
A local rule defines a global shift.

Substitution appears as motif inflation.
Small bead units become larger units recursively.

Cohomology appears as gluing obstruction.
Local agreement around a cycle can fail globally.

Information theory appears as choice count and entropy.
Some charts leave many legal continuations; others force the next bead.

Paraconsistent logic appears as repair and design conflict.
A bead can be wrong for one rule and right for another.

Diffraction appears as long-range recurrence of weighted colors.
What repeats at a distance can be measured.

The educational strength is that none of these ideas is merely verbal.
The learner can make the object, change a local rule, close a seam, introduce a defect, swap colors, and see which invariants change.
Beadwork turns abstract mathematics into manipulable finite observables.

# 18. Limits, ethics, and non-reduction

This paper does not claim that mathematical analysis captures the meaning of beadwork.
It does not.
Beadwork may carry kinship, place, ceremony, identity, trade, fashion, grief, humor, pedagogy, obligation, memory, and style.
Those meanings are not reducible to graphs or tilings.

The mathematical model also abstracts away material realities.
Bead size variation, thread tension, hand fatigue, bead finish, needle path, humidity, breakage, and embodied skill matter.
A graph model can include some of these as weights or constraints, but it will always be partial.

There is also a danger in treating "beadwork" as one thing.
Loom work, peyote, brick stitch, lazy stitch, applique, netting, bead crochet, embroidery, and sculptural work have different local laws.
Cultural traditions differ even more deeply.
A respectful mathematical paper must avoid implying that one formalism explains all of them.

The correct posture is therefore modest: beadwork offers a family of material systems where finite local constraints, color observables, hierarchy, and long-range order are visible.
Mathematics can learn from that family.
It can also build tools for charting, analysis, repair, and education.
But the craft is not exhausted by the tools.

# 19. Open problems

The synthesis above suggests a concrete research program.

**Problem 1.
Stitch graph taxonomy.** Define canonical graph models for common bead stitches, distinguishing physical contact, thread adjacency, visual adjacency, and chart adjacency.
Determine which graph invariants matter for coloring and closure.

**Problem 2.
Local colorability of bead stitches.** For each stitch graph family, classify when proper colorings are locally derivable from position, parity, or bounded neighborhoods.
Separate infinite strips, finite patches, and closed surfaces.

**Problem 3.
Seam obstruction calculator.** Given a bead chart and intended closure, compute the phase/gluing obstruction.
Return not only pass/fail but the cycle responsible for the mismatch.

**Problem 4.
Minimal matching decorations.** Given a hierarchical bead motif, find the smallest visible or hidden bead-state alphabet that forces the motif by local rules.

**Problem 5.
Beadwork substitution library.** Build a library of substitutional bead patterns, including Fibonacci, chair-like, Ammann-Beenker-like, and Hat/Spectre-inspired systems, with clear distinctions between periodic, substitutional, and aperiodic local-rule behavior.

**Problem 6.
Entropy of improvisational constraints.** For common bead design rules, compute the number of legal completions and entropy rate.
Use this to compare strict charting, guided improvisation, and random selection.

**Problem 7.
Hidden-state chart formats.** Extend bead chart formats so that visible color, stitch state, thread path, and information charge are separate layers.
Study which layers are locally recoverable from which others.

**Problem 8.
Bilattice repair records.** Model repairs and design conflicts with FOUR-valued charges so that a bead can carry both the original design intention and the later structural intervention.

**Problem 9.
Color-weighted autocorrelation.** Compute autocorrelation and diffraction-like spectra for bead patterns under different material weights.
Study which weights reveal hidden order and which create homometric ambiguity.

**Problem 10.
Cultural protocol for mathematical modeling.** Develop an ethical protocol for working with bead traditions mathematically: attribution, consent, scope, non-extraction, and separation between public formal structure and community-held meaning.

# 20. Conclusion

Beadwork is a finite, material, colored, stitched practice in which local moves generate global form.
That makes it an unusually clear setting for the mathematics of finite observables.
A bead color can be a graph coloring, a symbolic state, a matching-rule decoration, a hidden stitch marker, a spectral weight, or a paraconsistent information charge.
A bead pattern can be periodic, substitutional, random, or aperiodically ordered.
A seam can be a cohomological obstruction.
A repair can be a held contradiction.
A chart can be a factor of a hidden construction system.
A finished object can be read as a record of local moves.

The paper's thesis is therefore simple but deep:

> Beadwork is not merely pattern on a grid.
> It is finite visible evidence of a local rule system acting through color, thread, surface, and time.

This thesis connects ordinary bead practice to a broad mathematical spine: graph coloring, symbolic dynamics, substitution tilings, sofic factors, local derivability, cohomology, entropy, diffraction, and bilattice-valued information.
It also connects beadwork to the InfoTiles idea that information can be represented as a bilattice-colored sofic tiling with intrinsic chromatic, cohomological, and spectral invariants.

The claim is not that beadwork needs this mathematics to be valid.
It does not.
The claim is that beadwork already contains lessons that mathematics, computer science, and information display are still learning how to say cleanly: finite local acts can hold long-range order; color can observe more than it decorates; and a visible surface can be a record of a deeper coherence.

# References

Anderson, Jared E., and Ian F.
Putnam.
"Topological Invariants for Substitution Tilings and Their Associated C*-Algebras." *Ergodic Theory and Dynamical Systems* 18, no. 3 (1998): 509--537.

Baake, Michael, and Uwe Grimm. *Aperiodic Order, Volume 1: A Mathematical Invitation*.
Cambridge University Press, 2013.

Baake, Michael, Franz Gaehler, Jan Mazac, and Andrew Mitchell.
"Diffraction of the Hat and Spectre tilings and some of their relatives." arXiv:2502.03268, 2025.

Belnap, Nuel D.
"How a Computer Should Think."
In *Contemporary Aspects of Philosophy*, edited by Gilbert Ryle, 30--55.
Oriel Press, 1977.

Belnap, Nuel D.
"A Useful Four-Valued Logic."
In *Modern Uses of Multiple-Valued Logic*, edited by J.
Michael Dunn and George Epstein, 5--37.
Springer, 1977.

Evans, Molly, Dylan Gawlak, Christopher Ramsey, Nicolae Strungaru, and Ryan Trang.
"Colourings of aperiodic tilings." *Contributions to Discrete Mathematics* 20, no. 2 (2025): 396--421.

Goodman-Strauss, Chaim.
"Matching rules and substitution tilings." *Annals of Mathematics* 147, no. 1 (1998): 181--223.

Hedlund, Gustav A.
"Endomorphisms and Automorphisms of the Shift Dynamical System." *Mathematical Systems Theory* 3, no. 4 (1969): 320--375.

Jeandel, Emmanuel, and Michael Rao.
"An aperiodic set of 11 Wang tiles." *Advances in Combinatorics*, 2021.

Lind, Douglas, and Brian Marcus. *An Introduction to Symbolic Dynamics and Coding*.
Cambridge University Press, 1995.

Sadun, Lorenzo. *Topology of Tiling Spaces*.
American Mathematical Society, 2008.

Smith, David, Joseph Samuel Myers, Craig S.
Kaplan, and Chaim Goodman-Strauss.
"An aperiodic monotile." arXiv:2303.10798, 2023.

Vereshchagin, Nikolay.
"Matching Rules for Substitution and Hierarchical Tilings for any Substitution with Finite Local Complexity." arXiv:2606.25005, 2026.

The 561 Group.
"Color as a finite observable of aperiodic order."
`dev/content/researching/notes/2026-06-26-public-paper-seed-color-as-finite-observable-of-aperiodic-order.md`, 2026.

The 561 Group.
"InfoTiles: Bilattice-Coloured Sofic Tilings as a Universal Representation of Poly-Informational Data."
`dev/content/researching/papers/2026-06-26-infotiles-bilattice-sofic-tilings.md`, 2026.
