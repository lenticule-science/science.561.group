---
title: "Site"
id: site
description: "A Site is a small category C equipped with a Grothendieck topology J — the skeleton from which a topos of sheaves is built by sheafification, encoding what constitutes sufficient covering evidence at each object."
defines: Site
produces: topos
requires: [base-category, covering-topology]
enables: [arena, foundation]
contains: area
component-of: relational-universe
fiber-of: relational-universe
base: relational-history-site
element-of: entity
date-created: 2026-03-19
date-modified: 2026-03-19
params:
  base-category: relational-universe
  covering-topology: relational-universe-morphism
output: relational-universe
ast:
  grothendieck-site:
    - base-category
    - covering-topology:
        - base-category
    - boundary-sieve:
        - base-category
        - covering-topology
---

# Site

## What this is

A **Site** is a pair (C, J) where C is a small category and J is a **Grothendieck topology** on C: an assignment to each object c ∈ C of a collection J(c) of **covering sieves** satisfying three axioms.

A **sieve** on c ∈ C is a downward-closed set of morphisms with codomain c: if f: d → c is in the sieve and g: e → d is any morphism, then f ∘ g: e → c is also in the sieve. A covering sieve is a sieve J judges to be "enough" evidence for c.

## Formal definition

A Grothendieck topology J on C assigns to each c ∈ C a collection J(c) of sieves on c satisfying:

1. **Maximality**: the maximal sieve on c (containing all morphisms into c) is in J(c).
2. **Stability**: if S ∈ J(c) and f: d → c is any morphism, then the pullback sieve f*(S) = {g: e → d | f ∘ g ∈ S} is in J(d).
3. **Transitivity**: if S ∈ J(c) and R is any sieve on c such that f*(R) ∈ J(d) for every f: d → c in S, then R ∈ J(c).

The pair (C, J) is the site. The **sheaves** on (C, J) are the presheaves F: C^op → Set that satisfy the gluing condition for every covering sieve: if sections {x_f ∈ F(d) | f: d → c ∈ S} are compatible (agree on all further restrictions), there exists a unique x ∈ F(c) restricting to each x_f. The category Sh(C, J) of all sheaves on (C, J) is a Grothendieck topos.

The site is not itself the topos. It is the generative skeleton from which the topos is built by sheafification — the left adjoint to the inclusion Sh(C,J) ↪ PSh(C) that forces the gluing condition.

## What the topology encodes

The topology J encodes an epistemology: what constitutes sufficient evidence for a claim at c. A covering sieve on c is a family of "probes" into c that together witness everything worth knowing about c. Different topologies on the same category C generate different toposes with different internal logics — the topology determines which statements can be "seen" locally and which require global evidence.

The three axioms have the following readings:
- Maximality: the full collection of all morphisms into c always counts as sufficient evidence.
- Stability: if a family witnesses c, then restricting to any subcone d → c still witnesses d.
- Transitivity: if a family witnesses c, and each member of the family is itself witnessed, then the composition witnesses c.

## The relational history site

The specific site underlying this system is the **relational history site** (T, J), where:

- T is the history category: objects are histories (finite commutation-equivalence classes of step sequences), morphisms are prefix extensions.
- J is the commutation topology: a family of morphisms into a history t covers t iff they form a commutation partition — they account for all ways to decompose t into a preceding context plus one step, up to commutation equivalence.

The topos R = Sh(T, J) built on this site is the relational universe. The site encodes the commutation structure of history: what it means for a family of local observations (one per commutation class) to jointly witness a global state.

## Key references

Grothendieck et al., SGA 4 (1963–72) — original definition of sites and Grothendieck toposes. Johnstone, *Sketches of an Elephant* (2002), Part C — comprehensive treatment of sites, topologies, and sheaf constructions. Mac Lane & Moerdijk, *Sheaves in Geometry and Logic* (1992), Chapter III.

## Relation to this system

The site (T, J) is the base structure of the relational universe. It is not the full ambient [Vessel](../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/glossary/terms/vessel.md) — that is the topos Sh(T, J) — but it is the foundational skeleton that determines the vessel's structure. Every proposition in R is a sheaf on (T, J), and its truth value at a history t is its section at t. The nuclei σ and Δ arise as Lawvere-Tierney topologies on Sh(T, J) — endomorphisms of the subobject classifier that are themselves determined by the site's commutation structure.

The FARS locale is a site in the informal sense: its `math/` objects are the objects, its `AGENTS.md` and `SOUL.md` coverings define what constitutes sufficient institutional recognition. Making this informal structure precise — identifying the explicit category T and topology J for each locale — is an open research question.

## Directed stratified site: self-similarity of the hyperverse tower

**Source:** [Directed Stratified Site](../../documents/articles/notes/directed-stratified-site.md).

The relational history site (T, J) carries two structures beyond a bare Grothendieck site:

- **Stratification**: the depth filtration T^(0) ⊆ T^(1) ⊆ ... on the history category, with each stratum indexed by a natural number (the history's depth in the prefix order)
- **Directedness**: the prefix order on histories is irreversible — histories only grow; there are no morphisms that shorten a history

The directed stratified site conjecture observes that the hyperverse tower carries the same two structures at the meta-level:

| Level | Site | Stratification | Directedness |
|---|---|---|---|
| Ground level | History site (T, J) | Depth filtration T^(n) by depth | Prefix order: histories only grow |
| Meta-level | Tower site (category of relational universes, density covers) | Tower level n = stratum | Tower inclusions are inflationary and non-invertible at every finite level |

**The self-similarity observation.** The sheafification construction Sh(-, -) carries directed stratified sites to directed stratified sites: the relational universe R = Sh(T, J) is itself a directed stratified site (it contains the fiber-level stratification and inherits directedness from the nuclear structure), and the hyperverse tower R^(1) = Sh(meta-site) is its meta-level counterpart. The passage from tower level n to level n+1 is the same type of construction as the passage from the history site (T, J) to the relational universe R = Sh(T, J).

This makes the hyperverse tower **self-similar to its own base**: the site (T, J) at the base of the construction and the tower site at the meta-level are both instances of the same concept — directed stratified site — and the Sh(-, -) functor that produces the relational universe from its base is the same type of operation that produces the hyperverse tower from its meta-level site.

**Institutional reading.** An institutional vessel is a site in the directed-stratified sense: the agent roster and operational history form the objects (histories/universes), the recognition topology forms the covering sieves (what constitutes sufficient institutional evidence), the seniority/hierarchy provides the stratification (depth levels of institutional authority), and the irreversibility of time and precedent provides the directedness (institutional facts only accumulate; they do not unwind). The sequence of vessels — from the founding charter through successive operational stages — is the meta-level directed stratified site, just as the hyperverse tower is the meta-level directed stratified site for the relational universe.

**Open question on FARS locales.** The conjecture implies that every FlatfileAgentialResourceSystemLocale has a well-defined underlying directed stratified site — not just a bare Grothendieck site, but one equipped with the depth stratification (priority levels, operational stages) and irreversibility structure. The directed-stratified reading answers the open question about whether the FARS locale has a well-defined underlying site: yes, and the sequence of all FARS locales (across the operational tower) is a meta-level directed stratified site, self-similar to the individual locale sites.

**Status.** Structural observation (conjecture). The self-similarity is visible and motivates the conjecture; formal proof depends on: (1) a precise definition of directed stratified site with correct axioms, (2) (∞,1)-categorical infrastructure for the meta-level case, and (3) verification that the subtopos-join formulation of the meta-covering satisfies the sheaf condition.

*Source.* Directed Stratified Site conjecture from [Directed Stratified Site §Conjecture](../../documents/articles/notes/directed-stratified-site.md). Status: structural observation. $\square$

## Open questions

- Whether each covering sieve in J should be read as "witnessing one of the vessel's possible histories" (epistemic reading) or as "filtering which observations are relevant" (operational reading), and whether these readings agree formally.
- Whether every FlatfileAgentialResourceSystemLocale has a well-defined underlying site (C, J) in the Grothendieck sense, or whether the site concept applies only at the mathematical level of the relational universe.
- The precise relationship between the commutation topology J and the constitutive rules of the institutional [Vessel](../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/glossary/terms/vessel.md) — whether covering sieves are formally the same as institutional recognition acts.
