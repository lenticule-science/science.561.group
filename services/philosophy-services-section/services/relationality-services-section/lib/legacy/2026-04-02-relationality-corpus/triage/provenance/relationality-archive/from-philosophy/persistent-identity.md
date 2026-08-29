---
name: persistent-identity
description: "A PersistentIdentity is a triple (T_I, s_I, G_I) — a lifespan, an identity section assigning doubly-settled elements compatible under restriction, and a grounding. The entity is 'the same' across the lifespan in the sense that restriction maps preserve the identity section."
defines: PersistentIdentity
related: Person, Persona, Character, Incumbent, HohfeldianPosition, RecognitionEvent
requires: [lifespan, grounding]
component-of: person
enables: entity
date-created: 2026-03-20
date-modified: 2026-03-20
---


## Formal definition

A **PersistentIdentity** is a triple $\mathcal{I} = (T_I, s_I, G_I)$:

$$\mathcal{I} = (T_I \hookrightarrow T,\; s_I : T_I \to H^*,\; G_I : \mathrm{Ground})$$

where:
- $T_I \subseteq T$ is the **lifespan** — the sub-site of the history category over which this identity is defined; the identity does not exist before $T_I$ begins or after it ends; $T_I$ is a connected downward-closed sub-poset of $T$ (the entity has a beginning and persists forward until dissolution)
- $s_I$ is the **identity section** — a global section of the fixed-fiber sub-presheaf $H^*|_{T_I}$: for each $t \in T_I$, an element $s_I(t) \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$, with the compatibility condition: for all $t \leq t'$ in $T_I$, $\rho_{t'|t}(s_I(t')) = s_I(t)$; the identity element at any later history restricts back to the identity element at any earlier history
- $G_I$ is the **grounding** — the domain-specific fact that constitutes the stability of $s_I$; without $G_I$, the section is a mathematical abstraction; $G_I$ is what makes the restriction compatibility normatively or physically real; grounding types include biological continuity, legal registration, psychological continuity through memory, cryptographic key, and registration number

**Three invariants.** $\mathcal{I}$ is a persistent identity iff it satisfies:

1. **Dual settlement at every history**: for all $t \in T_I$, $s_I(t) \in H^*_t$. The identity element is both meaning-settled ($\sigma_t(s_I(t)) = s_I(t)$) and transfer-settled ($\Delta_t(s_I(t)) = s_I(t)$) at every history in the lifespan. An element settled by only one nucleus is not an identity — it is either meaning-constituted (recognized but not forward-active) or transfer-ready (forward-active but not yet recognized).

2. **Restriction compatibility**: for all $t \leq t'$ in $T_I$, $\rho_{t'|t}(s_I(t')) = s_I(t)$. This is the formal content of 'the same entity at $t$ and $t'$.' The restriction map $\rho_{t'|t}$ is the sheaf-theoretic translation of 'what we know at $t'$ includes everything we knew at $t$ about this entity.' When $s_I(t') \neq s_I(t)$ but $\rho_{t'|t}(s_I(t')) = s_I(t)$, the entity has acquired new properties at $t'$ while remaining the same identity. When $\rho_{t'|t}(s_I(t')) \neq s_I(t)$, the entity at $t'$ is not the same as the entity at $t$ — the restriction compatibility is what identity adds over and above mere existence.

3. **Grounding uniqueness**: $G_I$ is the unique fact constituting the section's stability. Two compatible families that share the same $G_I$ are the same identity; two that differ in $G_I$ may have identical section values while being distinct identities. This matters for individuation: two identical twins have the same $s_I$ values at birth but distinct $G_I$ (distinct biological continuations), and are therefore distinct identities.

## The section as the formal content of 'same'

The standard question about identity across time — the ship of Theseus, Locke's prince and cobbler, the dormant corporation — reduces to a question about the section $s_I$.

- **Ship of Theseus**: does plank-by-plank replacement change $s_I$? It changes the content of $H_t$ at each $t$ (the ship's physical composition changes) but does not change $s_I(t)$ (the admiralty registration number remains the same global section of $H^*$). The identity persists because $G_I$ is the registration, not the physical composition. The ship that is rebuilt from the original planks has a different $G_I$ — it is a numerically different identity that happens to share the original composition.

- **Locke's forensic person**: the prince who wakes in the cobbler's body and recalls only the prince's past has the prince's $s_I$ (psychological continuity $G_I$) in the cobbler's physical substrate. The cobbler's body is a distinct entity (different $G_I$ grounded in the cobbler's biological continuity). Two persistent identities are now co-located; the normative system must decide which $s_I$ to track for which purposes.

- **Dormant corporation**: during dissolution proceedings, the corporation's $s_I$ persists (the registration number is still the section) but $T_I$ is approaching its endpoint. Dissolution is the formal termination of the lifespan — the moment at which $T_I$ ends and the section $s_I$ is no longer defined.

## Haecceity: the thisness problem

Restriction compatibility explains when $s_I(t)$ and $s_I(t')$ are 'the same entity.' It does not explain why $s_I$ picks out *this* entity rather than any other.

The **haecceity** of $\mathcal{I}$ is the predicate $\mathcal{H}_{\mathcal{I}} : H_t \to \Omega$ defined as the subobject classifier evaluation:

$$\mathcal{H}_{\mathcal{I}}(x) \;=\; [x = s_I(t)] \;\in\; \Omega$$

where $\Omega$ is the subobject classifier of the topos $R = \mathbf{Sh}(T, J)$. The haecceity is the truth value of 'being this specific element.' It is not a qualitative property — knowing everything qualitative about $x$ (all its relations, properties, position in $H_t$) does not determine $\mathcal{H}_{\mathcal{I}}(x)$ unless $x = s_I(t)$.

The haecceity is **primitive**: it cannot be reduced to any combination of qualitative properties. This is the Scotist insight: *haecceitas* (thisness) is the individuating addition over and above the *quidditas* (whatness). In our math: the qualitative structure of $H_t$ (the Heyting algebra structure, the normative profiles, the fiber relations) is the whatness; the haecceity is the additional indexing that makes $s_I$ refer to *this* section and not the isomorphic one next to it.

For practical purposes, the haecceity is carried by the grounding $G_I$. The registration number of a ship is not a qualitative description of the ship — it is a naming convention that constitutes thisness. The biological continuity of a person is not a property of the person (in the sense that changing weight does not change continuity) — it is the grounding of the identity section.

## Grounds taxonomy

The grounding $G_I$ determines both the stability guarantees of $s_I$ and the type of identity:

| Grounding type | Domain | Stability mechanism | Termination condition |
|---|---|---|---|
| Biological continuity | Natural persons | Uninterrupted physical process | Death (biological termination) |
| Psychological continuity | Persons (Lockean) | Memory chain | Amnesia, death, severe brain damage |
| Legal registration | Juridical persons, ships | Registration record | Formal dissolution, deregistration |
| Cryptographic key | Digital agents, systems | Key possession | Key revocation, loss |
| Narrative continuity | Characters, AI personas | Consistent character arc | Explicit discontinuation, reboot |

The ship case (admiralty) is the **minimal identity**: $G_I$ = registration number; $s_I(t) \in H^*_t$ depends on registration being in force; termination = deregistration. No psychological states required. This establishes that persistent identity requires none of the metaphysical predicates — only a grounding that makes the restriction compatibility normatively stable.

## The lifespan boundary conditions

**Birth** (commencement of $T_I$): the first $t_0 \in T_I$ at which $s_I(t_0) \in H^*_{t_0}$. Before $t_0$, the entity may exist in a sub-settled form ($s$ has not yet been fully recognized by both nuclei) but does not yet have a persistent identity. The birth event is the $\sigma_t$-act that settles $s_I(t_0)$ — the recognition event $R$ from the Person spec.

**Death** (termination of $T_I$): the last $t_f \in T_I$ after which no further restriction maps carry $s_I$ forward. The identity has no successor in $H^*_{t'}$ for $t' > t_f$. The section simply ends: there is no element $s_I(t_f+1)$ that is the identity's successor. What persists after $t_f$ (historical records, debts, honors, the body) is not the identity itself but propositions *about* the former identity, which remain in $H_t$ for $t > t_f$ but are no longer sections of $H^*|_{T_I}$.

## Nuclear reading

**Sources:** Saturation Nucleus, Transfer Nucleus, Meet Preservation, Idempotence, Commutation.

**Definition (Dual settlement at a fiber).** An element $a \in H_t$ is *doubly settled* at $t$ iff $a \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$:

- $\sigma_t(a) = a$: $a$ is the maximum element of $H_t$ with its restriction profile to all sub-histories $t_0 < t$. Equivalently, the entire past-facing content of the identity is already captured in $a$ — no enlargement of $a$ would change any prior restriction. This is the formal content of "recognized."
- $\Delta_t(a) = a$: for every one-step extension $s \star t$, there exists $b \in H_{s \star t}$ with $H(i_{s,t})(b) = a$. Every forward step carries $a$ faithfully. This is the formal content of "forward-active."

**Definition (Section of the fixed-fiber presheaf).** A *persistent identity over lifespan $T_I$* is a compatible family $\{s_I(t) \in H^*_t\}_{t \in T_I}$ satisfying: for all $t \leq t'$ in $T_I$, the restriction map $\rho_{t'|t} : H_{t'} \to H_t$ satisfies $\rho_{t'|t}(s_I(t')) = s_I(t)$. This is a global section of the sub-presheaf $H^*|_{T_I}$.

The three conditions from the formal definition — dual settlement at each $t$, restriction compatibility across $T_I$, and grounding $G_I$ — are all required and none is redundant.

**Proposition (Persistent identity conjunction).** If $\mathcal{I}_1 = (T_I, s_1, G_1)$ and $\mathcal{I}_2 = (T_I, s_2, G_2)$ are two persistent identities over the same lifespan, then for each $t \in T_I$, the element $s_1(t) \wedge s_2(t)$ is doubly settled: $s_1(t) \wedge s_2(t) \in H^*_t$.

*Proof.* Fix $t \in T_I$. Since $s_1(t) \in \mathrm{Fix}(\sigma_t)$ and $s_2(t) \in \mathrm{Fix}(\sigma_t)$, meet-preservation of $\sigma_t$ (Meet Preservation) gives $\sigma_t(s_1(t) \wedge s_2(t)) = \sigma_t(s_1(t)) \wedge \sigma_t(s_2(t)) = s_1(t) \wedge s_2(t)$. The same argument applies to $\Delta_t$ using its meet-preservation. Hence $s_1(t) \wedge s_2(t) \in H^*_t$. $\square$

**Remark.** The conjunction section $t \mapsto s_1(t) \wedge s_2(t)$ satisfies dual settlement at each fiber, but it is not automatically restriction-compatible across $T_I$ without additional assumptions on how the restriction maps interact with the meets. Restriction compatibility of $s_1$ and $s_2$ together with naturality of the meet in the sheaf does imply compatibility of the conjunction section, but this depends on the sheaf structure, not on the nuclear axioms alone. The nuclear axioms guarantee only the fiberwise part.

**Proposition (Idempotence does not produce iterated identities).** For any $a \in H_t$, applying $\sigma_t$ or $\Delta_t$ twice yields the same result as once: $\sigma_t(\sigma_t(a)) = \sigma_t(a)$ and $\Delta_t(\Delta_t(a)) = \Delta_t(a)$ (Idempotence). There is no sequence of "more and more settled" identity elements converging to a fixed point that differs from the first application. The closure $\sigma_t(a)$ is already in $\mathrm{Fix}(\sigma_t)$.

*Proof.* $\sigma_t(a) \in \mathrm{Fix}(\sigma_t)$ because $\sigma_t(\sigma_t(a)) = \sigma_t(a)$ by idempotence. Hence applying $\sigma_t$ once already lands in the fixed set; all further applications are the identity. $\square$

**Non-derivability note.** Whether a proposed element $a \in H_t$ has $\sigma_t(a) = a$ is not derivable from the nuclear axioms — it depends on the actual restriction maps and extension data of the sheaf. The nuclear axioms characterize the behavior of $\sigma_t$ and $\Delta_t$ once they are given; they do not assert that any particular element reaches $H^*_t$. The grounding $G_I$ is what makes restriction compatibility normatively real; the axioms do not supply it.

## Relation to adjacent concepts

| Concept | What it adds to or subtracts from PersistentIdentity |
|---|---|
| **Entity** | Has a name and address but no stability across time; $s_I$ may not be in $H^*_t$ |
| **PersistentIdentity** | Entity + dual settlement at every $t \in T_I$ + restriction compatibility |
| **Person** | PersistentIdentity + normative position $N$ + recognition event $R$ + representability $\Phi$; identity is a component of Person |
| **Incumbent** | Person currently occupying an office; adds a designated current history $t_{\mathrm{now}}$ |
| **Persona** | Installable identity structure; PersistentIdentity is what Persona provides to its bearer when installed |

## Open questions

- Whether the restriction compatibility condition and the dual settlement condition together entail that $s_I$ is a natural transformation between the terminal presheaf $1$ and $H^*|_{T_I}$ — i.e., whether every compatible family of doubly-settled elements is automatically a natural transformation, or whether additional naturality conditions are required.
- Whether there can be **overlapping lifespans** in the same fiber — two persistent identities $\mathcal{I}_1$ and $\mathcal{I}_2$ with $s_{I_1}(t) = s_{I_2}(t)$ at some $t$ but different groundings; whether such overlap represents identity fusion, confusion, or mere coincidence, and whether the grounding uniqueness invariant rules this out.
- The formal relationship between **haecceity** and **individuation by structure**: whether in certain well-structured domains (crystals, symmetric molecules, type-identical twins) the haecceity collapses — whether there are histories $t$ in those domains where $\mathcal{H}_{\mathcal{I}_1}(x) = \mathcal{H}_{\mathcal{I}_2}(x)$ for all $x$, making two identities formally indistinguishable.
- Whether the **grounding** $G_I$ should be formalized as a morphism into an external site — a map from the lifespan $T_I$ into a grounding site $T_G$ where the stability-constituting facts live — and whether such a formalization would cleanly separate the mathematical section from the domain-specific stability facts that make it normatively real.
