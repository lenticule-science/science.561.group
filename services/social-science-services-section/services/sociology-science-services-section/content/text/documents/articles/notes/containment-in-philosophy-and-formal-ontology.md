---
id: containment-in-philosophy-and-formal-ontology
description: "Aristotle, Casati-Varzi, DOLCE, and BFO on what it means for one thing to be inside another — the philosophical and ontological grounding for the vessel concept."
type: text
addresses: vessel
date-created: 2026-03-29
---

This text collects the philosophical and formal-ontological sources behind the [vessel](../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/glossary/terms/vessel.md) concept. The core claim: containment is not parthood. Being inside something is a spatial relation, not a compositional one.

## Aristotle: vessel as moved place

Aristotle, *Physics* IV.4, 212a14–20 (Hardie–Gaye translation, in Barnes ed., Princeton UP, 1984):

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

Roberto Casati and Achille C. Varzi, *Parts and Places: The Structures of Spatial Representation* (MIT Press, Bradford Books, 1999), build the formal framework. Their GEMTC (General Extensional Mereotopology with Closure Conditions) takes two primitives: connection $C(x, y)$ and parthood $P(x, y)$.

Key definitions:
- **Overlap**: $O(x,y) =_{\mathrm{df}} \exists z\,(P(z,x) \wedge P(z,y))$
- **External Connection**: $\mathrm{EC}(x,y) =_{\mathrm{df}} C(x,y) \wedge \neg O(x,y)$ — connected but sharing no part
- **Tangential Part**: $\mathrm{TP}(x,y) =_{\mathrm{df}} P(x,y) \wedge \exists z\,(\mathrm{EC}(z,x) \wedge \mathrm{EC}(z,y))$ — touches the boundary
- **Interior Part**: $\mathrm{IP}(x,y) =_{\mathrm{df}} P(x,y) \wedge \neg\mathrm{TP}(x,y)$ — no boundary contact
- **Interior operator**: $i(y) =_{\mathrm{df}} \sigma z\,\mathrm{IP}(z,y)$ — mereological sum of all interior parts
- **Closure**: $c(y) =_{\mathrm{df}} \sigma z\,C(z,y)$ — sum of everything connected to $y$

Containment is defined from interior parthood:

$$\mathrm{CONT}(x,y) =_{\mathrm{df}} P(x,y) \wedge \neg\exists z\,(\mathrm{EC}(z,x) \wedge \mathrm{EC}(z,y))$$

$x$ is contained in $y$ iff $x$ is a part of $y$ with no external connection to anything also externally connected to $y$. Equivalently: $\mathrm{CONT}(x,y) \Leftrightarrow \mathrm{IP}(x,y)$.

The critical distinction (ch. 5, p. 117ff): being inside is not being a mereological part. A coin inside a jar is not a part of the jar — they share no material, do not overlap. The coin occupies a spatial region that is an interior subregion of the jar's cavity. Containment is a spatial location relation, not a mereological composition relation.

**The cavity formula.** For a container $y$ with material region $r_y$, the interior cavity is:

$$\mathrm{CAVITY}(y) =_{\mathrm{df}} i(c(r_y)) \setminus r_y$$

The interior of the closure of $y$'s material region, minus the material itself. The hollow space inside $y$ — the region bounded by $y$'s interior surface but not occupied by $y$'s material.

**Hollow object taxonomy** (Casati and Varzi, *Holes and Other Superficialities*, MIT Press, 1994):
- **Superficial hollow** (open container): cavity accessible from exterior — bowl, cup, pocket
- **Internal cavity** (sealed container): cavity entirely enclosed — sealed jar, hollow sphere
- **Perforation** (tunnel): path passes all the way through the material

"You don't necessarily destroy a hole by filling it up... you don't create a new hole by removing the filling." The cavity is the vessel's intrinsic geometric structure; what occupies it is the vessel's contents. A full jar and an empty jar are the same vessel.

Location axioms (Casati–Varzi 1999, p. 121):
- **Functionality**: $\forall x\forall y\forall z[(L(x,y) \wedge L(x,z)) \to y = z]$ — each entity has at most one exact location
- **Conditional Reflexivity**: $\forall x\forall y[L(x,y) \to L(y,y)]$ — a region exactly locates itself

## DOLCE: constitution and the hull/vessel distinction

The DOLCE ontology (Masolo, Borgo, Gangemi, Guarino, Oltramari, Schneider, *WonderWeb Deliverable D17*, v. 2.1, ISTC-CNR, 29 May 2003) distinguishes the physical hull from the institutional vessel via the constitution relation $K(x, y, t)$: "$x$ constitutes $y$ at time $t$."

Relevant ontological categories:
- **NAPO** (Non-Agentive Physical Object): the hull — a physical endurant with mass and spatial location
- **SOB/NASO** (Social Object / Non-Agentive Social Object): the vessel — a non-physical endurant dependent on intentional agents and normative contexts

Constitution axioms (D17, §3.3, axioms A20–A28):
- **(A20)**: $K(x, y, t) \to ((\mathrm{ED}(x) \vee \mathrm{PD}(x)) \wedge (\mathrm{ED}(y) \vee \mathrm{PD}(y)) \wedge T(t))$ — constitution holds between endurants or perdurants at a time
- **(A21)**: $K(x, y, t) \to (\mathrm{PED}(x) \leftrightarrow \mathrm{PED}(y))$ — preserves the physical/non-physical boundary
- **(A24)**: $K(x, y, t) \to \neg K(y, x, t)$ — **asymmetric**: hull constitutes vessel, not the reverse
- **(A25)**: $(K(x,y,t) \wedge K(y,z,t)) \to K(x,z,t)$ — **transitive**: chains compose
- **(A28)**: $(K(x,y,t) \wedge \mathrm{PED}(x)) \to x \approx_{S,t} y$ — **spatial coincidence**: hull and vessel occupy the same spatial region at $t$
- **(T1)**: $\neg K(x,x,t)$ — **irreflexive**: no entity constitutes itself

The LUMPL/GOLIATH principle (D17, §2.3): clay (LUMPL) constitutes the statue (GOLIATH), but they are not identical because they have different histories (LUMPL exists before sculpting), different persistence conditions (LUMPL survives reshaping; GOLIATH does not), and different essential relational properties (GOLIATH requires an artworld; LUMPL does not). These are the hull/vessel differences exactly.

The non-identity of hull and vessel: $K(\mathrm{hull}, \mathcal{V}, t)$ for each $t$ in the vessel's lifespan, but hull $\neq \mathcal{V}$. They are spatially coincident (A28) but have different persistence conditions (the hull survives decommissioning; the vessel does not survive loss of registration), different essential properties (the hull requires physical continuity; the vessel requires constitutional recognition), and different historical profiles (the hull existed before commissioning; the vessel may persist through hull replacement).

**Ship of Theseus in DOLCE**: if every plank is replaced, $K(\mathrm{hull}', \mathcal{V}, t')$ after repairs, where hull' $\neq$ hull (different physical object), while $\mathcal{V}$ is unchanged (same registration, same identity). Not a paradox — a consequence of asymmetric constitution.

## BFO: site and located-in

The Basic Formal Ontology 2020 (Smith et al., ISO/IEC 21838-2) provides the spatial framework through two concepts:

**Site** (BFO_0000029): "a three-dimensional immaterial entity whose boundaries either (partially or wholly) coincide with the boundaries of one or more material entities or have locations determined in relation to some material entity." Examples: a hole in cheese, the interior of a car trunk, the Grand Canyon. The site is immaterial — it is the cavity, not the wall. This corresponds exactly to Casati-Varzi's $\mathrm{CAVITY}(y)$.

**Located-in** (BFO_0000171): "$b$ is located in $c$ at $t$" iff $b$ and $c$ are non-spatial-region independent continuants and the spatial region occupied by $b$ at $t$ is a continuant part of the spatial region occupied by $c$ at $t$.

Key BFO axioms:
- **Transitivity**: if $a$ located in $b$ at $t$ and $b$ located in $c$, then $a$ located in $c$ at $t$
- **Part inheritance**: if $b$ located in $c$ at $t$ and $c$ part of $d$ at $t$, then $b$ located in $d$ at $t$
- **Dissection**: if $b$ located in $c$ at $t$, every part of $b$ is located in $c$ at $t$
- **Parthood implies location**: if $a$ part of $b$ at $t$, then $a$ located in $b$ at $t$ — but the converse does not hold

The converse failure is the formal expression of the container/contents distinction: the coin is located in the box, but the coin is not a part of the box. Parthood implies location, but location does not entail parthood.

**Ship of Theseus in BFO**: the vessel as site persists through changes in the bounding material entity. A site's boundaries are "determined in relation to some material entity" — when the material entity changes (new planks), the site (interior cavity) may remain geometrically identical. The site's identity is its geometric structure, not its host's material identity.
