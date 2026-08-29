---
id: crew-role-binding-in-the-relational-universe
description: "Formal treatment of crew role-binding as propositions in the nuclear Heyting fiber — settlement, CO anchoring, transfer-stability, and conjunction of role-bindings."
type: text
addresses: crew
date-created: 2026-03-29
---

This text gives the formal mathematical treatment of the [crew](../../../../../../military-science-services-section/content/text/glossary/terms/crew.md) concept. Each crew member's role-binding is modeled as a proposition in the nuclear Heyting fiber, and crew operativeness is the conjunction of settled role-bindings.

## Definitions

At history $t$ during operational period $T$:
- Each crew member $p_i$'s role-binding is a proposition $\iota(p_i, r_i) \in H_t$ asserting "$p_i$ holds role $r_i$ on vessel $V$ during $T$"
- Full role-binding: $\iota(p_i, r_i) \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$
- The commanding officer $C$ corresponds to $\iota(C, \mathrm{CO}) \in H^*_t$: CO role-binding is doubly stable
- The crew is *operative* at $t$ when: (a) $\iota(p_i, r_i) \in H^*_t$ for all $i$, (b) $|P| \geq k$, and (c) $\iota(C, \mathrm{CO}) \in H^*_t$

## Proposition 1: Role-binding settlement is presheaf-structural

The nuclei $\sigma_t$ and $\Delta_t$ are determined by the presheaf $H$ over the history site $(T, J)$. No act of assigning a crew member to a role directly modifies these nuclei. A role-assignment step $s_{p_i}$ generates a new history $t' = s_{p_i} \star t$ at which the role-binding proposition may reach $\mathrm{Fix}(\sigma_{t'})$ — it is the new history's nucleus that settles the assignment, not the assignment that modifies the nucleus.

*Proof.* $\sigma_t$ depends on restriction maps; assignments are history steps that generate $t'$ with $\sigma_{t'}$. $\square$

## Proposition 2: Conjunction of settled role-bindings is settled

If $\iota(p_1, r_1), \iota(p_2, r_2) \in H^*_t$, then $\iota(p_1, r_1) \wedge \iota(p_2, r_2) \in H^*_t$.

*Proof.* By meet-preservation of both $\sigma_t$ and $\Delta_t$. $\square$

*Consequence.* The "crew is fully manned" proposition — the meet of all individual role-binding propositions — is itself doubly stable whenever every role-binding is individually doubly stable. Full crew-operativeness is a single fixed-fiber element.

## Proposition 3: CO role-binding is the structural anchor

If $\iota(C, \mathrm{CO}) \notin H^*_t$ — the commanding officer's binding has a non-trivial saturation gap $[\iota(C, \mathrm{CO}), \sigma_t(\iota(C, \mathrm{CO}))]$ — then the vessel's accountability structure is unsettled. Authority delegated from $C$ to subordinate crew members may be forward-committed ($\Delta_t$-stable) but the chain's ultimate recognition is incomplete.

*Proof.* $\iota(C, \mathrm{CO}) \notin \mathrm{Fix}(\sigma_t)$ means the restriction profile to predecessor histories does not yet fully constitute the commanding position. Any proposition derived from $\iota(C, \mathrm{CO})$ by meet inherits this unsettlement: $\sigma_t(\iota(C, \mathrm{CO}) \wedge a) = \sigma_t(\iota(C, \mathrm{CO})) \wedge \sigma_t(a) > \iota(C, \mathrm{CO}) \wedge a$ if $\sigma_t(\iota(C, \mathrm{CO})) > \iota(C, \mathrm{CO})$. $\square$

## Proposition 4: Transfer-stability of standing crew

If $\iota(p_i, r_i) \in \mathrm{Fix}(\Delta_t)$ for all $i$ — all role-bindings are forward-committed — then the vessel is operationally committed during $T$: every one-step extension of $t$ carries all the role-binding propositions.

*Proof.* $\mathrm{Fix}(\Delta_t)$ is closed under finite meets by meet-preservation of $\Delta_t$. If each $\iota(p_i, r_i) \in \mathrm{Fix}(\Delta_t)$ and the crew is finite, then $\bigwedge_i \iota(p_i, r_i) \in \mathrm{Fix}(\Delta_t)$. $\square$

## Open questions

- Whether the complement (the required schema) should have its own spec as the functor $\mathrm{Roles}: \mathrm{Vessels} \to \mathrm{RoleSchemas}$.
- Whether gang (a crew subtask-subset) is formally a sub-crew or requires its own tuple.
- The formal relationship between crew and the command station: whether the command station is the spatial anchor of the CO's authority, and whether collective accountability is mediated through it.
- Whether the articles of agreement are formally a collective investiture ($I^+$ for the crew as a unit) or a collection of individual investiture acts.
- Whether film/construction/ground crews satisfy platform-determinacy in the same sense as maritime/aviation/military crews, or whether these are analogical extensions with weaker platform-binding.
