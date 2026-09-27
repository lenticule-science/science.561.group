---
id: principal
description: "A Principal is a quadruple (H^P, Q, ρ, α) — an original authority fiber doctrine H^P whose fixed propositions are not derived from any superior fiber within the sub-system, an action domain Q, a delegation profile ρ assigning to each agent a restriction map from H^P into the agent's fiber doctrine, and an accountability proposition α ∈ H^{P*}_t asserting original authority over Q at t. The defining nuclear condition: α is in the fixed fiber of the principal's own nuclei, not in the image of any restriction map from above within the sub-system. Delegation does not reduce H^{P*}_t (restriction is not depletion); accountability propositions do not flow down delegation morphisms; revocation withdraws ρ_a without disturbing H^P."
extends: Entity
minimum-math: relational-history-fiber-saturating-nucleus
component-of: relational-universe
fiber-of: relational-universe
base: t
element-of: entity
date-created: 2026-03-19
date-modified: 2026-03-20
params:
  original-authority-fiber: relational-history-fiber-nuclear-heyting-doctrine
  action-domain: area
  delegation-profile: relational-universe-morphism
  accountability-proposition: relational-universe-fixed-proposition
output: relational-universe-fixed-proposition
ast:
  original-authority-structure:
    - original-authority-fiber:
        - relational-history-fiber-saturating-nucleus
        - relational-history-fiber-transferring-nucleus
    - delegation-profile:
        - action-domain
        - relational-universe-morphism
    - accountability-proposition:
        - relational-universe-fixed-proposition
        - relational-history-fiber-nuclear-heyting-doctrine
aliases:
  - Principal
name: "Principal"
where: - $P$ is the **original authority structure** — the principal's normative position, a structure over the framework's history that is not constituted by any restriction from above within the sub-system - $Q$ is the **action domain** — the scope within which the principal's authority operates; no authority extends beyond $Q$ - $\rho$ is the **delegation profile** — the function assigning to each agent $a \in \mathrm{Ag}$ a delegation $\rho_a : P \to a$, a morphism that carries a sub-quota of the principal's authority into the agent's position without depleting $Ps settled authority - $\alpha$ is the **accountability proposition** — the [predication cell](../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predication-cell.md) recording that $\mathcal{P}$ holds original authority over $Q$ at the current history; $\alpha$ has reached affirming joint [settlement](settlement.md) on the recognition and execution predicates the framework requires for original authority
---

# Principal

## What it is

A **Principal** is the source from which delegated authority derives within a normative sub-system: a party whose authority is not itself derived from any superior authority within the sub-system, and who may generate new authority relations — delegations — by creating restrictions of their own authority into agent positions.

The structural fact from which everything follows: within the sub-system, no restriction descends from above to constitute the principal's authority.
The principal's accountability proposition is settled within the principal's own determination — it is the terminal stratum of the authority structure within the sub-system.
All agent authority is in the image of some delegation originating from the principal.

Two structural asymmetries define principalship.
First, restriction maps flow *down*: delegation morphisms carry authority from the principal's position into agent positions, never the reverse.
Second, accountability does not flow: the accountability proposition belongs to the principal and cannot be moved out of the principal's position by any act of any agent.
The agent acts in the principal's name; the consequences bind the principal; the principal cannot escape by pointing at the agent.

A **Principal** is the source from which delegated authority derives within a normative sub-system: a party whose authority propositions are not themselves derived from any superior authority fiber within the sub-system, and who may generate new authority relations — delegations — by creating restriction maps from their own fixed fiber into agent fibers.

The structural fact from which everything follows: within the sub-system, there is no restriction map descending from above that constitutes the principal's authority.
The principal's [fixed fiber](../math/relational-history-fiber-fixed-fiber-doctrine-modal-depth-count.md) $H^{P*}_t = \mathrm{Fix}(\sigma^P_t) \cap \mathrm{Fix}(\Delta^P_t)$ is the terminal stratum of the authority lattice within the sub-system.
All agent authority is in the image of some restriction map originating from $H^{P*}_t$.

Two structural asymmetries define principalship.
First, restriction maps flow DOWN: delegation morphisms $\rho_a : H^P \to H^a$ carry authority from the principal's fiber into agent fibers, never the reverse.
Second, accountability does not flow: the accountability proposition $\alpha \in H^{P*}_{t_{\mathrm{now}}}$ is not in the image of any $\rho_a$, and cannot be moved out of the principal's fixed fiber by any act of any agent.
The agent acts in the principal's name; the consequences bind the principal; the principal cannot escape by pointing at the agent.

## Formal quadruple

A **Principal** is a quadruple $\mathcal{P} = (P, Q, \rho, \alpha)$:

$$\mathcal{P} = (P,\; Q,\; \rho : \mathrm{Ag} \to \mathrm{Delegations},\; \alpha)$$

**Originality condition.** $\mathcal{P}$ is a principal (not merely an agent) iff: there is no delegation morphism within the sub-system whose image constitutes $\alpha$.
The principal's accountability is not constituted by any restriction from above within the sub-system.
This is system-relative originality: externally, $P$ may itself be constituted by a statute, an election, or a meta-authority — but within the sub-system under consideration, no such constituting morphism exists.

**Accountability non-transfer.** For all agents $a$, $\alpha$ is not in the image of any delegation morphism $\rho_a$.
Delegations create morphisms going down from the principal to agents; accountability propositions do not travel along those morphisms.
This is the formal content of retained accountability: the principal's settled $\alpha$ persists, and no act of any agent can move it out of the principal's position.
The agent's misuse of delegated authority does not discharge the principal.

**Revocability.** Removing $\rho_a$ from $\rho$ terminates the agent's borrowed authority.
The agent's own position receives no further authority restriction from the principal; the agent's authority propositions revert to whatever the agent's position independently contains.
The principal's own authority $\alpha$ is unaffected: it was never in the agent's position to begin with.

A **Principal** is a quadruple $\mathcal{P} = (H^P, Q, \rho, \alpha)$:

$$\mathcal{P} = (H^P : T^{\mathrm{op}} \to \mathbf{HA_{nucl}},\; Q,\; \rho : \mathrm{Ag} \to \mathrm{Hom}_R(H^P, H^{(-)}),\; \alpha \in H^{P*}_{t_{\mathrm{now}}})$$

where: - $H^P$ is the **original authority fiber doctrine** — the [fiber nuclear doctrine](../math/relational-history-fiber-nuclear-heyting-doctrine.md) with [saturation nucleus](../math/relational-history-fiber-saturating-nucleus.md) $\sigma^P_t$ and [transfer nucleus](../math/relational-history-fiber-transferring-nucleus.md) $\Delta^P_t$ commuting at each $t \in T$; the principal's authority exists as a global structure over all of $T$, not as a single proposition at one history - $Q$ is the **action domain** — the scope within which the principal's authority operates; no authority extends beyond $Q$ - $\rho$ is the **delegation profile** — the function assigning to each agent $a \in \mathrm{Ag}$ a morphism $\rho_a : H^P \to H^a$ of nuclear fiber doctrines in $R = \mathbf{Sh}(T, J)$; $\rho_a$ carries a sub-quota of the principal's authority into the agent's fiber without depleting $H^{P*}_t$ - $\alpha \in H^{P*}_{t_{\mathrm{now}}}$ is the **accountability proposition** — the doubly-stable element asserting that $\mathcal{P}$ holds original authority over $Q$ at $t_{\mathrm{now}}$; it satisfies $\sigma^P_{t_{\mathrm{now}}}(\alpha) = \alpha$ (meaning-settled: the accumulated normative history recognizes the authority) and $\Delta^P_{t_{\mathrm{now}}}(\alpha) = \alpha$ (forward-active: every extension of $t_{\mathrm{now}}$ carries the accountability)

**Originality condition.** $\mathcal{P}$ is a principal (not merely an agent) iff: for all $t \in T$ and all fiber doctrines $H^{\mathrm{other}}$ in the sub-system, there is no sheaf morphism $\rho^{\uparrow} : H^{\mathrm{other}} \to H^P$ in $R$ whose image intersects $H^{P*}_t$ non-trivially.
The principal's fixed fiber is not constituted by any restriction from above within the sub-system.
This is system-relative originality: externally, $H^P$ may itself be constituted by a statute, an election, or a meta-authority — but within the sub-system under consideration, no such constituting map exists.

**Accountability non-transfer.** For all $a \in \mathrm{Ag}$, $\alpha \notin \mathrm{image}(\rho_a(H^{a*}_t))$.
Delegation creates morphisms going down from the principal to agents; accountability propositions do not travel along those morphisms.
This is the formal content of retained accountability: $\alpha$ is doubly stable in the principal's own fiber, and no act of any agent can reduce $\alpha$'s stability.
The agent's misuse of delegated authority does not discharge the principal.

**Revocability.** Removing $\rho_a$ from $\rho$ terminates the agent's borrowed authority.
Since $\rho_a$ is a morphism in $R$, its withdrawal means $H^a$ receives no restriction from $H^P$; the agent's authority propositions revert to whatever their fiber independently contains.
The principal's own authority $\alpha \in H^{P*}_{t_{\mathrm{now}}}$ is unaffected: it was never in $H^a_t$ to begin with.

## Correspondence table

Ten external doctrines, each with a precise internal rendering:

| External doctrine | Source | Internal construct |
|---|---|---|
| ***Mandatum*** (Roman law mandate) | Gaius, *Institutiones* 3.155: *"Mandatum consistit sive nostra gratia mandemus sive aliena"*; Ulpian, Dig. 17.1.1 pr. | The delegation morphism $\rho_a$ from the principal (*mandator*) to the agent (*mandatarius*). The agent's authority is bounded by the scope of $\rho_a$: acts outside the image of $\rho_a$ are not binding on the principal. *Negotiorum gestio* (Dig. 3.5) is the unofficial analog: an agent acting outside any $\rho_a$ under emergency necessity, creating quasi-mandate obligations. |
| ***Qui facit per alium facit per se*** | Boniface VIII, *Liber Sextus Decretalium* (1298), *Regulae Iuris* 72; substantive Roman basis in Dig. 14.1, 14.3, and 17.1 | Attribution of authorized acts: when an agent's act falls within the image of $\rho_a$, the principal's accountability is co-implicated; the principal cannot disclaim acts done within the delegated scope. The act *done through another* is in the image of $\rho_a$; the principal is the source. |
| ***Delegatus non potest delegare*** (a delegate cannot sub-delegate) | Papinian, Dig. 1.21.1; systematized by Hostiensis, *Summa Aurea* (c. 1253) | A delegation $\rho_a : P \to a$ does not automatically compose with a further delegation $\rho_b : a \to b$ to produce a valid delegation $P \to b$. Sub-delegation requires an explicit additional morphism $\rho_{ab} : P \to b$ authorized by the principal. The maxim is a constraint on the category of delegation morphisms: implicit composition is not authorized delegation. |
| **Hobbes's authorization** | *Leviathan* Ch. XVI (1651): Author = "he that owneth his words and actions"; Actor = "he that acteth... by Authority from another" | The Author-Actor relation is precisely $(\mathcal{P}, a, \rho_a)$: the principal (Author) owns the acts of the agent (Actor) performed within the image of $\rho_a$. Acts "without Authority" — outside the image of $\rho_a$ — bind the agent only; they leave the principal's $\alpha$ unaffected. Hobbes's authorization theory is the earliest precise statement of the asymmetry: restrictions are constitutive of the agent's authority but never of the principal's. |
| **Jensen-Meckling agency cost** | Jensen & Meckling, *Journal of Financial Economics* 3(4) (1976) | The three agency cost types map onto the gap structure of the delegation morphism. **Monitoring cost** = the cost of verifying that the agent's exercise aligns with the principal's intent. **Bonding cost** = the cost of securing the agent's commitment to the mandate. **Residual loss** = the irreducible welfare loss from delegation, arising from misalignment between what the principal would settle as authoritative and what the agent's position actually settles. Perfect alignment requires the delegation to commute with both parties' settling structures — the limiting case where the agency problem disappears. |
| **Locke's trustee-principal** | *Second Treatise* Ch. XIII §149; Ch. XIX §§221–222 (1689/1690) | The People = original principal $\mathcal{P}$; the Legislature = agent $a$. The legislative mandate is $\rho_a$. Forfeiture = the Legislature's acts exit the image of $\rho_a$. When this happens, $\rho_a$ is withdrawn; authority reverts to the principal's $\alpha$, which persists regardless of any legislative occupancy. The accountability is never transferred into the agent's position; it is always recoverable because it was never there to begin with. |
| **Kelsen's Grundnorm as ultimate principal** | Kelsen, *Pure Theory of Law* 2nd ed. (1967, trans. Knight), pp. 193–221 | The Grundnorm is the originality condition in its limit form: the ultimate principal whose authority is not constituted by any restriction from any positive-norm source within the legal system. The basic norm is "not itself a positive norm" but the "transcendental-logical presupposition" of all positive norms — in framework terms, the [absurdity](../../../../../philosophy-services-section/services/relationality-services-section/content/text/glossary/terms/absurd.md) the legal system rests on, the irreducible base from which all settled legal claims derive. |
| **Bratman's shared cooperative activity** | Bratman, *Philosophical Review* 101(2) (1992) | When multiple agents form a shared cooperative activity, their individual authority propositions in their respective positions must form a compatible family — observations that agree where their domains overlap. If the family is compatible and gathers into a coherent global record, it constitutes a collective principal. Bratman's three conditions (mutual responsiveness, commitment to joint activity, meshing sub-plans) correspond to: naturality of the delegations, compatibility of the family, and successful gathering into a global record. |
| **Pettit's non-domination condition** | Pettit, *Republicanism* (1997), Ch. 2 | Non-domination = the delegation $\rho_a$ does not bypass the agent's own settling structure. A delegation that imposes propositions into the agent's settled position arbitrarily — without passing through the agent's own witnessing — is dominating. A delegation that respects the agent's own settling structure is non-dominating; the agent can contest the imposition through ordinary witnessings. |
| **Rousseau's general will as inalienable authority** | Rousseau, *The Social Contract* Bk. II Ch. I (1762) | The inalienability of sovereignty = the formal non-delegatability of $\alpha$: the delegation morphisms carry sub-propositions of $\alpha$'s scope into agent positions, but $\alpha$ itself does not travel — it remains permanently in the principal's position. Every delegation is partial, not total. The general will (sovereignty) is the principal's $\alpha$; the will of all is the aggregate of delegated propositions in agent positions, which is strictly smaller. |

| External doctrine | Source | Internal construct |
|---|---|---|
| ***Mandatum*** (Roman law mandate) | Gaius, *Institutiones* 3.155: *"Mandatum consistit sive nostra gratia mandemus sive aliena"*; Ulpian, Dig. 17.1.1 pr.: mandate for the mandator's or a third party's benefit | The delegation morphism $\rho_a : H^P \to H^a$: the principal (*mandator*) constitutes the agent's (*mandatarius*'s) authority by creating the restriction map. The agent's authority is bounded by the scope of $\rho_a$: acts outside the image of $\rho_a$ are not binding on the principal. *Actio mandati* — the action lying between them — is the set of accountability and restitution obligations that flow structurally from the morphism. *Negotiorum gestio* (Dig. 3.5) is the unofficial analog: an agent acting outside any $\rho_a$ under emergency necessity, creating quasi-mandate obligations. |
| ***Qui facit per alium facit per se*** (what is done through another is done through oneself) | Boniface VIII, *Liber Sextus Decretalium* (1298), *Regulae Iuris* 72: *"Qui facit per alium est perinde ac si faciat per seipsum"*; canonist synthesis drawing on Roman *actio institoria* (Dig. 14.3 — liability of a *dominus* for acts of his *institor*) and *actio exercitoria* (Dig. 14.1 — ship-owner liability for ship-master); extended in common law through Blackstone, *Commentaries* Bk. I Ch. 15. Note: the maxim is NOT located at Digest 50.17.133 (a common false attribution); its substantive Roman basis is dispersed through D. 14.1, 14.3, and 17.1 | Attribution of authorized acts: for $\psi \in H^a_t$ in the image of $\rho_a$ (the agent's act is within the delegated scope), the accountability proposition in $H^{P*}_t$ that authorized the scope is co-implicated — the principal cannot disclaim the act. Formally: if $\rho_a(\alpha^{\mathrm{scope}}) \geq \psi$ in $H^a_t$, the principal's accountability for $\psi$ is non-zero. The act "done through another" is in the image of $\rho_a$; the principal is the preimage. The *actio institoria* is the classical Roman mechanism: the *dominus* (employer/principal) who appoints an *institor* (business manager) to conduct a particular trade is liable on all contracts made within that scope, regardless of whether he personally participated. |
| ***Delegatus non potest delegare*** (a delegate cannot sub-delegate) | Roman locus: Papinian, Dig. 1.21.1: *"Mandatam sibi iurisdictionem mandare alteri non posse manifestum est"* — a delegated jurisdiction cannot be further delegated; systematized by Hostiensis, *Summa Aurea* (c. 1253) and Innocent IV, *Commentaria* (c. 1251) for papal and legatine delegations; standard doctrine by the time of the Decretals of Gregory IX | The restriction map $\rho_a : H^P \to H^a$ does not automatically compose with any further $\rho_b : H^a \to H^b$ to produce a valid delegation from $H^P$ to $H^b$. Sub-delegation requires an explicit additional morphism $\rho_{ab} : H^P \to H^b$ authorized by the principal. The composition $\rho_b \circ \rho_a$ is NOT itself a delegation from $\mathcal{P}$ unless $\mathcal{P}$ separately grants it. This is a constraint on the category of delegation morphisms: they are not closed under composition by default. Exceptions arise only when the original mandate expressly includes the power to sub-delegate — when $\rho_a$ is itself a functor that carries sub-delegation authority into $H^a$. |
| **Hobbes's authorization** (*Leviathan* Ch. XVI, 1651) | "Of the Person, Author, and Things Personated"; Author = "he that owneth his words and actions"; Actor = "he that acteth... by Authority from another"; authorization = "the Right of doing any Action"; acts performed without authority bind the Actor, not the Author | The Author-Actor relation is precisely $(H^P, H^a, \rho_a)$: the principal (Author) owns the acts of the agent (Actor) performed within the image of $\rho_a$. "Owning" = the accountability proposition $\alpha \in H^{P*}_{t_{\mathrm{now}}}$ is implicated by those acts. Acts "without Authority" — outside the image of $\rho_a$ — bind the agent's fiber $H^a_t$ only; they leave $H^{P*}_t$ unaffected. Hobbes's sovereign as absolute principal = a principal whose delegation profile $\rho$ covers all subjects, and whose own fiber $H^{P*}_t$ is not in the image of any restriction from within the commonwealth. Hobbes's authorization theory is thus the earliest precise statement of the asymmetry: restriction maps are constitutive of the agent's authority but never of the principal's. |
| **Jensen-Meckling agency cost** | Jensen & Meckling, "Theory of the Firm" *Journal of Financial Economics* 3(4) (1976), p. 308: agency relationship = "a contract under which one or more persons (the principal(s)) engage another person (the agent) to perform some service on their behalf which involves delegating some decision making authority to the agent"; three cost types: (1) monitoring expenditures by the principal, (2) bonding expenditures by the agent, (3) residual loss | The three agency costs map onto the gap structure of the delegation morphism. **Monitoring cost** = the cost of driving $\rho_a(\alpha^{\mathrm{scope}})$ toward $\mathrm{Fix}(\sigma^a_t)$: verifying that the agent's exercise of the delegated scope is saturation-nucleus-settled — that the agent's acts carry recognized meaning consistent with the principal's intent. **Bonding cost** = the cost of driving $\rho_a(\alpha^{\mathrm{scope}})$ toward $\mathrm{Fix}(\Delta^a_t)$: securing the agent's forward-commitment to the mandate, so that the agent's authority proposition is transfer-stable. **Residual loss** = $H^{P*}_{t_{\mathrm{now}}} \setminus \mathrm{image}(\rho_a)^*$: propositions in the principal's fixed fiber that the agent's acts cannot recover, because perfect alignment between $\rho_a$ and the agent's independent nuclei is unachievable — the permanent welfare loss from delegation, arising from irreducible information asymmetry between the principal's fiber and the agent's fiber. |
| **Locke's trustee-principal** | Locke, *Second Treatise* Ch. XIII §149: "the Legislative being only a Fiduciary Power to act for certain ends, there remains still in the People a Supreame Power to remove or alter the Legislative"; Ch. XIX §221: "if their commands... come short of what they had a Right to do... they Forfeit the Power"; §222: authority reverts when trust is betrayed | The People = original principal $\mathcal{P}$; the Legislature = agent $a$. The legislative mandate is $\rho_a : H^{\mathcal{P}} \to H^a$. Forfeiture = the Legislature's acts exit the image of $\rho_a$: the agent acts outside the authorized scope. When this happens, $\rho_a$ is withdrawn; authority reverts to $H^{P*}_{t_{\mathrm{now}}}$ — the People's original accountability proposition, which persists regardless of any legislative occupancy. This is the formal content of Locke's revertibility condition: $\alpha \in H^{P*}_{t_{\mathrm{now}}}$ is never transferred into $H^a_t$; it is always recoverable because it was never in $H^a_t$ to begin with. The fiduciary character of the Legislature (Locke's "Fiduciary Power") = the agent is accountable to the principal, not conversely: the accountability morphism goes up from $H^a_t$ to $H^{P*}_{t_{\mathrm{now}}}$, not down. |
| **Kelsen's Grundnorm as ultimate principal** | Kelsen, *Pure Theory of Law* 2nd ed. (1967, trans. Knight), pp. 193–221: the basic norm is "not itself a positive norm" but the "transcendental-logical presupposition" of all positive norms; "there is no positive norm from which the basic norm can be derived" (p. 197); it is presupposed, not created by any legal act | The Grundnorm = the originality condition in its limit form: the ultimate principal whose authority fiber $H^{GN}$ is not in the image of any restriction from any positive-norm source within the legal system. Kelsen's authority lattice is a chain of fiber doctrines $H^{GN} \twoheadrightarrow H^{\mathrm{constitution}} \twoheadrightarrow H^{\mathrm{statute}} \twoheadrightarrow \cdots$ with restriction maps going from the basic norm downward through constitutional provisions to particular statutes. The Grundnorm is the colimit from which all restriction maps originate — the unique fiber that is not itself in any downward image within the system. Not a positive proposition in any fiber, but the topos-level structure that makes the fiber doctrine coherent: it is the initial data of the normative site $(T, J)$ itself, not an element at any $t$. |
| **Bratman's shared cooperative activity** | Bratman, "Shared Cooperative Activity" *Philosophical Review* 101(2) (1992): 327–341; three conditions: (1) mutual responsiveness of each agent's sub-intentions and actions to those of the other, (2) commitment to the joint activity and to mutual support of each other's roles, (3) meshing sub-plans | When multiple agents $a_1, a_2, \ldots$ form a shared cooperative activity, their individual authority propositions $\rho_{a_1}(\alpha^{\mathrm{scope}}), \rho_{a_2}(\alpha^{\mathrm{scope}}), \ldots$ in their respective fibers $H^{a_1}_t, H^{a_2}_t, \ldots$ must form a compatible family in the sense of the Grothendieck topology $J$: for all covering sieves $(f_i : t_i \to t)_{i \in I} \in J(t)$, the restrictions agree. If the compatible family satisfies the sheaf gluing condition, it glues to a global section — the collective principal that the activity constitutes. Bratman's three conditions correspond to: (1) mutual responsiveness = the restriction maps $\rho_{a_i}$ are natural transformations, commuting with all transition maps $H(f)$ (not just fiber-level maps); (2) commitment to joint activity = the family is compatible, not merely locally defined; (3) meshing sub-plans = the gluing condition holds, producing a single global section rather than a collection of incompatible local sections. |
| **Pettit's non-domination condition** | Pettit, *Republicanism: A Theory of Freedom and Government* (1997), Ch. 2, pp. 51–79: domination = "capacity to interfere... on an arbitrary basis" in another's choices; non-domination = absence of such exposure; legitimate authority is authority exercised under conditions that permit contest | The domination condition in nuclear terms: a principal dominates an agent when the delegation morphism $\rho_a : H^P \to H^a$ imposes propositions into $H^{a*}_t$ arbitrarily — bypassing the agent's own nucleus conditions $(\sigma^a_t, \Delta^a_t)$. Non-domination = $\rho_a$ factors through the agent's saturation closure: $\rho_a(\alpha^{\mathrm{scope}})$ reaches $H^a_t$ only along paths that respect the agent's own nuclei. Pettit's "contestability" condition — the capacity to challenge arbitrary interference — corresponds to the agent having independent nucleus operators that any incoming restriction must commute with. An authority relation in which $\rho_a$ bypasses $\sigma^a_t$ is a dominating authority relation; one in which $\rho_a \circ \sigma^P_{t} = \sigma^a_t \circ \rho_a$ (the restriction commutes with both nuclei) is a non-dominating authority relation. |
| **Rousseau's general will as inalienable authority** | Rousseau, *The Social Contract* Bk. II Ch. I (1762): "Sovereignty... can never be alienated, and the sovereign... cannot be represented except by himself"; the general will is inalienable because it is the will of the body politic as such, not of its parts | The inalienability of sovereignty = the formal non-delegatability of $\alpha$: the restriction maps $\rho_a$ carry sub-propositions of $\alpha$'s scope into agent fibers, but $\alpha$ itself does not travel — it remains permanently in $H^{P*}_{t_{\mathrm{now}}}$. Every delegation is partial, not total: $\rho_a(\alpha^{\mathrm{scope}}) \leq \alpha$ in $H_t$ (the delegated scope is at most a part of the principal's authority), and $\alpha \notin \mathrm{image}(\rho_a)$. Rousseau's distinction between the general will (non-alienable sovereignty) and the will of all (aggregate of individual wills) maps onto the distinction between $\alpha \in H^{P*}_{t_{\mathrm{now}}}$ (the fixed, globally-coherent accountability proposition) and $\sum_a \rho_a(\alpha^{\mathrm{scope}})$ (the aggregate of delegated propositions in individual agent fibers, which is strictly smaller). |

## The *mandatum* doctrine: Roman principal-agent

The Roman law of mandate (*mandatum*) in Gaius *Institutiones* 3.155–162 and Digest Title 17.1 provides the classical legal structure from which all modern principal-agent law descends.

**The mandate relationship.** Gaius (Inst.
3.155) identifies the mandate's scope: the mandate is constituted whether directed for the mandator's benefit or another's.
The *mandator* (principal) creates the *mandatarius*'s (agent's) authority by issuing the mandate; the mandate is the delegation morphism $\rho_a$.
Ulpian (Dig.
17.1.1 pr.) adds the crucial restriction: a mandate given purely for the benefit of the mandatarius is not a true mandate but merely advice (*consilium*).
The mandate structure requires that $\rho_a$ carries authority for purposes that originate in the principal's position — a delegation that serves only the agent's independent interests does not constitute a delegation in the principal's name.

**The scope boundary.** Acting outside the mandate (*extra mandatum*) creates no obligation for the principal; the act binds only the agent.
Ulpian (Dig.
17.1.5.2): if someone took a mandate and acted beyond or within its limits, the mandate action is born.
Acts in the image of $\rho_a$ bind $\mathcal{P}$ (via *qui facit per alium*); acts outside the image bind only the agent's own position.
The *actio mandati directa* is the action the principal can bring against the agent for failing to execute the mandate; the *actio mandati contraria* is the action the agent can bring for compensation for costs incurred within the mandate.

**Negotiorum gestio as unauthorized delegation.** *Negotiorum gestio* (Dig.
3.5) is the Roman analog of unauthorized agency: acting on another's affairs without a mandate.
The gestor has no delegation morphism from the principal but acts in the principal's interest under emergency necessity.
The law creates quasi-contractual obligations between gestor and dominus.
Where no $\rho_a$ exists but the gestor's act is within the domain $Q$, the act creates a new obligation that the law's own normative-system covering structure may drive toward settlement — authority generated *ex post* that was not authorized *ex ante*.

Hobbes's *Leviathan* Ch. XVI (1651) gives the earliest systematic analysis of what it means to act in another's name.

**Author and Actor.** Hobbes distinguishes the Author (whose words and actions are owned) from the Actor (who performs actions belonging to another).
The Author-Actor relation is the triple $(\mathcal{P}, a, \rho_a)$: the principal is the Author who owns; the agent is the Actor who performs; the delegation morphism $\rho_a$ is the authorization that constitutes the relation.

**Authorization as right-conferring.** Hobbes: "the Right of doing any Action, is called AUTHORITY."
Authorization is the conferral of a Hohfeldian power.
The agent acting within the image of $\rho_a$ acts by authority; outside it, the agent acts in her own name only.

**Unauthorized acts.** Hobbes: acts "not by Commission, nor by any other Declaration of the Author, are his own."
An agent acting without authorization accumulates obligations in the agent's own position that are not in any restriction from the principal's position.
The normative consequence of the unauthorized act is the agent's alone.
This is the formal content of *delegatus non potest delegare*: composed delegations without explicit authorization create chains that the principal's accountability does not reach.

The principal-agent problem of Jensen and Meckling (1976) arises from the separation of ownership and control: the owner (principal) cannot perfectly monitor the manager (agent), and the manager's interests may diverge from the owner's.
In framework terms, this is a divergence between the principal's and agent's settling structures.

**The divergence structure.** The principal has its own settling structure — what the principal recognizes as authoritative and forward-committed.
The agent has its own.
The delegation morphism $\rho_a$ carries the scope authorization from the principal's position to the agent's position.
The divergence: what the principal would settle as authoritative is not what the agent independently settles.
The agency problem exists whenever this divergence holds.

**Monitoring as alignment.** Monitoring expenditures (Jensen-Meckling cost type 1) are costs incurred by the principal to drive the agent's exercise of the delegated scope into alignment with the principal's own settling structure.
The cost is proportional to the divergence: the larger the divergence, the more costly to verify alignment.
In the limit: if $\rho_a$ commutes with both parties' settling structures (the agent's settled positions are exactly the restrictions of the principal's), monitoring cost is zero.

**Residual loss as permanent gap.** The residual loss (type 3) = positions in the principal's settled authority that the agent's acts cannot recover, because the divergence cannot be closed without changing the identity of the agent.
This is the permanent cost of the separation of ownership and control: the principal would have to become the agent (eliminate $\rho_a$ and act directly) to close the gap entirely.

The Roman law of mandate (*mandatum*) in Gaius *Institutiones* 3.155–162 and Digest Title 17.1 provides the classical legal structure from which all modern principal-agent law descends, and maps onto the delegation morphism with unusual precision.

**The mandate relationship.** Gaius (Inst.
3.155) identifies the mandate's scope: *"Mandatum consistit sive nostra gratia mandemus sive aliena"* — the mandate is constituted whether we direct something for our own benefit or another's.
The *mandator* (principal) creates the *mandatarius*'s (agent's) authority by issuing the mandate; the mandate is the delegation morphism $\rho_a$.
Ulpian (Dig.
17.1.1 pr.) adds the crucial restriction: a mandate given purely for the benefit of the mandatarius is not a true mandate but merely advice (*consilium*).
The mandate structure requires that $\rho_a$ carries authority for purposes that originate in $H^{P*}_t$ — a delegation that serves only the agent's independent interests creates no restriction map originating in the principal's fiber.

**The scope boundary.** Acting outside the mandate (*extra mandatum*) creates no obligation for the principal; the act binds only the agent.
Ulpian (Dig.
17.1.5.2): *"Si quis mandatum suscepit et ultra vel citra fines mandati egit, mandati actio nata est."* — if someone took a mandate and acted beyond or within its limits, the mandate action is born.
The nuclear reading: acts in the image of $\rho_a$ bind $\mathcal{P}$ (via *qui facit per alium*); acts outside the image bind only $H^a_t$.
The *actio mandati directa* is the action the principal can bring against the agent for failing to execute the mandate (failure to deploy the delegated scope); the *actio mandati contraria* is the action the agent can bring for compensation beyond the expected costs.
These are the two asymmetric sides of the morphism structure: the principal demands fidelity to $\rho_a$; the agent demands indemnification for costs incurred within $\rho_a$.

**Negotiorum gestio as unauthorized delegation.** *Negotiorum gestio* (Dig.
3.5) is the Roman analog of unauthorized agency: acting on another's affairs without a mandate.
The gestor has no delegation morphism $\rho_a$ from the principal, but acts in the principal's interest under emergency necessity.
The law creates quasi-contractual obligations between gestor and dominus.
The nuclear reading: where no $\rho_a$ exists but the gestor's act is within the domain $Q$, the act creates a new obligation in $H_{t_{\mathrm{now}}}$ — a proposition that is not doubly-stable (not in $H^{P*}_t$) but that the law's own nucleus operators (the Grothendieck topology $J$) will drive toward stability. *Negotiorum gestio* is the case where the sheaf condition on the covering sieve generates authority ex post that was not authorized ex ante.

## Hobbes's authorization and the Actor-Author structure

Hobbes's *Leviathan* Ch. XVI (1651) gives the earliest systematic analysis of what it means to act in another's name — and maps precisely onto the restriction-map structure.

**Author and Actor.** Hobbes distinguishes the Author (whose words and actions are owned) from the Actor (who performs actions belonging to another): "Of Persons Artificial, some have their words and actions Owned by those whom they represent.
And then the Person is the Actor; and he that owneth his words and actions, is the AUTHOR."
The Author-Actor relation is the triple $(\mathcal{P}, a, \rho_a)$: the principal is the Author who owns; the agent is the Actor who performs; the delegation morphism $\rho_a$ is the authorization that constitutes the relation.

**Authorization as right-conferring.** Hobbes: "And as the Right of possession, is called Dominion; so the Right of doing any Action, is called AUTHORITY."
Authorization is the conferral of a Hohfeldian power (Hohfeld's second quartet): the right to do an action within the authorized scope.
In nuclear terms: $\rho_a(\alpha^{\mathrm{scope}}) \in H^a_t$ is the agent's authority proposition — the element in the agent's fiber that Hobbes calls the "right of doing."
The agent acting within $\rho_a$'s image acts by authority; outside it, the agent acts in her own name only.

**Unauthorized acts and the mecovenanter.** Hobbes: acts "not by Commission, nor by any other Declaration of the Author, are his own."
An agent acting without authorization accumulates obligations in $H^a_t$ that are not in any restriction from $H^{P*}_t$.
The normative consequence of the unauthorized act is the agent's alone.
This is the formal content of *delegatus non potest delegare*: the composition $\rho_b \circ \rho_a$ creates obligations in $H^b_t$ that are not in any restriction from $H^{P*}_t$ unless $\mathcal{P}$ separately authorizes — the unauthorized sub-delegation produces a chain of fibers that the principal's accountability proposition does not reach.

## Agency cost as nuclear gap: the Jensen-Meckling reading

The principal-agent problem of Jensen and Meckling (1976) arises from the separation of ownership and control: the owner (principal) cannot perfectly monitor the manager (agent), and the manager's interests may diverge from the owner's.
In nuclear terms, this is a divergence between two fixed fibers.

**The divergence structure.** The principal's fixed fiber $H^{P*}_t$ contains the propositions that the principal's nuclei $(\sigma^P_t, \Delta^P_t)$ stabilize — what the principal recognizes as authoritative and what the principal regards as forward-committed.
The agent's fixed fiber $H^{a*}_t$ contains the propositions stabilized by the agent's own nuclei $(\sigma^a_t, \Delta^a_t)$.
The delegation morphism $\rho_a : H^P \to H^a$ carries the scope authorization from the principal's fiber to the agent's fiber.
The divergence: $\rho_a(H^{P*}_t) \neq H^{a*}_t$.
What the principal stabilizes is not what the agent independently stabilizes.
The agency problem exists whenever this inequality holds.

**Monitoring as nucleus-convergence.** Monitoring expenditures (Jensen-Meckling cost type 1) are costs incurred by the principal to drive $\rho_a(\alpha^{\mathrm{scope}})$ toward $H^{a*}_t$ — to make the agent's exercise of the delegated scope converge with the principal's own nucleus operators.
The monitoring cost is proportional to the gap between $\rho_a(H^{P*}_t)$ and $H^{a*}_t$: the larger the nuclear divergence, the more costly it is to verify alignment.
In the limit: if $\rho_a$ is a nuclear fiber doctrine morphism (a morphism that commutes with both pairs of nuclei), monitoring cost is zero — the agent's nucleus operators are exactly the restrictions of the principal's.
The Jensen-Meckling framing of "perfect principal-agent alignment" corresponds to $\rho_a$ being a nuclear morphism.

**Residual loss as permanent gap.** The residual loss (type 3) = propositions in $H^{P*}_t$ that the agent's acts cannot recover, because the nuclear divergence cannot be closed without changing the identity of the agent.
This is the permanent cost of the separation of ownership and control: the principal would have to become the agent (eliminate $\rho_a$ and act directly) to close the gap entirely.
The residual loss is the welfare equivalent of $H^{P*}_t \setminus \mathrm{image}(\rho_a(H^{a*}_t))$ — the principal's stable authority propositions that lie outside what the agent's fiber can deliver.

## The trust-revocation condition: Locke

Locke's *Second Treatise* develops the most sustained classical argument for the revertibility of delegated authority.
In Ch. XIII §149, Locke describes the legislature as holding "only a Fiduciary Power to act for certain ends" — the legislature is an agent, not a principal; its authority is a delegation from the people.

**The fiduciary structure.** The legislative authority is the delegation morphism from the people (principal $\mathcal{P}$) to the legislature (agent).
The people's authority $\alpha$ is the original accountability — it is never in the legislature's position.
The Legislature has only the delegated scope $\rho_{\mathrm{leg}}(\alpha^{\mathrm{scope}})$ — a bounded delegation of the people's authority into the legislative position.

**Forfeiture and revocation.** Ch. XIX §221: when the legislature "transgress" the trust — when legislative acts exit the scope of the delegation — the morphism is forfeit. *There remains still in the People a Supreame Power to remove or alter the Legislative*: the people's original $\alpha$ was never transferred; it persists through any legislative failure, waiting to be expressed through a new legislative delegation.

**The principal as judge.** §240 gives the clearest statement of the structural asymmetry: *The people shall be judge; for who shall be judge whether his trustee or deputy acts well, and according to the trust reposed in him, but he who deputes him.* The entity who constituted the trust is the only one with standing to evaluate whether it has been honored.
No agent can judge its own compliance.

**The non-transfer of sovereignty.** The people's sovereignty is not merely recoverable in case of forfeiture — it is structurally non-transferable. $\alpha$ is never in the legislative position because the delegation goes *down* from the principal to the agent, and $\alpha$ is in the source, not the target.
This is the Lockean version of Rousseau's inalienability.

The canon law maxim *delegatus non potest delegare* expresses a structural constraint on the category of delegation morphisms.

**Why composition is not authorized.** Let $\rho_a : P \to a$ be the principal's delegation to agent $a$, and $\rho_b : a \to b$ be agent $a$'s attempted sub-delegation to agent $b$.
Even though the composition $\rho_b \circ \rho_a$ exists as a morphism in the framework, it is *not* part of the principal's delegation profile $\rho$ unless $\mathcal{P}$ separately grants it.
The image of $\rho_b \circ \rho_a$ in the agent $b$'s position does not carry the principal's accountability: $\alpha$ is not authorized to flow to $b$ by the composed map.

**Why the rule is structurally correct.** The delegation morphism $\rho_a$ is bounded: it carries only $\alpha^{\mathrm{scope}} \leq \alpha$ into the agent's position.
Agent $a$ cannot grant to $b$ what $a$ does not hold.
More importantly: the sub-delegation creates a further removed representation of $\mathcal{P}$'s authority, and the principal's settling structure does not extend to the further agent unless $\mathcal{P}$ explicitly constructs the additional morphism.
The canon law maxim is a structural fact about the category of delegations: implicit composition is not authorized delegation.

**Exceptions.** The express authorization exception — when the original mandate includes the power to sub-delegate — corresponds to the case where $\rho_a$ carries not just the authority but the higher-order power to create new delegations.
This requires the original delegation to be richer than an ordinary delegation: it must carry delegation-creating capacity into the agent's position.

**The fiduciary structure.** The legislative authority is the delegation morphism $\rho_{\mathrm{leg}} : H^{\mathrm{People}} \to H^{\mathrm{Leg}}$.
The people's authority proposition $\alpha \in H^{P*}_{t_{\mathrm{now}}}$ is the original accountability — it is never in $H^{\mathrm{Leg}}_t$.
The Legislature has only $\rho_{\mathrm{leg}}(\alpha^{\mathrm{scope}})$ — a bounded delegation of the people's authority into the legislative fiber.

**Forfeiture and revocation.** Ch. XIX §221: when the legislature "transgress" the trust — when legislative acts exit the scope of $\rho_{\mathrm{leg}}$ — the delegation morphism is forfeit.
"There remains still in the People a Supreame Power to remove or alter the Legislative": the people's original authority proposition $\alpha \in H^{P*}_{t_{\mathrm{now}}}$ was never transferred; it persists through any legislative failure, waiting to be expressed through a new $\rho_{\mathrm{leg}'}$.
The new legislature is a new restriction map from the same source fiber.

**The principal as judge.** §240 gives the clearest statement of the structural asymmetry: *"The people shall be judge; for who shall be judge whether his trustee or deputy acts well, and according to the trust reposed in him, but he who deputes him."* The entity who constituted the trust is the only one with standing to evaluate whether it has been honored.
No agent can judge its own compliance; no sub-institution can evaluate whether the principal's terms have been met.
This is the formal content of the accountability non-transfer: the principal's accountability proposition $\alpha \in H^{P*}_{t_{\mathrm{now}}}$ is the standard against which all agent fibers are measured, and the principal is the only one whose nuclei $(\sigma^P_t, \Delta^P_t)$ set that standard.

**The non-transfer of sovereignty.** Locke's argument implies a condition stronger than revocability: the people's sovereignty is not merely recoverable in case of forfeiture — it is structurally non-transferable. $\alpha$ is never in $\rho_{\mathrm{leg}}(H^{\mathrm{Leg}}_t)$ because $\rho_{\mathrm{leg}}$ goes DOWN from the people's fiber to the legislative fiber, and $\alpha$ is in the source (fixed fiber of the people's doctrine), not the target.
This is the Lockean version of Rousseau's inalienability: the principal's accountability proposition is not an element of any agent fiber; it is an element of $H^{P*}_{t_{\mathrm{now}}}$ from which all agent fibers receive restriction maps but which no agent fiber contains.

## *Delegatus non potest delegare*: the fixed-fiber constraint

The canon law maxim *delegatus non potest delegare* is not merely a procedural rule — it expresses a structural constraint on the category of delegation morphisms.

**Why composition fails.** Let $\rho_a : H^P \to H^a$ be the principal's delegation to agent $a$, and $\rho_b : H^a \to H^b$ be agent $a$'s attempted sub-delegation to agent $b$.
The composition $\rho_b \circ \rho_a : H^P \to H^b$ is a morphism in $R$.
But this morphism is NOT in $\mathcal{P}$'s delegation profile $\rho$ unless $\mathcal{P}$ separately grants it.
The image of $\rho_b \circ \rho_a$ in $H^b_t$ does not carry $\mathcal{P}$'s accountability proposition: $\alpha \notin (\rho_b \circ \rho_a)(H^P_t)$ in the relevant sense that $\alpha$'s normative force has not been directly authorized to flow to $H^b_t$ by $\mathcal{P}$.

**Why the rule is structurally correct.** The delegation morphism $\rho_a$ is bounded: it carries only $\alpha^{\mathrm{scope}} \leq \alpha$ into $H^a_t$.
Agent $a$ cannot grant to $b$ what $a$ does not hold: $\rho_b(\rho_a(\alpha^{\mathrm{scope}})) \leq \rho_a(\alpha^{\mathrm{scope}})$ in $H^b_t$ (restriction is order-preserving).
But more importantly: the sub-delegation $\rho_b \circ \rho_a$ creates a further removed representation of $\mathcal{P}$'s authority in $H^b_t$, and $\mathcal{P}$'s nuclei $(\sigma^P_t, \Delta^P_t)$ do not extend to $H^b_t$ via the composed map unless $\mathcal{P}$ explicitly constructs a morphism $\rho_{ab} : H^P \to H^b$.
The canon law maxim is thus a theorem about morphism categories: implicit composition is not an authorized delegation.

**Exceptions.** The express authorization exception — when the original mandate includes the power to sub-delegate — corresponds to the case where $\rho_a$ is a functor in the enriched sense: it carries not just authority propositions but the power to create new restriction maps.
In categorical terms: $\rho_a$ then maps the principal's delegation-power into $H^a_t$ as a higher-order proposition, and $\rho_b$ then has legitimate backing.
This requires the original delegation morphism $\rho_a$ to be a morphism not just of Heyting algebras but of nuclear pairs together with their own delegation-capacity structure — a strictly richer object than an ordinary sheaf morphism.

## Nuclear reading: original authority as terminal fiber

**The four quadrants** of the nuclear structure classify authority positions in the system:

| Fiber region | Authority position | What it names |
|---|---|---|
| $H^{P*}_t = \mathrm{Fix}(\sigma^P_t) \cap \mathrm{Fix}(\Delta^P_t)$ | Original, doubly-stable authority | Full principalship: recognized backward and committed forward; the accountability proposition $\alpha$; what the principal cannot alienate |
| $\mathrm{Fix}(\sigma^P_t) \setminus H^{P*}_t$ | Recognized but not forward-committed | Past normative recognition established; forward-stability not yet complete; the saturation gap is zero, the transfer gap non-trivial |
| $\mathrm{Fix}(\Delta^P_t) \setminus H^{P*}_t$ | Forward-committed but not yet recognized | Operational commitment without settled recognition; the transfer gap is zero, the saturation gap non-trivial |
| $H^P_t \setminus (\mathrm{Fix}(\sigma^P_t) \cup \mathrm{Fix}(\Delta^P_t))$ | Free shadow class | Proposed but unsettled authority claims; both gaps non-trivial |

**Proposition 1 (Accountability proposition is in H^{P*}_t — definitional):** The accountability proposition $\alpha \in H^{P*}_t$ means $\sigma^P_t(\alpha) = \alpha$ and $\Delta^P_t(\alpha) = \alpha$: original authority is both backward-recognized (restriction profile demands no more) and forward-committed (every extension already contains it).
This is a definition, not a theorem: the principal is *defined* as the party for whom this holds within the sub-system.

**Proposition 2 (Delegation does not deplete $H^{P*}_t$):** After creating the delegation morphism $\rho_a : H^P \to H^a$, the principal's proposition $\alpha \in H^{P*}_t$ is unaffected: $\sigma^P_t(\alpha) = \alpha$ and $\Delta^P_t(\alpha) = \alpha$ continue to hold.

*Proof.* $\rho_a$ is a morphism from $H^P$ to $H^a$; it does not modify the fiber $H^P_t$ or its nuclear operators $\sigma^P_t, \Delta^P_t$.
These operators are determined by the restriction maps of the presheaf $H^P$, which $\rho_a$ does not alter.
The image of $\rho_a$ lives in $H^a$; the source $H^P$ is unchanged. □

**Proposition 3 (The nuclear morphism condition and agency divergence):** $\rho_a : H^P \to H^a$ is a morphism of nuclear fiber doctrines iff it satisfies: $$\rho_a \circ \sigma^P_t = \sigma^a_t \circ \rho_a \quad \text{and} \quad \rho_a \circ \Delta^P_t = \Delta^P_t \circ \rho_a.$$ When both conditions hold, $\rho_a(H^{P*}_t) \subseteq H^{a*}_t$: the principal's stable authority maps to stable authority for the agent.

*Proof.* If $\sigma^P_t(\alpha) = \alpha$ then $\rho_a(\alpha) = \rho_a(\sigma^P_t(\alpha)) = \sigma^a_t(\rho_a(\alpha))$ (by the nuclear morphism condition), so $\rho_a(\alpha) \in \mathrm{Fix}(\sigma^a_t)$.
Similarly for $\Delta$. □

When the nuclear morphism conditions fail (the generic case for delegation across different institutional contexts), $\sigma^a_t(\rho_a(\alpha)) > \rho_a(\alpha)$: the agent's saturation nucleus demands more than the principal's restriction map delivers.
The gap $[\rho_a(\alpha),\, \sigma^a_t(\rho_a(\alpha))]$ is the *agency divergence* — the space of additional nuclear closure the agent's context requires beyond what the grant provides.

**Proposition 4 (Immutability of $\sigma^P_t$ and $\Delta^P_t$ under agent acts):** No act by any agent $a$ (under any delegation $\rho_a$) can alter $\sigma^P_t$ or $\Delta^P_t$.

*Proof.* $\sigma^P_t$ is determined by the restriction maps of the presheaf $H^P$ over $T$.
Agent acts are elements of $H^P_t$; the presheaf morphisms are not in the write-scope of any element of any fiber.
The same holds for $\Delta^P_t$. □

*Consequence.* The principal's originality — the condition that no restriction from above constitutes $\alpha$ within the sub-system — is not a claim agents can undermine by acting.
It is a structural fact about the presheaf, not a proposition within any fiber.

**On Yoneda representability (structural claim, not yet a derived theorem):** The principal's fixed fiber $H^{P*}_t$ plays the role of the representing object for the sub-system's authority-allocation structure: every agent authority in the sub-system is in the image of some delegation morphism from $H^P$.
By the Yoneda lemma, if $H^{P*}_t$ represents the functor $\mathrm{Hom}_R(-, H^P)$, it is uniquely determined up to isomorphism.
This would be the categorical statement of originality: no other object in the sub-system can represent the same functor.
Whether the authority-allocation functor is indeed representable by $H^{P*}_t$ requires specifying the category precisely and verifying the universal property — this is an open derivation (see open questions).

## Open questions

- **Is there always a unique original principal in a sub-system?** The originality condition ensures that the principal's authority is not constituted by any restriction from above within the sub-system.
  But whether there is a unique such original, or whether multiple competing original-authority structures can coexist, depends on the structure of the authority lattice.
  Multiple non-overlapping originals would correspond to multiple incompatible Grundnormen — a situation Kelsen treated as a contradiction.
- **Does the delegation profile have a categorical universal property?** If the principal's authority structure represents the delegation functor, the delegation profile should be a natural transformation with a universal property.
  Whether the full delegation structure on a principal is uniquely characterized by such a universal property — not yet derived.
- **Does the Locke revertibility condition require the principal's structure to be initial in the authority lattice?** The argument that the people's authority always reverts when the legislature forfeits corresponds to the claim that the principal's authority is never depleted by delegation and always recoverable.
  Whether the originality condition implies initiality in the relevant category is a derivation that requires characterizing the category precisely.
- **Is *delegatus non potest delegare* a theorem or an axiom?** The argument above treats it as a structural consequence of the delegation morphism category.
  But this depends on how the "category of delegation morphisms" is defined — whether composition is automatically authorized, or whether validity is a separate normative condition layered on top.
  The maxim's status (theorem vs. axiom) depends on this specification.
- **Is the accountability proposition $\alpha$ the same as the office incumbency proposition $\iota$?** The [Incumbent](incumbent.md) spec defines the incumbency proposition as asserting that an agent holds an office.
  The principal's accountability proposition asserts original authority over a domain.
  If the principal holds authority through an office, the two coincide; if non-institutional (Kelsen's Grundnorm), they diverge.
  The relationship is a spectrum rather than an identification.

- **Is there always a unique original principal in a sub-system?** The originality condition (no restriction from above within the sub-system) ensures that the principal's fixed fiber is not in the image of any other fiber.
  But whether there is a unique such fiber, or whether multiple competing original-authority fibers can coexist in the same sub-system, depends on the structure of the authority lattice.
  Multiple non-overlapping original fibers would correspond to multiple incompatible Grundnormen — a situation Kelsen treated as a contradiction (p.
  214).
  Whether the nuclear structure of the relational universe forces uniqueness of the original fiber, or allows plural original authorities (as in constitutional systems with separated powers), is not yet derived.
  If the separated-powers structure is a case of multiple cooperating originals rather than one principal with sub-delegations, the spec of Madison's constitutional opposition as mutual nuclear insulation may require a more complex fiber-product structure.

- **Does the delegation profile ρ have a categorical universal property?** The Yoneda reading suggests that the principal's fiber represents the delegation functor.
  If this is right, the delegation profile $\rho$ should be a natural transformation from the representable presheaf $\mathrm{Hom}_R(-, H^P)$ to the authority-fiber functor.
  Whether the full delegation structure on a principal is a representable natural transformation — and whether the universal property uniquely determines $\rho$ up to natural isomorphism — would establish that the principal is a characterized object in the category of authority structures, not just a named element.
  This derivation is not yet given.

- **Does the Locke revertibility condition require the principal's fiber to be an initial object?** Locke's argument that the people's authority always reverts when the legislature forfeits corresponds to the claim that $H^{P*}_{t_{\mathrm{now}}}$ is never depleted by delegation and always recoverable.
  In categorical terms: the principal's fixed fiber is an initial object in the authority lattice of the sub-system — all restriction maps originate from it, and it is terminal in the sense that revocation merely removes target fibers, leaving the source unchanged.
  Whether the originality condition implies initiality in the relevant category (the sub-system authority lattice with restriction maps as morphisms) is a derivation that requires characterizing the category precisely.
  If it holds, the Lockean revertibility is a theorem, not a political postulate.

- **Is *delegatus non potest delegare* a theorem or an axiom in this system?** The argument above treats it as a structural consequence of the delegation morphism category: composition is not automatically authorized.
  But this depends on how the "category of delegation morphisms" is defined.
  If delegations are morphisms in the full category $\mathrm{Hom}_R(H^P, H^a)$ and composition is defined as usual in $R$, then composition IS well-defined — the maxim is not automatically a theorem.
  The maxim instead becomes a constraint on which compositions are RECOGNIZED as valid delegations — a normative condition on top of the categorical structure.
  Deriving the maxim formally would require specifying the normative sub-category of delegation morphisms and showing that it is NOT closed under composition by default.
  This specification is not yet given.

- **What is the correct type of the Bratman gluing condition?** The claim that Bratman's three conditions correspond to naturality, compatibility, and gluing in $\mathbf{Sh}(T, J)$ is structurally motivated but not formally derived.
  Bratman's conditions are formulated for finite shared activities between individual agents; the sheaf-gluing condition applies to potentially infinite families indexed by covering sieves.
  Whether the correspondence goes through in full generality — whether every finite shared cooperative activity is a case of a finite covering sieve with compatible sections — requires spelling out the topology $J$ and verifying that the agents' intentions form a sheaf-theoretically compatible family.
  The identification of "meshing sub-plans" with the gluing condition in particular is intuitive but not yet a derivation.

- **What is the relationship between Pettit's non-domination and the nuclear commutation condition?** The non-domination condition was rendered as: $\rho_a$ commutes with the nuclei — $\rho_a \circ \sigma^P_t = \sigma^a_t \circ \rho_a$.
  But this is the condition for $\rho_a$ to be a nuclear fiber doctrine morphism.
  If non-domination = nuclear morphism condition, then every non-dominating principal-agent delegation is a nuclear morphism.
  Whether this is too strong (all real delegations involve some nuclear non-commutativity, which would make them all dominating by this criterion) or too weak (the nuclear morphism condition is necessary but not sufficient for non-domination) is not yet determined.
  A weaker condition — that $\rho_a$ does not map INTO the agent's fixed fiber without passing through the agent's saturation closure first — might be the correct rendering of contestability.

- **Is the accountability proposition α the same as the office incumbency proposition ι?** The [Incumbent](incumbent.md) spec defines the incumbency proposition $\iota \in H_{t_{\mathrm{now}}}$ as asserting that agent $a$ holds office $O$ at $t_{\mathrm{now}}$.
  The principal's accountability proposition $\alpha \in H^{P*}_{t_{\mathrm{now}}}$ asserts original authority over domain $Q$ at $t_{\mathrm{now}}$.
  If the principal holds the authority through an office — as is typical in institutional settings — then $\alpha$ is a global section of the office's fiber doctrine: $\alpha = (\iota_t)_{t \in T}$ with $\iota_t \in H^*_t$ for all $t$.
  If the principal's authority is non-institutional (personal authority not mediated by an office — the original authority of a constitution's framers, Kelsen's Grundnorm), then $\alpha$ has no corresponding incumbency proposition in an Office spec.
  The relationship between principal-accountability and office-incumbency is therefore a spectrum rather than an identification, and the boundaries are not yet derived.

## Key references

Gaius, *Institutiones* 3.155–162 (*mandatum*); Ulpian, *Digest* 17.1.1 pr., 17.1.5.2 (*mandatum*); Ulpian, *Digest* 3.5.1 (*negotiorum gestio*); Hostiensis, *Summa Aurea* (c.
1253); Decretals of Gregory IX X 1.29.26; Hobbes, *Leviathan* Ch. XVI (1651); Locke, *Second Treatise of Government* Ch. XIII, XIX (1689/1690); Rousseau, *The Social Contract* Bk.
II Ch. I (1762); Kelsen, *Pure Theory of Law* 2nd ed. (1967); Jensen & Meckling, "Theory of the Firm," *Journal of Financial Economics* 3(4) (1976); Papinian, *Digest* 1.21.1; Boniface VIII, *Liber Sextus Decretalium*, *Regulae Iuris* 72 (1298); Bratman, "Shared Cooperative Activity," *Philosophical Review* 101(2) (1992); Pettit, *Republicanism* (1997); Hohfeld, *Yale Law Journal* 23 (1913), 26 (1917).

- Gaius, *Institutiones* 3.155–162 (*mandatum*)
- Ulpian, *Digest* 17.1.1 pr., 17.1.5.2 (*mandatum*, *actio mandati*)
- Ulpian, *Digest* 3.5.1 (*negotiorum gestio*)
- Pope Innocent III, canon law maxim on *delegatus non potest delegare* (c.
  1200); Hostiensis, *Summa Aurea* (c.
  1253)
- Decretals of Gregory IX, X 1.29.26 (*delegatus non potest delegare* codified)
- Hobbes, *Leviathan* Ch. XVI (1651): "Of Persons, Authors, and Things Personated"
- Locke, *Second Treatise of Government* Ch. XIII §149; Ch. XIX §§221–222 (1689/1690)
- Rousseau, *The Social Contract* Bk.
  II Ch. I (1762)
- Kelsen, *Pure Theory of Law* 2nd ed. (trans.
  Knight, 1967), pp.
  193–221 (*Grundnorm*)
- Jensen, M.C. & Meckling, W.H., "Theory of the Firm: Managerial Behavior, Agency Costs and Ownership Structure," *Journal of Financial Economics* 3(4): 305–360 (1976)
- Papinian, *Digest* 1.21.1 (*delegata iurisdictio non potest delegari*)
- Boniface VIII, *Liber Sextus Decretalium*, *Regulae Iuris* 72 (1298): *"Qui facit per alium est perinde ac si faciat per seipsum"*
- Bratman, M., "Shared Cooperative Activity," *Philosophical Review* 101(2): 327–341 (1992)
- Pettit, P., *Republicanism: A Theory of Freedom and Government* (1997), Ch. 2
- Hohfeld, W.N., "Some Fundamental Legal Conceptions as Applied in Judicial Reasoning," *Yale Law Journal* 23 (1913); 26 (1917)
- Broom, H., *Legal Maxims* (1845), pp.
  816–820 (*qui facit per alium*)
- Yoneda, N., "On the homology theory of modules," *J.
  Fac.
  Sci.
  Univ.
  Tokyo* 7 (1954): 193–227 (representability)
- Mac Lane, S., *Categories for the Working Mathematician* §III.
  2 (Yoneda Lemma, 1971)
