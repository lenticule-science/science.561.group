---
name: "Principal"
description: "A Principal is a quadruple (P, Q, ρ, α) — an original authority structure P whose accountability proposition is not derived from any superior authority within the sub-system, an action domain Q, a delegation profile ρ assigning to each agent a restriction of the principal's authority into the agent's scope, and an accountability proposition α in the principal's settled determination. Delegation does not deplete the principal's authority (restriction is not depletion); accountability does not flow down delegation morphisms; revocation withdraws ρ_a without disturbing the principal."
extends: Entity
date-created: 2026-03-19
date-modified: 2026-04-28
---

## What it is

A **Principal** is the source from which delegated authority derives within a normative sub-system: a party whose authority is not itself derived from any superior authority within the sub-system, and who may generate new authority relations — delegations — by creating restrictions of their own authority into agent positions.

The structural fact from which everything follows: within the sub-system, no restriction descends from above to constitute the principal's authority. The principal's accountability proposition is settled within the principal's own determination — it is the terminal stratum of the authority structure within the sub-system. All agent authority is in the image of some delegation originating from the principal.

Two structural asymmetries define principalship. First, restriction maps flow *down*: delegation morphisms carry authority from the principal's position into agent positions, never the reverse. Second, accountability does not flow: the accountability proposition belongs to the principal and cannot be moved out of the principal's position by any act of any agent. The agent acts in the principal's name; the consequences bind the principal; the principal cannot escape by pointing at the agent.

## Formal quadruple

A **Principal** is a quadruple $\mathcal{P} = (P, Q, \rho, \alpha)$:

$$\mathcal{P} = (P,\; Q,\; \rho : \mathrm{Ag} \to \mathrm{Delegations},\; \alpha)$$

where:
- $P$ is the **original authority structure** — the principal's normative position, a structure over the framework's history that is not constituted by any restriction from above within the sub-system
- $Q$ is the **action domain** — the scope within which the principal's authority operates; no authority extends beyond $Q$
- $\rho$ is the **delegation profile** — the function assigning to each agent $a \in \mathrm{Ag}$ a delegation $\rho_a : P \to a$, a morphism that carries a sub-quota of the principal's authority into the agent's position without depleting $P$'s settled authority
- $\alpha$ is the **accountability proposition** — the [predication cell](../../../../../../math/domains/voidmath/terms/predication-cell.md) recording that $\mathcal{P}$ holds original authority over $Q$ at the current history; $\alpha$ has reached affirming joint [settlement](../../../../../../math/domains/voidmath/terms/settlement.md) on the recognition and execution predicates the framework requires for original authority

**Originality condition.** $\mathcal{P}$ is a principal (not merely an agent) iff: there is no delegation morphism within the sub-system whose image constitutes $\alpha$. The principal's accountability is not constituted by any restriction from above within the sub-system. This is system-relative originality: externally, $P$ may itself be constituted by a statute, an election, or a meta-authority — but within the sub-system under consideration, no such constituting morphism exists.

**Accountability non-transfer.** For all agents $a$, $\alpha$ is not in the image of any delegation morphism $\rho_a$. Delegations create morphisms going down from the principal to agents; accountability propositions do not travel along those morphisms. This is the formal content of retained accountability: the principal's settled $\alpha$ persists, and no act of any agent can move it out of the principal's position. The agent's misuse of delegated authority does not discharge the principal.

**Revocability.** Removing $\rho_a$ from $\rho$ terminates the agent's borrowed authority. The agent's own position receives no further authority restriction from the principal; the agent's authority propositions revert to whatever the agent's position independently contains. The principal's own authority $\alpha$ is unaffected: it was never in the agent's position to begin with.

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
| **Kelsen's Grundnorm as ultimate principal** | Kelsen, *Pure Theory of Law* 2nd ed. (1967, trans. Knight), pp. 193–221 | The Grundnorm is the originality condition in its limit form: the ultimate principal whose authority is not constituted by any restriction from any positive-norm source within the legal system. The basic norm is "not itself a positive norm" but the "transcendental-logical presupposition" of all positive norms — in framework terms, the [absurdity](../../../../../../philosophy/domains/relationality/terms/absurd.md) the legal system rests on, the irreducible base from which all settled legal claims derive. |
| **Bratman's shared cooperative activity** | Bratman, *Philosophical Review* 101(2) (1992) | When multiple agents form a shared cooperative activity, their individual authority propositions in their respective positions must form a compatible family — observations that agree where their domains overlap. If the family is compatible and gathers into a coherent global record, it constitutes a collective principal. Bratman's three conditions (mutual responsiveness, commitment to joint activity, meshing sub-plans) correspond to: naturality of the delegations, compatibility of the family, and successful gathering into a global record. |
| **Pettit's non-domination condition** | Pettit, *Republicanism* (1997), Ch. 2 | Non-domination = the delegation $\rho_a$ does not bypass the agent's own settling structure. A delegation that imposes propositions into the agent's settled position arbitrarily — without passing through the agent's own witnessing — is dominating. A delegation that respects the agent's own settling structure is non-dominating; the agent can contest the imposition through ordinary witnessings. |
| **Rousseau's general will as inalienable authority** | Rousseau, *The Social Contract* Bk. II Ch. I (1762) | The inalienability of sovereignty = the formal non-delegatability of $\alpha$: the delegation morphisms carry sub-propositions of $\alpha$'s scope into agent positions, but $\alpha$ itself does not travel — it remains permanently in the principal's position. Every delegation is partial, not total. The general will (sovereignty) is the principal's $\alpha$; the will of all is the aggregate of delegated propositions in agent positions, which is strictly smaller. |

## The *mandatum* doctrine: Roman principal-agent

The Roman law of mandate (*mandatum*) in Gaius *Institutiones* 3.155–162 and Digest Title 17.1 provides the classical legal structure from which all modern principal-agent law descends.

**The mandate relationship.** Gaius (Inst. 3.155) identifies the mandate's scope: the mandate is constituted whether directed for the mandator's benefit or another's. The *mandator* (principal) creates the *mandatarius*'s (agent's) authority by issuing the mandate; the mandate is the delegation morphism $\rho_a$. Ulpian (Dig. 17.1.1 pr.) adds the crucial restriction: a mandate given purely for the benefit of the mandatarius is not a true mandate but merely advice (*consilium*). The mandate structure requires that $\rho_a$ carries authority for purposes that originate in the principal's position — a delegation that serves only the agent's independent interests does not constitute a delegation in the principal's name.

**The scope boundary.** Acting outside the mandate (*extra mandatum*) creates no obligation for the principal; the act binds only the agent. Ulpian (Dig. 17.1.5.2): if someone took a mandate and acted beyond or within its limits, the mandate action is born. Acts in the image of $\rho_a$ bind $\mathcal{P}$ (via *qui facit per alium*); acts outside the image bind only the agent's own position. The *actio mandati directa* is the action the principal can bring against the agent for failing to execute the mandate; the *actio mandati contraria* is the action the agent can bring for compensation for costs incurred within the mandate.

**Negotiorum gestio as unauthorized delegation.** *Negotiorum gestio* (Dig. 3.5) is the Roman analog of unauthorized agency: acting on another's affairs without a mandate. The gestor has no delegation morphism from the principal but acts in the principal's interest under emergency necessity. The law creates quasi-contractual obligations between gestor and dominus. Where no $\rho_a$ exists but the gestor's act is within the domain $Q$, the act creates a new obligation that the law's own normative-system covering structure may drive toward settlement — authority generated *ex post* that was not authorized *ex ante*.

## Hobbes's authorization

Hobbes's *Leviathan* Ch. XVI (1651) gives the earliest systematic analysis of what it means to act in another's name.

**Author and Actor.** Hobbes distinguishes the Author (whose words and actions are owned) from the Actor (who performs actions belonging to another). The Author-Actor relation is the triple $(\mathcal{P}, a, \rho_a)$: the principal is the Author who owns; the agent is the Actor who performs; the delegation morphism $\rho_a$ is the authorization that constitutes the relation.

**Authorization as right-conferring.** Hobbes: "the Right of doing any Action, is called AUTHORITY." Authorization is the conferral of a Hohfeldian power. The agent acting within the image of $\rho_a$ acts by authority; outside it, the agent acts in her own name only.

**Unauthorized acts.** Hobbes: acts "not by Commission, nor by any other Declaration of the Author, are his own." An agent acting without authorization accumulates obligations in the agent's own position that are not in any restriction from the principal's position. The normative consequence of the unauthorized act is the agent's alone. This is the formal content of *delegatus non potest delegare*: composed delegations without explicit authorization create chains that the principal's accountability does not reach.

## Agency cost: the Jensen-Meckling reading

The principal-agent problem of Jensen and Meckling (1976) arises from the separation of ownership and control: the owner (principal) cannot perfectly monitor the manager (agent), and the manager's interests may diverge from the owner's. In framework terms, this is a divergence between the principal's and agent's settling structures.

**The divergence structure.** The principal has its own settling structure — what the principal recognizes as authoritative and forward-committed. The agent has its own. The delegation morphism $\rho_a$ carries the scope authorization from the principal's position to the agent's position. The divergence: what the principal would settle as authoritative is not what the agent independently settles. The agency problem exists whenever this divergence holds.

**Monitoring as alignment.** Monitoring expenditures (Jensen-Meckling cost type 1) are costs incurred by the principal to drive the agent's exercise of the delegated scope into alignment with the principal's own settling structure. The cost is proportional to the divergence: the larger the divergence, the more costly to verify alignment. In the limit: if $\rho_a$ commutes with both parties' settling structures (the agent's settled positions are exactly the restrictions of the principal's), monitoring cost is zero.

**Residual loss as permanent gap.** The residual loss (type 3) = positions in the principal's settled authority that the agent's acts cannot recover, because the divergence cannot be closed without changing the identity of the agent. This is the permanent cost of the separation of ownership and control: the principal would have to become the agent (eliminate $\rho_a$ and act directly) to close the gap entirely.

## The trust-revocation condition: Locke

Locke's *Second Treatise* develops the most sustained classical argument for the revertibility of delegated authority. In Ch. XIII §149, Locke describes the legislature as holding "only a Fiduciary Power to act for certain ends" — the legislature is an agent, not a principal; its authority is a delegation from the people.

**The fiduciary structure.** The legislative authority is the delegation morphism from the people (principal $\mathcal{P}$) to the legislature (agent). The people's authority $\alpha$ is the original accountability — it is never in the legislature's position. The Legislature has only the delegated scope $\rho_{\mathrm{leg}}(\alpha^{\mathrm{scope}})$ — a bounded delegation of the people's authority into the legislative position.

**Forfeiture and revocation.** Ch. XIX §221: when the legislature "transgress" the trust — when legislative acts exit the scope of the delegation — the morphism is forfeit. *There remains still in the People a Supreame Power to remove or alter the Legislative*: the people's original $\alpha$ was never transferred; it persists through any legislative failure, waiting to be expressed through a new legislative delegation.

**The principal as judge.** §240 gives the clearest statement of the structural asymmetry: *The people shall be judge; for who shall be judge whether his trustee or deputy acts well, and according to the trust reposed in him, but he who deputes him.* The entity who constituted the trust is the only one with standing to evaluate whether it has been honored. No agent can judge its own compliance.

**The non-transfer of sovereignty.** The people's sovereignty is not merely recoverable in case of forfeiture — it is structurally non-transferable. $\alpha$ is never in the legislative position because the delegation goes *down* from the principal to the agent, and $\alpha$ is in the source, not the target. This is the Lockean version of Rousseau's inalienability.

## *Delegatus non potest delegare*

The canon law maxim *delegatus non potest delegare* expresses a structural constraint on the category of delegation morphisms.

**Why composition is not authorized.** Let $\rho_a : P \to a$ be the principal's delegation to agent $a$, and $\rho_b : a \to b$ be agent $a$'s attempted sub-delegation to agent $b$. Even though the composition $\rho_b \circ \rho_a$ exists as a morphism in the framework, it is *not* part of the principal's delegation profile $\rho$ unless $\mathcal{P}$ separately grants it. The image of $\rho_b \circ \rho_a$ in the agent $b$'s position does not carry the principal's accountability: $\alpha$ is not authorized to flow to $b$ by the composed map.

**Why the rule is structurally correct.** The delegation morphism $\rho_a$ is bounded: it carries only $\alpha^{\mathrm{scope}} \leq \alpha$ into the agent's position. Agent $a$ cannot grant to $b$ what $a$ does not hold. More importantly: the sub-delegation creates a further removed representation of $\mathcal{P}$'s authority, and the principal's settling structure does not extend to the further agent unless $\mathcal{P}$ explicitly constructs the additional morphism. The canon law maxim is a structural fact about the category of delegations: implicit composition is not authorized delegation.

**Exceptions.** The express authorization exception — when the original mandate includes the power to sub-delegate — corresponds to the case where $\rho_a$ carries not just the authority but the higher-order power to create new delegations. This requires the original delegation to be richer than an ordinary delegation: it must carry delegation-creating capacity into the agent's position.

## Open questions

- **Is there always a unique original principal in a sub-system?** The originality condition ensures that the principal's authority is not constituted by any restriction from above within the sub-system. But whether there is a unique such original, or whether multiple competing original-authority structures can coexist, depends on the structure of the authority lattice. Multiple non-overlapping originals would correspond to multiple incompatible Grundnormen — a situation Kelsen treated as a contradiction.
- **Does the delegation profile have a categorical universal property?** If the principal's authority structure represents the delegation functor, the delegation profile should be a natural transformation with a universal property. Whether the full delegation structure on a principal is uniquely characterized by such a universal property — not yet derived.
- **Does the Locke revertibility condition require the principal's structure to be initial in the authority lattice?** The argument that the people's authority always reverts when the legislature forfeits corresponds to the claim that the principal's authority is never depleted by delegation and always recoverable. Whether the originality condition implies initiality in the relevant category is a derivation that requires characterizing the category precisely.
- **Is *delegatus non potest delegare* a theorem or an axiom?** The argument above treats it as a structural consequence of the delegation morphism category. But this depends on how the "category of delegation morphisms" is defined — whether composition is automatically authorized, or whether validity is a separate normative condition layered on top. The maxim's status (theorem vs. axiom) depends on this specification.
- **Is the accountability proposition $\alpha$ the same as the office incumbency proposition $\iota$?** The [Incumbent](../../../terms/incumbent.md) spec defines the incumbency proposition as asserting that an agent holds an office. The principal's accountability proposition asserts original authority over a domain. If the principal holds authority through an office, the two coincide; if non-institutional (Kelsen's Grundnorm), they diverge. The relationship is a spectrum rather than an identification.

## Key references

Gaius, *Institutiones* 3.155–162 (*mandatum*); Ulpian, *Digest* 17.1.1 pr., 17.1.5.2 (*mandatum*); Ulpian, *Digest* 3.5.1 (*negotiorum gestio*); Hostiensis, *Summa Aurea* (c. 1253); Decretals of Gregory IX X 1.29.26; Hobbes, *Leviathan* Ch. XVI (1651); Locke, *Second Treatise of Government* Ch. XIII, XIX (1689/1690); Rousseau, *The Social Contract* Bk. II Ch. I (1762); Kelsen, *Pure Theory of Law* 2nd ed. (1967); Jensen & Meckling, "Theory of the Firm," *Journal of Financial Economics* 3(4) (1976); Papinian, *Digest* 1.21.1; Boniface VIII, *Liber Sextus Decretalium*, *Regulae Iuris* 72 (1298); Bratman, "Shared Cooperative Activity," *Philosophical Review* 101(2) (1992); Pettit, *Republicanism* (1997); Hohfeld, *Yale Law Journal* 23 (1913), 26 (1917).
