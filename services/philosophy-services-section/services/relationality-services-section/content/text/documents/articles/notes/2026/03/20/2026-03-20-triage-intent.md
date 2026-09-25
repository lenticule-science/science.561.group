---
title: "Intent"
id: intent
description: "An Intent is a four-tuple (E, ρ, T, R) — an end-state, a purpose linking to higher-level intent, key tasks, and a reconstruction function mapping situations to sanctioned actions when specific orders have degraded. Intent is a reconstruction operator, not a goal."
requires: [end-state, purpose]
produces: goal
governs: judgment
contrasts-with: goal
enables: delegation
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  end-state: relational-universe
  purpose: relational-universe-morphism
  key-tasks: relational-universe
  reconstruction-function: relational-universe-morphism
  superior-intent: relational-universe
output: relational-universe-morphism
ast:
  reconstruction-operator:
    - end-state
    - purpose:
        - superior-intent
    - key-tasks
    - reconstruction-function:
        - situation
        - purpose
        - end-state
---


## Formal definition

An **Intent** is a four-tuple $\mathcal{I} = (E, \rho, T, R)$:

$$\mathcal{I} = (E : \mathrm{EndState},\; \rho : \mathrm{Purpose},\; T : \mathrm{KeyTasks},\; R : \mathrm{Situation} \to \mathcal{P}(\mathrm{Action}))$$

where:
- $E$ is the **end-state** — the condition that must obtain when the operation is complete; $E$ is a description of what the world should look like at the conclusion of the pursuit, specified relative to (at minimum) the state of one's own forces, the state of the opposition, and the relevant terrain or context; $E$ is more specific than the endeavor's aim $G$ (which may be underspecified) but less specific than the individual orders that implement it — $E$ occupies the middle level of abstraction where intent lives
- $\rho$ is the **purpose** — the reason behind the operation: why this action is being taken, how it serves the larger endeavor, what role it plays in the hierarchical chain of intent; $\rho$ is the link to higher-level intent; it answers "why?" not "what?"; the critical role of $\rho$: when the specific order no longer applies, $\rho$ allows the officer to reconstruct what the authority would have sanctioned — because $\rho$ is the reasoning the authority used to generate the order, not just the order itself
- $T$ is the **key tasks** — the critical actions the pursuing force must perform to reach $E$; $T$ is not an exhaustive task list but a prioritized enumeration of the actions without which $E$ cannot be reached; $T$ is what must not be dropped even when the situation requires improvisation in other respects
- $R : \mathrm{Situation} \to \mathcal{P}(\mathrm{Action})$ is the **reconstruction function** — the functional core of intent; $R$ takes the current situation $f$ (a description of where things currently stand) and returns the set of actions that the issuing authority would sanction given $f$; $R$ is derived from $(E, \rho, T)$ and is more stable than any specific order: specific orders are elements of a fiber at the issuance history that may leave the settled fiber by the application history; $R$ is defined at the level of $E$ and $\rho$ and therefore survives friction that degrades specific orders

**Four invariants.** $\mathcal{I}$ is an instance of intent iff:

1. **Reconstruction, not instruction**: $\mathcal{I}$ is not a command or a specific directive — it is a function from situations to sanctioned actions. The same intent produces different sanctioned actions in different situations; the intent itself does not change, but its output varies with the situation. This is the fundamental distinction between intent and order: an order specifies a specific action; intent specifies the class of actions that serve the purpose across any situation.

2. **Purpose-preservation**: every action in $R(f)$ must be consistent with $\rho$. An action that is within the officer's mandate but inconsistent with $\rho$ is not sanctioned by intent even if it is technically within the zone. Purpose is the binding constraint on the reconstruction function: $\forall \alpha \in R(f), \alpha$ serves $\rho$.

3. **Two-echelon legibility**: $\mathcal{I}$ must be expressible at an abstraction level such that an officer two echelons below the issuing authority can understand and apply $R$. This is not merely a communication requirement but a structural one: if $R$ cannot be understood and applied two levels down without clarification from the issuing authority, it fails as intent. Intent that requires continuous interpretation from the issuing authority is not intent but micromanagement in disguise.

4. **Hierarchical embedding**: $\rho$ links this intent to the intent of the superior authority — there is an $\mathcal{I}' = (E', \rho', T', R')$ at the next level up such that this $\mathcal{I}$'s $E$ is a component of $\mathcal{I}'$'s $T'$, and this $\mathcal{I}$'s $\rho$ derives from $\mathcal{I}'$'s $\rho'$. Intent is always embedded in a chain of intents; the chain terminates at the charter-level purpose of the endeavor.

## Intent as reconstruction operator: the structural insight

The most important thing to understand about intent is what it is *not*. It is not:
- A goal (which specifies what must be achieved, not how to identify sanctioned action under any circumstances)
- An order (which specifies a specific action in specific circumstances)
- A preference (which is informational but not normatively binding)
- A plan (which specifies a sequence of actions, not a function from situations to sanctioned actions)

Intent is a **reconstruction operator**: given any situation $f$, it generates the set of actions that a reasonable officer in that situation should understand the issuing authority to have sanctioned. The canonical test from Auftragstaktik: an order is no longer binding when, in the subordinate's judgment, the order would not have been issued had the superior known the current situation. Intent remains binding precisely because it is what allows the subordinate to reconstruct what the superior would have ordered given the current situation.

This is also how intent differs from a set of rules: rules tell you what to do in cases they anticipate; intent tells you what to do in any case including unanticipated ones, by giving you the reconstruction function $R$ that takes the current situation and returns sanctioned actions. A system governed by rules alone cannot pursue an endeavor through unexpected circumstances; a system that also has intent can.

## Doctrine: Commander's Intent (US Army)

The US Army's operations order format (OPORD) requires a formally structured commander's intent statement in Paragraph 3a(1). The canonical structure:

**End State**: the condition that defines success for own force, enemy force, and terrain/civil considerations. "At end state, 3d Brigade controls the ridge line, enemy forces in sector have been destroyed or rendered combat ineffective, and civilian access to the river crossing is maintained." This is $E$.

**Purpose**: the reason this operation is being conducted — the link to the higher commander's intent. "This operation enables the division to establish a forward logistics base that supports subsequent operations into the valley." This is $\rho$.

**Key Tasks**: the critical things the force must do to reach the end state. "Key tasks are: (1) seize and hold the ridge-line checkpoint by H-hour; (2) prevent enemy withdrawal through the eastern pass; (3) maintain continuous liaison with the civil authority representative." This is $T$.

The reconstruction function $R$ is not explicitly stated but is what a trained officer derives from $(E, \rho, T)$: if at H+4 the eastern pass has been abandoned by enemy forces but a new enemy force is massing at the northern pass, the officer uses $R$ to ask "what would the commander sanction given this situation?" — and the answer comes from $\rho$ (prevent enemy consolidation, enable the logistics base) and $E$ (enemy rendered combat ineffective) rather than from the literal task $T_2$ (which no longer applies).

**Mutual Trust and Common Understanding** are the two structural conditions that make intent operative alongside $(E, \rho, T, R)$:
- **Mutual trust**: the superior trusts ([Trust](2026-03-20-triage-trust.md)) the subordinate to exercise judgment within the intent; the subordinate trusts the superior's intent to be a genuine guide rather than a trap
- **Common understanding**: both share sufficient context about the situation, the endeavor, and the system's purpose that the reconstruction function $R$ produces consistent outputs when applied by different officers at different positions — intent is shared, not idiosyncratic

## Domain instances

### Agency law: the implied authority of an agent

In agency law, an agent authorized to perform an act has implied authority to take all acts reasonably necessary to perform it. If the principal's instructions do not cover an arising situation, the agent should ask "what would the principal have authorized had they foreseen this?" This is the legal version of the reconstruction function $R$: the agent reconstructs the principal's intent from the evident purpose of their mandate.

**Watteau v. Fenwick** (1893): the principal is bound by acts within the agent's *apparent* authority — acts that a third party would reasonably understand as sanctioned by the principal — even if specifically unauthorized. The test is $R$ applied externally: what would a reasonable party understand the principal to have sanctioned given the purpose of the agency?

The limitation: if the agent acts in a way inconsistent with the evident purpose $\rho$ — serves the agent's own interest at the principal's expense — the act is outside implied authority regardless of its literal plausibility. The [Fiduciary](../../../../../../../../../../../social-science-services-section/services/economics-and-business-science-services-section/services/finance-science-services-section/content/text/glossary/terms/fiduciary.md) constraint bounds the reconstruction function: $R(f)$ cannot include actions that serve the agent rather than the principal.

### Contract law: the implied term and the gap-filling function

When a contract's express terms do not cover an arising situation, courts imply a term: "what would reasonable parties in the position of these parties have agreed to had they considered this contingency?" This is the contractual version of $R$: the court applies a reconstruction function derived from the contract's evident purpose and the parties' situation.

The test differs across jurisdictions:
- **Business efficacy** (Moorcock, 1889): the implied term is necessary to give the contract business efficacy — without it, the contract would not work as the parties must have intended
- **Officious bystander** (Shirlaw v Southern Foundries, 1939): the term is what both parties would obviously have agreed to — "of course!" — had the gap been pointed out

Both tests are $R$ applied to the contract context: what would the parties have sanctioned given their purpose $\rho$ and the current situation $f$?

### Professional practice: the skilled clinician's intent

A doctor writes treatment orders that anticipate the expected course of a patient's condition. When the patient's condition diverges unexpectedly, the clinician on duty must reconstruct what the treating physician would have ordered given current facts. This is $R(f)$ applied to the treatment plan's purpose $\rho$ (restore the patient to health, manage the specific condition) and end-state $E$ (the treatment goals).

Medical protocols are intent encoded as standing orders: they specify the treatment approach without being able to enumerate every contingency. A protocol that says "if fever exceeds 38.5°C, administer antipyretic" is a specific mandate ([Mandate](../../../../../../../../../../../social-science-services-section/content/text/glossary/terms/mandate.md)) for the anticipated case; but the protocol's underlying intent ($\rho$ = manage fever safely, $E$ = stable temperature without dangerous drug interactions) guides the clinician when the protocol's literal terms are inadequate or contraindicated.

**Clinical judgment** — the physician's capacity to apply protocols appropriately in unanticipated cases — is the reconstruction function $R$ instantiated in the medical domain. The expert clinician carries intent internalized through training; the novice carries only the literal protocol. This is why *clinical judgment* cannot be fully automated: $R$ requires understanding of $\rho$ and $E$, not just the specific orders.

## Intent and the endeavor

An intent $\mathcal{I} = (E, \rho, T, R)$ is always defined relative to an [Endeavor](../../../../../../triage/endeavor.md) $\mathcal{E} = (A, G, K, E_\mathcal{E}, F)$: the intent's end-state $E$ is a component of the endeavor's aim $G$; the intent's purpose $\rho$ links to $K$ (the self-commitment) and to the endeavor's *why*. The intent is the endeavor's aim articulated at a level of abstraction and structure sufficient to guide pursuing officers through unanticipated situations.

The charter of a vessel ([Charter](../../../../../../../../../../../social-science-services-section/content/text/glossary/terms/charter.md)) is the vessel-level intent: it specifies the endeavor's end-state ($G$), its purpose (why the vessel exists), and its key tasks (the critical roles and responsibilities). The charter is the fixed, public, institutional encoding of intent from which all subordinate intents derive through hierarchical embedding.

## Nuclear reading

In the relational hyperverse, an intent $\mathcal{I} = (E, \rho, T, R)$ at history $t$ is:

**End-state as target in the fixed fiber**: $E$ corresponds to a target element $g_E \in H_t$ that pursuit aims to drive to $H^*_{t_1}$. The intent's end-state is not a current settled fact but a target: $g_E \notin H^*_t$ (not yet achieved) but $g_E \in H_{t_1}$ (what must be achieved). The intent points beyond the current fixed fiber toward the fiber at the conclusion of the endeavor.

**Purpose as stable morphism**: $\rho$ corresponds to a morphism $\rho_t : H_t \to H_t$ that maps current situations to the sub-fiber consistent with the intent's rationale. The purpose is more stable than specific orders because it is defined at a higher level of abstraction in the Heyting algebra — it is closer to the nucleus fixed-point structure of the charter, which is fully in $H^*_t$.

**Reconstruction function as nuclear-path finder**: $R(f) = \{\alpha \in Z_t : \sigma_{t}(\rho_t(f) \wedge \alpha) = \rho_t(f) \wedge \alpha\}$ — the set of actions $\alpha$ within the officer's zone $Z_t$ such that the conjunction of $\rho_t(f)$ (the purpose applied to the situation) and $\alpha$ is meaning-settled. An action is sanctioned by intent iff taking it is consistent with the purpose being settled in the fiber.

**Two-echelon legibility as stability under restriction**: the two-echelon constraint is the condition that $R(f)$ produces consistent outputs when restricted two levels down the chain. Formally: for two restriction maps $\rho_{t \to s} : H_t \to H_s$ and $\rho_{s \to u} : H_s \to H_u$ (two steps of delegation), the intent's reconstruction function produces consistent outputs: $R_u(f_u) \approx \rho_{t \to u}(R_t(f_t))$. Intent that fails two-echelon legibility is intent that collapses into micromanagement when delegated.

**Friction-robustness**: the intent $\mathcal{I}$ is friction-robust if $R(f)$ remains non-empty even when specific orders $I \in H^*_{t_0}$ have degraded to $\rho(I) \notin H^*_{t_n}$. The intent survives order-degradation because it is defined at the level of $E$ and $\rho$ rather than specific $I$: even when $I$ leaves the fixed fiber, the purpose $\rho$ and end-state $E$ remain meaningful enough to generate sanctioned actions.

**Proposition 1 (Sanctioned-action set is closed under meet):** If $\alpha_1, \alpha_2 \in R(f) \cap Z_t$ — both are sanctioned by intent for the situation $f$ — then $\alpha_1 \wedge \alpha_2 \in \mathrm{Fix}(\sigma_t)$ (the conjunction of two meaning-settled action conjunctions with the purpose is meaning-settled).

*Proof.* By definition, $\sigma_t(\rho_t(f) \wedge \alpha_1) = \rho_t(f) \wedge \alpha_1$ and $\sigma_t(\rho_t(f) \wedge \alpha_2) = \rho_t(f) \wedge \alpha_2$. By meet-preservation: $\sigma_t((\rho_t(f) \wedge \alpha_1) \wedge (\rho_t(f) \wedge \alpha_2)) = (\rho_t(f) \wedge \alpha_1) \wedge (\rho_t(f) \wedge \alpha_2) = \rho_t(f) \wedge (\alpha_1 \wedge \alpha_2)$. So $\rho_t(f) \wedge (\alpha_1 \wedge \alpha_2) \in \mathrm{Fix}(\sigma_t)$, giving $\alpha_1 \wedge \alpha_2 \in R(f) \cap Z_t$ (if $\alpha_1 \wedge \alpha_2 \in Z_t$). □

**Proposition 2 (Intent failure when R(f) = ∅):** If $R(f) = \varnothing$ for the current situation $f$ — no action $\alpha \in Z_t$ satisfies $\sigma_t(\rho_t(f) \wedge \alpha) = \rho_t(f) \wedge \alpha$ — then the purpose $\rho_t(f)$ has no meaning-settled joint realization with any available action. This is the nuclear condition for *complete intent failure*: not friction (degradation of specific orders), but structural inability of the intent to guide action given the current situation.

**Proposition 3 (Immutability of nuclei — intent guides path selection, not nucleus modification):** The reconstruction function $R(f)$ uses $\sigma_t$ as a classifier: it computes which elements of $Z_t$ are σ_t-settled when conjoined with the purpose. The function does not modify $\sigma_t$; it queries it. Actions selected from $R(f)$ generate new histories; the nucleus at each new history is determined by the presheaf structure at that history.

*Proof.* $\sigma_t$ is determined by restriction maps; $R(f)$ is a subset-selection over the current fiber using $\sigma_t$ as a filter. The filter is read-only. □

## Open questions

- Whether the reconstruction function $R$ is always well-defined — whether there are pursuit situations where $E$, $\rho$, and $T$ are insufficient to reconstruct any sanctioned action (complete intent failure) and whether this corresponds formally to $R(f) = \varnothing$ for the current situation $f$.
- Whether the hierarchical chain of intents (each $\mathcal{I}$ embedding in a superior $\mathcal{I}'$) terminates at a unique charter-level intent or whether multiple terminal intents can coexist (competing institutional mandates, crossed authorities), and whether this corresponds to the fiber having multiple non-comparable settled elements in $H^*_t$.
- Whether intent can be formally derived from a charter — whether the [Charter](../../../../../../../../../../../social-science-services-section/content/text/glossary/terms/charter.md) spec's `governing-policies` component contains sufficient structure to define $\mathcal{I}$ for any officer operating under it, or whether additional intent-specification acts are required.
- Whether mutual trust and common understanding (the two preconditions for intent to be operative) have formal fiber representations — whether mutual trust is exactly the [Trust](2026-03-20-triage-trust.md) triple $(Q, B, G)$ between the issuing and receiving officers, and whether common understanding is the condition that both officers' fibers agree on the relevant portion of $H^*_t$.
- Whether the **Situation** concept (the $f$ that $R$ takes as input) needs its own formal spec — as a snapshot of $H^*_t$ restricted to the operation's scope, assessed by the officer — and whether the difference between a Report (backward differential) and a Situation (forward-facing snapshot) is formally the difference between $\Gamma(H^*_{t'}) \setminus \Gamma(H^*_t)$ and $\Gamma(H^*_t)$ restricted to scope.
