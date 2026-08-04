---
title: "Rank Density as a Diagnostic: Which Matroid Is Your Instrument Counting?"
description: "Introduces rank density as a one-parameter unification of matroid rank across graphic, planar-rigidity, and central-force matroids, and corrects two units errors in prior atom-level constraint counting."
date-created: 2026-07-25
kind: research-note
in-service-of: lib/emsenn/services/561-group/services/science-services-section
tags:
  - matroids
  - rank-density
  - constraint-counting
  - rigidity-percolation
status: design
declared-by: claude-interactive-session-supplying-lenticule-science
---
# Rank Density as a Diagnostic: Which Matroid Is Your Instrument Counting?

## Abstract

Constraint-counting theories of network rigidity and combinatorial theories of graph
connectivity are usually developed apart, the first in mean coordination $\langle r\rangle$
and the second in cycle rank. Both are statements about a matroid on a network's edges, and
if a matroid's rank saturates at $kN$ for large $N$, then redundancy appears when
$\bar z > 2k$. This is Maxwell counting restated in one parameter, not a new derivation, and
we are explicit that it locates redundancy *given* saturation rather than deriving a
percolation threshold. Its value is diagnostic rather than predictive: it makes "which
matroid is this instrument counting?" a question with a one-parameter answer, which we then
carry into the vocabulary as a subscript, and it thereby indicts any formalization that
computes $b_1 = |E| - |V| + c$ — graphic-matroid nullity, $k = 1$ — while its rigidity
vocabulary goes unsubscripted. We apply the diagnostic to siloxane networks,
correcting a units error that inverts the naive design conclusion: computed atom-level in the
convention whose threshold is being used, amorphous silica is $\langle r\rangle = 2.67$ and
the isostatic siloxane composition is *pure T* (silsesquioxane), not a D/T blend. Finally we
give an experiment on blockchain and ActivityPub graph data that tests the diagnostic
directly, by measuring where the graphic and rigidity oracles disagree.

---

## 1. Rank density, and what it is not

**Definition.** For a matroid $M$ on the edges of a graph with $N$ vertices, write its
**rank density** as $k = \lim_{N\to\infty} r(E)/N$, where the limit is taken along a family
in which the rank saturates.

**Observation 1.1.** If a matroid's rank saturates at $kN + O(1)$, then its nullity is
positive — some element is redundant — exactly when $|E| > kN$. With $\bar z = 2|E|/N$ this
is

$$\bar z > 2k .$$

**What this is.** Maxwell counting, restated so that connectivity and rigidity sit in one
expression. Graphic: $r(E) = N - c$, $k = 1$, redundancy at $\bar z > 2$. Two-dimensional
generic rigidity: $r(E) = 2N - 3$ for a graph containing a spanning Laman subgraph, $k = 2$,
$\bar z > 4$. Central-force rigidity in $d$ dimensions: $r(E) = dN - d(d+1)/2$, $k = d$.

**What this is not, stated plainly because the temptation is strong.** It is not a derivation
of a percolation threshold, and the saturation hypothesis is doing all the work.
$r(E)/N = 1 - c/N$ for the graphic matroid is a *function of edge density*, tending to 1 only
when the graph is essentially connected, which in $G(N,p)$ needs mean degree exceeding
$\ln N$. In the sparse regime, $c/N$ is $\Theta(1)$ and $k \ne 1$. Worse for rigidity:
$r(E) = 2N-3$ holds only if the graph is *already rigid₍₂₎*, so $k = 2$ presupposes the
conclusion. Observation 1.1 locates redundancy onset given rank saturation; it cannot locate
rigidity onset.

**Two specific numbers it does not give.** For $k = 1$, $\bar z = 2$ is where $|E| = N$ —
where the graph is on average unicyclic. It is *not* the first-cycle threshold, since in
$G(N, c/N)$ with $c < 1$ the expected number of cycles is $\Theta(1)$ and a triangle appears
at $\bar z = 6/N$; and it is not the percolation threshold, which is mean degree 1 (Erdős–
Rényi, equivalently Molloy–Reed $\langle k^2\rangle - 2\langle k\rangle > 0$, giving
$\langle k\rangle = 1$ for Poisson). For $k = 2$, $\bar z_c = 4$ is a mean-field estimate;
the measured 2D generic rigidity percolation threshold on the triangular lattice is
$p_c = 0.6602$, i.e. $\bar z \approx 3.96$ [Jacobs & Thorpe 1995].

**Bond-bending does not join this family.** It is tempting to read the Phillips–Thorpe
threshold $\langle r\rangle_c = 2.4$ as $k = 1.2$. It is not a rank density. In bond-bending
counting the constraints are stretching *and* bending: at the isostatic point, per atom,
$r/2 = 1.2$ stretching and $2r - 3 = 1.8$ bending constraints, totalling $3$ — the rank
density of the underlying matroid is $3$, as in the $k = d$ row. The figure $1.2$ is obtained
by dividing full rank by $N$ and then silently restricting $|E|$ to bonds only, evaluated at
the very point being derived. It violates the definition of $k$, which requires $E$ to be the
matroid's whole ground set. The family has two honest members — graphic and central-force —
where one edge is one ground-set element.

**A correction on dimension three.** The generic rigidity matroid exists in every dimension:
it is the matroid of the rigidity matrix at a generic configuration, well-defined by
genericity. What is open in 3D is only a *combinatorial characterization* — Laman's condition
fails there, the double-banana being the standard counterexample. The $k = d$ row denotes a
real matroid for every $d$.

## 2. The diagnostic, which is the point

**Observation 2.1.** The set of $k$ for which a fixed network is super-critical is the
interval $k < |E|/N$. So one network is simultaneously sub- and super-critical for different
matroids, and this is the ordinary case rather than a pathology. A graph at $\bar z = 3$ is
richly cyclic — load-bearing₍₁₎ — and floppy₍₃₎ under 3D central-force rigidity at once.

Carry that parameter in the word. Write **floppy₍ₖ₎** for nullity zero at rank density $k$
and **load-bearing₍ₖ₎** for nullity positive there. Then load-bearing₍₁₎ is a redundant
*connection* — graphic nullity, tested by union–find — and load-bearing₍₂₎ is a redundant
*constraint* — nullity in the 2D generic rigidity matroid, tested by the pebble game, and
nonlocal for the reason given at the end of this section. One character of notation replaces
a distinction the reader would otherwise have to reconstruct from context, and it forces the
distinction to be made at every use site rather than once in a frontier paragraph. The
general rule, of which this is the instance at hand: when a term is matroid-relative, carry
the matroid.

Observation 2.1 is monotonicity of a linear inequality; no matroid theory does any work in
it, and it should be read as bookkeeping discipline rather than as a structural finding. Its
use is nonetheless real, and it is the reason this note exists:

> **A formalization that computes $b_1 = |E| - |V| + c$ is running at $k = 1$: what it
> certifies is load-bearing₍₁₎, a redundant connection. If its surrounding rigidity
> vocabulary — floppy, jammed, load-bearing — goes unsubscripted, the claim it will be read
> as making is load-bearing₍₂₎ or higher, a redundant constraint, and the mismatch is
> exactly one parameter wide.**

**Why no local count can substitute.** Laman's condition is *hereditary*: every subgraph on
$n'$ vertices carries at most $2n' - 3$ edges. The pebble game is correspondingly nonlocal,
searching the graph to gather free pebbles, and an edge can be redundant while both its
endpoints have low degree, because the dependence lives in a subgraph. No per-site or
per-vertex occupation count can detect rigidity redundancy, in principle. Any construction
that assigns a rigidity state to a vertex by counting what lands on it is measuring something
else.

## 3. Applying the diagnostic to siloxane networks

For a network of units with functionality $f_i$ at mole fractions $x_i$, mean coordination is
$\langle r\rangle = \sum_i x_i f_i$ — the number-average functionality. (This is not
Flory–Stockmayer, which locates the gel point at $\alpha_c = 1/(f_w - 1)$ using the
*weight*-average functionality. Isostaticity and gelation are different criteria.)

**The units must match the threshold's convention, and this is where the naive reading
fails.** The Phillips–Thorpe threshold $\langle r\rangle_c = 2.4$ is derived from
$r/2 + (2r-3) = 3$ on the **atom-level** network: every vertex is an atom with three
translational freedoms. Applying it to a silicon-sublattice coarse-graining — in which a
Si–O–Si bridge is one edge and the bridging oxygen is not a vertex — absorbs the oxygens'
freedoms into edges. At $\langle r\rangle = 2.4$ there are $1.2$ oxygens per silicon, so the
coarse-graining discards more degrees of freedom than it retains.

Counting atom-level, with silicon at $r$ = its bridging count and each bridging oxygen at
$r = 2$:

| unit | Si (r) | bridging O per unit | $\Sigma r$ | atoms | $\langle r\rangle$ |
|---|---|---|---|---|---|
| M, $R_3\mathrm{SiO}_{1/2}$ | 1 | 0.5 | 2.0 | 1.5 | **1.33** |
| D, $R_2\mathrm{SiO}_{2/2}$ | 2 | 1.0 | 4.0 | 2.0 | **2.00** |
| T, $R\mathrm{SiO}_{3/2}$ | 3 | 1.5 | 6.0 | 2.5 | **2.40** |
| Q, $\mathrm{SiO}_{4/2}$ | 4 | 2.0 | 8.0 | 3.0 | **2.67** |

The Q row is an independent check: $8/3 = 2.67$ is the textbook Phillips–Thorpe mean
coordination of amorphous silica. A table giving silica as $4.00$ is not reporting a
coordination number in the convention whose threshold it is being compared against.

Three consequences, two of which invert the naive conclusion.

**The isostatic siloxane is pure T — a silsesquioxane — not a D/T blend.** $x_T = 1$ gives
$\langle r\rangle = 2.40$ exactly. A $0.6\,\mathrm{D}/0.4\,\mathrm{T}$ formulation computes
to $\langle r\rangle = 2.18$ and is *floppy₍₃₎*, below threshold. This is chemically
meaningful rather than a curiosity: silsesquioxanes are precisely the marginally-rigid₍₃₎
siloxane class.

**The accessible axis is narrower than it appears.** Composition spans $1.33$ to $2.67$, not
$1$ to $4$, and the isostatic point sits near the top of that range rather than in its middle.
Reaching well past threshold requires leaving siloxane chemistry.

**M remains the only de-constraining rung** ($1.33 < 2.00$), so monofunctional terminator
concentration is still a fine-tuning knob that moves a formulation *down* toward the
threshold from above, independent of the D/T/Q backbone choice.

**A degeneracy worth testing, which survives the correction.** Two compositions with equal
$\langle r\rangle$ need not have equal topology: Q units concentrate four constraints on one
atom while T units spread them over two. The number-average and atom-level counts agree
whenever $\sum_i x_i f_i$ agrees, so the degeneracy is preserved under the units correction
and remains well posed. Whether such pairs behave identically is an experimental question,
and a difference would be direct evidence that mean-field rank density is insufficient and
the finer matroid structure is doing work.

**Not settled.** The Si–O–Si bending constraint is anomalously soft in silicates, and
broken-constraint corrections are the standard reason amorphous silica at nominal $2.67$
behaves close to isostatic. Naive $2r-3$ counting on two-coordinate oxygen overstates rigidity
for all four rungs. This moves every entry the same direction and so does not rescue the
sublattice reading, but it means the table above is a first-order count, not a settled
prediction.

## 4. Testing the diagnostic on graph data

Sections 1 and 2 concern matroids on graphs, and nothing in them requires a physical network.
Laman's condition is purely combinatorial, and the pebble game [Jacobs & Hendrickson 1997]
computes the generic 2D rigidity matroid of *any* graph, whether or not it is a bar-joint
framework. So the diagnostic can be tested wherever real graphs can be had, and blockchain
transaction graphs and ActivityPub interaction graphs are unusually good subjects: they are
heavy-tailed, reciprocal, community-structured, and temporally bursty, which is to say they
violate every convenience the mean-field reading assumes.

**The measurements.** Over a sweep of observation windows — the window *is* the density knob,
at no cost beyond re-querying — compute $N$, $|E|$, $\bar z$; the graphic nullity
$b_1 = |E| - N + c$ by union–find; and the generic 2D rigidity matroid's rank, nullity, and
rigid components by the pebble game.

**Test 1 — oracle divergence.** For each edge, ask both oracles: does it close a cycle
(graphic-dependent), and is it rigidity-redundant? Count the edges the two classify
differently, as a fraction of $|E|$, across the window sweep. This is the diagnostic measured
directly rather than inferred from thresholds, it needs no calibration and no assumption
about occupation, and it answers the question the note is actually about: *how much does the
choice of matroid change the answer on this data?* If the divergence is negligible, a
$b_1$-counting instrument is adequate for these graphs and the whole distinction is
bookkeeping; if it is large, it is not.

**Test 2 — matched onsets.** Compare the onset of *extensive* graphic nullity against the
onset of an extensive rigid₍₂₎ cluster. Both must be extensive-quantity onsets or the
comparison is meaningless; note that $b_1 > 0$ holds at essentially every window on real
social graphs, since reciprocity and triangles guarantee cycles immediately, so raw cycle
existence is not a threshold and cannot form a ratio with anything.

**Test 3 — degree-distribution degeneracy.** Sample subgraphs matched on $\bar z$ but
differing sharply in degree distribution — a hub-heavy transaction neighbourhood against a
flat small-instance follow graph. The mechanism is *not* that high-degree vertices contribute
less rigidity per edge: a star $K_{1,n}$ is a tree, all of whose edges are independent in the
rigidity matroid, and which simply fails to be rigid₍₂₎. The operative point is that Laman's
bound is hereditary, so heavy-tailed degree shifts *where* the sparsity constraint binds. The
prediction that hub-heavy graphs reach rigidity₍₂₎ at higher $\bar z$ is plausible and worth
running.

**What is not a valid test.** Measuring the *order* of the transition does not discriminate
between the matroids. Generic rigidity percolation on the 2D triangular lattice is measured
as a continuous, second-order transition with its own universality class [Jacobs & Thorpe
1995, 1996], overturning the earlier mean-field expectation; first-order behaviour is a
Bethe-lattice/mean-field result. A test that reads continuity as evidence of graphic
behaviour would report failure on a correct result.

**What is not claimed.** These graphs are not physical frameworks and no assertion is made
that they are. The rigidity matroid of a graph is a combinatorial invariant that exists
independent of any embedding; confirming anything here tests the mathematics of §1–2, and
licenses no mechanical reading of a social network.

## 5. This note's contribution, a correction elsewhere, and open questions

This note's own contribution is the framing of Observation 1.1 as one parameter across
matroids, the diagnostic use in §2, and the subscript notation that carries that parameter
into the vocabulary — expository repackagings of known facts and a piece of notation, whose
value is that together they make a mislabelled instrument visible in one step. The subscript
is a convention, not a result: it asserts nothing that $k$ did not already assert, and it
earns its place only by being unskippable at each use site. The units correction of §3, and
its consequence that the isostatic siloxane is pure T, is likewise this note's own.

A related claim elsewhere in the corpus — that a gauge group's order fixes a critical
coordination — is wrong about which quantity is doing the work: it is the orbit size of the
occupied class, $p = 1/|\text{orbit}|$ for a transitive action, and the group order entered
only through an orbit–stabilizer accident. The invariant form is $\bar z_{\text{pot}} =
2k\,|\text{orbit}|$, in which $|G|$ does not appear.

Not settled: whether the degeneracy of §3 is real; whether broken Si–O–Si bending constraints
move the corrected siloxane figures; and whether any occupation model on real graphs can be
given a joint law rather than an unjustified independence assumption — $G$-invariance of a
single-site law is compatible with any exchangeable joint law, and a mixture crosses a
threshold at a different density than any of its components.

---

## References

Calladine, C. R. (1978). Buckminster Fuller's "tensegrity" structures and Clerk Maxwell's
rules for the construction of stiff frames. *International Journal of Solids and Structures*
14, 161.

Jacobs, D. J. & Hendrickson, B. (1997). An algorithm for two-dimensional rigidity
percolation: the pebble game. *Journal of Computational Physics* 137, 346.

Jacobs, D. J. & Thorpe, M. F. (1995). Generic rigidity percolation: the pebble game.
*Physical Review Letters* 75, 4051.

Jacobs, D. J. & Thorpe, M. F. (1996). Generic rigidity percolation in two dimensions.
*Physical Review E* 53, 3682.

Laman, G. (1970). On graphs and rigidity of plane skeletal structures. *Journal of
Engineering Mathematics* 4, 331.

Maxwell, J. C. (1864). On the calculation of the equilibrium and stiffness of frames.
*Philosophical Magazine* 27, 294.

Molloy, M. & Reed, B. (1995). A critical point for random graphs with a given degree
sequence. *Random Structures & Algorithms* 6, 161.

Oxley, J. (2011). *Matroid Theory*, 2nd ed. Oxford University Press.

Phillips, J. C. (1979). Topology of covalent non-crystalline solids I: short-range order in
chalcogenide alloys. *Journal of Non-Crystalline Solids* 34, 153.

Phillips, J. C. & Thorpe, M. F. (1985). Constraint theory, vector percolation and glass
formation. *Solid State Communications* 53, 699.

Thorpe, M. F. (1983). Continuous deformations in random networks. *Journal of Non-Crystalline
Solids* 57, 355.
