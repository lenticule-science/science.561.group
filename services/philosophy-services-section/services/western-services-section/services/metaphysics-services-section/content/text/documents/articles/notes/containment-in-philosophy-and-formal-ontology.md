---
title: "Containment in Philosophy and Formal Ontology"
description: "Containment is not parthood — being inside something is a spatial relation, not a compositional one. Aristotle, Casati-Varzi, DOLCE, and BFO converge on this distinction."
date-created: 2026-04-05
text-type: survey
claim: "Containment is a spatial location relation distinct from mereological parthood. The container and its contents are ontologically separate."
addresses: container
references:
  aristotle-physics:
    authors: ["Aristotle"]
    title: "Physics"
    publication: "In Barnes ed., Princeton UP"
    year: 1984
    note: "Book IV on place and vessel (aggeion)"
  casati-varzi-1999:
    authors: ["Roberto Casati", "Achille C. Varzi"]
    title: "Parts and Places: The Structures of Spatial Representation"
    publication: "MIT Press, Bradford Books"
    year: 1999
  casati-varzi-1994:
    authors: ["Roberto Casati", "Achille C. Varzi"]
    title: "Holes and Other Superficialities"
    publication: "MIT Press"
    year: 1994
  dolce-d17:
    authors: ["Claudio Masolo", "Stefano Borgo", "Aldo Gangemi", "Nicola Guarino", "Alessandro Oltramari", "Luc Schneider"]
    title: "WonderWeb Deliverable D17"
    publication: "ISTC-CNR"
    year: 2003
    note: "v. 2.1, 29 May 2003"
  bfo-2020:
    authors: ["Barry Smith et al."]
    title: "Basic Formal Ontology 2020"
    publication: "ISO/IEC 21838-2"
    year: 2020
---

This text collects the philosophical and formal-ontological sources behind the [container](../../../../../terms/container.md) concept. The core claim: containment is not parthood. Being inside something is a spatial relation, not a compositional one.

## Aristotle: vessel as moved place

Aristotle, *Physics* IV.4, 212a14–20 (Hardie–Gaye translation):

> "just as the vessel is transportable place, so place is a non-portable vessel."

*Aggeion* (vessel) is to *topos* (place) as moveable is to immoveable. Both are the enclosing boundary of what they contain. Place cannot be relocated; the vessel can. The definitive formulation at 212a20: "place is the innermost motionless boundary of what contains it." The vessel is the innermost boundary that *can* move — a mobile container.

At *Physics* IV.2, 210b27, Aristotle establishes the container/contents distinction:

> "since the vessel is no part of what is in it (what contains something primarily is different from what is contained), place could not be either the matter or the form of the thing contained."

Form (*morphe*) and matter (*hyle*) are inseparable from the thing they belong to. The vessel is separable — remove the contents, the vessel remains. The vessel is in a third ontological category, neither the form nor the matter of its contents.

At *Physics* IV.3, 210a14–24, Aristotle distinguishes eight senses of "in." The first seven are derivative: finger in hand (part in whole), form in matter, species in genus, events in their agent, things in their end. The eighth is primary:

> "In the strictest sense of all, as a thing is 'in' a vessel, and generally 'in' place." (210a24)

The vessel-sense of "in" is the primary spatial sense. To be "in" something primarily is to be spatially enclosed within it — not to be a part of it, not to be its form or matter.

Aristotle's five conditions for this relation (*Physics* IV.4, 211a2–6):

1. The container contains that of which it is the place
2. The container is no part of the thing — containment and parthood are distinct
3. The container is neither less nor greater than the thing (the fitting condition)
4. The container can be left behind — the contents are separable
5. The container is separable from what it contains

The fitting condition (3) distinguishes containment from mere co-presence: the vessel's interior boundary fits its contents.

## Casati and Varzi: mereotopological containment

Roberto Casati and Achille C. Varzi, *Parts and Places* (MIT Press, 1999), build the formal framework. Their GEMTC (General Extensional Mereotopology with Closure Conditions) takes two primitives: connection $C(x, y)$ and parthood $P(x, y)$.

Key definitions:

- **Overlap**: $O(x,y) =_{\mathrm{df}} \exists z\,(P(z,x) \wedge P(z,y))$
- **External Connection**: $\mathrm{EC}(x,y) =_{\mathrm{df}} C(x,y) \wedge \neg O(x,y)$ — connected but sharing no part
- **Tangential Part**: $\mathrm{TP}(x,y) =_{\mathrm{df}} P(x,y) \wedge \exists z\,(\mathrm{EC}(z,x) \wedge \mathrm{EC}(z,y))$ — touches the boundary
- **Interior Part**: $\mathrm{IP}(x,y) =_{\mathrm{df}} P(x,y) \wedge \neg\mathrm{TP}(x,y)$ — no boundary contact

Containment is defined from interior parthood:

$$\mathrm{CONT}(x,y) =_{\mathrm{df}} P(x,y) \wedge \neg\exists z\,(\mathrm{EC}(z,x) \wedge \mathrm{EC}(z,y))$$

The critical distinction (ch. 5, p. 117ff): being inside is not being a mereological part. A coin inside a jar is not a part of the jar — they share no material, do not overlap. The coin occupies a spatial region that is an interior subregion of the jar's cavity. Containment is a spatial location relation, not a mereological composition relation.

**The cavity formula.** For a container $y$ with material region $r_y$, the interior cavity is:

$$\mathrm{CAVITY}(y) =_{\mathrm{df}} i(c(r_y)) \setminus r_y$$

The interior of the closure of $y$'s material region, minus the material itself. The hollow space inside — the region bounded by $y$'s interior surface but not occupied by $y$'s material.

**Hollow object taxonomy** (Casati and Varzi, *Holes and Other Superficialities*, 1994):

- **Superficial hollow** (open container): cavity accessible from exterior — bowl, cup, pocket
- **Internal cavity** (sealed container): cavity entirely enclosed — sealed jar, hollow sphere
- **Perforation** (tunnel): path passes all the way through the material

"You don't necessarily destroy a hole by filling it up... you don't create a new hole by removing the filling." The cavity is the container's intrinsic geometric structure; what occupies it is the contents. A full jar and an empty jar are the same container.

## DOLCE: constitution and the hull/vessel distinction

The DOLCE ontology (Masolo et al., *WonderWeb Deliverable D17*, 2003) distinguishes the physical hull from the institutional vessel via the constitution relation $K(x, y, t)$: "$x$ constitutes $y$ at time $t$."

Constitution axioms:

- **(A20)**: Constitution holds between endurants or perdurants at a time
- **(A24)**: $K(x, y, t) \to \neg K(y, x, t)$ — **asymmetric**: hull constitutes vessel, not the reverse
- **(A25)**: $(K(x,y,t) \wedge K(y,z,t)) \to K(x,z,t)$ — **transitive**: chains compose
- **(A28)**: $(K(x,y,t) \wedge \mathrm{PED}(x)) \to x \approx_{S,t} y$ — **spatial coincidence**: hull and vessel occupy the same spatial region at $t$
- **(T1)**: $\neg K(x,x,t)$ — **irreflexive**: no entity constitutes itself

The LUMPL/GOLIATH principle: clay constitutes the statue, but they are not identical because they have different persistence conditions (clay survives reshaping; the statue does not), different essential properties, and different historical profiles. The non-identity of hull and vessel: they are spatially coincident but have different persistence conditions — the hull survives decommissioning; the vessel does not survive loss of registration.

**Ship of Theseus in DOLCE**: if every plank is replaced, $K(\mathrm{hull}', \mathcal{V}, t')$ after repairs, where hull' $\neq$ hull (different physical object), while $\mathcal{V}$ is unchanged (same registration, same identity). Not a paradox — a consequence of asymmetric constitution.

## BFO: site and located-in

The Basic Formal Ontology 2020 (ISO/IEC 21838-2) provides the spatial framework through two concepts:

**Site** (BFO_0000029): "a three-dimensional immaterial entity whose boundaries either (partially or wholly) coincide with the boundaries of one or more material entities or have locations determined in relation to some material entity." The site is immaterial — it is the cavity, not the wall. This corresponds to Casati-Varzi's $\mathrm{CAVITY}(y)$.

**Located-in** (BFO_0000171): "$b$ is located in $c$ at $t$" iff the spatial region occupied by $b$ at $t$ is a continuant part of the spatial region occupied by $c$ at $t$.

Key BFO axioms:

- **Transitivity**: if $a$ located in $b$ at $t$ and $b$ located in $c$ at $t$, then $a$ located in $c$ at $t$
- **Parthood implies location**: if $a$ part of $b$ at $t$, then $a$ located in $b$ at $t$ — but the converse does not hold
- **Dissection**: if $b$ located in $c$ at $t$, every part of $b$ is located in $c$ at $t$

The converse failure is the formal expression of the container/contents distinction: the coin is located in the box, but the coin is not a part of the box. Parthood implies location, but location does not entail parthood.

## The convergence

All four frameworks agree: containment is a spatial relation, not a compositional one. What varies is the formal apparatus:

| Framework | Containment primitive | Key distinction |
|---|---|---|
| Aristotle | Vessel-sense of "in" | Container is no part of what is in it |
| Casati-Varzi | Interior parthood of spatial regions | Coin-in-jar: location without mereological overlap |
| DOLCE | Constitution $K(x,y,t)$ | Hull constitutes vessel but is not identical to it |
| BFO | Located-in | Parthood implies location; location does not imply parthood |

## See also

- [Container](../../../../../terms/container.md) — the term definition
