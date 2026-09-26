---
name: Quality
aliases:
  - qualities
date-created: 2026-03-04
dg-permalink: quality
dg-publish: true
extends: thing
belongs-to: thing
component-of:
  - state
  - condition
contrasts-with:
  - property
  - object
species:
  - disposition
  - capacity
  - affective-quality
  - shape
changes-via: act
measured-by: measure
references:
  - id: aristotle-categories
    type: document
    title: Categories
    note: Chapter 8 on quality (poiotes)
    author:
      - literal: Aristotle
  - id: locke1689
    type: document
    title: An Essay Concerning Human Understanding
    note: Book II, Chapter 8
    author:
      - literal: John Locke
    issued:
      - year: 1689
  - id: whitehead1929
    type: document
    title: Process and Reality
    note: Part III on eternal objects and ingression
    author:
      - literal: Alfred North Whitehead
    container-title: Macmillan
    issued:
      - year: 1929
  - id: deleuze1968
    type: document
    title: Difference and Repetition
    note: translated; original 1968
    author:
      - literal: Gilles Deleuze
    container-title: Columbia University Press
    issued:
      - year: 1994
  - id: molnar2003
    type: document
    title: "Powers: A Study in Metaphysics"
    author:
      - literal: George Molnar
    container-title: Oxford University Press
    issued:
      - year: 2003
  - id: simondon1964
    type: document
    title: Individuation in Light of Notions of Form and Information
    note: translated; original 1964
    author:
      - literal: Gilbert Simondon
    container-title: Stanford University Press
    issued:
      - year: 2020
acts-on: entity
produces: evaluation
requires:
  - object-type
  - value-presheaf
params:
  object-type: relational-universe
  value-presheaf: relational-universe
  quality-map: relational-universe-morphism
output: relational-universe-morphism
ast:
  relational-universe-morphism:
    - quality-map:
        - object-type
        - value-presheaf
    - value-presheaf:
        - object-type
title: "Quality"
description: "Any aspect of a thing that can be observed, measured, or distinguished — from Aristotle's four species through Locke's primary/secondary distinction to Whitehead's eternal objects and Deleuze's intensive differences."
defines: quality
date-modified: 2026-04-06
where:
- $X : T^{\mathrm{op}} \to \mathbf{Set}$ is the **object-type presheaf** — the type of objects being evaluated; $X(t)$ is the set of objects of type $X$ at history $t$
- $V : T^{\mathrm{op}} \to \mathbf{Set}$ is the **value-presheaf** — the codomain of the quality; $V(t)$ is the set of possible quality values at $t$; often $V = H$ (the fiber Heyting algebra) or $V = \mathbb{R}$ (a real-valued scale)
- $Q_t : X(t) \to V(t)$ is the **quality map at $t$** — the valuation of objects of type $X$ at history $t$; $Q_t(x)$ is the quality of $x$ at $t$
---


A quality is any component of a [thing](thing) which can be [observing|observed](observing|observed) or [measuring|measured](measuring|measured), including both [emergent qualities](emergent qualities) and [attributes](attributes).

A **Quality** is a triple $(Q, X, V)$:

$$Q_\bullet : X \Rightarrow V \quad (\text{natural transformation of presheaves on } T)$$

**Naturality condition.** For every history morphism $f : t \to s$ in $T$, the following square commutes:

$$Q_t \circ X(f) = V(f) \circ Q_s$$

That is: evaluating quality at the extended history $s$ and then restricting to $t$ gives the same result as restricting the object first and then evaluating at $t$. A quality must be *compatible with the history structure*: it cannot depend on the path taken to arrive at the subject. This is the meaningfulness condition.

A Quality is what makes an object *register as something* in a particular dimension — what it IS in terms of some axis of evaluation. Qualities are the vocabulary of description: settled, stable, compliant, fit-for-purpose, authority-bearing.

**The naturality condition is the content.** A map $Q$ from objects to values that fails naturality would claim: the quality of an object depends on which historical path you took to arrive at it. That is incoherent for a genuine attribute. Naturality enforces that quality-assignments are *path-independent* — a requirement that goes back to Aristotle's distinction between genuine qualities (stable, intrinsic) and relational appearances (path-dependent, perspectival).

**Scale structure.** The structure of the value-presheaf $V$ determines what kind of quality $Q$ is:
- $V = \Omega$ (the subobject classifier): $Q$ is a **predicate** — yes/no membership
- $V = H$ (the fiber Heyting algebra): $Q$ is a **proposition-valued predicate** — the quality is a proposition, partially settleable by the nuclei
- $V = \{0,1,2,3\}$ (a four-element nominal set): $Q$ is a **classification** — assigns one of four categories
- $V = [0,1]$ (unit interval, ordered): $Q$ is a **measure** — assigns a degree

The shadow class type [RelationalHistoryFiberShadowClassType](../../../../services/relationality-services-section/content/text/math/relational-history-fiber-shadow-class-type.md) is a quality with $V = \{\mathrm{FixedFiberType}, \mathrm{SatShadowType}, \mathrm{TrShadowType}, \mathrm{FreeShadowType}\}$ — a nominal quality. The gap quality is an ordered-pair quality with $V = H \times H$ — a vector measure.

The two most fundamental qualities on fiber elements are the nuclei themselves:

**Saturation quality** (RelationalHistoryFiberSaturatingNucleus): the natural endomorphism $\sigma : H \Rightarrow H$ assigning to each $a \in H_t$ its saturation $\sigma_t(a)$ — the smallest element of Fix(RelationalHistoryFiberSaturatingNucleus) at or above $a$. This is an endoquality satisfying three special axioms: extensiveness ($a \leq \sigma_t(a)$), idempotence ($\sigma_t(\sigma_t(a)) = \sigma_t(a)$), and [RelationalHistoryFiberNucleusMeetPreservation](../../../../services/relationality-services-section/content/text/math/relational-history-fiber-nucleus-meet-preservation.md) ($\sigma_t(a \wedge b) = \sigma_t(a) \wedge \sigma_t(b)$). No general quality has all three; these axioms make the saturation quality a **nucleus**.

**Transfer quality** (RelationalHistoryFiberTransferringNucleus): analogously. $\Delta_t(a)$ is the smallest element of Fix(RelationalHistoryFiberTransferringNucleus) at or above $a$, satisfying the same three axioms.

**Fixed-fiber membership quality**: $\chi_{H^*} : H \Rightarrow \Omega$, where $\chi_{H^*,t}(a) = 1$ iff $a \in H^*_t$. This is the binary quality of being fully settled — doubly fixed by both nuclei.

**Shadow class type quality**: [RelationalHistoryFiberShadowClassType](../../../../services/relationality-services-section/content/text/math/relational-history-fiber-shadow-class-type.md) assigns each $a \in H_t$ one of four types depending on which nuclei fix it. This is the finest-grained nuclear quality: it does not measure how far $a$ is from settlement but which settlement obligations remain.

**Aristotle** (*Categories*, c. 350 BCE) identified quality (*poiotes*) as one of the ten predicament-categories and distinguished four species: (1) habits and dispositions — qualities that are stable vs. easily disturbed; (2) natural capacities; (3) affective qualities; (4) shape and form. The saturation quality is a disposition in Aristotle's sense: a stable tendency of an element toward its settled state, not a contingent relational property.

**S.S. Stevens** (1946, "On the Theory of Scales of Measurement", *Science*) classified measurement scales by their invariance group — what transformations preserve the scale's essential structure:
- **Nominal**: invariant under any bijection; quality as classification only
- **Ordinal**: invariant under monotone transformation; quality as ordering, ratios meaningless
- **Interval**: invariant under affine transformation; differences meaningful, ratios not
- **Ratio**: invariant under scaling; full arithmetic structure

The nuclear qualities fit Stevens' hierarchy: the shadow class type is a **nominal** quality (four categories, no ordering), the gap quality is an **ordinal** quality (measures relative distance to $H^*_t$ within the lattice order), and the nucleus application count (steps to reach $H^*_t$) is an **ordinal-interval** quality.

**Representational measurement theory** (Suppes & Zinnes 1963; Krantz, Luce, Suppes, Tversky, *Foundations of Measurement*, 1971) defines a quality as **meaningful** iff its value is invariant under admissible transformations of the scale. The key theorem: a quality assignment is meaningful iff it is a homomorphism from the empirical relational system into the numerical relational system — exactly the condition that the assignment be a natural transformation. The naturality condition in this spec IS the meaningfulness condition of representational measurement theory. A quality that fails naturality is not a genuine measurement — it is a measurement that changes value depending on how the subject is observed.

A [Role](../../../../services/relationality-services-section/content/text/triage/role.md) specifies a capability-signature — a set of required qualities with minimum thresholds. Filling a role is exhibiting the required quality values at or above threshold: for each quality $Q_i$ with threshold $q_i^{\min}$, having $Q_{i,t}(x) \geq q_i^{\min}$. This makes role-filling a quality-matching problem. The preorder of roles (role subsumption) is induced by quality requirement inclusion: $R_2 \geq R_1$ iff $R_2$ requires at least as much as $R_1$ on every quality dimension.

Each role $R$ with quality requirements induces a **threshold nucleus** on the quality space: the smallest element above $x$ in $H_t$ that satisfies all of $R$'s quality requirements. Fitness for role $R$ is the nuclear fixed-point condition: $x \in \mathrm{Fix}(n_R)$ — the subject already satisfies the threshold, so the threshold nucleus does not move it.

**Proposition 1 (Nuclear operators are endoqualities satisfying three axioms).** The RelationalHistoryFiberSaturatingNucleus and RelationalHistoryFiberTransferringNucleus are natural endomorphisms $Q : H \Rightarrow H$ of the fiber presheaf satisfying:

1. *Extensiveness*: $a \leq Q_t(a)$ for all $a \in H_t$
2. *Idempotence*: $Q_t(Q_t(a)) = Q_t(a)$ for all $a \in H_t$
3. *Meet-preservation*: $Q_t(a \wedge b) = Q_t(a) \wedge Q_t(b)$ for all $a, b \in H_t$

These three axioms characterize exactly the nuclear structure; together they determine that $\mathrm{Fix}(Q_t)$ is a sub-Heyting-algebra of $H_t$. No general quality has all three — a quality that is extensive, idempotent, and meet-preserving is necessarily a nucleus.

*Proof.* Each property follows from the definition of the nucleus as a meet-preserving closure operator. Fix(Q_t) is a sublattice: closed under meets by meet-preservation; closed under joins because Q_t extensive and idempotent implies Q_t is a left adjoint to the inclusion Fix(Q_t) → H_t; and inherits the Heyting implication by the general theory of nuclei on Heyting algebras. $\square$

**Proposition 2 (Naturality = history-coherence; failure = quality incoherence).** A quality $Q : X \Rightarrow V$ is natural iff for every prefix extension morphism $f : t \to s$ in $T$: $Q_t \circ X(f) = V(f) \circ Q_s$. Failure of naturality means: evaluating quality at the extended history $s$ and restricting gives a different value than restricting and evaluating at the base $t$. This is quality incoherence — the quality "remembers" which path was taken, making it path-dependent rather than a genuine attribute. The RelationalHistoryFiberSaturatingNucleus is natural: its restriction-profile classes are defined precisely by the restriction maps, so saturation and restriction commute.

*Proof.* The naturality square commutes iff restriction-then-evaluate equals evaluate-then-restrict. For the saturation nucleus: the restriction-profile class of $a \in H_s$ is the equivalence class $\{b \in H_s : H(f)(b) = H(f)(a) \text{ for all } f\}$; the nucleus sends $a$ to the maximum of its class. Restriction maps send the maximum of the class in $H_s$ to the maximum of the corresponding class in $H_t$ (by the intertwining property proved in [RelationalHistoryFiberSaturatingNucleusTransferStableFiberRestriction](../../../../services/relationality-services-section/content/text/math/relational-history-fiber-saturating-nucleus-transfer-stable-fiber-restriction.md)). $\square$

**Proposition 3 (Shadow class type is a quality; partition theorem).** The RelationalHistoryFiberShadowClassType is a quality:

$$\mathrm{RelationalHistoryFiberShadowClassType}(t, -) : H_t \to \{\mathrm{FixedFiberType},\; \mathrm{SatShadowType},\; \mathrm{TrShadowType},\; \mathrm{FreeShadowType}\}$$

Its preimage partition is:

$$H_t = H^*_t \;\sqcup\; \mathrm{SatShadow}_t \;\sqcup\; \mathrm{TrShadow}_t \;\sqcup\; \mathrm{FreeShadow}_t$$

The partition is exhaustive and disjoint: for any $a \in H_t$, exactly one of the four Boolean combinations of $\{\sigma_t(a) = a\}$ and $\{\Delta_t(a) = a\}$ holds. This is the finest-grained nuclear quality — it tells you which settlement obligations remain, not how far the element is from settlement.

*Proof.* For any $a \in H_t$: $\sigma_t(a) = a$ or $\sigma_t(a) \neq a$ (decidable equality in the fiber); $\Delta_t(a) = a$ or $\Delta_t(a) \neq a$ (decidable). The four Boolean combinations are mutually exclusive and collectively exhaustive. $\square$

**Proposition 4 (Gap quality is the product of nuclear qualities).** The gap quality $\mathrm{Gap}_t : H_t \to H_t \times H_t$ defined by $\mathrm{Gap}_t(a) = (\sigma_t(a), \Delta_t(a))$ is the product natural transformation $\langle \sigma, \Delta \rangle : H \Rightarrow H \times H$. By the universal property of products of presheaves, the pairing of two natural transformations is natural. Moreover, the gap quality is **idempotent on RelationalHistoryFixedFiber**: for $a \in H^*_t$, $\mathrm{Gap}_t(a) = (a, a)$, and applying the product nucleus componentwise to $(a,a)$ gives $(\sigma_t(a), \Delta_t(a)) = (a,a)$ — the gap quality already reaches its fixed point on stable elements.

*Proof.* Products of natural transformations are natural (componentwise check). Idempotence on $H^*_t$: if $a \in H^*_t$, then $\sigma_t(a) = a$ and $\Delta_t(a) = a$ by definition; hence $\mathrm{Gap}_t(a) = (a,a)$; applying again gives the same result. $\square$

*Content.* The gap quality and the shadow class type quality together provide complete nuclear information: the shadow class type records *which* settlement obligations are outstanding; the gap quality records *what* the obligations demand. They are complementary axes of the same nuclear structure.

**Proposition 5 (Non-adjointness of nuclear pair = quality separation = Fibonacci growth).** The RelationalHistoryFiberSaturatingNucleus and RelationalHistoryFiberTransferringNucleus are not in Galois connection in either direction:

$$\mathrm{RelationalHistoryFiberSaturatingNucleus}(t) \not\dashv \mathrm{RelationalHistoryFiberTransferringNucleus}(t) \quad \text{and} \quad \mathrm{RelationalHistoryFiberTransferringNucleus}(t) \not\dashv \mathrm{RelationalHistoryFiberSaturatingNucleus}(t)$$

The witnesses: both RelationalHistoryFiberTransferShadowClass and RelationalHistoryFiberSaturationShadowClass are non-empty. This means the two nuclear qualities are **independent measurement axes** — neither subsumes the other, and no scalar combination of them collapses either shadow class to empty. This independence is the algebraic precondition for the Fibonacci growth recurrence: the depth count of RelationalHistoryFiberFreeShadowClass elements satisfies $d_t(n+1) = d_t(n) + d_t(n-1)$ because each of the two independent quality axes contributes exactly one summand.

*Proof.* From [RelationalHistoryFiberNuclearPairNonAdjointness](../../../../services/relationality-services-section/content/text/math/relational-history-fiber-nuclear-pair-non-adjointness.md): if the nuclear pair were adjoint, one shadow class would be forced to be empty. The shadow count identity $|\mathrm{TrShadow}_t(n)| = d_t(n-1) > 0$ for $n \geq 1$ shows non-emptiness of the transfer shadow class; symmetrically for the saturation shadow class. Non-emptiness of both classes = both quality dimensions are genuinely independent. If either adjunction held, the recurrence would degenerate to $d_t(n+1) = d_t(n)$ — linear growth, not Fibonacci. $\square$

- Whether every quality in the system corresponds to a natural transformation between presheaves, or whether there are "local qualities" defined at a single history with no coherent extension across the prefix order — and whether such local qualities are genuine properties or pathologies of incomplete specification.
- Whether the value-presheaf $V$ must be internally a complete lattice at each $t$ to support quality-meets and quality-joins, or whether partial orders suffice — and what the minimal structure on $V$ is that supports the quality-measure distinction.
- Whether there is a quality of qualities — a meta-quality $M : \mathrm{Quality}(X, V) \to \Omega$ that evaluates whether a given quality is nuclear (extensive, idempotent, meet-preserving) — and whether this meta-quality is itself a quality in the technical sense.
- Whether the four shadow class types, once established as a nominal quality, support a natural refinement to an ordinal or interval quality that measures "distance to FixedFiberType" independently along the saturation and transfer axes, giving a two-dimensional quality vector that decomposes the gap quality into orthogonal components.
- Whether Stevens' scale hierarchy (nominal/ordinal/interval/ratio) has an internal characterization in terms of the nucleus structure — whether ratio qualities are exactly those invariant under the full automorphism group of $H_t$, and whether this recovers Stevens' classification from the fiber algebra alone.

## Related

- [Object](./object.md) — physical things that possess observable qualities
- [State](./state.md) — the composite of all qualities at a moment
- [Condition](./condition.md) — a quality realized at a particular moment
- [Act](./act.md) — how actions change qualities

A quality is any aspect of a [thing](./thing.md) that can be observed, measured, or distinguished. Color, weight, temperature, shape, readiness, courage, solubility — all qualities. A quality makes a thing THIS thing and not another.

## What Quality IS: Aristotle's Four Species

Aristotle's *Categories* Chapter 8 establishes the foundational account. Quality (*poiotes*) is one of ten categories of being. Aristotle distinguishes four species, each fundamentally different:

**Habit or disposition** (*hexis*): A stable, relatively permanent condition. Health in a body. Skill in a musician. Virtue in a person. These persist over time but can be lost or changed.

**Natural capacity or incapacity** (*dynamis*): A power to be affected or to act. The capacity of eyes to see. The capacity of material to be shaped. The capacity of sugar to dissolve in water. These are intrinsic to the thing's nature.

**Affective qualities and affections** (*pathē*): Sensible properties. Color, taste, heat, cold, hardness as felt. What the senses perceive directly. Some are alterable (water changes temperature) but perceived as real.

**Shape and form** (*schēma*): Configuration, figure, arrangement. The shape of a body. The structure of a building. These endure unless externally altered.

Aristotle insists that these four kinds are fundamentally different, not all reducible to "observable properties." A person's courage is not a sensible property like color; it is a disposition, a stable orientation toward difficulty. A crystal's solubility is a natural capacity, distinct from both its observed shape and its evident color. A fruit's ripeness is an affective quality — how it strikes the senses — yet distinct from its internal maturation. Each species operates on different principles and has different persistence conditions.

## Primary and Secondary: Locke's Division

John Locke's *Essay Concerning Human Understanding* (1689) Book II, Chapter 8 distinguishes qualities by their source of being.

A **primary quality** is in the object itself, whether or not anyone observes it. Extension, shape, motion, number, solidity. A lump of gold has shape, mass, and divisibility independent of human eyes. Remove all observers and these qualities remain.

A **secondary quality** exists in the perceiver's mind, even though it seems to be in the object. Color, taste, sound, smell. The gold appears gold because light reflects from its surface and human eyes perceive that reflection. The gold itself has no color; it has surface properties that cause a sensation of color in us.

Locke's distinction clarifies something real: some properties seem intrinsic to things, independent of observation (mass, extension). Others seem observer-dependent (perceived hue, experienced warmth). A chemist measures primary qualities; a person experiences secondary qualities. Neither is false; they describe different aspects of the same thing.

Yet the distinction has limits. If shape is in the object (primary), why not color, which also depends on surface microstructure? The boundary is less sharp than Locke suggested. But the insight stands: understanding any complex thing requires attending to both its intrinsic determinations and its relational, observer-dependent properties.

## Categorical and Dispositional

George Molnar's *Powers: A Study in Metaphysics* (2003) distinguishes qualities that are **categorical** (current state, intrinsic condition) from those that are **dispositional** (power, capacity, tendency to act).

A knife's shape is categorical. The knife IS sharp-edged right now, regardless of whether it is cutting anything. But a knife's sharpness also contains a power: the capacity to cut. This power is not reducible to the knife's current state. A dull knife might become sharp; a sharp knife might break. Sharpness as a power is the capacity to cut, whether or not the knife is cutting right now.

Consider a person. Their height (six feet) is categorical — current, observable. But their ability to run is dispositional — a power that manifests only when conditions are right. A crystal has the categorical property of cubic structure and the dispositional property of dissolving in water. A building has the categorical property of stone construction and the dispositional property of sheltering its inhabitants.

Molnar argues that many apparently simple descriptions of things are really dispositional. Brittleness is not a state of matter but a power-to-shatter. Solubility is not a permanent feature but a power-to-dissolve. Trustworthiness is not a property a person carries but a power-to-act-reliably. This means reality is more fundamentally characterized by powers and potentials than by static categorical properties.

## Process View: Eternal Objects and Ingression

The substance tradition (Aristotle, Locke, Molnar) asks: "What ARE qualities?" The process tradition asks: "How do qualities become actual?" and finds a different answer.

Alfred North Whitehead's *Process and Reality* (1929) Part III inverts the dependency. Qualities are not properties substances have. Qualities are **abstract potentials that actual occasions realize**.

Whitehead calls these potentials **eternal objects**: patterns or determinants that could be realized in many ways. Redness is an eternal object. So is circularity, the property of being-soluble, the quality of harshness, the relation of being-larger-than. An eternal object is not a Platonic form floating in a realm apart. It is pure potential, waiting for actualization.

An **actual occasion** is a concrete realization. A person at this moment is an actual occasion. When that occasion becomes, it *grasps* or *prehends* certain eternal objects out of infinite possibility. It *ingresses* them — actualizes them by embodying them. This occasion does not "have" qualities like a substance has properties. The occasion *consists of* the eternal objects it realizes, together with its relations to other occasions.

Consider a musical moment. Traditionally: here is a moment in time that has the quality of being in C major. Whitehead's answer: the moment *is* the realization of the eternal objects {C-major-tonality, this-timbre, this-tempo, this-harmonic-texture}. There is no moment prior to and independent of these ingressed eternal objects. The moment consists of them. When the eternal object ingresses, it is not *in* the occasion like a property in a container. The occasion *is* the realization of those eternal objects.

This has a radical implication: there is no thing apart from its qualities. A person *is* (at this moment) the bundle of realized potentials: their emotions, their actions, their thoughts, their bodily states, their relations to others. There is no person apart from what they are actualizing.

## Intensive and Extensive: Deleuze's Register

Gilles Deleuze's *Difference and Repetition* (1968) distinguishes **intensive qualities** from **extensive quantities**.

Intensive qualities (temperature, pressure, intensity, potential) cannot be divided without ceasing to be themselves. Half of a temperature is not temperature; it is a different temperature. An intensive quality is a gradient; it *drives* processes. Heat causes things to flow, expand, transform. Intensity is generative — it is the condition of becoming.

Extensive quantities (length, mass, area, number) can be divided without loss of kind. Half of 100 meters is still length; it is 50 meters. Half of a skill is not skill; it is a different degree of skill. Half of a heartbeat is not a heartbeat. Extensive quantities are *products* of processes; they are sedimented results.

Consider learning a musical instrument. Skill-level is intensive: there is no "half skill" that is still skill. At each moment, the musician has a certain capacity (no sound, weak sound, clear sound, masterful control). Crossing from one threshold to the next is not divisible; it is discontinuous. But the hours practiced is extensive: you can practice half the time. The number of mistakes made is extensive: you can make half as many errors. Intensive differences *drive* the processes (learning, development); extensive quantities are *results* (time spent, errors accumulated).

This matters for understanding change. All genuine becoming is driven by intensive differences. A person's transformation is driven by intensive shifts (confusion → clarity, despair → hope). The measurements we take afterward (duration, progress markers) are sedimented results. What drives actual change cannot always be measured.

## Quality vs. Property vs. State

A quality belongs to a [thing](./thing.md). A quality at a particular moment defines a [condition](./condition.md). The composite of all conditions at a moment is the thing's [state](./state.md).

**Quality** is the capacity or aspect itself: redness, sharpness, courage.

**Property** is often used interchangeably with quality, but in rigorous metaphysics, property can mean something broader: any feature a thing has, whether or not observed. A property might be intrinsic (whether or not anyone looks at it) or relational (depending on context and observers).

**State** is the composite of all a thing's conditions at a moment. The state of a cup of water includes: its temperature, volume, color, the dissolved minerals in it, the speed of its molecules. Change the state; you change which qualities are realized.

An [act](./act.md) changes qualities. A person's action (speaking a promise) changes the state of the world (now there is a bound person, a witnessed commitment). A [relation](./relation.md) connects qualities across things: if one ball is heavier than another, the relation "heavier-than" connects their respective weight-qualities.

## Observability and Reality

Here lies a deep philosophical question: are qualities observable, or are some intrinsic (real but not observable)?

Some qualities are directly observable: color, temperature, shape. Others are only inferred: molecular structure, gravitational pull, the interior thoughts of a person. Still others are powers that manifest only under conditions: solubility is a power to dissolve, and you observe only the result when water is added.

Buddhist philosophy (the Abhidharma) offers a process account: a "quality" like hardness is not an intrinsic property persisting in a substance. Hardness is a *stream of momentary resistances*, each arising as conditions support it. The appearance of a persistent, hard stone is a conventionally constructed stability superimposed on a stream of momentary, conditional dharma-instants.

This suggests that all qualities are real but conditional: they depend on circumstances, on observers, on other things, on the right conditions being present. Nothing has a quality in complete isolation. Qualities arise in dependence on other conditions, and will cease when conditions cease.
