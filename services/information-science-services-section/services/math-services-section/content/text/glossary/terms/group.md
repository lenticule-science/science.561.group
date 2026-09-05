---
id: group
description: "A Group is a five-tuple (M, B, ι, κ, ε) — a membership set M of persons or entities, a boundary criterion B that determines inside from outside, an identity function ι that each member holds in relation to the group, a constitution κ specifying the internal structure (role assignments, norms, hierarchy, or shared operation), and an exterior recognition ε by which the group is addressable as a single unit from outside. The defining structure: boundary-plus-constitution — a group is not a mere collection because it has an operative inside/outside distinction (B) and a structure that holds among the members (κ). Without B, you have an aggregate. Without κ, you have a crowd. Without ι, you have a set. The group is the conjunction of bounded membership and internal structure."
date-created: 2026-03-19
date-modified: 2026-03-19
params:
  membership-set: relational-universe
  boundary-criterion: relational-universe-morphism
  member-identity-relation: relational-universe-morphism
  constitution: relational-universe
  exterior-recognition: relational-universe-morphism
output: relational-universe
ast:
  group-structure:
    - membership-set
    - boundary-sieve:
        - membership-set
        - boundary-criterion
    - member-identity-relation:
        - membership-set
    - internal-relation-closure:
        - membership-set
        - constitution
    - normative-recognition-installation:
        - exterior-recognition

---

# Group

## Formal definition

A **Group** is a five-tuple $\mathcal{G} = (M, B, \iota, \kappa, \varepsilon)$:

$$\mathcal{G} = (M : \mathrm{Set},\; B : \mathrm{BoundaryCriterion},\; \iota : M \to \mathrm{MemberIdentity},\; \kappa : \mathrm{Constitution}(M),\; \varepsilon : \mathrm{ExteriorRecognition})$$

where:
- $M$ is the **membership set** — the set of persons or entities that are members; $M$ may be finite or infinite, but it must be determinate: for any candidate $x$, the criterion $B$ decides whether $x \in M$ or $x \notin M$
- $B$ is the **boundary criterion** — the rule that partitions entities into members and non-members; $B$ may be sharp (legal registration, signed articles, formal enrollment) or procedural (a recognition test, a rite of passage, a vote); but some criterion must exist and be operative; without $B$, the group has no inside and no outside and is merely a collection
- $\iota : M \to \mathrm{MemberIdentity}$ is the **identity relation** — the function assigning each member a standing within the group: the relation each $m \in M$ has to the group as a member, not as an external party; $\iota(m)$ may be equal across all members (flat groups), differentiated by role (hierarchical groups), or structured by seniority, office, or function; but each member has some determinate $\iota(m)$ that is different from the standing of non-members
- $\kappa$ is the **constitution** — the internal structure that holds among members; $\kappa$ may be an algebraic operation (mathematical groups), a role assignment with norms (social groups, organizations, crews), a shared intention structure (collective intentionality), a symmetry operation (physical groups), or a legal framework (corporations, partnerships); $\kappa$ is what the group does internally — it is not reducible to the sum of individual member properties
- $\varepsilon$ is the **exterior recognition** — the capacity of the group to be addressed, treated, or held accountable as a single unit from outside; $\varepsilon$ may be legal (the corporation has standing in court), social (the group has a name by which outsiders refer to it), operational (the crew is the addressable unit in maritime law), or epistemic (the physics community is the relevant expert body on a question); without $\varepsilon$, the group has no external face and is invisible as a unit

**Five invariants.** $\mathcal{G}$ is a group iff it satisfies:

1. **Boundary is operative**: $B$ decides membership. For every candidate $x$, either $x \in M$ or $x \notin M$ — the group has a determinate inside. A porous or indefinite $B$ produces an aggregate or a crowd, not a group.

2. **Constitution is internal**: $\kappa$ holds among members as members, not merely as individuals who happen to coexist. The joint enterprise doctrine in law, the binary operation in algebra, the shared norm in social psychology, the symmetry operation in physics — each is a relation that holds within the group and not merely between individuals considered separately.

3. **Member standing is distinct from non-member standing**: for all $m \in M$ and $n \notin M$, $\iota(m) \neq \iota(n)$ with respect to the group's constitution $\kappa$. A member is subject to $\kappa$ in a way a non-member is not. This is what distinguishes membership from mere proximity.

4. **Persistence through member change (with threshold)**: the group persists through changes to $M$ provided $M$ does not fall below a threshold $k_{\min}$ determined by $\kappa$. For a mathematical group, $k_{\min} = 1$ (even a trivial group with only the identity element is a group). For a partnership, $k_{\min} = 2$. For a crew, $k_{\min}$ is the minimum complement of the vessel. Below $k_{\min}$, the group dissolves or ceases to be operative as that kind of group.

5. **Exterior recognition is non-trivial**: $\varepsilon$ assigns the group at least one address, name, or liability surface by which external parties can relate to it as a unit. A group with no exterior recognition at all — known to no one, addressable by no one, holding no external position — is a latent group. Operative groups have some $\varepsilon$.

## The boundary/constitution dyad

The dyad $(B, \kappa)$ is what makes a group a group rather than some adjacent thing.

$B$ alone (a rule for sorting entities without any internal structure) produces a **category** in the sociological sense (all left-handed people, all redheads, all persons born in 1990) — not a group. Categories have boundaries but no internal structure. Members of a category need not interact, know of each other, or bear any relation to each other beyond satisfying $B$.

$\kappa$ alone (an internal structure without a boundary) is impossible: a structure must hold among a determinate set of things. Without $B$, $\kappa$ has no domain to act on.

The conjunction $(B, \kappa)$ — a determinate membership with an internal structure holding among those members — is the irreducible minimum. Every subsequent component ($\iota$, $\varepsilon$) enriches the group but does not constitute it.

## Domain instances

### Mathematical group (abstract algebra)

A **mathematical group** is a set $G$ equipped with a binary operation $\cdot : G \times G \to G$ satisfying:
- **Closure**: for all $a, b \in G$, $a \cdot b \in G$
- **Associativity**: $(a \cdot b) \cdot c = a \cdot (b \cdot c)$ for all $a, b, c \in G$
- **Identity**: there exists $e \in G$ such that $e \cdot a = a \cdot e = a$ for all $a \in G$
- **Inverses**: for each $a \in G$, there exists $a^{-1} \in G$ such that $a \cdot a^{-1} = a^{-1} \cdot a = e$

The group tuple maps as follows: $M = G$ (the underlying set), $B$ = the type constraint (membership in $G$ as a typed set), $\iota(g)$ = the element $g$ itself with its left and right multiplication by all other elements (its position in the Cayley table), $\kappa$ = the binary operation $\cdot$ with its four axioms, $\varepsilon$ = the abstract group structure recognized by other algebraic structures via homomorphisms.

**The mathematical group is the most stripped group concept**: it has nothing but a set, an operation, and four constraints. Its $B$ is type membership; its $\iota$ is element identity in the algebraic sense; its $\kappa$ is the operation; its $\varepsilon$ is the homomorphism interface. What makes it the deepest example is what Cayley's theorem says: every group is isomorphic to a group of symmetries (a permutation group). Every mathematical group is, at root, a group of transformations that compose. The group structure is the structure of closed, reversible, associative composition.

**Weaker structures**: a **semigroup** has $\kappa$ = associative binary operation but lacks identity and inverses. A **monoid** adds identity but lacks inverses. A **group** adds inverses. Each addition to $\kappa$ increases the structure. The mathematical progression semigroup → monoid → group → abelian group tracks increasing constraints on $\kappa$.

**Subgroups and normal subgroups**: a subset $H \subseteq G$ is a subgroup iff $H$ is itself a group under the restricted operation. $H$ is a normal subgroup iff it is closed under conjugation: $gHg^{-1} = H$ for all $g \in G$. Normal subgroups are the kernels of group homomorphisms and the building blocks of quotient groups $G/H$. The subgroup is a sub-group in the literal sense: its boundary $B_H$ is sharper than $B_G$, and its constitution $\kappa_H$ is the restriction of $\kappa_G$.

**Lie groups**: a group $G$ equipped with a smooth manifold structure compatible with the group operation. The constitution $\kappa$ now requires not only algebraic closure but differential smoothness. Lie groups are the mathematical model for continuous symmetry in physics.

**Galois connection**: the Galois correspondence (Galois, 1832) maps subgroups of the Galois group $\mathrm{Gal}(L/K)$ to intermediate fields between $K$ and $L$, reversing inclusion. The symmetries of a polynomial (the group) determine which roots can be expressed by radicals (the field structure). This is the deepest statement of what a group "is": a group is the structure of all symmetries of an object, and understanding the group structure is equivalent to understanding what transformations leave the object invariant.

### Social group (sociology and social psychology)

A **social group** in the sociological tradition requires at least:
- A determinate membership criterion $B$ (members recognize each other as members)
- Interaction or relation among members — some $\kappa$ that holds among them as members
- A shared identity or sense of "we" — $\iota(m)$ includes $m$'s recognition of belonging

Cooley's (1909) primary/secondary distinction tracks the constitution $\kappa$:
- **Primary groups** (family, friendship circle, village): $\kappa$ includes face-to-face interaction, emotional intimacy, and diffuse obligations that extend across all life domains; $M$ is small
- **Secondary groups** (professional association, political party, military unit): $\kappa$ is instrumental and role-segmented; members interact in specific capacities, not as whole persons; $M$ can be large

Sumner's (1906) in-group/out-group distinction is the boundary $B$ made salient: the in-group is defined by the contrast with the out-group; $B$ is sharpened by perceived difference from $G^c$ (the complement). **Ethnocentrism** is the cognitive effect of a sharp $B$: members of $M$ evaluate outsiders by the standards of $\kappa$.

Tajfel and Turner's (1979) **Social Identity Theory** is the account of $\iota$: a person's self-concept partly consists of $\iota(m)$ — their standing as a member of various groups. Group membership contributes to social identity because $\iota$ maps each member to a group-relative self. Discrimination and in-group favoritism follow when groups compete and $\iota(m)$ depends on the relative standing of $\mathcal{G}$ against other groups.

**Aggregate vs. category vs. group**: the core sociological distinction:
- **Aggregate** (people waiting at a bus stop): shares a location but has no $B$, no $\kappa$, no $\iota$ — not a group
- **Category** (all left-handed people): has $B$ (the criterion) but no $\kappa$, no interaction — not a group
- **Crowd** (people watching an accident): has co-presence and possibly shared attention but no $B$ with membership criterion, no $\kappa$ with internal structure — emergent, ephemeral, not a group
- **Group** (a sports team, a department, a family): has $B$ (who counts as a member), $\kappa$ (roles, norms, shared task), $\iota$ (member identity), and $\varepsilon$ (named, addressable from outside)

A crowd can become a group if it develops a boundary criterion and internal structure: the aggregate that organizes into a rescue effort develops $B$ (who is helping), $\kappa$ (coordination norms), and $\iota$ (role distinctions). The transition from crowd to group is the acquisition of $B$ and $\kappa$.

### Legal and organizational group

A **legal group** is one where $\varepsilon$ includes legal personality — the capacity to appear in legal relations as a single unit. The forms:

**Partnership** (two or more persons carrying on a business together): $M$ = partners, $B$ = partnership agreement, $\kappa$ = joint liability for debts and mutual agency (each partner can bind the partnership), $\iota(m)$ = partner status with full liability, $\varepsilon$ = partnership as an addressable unit (in some jurisdictions with limited legal personality, in others simply as a named firm).

**Corporation** (a juridical person distinct from its members): $M$ = shareholders/directors (depending on which constitution $\kappa$ applies), $B$ = registration and share ownership, $\kappa$ = the Articles of Incorporation and bylaws, $\iota(m)$ = shareholder or director status with limited liability, $\varepsilon$ = full separate legal personality (the corporation can sue, be sued, own property, contract — independently of its members). *Salomon v. A. Salomon & Co.* [1897] AC 22: the corporation's $\varepsilon$ is so complete that a single-member company is a separate legal person from its sole shareholder.

**Unincorporated association** (a club, a union without registration): $M$ = members, $B$ = membership rules, $\kappa$ = the rules of the association, $\iota(m)$ = membership rights, $\varepsilon$ = limited — cannot hold property in its own name, cannot sue or be sued directly (members sue as representatives). The unincorporated association has boundary and constitution but incomplete exterior recognition.

**Joint enterprise doctrine**: persons who pursue a common criminal or tortious purpose together are treated as a group with joint liability — even without any formal constitution $\kappa$. The law constructs the group from shared action: $B$ is determined retrospectively from participation, $\kappa$ is the common purpose, $\iota(m)$ is co-perpetrator or accessory status. This is the law creating a group for liability purposes where none was constituted in advance.

The legal progression from unincorporated association to partnership to corporation tracks increasing $\varepsilon$: each step gives the group a more complete exterior face — more legal personality, more capacity to act as a unit.

### Cognitive and linguistic group

**Collective intentionality** (Bratman 1999, Searle 1995): a social group requires, at minimum, that its members have "we-intentions" — intentions framed as "we are doing X" rather than merely "I am doing X while others happen to do X." On this view, $\kappa$ requires shared intentional states, not merely coordination.

**Bratman's planning theory**: a group acting together requires: (i) each member intends that the group does $X$ by means of each member doing their part; (ii) each member intends that this is done by means of the intentions of the others; (iii) these intentions are mutually known. The planning structure is the constitution $\kappa$: the group's action is structured by a shared plan.

**Searle's collective intentionality**: "we-intentions" are irreducible — they cannot be analyzed as conjunctions of "I-intentions" plus mutual belief. A group that merely has coordinated individual intentions is not the same as a group with genuine collective intentionality. The distinction matters for $\kappa$: social groups in Searle's sense have a $\kappa$ that includes irreducible collective intentional states.

**Linguistic collective nouns**: English uses collective nouns ("committee," "jury," "crew," "flock," "herd") that refer to groups. British English allows both singular agreement ("the committee is meeting") and plural agreement ("the committee are meeting"), tracking whether the group is treated as a single unit (singular) or as individual members acting together (plural). The singular/plural choice marks whether $\varepsilon$ or $\iota$ is foregrounded: the corporation "is" meeting (treating $\varepsilon$ as primary), while "the committee are arguing among themselves" (treating individual $\iota$'s as primary).

**Team vs. group**: a team has $\kappa$ specifically organized around task achievement with role differentiation and a shared goal. A team is a group with a specialized $\kappa$ (task-oriented constitution). Every team is a group; not every group is a team. A family is a group but not a team; a project team is both.

### Physics and chemistry: symmetry groups

A **symmetry group** is a mathematical group $G$ whose elements are symmetry operations on a physical or geometric object, and whose composition law is the operation of performing one symmetry after another.

**Point groups** (molecular symmetry): the symmetry group of a molecule consists of all rotations, reflections, improper rotations, and inversions that leave the molecule invariant. The group structure encodes which symmetry operations compose to give which other operations. The character table of the point group determines the selection rules for spectroscopy: which transitions are allowed and which are forbidden. The group structure is not metaphorical — the actual physical predictions of quantum chemistry (dipole transitions, Raman activity, orbital symmetry) follow from the group-theoretic analysis.

**Space groups** (crystallographic symmetry): the symmetry group of a crystal includes point symmetries plus translational symmetry. The 230 space groups classify all possible crystal structures. The group structure determines the diffraction pattern: Bragg's law and systematic absences follow directly from the space group.

**The physical meaning**: in physics, a symmetry group is the group of transformations that leave a physical system invariant. By Noether's theorem, every continuous symmetry (a one-parameter Lie group of transformations) corresponds to a conservation law. Rotational symmetry (SO(3)) corresponds to conservation of angular momentum; translational symmetry ($\mathbb{R}^3$) corresponds to conservation of linear momentum; time-translation symmetry ($\mathbb{R}$) corresponds to conservation of energy.

The physical role of the group concept: the group is the structure of all transformations that preserve the relevant property. The "group" is what is left invariant — the symmetry is the group, not a property that groups happen to have.

## The invariant formal structure across domains

The five-tuple $(M, B, \iota, \kappa, \varepsilon)$ appears in each domain:

| Domain | $M$ | $B$ | $\iota$ | $\kappa$ | $\varepsilon$ |
|---|---|---|---|---|---|
| Mathematical group | Set $G$ | Type membership | Element identity | Binary op + 4 axioms | Homomorphism interface |
| Primary social group | Persons | Mutual recognition | Social identity contribution | Face-to-face norms, diffuse obligations | Named, recognizable as a unit |
| Corporation | Shareholders | Share registration | Shareholder/director status | Articles, bylaws | Full legal personality |
| Crew | Persons | Signed articles | Role assignment ($R(p)$) | Role complement + command | Collectively addressed in maritime law |
| Symmetry group | Transformations | Closure under composition | Element as transformation | Composition law | Acts on the object; determines invariants |
| Criminal joint enterprise | Participants | Common purpose + participation | Co-perpetrator/accessory | Shared criminal plan | Treated as group for liability |

The invariant: across every domain, what makes something a group rather than a collection is the conjunction of (1) a determinate boundary $B$ and (2) an internal structure $\kappa$ holding among members as members. Every other component follows from or enriches this conjunction.

## The minimum required for grouphood

The minimum required for something to be a group rather than a mere collection, aggregate, or crowd:

1. **A determinate membership criterion** ($B$ is operative): the group must have a way of deciding who is in and who is out. The criterion need not be sharp (a threshold probability works); it must be determinate.

2. **An internal structure holding among members as members** ($\kappa$ is non-trivial): the members must stand in some relation to each other in virtue of being members, not merely in virtue of their individual properties. The relation may be an algebraic operation, a norm system, a shared intention, a symmetry operation, or a legal framework.

These two conditions are necessary and sufficient for a collection to be a group in the minimal sense. Every other property (hierarchical role structure, legal personality, collective intentionality, face-to-face interaction, shared purpose) enriches the group concept but is not required for grouphood.

## Distinguishing group from adjacent concepts

| Concept | $B$ | $\kappa$ | $\iota$ | $\varepsilon$ | What it lacks |
|---|---|---|---|---|---|
| **Set** | Type membership | None required | Element membership | None | $\kappa$ — sets have no internal structure among elements |
| **Aggregate** | None or accidental | None | None | None | $B$ and $\kappa$ — no criterion, no structure |
| **Category** (sociological) | Yes — a sorting criterion | None | None | None | $\kappa$ — no internal structure among members |
| **Crowd** | Accidental (co-presence) | Emergent (shared attention) | None | Ephemeral | $B$ — no stable membership criterion |
| **Collection** | Pragmatic (what the collector includes) | None | None | None | $\kappa$ — no internal structure |
| **Team** | Yes | Task-organized role differentiation | Role-specific | Yes | No deficiency — team is a group with specialized $\kappa$ |
| **Organization** | Yes | Formal role hierarchy | Office/role | Full $\varepsilon$ | No deficiency — organization is a group with institutionalized $\kappa$ |
| **Corporation** | Legal registration | Legal constitution | Share/director | Full legal personality | No deficiency — corporation is a group with maximum $\varepsilon$ |
| **Crew** | Signed articles | Role complement + command | Role assignment | Collective address | No deficiency — crew is a group with platform-determined $\kappa$ |

**Group vs. set**: a set has members but no internal structure among them. The set $\{a, b, c\}$ imposes no relation on $a$, $b$, and $c$ beyond their co-membership. A group imposes $\kappa$ on its members: they stand in specific relations to each other in virtue of being members.

**Group vs. aggregate**: an aggregate is a collection with no determinate boundary criterion — the people currently on a city block, the molecules in a gas. The aggregate has no $B$ and no $\kappa$. Groups have both.

**Group vs. crowd**: a crowd is a transient co-presence without stable membership ($B$ is accidental and ephemeral) and without durable internal structure ($\kappa$ dissolves when the crowd disperses). A crowd that develops stable membership criteria and internal organization becomes a group.

**Group vs. team**: a team is a group with $\kappa$ specifically organized around task achievement with differentiated roles and a shared goal. The team's $\kappa$ is goal-constituted; the group's $\kappa$ may be goal-constituted, role-constituted, norm-constituted, or algebraically constituted. Every team is a group; not every group is a team.

**Group vs. organization**: an organization is a group with an institutionalized $\kappa$ — a formal role hierarchy, rules of procedure, and a constitutive charter that persists independently of any particular member set. An organization has all five components fully developed. A group may have an informal $\kappa$ and minimal $\varepsilon$.

## Membership criterion: what constitutes being IN a group

Membership in a group ($m \in M$) is determined by $B$. The criterion $B$ varies by domain:

- **Mathematical group**: $B$ is type membership — an element $g$ is in $G$ if it belongs to the underlying set; in algebraic practice, $G$ is given as a set with operations, and $B$ is the set-theoretic boundary
- **Social group**: $B$ is mutual recognition — an entity is in a social group when the members of the group recognize it as a member (Stryker and Burke 2000); the recognition may be formal (enrollment) or informal (social acceptance)
- **Legal group (corporation)**: $B$ is share ownership or registration — determined by the company register; no ambiguity
- **Crew**: $B$ is signing the articles of agreement — the formal act that constitutes crew membership for the voyage; physical presence on the vessel is not sufficient
- **Symmetry group**: $B$ is closure under the group operation — an operation is in the symmetry group if it maps the object to itself and is composable with other members to give a member; membership is internally determined by the algebraic closure axiom

**Association vs. membership**: being associated with a group — being related to its members, being physically near it, being affected by its actions — does not constitute membership. The ship's passenger is associated with the crew but is not crew (46 U.S.C. § 2101). The corporation's customer is associated with the corporation but is not a shareholder. Association is a relation between a non-member and the group; membership is the relation between a member and the group mediated by $B$ and $\iota$.

## Shared identity, purpose, structure

**Is shared identity required?** Shared identity — Tajfel's social identity, the sense of "we" — is required for social groups and primary groups, not for mathematical or physical groups. The elements of $\mathbb{Z}/2\mathbb{Z}$ do not have a shared identity. The symmetry operations of a water molecule do not have a purpose. Shared identity is a component of $\kappa$ for person-groups but not for entity-groups.

**Is shared purpose required?** Shared purpose is required for teams and organizations (it is part of their specialized $\kappa$) but not for groups in general. A family is a group without a defined shared purpose. A mathematical group has no purpose. A social group defined by shared history (alumni of a school) may have no current shared purpose.

**Is shared structure required?** Yes. The requirement of an internal structure $\kappa$ holding among members is the invariant across all domains. $\kappa$ may be the shared operation (algebra), the shared norm (sociology), the shared legal constitution (law), the shared symmetry (physics), or the shared intentional plan (cognitive science). The specific form of $\kappa$ differs; the requirement that $\kappa$ exists does not.

## Is there a unifying formal invariant?

Yes. The invariant across mathematical, social, legal, cognitive, and physical groups is:

$$\text{Group} = \text{Boundary} + \text{Constitution}$$

More precisely: a group is a set with a determinate membership boundary and an internal structure holding among members as members.

This is an orbit in the philosophical sense: every domain instance of "group" is an orbit of the following action: "what transformations (of members, of time, of personnel) leave the group as the same group?" A mathematical group is invariant under its own internal operations (closure). A corporation is invariant under shareholder changes (the legal person persists). A crew is invariant under member changes within the complement (the crew persists through watch changes). A symmetry group is invariant under the operations it describes. In each case, the group is the structure that persists through its own internal operations.

The deepest reading, from Galois and Klein's Erlangen Program (1872): a group is the structure of all transformations that leave an object invariant. The "group" and the "invariant" are two names for the same structure. A group is characterized by what it preserves.

## Relation to existing specs

**Group and Crew**: a crew is a group where $\kappa$ is platform-determined (the vessel $V$ determines the role structure), $B$ is the formal articles of agreement, $\iota(m) = R(m)$ (the role assigned to person $m$), and $\varepsilon$ is the crew's collective address in maritime law. Crew is Group with specialized $\kappa$ and formal $B$.

**Group and [Vessel](../../../../../knowledge-services-section/services/research-services-section/content/text/glossary/terms/vessel.md)**: a vessel is not a group — it is the institutional person for which a group (the crew) is constituted. The vessel provides the $\kappa$-structure (the role hierarchy, the charter) that the crew instantiates. The vessel persists when the crew changes; the crew is a group constituted by the vessel's complement structure.

**Group and Person**: a person can be a member of a group ($m \in M$ for some $\mathcal{G}$). A group can have legal personhood — the corporation is a juridical person in the person quadruple $(I, N, R, \Phi)$ sense, where $I$ is the registration number, $N$ is the corporation's normative position, $R$ is the constitutive act of incorporation, and $\Phi$ is the corporation's representability structure. The group-as-person and the person-as-group-member are two different relations.

**Group and Principal**: a group can be a principal — the corporation as original authority within its chartered domain. The principal structure $(A, Q, \mathrm{Ag})$ applies to the group when the group as a unit holds original authority, delegates to agents, and retains accountability.

**Group and Office**: an office is a normative position that a group can define and that its members can occupy. The group's $\kappa$ may include an office hierarchy; each office is a persistent normative position within the group. The group constitutes offices; persons are installed in them.

**Group and Area**: a group can have an area — the domain within which it exercises authority, responsibility, or interest. The area is always area-$R$-of-$X$ where $X$ is the group. The group's area is the spatial or functional extent of its $\kappa$.

**Group and Institution**: an institution is a rule-system; a group is a set of persons or entities under a constitution. The two are distinct: an institution can exist without constituting a determinate group (contract law is an institution; there is no "group" of contracting parties in general). A group can exist with an informal $\kappa$ that does not rise to the formality of an institution. When a group has a formal constitutive rule-system with collective recognition — when its $\kappa$ is an institution — the group and the institution overlap. A corporation is a group (the shareholders and directors under the Articles) and an institution (the rule-system that governs them) simultaneously.

## Nuclear reading

**Sources:** Saturation Nucleus, Transfer Nucleus, Meet Preservation, Idempotence, Commutation.

**Definition (Operative membership at $t$).** A member-element $m_i \in H_t$ of a group $\mathcal{G}$ is *in good standing at $t$* iff its identity proposition $\iota(m_i) \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$: the member's standing in the group is both meaning-settled (recognized by the normative saturation of the group's context) and forward-stable (present in every one-step extension of $t$).

The constitution $\kappa$ corresponds to the restriction of the nuclear structure $(\sigma_t, \Delta_t)$ to the sub-Heyting-algebra generated by $\{m_i\}$: the pair of nuclei that govern what it means to be a constitutionally compliant member. The exterior recognition $\varepsilon$ corresponds to the condition that the group proposition $g_t = \bigwedge_{m_i \in M} \iota(m_i)$ (the conjunction of all members' identity propositions) is a global section of the fixed-fiber sub-presheaf $H^*|_{T_\mathcal{G}}$ over the group's active lifespan.

**Proposition (Finite group closure under saturation).** Let $\mathcal{G}$ be a finite group with members $m_1, \ldots, m_n \in M$ and suppose all individual identity propositions satisfy $\iota(m_i) \in \mathrm{Fix}(\sigma_t)$ for $i = 1, \ldots, n$. Then the meet $\bigwedge_{i=1}^n \iota(m_i) \in \mathrm{Fix}(\sigma_t)$.

*Proof.* By meet-preservation of $\sigma_t$ (Meet Preservation):
$$\sigma_t\!\left(\bigwedge_{i=1}^n \iota(m_i)\right) = \bigwedge_{i=1}^n \sigma_t(\iota(m_i)) = \bigwedge_{i=1}^n \iota(m_i)$$
where the last equality uses $\iota(m_i) \in \mathrm{Fix}(\sigma_t)$ for each $i$. The finite meet of $\sigma_t$-fixed elements is $\sigma_t$-fixed. $\square$

**Proposition (Finite group closure under transfer).** Under the same hypotheses with $\iota(m_i) \in \mathrm{Fix}(\Delta_t)$, the meet $\bigwedge_{i=1}^n \iota(m_i) \in \mathrm{Fix}(\Delta_t)$.

*Proof.* Identical argument using meet-preservation of $\Delta_t$. $\square$

**Corollary (Finite group conjunction is doubly settled).** If all $\iota(m_i) \in H^*_t$, then $\bigwedge_{i=1}^n \iota(m_i) \in H^*_t$. The group-as-a-whole proposition is doubly settled whenever every individual member standing is doubly settled.

**Remark on infinite groups.** For an infinite group $M$ (e.g., a norm-governed community with unbounded membership), the meet-preservation axiom applies to each finite sub-meet, but the infinite meet $\bigwedge_{m \in M} \iota(m)$ is not guaranteed to be in $\mathrm{Fix}(\sigma_t)$ or $\mathrm{Fix}(\Delta_t)$ by the nuclear axioms alone. Meet-preservation for nuclei in $H_t$ is stated for finite meets. Whether infinite meets are preserved depends on completeness properties of $H_t$ that are not derivable from the nuclear axioms. For infinite groups, the nuclear axioms guarantee only that every finite sub-group's conjunction is doubly settled; the group-as-a-whole proposition requires additional conditions on the sheaf.

**Definition (Group operativeness).** The group $\mathcal{G}$ is *operative at $t$* iff: (a) $|M| \geq k_{\min}$ where $k_{\min}$ is the minimum complement determined by $\kappa$; (b) $\bigwedge_{i=1}^n \iota(m_i) \in H^*_t$ (the group-as-a-whole is doubly settled); and (c) there exists a global section of $H^*|_{T_\mathcal{G}}$ representing the group's exterior recognition $\varepsilon$.

Condition (b) cannot be derived from (a) alone — that $|M| \geq k_{\min}$ does not force any member's $\iota(m_i)$ into $H^*_t$. It requires that the individual member standings have been recognized and forward-stabilized in the sheaf. The nuclear axioms tell us what happens once those standings are in $H^*_t$; they do not produce them from cardinality data.

## Open questions

- Whether the five components $(M, B, \iota, \kappa, \varepsilon)$ can be further reduced — whether $\iota$ is always derivable from $B$ and $\kappa$, or whether there are groups where $\iota$ provides information not determined by the other components.
- Whether the group/institution distinction is sharp or gradational — whether every group with a sufficiently developed $\kappa$ becomes an institution, or whether informal groups with durable $\kappa$ remain groups but not institutions.
- Whether the mathematical group axioms (closure, associativity, identity, inverses) map onto properties of $(B, \kappa)$ for non-mathematical groups — whether the identity element corresponds to a "null action" that every social or legal group implicitly has, and whether inverses correspond to a dissolution or reversal operation.
- The formal relationship between group and crew: whether crew is the maximal group concept (platform-determined, formally constituted, minimum complement enforced, collective accountability established) or whether crews can be non-maximal groups (below complement, with informal rather than formal $B$).
- Whether the Galois-theoretic reading — "a group is the structure of all transformations leaving an object invariant" — has a direct analog in the relational hyperverse: whether the nuclear fixed fiber $H^*_t$ is the "object being preserved" and the group of automorphisms of $H^*_t$ is the group in the algebraic sense that encodes the symmetry of the system.
