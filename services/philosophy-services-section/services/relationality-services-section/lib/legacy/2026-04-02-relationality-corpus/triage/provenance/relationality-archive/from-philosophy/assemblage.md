---
name: assemblage
description: "An Assemblage is a five-tuple (C, Rel, μ, ∂, E) — a set of components C each retaining their identities independently of the assemblage, a set of relations of exteriority Rel holding contingently between components, a material-expressive role assignment μ marking each component and relation on DeLanda's first axis, a territorial-deterritorializing process assignment ∂ marking each process that stabilizes or transforms the assemblage on DeLanda's second axis, and a set of emergent capacities E that belong to the assembled whole but are not reducible to any individual component. The defining invariant: relations of exteriority. In a Group, elements are defined by the constitution κ — they have no prior identity independent of the group's operation. In an Institution, positions are defined by constitutive rules — the office exists only within the institutional context. In an Assemblage, components retain full identities outside the arrangement: the component could be extracted, plugged into a different assemblage, and would still be what it is. The assemblage is not the components; it is the arrangement of independently-existing components in contingent relation."
defines: Assemblage
related: Group, Institution, Area, Person, Delegation, Tribe, NormativeSystem, Role, Norm
contrasts-with: [group, institution, system]
contains: [component, relation-of-exteriority, emergent-capacity]
produces: emergent-capacity
requires: relation-of-exteriority
date-created: 2026-03-20
date-modified: 2026-03-20
---


## Formal definition

An **Assemblage** is a five-tuple $\mathcal{A} = (C, \mathrm{Rel}, \mu, \partial, E)$:

$$\mathcal{A} = (C : \mathrm{ComponentSet},\; \mathrm{Rel} \subseteq C \times C,\; \mu : C \cup \mathrm{Rel} \to \{\mathrm{mat}, \mathrm{exp}\},\; \partial : \mathrm{Proc}(\mathcal{A}) \to \{\mathrm{terr}, \mathrm{det}\},\; E : \mathrm{EmergentCapacities})$$

where:
- $C$ is the **component set** — the entities that participate in the assemblage; each $c \in C$ retains a determinate identity independent of $\mathcal{A}$; the same $c$ can be extracted from $\mathcal{A}$ and plugged into a different assemblage $\mathcal{A}'$ and remain the same entity; this is not true of elements in a Group (which have no identity outside the operation) or positions in an Institution (which have no identity outside the constitutive context); the component's independent identity is the invariant that defines the assemblage concept
- $\mathrm{Rel}$ is the **relations of exteriority** — the contingent relations holding between components; a relation of exteriority is one where the relation does not define either of its relata; the components could fail to be related (the relation could be severed) while each component survives as what it is; contrast with relations of interiority (structural relations where the relata are defined by the relation: the terms of a marriage are not the same persons before and after, in the institutional sense)
- $\mu : C \cup \mathrm{Rel} \to \{\mathrm{mat}, \mathrm{exp}\}$ is the **material-expressive axis** assignment — for each component $c$ and each relation $r \in \mathrm{Rel}$, $\mu$ marks whether it is primarily *material* (exercising physical, chemical, energetic, or causal-functional roles) or primarily *expressive* (coding, marking, signaling, symbolizing, or communicating); the axis is a spectrum, not a binary; most assemblages mix material and expressive components; the axis matters because territorial and deterritorializing processes work differently on material vs. expressive components
- $\partial : \mathrm{Proc}(\mathcal{A}) \to \{\mathrm{terr}, \mathrm{det}\}$ is the **territorial-deterritorializing axis** assignment — for each process operating within $\mathcal{A}$, $\partial$ marks whether the process is *territorializing* (stabilizing, consolidating, sharpening the assemblage's identity and boundaries — making it more like itself) or *deterritorializing* (destabilizing, transforming, dissolving boundaries — moving the assemblage toward a new configuration or dissolution); $\partial$ operates on processes, not components: the same component can be involved in both territorializing and deterritorializing processes at different moments
- $E$ is the **emergent capacities** — properties and powers belonging to the assemblage as a whole that cannot be attributed to any individual component taken alone; emergent capacities arise from the exercise of the relations in $\mathrm{Rel}$ among the components in $C$; they are real (they affect what the assemblage can do) but not present in any single $c \in C$; DeLanda insists these are capacities, not essences: they are actualized only when the assemblage interacts with something else

**Five invariants.** $\mathcal{A}$ is an assemblage iff:

1. **Relations are exterior**: for every $r \in \mathrm{Rel}$ connecting $c_1, c_2 \in C$, the relation is contingent — if $r$ were severed, both $c_1$ and $c_2$ would persist as the same entities. This rules out algebraic groups (where elements have no identity outside the operation) and institutions (where positions have no existence outside the constitutive rules). A human body and a horse are components of a horse-rider assemblage; both survive the dissolution of the assemblage.

2. **Components have prior identities**: each $c \in C$ has a determinate identity established prior to and independent of $\mathcal{A}$; $c$ is not constituted by its membership in $\mathcal{A}$; $c$ is *plugged into* $\mathcal{A}$, not *generated by* it. This distinguishes assemblages from wholes whose parts are defined by their function in the whole (functionalist systems theory) and from structures where elements are defined by their relational positions (structuralism).

3. **Flat ontology**: there is no privileged ontological level at which assemblages occur; molecules, cells, organisms, cities, and nations are all assemblages — each level is composed of components that are themselves assemblages at a smaller scale, and each level contributes as a component to larger assemblages; no level is more real or more fundamental than another; this is DeLanda's explicit anti-reductionism.

4. **Emergent capacities are real**: $E \neq \varnothing$ — the assemblage has at least one capacity that none of its components has individually; the capacity is real (it produces actual effects) but dispositional (it is realized only in interaction with specific other entities); a pile of steel and a ship assembled from steel have different capacities; the ship's capacity to stay afloat is an emergent capacity of the assemblage, not present in any steel plate considered alone.

5. **Processual identity**: the assemblage is defined by ongoing processes, not by fixed composition; $\partial$ marks which processes are currently stabilizing or transforming the assemblage; an assemblage is not a static structure but an ongoing dynamic: at any moment, territorializing and deterritorializing processes are both at work, and the assemblage's relative stability (or transformation) is the outcome of their interplay.

## The key distinction: relations of exteriority

The concept of *relations of exteriority* is the pivot of the assemblage concept. It derives from Hume's analysis of causation and Bertrand Russell's logical atomism, but DeLanda adopts it specifically to contrast with two traditions:

**Against essentialism**: in the essentialist tradition (Aristotle, typological thinking in biology), the properties of an entity follow from its essential nature; what an entity is determines what it can do. On this view, relations between entities are internal — a substance's properties flow from its essence. DeLanda's flat ontology rejects this: entities do not have fixed essences; they have *capacities*, and capacities are only ever realized in relation to other entities.

**Against structuralism**: in structuralism (Saussure, Lévi-Strauss, early Piaget), the identity of an element is entirely constituted by its relations — a phoneme has no identity outside its differential relations to other phonemes; a kinship term has no meaning outside the kinship structure. DeLanda rejects this too: if relations were entirely interior (definitional), then no element could be extracted from one structure and plugged into another. But technology transfer, cultural borrowing, and institutional evolution all involve exactly this: components extracted from one assemblage and plugged into another while retaining their identity.

The assemblage concept is the theory of entities that have pre-relational identities but that acquire new capacities through contingent external relations.

## DeLanda's two axes

### Axis 1: Material ↔ Expressive

Every component of an assemblage exercises roles along a spectrum from *purely material* to *purely expressive*:

**Material pole**: the component exercises physical, chemical, energetic, hydraulic, or causal-functional roles. A wall in an urban assemblage exercises a material role by physically blocking movement, providing structural support, and controlling temperature. The material role is exercised regardless of whether anyone represents or interprets it.

**Expressive pole**: the component exercises semiotic, coding, marking, or signaling roles. The same wall, painted with a specific color and insignia, acquires an expressive role: it marks territory, signals ownership, and communicates institutional identity. The expressive role requires some interpreter — the marking is expressive only relative to a code.

Most assemblage components are *mixtures*: a currency is material (a physical token) and expressive (a store of value, a signaling medium). A soldier's uniform is material (cloth, physical protection) and expressive (rank, nationality, authority). The axis marks the dominant tendency, not a binary classification.

**The importance of the axis for change**: material and expressive components deterritorialize differently. An expressive code can change rapidly (a flag's meaning can shift in years); the material infrastructure it depends on changes much more slowly. Revolutions often involve rapid expressive deterritorialization (changing symbols, flags, legal codes) while the material assemblage (cities, roads, bodies) remains largely unchanged. The tension between axes drives many historical transitions.

### Axis 2: Territorializing ↔ Deterritorializing

Every *process* operating within an assemblage tends either to stabilize (territorialize) or to destabilize (deterritorialize) the assemblage:

**Territorializing processes**: processes that sharpen boundaries, consolidate the assemblage's identity, increase the homogeneity of components, and stabilize the relations among them. Examples: the standardization of a national language; the codification of legal norms; the walling of a city; the formation of habits in an individual; the specialization of organs in a developing body.

**Deterritorializing processes**: processes that blur boundaries, destabilize the assemblage, introduce heterogeneity, and transform or dissolve existing relations. Examples: migration disrupting the homogeneity of an urban population; a technological innovation making existing relations obsolete; trade routes connecting previously separate assemblages; a disease dissolving the stable relations among an organism's organs; a social movement challenging the taken-for-granted norms of a group.

**No assemblage is purely territorial or deterritorializing**: every assemblage that persists does so because territorializing and deterritorializing processes are in dynamic equilibrium — the assemblage is being stabilized and transformed simultaneously. An organism maintains itself (territorial: metabolism, homeostasis) while aging and changing (deterritorializing: growth, senescence, response to environment).

DeLanda formalizes this: the **degree of territorialization** (DoT) is a measure of how stable and sharply bounded the assemblage is; the **degree of coding** (DoC) is a measure of how expressive its components are. An assemblage with high DoT and high DoC is a highly institutionalized, rigidly coded organization (bureaucracy, the state apparatus). An assemblage with low DoT and low DoC is fluid, loosely connected, and heterogeneous (a bohemian social scene, a frontier town, a startup ecosystem).

## Domain instances

### Philosophy: Deleuze and Guattari's *agencement*

The term "assemblage" is the standard English translation of the French *agencement* — but this is misleading. *Agencement* means something closer to "arrangement," "fitting," or "layout" — it connotes active agency in the fitting-together, not the static connotation of "assemblage." Deleuze and Guattari introduce *agencements* in *A Thousand Plateaus* (1980) to name the basic unit of social production: not the subject (no centred agent), not the structure (no fixed code), but the arrangement of heterogeneous elements in contingent relations.

Their key examples:
- The **horse-rider-stirrup assemblage**: the introduction of the stirrup changed not just cavalry tactics but the entire feudal assemblage — land tenure, military organization, legal structures, political authority — because the stirrup created new capacities (stable lance-use on horseback) that propagated through the social assemblage
- The **book-content assemblage**: a book is not a text — it is an assemblage of physical support (paper, ink), semiotic content (signs, concepts), reading practices, and a social field into which it is plugged; the same signs plugged into different material and social assemblages produce different books
- The **face-assemblage**: the face is not a natural given but an assemblage of expressive coding (marks of identity, emotion, recognition) and material substrate (skin, bone); different cultural assemblages produce different faces (different codings of the same material)

Deleuze and Guattari's key claim: *desire* produces assemblages; the assemblage is the unit of desire — not the subject who desires, but the arrangement that desire assembles and that holds together.

### Social ontology: DeLanda's *A New Philosophy of Society* (2006)

DeLanda applies the assemblage concept to give a realist social ontology that avoids two failures:
- **Methodological individualism** (economics, rational-choice sociology): explains social wholes by reduction to individual properties and decisions; cannot account for genuine emergence (why cities and nations have properties and capacities no individual has)
- **Methodological holism** (classical sociology): explains individuals as expressions of social wholes; dissolves individual agency into social forces; cannot account for how individuals can change institutions

The assemblage concept threads between: social wholes are real and have emergent capacities (not reducible to individuals), but their components (persons, groups, institutions) retain independent identities (not dissolved into the whole).

DeLanda's levels of social assemblage:
| Scale | Examples | Material components | Expressive components |
|---|---|---|---|
| Interpersonal | Networks, encounters | Bodies, voices | Gestures, language |
| Organizational | Institutions, firms | Buildings, equipment | Roles, norms, codes |
| Urban | Cities, markets | Physical infrastructure | Laws, symbols, prices |
| National | States, economies | Territory, population | Flags, constitutions, languages |
| International | Treaty networks, world markets | Trade routes, military assets | Diplomatic codes, currencies |

Each level is real, not epiphenomenal. Cities have capacities (to concentrate talent, to produce innovation, to survive individual demographic change) that no individual or organization has. Nations have capacities (to declare war, to guarantee currency, to enforce territorial exclusivity) that no city has.

### Biology: ecological assemblages and holobionts

In ecology, an **assemblage** (or community) is a collection of species co-occurring in a habitat. The ecological assemblage is the canonical example of relations of exteriority in nature: each species retains its identity independent of the particular assemblage; the same species participates in different assemblages in different habitats; the assemblage's properties (species diversity, trophic structure, stability, productivity) emerge from the relations among species but are not present in any single species.

The **holobiont** concept (Margulis, Zilber-Rosenberg) extends this to organisms themselves: an organism is an assemblage of the host organism plus its microbiome; the microbiome's components (bacteria, archaea, viruses) retain their identities as species while participating in the organismal assemblage; human capacities (digestion, immune function, neurological regulation) are emergent capacities of the holobiont assemblage.

This is DeLanda's flat ontology in action: the organism is not at a privileged ontological level — it is an assemblage like any other, composed of components (organs, cells, microbiome members) that are themselves assemblages.

### Technology studies: ANT and sociotechnical assemblages

Latour's **Actor-Network Theory** (ANT) is an assemblage theory avant la lettre: human and non-human actors (things, texts, institutions, organisms) form networks (assemblages) in which each actor retains its identity while acquiring new capacities through network connections. Pasteur's laboratory is an assemblage of microbes, instruments, statistical techniques, funding bodies, and public health institutions. The assemblage's capacity to transform French agriculture depends on all these components' relations of exteriority.

The ANT principle of **symmetry** (treating human and non-human actors equivalently) corresponds to DeLanda's flat ontology: there is no privileged kind of component (human, institutional, material, ideal) — all are components that can participate in assemblages.

**Obligatory passage points** (Callon): in an assemblage, certain components become structurally indispensable — the relations of exteriority become so dense around them that the assemblage cannot function without them. This is a territorializing process: the passage point is an increasingly necessary node in the assemblage. It is the opposite of relations of exteriority becoming loosened.

### Architecture and urbanism: the city as assemblage

The city is DeLanda's central extended example of a social assemblage. A city is not its population (the population changes continuously), not its buildings (the buildings can be replaced), not its institutions (institutions can reform), not its markets (market structures evolve) — the city is the assemblage of all these, with emergent capacities that no component has individually:
- The capacity to attract further components (economic agglomeration)
- The capacity to survive individual catastrophes (resilience through redundancy)
- The capacity to innovate through random recombination of dense, heterogeneous components (Jane Jacobs's diversity hypothesis)
- The capacity to enforce territorial exclusivity (the city wall, the zoning code, the property regime)

The city's identity is maintained by ongoing territorializing processes (property law, zoning, infrastructure maintenance, cultural homogenization) while being continuously transformed by deterritorializing processes (migration, trade, technological change, social movements).

### Cognitive science: the extended mind as assemblage

Clark and Chalmers's **extended mind thesis** (1998) is an assemblage claim: cognitive capacities are not located in the brain but in the assemblage of brain, body, and environment (notebooks, smartphones, written language, social institutions). The same cognitive process — remembering, calculating, perceiving — can be realized in different assemblages (brain alone, brain-plus-notebook, brain-plus-institution). The cognitive capacity is an emergent property of the assemblage.

This generalizes: all cognition is sociotechnically assembled. Mathematical practice is an assemblage of minds, paper, notation systems, journals, and institutional norms; the capacity to prove theorems is an emergent capacity of the mathematical community assemblage, not locatable in any individual brain.

## Assemblage vs. Group, Institution, and System

These three concepts are the principal alternatives that assemblage theory is designed to distinguish:

| Concept | Component identity | Relations | Key invariant |
|---|---|---|---|
| **Assemblage** | Prior to and independent of the arrangement | Exterior: contingent, severable | Components survive dissolution |
| **Group** | Partially defined by constitution κ (algebraic groups: fully; social groups: partially) | May be interior (algebraic) or exterior (social) | Boundary + constitution |
| **Institution** | Positions fully defined by constitutive rules | Interior: the position exists only in context C | "X counts as Y in C" |
| **System** (functionalist) | Parts defined by function in the whole | Structural: the part's identity is its systemic function | Functional integration |
| **Structure** (structuralist) | Elements defined by their differences from each other | Interior: elements have no identity outside the structure | Differential identity |

**Assemblage vs. Group**: a mathematical group's elements have identities only relative to the group operation — $\mathbb{Z}/n\mathbb{Z}$ has elements that are equivalence classes, defined by the congruence relation that constitutes the group. A social group's members have prior identities (as persons) but acquire group-relative identities (as members) through the constitution $\kappa$; the group concept is a spectrum from fully interior (algebraic) to predominantly exterior (loose social groups). Assemblage theory holds that social aggregations are better described as assemblages with exterior relations than as groups with interior constitutions — persons are not defined by their group memberships, even if their capacities are transformed by them.

**Assemblage vs. Institution**: an institution is a system of constitutive rules that creates positions which have no existence outside the institutional context. The position "Chief Justice" does not exist outside the legal institution; it is constituted by the institution's rules. In an assemblage, the components exist outside the assemblage. A court is an assemblage of persons (with prior identities as persons), physical spaces (courtrooms with independent physical existence), documents, procedural norms, and institutional positions; the institutional positions (judge, attorney, clerk) are interior elements, but the persons, physical spaces, and documents are exterior components.

**Assemblage vs. System**: systems theory (Parsons, Luhmann) treats the system as a self-reproducing whole in which parts are defined by their functional contribution to the whole's reproduction. The system is autopoietic — it produces its own components. In an assemblage, the components are not produced by the assemblage — they are recruited into it. The assemblage is *allopoietic* from the perspective of its components: each component is produced elsewhere and plugged in.

## The categorical reading

An assemblage $\mathcal{A} = (C, \mathrm{Rel}, \mu, \partial, E)$ has a natural categorical formalization:

Let $J_\mathcal{A}$ be a small category (the **indexing category** of $\mathcal{A}$) whose:
- Objects are the components $c \in C$
- Morphisms are the relations $r \in \mathrm{Rel}$ between components (with identities added)

Let $\mathcal{R}$ be the ambient category in which the assemblage lives (e.g., the category of sheaves on the history site, or a category of socio-material entities).

The assemblage is a **diagram** $D : J_\mathcal{A} \to \mathcal{R}$: a functor sending each abstract component to its concrete realization in $\mathcal{R}$, and each abstract relation to a concrete morphism.

**Relations of exteriority** become the statement: each $D(c)$ is an independently existing object in $\mathcal{R}$ — it exists in $\mathcal{R}$ prior to and independent of the diagram $D$. The diagram $D$ is not what creates the objects; it is what arranges them.

**The assembled whole** is the **colimit** $\mathrm{colim}(D)$ in $\mathcal{R}$, if it exists. The colimit is the universal target of all the morphisms in the diagram — the "most efficient" object that all components map into consistently. The colimit exists when the relations of exteriority are consistent enough to admit a coherent assembled perspective.

**Emergent capacities** $E$ correspond to elements of $\mathrm{colim}(D)$ that are not in the image of any single $D(c)$: they arise from the colimit but cannot be attributed to any component. They are genuinely new: they exist in the assembled whole but nowhere in the components.

**Territorializing processes** are functors that stabilize the diagram — sending components to more tightly related objects in $\mathcal{R}$, or adding morphisms to $J_\mathcal{A}$, increasing the coherence of the diagram. **Deterritorializing processes** are functors that loosen the diagram — removing morphisms, replacing objects with more heterogeneous ones, or mapping components to different objects in $\mathcal{R}$.

The distinction between Assemblage and Group in categorical terms: a Group (in the algebraic sense) is a diagram that generates its own objects — the elements of the group are the morphisms, not independent objects. An Assemblage is a diagram where the objects have prior existence; the diagram is something laid over pre-existing entities.

## Nuclear reading

**Sources:** Saturation Nucleus, Transfer Nucleus, Meet Preservation, Idempotence, Commutation.

**Definition (Components as prior fiber elements).** The components $c \in C$ of an assemblage correspond to elements of $H_t$ that are present in the fiber regardless of whether the assemblage holds: the assemblage does not create them as fiber elements, but arranges them in contingent relations. The relations of exteriority $\mathrm{Rel}$ are propositions in $H_t$ asserting contingent connections between component elements. Crucially, a relation $r \in \mathrm{Rel}$ is *exterior* precisely when $r$ could be absent — when severing $r$ from the assemblage does not remove its component-elements from $H_t$.

**Definition (Assemblage stability).** The assemblage $\mathcal{A}$ is *stable at $t$* iff all its relation-propositions are doubly settled: $\mathrm{Rel} \subseteq H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$. The assemblage is *unsettled* iff some $r \in \mathrm{Rel}$ satisfies $r \notin H^*_t$ — present in the fiber but not yet both meaning-settled and forward-active.

**Definition (DeLanda axes as nuclear axes).** The material-expressive axis $\mu$ marks which component propositions are primarily processed by $\sigma_t$ (expressive: semiotic, backward-facing, meaning-settled by the past) vs. $\Delta_t$ (material: causal-functional, forward-facing, execution-active across extensions). The territorial-deterritorializing axis $\partial$ marks whether a process moves relation-propositions toward $H^*_t$ (territorializing: stabilizing) or away from $H^*_t$ toward $H_t \setminus H^*_t$ (deterritorializing: destabilizing). These are definitions, not derivations.

**Proposition (Stable assemblage meets are stable).** If $\mathcal{A}$ is stable at $t$ — i.e., all $r_i \in \mathrm{Rel}$ satisfy $r_i \in H^*_t$ — then for any finite sub-collection $r_1, \ldots, r_n \in \mathrm{Rel}$, the meet $r_1 \wedge \cdots \wedge r_n \in H^*_t$.

*Proof.* By assumption each $r_i \in \mathrm{Fix}(\sigma_t)$. By meet-preservation of $\sigma_t$ (Meet Preservation), $\sigma_t(r_1 \wedge \cdots \wedge r_n) = \sigma_t(r_1) \wedge \cdots \wedge \sigma_t(r_n) = r_1 \wedge \cdots \wedge r_n$. The same holds for $\Delta_t$ by its meet-preservation. Hence $r_1 \wedge \cdots \wedge r_n \in H^*_t$. $\square$

**Corollary.** The "most restrictive" relation among a finite set of doubly-settled relations (their meet) is itself doubly settled. A stable assemblage is closed under finite conjunctions of its own relation-propositions.

**Non-derivability note (exterior vs. interior relations).** The nuclear axioms do not formally distinguish exterior relations (which could be severed without removing components from $H_t$) from interior relations (which constitute the components). This distinction is a structural condition on the sheaf — specifically, whether the component-elements $c_i$ are in $H_t$ independently of the truth of the relation-propositions in $\mathrm{Rel}$. The nuclear axioms characterize the behavior of $\sigma_t$ and $\Delta_t$ on elements already in $H_t$; they do not determine which elements are structurally dependent on which others. Whether a given $r \in \mathrm{Rel}$ is a genuine relation of exteriority is not derivable from $\sigma_t$ and $\Delta_t$ alone; it requires inspection of the sheaf's restriction and extension maps.

**Remark (Emergent capacities).** An emergent capacity $e \in E$ is a proposition in $H_t$ that exceeds any individual component's saturation closure: $e > c_i$ for all $c_i \in C$ and $e \leq \sigma_t(\bigvee_{c_i \in C} c_i)$ (reachable from the join of the components by the saturation closure). The claim $e \in \mathrm{Fix}(\sigma_t)$ — that emergent capacities are meaning-settled — is a definition of the intended assemblage model, not derivable from the nuclear axioms. What the nuclear axioms guarantee is that if $e \in \mathrm{Fix}(\sigma_t)$, then $\sigma_t(e) = e$ with no further closure needed (by idempotence: $\sigma_t(\sigma_t(e)) = \sigma_t(e) = e$).

## Open questions

- Whether the assemblage's colimit $\mathrm{colim}(D)$ in $H_t$ always exists — whether the Heyting algebra structure guarantees a join for any diagram of components with exterior relations, or whether some assemblage configurations fail to have a colimit (fail to assemble into a coherent whole).
- Whether the DeLanda-Deleuze tension (DeLanda's realist flat ontology vs. Deleuze's vitalist ontology of difference) has a formal resolution in the fiber structure — whether DeLanda's realism corresponds to working within the fixed fiber $H^*_t$ (settled entities with real capacities) while Deleuze's difference-in-itself corresponds to working in $H_t \setminus H^*_t$ (the pre-individual, pre-settled zone of pure difference and becoming).
- Whether every Group can be viewed as a degenerate assemblage with interior relations — whether the distinction between interior and exterior relations is a gradation (relations can be more or less definitional of their relata) rather than a binary — and if so, what the formal criterion for the interior/exterior distinction is in fiber terms.
- Whether the holobiont reading (organism as assemblage of host plus microbiome) requires that the microbiome's components are *separately* in $H_t$ from the host's components — whether the fiber can represent the prior and independent existence of the microbiome components relative to the host-microbiome assemblage — or whether this requires a multi-fiber (multi-history) approach where the components have histories that predate the assemblage.
- Whether the ANT symmetry principle (human and non-human actors treated equivalently) has a fiber-theoretic expression: whether there is a single fiber $H_t$ that contains both material and semiotic elements without privileging either — and whether this is already the case in the relational hyperverse (both types of elements are just elements of the Heyting algebra) or whether special structure is needed to model the material-expressive distinction formally.
