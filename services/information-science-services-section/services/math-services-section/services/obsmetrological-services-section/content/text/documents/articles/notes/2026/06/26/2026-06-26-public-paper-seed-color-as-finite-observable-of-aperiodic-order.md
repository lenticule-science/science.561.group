---
title: "Color as a finite observable of aperiodic order"
date: 2026-06-26
status: "public standalone draft"
keywords:
  - aperiodic-tilings
  - graph-coloring
  - matching-rules
  - wang-tiles
  - markov-partitions
  - diffraction
  - tiling-dynamical-systems
  - finite-observables
date-created: 2026-06-26
description: "Coloring problems in aperiodic tiling theory are often presented as variants of a single question: how many colors are needed?"
references:
  - id: baake2025
    type: article
    author:
      - family: Baake
        given: Michael
      - family: Gähler
        given: Franz
      - family: Mazáč
        given: Jan
      - family: Mitchell
        given: Andrew
    title: Diffraction of the Hat and Spectre tilings and some of their relatives
    container-title: Journal of Mathematical Physics
    volume: 66
    number: arXiv:2502.03268
    issued:
      date-parts:
        - [2025]
    URL: https://arxiv.org/abs/2502.03268
    accessed:
      date-parts:
        - [2026, 6, 26]
  - id: evans2025
    type: article-journal
    author:
      - family: Evans
        given: Molly
      - family: Gawlak
        given: Dylan
      - family: Ramsey
        given: Christopher
      - family: Strungaru
        given: Nicolae
      - family: Trang
        given: Ryan
    title: Colourings of aperiodic tilings
    container-title: Contributions to Discrete Mathematics
    volume: 20
    issue: 2
    page: 396-421
    issued:
      date-parts:
        - [2025]
    URL: https://cdm.ucalgary.ca/article/view/76852
    accessed:
      date-parts:
        - [2026, 6, 26]
  - id: goodmanstrauss1998
    type: article-journal
    author:
      - family: Goodman-Strauss
        given: Chaim
    title: Matching rules and substitution tilings
    container-title: Annals of Mathematics
    volume: 147
    issue: 1
    page: 181-223
    issued:
      date-parts:
        - [1998]
    URL: https://annals.math.princeton.edu/articles/12903
    accessed:
      date-parts:
        - [2026, 6, 26]
  - id: jeandelrao2021
    type: article-journal
    author:
      - family: Jeandel
        given: Emmanuel
      - family: Rao
        given: Michaël
    title: An aperiodic set of 11 Wang tiles
    container-title: Advances in Combinatorics
    issued:
      date-parts:
        - [2021]
    URL: https://www.advancesincombinatorics.com/article/18614-an-aperiodic-set-of-11-wang-tiles
    accessed:
      date-parts:
        - [2026, 6, 26]
  - id: labbeselinger2026
    type: article
    author:
      - family: Labbé
        given: Sébastien
      - family: Selinger
        given: Peter
    title: A construction of the hat tilings by a Markov partition
    number: arXiv:2604.20964
    issued:
      date-parts:
        - [2026]
    URL: https://arxiv.org/abs/2604.20964
    accessed:
      date-parts:
        - [2026, 6, 26]
  - id: smith2023a
    type: article
    author:
      - family: Smith
        given: David
      - family: Myers
        given: Joseph Samuel
      - family: Kaplan
        given: Craig S.
      - family: Goodman-Strauss
        given: Chaim
    title: An aperiodic monotile
    number: arXiv:2303.10798
    issued:
      date-parts:
        - [2023]
    URL: https://arxiv.org/abs/2303.10798
    accessed:
      date-parts:
        - [2026, 6, 26]
  - id: smith2023b
    type: article
    author:
      - family: Smith
        given: David
      - family: Myers
        given: Joseph Samuel
      - family: Kaplan
        given: Craig S.
      - family: Goodman-Strauss
        given: Chaim
    title: A chiral aperiodic monotile
    number: arXiv:2305.17743
    issued:
      date-parts:
        - [2023]
    URL: https://arxiv.org/abs/2305.17743
    accessed:
      date-parts:
        - [2026, 6, 26]
  - id: vereshchagin2026
    type: article
    author:
      - family: Vereshchagin
        given: Nikolay
    title: Matching Rules for Substitution and Hierarchical Tilings for any Substitution with Finite Local Complexity
    number: arXiv:2606.25005
    issued:
      date-parts:
        - [2026]
    URL: https://arxiv.org/abs/2606.25005
    accessed:
      date-parts:
        - [2026, 6, 26]
---


## Abstract

Coloring problems in aperiodic tiling theory are often presented as variants of a single question: how many colors are needed?
That phrasing is too narrow.
In current work, color plays several mathematically distinct roles.
It may be a proper graph coloring of an infinite adjacency graph; a decoration that forces a local matching rule; an edge alphabet for a Wang shift; a symbolic state in a Markov-partition construction; or a weight used to probe diffraction and long-range order.
These uses overlap, but they preserve and forget different features of an aperiodic hull.
This paper proposes a unified language for these uses by treating color as a finite observable of aperiodic order.
The central question becomes: what information about an infinite nonperiodic structure is seen by a finite labeling, and in which category is that observation invariant?
We survey the main regimes of coloring, relate them to local derivability, factor maps, sofic covers, symbolic dynamics, cohomological invariants, and diffraction, and formulate a research program around comparing encodings of the same aperiodic system.
Recent developments around Hat and Spectre monotiles, optimal colorings of substitution tilings, broad finite-local-complexity matching-rule results, and explicit diffraction calculations make this comparison timely.

## 1. Introduction

Aperiodic tilings sit at a useful boundary between finiteness and infinity.
Their local pieces are finite, but their global organization cannot be reduced to a translational period.
The classical examples -- Penrose tilings, substitution tilings, Wang shifts, model sets, and more recent monotile systems such as the Hat and Spectre -- all express this tension in different technical languages.
They are locally controlled but globally nonperiodic.

Coloring problems inherit the same tension.
A coloring is finite data: a finite set of colors, labels, edge states, weights, or symbols assigned to vertices, edges, faces, tiles, control points, or regions of a partition.
But the object being colored may be an infinite tiling, a compact tiling hull, a symbolic subshift, a cut-and-project set, or a family of physical scatterers.
A finite label can therefore mean many different things.

The usual graph-theoretic question is:

> How many colors are needed so that adjacent objects differ?

That remains a real and nontrivial question for aperiodic tilings.
Evans, Gawlak, Ramsey, Strungaru, and Trang recently gave explicit optimal vertex, edge, and face colorings for the chair, Ammann--Beenker, rational pinwheel, and pinwheel tilings [Evans et al. 2025].
Their results show that even familiar substitution tilings can have subtle exact chromatic behavior.

But the present frontier is broader.
In many aperiodic settings, color is not merely a constraint to avoid equality across an edge.
It is a finite observable.
It can force hierarchy, reveal hidden substitution structure, present an aperiodic system as a subshift of finite type, encode a Markov partition, or alter the diffraction spectrum of a weighted point set.
The relevant question is not only "how many colors?" but:

> What does this finite coloring observe, preserve, force, or forget about the aperiodic system?

This shift is especially visible after the discovery of the Hat and Spectre monotiles by Smith, Myers, Kaplan, and Goodman-Strauss [Smith et al. 2023a; Smith et al. 2023b].
These systems are not just new shapes.
They create a modern test case for comparing geometric matching, substitution hierarchy, symbolic coding, Markov partitions, and diffraction.
Labbé and Selinger's 2026 construction of Hat tilings by a Markov partition gives a particularly explicit example: a colored image together with a triangular grid generates valid Hat tilings, and every valid Hat tiling arises from that construction in a precise sense [Labbé and Selinger 2026].
Meanwhile, Baake, Gähler, Mazáč, and Mitchell compute diffraction of Hat and Spectre tilings through model-set representatives and exact renormalization [Baake et al. 2025].
These results show that the same family of tilings can be approached through color-like finite labels, substitution and model-set structure, and spectral observables.

This paper organizes that landscape.
The contribution is conceptual rather than a new theorem: it gives a taxonomy of color as a finite observable, names the main equivalence notions connecting colorings, and isolates open problems where several color regimes meet.

## 2. Background: aperiodicity, hulls, and finite observations

This section fixes a minimal vocabulary.
The goal is not to review all of aperiodic order, but to make clear which mathematical object a coloring is observing.

### 2.1 Aperiodic tilings and tiling spaces

A tiling of Euclidean space is a covering by tiles with controlled overlaps.
A tiling is periodic if it is invariant under a nonzero translation, and nonperiodic otherwise.
A set of prototiles is aperiodic if it admits tilings but admits no periodic tilings.

In many examples, one studies not a single tiling but the tiling hull.
Informally, the hull of a tiling \(T\) is the closure of its translation orbit.
It contains all tilings locally indistinguishable from \(T\), subject to the chosen tiling topology.
The hull is the natural object for dynamical questions: factor maps, local derivations, spectral properties, cohomology, and diffraction are invariants of the whole hull rather than of one drawing.

Aperiodic order is broader than quasicrystallinity.
A random or mixed-spectrum system can be aperiodic without having the sharp Bragg peaks associated with a pure-point diffraction spectrum.
In a stricter mathematical quasicrystal setting, one often expects a Delone set or tiling with strong long-range order, frequently modeled by cut-and-project sets or substitutions with pure-point spectrum.
The distinction matters because a coloring can preserve nonperiodicity while changing spectral type, and a finite coloring can reveal order in one invariant while hiding it in another.

### 2.2 Finite local complexity

A tiling has finite local complexity (FLC), relative to translations or to a chosen motion group, if there are only finitely many local patches of any fixed radius up to that equivalence.
FLC is the condition under which local rules, collared tiles, substitution approximants, and finite-state encodings behave most cleanly.

FLC is also the natural habitat for many coloring questions.
If there are only finitely many local patch types, a color can be a local derivation from those patch types.
If there are infinitely many orientations, as in pinwheel-like systems, the coloring problem may still be meaningful, but local finite-state methods need adjustment.

### 2.3 Local derivability and factors

A coloring of a tiling may be arbitrary, but the most structured colorings are local.
A colored tiling \(C(T)\) is locally derivable from an uncolored tiling \(T\) if the color assigned near a point is determined by a bounded-radius patch of \(T\).
Two tiling systems are mutually locally derivable (MLD) when each can be recovered from the other by local rules.
MLD equivalence is strong: it says that the two systems carry the same local information in different alphabets.

A factor map is weaker.
A factor may identify distinct tilings or forget some information.
Many colorings are factors rather than MLD encodings: they see a finite observable of the hull but do not recover the whole hull.

The distinction is central.
If a coloring is MLD with the original tiling, then it repackages the aperiodic order.
If it is a finite-to-one factor, it compresses that order.
If it is many-to-one, it may retain only a chromatic, symbolic, or spectral projection.

## 3. Five meanings of color

The word "coloring" hides several different mathematical acts.
The following five regimes are not exhaustive, but they cover much of the active terrain.

### 3.1 Proper graph coloring

The most classical meaning is graph coloring.
One forms a graph from a tiling: vertices may be tile vertices, tile centers, edges of the tiling skeleton, or faces/tiles with adjacency relations.
A proper coloring assigns colors so that adjacent graph elements differ.
The questions are chromatic number, chromatic index, face-coloring number, and exact optimal constructions.

This is the regime closest to the Four Color Theorem and Vizing-type edge coloring.
But aperiodic tilings make exact questions sharper.
Upper bounds from planarity or bounded degree may be easy; optimal colorings compatible with the substitution hierarchy may be difficult.
Evans et al. demonstrate this by working out exact optimal vertex, edge, and face colorings for several substitution tilings [Evans et al. 2025].

The observable in this regime is mostly combinatorial adjacency.
A proper coloring can see degree, local patch constraints, and sometimes substitution structure, but the chromatic number alone usually forgets most dynamical information about the hull.

### 3.2 Decorative and matching-rule coloring

In matching-rule theory, colors are decorations, arrows, labels, or edge marks that force local compatibility.
The coloring need not be visible in the final undecorated tiling.
Its purpose is to encode hidden hierarchy with finite local data.

Goodman-Strauss's work on matching rules and substitution tilings is a central reference [Goodman-Strauss 1998].
The guiding idea is that suitable decorations can force a substitution structure: any tiling satisfying the local matching rules must decompose into supertiles, which then decompose into larger supertiles, and so on.
In this regime, colors are not a graph-coloring solution.
They are finite witnesses of hierarchical membership.

Recent work pushes the scope of this idea.
Vereshchagin's 2026 preprint revisits and extends the Goodman-Strauss tradition by giving broad matching-rule results for substitution and hierarchical tilings under finite-local-complexity conditions [Vereshchagin 2026].
The important point for the present paper is not only the existence of decorations, but the categorical status of those decorations.
A decorated system may be MLD with the original substitution tiling, a sofic cover, or a finite extension that records hierarchy not directly visible in the undecorated tiles.

The observable in this regime is hierarchy.
Color answers: which local patches are compatible with a global substitution structure?

### 3.3 Wang-tile edge coloring and subshifts of finite type

Wang tiles are square tiles with colored edges; adjacent edges must have matching colors.
They are among the cleanest finite-state presentations of aperiodic order.
A Wang tile system defines a two-dimensional subshift of finite type: global configurations are exactly those satisfying local edge-color constraints.

The classic decision problem, going back to Wang, asks whether a finite set of Wang tiles admits a tiling of the plane and whether it can force aperiodicity.
Jeandel and Rao gave an aperiodic set of 11 Wang tiles on 4 colors and proved minimality in the sense that no Wang set with fewer than 11 tiles or fewer than 4 colors is aperiodic [Jeandel and Rao 2021].
This is a landmark for the "smallest finite alphabet" side of the subject.

Here color is not assigned after a tiling exists.
Edge colors are the local law that defines the tiling space.
The observable is computational and symbolic: finite colors encode admissibility, hierarchy, and undecidability phenomena.

### 3.4 Markov-partition and symbolic coding color

A Markov partition uses finite labels to code the orbits or regions of a dynamical system.
In tiling theory, this can turn a geometric or substitution construction into a symbolic generator.

Labbé and Selinger's Markov-partition construction for Hat tilings is a current example [Labbé and Selinger 2026].
Their construction superimposes a triangular grid on a specially colored image and reads tile orientations to produce Hat tilings.
Conversely, every valid Hat tiling arises from that construction in the sense made precise in their paper.
Color here is an algorithmic coding device: the colored partition is not merely marking an existing tiling, but generating and classifying a tiling family.

The observable in this regime is a symbolic coordinate system for a geometric or substitution hull.
The main questions are whether the coding is injective, finite-to-one, a conjugacy, an MLD presentation, or a lossy factor.

### 3.5 Spectral and diffraction color

In diffraction theory, colors often appear as weights.
Tile types, control points, or atoms receive real or complex scattering strengths, and one studies how those weights affect autocorrelation and diffraction.
Changing weights can reveal, suppress, or merge Bragg peaks; it can also produce homometric examples, where distinct structures have the same diffraction.

The Hat and Spectre literature again gives a useful modern case.
Baake, Gähler, Mazáč, and Mitchell compute diffraction spectra for Hat and Spectre tilings and relatives using model-set representatives, reprojection, and exact renormalization in internal space [Baake et al. 2025].
In that setting, color weights are not merely a visualization.
They are probes of long-range order.

The observable in this regime is spectral.
The central question is: what part of the hull is visible in the diffraction measure after assigning these weights?

## 4. A comparison framework

The five regimes can be organized by four questions.

1. What object receives colors?
2. What rule makes the coloring valid?
3. What invariant does the coloring preserve?
4. What information does the coloring forget?

The table below summarizes the comparison.

| Regime | Object colored | Validity condition | Invariant mainly seen | Commonly forgotten |
|---|---|---|---|---|
| Proper graph coloring | vertices, edges, faces, tiles | adjacent objects differ | chromatic number, local adjacency | substitution hierarchy, dynamics, spectrum |
| Matching-rule decoration | tiles, edges, collars, supertile markers | local decorations match | forced hierarchy, recognizability | undecorated symmetries, nonlocal equivalences |
| Wang edge coloring | square-tile edges | edge colors match | SFT presentation, computability, aperiodicity | geometric shape, metric realization |
| Markov-partition coding | regions or states of a generator | itinerary follows partition | symbolic dynamics, factor/conjugacy data | geometric redundancy, measure-zero ambiguities |
| Spectral weighting | control points, tile types, scatterers | weights enter autocorrelation | diffraction, dynamical spectrum projections | phase information, homometric distinctions |

The main research problem is not to choose one row as the "real" meaning of color.
It is to compare rows for the same hull.

For example, a single aperiodic family may have:

- a substitution description;
- a decorated matching-rule presentation;
- a Wang-tile or sofic cover;
- a Markov-partition coding;
- a weighted diffraction model.

The hard question is whether these descriptions are equivalent, and in which sense.
Are they conjugate as dynamical systems?
MLD as tiling spaces?
Finite extensions of one another?
Sofic factors?
Do they have the same Čech cohomology?
Do they produce the same diffraction for natural weights?
If not, what exactly is lost?

This comparison is where "color as finite observable" earns its keep.
A finite observable is not automatically faithful.
It is a controlled measurement of an infinite object.
Different finite measurements can agree on local patches and disagree on global spectrum; agree on spectrum and disagree on topology; agree on chromatic number and disagree on recognizability.

## 5. Hat and Spectre systems as a test case

The Hat and Spectre monotiles make an unusually good laboratory for this comparison.
The Hat work answered a longstanding monotile problem by exhibiting a family of aperiodic polygons, including the "hat" polykite, with substitution and metatile structure [Smith et al. 2023a].
The Spectre work then produced a strictly chiral aperiodic monotile family based on a hierarchical substitution system [Smith et al. 2023b].

These systems invite several color questions.

### 5.1 Proper colorings

One can ask for exact vertex, edge, face, or tile chromatic numbers for Hat and Spectre hulls under specified adjacency conventions.
The problem is not fully specified until the graph is fixed: tile-adjacency, vertex-adjacency of control points, edge graph of the skeleton, and face-coloring variants can differ.

The strongest public form of the problem is:

> For the Hat and Spectre tiling hulls, determine exact chromatic numbers for natural adjacency graphs, with proofs of existence, optimality, locality, and compatibility with the substitution hierarchy.

This would extend the spirit of Evans et al.'s exact computations to the modern monotile systems.

### 5.2 Decoration and hierarchy

The Hat and Spectre proofs use hierarchical structure.
The coloring question is therefore not merely whether the tilings can be properly colored.
It is whether finite labels can expose the hierarchy in a way that is local, minimal, and recoverable.

One may ask: what is the smallest decoration alphabet that forces the hierarchy?
Is the resulting decorated system MLD with the original hull, or is it a finite cover?
Can one minimize decorations without losing recognizability?

### 5.3 Markov partitions

Labbé and Selinger's Markov-partition construction makes the Hat particularly amenable to finite-state coding [Labbé and Selinger 2026].
It suggests a program:

1. Build or identify Markov partitions for monotile hulls.
2. Compare the resulting symbolic systems with substitution and metatile descriptions.
3. Determine whether the coding is one-to-one, finite-to-one, or a factor with exceptional fibers.
4. Transfer invariants across the coding.

An analogous construction for Spectre tilings would be an immediate high-value frontier.

### 5.4 Diffraction

The Hat and Spectre systems also have strong long-range-order structure.
Baake et al. compute pure-point diffraction spectra for Hat and Spectre tilings and relatives through model-set representatives and renormalization [Baake et al. 2025].
This connects the color-as-coding story to color-as-weighting: finite labels and weights can help expose the spectral organization of the same hull.

The test-case question becomes:

> Can the graph-coloring, decoration, Markov-partition, Wang-cover, and diffraction presentations of Hat/Spectre systems be placed in one commutative comparison diagram of factors, covers, local derivations, and invariants?

That diagram would be more valuable than another isolated coloring result, because it would say what each finite observable sees.

## 6. Open problems

The following problems are phrased so that each could become a standalone project.

### Problem 1. Exact Hat and Spectre chromatic numbers

Fix standard adjacency conventions for Hat and Spectre tilings.
Determine exact vertex, edge, face, and tile chromatic numbers for their hulls.
For each result, distinguish:

- existence of a coloring for every tiling in the hull;
- existence of a coloring locally derivable from the uncolored tiling;
- optimality of the number of colors;
- compatibility with substitution or metatile hierarchy.

### Problem 2. Local versus nonlocal proper colorings

For a given aperiodic hull \(X\), decide whether a proper coloring of each tiling can be chosen by a local derivation from the uncolored tiling.
If nonlocal choices are required, identify the obstruction.
This turns graph coloring into a problem about factor maps and local rules.

### Problem 3. Minimal hierarchy-forcing decorations

Given an FLC substitution tiling, compute or bound the smallest decoration alphabet that forces the substitution hierarchy by local matching rules.
Compare minimality under several metrics: number of tile decorations, number of edge colors, collar radius, recognizability depth, and whether the decorated system is MLD with the original hull.

### Problem 4. Canonical Wang encodings of monotiles

Construct Wang-tile or finite-type presentations for Hat/Spectre-like monotile hulls that preserve hierarchy and chirality as transparently as possible.
Determine whether these presentations are canonical in any useful sense, and whether they are MLD presentations, sofic covers, or finite extensions.

### Problem 5. Markov partitions for Spectre and related monotiles

Extend the Hat Markov-partition approach to Spectre tilings and to broader families of aperiodic monotiles.
Analyze the resulting symbolic systems: conjugacy, factor structure, exceptional fibers, and compatibility with substitution and diffraction.

### Problem 6. Color-weighted diffraction classification

For a fixed aperiodic hull, vary tile weights or control-point colors and classify the resulting diffraction measures.
Identify which weights reveal Bragg peaks, which create extinctions, and which produce homometric ambiguities.
Relate the classification to cohomology and factor maps where possible.

### Problem 7. Equivalence of finite observables

For a chosen family, such as Hat or Spectre tilings, build a comparison diagram among graph colorings, matching-rule decorations, Wang presentations, Markov-partition codings, and weighted diffraction.
Mark each arrow as MLD, conjugacy, finite extension, factor, or nonlocal relation.
The goal is a complete account of which finite observables see the same aperiodic order.

## 7. Conclusion

Color is a small word for several different finite measurements of aperiodic order.
In one setting, it gives a chromatic number.
In another, it forces a substitution hierarchy.
In another, it presents a subshift of finite type.
In another, it codes a Markov partition.
In another, it weights diffraction.

The resulting thesis is simple:

> A coloring of an aperiodic tiling is best understood as a finite observable of an infinite hull.

Once phrased that way, the important questions become comparative.
Which observable is faithful?
Which is local?
Which is a factor?
Which preserves cohomology, spectrum, or recognizability?
Which gives a minimal finite alphabet?
Which changes the physical diffraction pattern?

The recent convergence of exact aperiodic-tiling colorings, monotile discoveries, Markov-partition constructions, broad matching-rule theorems, and explicit Hat/Spectre diffraction makes this the right moment to organize the field around finite observables.
A public research program can now move beyond "how many colors?" toward the sharper question: what does the color know?

## References

[Baake et al. 2025] Michael Baake, Franz Gähler, Jan Mazáč, and Andrew Mitchell.
"Diffraction of the Hat and Spectre tilings and some of their relatives." arXiv:2502.03268, 2025.
Published in *Journal of Mathematical Physics* 66, 092707, 2025.
DOI: 10.1063/5.0264955. https://arxiv.org/abs/2502.03268

[Evans et al. 2025] Molly Evans, Dylan Gawlak, Christopher Ramsey, Nicolae Strungaru, and Ryan Trang.
"Colourings of aperiodic tilings." *Contributions to Discrete Mathematics* 20(2), 396--421, 2025.
DOI: 10.55016/ojs/cdm.v20i2.76852. https://cdm.ucalgary.ca/article/view/76852

[Goodman-Strauss 1998] Chaim Goodman-Strauss.
"Matching rules and substitution tilings." *Annals of Mathematics* 147(1), 181--223, 1998. https://annals.math.princeton.edu/articles/12903

[Jeandel and Rao 2021] Emmanuel Jeandel and Michaël Rao.
"An aperiodic set of 11 Wang tiles." *Advances in Combinatorics*, 2021.
DOI: 10.19086/aic.
18614. https://www.advancesincombinatorics.com/article/18614-an-aperiodic-set-of-11-wang-tiles

[Labbé and Selinger 2026] Sébastien Labbé and Peter Selinger.
"A construction of the hat tilings by a Markov partition." arXiv:2604.20964, 2026. https://arxiv.org/abs/2604.20964

[Smith et al. 2023a] David Smith, Joseph Samuel Myers, Craig S.
Kaplan, and Chaim Goodman-Strauss.
"An aperiodic monotile." arXiv:2303.10798, 2023. https://arxiv.org/abs/2303.10798

[Smith et al. 2023b] David Smith, Joseph Samuel Myers, Craig S.
Kaplan, and Chaim Goodman-Strauss.
"A chiral aperiodic monotile." arXiv:2305.17743, 2023. https://arxiv.org/abs/2305.17743

[Vereshchagin 2026] Nikolay Vereshchagin.
"Matching Rules for Substitution and Hierarchical Tilings for any Substitution with Finite Local Complexity." arXiv:2606.25005, 2026. https://arxiv.org/abs/2606.25005

Labbé and Selinger's Markov-partition construction makes the Hat particularly amenable to finite-state coding @labbeselinger2026.
It suggests a program:
