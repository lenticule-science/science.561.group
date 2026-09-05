---
title: "Post-Formation Dynamics of Black-Hole-Like Regions"
subtitle: "Continuum evaporation, information-theoretic partitions, and the limits of current causal-set treatments"
author: "ChatGPT research memo"
date: "2026-07-01"
abstract: |
  This memo surveys what happens after a black-hole-like region has formed, where the region is understood causally as the complement of the causal past of a designated exterior or future-infinity region, B = M \ I^-(exterior), or discretely as the corresponding complement of a down-set in a locally finite poset. The continuum literature richly treats post-formation dynamics through Hawking radiation, horizon thermodynamics, apparent/dynamical horizons, evaporation geometries, and changing entanglement/reconstruction partitions. By contrast, the causal-set-specific literature contains ingredients -- fixed-background Schwarzschild causal sets, causal links/horizon molecules, horizon entropy diagnostics, and generic sequential growth dynamics -- but appears not yet to contain a developed model of an already-formed finite-poset black-hole region whose interior/exterior/horizon partition evolves through Hawking-like evaporation and backreaction.
link-citations: true
reference-section-title: "References"
nocite: |
  @*
references:
  - id: hawkingEllis1973
    type: book
    title: "The Large Scale Structure of Space-Time"
    author:
      - family: Hawking
        given: S. W.
      - family: Ellis
        given: G. F. R.
    issued:
      date-parts:
        - - 1973
    publisher: "Cambridge University Press"
    publisher-place: "Cambridge"
    ISBN: "978-0521099066"

  - id: wald1984
    type: book
    title: "General Relativity"
    author:
      - family: Wald
        given: Robert M.
    issued:
      date-parts:
        - - 1984
    publisher: "University of Chicago Press"
    publisher-place: "Chicago"
    ISBN: "978-0226870335"

  - id: bekenstein1973
    type: article-journal
    title: "Black Holes and Entropy"
    author:
      - family: Bekenstein
        given: Jacob D.
    issued:
      date-parts:
        - - 1973
    container-title: "Physical Review D"
    volume: "7"
    issue: "8"
    page: "2333-2346"
    DOI: "10.1103/PhysRevD.7.2333"

  - id: bardeenCarterHawking1973
    type: article-journal
    title: "The Four Laws of Black Hole Mechanics"
    author:
      - family: Bardeen
        given: J. M.
      - family: Carter
        given: B.
      - family: Hawking
        given: S. W.
    issued:
      date-parts:
        - - 1973
    container-title: "Communications in Mathematical Physics"
    volume: "31"
    issue: "2"
    page: "161-170"
    DOI: "10.1007/BF01645742"

  - id: hawking1975
    type: article-journal
    title: "Particle Creation by Black Holes"
    author:
      - family: Hawking
        given: S. W.
    issued:
      date-parts:
        - - 1975
    container-title: "Communications in Mathematical Physics"
    volume: "43"
    issue: "3"
    page: "199-220"
    DOI: "10.1007/BF02345020"

  - id: hawking1976
    type: article-journal
    title: "Breakdown of Predictability in Gravitational Collapse"
    author:
      - family: Hawking
        given: S. W.
    issued:
      date-parts:
        - - 1976
    container-title: "Physical Review D"
    volume: "14"
    issue: "10"
    page: "2460-2473"
    DOI: "10.1103/PhysRevD.14.2460"

  - id: ashtekarKrishnan2004
    type: article-journal
    title: "Isolated and Dynamical Horizons and Their Applications"
    author:
      - family: Ashtekar
        given: Abhay
      - family: Krishnan
        given: Badri
    issued:
      date-parts:
        - - 2004
    container-title: "Living Reviews in Relativity"
    volume: "7"
    issue: "1"
    page: "10"
    DOI: "10.12942/lrr-2004-10"
    URL: "https://link.springer.com/article/10.12942/lrr-2004-10"

  - id: hayward2006
    type: article-journal
    title: "Formation and Evaporation of Nonsingular Black Holes"
    author:
      - family: Hayward
        given: Sean A.
    issued:
      date-parts:
        - - 2006
    container-title: "Physical Review Letters"
    volume: "96"
    issue: "3"
    page: "031103"
    DOI: "10.1103/PhysRevLett.96.031103"

  - id: lesourd2019
    type: article-journal
    title: "Causal Structure of Evaporating Black Holes"
    author:
      - family: Lesourd
        given: Martin
    issued:
      date-parts:
        - - 2019
    container-title: "Classical and Quantum Gravity"
    volume: "36"
    issue: "2"
    page: "025007"
    DOI: "10.1088/1361-6382/aaf5f8"
    URL: "https://arxiv.org/abs/1808.07303"

  - id: page1993
    type: article-journal
    title: "Information in Black Hole Radiation"
    author:
      - family: Page
        given: Don N.
    issued:
      date-parts:
        - - 1993
    container-title: "Physical Review Letters"
    volume: "71"
    issue: "23"
    page: "3743-3746"
    DOI: "10.1103/PhysRevLett.71.3743"
    URL: "https://arxiv.org/abs/hep-th/9306083"

  - id: susskindThorlaciusUglum1993
    type: article-journal
    title: "The Stretched Horizon and Black Hole Complementarity"
    author:
      - family: Susskind
        given: Leonard
      - family: Thorlacius
        given: Larus
      - family: Uglum
        given: John
    issued:
      date-parts:
        - - 1993
    container-title: "Physical Review D"
    volume: "48"
    issue: "8"
    page: "3743-3761"
    DOI: "10.1103/PhysRevD.48.3743"
    URL: "https://arxiv.org/abs/hep-th/9306069"

  - id: almheiriMarolfPolchinskiSully2013
    type: article-journal
    title: "Black Holes: Complementarity or Firewalls?"
    author:
      - family: Almheiri
        given: Ahmed
      - family: Marolf
        given: Donald
      - family: Polchinski
        given: Joseph
      - family: Sully
        given: James
    issued:
      date-parts:
        - - 2013
    container-title: "Journal of High Energy Physics"
    volume: "2013"
    issue: "2"
    page: "062"
    DOI: "10.1007/JHEP02(2013)062"
    URL: "https://arxiv.org/abs/1207.3123"

  - id: almheiriEngelhardtMarolfMaxfield2019
    type: article-journal
    title: "The Entropy of Bulk Quantum Fields and the Entanglement Wedge of an Evaporating Black Hole"
    author:
      - family: Almheiri
        given: Ahmed
      - family: Engelhardt
        given: Netta
      - family: Marolf
        given: Donald
      - family: Maxfield
        given: Henry
    issued:
      date-parts:
        - - 2019
    container-title: "Journal of High Energy Physics"
    volume: "2019"
    issue: "12"
    page: "063"
    DOI: "10.1007/JHEP12(2019)063"
    URL: "https://arxiv.org/abs/1905.08762"

  - id: penington2020
    type: article-journal
    title: "Entanglement Wedge Reconstruction and the Information Paradox"
    author:
      - family: Penington
        given: Geoffrey
    issued:
      date-parts:
        - - 2020
    container-title: "Journal of High Energy Physics"
    volume: "2020"
    issue: "9"
    page: "002"
    DOI: "10.1007/JHEP09(2020)002"
    URL: "https://arxiv.org/abs/1905.08255"

  - id: almheiriHartmanMaldacenaShaghoulianTajdini2020
    type: article-journal
    title: "Replica Wormholes and the Entropy of Hawking Radiation"
    author:
      - family: Almheiri
        given: Ahmed
      - family: Hartman
        given: Thomas
      - family: Maldacena
        given: Juan
      - family: Shaghoulian
        given: Edgar
      - family: Tajdini
        given: Amirhossein
    issued:
      date-parts:
        - - 2020
    container-title: "Journal of High Energy Physics"
    volume: "2020"
    issue: "5"
    page: "013"
    DOI: "10.1007/JHEP05(2020)013"
    URL: "https://arxiv.org/abs/1911.12333"

  - id: surya2019
    type: article-journal
    title: "The Causal Set Approach to Quantum Gravity"
    author:
      - family: Surya
        given: Sumati
    issued:
      date-parts:
        - - 2019
    container-title: "Living Reviews in Relativity"
    volume: "22"
    issue: "1"
    page: "5"
    DOI: "10.1007/s41114-019-0023-1"
    URL: "https://arxiv.org/abs/1903.11544"

  - id: rideoutSorkin2000
    type: article-journal
    title: "Classical Sequential Growth Dynamics for Causal Sets"
    author:
      - family: Rideout
        given: David P.
      - family: Sorkin
        given: Rafael D.
    issued:
      date-parts:
        - - 2000
    container-title: "Physical Review D"
    volume: "61"
    issue: "2"
    page: "024002"
    DOI: "10.1103/PhysRevD.61.024002"
    URL: "https://arxiv.org/abs/gr-qc/9904062"

  - id: heRideout2009
    type: article-journal
    title: "A Causal Set Black Hole"
    author:
      - family: He
        given: Song
      - family: Rideout
        given: David
    issued:
      date-parts:
        - - 2009
    container-title: "Classical and Quantum Gravity"
    volume: "26"
    issue: "12"
    page: "125015"
    DOI: "10.1088/0264-9381/26/12/125015"
    URL: "https://arxiv.org/abs/0811.4235"

  - id: douSorkin2003
    type: article-journal
    title: "Black-Hole Entropy as Causal Links"
    author:
      - family: Dou
        given: Djamel
      - family: Sorkin
        given: Rafael D.
    issued:
      date-parts:
        - - 2003
    container-title: "Foundations of Physics"
    volume: "33"
    issue: "2"
    page: "279-296"
    DOI: "10.1023/A:1023781022519"
    URL: "https://arxiv.org/abs/gr-qc/0302009"

  - id: bartonEtAl2019
    type: article-journal
    title: "Horizon Molecules in Causal Set Theory"
    author:
      - family: Barton
        given: Christopher
      - family: Counsell
        given: Andrew
      - family: Dowker
        given: Fay
      - family: Gould
        given: Dewi S. W.
      - family: Jubb
        given: Ian
      - family: Taylor
        given: Gwylim
    issued:
      date-parts:
        - - 2019
    container-title: "Physical Review D"
    volume: "100"
    issue: "12"
    page: "126008"
    DOI: "10.1103/PhysRevD.100.126008"
    URL: "https://arxiv.org/abs/1909.08620"

  - id: machetWang2021
    type: article-journal
    title: "On the Horizon Entropy of a Causal Set"
    author:
      - family: Machet
        given: Ludovico
      - family: Wang
        given: Jinzhao
    issued:
      date-parts:
        - - 2021
    container-title: "Classical and Quantum Gravity"
    volume: "38"
    issue: "8"
    page: "085004"
    DOI: "10.1088/1361-6382/abe957"
    URL: "https://arxiv.org/abs/2012.06212"

  - id: asato2019
    type: article-journal
    title: "Black Holes and Singularities in Causal Set Gravity"
    author:
      - family: Asato
        given: Yu
    issued:
      date-parts:
        - - 2019
    container-title: "Classical and Quantum Gravity"
    volume: "36"
    issue: "19"
    page: "195009"
    DOI: "10.1088/1361-6382/ab3c18"
    URL: "https://arxiv.org/abs/1905.03827"

  - id: homsakVeroni2024
    type: article-journal
    title: "Boltzmannian State Counting for Black Hole Entropy in Causal Set Theory"
    author:
      - family: Homšak
        given: Vid
      - family: Veroni
        given: Stefano
    issued:
      date-parts:
        - - 2024
    container-title: "Physical Review D"
    volume: "110"
    issue: "2"
    page: "026015"
    DOI: "10.1103/PhysRevD.110.026015"
    URL: "https://arxiv.org/abs/2404.11670"

  - id: dowkerZalel2017
    type: article-journal
    title: "Evolution of Universes in Causal Set Cosmology"
    author:
      - family: Dowker
        given: Fay
      - family: Zalel
        given: Stav
    issued:
      date-parts:
        - - 2017
    container-title: "Comptes Rendus Physique"
    volume: "18"
    issue: "3-4"
    page: "246-253"
    DOI: "10.1016/j.crhy.2017.03.002"
    URL: "https://arxiv.org/abs/1703.07556"

  - id: eichhornGamitoStokes2026
    type: article
    title: "Towards Black-Hole Horizons and Geodesic Focusing in Causal Sets"
    author:
      - family: Eichhorn
        given: Astrid
      - family: Gamito
        given: Pedro
      - family: Stokes
        given: Nawder
    issued:
      date-parts:
        - - 2026
    archive: "arXiv"
    archive_location: "2605.06813"
    URL: "https://arxiv.org/abs/2605.06813"
type: research-article

---

# Executive answer

The continuum literature has a rich answer to the post-formation question: after collapse, a black hole radiates, loses mass, and forces one to distinguish the global event horizon from quasi-local apparent, trapping, isolated, or dynamical horizons. However, the exact object in the prompt, \(B = M \setminus I^-(\mathscr I^+)\) or \(M \setminus J^-(\mathscr I^+)\), is globally and teleologically defined. It is not normally treated as a locally updated object that one evolves by a differential or stochastic rule after it first appears. Its time-dependent content is instead studied through cross-sections, horizon world-tubes, semiclassical evaporation geometries, and causal diagrams [@wald1984; @ashtekarKrishnan2004; @lesourd2019].

For causal sets and finite posets, the result is much thinner. Causal set theory supplies the correct kind of base object -- a locally finite partial order whose order relation encodes causal precedence [@surya2019]. It also supplies generic stochastic growth dynamics [@rideoutSorkin2000], fixed-background Schwarzschild causal-set constructions [@heRideout2009], causal-link or horizon-molecule models of horizon entropy [@douSorkin2003; @bartonEtAl2019; @homsakVeroni2024], and new discrete horizon diagnostics [@eichhornGamitoStokes2026]. But I did not find a developed causal-set treatment of an already-formed finite-poset black-hole region \(B_n = C_n \setminus \downarrow E_n\) that then evaporates with backreaction while its interior/exterior/horizon partition evolves step-by-step.

# 1. The target object and why it is hard to make local

In asymptotically flat continuum general relativity, a black-hole region is usually defined using future null infinity: the black hole is the complement of the causal past of the asymptotic escape region, and the event horizon is its boundary. In the notation relevant here, one writes approximately

\[
B = M \setminus J^-(\mathscr I^+), \qquad \mathcal H^+ = \partial J^-(\mathscr I^+),
\]

with chronological-past variants such as \(I^-\) differing by boundary conventions. Standard references develop this through the global causal structure of spacetime rather than through a local horizon-evolution law [@hawkingEllis1973; @wald1984].

This global definition is the first conceptual obstruction to a simple "post-collapse update" story. Ashtekar and Krishnan explicitly motivate isolated and dynamical horizons by the inadequacy of the future event horizon for dynamical situations: event horizons refer to future null infinity and are therefore teleological, while dynamical horizons are quasi-local hypersurfaces that can be tracked during numerical evolution, collapse, accretion, merger, and evaporation-like settings [@ashtekarKrishnan2004].

For a finite causal set \(C\), the direct order-theoretic analog is clear once an exterior or future-infinity subset \(E\subset C\) is specified:

\[
\downarrow E = \{x\in C : \exists e\in E,\ x\preceq e\}, \qquad B = C \setminus \downarrow E.
\]

But the same teleological problem appears in discrete form. If \(C\) is still growing, the ultimate exterior/future-infinity set \(E\) is not generally known at intermediate stages. Thus a causal-set model that literally evolves \(B_n=C_n\setminus\downarrow E_n\) must either provide a provisional rule for \(E_n\), use an alternative quasi-local horizon diagnostic, or work only after the full causet has already been generated.

# 2. Continuum post-formation dynamics

## 2.1 Classical horizon mechanics and the baseline area law

Before Hawking radiation, black-hole post-formation dynamics was organized around horizon mechanics. Bardeen, Carter, and Hawking formulated the four laws of black-hole mechanics, including the classical nondecrease of event-horizon area under appropriate energy and cosmic-censorship assumptions [@bardeenCarterHawking1973]. Bekenstein argued that black holes carry entropy proportional to horizon area, turning horizon area into a thermodynamic state variable rather than merely a geometric one [@bekenstein1973].

This gives the classical baseline: once formed, and assuming suitable classical matter conditions, a black hole can grow by accretion or merger, while the event-horizon area does not decrease. That statement is not the semiclassical evaporation story; it is precisely what Hawking radiation disrupts.

## 2.2 Hawking radiation and mass loss

Hawking's 1975 calculation showed that quantum fields on a black-hole background cause black holes to emit approximately thermally, with a temperature set by surface gravity [@hawking1975]. In the usual Schwarzschild heuristic, the mass decreases, so the characteristic radius \(r_s=2GM\) decreases as well. Semiclassically, this turns the post-formation black hole into an evaporating object rather than a static causal region.

The subtle point is which horizon is shrinking. In dynamical and semiclassical models, apparent or trapping horizons can be locally followed and can shrink under negative energy flux through the horizon. The global event horizon is harder: it is determined by the entire future causal structure, and in evaporation geometries it need not coincide with the apparent horizon. This is one reason the dynamical-horizon literature exists at all [@ashtekarKrishnan2004].

## 2.3 Formation-to-evaporation spacetimes

Some continuum models explicitly describe formation followed by evaporation. Hayward's nonsingular model gives a regular spacetime describing formation from an initial vacuum region, a static or quasi-static black-hole phase, and subsequent evaporation back toward a vacuum region [@hayward2006]. Such models are useful because they explicitly treat the causal diagram and horizon structure across an entire lifecycle, even if they are effective or model geometries rather than derivations from a complete quantum-gravity theory.

Lesourd's work is especially relevant to the causal-region definition in the prompt. It studies the global causal structure of fully evaporating black-hole spacetimes and proves that assumptions meant to capture complete evaporation are in tension with causal simplicity or causal continuity [@lesourd2019]. Thus, at the level of \(B=M\setminus I^-(\mathscr I^+)\), the endpoint of evaporation is not merely a local shrinking of a surface; it threatens the global causal regularity needed to make the definition behave cleanly.

# 3. Information paradox: post-collapse dynamics of the interior/exterior split

Hawking's original information-loss claim was sharpened in the 1976 "breakdown of predictability" paper: if a pure state collapses and the black hole evaporates thermally, the final state appears mixed, so ordinary unitary predictability fails [@hawking1976]. Page reframed the unitarity-preserving alternative: if black-hole formation and evaporation are governed by an S-matrix, the Hawking radiation must eventually carry information, with the characteristic entropy behavior now known as the Page curve [@page1993].

Black-hole complementarity treats the horizon/interior/exterior division as description-dependent. Susskind, Thorlacius, and Uglum formulated a stretched-horizon description appropriate for a distant observer, in which the horizon possesses microscopic degrees of freedom and dissipative behavior [@susskindThorlaciusUglum1993]. This is a post-formation dynamics of the horizon description, but not a literal evolution law for the event-horizon set \(B\).

The firewall argument of Almheiri, Marolf, Polchinski, and Sully shows that three desiderata cannot all be maintained: purity of Hawking radiation, validity of low-energy effective field theory near the horizon, and smooth horizon crossing for the infalling observer [@almheiriMarolfPolchinskiSully2013]. In this view, the late-stage horizon is not just a passive boundary of a fixed region; the consistency of the interior/exterior partition itself is under pressure.

The island and replica-wormhole literature changes the partition in a different way. Almheiri, Engelhardt, Marolf, and Maxfield show that quantum extremal surfaces and entanglement wedges can undergo Page-time transitions in evaporating black-hole setups [@almheiriEngelhardtMarolfMaxfield2019]. Penington similarly derives the Page curve using entanglement-wedge reconstruction and finds that, after Page time, part of the interior is encoded in the early Hawking radiation [@penington2020]. Almheiri, Hartman, Maldacena, Shaghoulian, and Tajdini show that replica wormholes supply new gravitational saddles leading to the island rule for Hawking-radiation entropy [@almheiriHartmanMaldacenaShaghoulianTajdini2020].

For the prompt's partition question, the key point is this: islands do not normally say that the set \(B=M\setminus I^-(\mathscr I^+)\) locally shrinks as a poset or manifold subset. They say that the quantum reconstruction/entanglement partition changes. Part of what semiclassically looks interior becomes part of the radiation's entanglement wedge.

# 4. Causal-set-specific literature

## 4.1 General causal sets and sequential growth

Causal set theory replaces continuum spacetime with a locally finite partial order, with order representing causal precedence and local finiteness representing discreteness [@surya2019]. Rideout and Sorkin's classical sequential growth dynamics gives stochastic, element-by-element growth laws for causal sets subject to discrete covariance and causality conditions [@rideoutSorkin2000].

This is close in mathematical spirit to the requested finite-poset setting. But the classical sequential growth literature, by itself, does not specify a black-hole region, a future-infinity/exterior subset, a Hawking flux, backreaction, or a time-dependent horizon partition. It is a dynamics of causet growth, not a post-collapse black-hole evaporation model.

## 4.2 Fixed-background causal-set black holes

He and Rideout constructed the causal structure of Schwarzschild spacetime in a form usable for causal-set simulations. Their paper gives an algorithm for deciding causal relations between events in Schwarzschild spacetime, with the stated motivation of enabling simulations of non-conformally flat spacetimes and eventually studying black-hole entropy and Hawking radiation on a four-dimensional causal-set black hole [@heRideout2009].

This is important but not yet the requested object. It is not a model in which a finite causal set dynamically collapses, forms \(B_n\), radiates, backreacts, and updates the order-theoretic interior/exterior split. It is a way of obtaining or analyzing causal order on a fixed Schwarzschild background.

Asato later emphasized that a precise definition of a black hole had long been absent in causal-set theory and proposed a definition based on singular antichains [@asato2019]. This is directly relevant to the definitional gap, but again it is not a completed post-formation evaporation dynamics.

## 4.3 Horizon molecules and causal links

The most developed black-hole-related causal-set literature concerns entropy. Dou and Sorkin model a black-hole spacetime as a causal set and count certain causal links crossing the horizon near a spacelike or null hypersurface \(\Sigma\), finding proportionality to the horizon area on \(\Sigma\) [@douSorkin2003]. This makes the horizon a discrete, link-sensitive structure rather than only a smooth surface.

Barton, Counsell, Dowker, Gould, Taylor, and Jubb generalize this to horizon molecules associated with any causal horizon and its intersection with a spacelike hypersurface; in the continuum limit, the expected count scales like horizon area in discreteness units, up to a dimension-dependent factor [@bartonEtAl2019]. Machet and Wang analyze horizon entropy definitions for causal sets and show that a null-hypersurface extension of horizon molecules fails to yield an entropy local to the hypersurface-horizon intersection in the same way, while spacetime mutual information in truncated causal diamonds can recover an area-scaling result [@machetWang2021].

Homšak and Veroni provide a 2024 numerical study of black-hole thermodynamics in causal set theory, simulating large Schwarzschild causal sets and studying entropy through horizon molecules. They report consistency with the Bekenstein-Hawking formula up to a dimensionless discreteness-scale constant, locate the molecules within a few Planck lengths of the horizon in the model, and discuss possible implications such as a finite temperature cutoff or prevention of complete evaporation [@homsakVeroni2024].

These works are the closest discrete analogues of a changing horizon microstructure. But their main object is the kinematical or statistical structure of horizon-crossing relations, usually in a background approximating a known black-hole spacetime. They do not supply a full causal-set evolution of the black-hole region under evaporation.

## 4.4 New discrete horizon diagnostics

Eichhorn, Gamito, and Stokes' 2026 preprint is the most directly relevant recent causal-set work for the horizon-identification problem. It asks how to identify a discrete horizon in a causal set, constructs a local diagnostic to approximate the global event horizon, studies apparent-horizon detection using discrete null-geodesic "ladders," finds a discrete counterpart of expansion changing sign across the horizon, and constructs a portion of a discrete horizon in a 1+1-dimensional black-hole toy model [@eichhornGamitoStokes2026].

This is an important step toward the kind of poset-level horizon partition the prompt asks about. But its contribution is diagnostic and kinematical: detecting or reconstructing a horizon in a causal set. It is not yet a theory of post-collapse evaporation of a finite-poset black-hole region.

## 4.5 Causal-set cosmology and black-hole singularity transitions

Dowker and Zalel discuss causal-set cosmology in which a black-hole singularity can seed a new universe; after such a creation event, classical sequential growth parameters are renormalized [@dowkerZalel2017]. This is a genuine causal-set growth/dynamics paper involving black-hole singularities, but its target is cosmological reproduction or baby-universe creation after a singularity, not the evaporation of an exterior-defined black-hole region.

# 5. Does the interior/exterior/horizon partition itself change?

The answer depends on which partition is meant.

| Setting | Does the partition change? | How it changes | Main caveat |
|---|---:|---|---|
| Classical event horizon | Yes, as a global four-dimensional boundary with changing cross-sections | Grows under accretion/merger subject to classical assumptions | Defined teleologically from future infinity, not locally updated [@bardeenCarterHawking1973; @wald1984] |
| Apparent/trapping/dynamical horizons | Yes | Locally tracked; can grow under positive flux and shrink under negative energy flux in evaporation models | Not identical to the event horizon [@ashtekarKrishnan2004] |
| Semiclassical evaporation geometries | Yes | Mass, apparent horizon, causal diagram, and endpoint structure change | Full evaporation stresses global causal regularity [@hawking1975; @hayward2006; @lesourd2019] |
| Information-theoretic partition | Yes | Complementarity, firewalls, islands, and entanglement wedges change what counts as accessible/interior/exterior information | Usually not a literal evolution of \(B=M\setminus I^-(\mathscr I^+)\) [@susskindThorlaciusUglum1993; @almheiriMarolfPolchinskiSully2013; @penington2020] |
| Causal-set horizon molecules | Partly | The counted links/molecules depend on the horizon and hypersurface intersection | Entropy/horizon microstructure, not full evaporation dynamics [@douSorkin2003; @bartonEtAl2019; @homsakVeroni2024] |
| Causal-set finite-poset black-hole region \(B_n=C_n\setminus\downarrow E_n\) | Not found as a developed literature | No mature model located of formation plus evaporation plus backreacting order partition | Current work is mostly fixed-background, diagnostic, or entropy-focused [@heRideout2009; @asato2019; @eichhornGamitoStokes2026] |

# 6. The precise finite-poset gap

A direct realization of the prompt would require at least the following ingredients:

1. a growing or otherwise dynamically updated causal set \(C_n\);
2. an exterior/future-infinity proxy \(E_n\) or a discrete quasi-local horizon criterion;
3. a black-hole subset \(B_n=C_n\setminus\downarrow E_n\);
4. a rule by which Hawking-like emission and negative-energy/backreaction effects change the causal order, the cardinality, or the horizon classification;
5. an account of information flow or entanglement/reconstruction compatible with the finite-poset structure.

The causal-set literature has pieces of this list but not the integrated construction. Sequential growth gives item 1 in a cosmological setting [@rideoutSorkin2000]. Fixed Schwarzschild causets and horizon diagnostics support items 2 and 3 kinematically [@heRideout2009; @eichhornGamitoStokes2026]. Horizon molecules and causal links support a candidate microscopic horizon entropy structure [@douSorkin2003; @bartonEtAl2019; @homsakVeroni2024]. What appears absent is item 4, and with it a genuine post-formation causal-set evaporation process. Item 5 is also absent in a specifically causal-set black-hole evaporation setting, though continuum/holographic island work gives strong analogical pressure [@almheiriEngelhardtMarolfMaxfield2019; @almheiriHartmanMaldacenaShaghoulianTajdini2020].

# 7. Conclusion

In continuum GR and semiclassical gravity, post-collapse dynamics is well-developed: black holes radiate, lose mass, acquire changing apparent/trapping/dynamical horizons, and generate information-theoretic puzzles whose proposed resolutions alter the operational partition between interior, exterior, horizon, and radiation. But the event-horizon-defined black-hole region \(B=M\setminus I^-(\mathscr I^+)\) is a global object; the literature rarely treats it as a locally evolving set once formed.

In causal set theory, the precise finite-poset version remains mostly open. Existing papers provide black-hole causal-set backgrounds, causal-link entropy, horizon molecules, numerical Schwarzschild causal-set thermodynamics, generic sequential growth dynamics, and preliminary discrete horizon diagnostics. I found no real, checkable literature that gives a mature post-formation dynamics of a finite-poset black-hole region \(B_n=C_n\setminus\downarrow E_n\), with Hawking evaporation and a changing up-set/down-set horizon partition. The causal-set-specific answer is therefore: there are important ingredients and recent progress on horizon identification, but little to nothing yet at the exact level of an evolving black-hole-region poset.
