---
id: normative-system
description: "A NormativeSystem is the computationally precise formalization of an institution — a tuple specifying agent types, roles, scenes, a performative structure over scenes, and a norm set of deontic constraints governing agent behavior within each scene."
defines: NormativeSystem
related: Institution, Role, Norm, HohfeldianPosition, Duty, Authority, Charter, StatusFunctionDeclaration
component-of: flatfile-agential-resource-system
fiber-of: relational-universe
base: relational-history-site
element-of: entity
date-created: 2026-03-19
date-modified: 2026-03-19
params:
  agent-types: person
  role-set: role
  scene-set: relational-universe
  performative-structure: relational-universe-morphism
  norm-set: norm
output: relational-universe
ast:
  deontic-scene-graph:
    - agent-types:
        - role-set
    - role-set:
        - norm-set
    - performative-structure:
        - scene-set
        - norm-set
---

# Normative System

## Formal tuple

A **NormativeSystem** is a quintuple $N = \langle \mathrm{Ag}, R, \mathrm{Sc}, \Pi, \Delta \rangle$:

$$N = (\mathrm{Ag},\; R,\; \mathrm{Sc},\; \Pi : \mathrm{Sc} \times \mathrm{Sc} \to \{0,1\},\; \Delta \subseteq \{O(\varphi), P(\varphi), F(\varphi)\})$$

where:
- $\mathrm{Ag}$ — a set of **agent types** that can participate
- $R$ — a set of **roles**: normative positions agents adopt on entry to a scene (interface types specifying deontic constraints for the duration of participation; see [Role](role.md))
- $\mathrm{Sc}$ — a set of **scenes**: structured interaction contexts, each governed by a protocol
- $\Pi$ — the **performative structure**: a directed graph on $\mathrm{Sc}$ specifying permitted scene transitions ($\Pi(s_1, s_2) = 1$ iff scene $s_2$ may follow $s_1$ under some condition)
- $\Delta$ — the **norm set**: deontic constraints over agent actions within each scene:
  - $O(\varphi)$ — obligation: the agent must produce $\varphi$
  - $P(\varphi)$ — permission: the agent may produce $\varphi$ without violating a norm
  - $F(\varphi)$ — prohibition: the agent must not produce $\varphi$

**Nuclear derivation.** The nuclear partition $H_t = H^*_t \sqcup \mathrm{SatShadow}_t \sqcup \mathrm{TrShadow}_t \sqcup \mathrm{FreeShadow}_t$ gives the four-way deontic structure of $\Delta$ at each history $t$.

For an act-type $\varphi$ at scene $s$, the deontic status of $\varphi$ is determined by which quadrant $\varphi \in H_t$ occupies:

| Quadrant | $\sigma_t(\varphi)$ | $\Delta_t(\varphi)$ | Deontic reading |
|---|---|---|---|
| $H^*_t$ | $= \varphi$ | $= \varphi$ | $\varphi$ is **normatively settled**: discharged obligation or permissible completed act |
| $\mathrm{SatShadow}_t$ | $= \varphi$ | $> \varphi$ | $\varphi$ is meaning-recognized but not execution-committed: **past permission without forward obligation** |
| $\mathrm{TrShadow}_t$ | $> \varphi$ | $= \varphi$ | $\varphi$ is execution-committed but not yet meaning-recognized: **undischarged obligation** — the act is forward-required but not yet performed and recognized |
| $\mathrm{FreeShadow}_t$ | $> \varphi$ | $> \varphi$ | $\varphi$ is indeterminate: neither nucleus settles it; **normatively open** |

The three deontic operators in $\Delta$ correspond to fixed-point conditions:

- **Obligation** $O(\varphi)$: the norm requires that $\varphi$ reach $H^*_t$ by deadline $\tau$. The undischarged state is $\varphi \in \mathrm{TrShadow}_t$: the transfer nucleus fixes $\varphi$ ($\Delta_t(\varphi) = \varphi$, the act is committed forward) but the saturation nucleus has not closed on it ($\sigma_t(\varphi) > \varphi$, the act has not been performed and recognized). The gap $\sigma_t(\varphi) - \varphi$ is the measure of the outstanding obligation.

- **Permission** $P(\varphi)$: the norm permits $\varphi$, meaning no prohibition applies. Formally, $\varphi$ is not in a quadrant ruled out by any norm in $\Delta$. The weakest sufficient condition for permission is $\varphi \in H^*_t \cup \mathrm{SatShadow}_t$: the saturation nucleus does not demand anything beyond $\varphi$ (the act is not normatively below the recognition threshold backward).

- **Prohibition** $F(\varphi)$: the norm forbids $\varphi$. Formally, $\neg\varphi \in H^*_t$ — the negation of $\varphi$ is doubly-stable, so $\varphi$ is excluded from the institutionally valid region. By the Heyting algebra structure of $H^*_t$: if $\neg\varphi \in H^*_t$ and $a \leq \varphi$, then $a \wedge \neg\varphi = \bot$ forces any act-instance of type $\varphi$ to be incompatible with the settled norm. The joint retraction $\pi_t(\varphi) \geq \pi_t(\neg\varphi \Rightarrow \bot) = \top$ confirms $\varphi$ exceeds all permitted bounds.

**The performative structure $\Pi$.** The directed graph $\Pi$ on $\mathrm{Sc}$ corresponds to the stepping relation on $T$: $\Pi(s_1, s_2) = 1$ if and only if $s_2 \in \mathrm{step}_T(s_1)$ — scene $s_2$ is a one-step extension of scene $s_1$. The set of permitted trajectories through $\Pi$ is the set of histories in $T$ that respect the scene transition rules, which is exactly the site's coverage structure.

## What this is

A **NormativeSystem** is a tuple N = ⟨Ag, R, Sc, Π, Δ⟩ governing agent interaction within an [Institution](institution.md):

- **Ag**: a set of agent types that can participate in the system
- **R**: a set of roles — normative positions agents can adopt on entry
- **Sc**: a set of scenes — structured interaction contexts, each governed by a protocol
- **Π**: the performative structure — a directed graph over Sc defining permitted scene trajectories (which scenes can follow which, and under what conditions)
- **Δ**: the norm set — deontic constraints O(φ), P(φ), F(φ) (obligations, permissions, prohibitions) on agent actions within each scene

Agents are external to the normative system until they adopt a role.
**Role adoption** is the act of entering the institutional frame and accepting its deontic constraints for the duration of scene participation.
The normative system does not control agents directly; it specifies norms that agents may follow or violate, with enforcement mechanisms as a separate component.

## Scenes and protocols

A **scene** is a structured interaction context with a defined protocol: a set of possible moves, a set of roles, and rules governing move legality given the interaction history so far.
A scene protocol is an [Arena](arena.md) with deontic layering: the arena specifies legal moves; the protocol adds obligations (what an agent in a role must do), permissions (what an agent may do without violating the norm), and prohibitions (what an agent must not do).

The performative structure $\Pi$ connects scenes: it defines when one scene can be entered as a consequence of another's completion, what role assignments persist across scene boundaries, and what information passes between scenes.
$\Pi$ is a directed graph whose nodes are scenes and whose edges are performative transitions — analogous to the enabling relation in an [Arena](arena.md) but operating at the scene level rather than the move level.

## Roles and role adoption

A **role** in a normative system is not the same as an **office** in the [Officer](officer.md) sense.
A role in a normative system is an interface type: a named set of deontic permissions and obligations that apply to an agent for the duration of a scene or session.
An office (in the Hohfeldian sense) is a persistent deontic binding created by a constitutive act of installation.
The role/office distinction tracks the difference between a scene-local normative constraint and a persistent institutional position.

Role adoption in a normative system is typically voluntary and revocable: an agent enters a scene by committing to a role, and exits when the scene ends.
Office installation creates a persistent binding across scenes and sessions.

## Normative system vs. institution

A normative system is the computationally precise formalization of an [Institution](institution.md). The correspondence:

| Institution (Searle) | Normative System (MAS) |
|---|---|
| Constitutive rules | Scene protocols and role definitions in R, Sc |
| Status-function declaration | Role adoption act |
| Deontic powers | Norm set Δ |
| Collective recognition | Role adoption + enforcement mechanism |
| Background conditions | Agent types Ag and their capabilities |

Not every institution is fully captured by a normative system.
In particular, Hodgson's reconstitutive downward causation — the way institutions reshape agent dispositions over time — is not modeled in the tuple $N$, which treats agent types $\mathrm{Ag}$ as fixed.

## Normative system vs. arena

An [Arena](arena.md) is a normative system stripped to its enabling relation: only which moves are legal after which, with no deontic layering.
An arena has no obligations, no permissions beyond legality, no performative structure above the move level.
A normative system adds: role assignments, obligations and prohibitions beyond mere legality, scene composition, and norm enforcement.
Every scene protocol in a normative system has an underlying arena; not every arena is a scene protocol (arenas have no deontic operators).

## Relation to this system

The FARS is a normative system. The correspondence is explicit:

| N = ⟨Ag, R, Sc, Π, Δ⟩ | FARS |
|---|---|
| Ag | The agent types defined in `spec/` (human analyst, AI officer, automated script) |
| R | The officer roles defined in `AGENTS.md` files |
| Sc | The skill invocation episodes — each skill is a scene with a protocol defined in `spec/skills/` |
| Π | The locale workflow — PLANS → INBOX → skill → emit → next locale's INBOX |
| Δ | The MUST / MUST NOT constraints in spec files and SOUL.md |

The nucleus evaluation pipeline plays the role of the norm enforcement mechanism: a proposition that fails to reach H* has violated the system's normative conditions for institutional acceptance. The [Vessel](../../../../../../militarism/terms/vessel.md) is the institution; the normative system is its computational specification; the topos R = Sh(T, J) is the ambient mathematical environment within which the normative system's states are modeled.

## Geometric theory reading: the normative system as a model of RelationalUniverseGeometricTheory

**Source:** [Relational Universe Geometric Theory](../math/relational-universe-geometric-theory.md).

RelationalUniverseGeometricTheory is the multi-sorted geometric theory whose models in a Grothendieck topos are exactly the relational universes. The normative system N = ⟨Ag, R, Sc, Π, Δ⟩ is the institutional instance of a model of RelationalUniverseGeometricTheory: its components correspond exactly to the sorts, function symbols, and axiom groups of the geometric theory.

| N component | RelationalUniverseGeometricTheory component | Geometric axiom group |
|---|---|---|
| Scenes Sc | Hist sort (history objects) | Group 1 — prefix order on Hist; Group 2 — monoid laws for scene concatenation |
| Norm instances in Δ | El sort (fiber algebra elements, bundled over scenes) | Group 3 — fiber sort; Group 4 — Heyting algebra axioms; Group 5 — nucleus axioms |
| Performative structure Π | Restriction maps ρ: scenes to sub-scenes | Group 6 — restriction naturality |
| Role entry across scene boundaries | Sheaf gluing condition | Group 7 — Glue sequent |
| Enforcement mechanism | Nuclear quotient (σ and Δ) — not a separate apparatus but the fiber structure itself | Group 5 — nucleus equations |

**Separation is not a norm axiom.** The classical view of a normative system requires that norms be uniquely determined — that two norm instances that agree on every sub-scene must be equal. In RelationalUniverseGeometricTheory, this uniqueness clause is absent from the axioms: the Glue sequent (Group 7) is existential (there exists an amalgamation) but not separated (uniqueness requires a universal quantifier, which is not geometric). This is correct: two norm instances that agree on every sub-scene but disagree globally are shadow elements of each other, and both are resolved by the generation map RelationalHistoryFiberNuclearQuartetExtremallySlowGrowthGenerationMap to a unique element of RelationalHistoryFixedFiber at depth one higher. Non-separated norms are not a failure of the normative system — they are norms in the process of settlement. The nuclear quotient (applying RelationalHistoryFiberSaturatingNucleus) produces the unique canonical settled version. Separation is a consequence of norm settlement, not a primitive norm axiom.

**Open question answered: deontic modalities as nuclei.** The open question in this file — "whether the norm set Δ can be modeled as a set of Lawvere-Tierney topologies on the scene-level topos, one topology per deontic modality" — is answered affirmatively by RelationalUniverseGeometricTheory. A Lawvere-Tierney topology on a Grothendieck topos is precisely a nucleus on the subobject classifier. The two nuclei of RelationalUniverseGeometricTheory — RelationalHistoryFiberSaturatingNucleus (meaning-recognition) and RelationalHistoryFiberTransferringNucleus (execution-commitment) — are the two canonical Lawvere-Tierney topologies of the relational universe fiber. The three deontic modalities map onto nuclear positions:

| Deontic modality | Nuclear position | Geometric reading |
|---|---|---|
| Obligation O(φ) | TrShadowType: φ is transfer-fixed, saturation-not-yet | φ is execution-committed (carries forward in every extension) but not yet meaning-recognized; the gap σ_t(φ) − φ is the outstanding obligation |
| Permission P(φ) | SatShadowType or RelationalHistoryFixedFiber | The saturation nucleus does not demand anything beyond φ; φ is not normatively below the recognition threshold |
| Prohibition F(φ) | ¬φ ∈ RelationalHistoryFixedFiber | The negation is doubly-stable; any act-instance of type φ is incompatible with the settled norm by the Heyting algebra structure of RelationalHistoryFixedFiber |

**Proposition (Normative system as model of geometric theory).** Any normative system N = ⟨Ag, R, Sc, Π, Δ⟩ satisfying the nucleus commutation axiom is a model of RelationalUniverseGeometricTheory in the topos of presheaves on the scene category. The classifying topos of RelationalUniverseGeometricTheory is the syntactic relational universe RelationalUniverseSyntactic — the initial model — and geometric morphisms into it classify parametrized families of normative systems. The moduli space of normative systems is RelationalUniverseSyntactic.

*Source.* Geometric theory statement from [Relational Universe Geometric Theory §RelationalUniverseGeometricTheory](../math/relational-universe-geometric-theory.md). Separation-absence correctness from [§Why Omitting Separation Is Correct](../math/relational-universe-geometric-theory.md#relational-universe-geometric-theory-no-separation). Classifying topos from [§Relation to the Classifying Topos](../math/relational-universe-geometric-theory.md#relational-universe-geometric-theory-classifying). Status: conditional on RelationalUniverseSyntacticInitiality verification. $\square$

## Key references

Esteva & Padget (2001), "Formalizing a Language for Institutions and Norms"; Boella, van der Torre & Verhagen (2006), survey of normative MAS; the Electronic Institutions framework (Esteva et al., IIIA-CSIC); Dignum (1999), "Autonomous Agents with Norms".

## Open questions

- Whether the performative structure Π over scenes has a direct categorical description — whether it is a category itself (scenes as objects, performative transitions as morphisms) or a directed graph in some richer structure.
- Whether the norm set Δ can be modeled as a set of Lawvere-Tierney topologies on the scene-level topos — one topology per deontic modality (O, P, F).
- How to formally represent norm violation and enforcement within the normative system tuple, and whether the nucleus fixed-point structure provides the right model for "what has been normatively settled".
