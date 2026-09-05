---
name: "Normative System"
description: "A Normative System is a structured collection of norms with authority, scope, and coherence conditions, within which norms operate and from which duties derive their force. It is the ambient order giving every obligation, permission, and prohibition its meaning and binding power."
aliases:
  - "normative system"
  - "normative order"
  - "deontic system"
requires: [Norm, Authority]
enables: [Duty, Institution, Charter, Accountability]
contrasts-with: [Regularity, Convention, Mere-Custom, Social-Habit]
references:
  alchourrón1971:
    authors: ["C. E. Alchourrón", "E. B. Bulygin"]
    title: "Normative Systems"
    publication: "Springer-Verlag"
    year: 1971
  kelsen1960:
    authors: ["H. Kelsen"]
    title: "Pure Theory of Law"
    publication: "University of California Press"
    year: 1960
  hart1961:
    authors: ["H. L. A. Hart"]
    title: "The Concept of Law"
    publication: "Oxford University Press"
    year: 1961
  ostrom1990:
    authors: ["E. Ostrom"]
    title: "Governing the Commons: The Evolution of Institutions for Collective Action"
    publication: "Cambridge University Press"
    year: 1990
  boella2014:
    authors: ["G. Boella", "L. van der Torre"]
    title: "Normative Systems and Norm Derivation"
    publication: "Deontic Logic and Artificial Normative Systems"
    year: 2014
date-created: 2026-03-19
date-modified: 2026-04-03
id: normative-system
component-of: flatfile-agent-resource-system
fiber-of: relational-universe
base: relational-history-site
element-of: entity
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

## What This Is

A **Normative System** is a structured collection of [norms](./norm.md) equipped with authority and scope conditions that determine which propositions are obligatory, permitted, or prohibited within a domain.

The key distinction: a [norm](./norm.md) is a triple (φ, O, N) where N is *a* normative system. But what IS N? A normative system is not a single [norm](./norm.md) — it is the ambient order within which multiple norms operate together. It is the organizing structure that gives those norms coherence, assigns them priorities, resolves their conflicts, and maintains their validity.

Hans Kelsen (1945, 1960) called this structure a *normative order* — a hierarchy of norms each deriving its validity from a higher norm until reaching the foundational *Grundnorm*. The system is not a loose collection: it is a **closed structure** where every obligation, permission, and prohibition receives its meaning from the system as a whole.

## Formal Definition

A **Normative System** is a quintuple $N = (\mathrm{Ag}, \Phi, \vdash, J, \beta)$:

$$N = (\mathrm{Ag},\; \Phi,\; \vdash \subseteq \Phi \times \Phi,\; J,\; \beta)$$

where:
- $\mathrm{Ag}$ is the **agent set** — those to whom the norms apply; the system's jurisdiction over persons
- $\Phi$ is the **proposition set** — the facts, acts, and states the system governs; $\Phi$ may include base propositions (atomic acts) and complex propositions (conditional norms, prioritized obligations)
- $\vdash \subseteq \Phi \times \Phi$ is the **derivation relation** — the entailment or implication ordering: if $\varphi \vdash \psi$, then $\psi$ is a normative consequence of $\varphi$ within the system
- $J$ is the **scope** or **jurisdiction** — the spatial, temporal, or contextual boundaries within which the system is operative; what $\Phi$ applies to
- $\beta$ is the **authority grounding** — the source (statute, constitution, custom, contract, divine law) from which the system's normative force derives; without $\beta$, the propositions in $\Phi$ are mere suggestions, not norms

**Five invariants.** $N$ is a normative system iff:

1. **Closure under entailment**: if $\varphi \in \Phi$ and $\varphi \vdash \psi$, then $\psi \in \Phi$. The system is deductively closed — if the system includes a norm and acknowledges an entailment, it must include all normative consequences. This prevents implicit contradictions. (Alchourrón & Bulygin, 1971.)

2. **Consistency of the authority source**: $\beta$ is determinate. The system may be silent on some propositions (permitting them by default) but cannot derive its authority from incompatible sources — no legal system can be simultaneously grounded in the statute and its explicit repeal. Authority is singular or hierarchical, never indeterminate.

3. **Coherence of derivation**: the relation $\vdash$ is transitive and reflexive — if $\varphi \vdash \psi$ and $\psi \vdash \chi$, then $\varphi \vdash \chi$. The entailment ordering constitutes a partial order on propositions, giving the system an internal logical structure.

4. **Jurisdiction boundedness**: $J$ is well-defined — the system applies to specific agents, acts, and contexts, not universally. A tax code applies to residents and transactions within a jurisdiction; family law applies to familial relations within a defined scope. Without $J$, the system is either trivial (applies to everything) or incoherent (applies to nothing definite).

5. **Authority persistence**: $\beta$ does not change within the system's operative timeline. A system with changing authority sources has fractured into multiple systems or lost its identity. This is what the rule of recognition (Hart, 1961) enforces — officials recognize which authority source is operative, and this recognition is constant enough for the system to be a system.

## The Alchourrón & Bulygin Framework

Alchourrón and Bulygin (1971) define a normative system as the deductively closed set generated by a set of explicitly stated norms plus classical logic. Begin with a finite set of axioms — call it $\Sigma$ (the explicitly stated rules, statutes, principles). The **normative system generated by $\Sigma$** is:

$$N(\Sigma) = \{\, \varphi \in \Phi : \Sigma \vdash \varphi \,\}$$

This is the closure of $\Sigma$ under entailment. Every norm in $N(\Sigma)$ is either explicitly stated in $\Sigma$ or derivable from it. The system is its own logical closure.

Key insight: the *master system* $N(\Sigma)$ is typically infinite (infinite logical consequences from finitely many axioms), but the base $\Sigma$ is finite and enumerable. A legal code has finitely many statutes, but those statutes entail infinitely many consequences. The system is what matters — it includes everything that reasonably follows.

**Two critical distinctions:**

1. **Gap vs. contradiction**: A proposition $\varphi$ is a **gap** in $N(\Sigma)$ if neither $\varphi$ nor $\neg\varphi$ is in $N(\Sigma)$ — the system is silent. A gap is permissibility by default. A **contradiction** arises if both $\varphi$ and $\neg\varphi$ are in $N(\Sigma)$ — the system is incoherent. A consistent normative system has no contradictions; it may have many gaps.

2. **Explicit vs. implicit**: An **explicit norm** is a member of $\Sigma$ — directly stated. An **implicit norm** is a member of $N(\Sigma) \setminus \Sigma$ — a logical consequence not explicitly written. Legal reasoning often turns on implicit norms: does the logic of the existing statutes entail this consequence? The system generates the answer.

## The Kelsen Structure: Validity Hierarchy

Hans Kelsen (1960) adds a hierarchical dimension. A normative system is not merely a set of closed propositions — it is a **hierarchy of norms** where each norm's validity is derived from a higher norm:

$$\varphi_n \text{ is valid} \iff \varphi_n \text{ was created by the authority specified in } \varphi_{n-1}$$

The statute is valid because it was enacted pursuant to the constitution. The constitution is valid because... the Grundnorm ("the historically first constitution ought to be obeyed") is the presupposed foundation.

The **Grundnorm** is not itself a positive norm — it is the transcendental presupposition that stops the regress. Without it, the question "what makes this norm valid?" regresses infinitely. The Grundnorm is not *proved* or *enacted*; it is *presupposed* as the condition for any norm's validity to be intelligible.

**Validity vs. truth**: This is Kelsen's revolutionary insight. A norm is **valid** (in force) or **invalid** (not in force). It is not **true** or **false** — those predicates apply to facts, not prescriptions. An unjust law may be perfectly valid (enacted through proper procedure and part of the chain of validity). A wise principle not enacted is not a valid norm in the legal sense. The system cares about validity (is-it-binding?) not truth (is-it-correct?).

**Derogation**: In Kelsen's system, norms conflict when both are valid but have inconsistent prescriptions. Derogation is the explicit mechanism: a later norm can **derogate** (repeal or override) an earlier norm, removing it from the valid set. Without explicit derogation, both norms remain valid and the system faces incoherence.

## Hart: Secondary Rules and the Rule of Recognition

H.L.A. Hart (1961) observes that Kelsen's hierarchy cannot be fully explained in terms of norms alone — there must be a **rule of recognition**: a secondary rule that identifies which primary rules are in force.

A **legal system** requires three layers of secondary rules:

1. **Rule of recognition**: the criterion by which officials identify which primary rules are valid. "A rule is law iff it appears in the statute books and has not been repealed." The rule of recognition is not itself a law (not a positive norm) — it is an accepted practice among officials. It is a **social fact** — a shared acceptance that this is the test of validity.

2. **Rules of change**: rules that authorize some authority to create, modify, or repeal primary rules. Congress is authorized to pass statutes; the states can amend the constitution through a specified procedure.

3. **Rules of adjudication**: rules that authorize courts to determine when a primary rule has been violated. These create the power to make binding determinations.

The union of primary and secondary rules is the legal system. The unity of the system comes not from the Grundnorm (a presupposed fiction) but from the **rule of recognition** — a practice, not a norm, that officials accept and apply consistently.

**The internal point of view**: Hart's distinction between the external point of view (observing that people follow rules) and the internal point of view (accepting rules as binding, using them to guide conduct). A legal system exists when officials adopt the internal point of view toward the rule of recognition — they treat it as binding, not merely describe it as a regularity.

## Ostrom: Polycentric Normative Systems

Elinor Ostrom (1990) extends the framework to **nested** and **polycentric** systems. A normative system is not a single unified structure but a confederation of rule-systems operating at multiple levels:

$$N = N_{\mathrm{operational}} \cup N_{\mathrm{collective-choice}} \cup N_{\mathrm{constitutional-choice}}$$

where:
- $N_{\mathrm{operational}}$ governs day-to-day action — "do not cut more than your allocated timber"
- $N_{\mathrm{collective-choice}}$ governs changes to operational rules — "the forest management committee decides on harvest quotas"
- $N_{\mathrm{constitutional-choice}}$ governs changes to the collective-choice rules — "the constitution must be ratified by representatives of all communities"

**Polycentricity**: multiple normative systems (multiple governance structures) can operate over the same domain without a single central authority. Villages manage their commons under their own operational rules; the state's rules provide a constitutional frame within which village-level systems operate. Neither is *subordinate* to a pure hierarchy — they are nested and partially overlapping.

## Boella & van der Torre: Input/Output Logic

Gabriele Boella and Leendert van der Torre (2014) formalize normative systems using **input/output logic** — norms as input/output pairs rather than as propositions. A norm is $(A, B)$: "if $A$ (input condition), then obligate $B$ (output)."

The system is a set of such pairs:

$$N = \{\, (A_i, B_i) : i \in I \,\}$$

An agent in situation $A_i$ is obligated to perform $B_i$. If multiple norms apply (multiple input conditions are satisfied), their outputs combine according to a **priority structure** or **aggregation rule** — if two norms have conflicting outputs, the system specifies which takes precedence.

**Advantage**: input/output logic separates the mechanics of norm-applicability (which norms fire given the current conditions?) from norm-content (what do they prescribe?). This makes it easier to handle **conditional norms**, **cascading obligations** (one obligation triggers another), and **norm-generation** (norms that create new norms).

## Settlement reading: operativity through joint settlement

A normative system $N$ is **operative at history $t$** iff every [norm](./norm.md) $\mathcal{N} = (\varphi, O, N)$ in $N$ has reached affirming joint [settlement](../../../../../../math/domains/voidmath/terms/settlement.md) on its two operative predicates at $t$:

- A *recognition* predicate — that the normative system has acknowledged the norm as in force
- An *execution* predicate — that the norm carries forward into continuations of $t$ as a binding obligation

When both predicates have reached affirming settlement, $\varphi$ is operatively in force: the system not only declares the norm but the framework's settlement structure binds it. When only one has settled, the norm is partially operative: declared but not propagating, or propagating but not yet recognized.

The normative system's **covering structure** specifies what families of acts and witnessings count as collectively satisfying the system's norms. A covering family of compatible local witnessings — observations that agree where they overlap — gathers into a single settled position for the norm at the history $t$. The covering structure plays the role Alchourrón–Bulygin's deductive closure plays formally: it is what makes a finite explicit set of declared rules generate a (potentially infinite) operative system through the framework's gathering of compatible witnessings.

**Consistency of the normative system** is now definable: $N$ is consistent iff no proposition reaches affirming settlement on its recognition predicate while its negation also reaches affirming settlement on the same predicate. A system that obligates a contradiction has its recognition predicate paraconsistently settled at the $\top$ corner — evidence in both directions — and the system's operativity becomes unstable. The framework's bilattice structure can record the contradiction without collapsing, but a normative system that consistently produces such contradictions cannot bind in the usual sense.

## Open Questions

- **The Grundnorm in relational universe terms**: Does the [Charter](./charter.md) constitute the Grundnorm, or is the Grundnorm presupposed before the charter is enacted? If constituted, what agency installs it? If presupposed, how does it avoid Kelsen's regress problem in the tower structure?

- **Reconciling Kelsen and Hart**: Kelsen's presupposed Grundnorm vs. Hart's rule of recognition (a social practice) seem incompatible. In the relational universe framework, are they two readings of the same structure — the Grundnorm as the transcendental presupposition, the rule of recognition as its immanent social manifestation?

- **Hodgson's reconstitutive downward causation**: Does a normative system reshape agents' dispositions over time? If so, the operative condition must be extended: agent-indexed predicates for each agent under the system's jurisdiction, with the agent-indexed predicates converging to the system's general predicates as the agent's tenure accumulates. Whether such agent-indexed structures are coherent within the framework's covering structure is unresolved.

- **Operativity vs. ideality**: Every formal normative system (law, regulation, contract) distinguishes what is operatively settled (recognized and forward-committed in practice) from what is ideally declared (in the books but not yet effective). The framework's joint-settlement structure localizes this distinction: norms whose recognition and execution predicates have both reached affirming settlement are operative; norms with only one settled are ideal but not yet operative. How do institutions manage the gap between declared norms and operative ones?

- **Multi-system equilibria**: When multiple normative systems govern overlapping agents and acts (legal system + professional ethics + organizational policies), how do their predicates and witnessings interact? Is there a coherence condition for the union, or do agents bear the burden of navigating incompatible systems?

## See Also

- [Norm](./norm.md) — the units of which normative systems are composed
- [Duty](./duty.md) — the instantiation of norms in a specific bearer and correlative party
- [Institution](./institution.md) — the collective acceptance and rule-system that constitutes a normative order
- [Charter](./charter.md) — the founding document that declares a normative system's scope and governing policies
- [Authority](./authority.md) — the source ($\beta$) from which a normative system's force derives

## Additional material from the Google Drive library

## Formal tuple

A **NormativeSystem** is a quintuple $N = \langle \mathrm{Ag}, R, \mathrm{Sc}, \Pi, \Delta \rangle$:

$$N = (\mathrm{Ag},\; R,\; \mathrm{Sc},\; \Pi : \mathrm{Sc} \times \mathrm{Sc} \to \{0,1\},\; \Delta \subseteq \{O(\varphi), P(\varphi), F(\varphi)\})$$

where:
- $\mathrm{Ag}$ — a set of **agent types** that can participate
- $R$ — a set of **roles**: normative positions agents adopt on entry to a scene (interface types specifying deontic constraints for the duration of participation; see [Role](./role.md))
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

A **NormativeSystem** is a tuple N = ⟨Ag, R, Sc, Π, Δ⟩ governing agent interaction within an [Institution](./institution.md):

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
A scene protocol is an [Arena](../../../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/triage/from-philosophy/arena.md) with deontic layering: the arena specifies legal moves; the protocol adds obligations (what an agent in a role must do), permissions (what an agent may do without violating the norm), and prohibitions (what an agent must not do).

The performative structure $\Pi$ connects scenes: it defines when one scene can be entered as a consequence of another's completion, what role assignments persist across scene boundaries, and what information passes between scenes.
$\Pi$ is a directed graph whose nodes are scenes and whose edges are performative transitions — analogous to the enabling relation in an [Arena](../../../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/triage/from-philosophy/arena.md) but operating at the scene level rather than the move level.

## Roles and role adoption

A **role** in a normative system is not the same as an **office** in the [Officer](../../../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/triage/from-philosophy/officer.md) sense.
A role in a normative system is an interface type: a named set of deontic permissions and obligations that apply to an agent for the duration of a scene or session.
An office (in the Hohfeldian sense) is a persistent deontic binding created by a constitutive act of installation.
The role/office distinction tracks the difference between a scene-local normative constraint and a persistent institutional position.

Role adoption in a normative system is typically voluntary and revocable: an agent enters a scene by committing to a role, and exits when the scene ends.
Office installation creates a persistent binding across scenes and sessions.

## Normative system vs. institution

A normative system is the computationally precise formalization of an [Institution](./institution.md). The correspondence:

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

An [Arena](../../../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/triage/from-philosophy/arena.md) is a normative system stripped to its enabling relation: only which moves are legal after which, with no deontic layering.
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

The nucleus evaluation pipeline plays the role of the norm enforcement mechanism: a proposition that fails to reach H* has violated the system's normative conditions for institutional acceptance. The [Vessel](../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/glossary/terms/vessel.md) is the institution; the normative system is its computational specification; the topos R = Sh(T, J) is the ambient mathematical environment within which the normative system's states are modeled.

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
