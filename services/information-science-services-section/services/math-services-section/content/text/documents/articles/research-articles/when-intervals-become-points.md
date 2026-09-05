---
title: "When an Interval Becomes a Point"
subtitle: "Collapse, Degeneracy, Derived Eventhood, and the Mathematics of Trivialized Extension"
author:
  - "emsenn"
date: 2026-07-02
lang: en-US
abstract: |
  This paper studies the mathematical moment named by the phrase “when an interval becomes a point.” The phrase is not a single construction. It names a family of exact transitions: a real interval degenerates to a singleton; a subspace is collapsed by a quotient map; a contractible interval has the homotopy type of a point; a metric interval converges to a point in Gromov--Hausdorff distance; an interval of uncertainty is refined to exact information; a persistence bar is annihilated on the diagonal; a causal interval is promoted to an event of a derived kinematic space; and, in an order-theoretic settling system, a saturation interval becomes trivial exactly at a fixed point. The unifying discipline is not “an interval is secretly a point.” It is that every promotion of extension to pointhood must say which structure is forgotten, which structure factors through the collapse, and which residual data is retained as obstruction, curvature, memory, boundary, or cohomology. The paper gives a genealogy from quotient topology, interval analysis, domain theory, metric collapse, Reeb graphs, persistent homology, causal set theory, and sheaf/order Laplacians, then proposes a precise interval-point promotion principle suitable for current infomaterial and relational mathematics.
references:
  - id: hatcher2002
    type: book
    title: "Algebraic Topology"
    author:
      - family: Hatcher
        given: Allen
    issued:
      date-parts: [[2002]]
    publisher: "Cambridge University Press"
    URL: "https://pi.math.cornell.edu/~hatcher/AT/ATpage.html"
  - id: munkres2000
    type: book
    title: "Topology"
    author:
      - family: Munkres
        given: James R.
    issued:
      date-parts: [[2000]]
    edition: "2"
    publisher: "Prentice Hall"
  - id: maclane1998
    type: book
    title: "Categories for the Working Mathematician"
    author:
      - family: Mac Lane
        given: Saunders
    issued:
      date-parts: [[1998]]
    edition: "2"
    publisher: "Springer"
  - id: moore1966
    type: book
    title: "Interval Analysis"
    author:
      - family: Moore
        given: Ramon E.
    issued:
      date-parts: [[1966]]
    publisher: "Prentice-Hall"
  - id: mooreKearfottCloud2009
    type: book
    title: "Introduction to Interval Analysis"
    author:
      - family: Moore
        given: Ramon E.
      - family: Kearfott
        given: R. Baker
      - family: Cloud
        given: Michael J.
    issued:
      date-parts: [[2009]]
    publisher: "Society for Industrial and Applied Mathematics"
    DOI: "10.1137/1.9780898717716"
  - id: daumasLesterMunoz2007
    type: article
    title: "Verified Real Number Calculations: A Library for Interval Arithmetic"
    author:
      - family: Daumas
        given: Marc
      - family: Lester
        given: David
      - family: Muñoz
        given: César
    issued:
      date-parts: [[2007]]
    URL: "https://arxiv.org/abs/0708.3721"
  - id: scott1976
    type: article-journal
    title: "Data Types as Lattices"
    author:
      - family: Scott
        given: Dana S.
    container-title: "SIAM Journal on Computing"
    volume: 5
    issue: 3
    page: "522-587"
    issued:
      date-parts: [[1976]]
    DOI: "10.1137/0205037"
  - id: abramskyJung1994
    type: chapter
    title: "Domain Theory"
    author:
      - family: Abramsky
        given: Samson
      - family: Jung
        given: Achim
    container-title: "Handbook of Logic in Computer Science, Volume 3"
    editor:
      - family: Abramsky
        given: Samson
      - family: Gabbay
        given: Dov M.
      - family: Maibaum
        given: T. S. E.
    issued:
      date-parts: [[1994]]
    publisher: "Oxford University Press"
    page: "1-168"
  - id: gromov1999
    type: book
    title: "Metric Structures for Riemannian and Non-Riemannian Spaces"
    author:
      - family: Gromov
        given: Mikhail
    translator:
      - family: Lafontaine
        given: Jacques
      - family: Pansu
        given: Pierre
    issued:
      date-parts: [[1999]]
    publisher: "Birkhäuser"
  - id: buragoBuragoIvanov2001
    type: book
    title: "A Course in Metric Geometry"
    author:
      - family: Burago
        given: Dmitri
      - family: Burago
        given: Yuri
      - family: Ivanov
        given: Sergei
    issued:
      date-parts: [[2001]]
    publisher: "American Mathematical Society"
  - id: cheegerFukayaGromov1992
    type: article-journal
    title: "Nilpotent Structures and Invariant Metrics on Collapsed Manifolds"
    author:
      - family: Cheeger
        given: Jeff
      - family: Fukaya
        given: Kenji
      - family: Gromov
        given: Mikhail
    container-title: "Journal of the American Mathematical Society"
    volume: 5
    issue: 2
    page: "327-372"
    issued:
      date-parts: [[1992]]
    DOI: "10.1090/S0894-0347-1992-1126118-3"
  - id: cheegerColding1997
    type: article-journal
    title: "On the Structure of Spaces with Ricci Curvature Bounded Below. I"
    author:
      - family: Cheeger
        given: Jeff
      - family: Colding
        given: Tobias H.
    container-title: "Journal of Differential Geometry"
    volume: 46
    issue: 3
    page: "406-480"
    issued:
      date-parts: [[1997]]
  - id: lott2014
    type: article-journal
    title: "Collapsing with a Lower Bound on the Curvature Operator"
    author:
      - family: Lott
        given: John
    container-title: "Advances in Mathematics"
    volume: 256
    page: "291-327"
    issued:
      date-parts: [[2014]]
    DOI: "10.1016/j.aim.2014.02.012"
  - id: dePhilippisGigli2018
    type: article-journal
    title: "Non-collapsed Spaces with Ricci Curvature Bounded from Below"
    author:
      - family: De Philippis
        given: Guido
      - family: Gigli
        given: Nicola
    container-title: "Journal de l'École polytechnique — Mathématiques"
    volume: 5
    page: "613-650"
    issued:
      date-parts: [[2018]]
    DOI: "10.5802/jep.80"
  - id: honda2020
    type: article-journal
    title: "Collapsed Ricci Limit Spaces as Non-Collapsed RCD Spaces"
    author:
      - family: Honda
        given: Shouhei
    container-title: "SIGMA. Symmetry, Integrability and Geometry: Methods and Applications"
    volume: 16
    page: "021"
    issued:
      date-parts: [[2020]]
    URL: "https://www.emis.de/journals/SIGMA/2020/021/"
  - id: mondinoPerales2026
    type: article
    title: "Gromov-Hausdorff and Intrinsic Flat Convergence of RCD(K,N) and Kato Spaces"
    author:
      - family: Mondino
        given: Andrea
      - family: Perales
        given: Raquel
    issued:
      date-parts: [[2026]]
    URL: "https://arxiv.org/abs/2602.03280"
  - id: reeb1946
    type: article-journal
    title: "Sur les points singuliers d'une forme de Pfaff complètement intégrable ou d'une fonction numérique"
    author:
      - family: Reeb
        given: Georges
    container-title: "Comptes Rendus de l'Académie des Sciences"
    volume: 222
    page: "847-849"
    issued:
      date-parts: [[1946]]
  - id: deyFanWang2013
    type: article-journal
    title: "Computing Reeb Graphs as a Union of Contour Trees"
    author:
      - family: Dey
        given: Tamal K.
      - family: Fan
        given: Fengtao
      - family: Wang
        given: Yusu
    container-title: "Discrete & Computational Geometry"
    volume: 49
    issue: 2
    page: "249-274"
    issued:
      date-parts: [[2013]]
    DOI: "10.1007/s00454-012-9462-0"
  - id: deyShiWang2013
    type: article-journal
    title: "Reeb Graphs: Approximation and Persistence"
    author:
      - family: Dey
        given: Tamal K.
      - family: Shi
        given: Dayu
      - family: Wang
        given: Yusu
    container-title: "Discrete & Computational Geometry"
    volume: 49
    issue: 1
    page: "46-73"
    issued:
      date-parts: [[2013]]
    DOI: "10.1007/s00454-012-9463-z"
  - id: ghrist2008
    type: article-journal
    title: "Barcodes: The Persistent Topology of Data"
    author:
      - family: Ghrist
        given: Robert
    container-title: "Bulletin of the American Mathematical Society"
    volume: 45
    issue: 1
    page: "61-75"
    issued:
      date-parts: [[2008]]
    DOI: "10.1090/S0273-0979-07-01191-3"
  - id: cohenSteinerEdelsbrunnerHarer2007
    type: article-journal
    title: "Stability of Persistence Diagrams"
    author:
      - family: Cohen-Steiner
        given: David
      - family: Edelsbrunner
        given: Herbert
      - family: Harer
        given: John
    container-title: "Discrete & Computational Geometry"
    volume: 37
    issue: 1
    page: "103-120"
    issued:
      date-parts: [[2007]]
    DOI: "10.1007/s00454-006-1276-5"
  - id: chazalDeSilvaGlisseOudot2016
    type: book
    title: "The Structure and Stability of Persistence Modules"
    author:
      - family: Chazal
        given: Frédéric
      - family: de Silva
        given: Vin
      - family: Glisse
        given: Marc
      - family: Oudot
        given: Steve
    issued:
      date-parts: [[2016]]
    publisher: "Springer"
    DOI: "10.1007/978-3-319-42545-0"
  - id: bombelliLeeMeyerSorkin1987
    type: article-journal
    title: "Space-Time as a Causal Set"
    author:
      - family: Bombelli
        given: Luca
      - family: Lee
        given: Joohan
      - family: Meyer
        given: David
      - family: Sorkin
        given: Rafael D.
    container-title: "Physical Review Letters"
    volume: 59
    issue: 5
    page: "521-524"
    issued:
      date-parts: [[1987]]
    DOI: "10.1103/PhysRevLett.59.521"
  - id: myrheim1978
    type: report
    title: "Statistical Geometry"
    author:
      - family: Myrheim
        given: Jan
    issued:
      date-parts: [[1978]]
    publisher: "CERN"
    number: "CERN-TH-2538"
  - id: benincasaDowker2010
    type: article-journal
    title: "The Scalar Curvature of a Causal Set"
    author:
      - family: Benincasa
        given: Dionigi M. T.
      - family: Dowker
        given: Fay
    container-title: "Physical Review Letters"
    volume: 104
    issue: 18
    page: "181301"
    issued:
      date-parts: [[2010]]
    DOI: "10.1103/PhysRevLett.104.181301"
  - id: surya2019
    type: article-journal
    title: "The Causal Set Approach to Quantum Gravity"
    author:
      - family: Surya
        given: Sumati
    container-title: "Living Reviews in Relativity"
    volume: 22
    issue: 1
    page: "5"
    issued:
      date-parts: [[2019]]
    DOI: "10.1007/s41114-019-0023-1"
  - id: hansenGhrist2018
    type: article
    title: "Toward a Spectral Theory of Cellular Sheaves"
    author:
      - family: Hansen
        given: Jakob
      - family: Ghrist
        given: Robert
    issued:
      date-parts: [[2018]]
    URL: "https://arxiv.org/abs/1808.01513"
  - id: ghristRiess2020
    type: article
    title: "Cellular Sheaves of Lattices and the Tarski Laplacian"
    author:
      - family: Ghrist
        given: Robert
      - family: Riess
        given: Hans
    issued:
      date-parts: [[2020]]
    URL: "https://arxiv.org/abs/2007.04099"
  - id: ghristLopezNorthRiess2025
    type: article
    title: "Categorical Diffusion of Weighted Lattices"
    author:
      - family: Ghrist
        given: Robert
      - family: Lopez
        given: Miguel
      - family: North
        given: Paige Randall
      - family: Riess
        given: Hans
    issued:
      date-parts: [[2025]]
    URL: "https://arxiv.org/abs/2501.03890"
  - id: gotfredsen2021
    type: article-journal
    title: "Gromov-Hausdorff Convergence of Quantised Intervals"
    author:
      - family: Gotfredsen
        given: Toke M.
    container-title: "Journal of Mathematical Analysis and Applications"
    volume: 504
    issue: 2
    page: "125407"
    issued:
      date-parts: [[2021]]
    DOI: "10.1016/j.jmaa.2021.125407"
  - id: edalat2026
    type: article
    title: "Finite-Precision Quantum Mechanics"
    author:
      - family: Edalat
        given: Abbas
    issued:
      date-parts: [[2026]]
    URL: "https://arxiv.org/pdf/2605.19706"
  - id: emsenn2026settling
    type: manuscript
    title: "Settling Interval Geometry: A Research Note on Geometry Generated by Closure"
    author:
      - literal: "emsenn"
    issued:
      date-parts: [[2026, 6, 22]]
    URL: "https://github.com/emsenn/relational-math/blob/main/dev/content/researching/2026/06/22/2026-06-22-settling-interval-geometry-research-note.md"
  - id: emsenn2026mobius
    type: manuscript
    title: "The Benincasa--Dowker Action Is the Möbius Action, Under Layer-Constancy"
    author:
      - literal: "emsenn"
    issued:
      date-parts: [[2026]]
    URL: "https://github.com/emsenn/relational-math/blob/main/RelMath/Relational/Spacetime/Incidence/MobiusAction.lean"
  - id: emsenn2026holediamond
    type: manuscript
    title: "Hole Diamond Causal Sets"
    author:
      - literal: "emsenn"
    issued:
      date-parts: [[2026]]
    URL: "https://github.com/emsenn/infomaterial/blob/main/Infomaterial/Relational/Spacetime/Boundary/HoleDiamondCausalSet.lean"
  - id: emsenn2026diamondlift
    type: manuscript
    title: "Diamond-Lift Closure Conjecture: Post-Hole FOUR Tiles Lift to the Causal-Diamond Kinematic Space"
    author:
      - literal: "emsenn"
    issued:
      date-parts: [[2026, 7, 2]]
    URL: "https://github.com/emsenn/infomaterial/blob/main/dev/content/notes/2026/07/02/2026-07-02-conjecture-of-diamond-lift-closure.md"
type: research-article

---

# 1. The sentence as a mathematical problem

“When an interval becomes a point” sounds like a metaphor until it is forced to answer a technical question: in which category, topology, metric, order, algebra, or observational regime is the interval being read? The same underlying set can be an interval in one geometry and a point in another. Conversely, the same verbal collapse can mean mutually incompatible things.

A real interval becomes a point when its endpoints coincide. A topological interval becomes a point when a quotient map identifies every point of the interval. A homotopy theorist may call the interval point-like because it is contractible, even though its point-set topology is not a singleton. A metric geometer may say that a family of intervals converges to a point when their diameters tend to zero in Gromov--Hausdorff distance. An analyst may replace a shrinking interval by a point only after deciding how mass, oscillation, or derivative data is scaled. A domain theorist may treat nested intervals as approximations whose limit is an exact real. A topological-data analyst may encode a feature by a birth--death interval and then kill it when the interval reaches the diagonal. A causal-set theorist treats a causal interval as a finite Alexandrov neighborhood, not as a point, but a derived kinematic construction may use whole intervals or diamonds as events of a higher causal set. A sheaf theorist will ask whether the collapse respects restriction and gluing.

The slogan is therefore false in its naive form. An interval never “just” becomes a point. It becomes a point relative to an operation that declares which distinctions inside the interval no longer matter. That operation may be degeneracy, quotienting, contraction, convergence, exact refinement, annihilation, fixed-point saturation, or derived promotion. Each has a different invariant theory.

The useful question is:

> What must be true for extended local structure to be lawfully re-indexed as a point of another structure?

That question is stronger than the elementary statement that a singleton interval $[a,a]$ is a point. It asks how pointhood can be earned, not assumed. It is especially important in any mathematics of information, causality, or materialized computation, because a “point” is often not primitive. It may be the settled residue of a process, the quotient of a region, the endpoint of refinement, or the event-name for a completed interval of compatibility.

This paper develops that problem in three layers. First, it separates the main mathematical mechanisms by which intervals become points. Second, it gives a genealogy of those mechanisms through topology, metric geometry, domain theory, Reeb graphs, persistence, causal-set theory, and sheaf/order Laplacians. Third, it stabilizes the project-specific infomaterial reading: a causal interval or diamond may become a point of a derived kinematic space only when the induced sequencing relation is lawful and when the old laws reinstantiate on the promoted points.

# 2. The five basic mechanisms

There are five basic ways an interval becomes a point. They are frequently conflated, but they answer different questions.

## 2.1 Degeneracy: the endpoint equality mechanism

The elementary mechanism is degeneracy. A closed real interval

$$
[a,b] = \{x \in \mathbb{R}: a \le x \le b\}
$$

is a singleton exactly when $a=b$. In interval arithmetic this is the special case in which uncertainty width has vanished. The interval $[a,b]$ is not an approximation to a value because of psychological doubt; it is a value in an arithmetic of enclosures. The width

$$
\operatorname{wid}([a,b]) = b-a
$$

is the amount of unresolved extension. Width zero is exactness.

This is the least dramatic form of interval-to-point transition, but it is also the cleanest. No quotient has been applied. No homotopy equivalence is being invoked. No limiting space is being considered. There is simply no interior left. The interval is a point because its two boundary names name the same element.

For numerical mathematics the lesson is severe: singletonization is not the same as correctness unless the enclosing interval was known to contain the intended value. Interval arithmetic is designed precisely to preserve enclosure guarantees under computation [@moore1966; @mooreKearfottCloud2009]. In formal verification, rational interval bounds let proof assistants carry exact inequalities about real expressions without pretending that floating-point approximations are real numbers [@daumasLesterMunoz2007].

So degeneracy answers:

> When do two endpoint constraints force a unique value?

The answer is endpoint equality, together with a guarantee that the interval semantics was valid before collapse.

## 2.2 Quotient collapse: the identification mechanism

The second mechanism is quotient collapse. Let $X$ be a topological space and $A\subseteq X$ a subspace. The quotient $X/A$ is obtained by identifying all points of $A$ to one equivalence class and leaving points outside $A$ distinct. In this construction the interval becomes a point because the quotient relation says so. Internally, $A$ may have length, topology, boundary, and path structure; externally, after the quotient, all of that has been compressed into a single image point.

The important word is “externally.” The quotient point is not a point that was already inside the interval. It is a new point of a new space, the equivalence class $[A]$. The map

$$
q:X\to X/A
$$

is universal among continuous maps out of $X$ that are constant on $A$. That universal property is the mathematical discipline of the collapse. It says that the only observables that survive are those that cannot distinguish any two points of $A$ [@munkres2000; @hatcher2002].

This is the first place where “when an interval becomes a point” becomes a theory of forgetting. The collapse is not deletion. It is not erasure of the ambient space. It is an identification that forces all functions, paths, sheaves, or chains under consideration to factor through the quotient if they are to be legitimate observables of the collapsed space.

In categorical language, the quotient is a coequalizing act: distinctions are killed because a specified relation is made invisible to subsequent maps [@maclane1998]. This is why quotient collapse is a better model for many information processes than ordinary deletion. Deletion removes data from a carrier. Collapse changes the carrier so that multiple positions count as one position.

## 2.3 Homotopy contraction: the type mechanism

The third mechanism is homotopy contraction. A space is contractible if it has the homotopy type of a point. The unit interval is contractible, because it can be continuously deformed to any chosen point in it. In algebraic topology, this means that many homotopy invariants cannot distinguish the interval from a point [@hatcher2002].

But contractible does not mean identical. The interval has two endpoints and infinitely many interior points. Its topology is not the topology of a singleton. It has nontrivial subspaces, nontrivial maps into and out of it, and boundary behavior that may matter in a relative problem. Homotopy equivalence is a controlled weakening of equality. It preserves certain invariants and deliberately ignores others.

This mechanism answers:

> Which invariants see the interval as point-like?

The answer depends on the functor. Ordinary homotopy groups see a contractible interval as trivial. Relative homology may still see how the interval sits inside a pair. Sheaf data may detect local variation along it. A metric may detect length. A measure may detect positive mass. A causal order may detect temporal precedence. Homotopy pointhood is not absolute pointhood.

The disciplined statement is therefore:

> An interval becomes a point for a homotopy theory when the interval is equivalent to the terminal homotopy type in that theory.

That statement preserves the crucial distinction between equality and equivalence.

## 2.4 Metric collapse: the convergence mechanism

The fourth mechanism is metric collapse. Consider a sequence of compact metric spaces whose diameters tend to zero. In Gromov--Hausdorff distance, such a sequence converges to a point. The metric interval $[0,\varepsilon]$ with its Euclidean distance becomes indistinguishable from a singleton as $\varepsilon\to 0$ [@gromov1999; @buragoBuragoIvanov2001].

Here pointhood is neither endpoint equality nor quotient identification. It is limiting indistinguishability under a metric on spaces. The interval at each positive $\varepsilon$ is not a point. It becomes point-like only as a family and only after choosing a notion of convergence.

Metric collapse is more subtle in higher-dimensional geometry. Thin fibers can shrink while curvature remains controlled, producing a lower-dimensional limit that retains hidden algebraic structure. Cheeger, Fukaya, and Gromov’s theory of collapse with bounded curvature shows that collapsing manifolds can carry nilpotent structures encoding the geometry of the disappearing directions [@cheegerFukayaGromov1992]. Ricci-limit and synthetic-curvature theories continue this problem under weaker hypotheses: the limit may have singular strata, altered dimension, or measure-theoretic residue [@cheegerColding1997; @dePhilippisGigli2018; @honda2020; @mondinoPerales2026].

Metric collapse answers:

> When does the distance geometry of an interval or fiber become negligible relative to the scale of observation?

The answer is a convergence statement. But the hidden lesson is that collapsed directions are not always irrelevant. They may reappear as holonomy, nilpotent symmetry, spectral residue, measure concentration, or curvature terms. In collapse theory, a point may be a compressed fiber with memory.

## 2.5 Fixed-point saturation: the order mechanism

The fifth mechanism is fixed-point saturation. In an ordered setting, an interval $[a,b]$ often measures the unresolved gap between a current approximation $a$ and a closure, saturation, or projection $b$. If a monotone process sends $a$ toward $\sigma(a)$, then the interval

$$
I^\sigma(a)=[a,\sigma(a)]
$$

is trivial exactly when $a=\sigma(a)$. In that case the point is not merely a singleton value; it is a fixed point, a settled state, a harmonic state, or a closed element.

Domain theory made this idea foundational for computation. Information is ordered by approximation. A computation is often understood as an increasing chain of partial information whose least fixed point gives the denotation of a recursive definition [@scott1976; @abramskyJung1994]. In exact real computation, intervals can be treated as information states: a broad interval is partial knowledge, and a nested refining family approaches exactness.

Fixed-point saturation answers:

> When has the process forced all compatibility it can force?

The answer is not merely width zero. It is closure equality. In a lattice or sheaf-valued process, the interval from a state to its closure becomes a point when there is no residual ascent left. This is the version most directly relevant to infomaterial settling mathematics.

# 3. What pointhood preserves and what it destroys

Every interval-to-point mechanism defines a discipline of observables. This can be stated as a table, but the conceptual point is simpler: pointhood is not a property of an object alone; it is a property of an object under a reading.

Degeneracy preserves the ambient equality structure. Quotient collapse preserves exactly the maps constant on the collapsed interval. Homotopy contraction preserves homotopy-invariant structure. Metric collapse preserves only what remains continuous under the chosen convergence. Domain-theoretic refinement preserves directed joins and fixed-point semantics. Persistence-diagram diagonalization preserves stable topological signal by discarding zero-lifetime features. Causal-diamond promotion preserves causal laws only if the induced relation on diamonds is still a strict causal order.

The error is to say “intervals are points.” The precise claim has the form:

$$
\text{interval } I \quad \xrightarrow{\;\text{operation } \Phi\;} \quad \text{point } p \text{ in } \Phi(X).
$$

The point $p$ belongs to the transformed space, quotient category, limit object, fixed-point set, persistence diagram, or derived kinematic carrier. It does not belong to the old situation as a magically compressed object unless the old situation already identified the endpoints.

This is why a collapsed interval can still have boundary effects. In topology, collapsing a subspace may create a singular point. In analysis, concentrating mass on a shrinking interval may converge to a Dirac distribution rather than to zero. In metric geometry, collapsing fibers can leave curvature and holonomy. In sheaf theory, local sections may fail to glue after collapse. In causal geometry, an interval promoted to an event may inherit ordering constraints from its endpoints. In information geometry, the trace of a collapsed interval can be a defect, obstruction, or residual energy.

So the governing rule is:

> A point produced from an interval is innocent only when all the structures under study factor through the collapse without residual obstruction.

When they do not, the produced point is singular, charged, curved, obstructed, or memory-bearing.

# 4. Quotient topology and the birth of lawful collapse

Quotient topology gives the cleanest general grammar for “an interval becomes a point.” Given a space $X$ and an equivalence relation $\sim$, the quotient space $X/{\sim}$ is equipped with the finest topology making the quotient map continuous. In the special case of a subspace $A\subseteq X$, the relation identifies all points of $A$ while leaving all points outside $A$ as singleton equivalence classes.

This construction matters because it makes collapse universal rather than pictorial. One does not draw the interval smaller and smaller. One declares the relation that kills its internal distinctions, and the quotient topology is forced by continuity.

The universal property can be phrased without category jargon:

> To define a continuous map from the collapsed space $X/A$ to another space $Y$ is exactly to define a continuous map from $X$ to $Y$ that is constant on $A$.

This says precisely what has been forgotten. Points inside $A$ are no longer separately observable by maps out of the quotient.

In algebraic topology, this construction is part of the language of cofibers and cell attachments. Collapsing a subspace is not incidental; it is how spaces are assembled and compared. Relative homology can be read through quotient spaces under suitable hypotheses, and cofiber sequences encode how the collapse changes homological information [@hatcher2002].

For the present topic, the key lesson is that topological collapse is lawful because it is functorial. It is not a subjective change of resolution. It gives a new object with a precise relation to the old object. The collapsed point is the image of an equivalence class. Any later claim about that point must be checked in the quotient, not in the original interval.

This already anticipates the infomaterial problem: if a causal diamond becomes a point of a derived causal set, then one must define the new carrier, the new relation, and the theorem that the relation satisfies the required causal laws. Otherwise “diamond as point” is only a visual slogan.

# 5. Homotopy: intervals that are point-like without being points

Homotopy theory adds a second discipline: equivalence instead of identification. The interval $[0,1]$ is not a singleton, but it is contractible. The identity map on the interval is homotopic to a constant map. Thus, for homotopy-invariant questions, the interval behaves like a point [@hatcher2002].

This is a different kind of pointhood from quotient collapse. In a quotient, all internal positions are identified. In a homotopy contraction, the interval remains present, but it can be continuously deformed to a point. The interval is not removed from the category of spaces; it is equivalent to a point in the homotopy category.

The distinction is not pedantry. Suppose a theory cares about endpoints. The interval as a space with boundary is not the same as a point. Suppose a theory cares about maps relative to endpoints. The interval carries path data. Suppose a theory cares about metric length. Homotopy ignores it. Suppose a theory cares about sheaves with nonconstant local sections. Homotopy equivalence may not preserve the relevant local data unless the sheaf theory is itself homotopy invariant in the right way.

Thus homotopy teaches a general principle:

> Pointhood is indexed by invariance.

A contractible interval is a point for homotopy groups. It is not a point for every mathematics that can be placed on the same underlying set.

This principle prevents a common category error in theoretical work. One proves that a region is trivial for one invariant, then speaks as if the region has become trivial in every sense. That move is valid only after proving that the other structures factor through the same equivalence. A collapsed interval may be homotopically invisible and spectrally visible. It may be topologically trivial and order-theoretically nontrivial. It may be causally short and cohomologically obstructed.

The phrase “when an interval becomes a point” is therefore always incomplete until it names the invariant theory in which pointhood is being claimed.

# 6. Metric geometry: collapse with memory

Metric geometry replaces equality and homotopy with distance between spaces. The Gromov--Hausdorff distance measures how close compact metric spaces are up to isometric embedding into a common ambient space. A family of intervals with diameter tending to zero converges to a point [@gromov1999; @buragoBuragoIvanov2001].

This looks like the elementary endpoint story but is conceptually different. For every positive length, the interval has infinitely many points and nonzero diameter. It becomes a point only as a limiting object. The phrase “becomes” is now temporal or parametric: there is a family $I_\varepsilon$ and a convergence $I_\varepsilon\to *$.

The deeper story appears when spaces collapse in some directions but not others. A sequence of Riemannian manifolds can converge to a lower-dimensional space. The missing dimensions may not simply vanish; under curvature bounds they are organized by fibration-like and nilpotent structures. Cheeger--Fukaya--Gromov collapse theory shows that bounded-curvature collapse carries hidden geometric algebra in the collapsing directions [@cheegerFukayaGromov1992].

Later work weakens or changes the curvature hypotheses. Ricci-limit theory studies spaces arising as Gromov--Hausdorff limits of manifolds with Ricci curvature bounded below [@cheegerColding1997]. Synthetic RCD theory abstracts lower Ricci curvature bounds to metric measure spaces, allowing nonsmooth limits to be studied with tools from optimal transport, analysis, and geometry [@dePhilippisGigli2018; @honda2020]. Current work comparing Gromov--Hausdorff and intrinsic flat convergence in RCD and Kato settings shows that the frontier remains potential: even the relation between metric convergence, orientation, current structure, and singular limit behavior is still being refined [@mondinoPerales2026].

Metric collapse gives the most physically suggestive answer to the title. An interval becomes a point when its length becomes negligible relative to the observer’s metric scale. But collapse theory warns that scale-neglect is not structure-neglect. A limit point may encode the residue of a collapsed fiber. If the theory carries measure, curvature, spin, spectrum, holonomy, or sheaf coefficients, the point may not be ordinary.

That is the first robust version of “material pointhood”:

> A point can be a collapsed interval together with the residual data required to make the collapse stable under the governing geometry.

# 7. Reeb graphs: making contours into points

Reeb graph theory gives a particularly explicit form of interval-to-point thinking. Given a function $f:X\to\mathbb{R}$, the Reeb graph identifies points that lie in the same connected component of a level set of $f$. The quotient space records how contours appear, merge, split, and disappear [@reeb1946; @deyShiWang2013].

This is not simply collapsing intervals. It collapses connected level components, which may be intervals, circles, surfaces, or more complicated sets. But it expresses the same structural idea: an extended fiber becomes a point in a quotient summary, and the remaining graph records how those points are organized by the function value.

Reeb graphs are important because they show collapse as summarization. The quotient does not attempt to preserve all of $X$. It preserves the evolution of connected level-set components. It is a controlled loss of information. Computational topology then asks how stable that summary is, how well it approximates the original space, and how it behaves under perturbations [@deyFanWang2013; @deyShiWang2013].

For the title problem, the Reeb graph says:

> An interval becomes a point when the chosen observable regards the entire interval as one connected fiber of equal value.

Here the observable is not arbitrary. It is the function $f$. The quotient is not blind compression; it is compression along the fibers of a measurement.

This is very close to an information-theoretic reading. If an interval of states cannot be distinguished by the available readout, the readout quotient treats it as one point. But the Reeb graph also preserves how indistinguishable fibers connect across changing readout values. Thus the point is not isolated exactness; it is a contour-event in a graph of transitions.

This language will reappear below when causal diamonds become points of a kinematic space. A diamond-point is not a tiny event because it has no internal structure. It is a promoted interval-event because the derived carrier is designed to track how such intervals sequence.

# 8. Persistence: when a bar dies on the diagonal

Persistent homology gives another interval-to-point mechanism. A topological feature born at filtration value $b$ and dying at filtration value $d$ is represented by an interval $[b,d)$ or by a point $(b,d)$ in a persistence diagram. Its persistence is $d-b$ [@ghrist2008; @chazalDeSilvaGlisseOudot2016].

A zero-length bar lies on the diagonal $b=d$. Such a feature has no lifetime. In the diagrammatic representation, intervals become points in the plane, and then zero-length intervals become points on the diagonal that are usually treated as noise or as freely matchable diagonal mass in bottleneck and Wasserstein metrics. Stability theorems for persistence diagrams make this diagonal behavior mathematically central [@cohenSteinerEdelsbrunnerHarer2007].

Persistence therefore performs two transformations at once. First, it turns a temporal or scale interval into a diagram point. Second, it treats the diagonal as the locus where interval life has collapsed.

The first transformation is a change of representation:

$$
[b,d) \quad \mapsto \quad (b,d).
$$

The second is a triviality criterion:

$$
b=d \quad \Longleftrightarrow \quad \text{zero persistence}.
$$

This is a powerful model for information geometry because it distinguishes short life from no life. Small intervals may be unstable under perturbation. Diagonal intervals are dead by definition. Long intervals are treated as robust signal.

The title phrase can thus be read as:

> An interval becomes a point when a duration is re-encoded as a birth--death coordinate; it becomes trivial when that point reaches the diagonal.

This is not merely a visualization trick. It is an algebraic classification of persistence modules into interval modules under appropriate finiteness hypotheses [@chazalDeSilvaGlisseOudot2016]. The interval is the indecomposable life of a feature; the point is its coordinate in the moduli of such lives.

# 9. Domain theory and exact real computation: points as completed intervals

Domain theory reverses the usual order of intuition. Instead of starting with exact points and then adding intervals as uncertainty, it can start with partial information and treat exact points as limits of refinement. An interval is an information state. A narrower interval contains more information. Exactness is not primitive; it is the maximal consistent refinement of approximation.

In this setting, the order is often reverse inclusion: $I\sqsubseteq J$ if $J\subseteq I$, because $J$ is more informative than $I$. Directed families of intervals can converge by intersection or supremum to an exact real. The point is the ideal limit of compatible approximations.

Dana Scott’s domain theory provided a general mathematical language for partial information, monotone functions, continuity, and least fixed points [@scott1976]. Abramsky and Jung’s survey places this within the broader semantics of computation, where domains support denotational accounts of recursive definitions and approximation [@abramskyJung1994].

For interval arithmetic, domain thinking has a practical edge: computations can produce guaranteed enclosures, and refinement is meaningful only if the enclosure discipline is preserved. Exact real computation uses finite descriptions to approximate real values without confusing approximants with the ideal real itself.

The title phrase now means:

> An interval becomes a point when refinement has reached, or is represented by, an exact element in the domain of information.

But in a computational setting there may be no finite stage at which this literally happens. A computable real may be given by an infinite process of narrowing intervals. The point is the limit object, not necessarily a finitely attained singleton.

This distinction matters for settling mathematics. A closure process may reach a fixed point in finite time, or it may approach one through a directed limit, or it may require a transfinite closure ordinal. The interval between current state and closure becomes a point exactly when the state is already closed. But the process by which it gets there may have ordinal, energetic, or obstruction data.

# 10. Causal intervals: diamonds are not decorative

In causal geometry, an interval is not primarily a subset of the real line. Given a causal order $\leq$, the causal interval from $a$ to $b$ is

$$
I(a,b)=\{x: a\leq x\leq b\}.
$$

In Lorentzian geometry this is an Alexandrov interval or causal diamond. In causal-set theory, the basic hypothesis is that spacetime order can be represented by a locally finite partial order; causal intervals are finite sets of events lying between two comparable events [@bombelliLeeMeyerSorkin1987; @surya2019].

Causal intervals carry dimension and curvature information. Myrheim-type dimension estimators use ordering fractions in causal intervals [@myrheim1978]. Benincasa--Dowker-type constructions build discrete d'Alembertian and scalar-curvature analogues from layer counts in the causal past [@benincasaDowker2010]. Thus a causal interval is not an inert stretch waiting to be collapsed. It is a local measurement cell.

This gives a different answer to the title:

> A causal interval becomes point-like only after its internal order has been read, summarized, or promoted into a derived event carrier.

If one simply identifies all events in a causal interval, one may destroy the order that made the interval meaningful. If instead one promotes the interval to a point of a higher kinematic space, the new relation must be defined so that promoted intervals sequence without contradiction.

This is the context in which “diamond as point” becomes mathematically dangerous and mathematically useful. Dangerous, because nesting of intervals can create self-containment or reflexivity problems if treated as causal precedence. Useful, because endpoint sequencing can turn intervals into events of a derived causal set. The interval becomes a point not by losing its endpoints but by being named through them.

# 11. Sheaves, Laplacians, and the obstruction to innocent collapse

Sheaf theory asks whether local data can be restricted and glued consistently. A collapse that looks harmless topologically may fail to preserve the gluing behavior of data. This is why sheaves are a natural language for interval-to-point transitions: they force the question of what local information survives when a region is treated as one unit.

Cellular sheaves make this concrete on finite cell complexes and graphs. Hansen and Ghrist’s spectral sheaf program extends graph Laplacian ideas to cellular sheaves of vector spaces, relating Laplacian structure to cohomology and consistency [@hansenGhrist2018]. Ghrist and Riess’s Tarski Laplacian extends this direction to lattice-valued sheaves, where fixed points of an order-theoretic Laplacian compute degree-zero global-section behavior [@ghristRiess2020]. Later categorical diffusion work frames diffusion by enriched categorical structure and Lawvere-style Laplacians [@ghristLopezNorthRiess2025].

This matters because collapse is not only geometric. It is also semantic. If an interval carries local observations, then making it a point means asking whether those observations agree enough to be represented by one stalk value. The obstruction to doing so is cohomological in spirit: local data may refuse to become global data.

The sheaf-theoretic reading of the title is:

> An interval becomes a point for a sheaf when its local sections restrict and glue as if there were only one stalk there; otherwise the would-be point carries obstruction.

This is one of the cleanest bridges to information theory. A point is not merely a location. It is a place where compatible information can be addressed. An interval becomes a point when its internal variation is either irrelevant, consistently glued, or explicitly recorded as defect.

# 12. Infomaterial reading: interval, closure, diamond, point

The infomaterial and relational-math setting makes the title sharper. The project’s settling interval geometry note frames geometry as generated by closure over value-bearing cells rather than as fields placed on a pregiven manifold [@emsenn2026settling]. The common object proposed there is an indexed charge-valued settling geometry: a cell type, valuations on cells, a closure operator, an orbit under iteration, and a settled fixed point. The note explicitly allows the cell type to vary among predication cells, causal event-pairs, causal intervals/diamonds, and clopen-supported sheaf cells [@emsenn2026settling].

In that framework, an interval becomes a point in at least three distinct senses.

First, a saturation or projection interval becomes trivial at a fixed point. If the interval measures the gap from a current value to its closure, then the interval is point-like exactly when no closure distance remains. This is the order-theoretic version of endpoint equality, but its endpoints are not arbitrary real numbers. They are a state and its settled image.

Second, a causal interval becomes a local geometric cell. The settling interval geometry note defines causal diamonds as intervals, not as decorative four-node pictures: given $a\leq^c b$, the interval is the set of events $x$ such that $a\leq^c x\leq^c b$ [@emsenn2026settling]. It then proposes interval portraits whose local data include quantities such as $H^0$ mass, ordering fraction, layer measure, $H^1$ obstruction, curvature rank, spectral gap, and energy. Global geometry is how such interval portraits restrict and glue.

Third, a causal diamond can be promoted to a point of a derived kinematic space. In the infomaterial `HoleDiamondCausalSet` construction, a `DiamondPoint C` is carried by two listed events, a lower endpoint and an upper endpoint, together with proof that the lower strictly reaches the upper [@emsenn2026holediamond]. The file explicitly rejects nesting as the causal order because nesting has a self-edge at every diamond point. Instead it uses endpoint sequencing: one diamond precedes another when the upper endpoint of the first is causally before the lower endpoint of the second. That sequencing relation is proved transitive and irreflexive, so diamond-points form a new causal set, the `HoleDiamondKinematicSpace` [@emsenn2026holediamond].

This is exactly the title problem in formal clothing. A diamond interval becomes a point only after the derived carrier and relation are specified. The point is not the old interval crushed blindly. It is a new event whose identity is endpoint-certified and whose order is sequencing, not nesting.

The July 2, 2026 diamond-lift note then states the composability conjecture: a FOUR-coloured post-hole tile over a finite causal set should lift to the causal-diamond kinematic space when readout, colouring, and bead/lenticle realization are compatible with sequencing; after the lift, ordinary hole, shroud, tile, and FOUR/K4 laws reapply at the diamond level [@emsenn2026diamondlift]. The note correctly refuses the sloppy equation “hole = diamond = K4 = FOUR.” The precise claim is closure under causal-diamond sequencing lift.

This is the strongest form of the answer:

> In infomaterial geometry, an interval becomes a point when a settled or endpoint-certified interval can be promoted to a carrier element of a derived geometry whose order, readout, colouring, and gluing laws typecheck again.

That is composable information. It is not repeated analogy.

# 13. Genealogy of the concept

The genealogy is not a single line. It is a braid of several mathematical traditions that learned, in different languages, how extension can be treated as pointhood without simply denying extension.

## 13.1 Continuum, endpoint, and exactness

Classical real analysis already contains the degenerate interval $[a,a]$. The point is the limiting case of an interval when lower and upper bounds coincide. This is the arithmetic root of the phrase. It becomes computationally important in interval analysis, where intervals are values representing guaranteed enclosures rather than vague approximations [@moore1966; @mooreKearfottCloud2009].

In this line, the interval becomes a point through exactness.

## 13.2 Quotient topology and algebraic topology

General topology made collapse into a construction: identify a subspace to a point and give the result the quotient topology. Algebraic topology then integrated such collapses into homology, cohomology, cell complexes, and cofiber sequences [@hatcher2002; @munkres2000].

In this line, the interval becomes a point through a universal identification relation.

## 13.3 Homotopy equivalence

Homotopy theory separated equality from equivalence. The interval is not equal to a point, but it has the homotopy type of a point. This taught mathematics to say “point-like for these invariants” without saying “literally a singleton” [@hatcher2002].

In this line, the interval becomes a point through invariant-relative triviality.

## 13.4 Domain theory and computational approximation

Scott’s domain theory turned partial information into mathematical structure and made fixed points central to semantics [@scott1976]. Intervals can be approximation states, and exact points can be limits of directed refinement. This gives a computational reading of pointhood as completed information rather than primitive location [@abramskyJung1994].

In this line, the interval becomes a point through directed refinement and fixed-point completion.

## 13.5 Metric collapse and Riemannian degeneration

Gromov’s metric viewpoint made it possible to speak of convergence of spaces themselves [@gromov1999]. Collapse theory then showed that spaces can converge to lower-dimensional limits while retaining hidden structure in the collapsed directions [@cheegerFukayaGromov1992]. Ricci-limit and RCD theories continue this genealogy in nonsmooth and weak-curvature settings [@cheegerColding1997; @dePhilippisGigli2018; @honda2020; @mondinoPerales2026].

In this line, the interval becomes a point through scale-dependent metric convergence, often with residual geometric memory.

## 13.6 Reeb graphs and topological summaries

Reeb’s construction quotients a space by connected components of level sets [@reeb1946]. Modern computational topology uses Reeb graphs and related constructions as stable summaries of shapes and data [@deyFanWang2013; @deyShiWang2013].

In this line, the interval becomes a point through observational quotienting along a function.

## 13.7 Persistence and barcodes

Persistent homology decomposes filtered topological information into interval modules and represents those intervals as bars or birth--death points [@ghrist2008; @chazalDeSilvaGlisseOudot2016]. Stability of persistence diagrams makes the diagonal a formal place where zero-lifetime intervals are absorbed [@cohenSteinerEdelsbrunnerHarer2007].

In this line, the interval becomes a point through moduli representation, and becomes trivial on the diagonal.

## 13.8 Causal sets and interval geometry

Causal-set theory treats causal order as primary and spacetime discreteness as local finiteness [@bombelliLeeMeyerSorkin1987; @surya2019]. Causal intervals carry dimension and curvature information through order fractions and layer counts [@myrheim1978; @benincasaDowker2010].

In this line, the interval becomes a point only when it is promoted to a derived event without destroying causal law.

## 13.9 Sheaf Laplacians and order diffusion

Cellular sheaf Laplacians, Tarski Laplacians, and categorical diffusion extend Laplacian thinking to data that lives over combinatorial spaces, lattices, and enriched categories [@hansenGhrist2018; @ghristRiess2020; @ghristLopezNorthRiess2025]. These tools make it natural to ask when local interval data can be harmonically settled into global point-like consistency.

In this line, the interval becomes a point through gluing, harmonicity, and fixed-point consistency.

# 14. Current frontiers

The current frontier is not whether intervals can be collapsed. That is classical. The frontier is how to collapse, promote, or refine intervals while retaining the right residual structure.

## 14.1 Collapse under weak geometric control

Metric collapse with strong curvature bounds has a mature theory, but modern geometry increasingly studies limits under weaker hypotheses: lower Ricci bounds, synthetic RCD conditions, Kato bounds, intrinsic flat convergence, and singular spaces. The issue is no longer simply whether a thin interval-like direction becomes a point. The issue is what analytic, orientational, and measure-theoretic structures survive the collapse [@dePhilippisGigli2018; @honda2020; @mondinoPerales2026].

The frontier question is:

> What hidden structures must be attached to a collapsed point so that analysis on the limit remains faithful to the approximating spaces?

## 14.2 Spectral convergence and collapsed Laplacians

When spaces collapse, spectra may converge, split, concentrate, or remember the collapsed directions. In sheaf and order settings, Laplacians are no longer only differential operators on manifolds; they may be cellular, lattice-valued, or enriched-categorical [@hansenGhrist2018; @ghristRiess2020; @ghristLopezNorthRiess2025].

The frontier question is:

> When does an interval become spectrally invisible, and when does it leave a harmonic kernel, defect mode, or spectral gap?

For infomaterial mathematics, this is central. A trivial saturation interval corresponds to a fixed or harmonic state. A nontrivial interval may have spectral mass. Collapse without accounting for the spectral residue would be false pointhood.

## 14.3 Stable summaries of data

Reeb graphs, Mapper, persistence diagrams, and sheaf-based data models all face the same structural problem: they deliberately compress data. The compression is useful only if its stability and loss profile are understood [@deyShiWang2013; @ghrist2008; @chazalDeSilvaGlisseOudot2016].

The frontier question is:

> Which interval distinctions are signal, which are noise, and which become obstruction when compressed to points?

Persistence gives one answer through lifetime and diagonal matching. Reeb graphs give another through level-set connectivity. Sheaves give another through local-to-global consistency.

## 14.4 Exact computation and proof-carrying intervals

Formal verification and exact real arithmetic keep intervals alive as proof objects. A numerical point without an enclosure certificate may be less informative than an interval with a guarantee. Here the frontier is not to make intervals disappear as quickly as possible. It is to manage intervals as computational evidence [@mooreKearfottCloud2009; @daumasLesterMunoz2007].

The frontier question is:

> When is point output justified by interval evidence?

This is also a philosophical reversal: exact-looking points may be computationally weaker than certified intervals.

## 14.5 Quantum and noncommutative interval notions

Recent work on quantised intervals studies Gromov--Hausdorff-type convergence in noncommutative or quantum metric settings [@gotfredsen2021]. Finite-precision approaches to quantum mechanics likewise use interval-valued or parcel-valued descriptions of state and probability [@edalat2026].

The frontier question is:

> What does it mean for an interval of possible states, probabilities, or spectra to become a point when the underlying logic is not classical point-set ontology?

This is not merely a physics question. It tests whether pointhood is an artifact of commutative measurement.

## 14.6 Causal intervals as derived events

Causal-set theory and infomaterial causal geometry both make intervals structurally primary. In causal-set theory, intervals are local finite order regions used to estimate dimension and curvature [@bombelliLeeMeyerSorkin1987; @myrheim1978; @benincasaDowker2010; @surya2019]. In infomaterial formalization, causal diamonds can become `DiamondPoint`s of a derived kinematic space only through endpoint sequencing, because nesting self-loops and fails strict causal order [@emsenn2026holediamond].

The frontier question is:

> When can a local causal interval be promoted to an event of a higher causal set so that the same laws apply recursively?

The diamond-lift closure conjecture is precisely in this frontier. It asks for composability: post-hole FOUR tiles should remain post-hole FOUR tiles under causal-diamond sequencing lift, provided the readout, colouring, adjacency, and bead/lenticle realization commute with sequencing [@emsenn2026diamondlift].

# 15. The interval-point promotion principle

The preceding sections suggest a general principle.

**Interval-Point Promotion Principle.** Let $I$ be an interval-like object inside a structured context $X$. The interval $I$ may be promoted to a point $p_I$ in a derived context $D(X)$ only when the following data are specified:

1. **Carrier:** the derived space, set, category, diagram, or order in which $p_I$ lives.
2. **Promotion map:** the operation sending $I$ to $p_I$, such as quotient, limit, representation, closure, or endpoint certification.
3. **Observable discipline:** the class of maps, invariants, sections, metrics, or measurements that are required to factor through the promotion.
4. **Residual accounting:** the data that do not factor, recorded as boundary, curvature, obstruction, cohomology, spectrum, measure, memory, or singularity.
5. **Law revalidation:** proof that the derived points satisfy the structural laws required of points in the target context.

This principle forbids the undisciplined move from “this interval is small,” “this interval is contractible,” or “this interval is locally coherent” to “this interval is a point.” It requires the mathematics to say what kind of point has been produced.

For ordinary real intervals, the carrier is $\mathbb{R}$, the promotion is endpoint equality, and residual accounting is empty. For quotient topology, the carrier is $X/A$, the promotion map is the quotient map, and the observable discipline is constancy on $A$. For homotopy, the carrier is the homotopy category and the promotion is equivalence to the terminal homotopy type. For Gromov--Hausdorff collapse, the carrier is the metric limit and the promotion is convergence. For persistence, the carrier is the diagram, the promotion is birth--death encoding, and the diagonal is the triviality locus. For domain theory, the carrier is the dcpo or lattice of information states, the promotion is directed join or fixed-point closure, and residual accounting is the remaining interval to closure.

For infomaterial geometry, the principle becomes sharper:

> A causal interval becomes a point when it is certified as a `DiamondPoint`, inserted into `HoleDiamondKinematicSpace`, ordered by endpoint sequencing, and shown to re-support the relevant hole/readout/shroud/tile laws.

This is not just “collapse.” It is promotion into a new carrier whose laws must be reproved or inherited by theorem.

# 16. The local formula: trivial interval equals fixed point

The most compact formal spine is the fixed-point version. Let $(P,\leq)$ be a poset and let $\sigma:P\to P$ be inflationary and monotone. Define the saturation interval

$$
I_\sigma(a)=\{x\in P: a\leq x\leq \sigma(a)\}.
$$

Then:

$$
I_\sigma(a)\text{ is trivial} \quad \Longleftrightarrow \quad a=\sigma(a).
$$

The left side says the interval has become a point. The right side says the state is fixed under saturation. This equivalence is elementary, but it carries the philosophical weight of the whole paper. The point is not merely a location. It is a state with no remaining closure gap.

If $\sigma$ is a closure operator, the fixed points are closed elements. If $\sigma$ is a projection, the fixed points are projected or normalized elements. If $\sigma$ is a Laplacian-like settling operator, the fixed points are harmonic or quiescent elements. If $\sigma$ is a semantic saturation operator, the fixed points are fully entailed states.

This formula is the right local model for projection-gap mathematics. A nontrivial interval $[a,\sigma(a)]$ measures unresolved ascent. Its “length” may be cardinal, ordinal, energetic, spectral, or cohomological depending on the surrounding theory. When the length vanishes, the interval is a point because the process can no longer distinguish before from after.

# 17. The global formula: promoted intervals must glue

The local fixed-point formula is not enough for geometry. A geometry is not a bag of fixed points. It is a system of local data with restrictions, adjacencies, transitions, and gluing laws.

Suppose each interval $I$ in a cover carries a portrait $\Pi(I)$: order data, $H^0$ mass, $H^1$ obstruction, layer measures, spectral gap, energy, or readout status. The global question is whether these portraits restrict consistently on overlaps and compose under sequencing. If they do, intervals can be treated as points of a derived geometry. If they do not, the failure is precisely the interesting curvature or obstruction.

This is why the sheaf language is not ornament. Sheaves encode the passage from local interval data to global structure. Cohomology measures obstruction to gluing. Laplacians encode relaxation toward compatible global states. A point produced by collapse is legitimate only when its local data is compatible with the surrounding restrictions.

In infomaterial terms, the intended theorem-shape is not “every interval is a point.” It is closer to:

> The class of lawful local cells is closed under interval-point promotion when the promotion commutes with restriction, sequencing, readout, colouring, and settling.

That closure claim is the mathematical content of composability. Once proved, one can reuse laws at the promoted level without reproving them from scratch. Before it is proved, the repeated shape is only a suggestive recurrence.

# 18. The causal-diamond case as a worked theorem-shape

The causal-diamond case gives the most concrete theorem-shape.

Start with a finite causal set $C$. A diamond-point is not just a pair. It is a lower event, an upper event, and evidence that the lower strictly reaches the upper [@emsenn2026holediamond]. Thus the promoted point carries endpoint certification.

Naively ordering diamond-points by nesting fails because every diamond nests in itself, producing a self-edge. A causal set requires strict-order closure; self-edges violate irreflexivity. Therefore nesting cannot be the causal relation on promoted diamonds [@emsenn2026holediamond].

Endpoint sequencing repairs this. Define $p\prec q$ when the upper endpoint of $p$ is causally before the lower endpoint of $q$. The formalization proves this relation transitive and irreflexive, packages the diamond-points as a new causal set, and instantiates the ordinary hole construction on that derived causal set [@emsenn2026holediamond].

This is the exact moment when an interval becomes a point. It becomes a point only after:

- its endpoints are certified;
- the derived carrier is named;
- nesting is rejected as unlawful;
- sequencing is proved strict;
- the hole/readout/exterior/shroud laws typecheck on the derived carrier.

The diamond-lift closure conjecture then asks for the next level: if a post-hole FOUR tile over $C$ admits a sequencing-compatible lift to the diamond kinematic space, then the lifted object is again a post-hole FOUR tile [@emsenn2026diamondlift]. This is the recursive payoff. A hole-region can become a tile-level object; a causal diamond can become an event-level object; the same family of laws can reapply, but only through carrier-specific proof.

# 19. A compact vocabulary

The paper’s distinctions can be compressed into a vocabulary useful for further formalization.

**Singletonization** is endpoint degeneracy: $[a,b]$ becomes a point because $a=b$.

**Collapse** is quotient identification: an extended subobject becomes one equivalence class.

**Contraction** is homotopy triviality: an interval is point-like for homotopy-invariant observables.

**Metric collapse** is convergence of spaces: the interval’s diameter vanishes in a chosen metric on spaces.

**Refinement** is domain-theoretic completion: intervals approximate a point by directed information growth.

**Diagonalization** is persistence triviality: a birth--death interval has zero lifetime.

**Saturation** is fixed-point closure: the interval from state to closure is trivial.

**Promotion** is derived eventhood: an interval becomes a point of a new carrier with revalidated laws.

**Residualization** is the recording of what collapse did not erase: boundary, mass, curvature, obstruction, spectrum, or memory.

These terms should not be treated as new axioms. They are names for already distinct mathematical mechanisms. Their purpose is to stop the title phrase from flattening them into one vague gesture.

# 20. Conclusion: the point is earned

An interval becomes a point only under a rule. Sometimes the rule is endpoint equality. Sometimes it is quotient identification. Sometimes it is homotopy equivalence. Sometimes it is metric convergence. Sometimes it is exact refinement. Sometimes it is zero persistence. Sometimes it is fixed-point saturation. Sometimes it is promotion into a derived causal or sheaf-theoretic carrier.

The general lesson is that pointhood is not always primitive. A point can be the result of a process that has erased, compressed, stabilized, or re-indexed extension. But the process must account for what is lost and what remains. A collapsed interval may be a smooth point, a singular point, a charged point, a boundary point, a memory point, a harmonic point, a diagonal point, or an event-point in a higher causal set.

For ordinary mathematics, this gives a map across topology, geometry, computation, and data analysis. For infomaterial mathematics, it gives a precise research directive: treat interval-to-point transitions as theorem-bearing promotions. A saturation interval is point-like exactly at fixed point. A causal interval is a diamond, not a decoration. A diamond becomes a point only in a sequencing kinematic space. A post-hole tile lifts only when readout, colouring, adjacency, and bead/lenticle realization commute with that sequencing.

So the answer to “when an interval becomes a point” is:

> when the governing structure can no longer lawfully distinguish its interior, and when every remaining distinction has either factored through the new point or been named as residual structure.

That is the difference between collapse as sloppiness and collapse as mathematics.
