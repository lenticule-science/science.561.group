---
name: institution
description: "An institution is a stable, organized pattern of [practices](../domains/work/terms/practice.md) that structures how people act in a domain. Hospitals, schools, courts, prisons, the military, churches, and markets are institutions. So are less visible things: marriage, medical diagnosis, academic peer review, the job interview."
date-created: 2026-03-06
tags:
- social-theory
- governance
params:
  positions: relational-universe
  constitutive-rules: relational-universe-morphism
  collective-recognition: relational-universe-morphism
  background-conditions: relational-universe
output: relational-universe
ast:
  grothendieck-topology:
    - constitutive-rules:
        - positions
    - collective-recognition:
        - constitutive-rules
    - background-conditions:
        - collective-recognition
aliases:
  - Institution
keywords:
  - SocialTheory
  - Governance
---

An institution is a stable, organized pattern of [practices](../domains/work/terms/practice.md) that structures how people act in a domain. Hospitals, schools, courts, prisons, the military, churches, and markets are institutions. So are less visible things: marriage, medical diagnosis, academic peer review, the job interview.

What makes something an institution rather than just a habit or a preference is that it persists beyond the individuals who participate in it. A teacher retires; the school continues. Institutions carry rules, roles, procedures, and expectations that exist before any particular person fills them and continue after that person leaves.

Institutions don't just constrain people — they produce the categories through which people understand themselves and each other. A hospital doesn't just treat sick people; it produces the category of "patient," the role of "doctor," and the boundary between "healthy" and "ill." [Michel Foucault](../../../../../references/people/michel-foucault.md) analyzed institutions as the sites where [power/knowledge](../domains/critical-theory/domains/foucauldian/terms/power-knowledge.md) operates — where knowledge about people is produced through the same practices that exercise power over them [@foucault1977]. The categories institutions use to describe their subjects ("delinquent," "mentally ill," "learning disabled") aren't descriptions of pre-existing types but products of the institution's own practices of observation, classification, and management. Institutions are [contingent](../../philosophy/domains/western/domains/metaphysics/terms/contingency.md): each emerged from specific historical developments that a [genealogical](../domains/critical-theory/domains/foucauldian/terms/genealogy.md) analysis can trace.

---

## Additional formulation

```yaml
---
id: institution
description: "An Institution is a quintuple (Pos, D, CR, Rec, BG) — a position set Pos, a deontic profile assignment D, a constitutive rule set CR of the form 'X counts as Y in context C', a collective recognition predicate Rec, and background conditions BG. The defining structure: a rule-system that creates and maintains institutional facts by collective acceptance, persisting independently of any particular set of participants. Three traditions: Searle (constitutive rules and status-functions), North (rules of the game vs. organizations as players), Hodgson (reconstitutive downward causation — institutions reshape agent dispositions over time). Nuclear reading: institution = Grothendieck topology J on the history site (T, J); constitutive rules are covering sieves; collective recognition is the sheaf condition; background conditions are the substrate. Beck-Chevalley reading: the RelationalUniverseBeckChevalleyTower distinguishes two institutional acts — operating within the institution (morphisms inside a fixed topos R with fixed topology J) and operating on the institution (geometric morphisms R → R' that change J itself, i.e., change the constitutive rules). The σ-BC condition holds at every finite depth level — backward-stability of constitutive rules is always preserved. The Δ-BC condition fails at frontier histories but holds in the colimit: an institution operating at finite scope may have new extensions not yet committed to carrying its rules forward, but in the full relational universe both conditions hold and the institution is fully coherent. Automorphic directed comonad reading: a mature institution — one that has reached the hull level — satisfies the self-generation identity R^hull = U_{G^Σ}(R^hull). Its fiber atom H^hull is a fixed point of the automorphic directed comonad G_Σ: the institution's core constitutional structure is stable under the substitution symmetry Σ. At the hull level, the institution generates itself from a single isomorphism class of constitutional fiber. History separation holds as a theorem (not an axiom) at the hull level: the aperiodicity of the quasicrystal Q^H means no two histories within the mature institution are indistinguishable by their institutional fiber algebras — every position in the institution has a unique constitutional signature."
date-created: 2026-03-19
date-modified: 2026-03-20
params:
  positions: relational-universe
  constitutive-rules: relational-universe-morphism
  collective-recognition: relational-universe-morphism
  background-conditions: relational-universe
output: relational-universe
ast:
  grothendieck-topology:
    - constitutive-rules:
        - positions
    - collective-recognition:
        - constitutive-rules
    - background-conditions:
        - collective-recognition
---
```

# Institution

## What this is

An **Institution** is a system of constitutive rules of the form "X counts as Y in context C" that brings institutional facts into existence by collective acceptance.
The mechanism is the **Status Function Declaration**: a speech act (or equivalent collective act) that installs a status-function — a deontic power, right, obligation, or permission — on an entity or agent relative to the institution.
The institution is not reducible to its members; it consists of the generative rule-system that defines what positions exist and what it means to occupy them.

## Formal tuple

An **Institution** is a quintuple $I = (\text{Pos}, D, \text{CR}, \text{Rec}, \text{BG})$:

$$I = (\text{Pos},\; D : \text{Pos} \to \text{HPos},\; \text{CR},\; \text{Rec},\; \text{BG})$$

where: - $\text{Pos}$ is the set of **positions** (named offices; see [Office](../../../../../services/economics-and-business-science-services-section/services/business-science-services-section/content/text/glossary/terms/office.md)) - $D : \text{Pos} \to \text{HohfeldianProfile}$ assigns each position its deontic profile — the powers, duties, privileges, and immunities of any occupant - $\text{CR} \subseteq \{(X, Y, C)\}$ is the **constitutive rule set** — triples of the form "X counts as Y in context C" that generate institutional facts from brute facts - $\text{Rec}$ is the **collective recognition** predicate — the ongoing acceptance by participants that keeps the institutional facts operative; without $\text{Rec}$, CR is a dead letter - $\text{BG}$ is the **background condition** — the brute-fact substrate (physical, computational, material) within which the institution operates

An institution is **operative** at time $t$ if and only if: $\text{CR}$ is consistent, $\text{Rec}_t$ holds for the relevant participant population, and $\text{BG}_t$ is satisfied.

**Four invariants.** $I$ is an institution iff it satisfies:

1. **Constitutive rule sufficiency**: $\text{CR}$ must be rich enough to generate all the institutional facts required for $I$ to be $I$ — it must specify what positions exist, what actions count as exercises of which powers, and what conditions bring new institutional facts into existence.
  Regulative rules (rules that regulate pre-existing behavior) are not sufficient; the institution's rules must *constitute* the facts they govern.
  Searle's criterion: the rule-form "X counts as Y in context C" must appear; "do not do X" is regulative, not constitutive.

2. **Collective recognition persistence**: $\text{Rec}$ must hold continuously over the relevant participant population for $I$ to remain operative.
  The institution is not a physical object; it exists only insofar as it is collectively recognized.
  A monetary system ceases to function when participants stop accepting money as money.
  A legal system ceases to function when officials stop treating law as binding. $\text{Rec}$ is not a one-time act but an ongoing condition — the institution's existence is constitutively dependent on sustained collective acceptance.

3. **Position occupancy independence**: $I$ persists through complete turnover of position-occupants.
  The positions $\text{Pos}$ and their deontic profiles $D$ exist independently of any particular person filling them.
  This is the formal content of institutional persistence: the institution is not the set of current officeholders but the rule-system that defines what offices exist and what occupancy entails.
  North's formulation: the institution is the rules of the game; the players (occupants) are variable.

4. **Background condition satisfaction**: $\text{BG}_t$ must be satisfied — the brute-fact substrate must support the institution's operation.
  An institution requires a medium: physical, computational, or social.
  A property rights institution requires a physical world with objects that can be possessed and transferred.
  FARS as an institution requires the git-file-system substrate.
  Changing the medium (from paper deeds to blockchain) may preserve the institution if the enabling conditions are the same; but removing all media destroys the institution regardless of how well-specified its constitutive rules are.

**Nuclear/sheaf translation.** In the relational universe, an institution corresponds to a **Grothendieck topology** $J$ on the history site $(T, J)$:

- Each covering sieve $S \in J(t)$ is a constitutive rule: "the histories in $S$ collectively count as covering $t$" — they together witness what is institutionally valid at $t$
- The sheaf condition on $H : T^{\mathrm{op}} \to \mathbf{HA}$ is the collective recognition condition: local sections cohere into global ones if and only if the institution's recognition is consistent
- A Lawvere–Tierney topology $j : \Omega \to \Omega$ is the internal version — the institution's constitutive rules internalized as a closure operator on truth values

The three traditions (Searle, North, Hodgson) each emphasize a different component: Searle emphasizes CR; North emphasizes Pos and D; Hodgson emphasizes the feedback from $\text{Rec}$ back onto $\text{BG}$ over time (reconstitutive downward causation — not captured in the static tuple).

## Nuclear derivation

**The constitutive rule proposition.** For a rule $(X, Y, C) \in \text{CR}$, define the institutional validity proposition at history $t$:

$$r_{XYC} \;\in\; H_t$$

where $r_{XYC}$ is the element witnessing "entity $X$ occupies status $Y$ in context $C$" in the fiber Heyting algebra at $t$.
The institution is operative at $t$ if and only if $r_{XYC} \in H^*_t$ for every $(X, Y, C) \in \text{CR}$.

**Characterization via the fixed-fiber characteristic morphism.** The characteristic morphism $\chi_{H^*} : H \to \Omega$ classifies institutional validity as an internal truth value of the topos $R = \mathbf{Sh}(T, J)$:

$$\chi_{H^*, t}(r_{XYC}) \;=\; \bigl\{\, f : s \to t \;\bigm|\; H(f)(r_{XYC}) \in H^*_s \,\bigr\}$$

This is a sieve on $t$.
The rule is operative if and only if this sieve is the maximal sieve on $t$:

$$r_{XYC} \in H^*_t \;\iff\; \chi_{H^*, t}(r_{XYC}) = \top_t$$

The maximal sieve condition is the sheaf condition: every restriction of $r_{XYC}$ to a sub-history $s \leq t$ is in $H^*_s$.
Institutional validity is globally coherent — the validity of a rule at $t$ is the validity of all its restrictions.

**What $\sigma_t$ does.** The saturation nucleus is the backward-facing closure:

$$\sigma_t(r_{XYC}) = r_{XYC} \;\iff\; r_{XYC} \in \mathrm{Fix}(\sigma_t)$$

This holds if and only if the accumulated sub-history $t$ already forces $r_{XYC}$: every sub-history that could witness the rule in force already does.
In institutional terms, $\sigma_t(r_{XYC}) = r_{XYC}$ is the condition that $\text{Rec}_t$ holds for the rule: the community's shared evidence at $t$ collectively settles the rule as valid.

**What $\Delta_t$ does.** The transfer nucleus is the forward-facing closure:

$$\Delta_t(r_{XYC}) = r_{XYC} \;\iff\; r_{XYC} \in \mathrm{Fix}(\Delta_t)$$

This holds if and only if every one-step extension $t' = t \star m$ already commits to $r_{XYC}$: the rule carries forward.
In institutional terms, $\Delta_t(r_{XYC}) = r_{XYC}$ is the condition that $\text{BG}_t$ is satisfied and the institutional structure is stable under future steps.

**Operative condition as double fixed-point.** Combining:

$$\text{institution operative at } t \;\iff\; \forall (X, Y, C) \in \text{CR} : r_{XYC} \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$$

The three informal conditions — CR consistent, $\text{Rec}_t$ holds, $\text{BG}_t$ satisfied — collapse into the single condition that every constitutive rule's proposition is doubly-stable.

**The joint retraction.** By the commutation theorem, $\pi_t = \sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ is a nucleus with $\mathrm{Fix}(\pi_t) = H^*_t$.
For any proposed rule $r_{XYC} \in H_t$:

$$\pi_t(r_{XYC}) \;=\; \bigwedge\bigl\{\, s \in H^*_t : s \geq r_{XYC} \,\bigr\}$$

This is the smallest doubly-stable proposition above $r_{XYC}$ — the institutional closure of the proposed rule.
The gap $\pi_t(r_{XYC}) - r_{XYC}$ measures how far the proposed rule is from institutional validity.

**The four failure modes.** The nuclear partition $H_t = H^*_t \sqcup \mathrm{SatShadow}_t \sqcup \mathrm{TrShadow}_t \sqcup \mathrm{FreeShadow}_t$ gives four institutional states for each rule:

| Quadrant | $\sigma_t$ | $\Delta_t$ | Institutional meaning |
|---|---|---|---|
| $H^*_t$ | $\sigma_t(r) = r$ | $\Delta_t(r) = r$ | Rule operative: recognized and stable |
| $\mathrm{SatShadow}_t$ | $\sigma_t(r) = r$ | $\Delta_t(r) > r$ | Collectively recognized but institutionally fragile — the community accepts it but the structure does not maintain it forward |
| $\mathrm{TrShadow}_t$ | $\sigma_t(r) > r$ | $\Delta_t(r) = r$ | Institutionally required but not yet recognized — the rule is structurally in force but collective acceptance has not settled it |
| $\mathrm{FreeShadow}_t$ | $\sigma_t(r) > r$ | $\Delta_t(r) > r$ | Dead letter — proposed in $\text{CR}$ but lacking both recognition and institutional backing |

**Persistence theorem.** If $r_{XYC} \in H^*_{t'}$ (the rule is operative at $t'$), then $H(f)(r_{XYC}) \in H^*_t$ for all morphisms $f : t \to t'$ in $T$.

*Proof.* 1.
The restriction map $H(f) : H_{t'} \to H_t$ commutes with RelationalHistoryFiberSaturatingNucleus: $H(f)(\sigma_{t'}(a)) = \sigma_t(H(f)(a))$ for all $a \in H_{t'}$.
This is the $\rho$-$\sigma$-Nat axiom of RelationalUniverseGeometricTheory (Group 6): $\rho(\sigma(a), h) = \sigma(\rho(a, h))$ for $h \leq \pi(a)$, where $H(f) = \rho_{t', t}$.
2.
The restriction map commutes with RelationalHistoryFiberTransferringNucleus: $H(f)(\Delta_{t'}(a)) = \Delta_t(H(f)(a))$, from the $\rho$-$\Delta$-Nat axiom of the same group.
3.
Let $r_{XYC} \in H^*_{t'} = \mathrm{Fix}(\sigma_{t'}) \cap \mathrm{Fix}(\Delta_{t'})$, so $\sigma_{t'}(r_{XYC}) = r_{XYC}$.
By step 1: $\sigma_t(H(f)(r_{XYC})) = H(f)(\sigma_{t'}(r_{XYC})) = H(f)(r_{XYC})$, hence $H(f)(r_{XYC}) \in \mathrm{Fix}(\sigma_t)$.
4.
By step 2: $\Delta_t(H(f)(r_{XYC})) = H(f)(\Delta_{t'}(r_{XYC})) = H(f)(r_{XYC})$, hence $H(f)(r_{XYC}) \in \mathrm{Fix}(\Delta_t)$.
5.
Steps 3–4 give $H(f)(r_{XYC}) \in \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t) = H^*_t$. $\square$

A rule operative at $t'$ is operative at every $t \leq t'$.
The institution persists backward: operative rules are globally coherent over the site $T$.
This is the formal content of invariant 3 (position occupancy independence): the institutional structure is a global section of $H^*$ over the full site, not merely locally valid at one history.

## Three theoretical traditions

**Searle (1995, 2010)**: constitutive rules and status-functions.
A constitutive rule does not merely regulate behavior that could occur without it — it creates the behavior it regulates.
"Touchdowns score six points" does not regulate an independently existing event; it constitutes the event by defining it.
An institution is a system of such rules.
Status-functions are the deontic powers assigned by these rules: the right to vote, the duty to obey, the power to authorize.
These exist only within the institutional context C.

**North (1990)**: institutions as **constraints** (rules of the game) distinct from **organizations** (the players).
The institution is the rule-set that structures interaction; an organization is a group of agents pursuing goals within that rule-set.
The distinction is critical: the FARS is an institution (it defines the rules); a specific agent serving in the FARS is a player in the game the institution defines.

**Hodgson (2006)**: institutions as enduring social structures with **reconstitutive downward causation** — they not only constrain agents but reshape agents' dispositions and identities over time.
An agent who serves long within an institution internalizes its constitutive rules; this is not captured by Searle's synchronic account or North's purely constraint-based view.

## Structural components

Every institution has five structural components:

| Component | What it is |
|---|---|
| Positions | The offices — named normative slots that agents can occupy (see [Officer](../../../../../philosophy-services-section/services/relationality-services-section/content/text/documents/articles/notes/2026/03/18/2026-03-18-officer.md)) |
| Deontic profiles | The Hohfeldian rights, duties, powers, and immunities associated with each position |
| Constitutive rules | The "X counts as Y in C" rules generating the institutional facts |
| Collective recognition | The sustaining act — the ongoing acceptance that keeps the institution operative |
| Background conditions | The brute-fact substrate within which the institution operates (the physical, computational, or material medium) |

The institution is not any one of these alone.
Remove the constitutive rules and you have only a social habit.
Remove collective recognition and you have a dead letter.
Remove the deontic profiles and you have a mere label system.

## Institution vs. organization

North's distinction bears emphasis: **an institution is the rules; an organization is the players**.
A company (organization) operates within contract law, property law, and employment law (institutions).
A scientific community (organization) operates within the norms of peer review, citation, and epistemic standards (institutions).
The FARS is an institution — it defines rules, roles, and deontic powers.
A specific locale operating within the FARS is an organization — a group pursuing a goal within the institutional frame.

This distinction prevents a common error: conflating the persistence of an institution with the persistence of a particular group.
The institution persists when the rule-system persists.
The organization dissolves when its members disperse.

## Relation to vessel

A [Vessel](../../../../../philosophy-services-section/content/text/glossary/terms/vessel.md) is an institution in the Searlean sense: its constitutive rules assign the status "captain" to an agent (giving that agent the deontic power to issue orders the crew is obligated to follow), assign "crew" status to other agents (giving them duties of obedience and privileges of protection), and define the charter as the constitutive document.
The vessel's registry is the persistence mechanism of the institutional identity — it maintains the collective recognition even through complete crew replacement.

## Relation to normative system

A [NormativeSystem](normative-system.md) is the computationally precise formalization of an institution.
Where the institution is defined by constitutive rules and collective acceptance, a normative system is defined by a formal tuple ⟨Ag, R, Sc, Π, Δ⟩ with explicit roles, scenes, and deontic constraints.
Every institution can be approximated as a normative system; not every normative system captures the reconstitutive downward causation that Hodgson identifies in mature institutions.

## Relation to this system

The FARS is an institution.
Its `spec/` directory is the system of constitutive rules: "an entity with `closure-kind: process` counts as a deterministic composition in context C (a FARS locale)".
Its `AGENTS.md` files are the status-function declarations that install agents as officers — the collective act by which the abstract deontic profile is bound to a concrete agent.
The nucleus evaluation pipeline — the passage from raw proposition to σ-stable to Δ-stable to H* — is the mechanism by which proposed relations ("X counts as Y") are evaluated for institutional acceptance: a relation enters H* when it has passed through both nuclei, meaning both the meaning-closure and the transfer-closure of the institution have recognized it.

## Institution vs. enterprise vs. substrate

| Concept | What it is | Persists by | Unity |
|---|---|---|---|
| [Substrate](../../../../../natural-science-services-section/services/biological-science-services-section/services/mycology-services-section/content/text/glossary/terms/substrate.md) | Medium + enabling conditions | Physical/computational structure | Enabling conditions $\mathcal{E}(S)$ |
| **Institution** | Constitutive rule-system | Collective recognition | CR + Rec |
| [Enterprise](../../../../services/economics-and-business-science-services-section/services/business-science-services-section/content/text/glossary/terms/enterprise.md) | Aim-generative cooperative activity | Hard core + generative mechanism | Hard core $C$ |
| [Company](../../../../services/economics-and-business-science-services-section/services/business-science-services-section/content/text/glossary/terms/company.md) | Institutionally constituted enterprise | Standing $\ell$ + charter $K$ | Charter + standing |

MacIntyre's distinction: enterprises (practices) are *carried* by institutions but are not identical to them.
Institutions are concerned with maintaining their own structure and external goods; enterprises are concerned with pursuing internal goods.
An institution can persist after its enterprise has degenerated (a university can persist as a bureaucratic institution after genuine scholarship has been replaced by credential-production).
An enterprise cannot persist without at least a minimal institutional form (some set of constitutive rules and collective recognition).

## Beck-Chevalley base-change: operating within vs. operating on

**Source:** [Beck-Chevalley Tower](../math/relational-universe-beck-chevalley-tower.md).

The Beck-Chevalley conditions control whether base-change geometric morphisms commute with the institution's nucleus operations.
They distinguish the two fundamental institutional acts:

**Operating within the institution** (morphisms inside $R = \mathbf{Sh}(T, J)$) preserves the Grothendieck topology $J$: the constitutive rules remain fixed.
Agents and outputs move through the institution's fiber, but the institution's recognition mechanism — its topology — does not change.
This is the day-to-day institutional operation.

**Operating on the institution** (geometric morphisms $f : R \to R'$ between toposes with different topologies $J \neq J'$) changes the constitutive rules themselves: a new topology $J'$ is installed, altering what counts as a covering sieve, and therefore what the institution recognizes as valid.
Constitutional amendments, fundamental charter revisions, and jurisdictional boundary changes are all operations-on-the-institution.
They are not moves within the game but changes to the rules of the game (North's distinction).

**σ-BC at every finite level.** The saturation Beck-Chevalley condition holds at every finite depth level $R_n$: for any depth-inclusion $f_n : R_n \to R_{n+1}$, $$f_n^* \circ \sigma_{n+1} \;\cong\; \sigma_n \circ f_n^*.$$ Operationally: backward-stability of constitutive rules is always preserved across scope expansions.
A rule that has been collectively recognized at depth $n+1$ is also recognized at depth $n$ — the institution's past recognition is coherent.

**Δ-BC fails at frontier, holds in colimit.** The transfer Beck-Chevalley condition fails at frontier histories (histories at maximum depth in $R_n$): these are institutional positions at the edge of the current scope, whose forward extensions have not yet been committed at depth $n$.
The $\Delta$-defect is concentrated exactly on these frontier positions.
But by defect mobility — every frontier history at depth $n$ becomes an interior history at depth $n+1$ — the BC failure is resolved one level later, and both conditions hold in the full relational universe $R = \mathbf{Sh}(T,J)$.

**Institutional consequence.** An institution operating at finite scope always has a Δ-BC gap at its institutional frontier: new agents and entities at the edge of the institution's reach have not yet had their forward commitments assessed by the institution's transfer nucleus.
This is the formal content of "the law cannot cover every case at the moment it is enacted."
The gap closes as the institution's scope expands, and both BC conditions hold in the institution's colimit — the idealized full scope.

**Proposition (Constitutional amendment = change of topology).** A constitutional amendment that changes which acts count as valid institutional moves is a geometric morphism $f : R \to R'$ between toposes with different topologies.
If the amendment is conservative (every rule recognized in $R$ is also recognized in $R'$: $J \leq J'$), then $f$ is an open geometric morphism and the old institution is a sub-institution of the new.
If the amendment is non-conservative (some previously recognized rules are revoked), $f$ changes the sheaf condition and the transfer nucleus may not commute with restriction to the old scope.

*Source.* σ-BC and Δ-BC conditions from [Beck-Chevalley Tower](../math/relational-universe-beck-chevalley-tower.md) §Summary, §Proposition — Support of the Δ-Defect. $\square$

## Automorphic directed comonad: mature institutions as fixed-point generators

**Sources:** [Automorphic Directed Comonad Self-Generation](../math/relational-universe-automorphic-directed-comonad-self-generation.md), [Automorphic Directed Comonad History Separation](../math/relational-universe-automorphic-directed-comonad-history-separation.md).

A **mature institution** is one that has reached the automorphic directed comonad level: its constitutional fiber atom $H^\mathrm{hull}$ is a fixed point of the automorphic directed comonad $G_\Sigma$: $$G_\Sigma(H^\mathrm{hull}) \;\cong\; H^\mathrm{hull}.$$

The fixed-point condition means: applying the institution's substitution symmetry $\Sigma$ to its constitutional fiber returns an isomorphic fiber.
The institution's core constitutional structure is invariant under its own pattern-generating dynamics.
No new constitutional atoms appear under iteration of $G_\Sigma$ — the institution generates itself from a single isomorphism class of constitutional fiber.

**Contrast with immature institutions.** At the ground level, $R = U_G(R)$ holds but the generating fiber atom $H$ is not individually stable: applying $G_s$ to $H$ gives $G_s(H)(t) = H(s \star t) \neq H(t)$ in general.
A new institution operates with a generating fiber that shifts under each step — its constitutional interpretation evolves with each new act or precedent.
A mature institution has stabilized: $G_\Sigma(H^\mathrm{hull}) \cong H^\mathrm{hull}$ — constitutional interpretation is invariant under the institution's own pattern of operation.
Precedents no longer shift the fundamental fiber.

**History separation as theorem.** At the automorphic directed comonad level, history separation — the condition that no two distinct institutional positions are constitutionally indistinguishable — holds as a theorem rather than an axiom.
The proof: the aperiodicity of the quasicrystal $Q^\mathcal{H}$ means that for any non-identity automorphism $\alpha_\pi$ of the position lattice, $\alpha_\pi^* H^{\mathrm{hull}*} \not\cong H^{\mathrm{hull}*}$ — the permuted assignment of fibers to positions is not isomorphic to the original.
Every position in the mature institution has a unique constitutional signature.
No two offices are interchangeable without remainder.

*Operationally*: in an immature institution, positions with similar constitutional profiles might be swapped without obvious consequence — the institution cannot distinguish them by their fiber algebras.
In a mature institution, the aperiodic quasicrystal structure guarantees that every position is constitutionally unique; there are no genuinely equivalent offices.

*Source.* Self-generation: [Automorphic Directed Comonad Self-Generation](../math/relational-universe-automorphic-directed-comonad-self-generation.md) §The Self-Generation Theorem, §The Automorphism Upgrade.
History separation: [Automorphic Directed Comonad History Separation](../math/relational-universe-automorphic-directed-comonad-history-separation.md) §Theorem for $d \geq 1$. $\square$

## Open questions

- **Reconstitutive downward causation requires agent-indexed fiber extension.** Hodgson's claim is that institutions reshape agent dispositions over time — not just institutional facts but the agents' own operative logic.
  The current framework has one nuclear pair $(\sigma_t, \Delta_t)$ per institutional history $t$; this is the institution's nuclear pair, not any individual agent's.
  Formalizing Hodgson's claim requires agent-indexed fiber algebras $H_p(t)$ for each agent $p$ at each history $t$, with a convergence condition: $\sigma_p(t) \to \sigma_t$ and $\Delta_p(t) \to \Delta_t$ as $p$'s participation in the institution accumulates.
  Whether such agent-indexed nuclear pairs are compatible with the sheaf axioms — whether they can be sheaves over the same site $(T, J)$ — and whether their convergence to the institutional nuclear pair is definable within the relational universe framework or requires a separate modeling layer, is open.
  What IS currently formal: the nucleus $\sigma_t$ is the institution's accumulated-recognition operator, and $\Delta_t$ is the institution's forward-commitment operator.
  These shape what enters $H^*_t$ but do not model the feedback from $H^*_t$ back onto the agents' own $\sigma_p, \Delta_p$.

- **Institutional maturity convergence: finite or transfinite.** The automorphic directed comonad section establishes that a mature institution satisfies $G_\Sigma(H^\mathrm{hull}) \cong H^\mathrm{hull}$.
  Whether every institution reaches this fixed point at a finite tower level — after a bounded number of $G_\Sigma$ iterations — or whether some institutions require transfinite iteration (a colimit over an ordinal-indexed orbit) to stabilize, is open.
  The extremally slow growth theorem constrains the growth rate: the nuclear quartet grows no slower than the RelationalHistoryFiberNuclearQuartetExtremallySlowGrowthSequence, so the hull exists.
  But the theorem says nothing about how many steps are needed to reach it.
  Whether the hull is reached in finitely many applications of $G_\Sigma$ for all institutions, or whether some sites $(T, J)$ with particularly complex commutation relations require infinitely many steps before stabilizing, is unresolved.

- **Institutional topology characterization: which covering conditions are institutional.** The translation identifies institution with Grothendieck topology $J$ on $(T, J)$.
  In the relational universe the RelationalHistorySiteCommutationTopologyGrothendieckCoverageJ is one specific topology with a definite institutional interpretation.
  The open question is whether every Grothendieck topology on a history site $(T, \star, I)$ (for any commutation relation $I$) corresponds to some institution — whether every coverage condition admits an interpretation as "these operations collectively count as witnessing $t$" — or whether only certain topologies are institutionally interpretable.
  If some topologies are not institutional (e.g., because no set of constitutive rules generates them, or because the collective recognition predicate would have to be inconsistent), then the translation is not an isomorphism of concepts but only a partial embedding: institutions form a proper subclass of topologies on history sites.

---

## Supplementary formulation

```yaml
---
name: "Institution"
description: "An Institution is a quintuple (Pos, D, CR, Rec, BG) — a position set, a deontic profile assignment, a constitutive rule set of the form 'X counts as Y in context C', a collective recognition predicate, and background conditions. The defining structure: a rule-system that creates and maintains institutional facts by collective acceptance, persisting independently of any particular set of participants. Three traditions: Searle (constitutive rules and status-functions), North (rules of the game vs. organizations as players), Hodgson (institutions reshape agent dispositions over time)."
date-created: 2026-03-19
date-modified: 2026-04-28
---
```

## What this is

An **Institution** is a system of constitutive rules of the form *X counts as Y in context C* that brings institutional facts into existence by collective acceptance.
The mechanism is the **Status Function Declaration**: a speech act (or equivalent collective act) that installs a status-function — a deontic power, right, obligation, or permission — on an entity or agent relative to the institution.
The institution is not reducible to its members; it consists of the generative rule-system that defines what positions exist and what it means to occupy them.

## Formal tuple

An **Institution** is a quintuple $I = (\text{Pos}, D, \text{CR}, \text{Rec}, \text{BG})$:

$$I = (\text{Pos},\; D : \text{Pos} \to \text{HPos},\; \text{CR},\; \text{Rec},\; \text{BG})$$

where: - $\text{Pos}$ is the set of **positions** (named offices; see [Office](../../../../../services/economics-and-business-science-services-section/services/business-science-services-section/content/text/glossary/terms/office.md)) - $D : \text{Pos} \to \text{HohfeldianProfile}$ assigns each position its deontic profile — the powers, duties, privileges, and immunities of any occupant - $\text{CR} \subseteq \{(X, Y, C)\}$ is the **constitutive rule set** — triples of the form *X counts as Y in context C* that generate institutional facts from brute facts - $\text{Rec}$ is the **collective recognition** predicate — the ongoing acceptance by participants that keeps the institutional facts operative; without $\text{Rec}$, CR is a dead letter - $\text{BG}$ is the **background condition** — the brute-fact substrate (physical, computational, material) within which the institution operates

An institution is **operative** at history $t$ if and only if: $\text{CR}$ is consistent, $\text{Rec}_t$ holds for the relevant participant population, and $\text{BG}_t$ is satisfied.

**Four invariants.** $I$ is an institution iff it satisfies:

1. **Constitutive rule sufficiency**: $\text{CR}$ must be rich enough to generate all the institutional facts required for $I$ to be $I$ — it must specify what positions exist, what actions count as exercises of which powers, and what conditions bring new institutional facts into existence.
  Regulative rules (rules that regulate pre-existing behavior) are not sufficient; the institution's rules must *constitute* the facts they govern.
  Searle's criterion: the rule-form *X counts as Y in context C* must appear; *do not do X* is regulative, not constitutive.

2. **Collective recognition persistence**: $\text{Rec}$ must hold continuously over the relevant participant population for $I$ to remain operative.
  The institution is not a physical object; it exists only insofar as it is collectively recognized.
  A monetary system ceases to function when participants stop accepting money as money.
  A legal system ceases to function when officials stop treating law as binding. $\text{Rec}$ is not a one-time act but an ongoing condition — the institution's existence is constitutively dependent on sustained collective acceptance.

3. **Position occupancy independence**: $I$ persists through complete turnover of position-occupants.
  The positions $\text{Pos}$ and their deontic profiles $D$ exist independently of any particular person filling them.
  This is the formal content of institutional persistence: the institution is not the set of current officeholders but the rule-system that defines what offices exist and what occupancy entails.
  North's formulation: the institution is the rules of the game; the players (occupants) are variable.

4. **Background condition satisfaction**: $\text{BG}_t$ must be satisfied — the brute-fact substrate must support the institution's operation.
  An institution requires a medium: physical, computational, or social.
  A property rights institution requires a physical world with objects that can be possessed and transferred.
  A computational institution requires a file-system or database substrate.
  Changing the medium (from paper deeds to blockchain) may preserve the institution if the enabling conditions are the same; but removing all media destroys the institution regardless of how well-specified its constitutive rules are.

The three traditions (Searle, North, Hodgson) each emphasize a different component: Searle emphasizes CR; North emphasizes Pos and D; Hodgson emphasizes the feedback from $\text{Rec}$ back onto $\text{BG}$ over time (reconstitutive downward causation — not captured in the static tuple).

## Settlement reading

In framework terms, an institution corresponds to a **covering structure** on histories: what families of acts and witnessings count as collectively satisfying the institution's constitutive rules.
Each constitutive rule is a structural condition: the rule's [predication cell](../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predication-cell.md) must reach affirming [settlement](settlement.md) for the rule to be operative.

For each rule $(X, Y, C) \in \text{CR}$, there is a *recognition* predicate (the rule has been accepted by the relevant community) and an *execution* predicate (the rule's institutional facts carry forward into continuations).
The institution is operative at $t$ iff every constitutive rule's predicates have reached affirming joint settlement at $t$:

| Joint settlement of $(p_{\mathrm{recognition}}, p_{\mathrm{execution}})$ for a rule | Institutional state |
|---|---|
| Both affirmingly settled | Rule operative: recognized and stable |
| Recognition settled, execution not | Collectively recognized but institutionally fragile — the community accepts the rule but the structure does not maintain it forward |
| Execution settled, recognition not | Institutionally required but not yet recognized — the rule is structurally in force but collective acceptance has not settled it |
| Neither settled | Dead letter — proposed in $\text{CR}$ but lacking both recognition and institutional backing |

The three informal conditions — CR consistent, $\text{Rec}_t$ holds, $\text{BG}_t$ satisfied — collapse into the single condition that every constitutive rule's predicates have reached affirming joint settlement.

**Persistence.** A rule operative at $t'$ remains operative at every history reachable backward from $t'$ — operative rules are globally coherent across the institution's history.
This is the formal content of position-occupancy independence: the institutional structure is a global feature of the institution's history, not merely a local fact at one moment.

## Three theoretical traditions

**Searle (1995, 2010)**: constitutive rules and status-functions.
A constitutive rule does not merely regulate behavior that could occur without it — it creates the behavior it regulates. *Touchdowns score six points* does not regulate an independently existing event; it constitutes the event by defining it.
An institution is a system of such rules.
Status-functions are the deontic powers assigned by these rules: the right to vote, the duty to obey, the power to authorize.
These exist only within the institutional context $C$.

**North (1990)**: institutions as **constraints** (rules of the game) distinct from **organizations** (the players).
The institution is the rule-set that structures interaction; an organization is a group of agents pursuing goals within that rule-set.
The distinction is critical: a legal system is an institution (it defines the rules); a specific agent serving in a court is a player in the game the institution defines.

**Hodgson (2006)**: institutions as enduring social structures with **reconstitutive downward causation** — they not only constrain agents but reshape agents' dispositions and identities over time.
An agent who serves long within an institution internalizes its constitutive rules; this is not captured by Searle's synchronic account or North's purely constraint-based view.

## Structural components

Every institution has five structural components:

| Component | What it is |
|---|---|
| Positions | The offices — named normative slots that agents can occupy (see [Officer](../../../../../philosophy-services-section/services/relationality-services-section/content/text/documents/articles/notes/2026/03/18/2026-03-18-officer.md)) |
| Deontic profiles | The Hohfeldian rights, duties, powers, and immunities associated with each position |
| Constitutive rules | The "X counts as Y in C" rules generating the institutional facts |
| Collective recognition | The sustaining act — the ongoing acceptance that keeps the institution operative |
| Background conditions | The brute-fact substrate within which the institution operates |

The institution is not any one of these alone.
Remove the constitutive rules and you have only a social habit.
Remove collective recognition and you have a dead letter.
Remove the deontic profiles and you have a mere label system.

## Institution vs. organization

North's distinction bears emphasis: **an institution is the rules; an organization is the players**.
A company (organization) operates within contract law, property law, and employment law (institutions).
A scientific community (organization) operates within the norms of peer review, citation, and epistemic standards (institutions).
A legal system is an institution — it defines rules, roles, and deontic powers.
A specific court operating within that legal system is an organization — a group pursuing a goal within the institutional frame.

This distinction prevents a common error: conflating the persistence of an institution with the persistence of a particular group.
The institution persists when the rule-system persists.
The organization dissolves when its members disperse.

## Relation to vessel

A [Vessel](../../../../../philosophy-services-section/content/text/glossary/terms/vessel.md) is an institution in the Searlean sense: its constitutive rules assign the status *captain* to an agent (giving that agent the deontic power to issue orders the crew is obligated to follow), assign *crew* status to other agents (giving them duties of obedience and privileges of protection), and define the charter as the constitutive document.
The vessel's registry is the persistence mechanism of the institutional identity — it maintains the collective recognition even through complete crew replacement.

## Relation to normative system

A [NormativeSystem](./normative-system.md) is the computationally precise formalization of an institution.
Where the institution is defined by constitutive rules and collective acceptance, a normative system is defined by a formal tuple with explicit roles, scenes, and deontic constraints.
Every institution can be approximated as a normative system; not every normative system captures the reconstitutive downward causation that Hodgson identifies in mature institutions.

## Institution vs. enterprise vs. substrate

| Concept | What it is | Persists by | Unity |
|---|---|---|---|
| [Substrate](../../../../../natural-science-services-section/services/biological-science-services-section/services/mycology-services-section/content/text/glossary/terms/substrate.md) | Medium + enabling conditions | Physical/computational structure | Enabling conditions |
| **Institution** | Constitutive rule-system | Collective recognition | CR + Rec |
| [Enterprise](../../../../services/economics-and-business-science-services-section/services/business-science-services-section/content/text/glossary/terms/enterprise.md) | Aim-generative cooperative activity | Hard core + generative mechanism | Hard core |
| [Company](../../../../services/economics-and-business-science-services-section/services/business-science-services-section/content/text/glossary/terms/company.md) | Institutionally constituted enterprise | Standing + charter | Charter + standing |

MacIntyre's distinction: enterprises (practices) are *carried* by institutions but are not identical to them.
Institutions are concerned with maintaining their own structure and external goods; enterprises are concerned with pursuing internal goods.
An institution can persist after its enterprise has degenerated (a university can persist as a bureaucratic institution after genuine scholarship has been replaced by credential-production).
An enterprise cannot persist without at least a minimal institutional form (some set of constitutive rules and collective recognition).

## Operating within vs. operating on

A foundational distinction in institutional analysis is between two kinds of institutional acts:

**Operating within the institution** — acts that take the constitutive rules as fixed.
Agents and outputs move through the institution's structure, but the institution's recognition mechanism — its rules — does not change.
This is the day-to-day institutional operation: holding office, exercising power, fulfilling duty, contracting under existing law.

**Operating on the institution** — acts that change the constitutive rules themselves.
Constitutional amendments, fundamental charter revisions, jurisdictional boundary changes are all operations-on-the-institution.
They are not moves within the game but changes to the rules of the game (North's distinction).

The framework formalizes this distinction by distinguishing the institution's operations on its current constitutive rules (within) from operations that revise the constitutive rules themselves (on).
The latter requires a higher-order authorization than the former — typically a constitutional or charter-level power that not all officers hold.

**Constitutional amendment.** A constitutional amendment that changes which acts count as valid institutional moves is an *operation on* the institution.
If the amendment is conservative — every rule recognized in the old institution is also recognized in the new — the old institution is a sub-institution of the new.
If the amendment is non-conservative, some previously recognized rules are revoked, and institutional facts whose support was in the revoked rules may need to be re-evaluated under the new rules.

## Mature institutions

A **mature institution** is one whose constitutional structure has stabilized: its constitutive rules are no longer evolving rapidly, its recognition has stabilized across generations of participants, and its operations consistently produce settled institutional facts.
In framework terms: the institution's settlement structure has reached a fixed point under the institution's own pattern of operation.

By contrast, an **immature institution** has not yet stabilized.
Its constitutive rules are still evolving as participants negotiate their interpretation; its recognition is incomplete or contested; its operations sometimes produce contested or fragile institutional facts.
New institutions characteristically pass through such phases of immaturity before stabilizing.

A useful diagnostic: in a mature institution, distinct positions are constitutionally distinguishable — the institution can tell its offices apart by their structural commitments alone.
In an immature institution, positions may be partially interchangeable, with their distinct identities dependent on contingent occupancy or local convention rather than structural commitment.
Mature institutions exhibit *position uniqueness*; immature institutions tolerate *position interchangeability*.

## Open questions

- **Reconstitutive downward causation requires agent-indexed structure.** Hodgson's claim is that institutions reshape agent dispositions over time — not just institutional facts but the agents' own operative logic.
  The current framework has one set of predicates per institutional position; this is the institution's structure, not any individual agent's.
  Formalizing Hodgson's claim requires agent-indexed structures for each agent, with a convergence condition: the agent-indexed structures gradually align with the institution's general structure as the agent's participation accumulates.
  Whether such agent-indexed structures are coherent within the framework's covering structure, and whether their convergence is definable within the framework or requires a separate modeling layer, is open.
  What is currently formal: the institution's predicates shape what counts as institutional fact; what is not yet formal: the feedback from those facts back onto the agents' own settling structures.

- **Institutional maturity convergence.** A mature institution has reached a fixed point in its constitutional structure.
  Whether every institution reaches this fixed point in finitely many revisions, or whether some institutions require ongoing revision indefinitely, is open.
  The framework's commitment to settling monotonicity (evidence accumulates) suggests convergence is possible in principle; whether real institutions actually converge or remain in perpetual revision is an empirical question the framework cannot decide on its own.

- **Institutional covering structure: which covering conditions are institutional?** Not every formal covering structure on a history corresponds to an institution.
  Whether the framework's general covering machinery captures all and only the structures that are institutionally interpretable, or whether institutions are a proper subclass of formal covering structures with additional conditions (consistency, recognition-coherence, etc.), is an open question.

- **The boundary between institution and convention.** Some normative systems are institutional (legal systems, corporate governance) while others are conventional (linguistic conventions, social customs).
  The framework treats both within the predication structure, but the boundary — what makes one a constitutive institution and the other a regulative convention — is not yet sharply drawn formally.
  The Searlean criterion (constitutive vs. regulative) gives one answer; whether the framework can derive the distinction from settlement-structural features alone is open.

---

## Supplementary formulation

```yaml
---
name: "Institution"
description: "An Institution is a quintuple (Pos, D, CR, Rec, BG) — a position set, a deontic profile assignment, a constitutive rule set of the form 'X counts as Y in context C', a collective recognition predicate, and background conditions. The defining structure: a rule-system that creates and maintains institutional facts by collective acceptance, persisting independently of any particular set of participants. Three traditions: Searle (constitutive rules and status-functions), North (rules of the game vs. organizations as players), Hodgson (institutions reshape agent dispositions over time)."
date-created: 2026-03-19
date-modified: 2026-04-28
---
```

## What this is

An **Institution** is a system of constitutive rules of the form *X counts as Y in context C* that brings institutional facts into existence by collective acceptance.
The mechanism is the **Status Function Declaration**: a speech act (or equivalent collective act) that installs a status-function — a deontic power, right, obligation, or permission — on an entity or agent relative to the institution.
The institution is not reducible to its members; it consists of the generative rule-system that defines what positions exist and what it means to occupy them.

## Formal tuple

An **Institution** is a quintuple $I = (\text{Pos}, D, \text{CR}, \text{Rec}, \text{BG})$:

$$I = (\text{Pos},\; D : \text{Pos} \to \text{HPos},\; \text{CR},\; \text{Rec},\; \text{BG})$$

where: - $\text{Pos}$ is the set of **positions** (named offices; see [Office](../../../../../services/economics-and-business-science-services-section/services/business-science-services-section/content/text/glossary/terms/office.md)) - $D : \text{Pos} \to \text{HohfeldianProfile}$ assigns each position its deontic profile — the powers, duties, privileges, and immunities of any occupant - $\text{CR} \subseteq \{(X, Y, C)\}$ is the **constitutive rule set** — triples of the form *X counts as Y in context C* that generate institutional facts from brute facts - $\text{Rec}$ is the **collective recognition** predicate — the ongoing acceptance by participants that keeps the institutional facts operative; without $\text{Rec}$, CR is a dead letter - $\text{BG}$ is the **background condition** — the brute-fact substrate (physical, computational, material) within which the institution operates

An institution is **operative** at history $t$ if and only if: $\text{CR}$ is consistent, $\text{Rec}_t$ holds for the relevant participant population, and $\text{BG}_t$ is satisfied.

**Four invariants.** $I$ is an institution iff it satisfies:

1. **Constitutive rule sufficiency**: $\text{CR}$ must be rich enough to generate all the institutional facts required for $I$ to be $I$ — it must specify what positions exist, what actions count as exercises of which powers, and what conditions bring new institutional facts into existence.
  Regulative rules (rules that regulate pre-existing behavior) are not sufficient; the institution's rules must *constitute* the facts they govern.
  Searle's criterion: the rule-form *X counts as Y in context C* must appear; *do not do X* is regulative, not constitutive.

2. **Collective recognition persistence**: $\text{Rec}$ must hold continuously over the relevant participant population for $I$ to remain operative.
  The institution is not a physical object; it exists only insofar as it is collectively recognized.
  A monetary system ceases to function when participants stop accepting money as money.
  A legal system ceases to function when officials stop treating law as binding. $\text{Rec}$ is not a one-time act but an ongoing condition — the institution's existence is constitutively dependent on sustained collective acceptance.

3. **Position occupancy independence**: $I$ persists through complete turnover of position-occupants.
  The positions $\text{Pos}$ and their deontic profiles $D$ exist independently of any particular person filling them.
  This is the formal content of institutional persistence: the institution is not the set of current officeholders but the rule-system that defines what offices exist and what occupancy entails.
  North's formulation: the institution is the rules of the game; the players (occupants) are variable.

4. **Background condition satisfaction**: $\text{BG}_t$ must be satisfied — the brute-fact substrate must support the institution's operation.
  An institution requires a medium: physical, computational, or social.
  A property rights institution requires a physical world with objects that can be possessed and transferred.
  A computational institution requires a file-system or database substrate.
  Changing the medium (from paper deeds to blockchain) may preserve the institution if the enabling conditions are the same; but removing all media destroys the institution regardless of how well-specified its constitutive rules are.

The three traditions (Searle, North, Hodgson) each emphasize a different component: Searle emphasizes CR; North emphasizes Pos and D; Hodgson emphasizes the feedback from $\text{Rec}$ back onto $\text{BG}$ over time (reconstitutive downward causation — not captured in the static tuple).

## Settlement reading

In framework terms, an institution corresponds to a **covering structure** on histories: what families of acts and witnessings count as collectively satisfying the institution's constitutive rules.
Each constitutive rule is a structural condition: the rule's [predication cell](../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predication-cell.md) must reach affirming [settlement](settlement.md) for the rule to be operative.

For each rule $(X, Y, C) \in \text{CR}$, there is a *recognition* predicate (the rule has been accepted by the relevant community) and an *execution* predicate (the rule's institutional facts carry forward into continuations).
The institution is operative at $t$ iff every constitutive rule's predicates have reached affirming joint settlement at $t$:

| Joint settlement of $(p_{\mathrm{recognition}}, p_{\mathrm{execution}})$ for a rule | Institutional state |
|---|---|
| Both affirmingly settled | Rule operative: recognized and stable |
| Recognition settled, execution not | Collectively recognized but institutionally fragile — the community accepts the rule but the structure does not maintain it forward |
| Execution settled, recognition not | Institutionally required but not yet recognized — the rule is structurally in force but collective acceptance has not settled it |
| Neither settled | Dead letter — proposed in $\text{CR}$ but lacking both recognition and institutional backing |

The three informal conditions — CR consistent, $\text{Rec}_t$ holds, $\text{BG}_t$ satisfied — collapse into the single condition that every constitutive rule's predicates have reached affirming joint settlement.

**Persistence.** A rule operative at $t'$ remains operative at every history reachable backward from $t'$ — operative rules are globally coherent across the institution's history.
This is the formal content of position-occupancy independence: the institutional structure is a global feature of the institution's history, not merely a local fact at one moment.

## Three theoretical traditions

**Searle (1995, 2010)**: constitutive rules and status-functions.
A constitutive rule does not merely regulate behavior that could occur without it — it creates the behavior it regulates. *Touchdowns score six points* does not regulate an independently existing event; it constitutes the event by defining it.
An institution is a system of such rules.
Status-functions are the deontic powers assigned by these rules: the right to vote, the duty to obey, the power to authorize.
These exist only within the institutional context $C$.

**North (1990)**: institutions as **constraints** (rules of the game) distinct from **organizations** (the players).
The institution is the rule-set that structures interaction; an organization is a group of agents pursuing goals within that rule-set.
The distinction is critical: a legal system is an institution (it defines the rules); a specific agent serving in a court is a player in the game the institution defines.

**Hodgson (2006)**: institutions as enduring social structures with **reconstitutive downward causation** — they not only constrain agents but reshape agents' dispositions and identities over time.
An agent who serves long within an institution internalizes its constitutive rules; this is not captured by Searle's synchronic account or North's purely constraint-based view.

## Structural components

Every institution has five structural components:

| Component | What it is |
|---|---|
| Positions | The offices — named normative slots that agents can occupy (see [Officer](../../../../../philosophy-services-section/services/relationality-services-section/content/text/documents/articles/notes/2026/03/18/2026-03-18-officer.md)) |
| Deontic profiles | The Hohfeldian rights, duties, powers, and immunities associated with each position |
| Constitutive rules | The "X counts as Y in C" rules generating the institutional facts |
| Collective recognition | The sustaining act — the ongoing acceptance that keeps the institution operative |
| Background conditions | The brute-fact substrate within which the institution operates |

The institution is not any one of these alone.
Remove the constitutive rules and you have only a social habit.
Remove collective recognition and you have a dead letter.
Remove the deontic profiles and you have a mere label system.

## Institution vs. organization

North's distinction bears emphasis: **an institution is the rules; an organization is the players**.
A company (organization) operates within contract law, property law, and employment law (institutions).
A scientific community (organization) operates within the norms of peer review, citation, and epistemic standards (institutions).
A legal system is an institution — it defines rules, roles, and deontic powers.
A specific court operating within that legal system is an organization — a group pursuing a goal within the institutional frame.

This distinction prevents a common error: conflating the persistence of an institution with the persistence of a particular group.
The institution persists when the rule-system persists.
The organization dissolves when its members disperse.

## Relation to vessel

A [Vessel](../../../../../philosophy-services-section/content/text/glossary/terms/vessel.md) is an institution in the Searlean sense: its constitutive rules assign the status *captain* to an agent (giving that agent the deontic power to issue orders the crew is obligated to follow), assign *crew* status to other agents (giving them duties of obedience and privileges of protection), and define the charter as the constitutive document.
The vessel's registry is the persistence mechanism of the institutional identity — it maintains the collective recognition even through complete crew replacement.

## Relation to normative system

A [NormativeSystem](normative-system.md) is the computationally precise formalization of an institution.
Where the institution is defined by constitutive rules and collective acceptance, a normative system is defined by a formal tuple with explicit roles, scenes, and deontic constraints.
Every institution can be approximated as a normative system; not every normative system captures the reconstitutive downward causation that Hodgson identifies in mature institutions.

## Institution vs. enterprise vs. substrate

| Concept | What it is | Persists by | Unity |
|---|---|---|---|
| [Substrate](../../../../../natural-science-services-section/services/biological-science-services-section/services/mycology-services-section/content/text/glossary/terms/substrate.md) | Medium + enabling conditions | Physical/computational structure | Enabling conditions |
| **Institution** | Constitutive rule-system | Collective recognition | CR + Rec |
| [Enterprise](../../../../services/economics-and-business-science-services-section/services/business-science-services-section/content/text/glossary/terms/enterprise.md) | Aim-generative cooperative activity | Hard core + generative mechanism | Hard core |
| [Company](../../../../services/economics-and-business-science-services-section/services/business-science-services-section/content/text/glossary/terms/company.md) | Institutionally constituted enterprise | Standing + charter | Charter + standing |

MacIntyre's distinction: enterprises (practices) are *carried* by institutions but are not identical to them.
Institutions are concerned with maintaining their own structure and external goods; enterprises are concerned with pursuing internal goods.
An institution can persist after its enterprise has degenerated (a university can persist as a bureaucratic institution after genuine scholarship has been replaced by credential-production).
An enterprise cannot persist without at least a minimal institutional form (some set of constitutive rules and collective recognition).

## Operating within vs. operating on

A foundational distinction in institutional analysis is between two kinds of institutional acts:

**Operating within the institution** — acts that take the constitutive rules as fixed.
Agents and outputs move through the institution's structure, but the institution's recognition mechanism — its rules — does not change.
This is the day-to-day institutional operation: holding office, exercising power, fulfilling duty, contracting under existing law.

**Operating on the institution** — acts that change the constitutive rules themselves.
Constitutional amendments, fundamental charter revisions, jurisdictional boundary changes are all operations-on-the-institution.
They are not moves within the game but changes to the rules of the game (North's distinction).

The framework formalizes this distinction by distinguishing the institution's operations on its current constitutive rules (within) from operations that revise the constitutive rules themselves (on).
The latter requires a higher-order authorization than the former — typically a constitutional or charter-level power that not all officers hold.

**Constitutional amendment.** A constitutional amendment that changes which acts count as valid institutional moves is an *operation on* the institution.
If the amendment is conservative — every rule recognized in the old institution is also recognized in the new — the old institution is a sub-institution of the new.
If the amendment is non-conservative, some previously recognized rules are revoked, and institutional facts whose support was in the revoked rules may need to be re-evaluated under the new rules.

## Mature institutions

A **mature institution** is one whose constitutional structure has stabilized: its constitutive rules are no longer evolving rapidly, its recognition has stabilized across generations of participants, and its operations consistently produce settled institutional facts.
In framework terms: the institution's settlement structure has reached a fixed point under the institution's own pattern of operation.

By contrast, an **immature institution** has not yet stabilized.
Its constitutive rules are still evolving as participants negotiate their interpretation; its recognition is incomplete or contested; its operations sometimes produce contested or fragile institutional facts.
New institutions characteristically pass through such phases of immaturity before stabilizing.

A useful diagnostic: in a mature institution, distinct positions are constitutionally distinguishable — the institution can tell its offices apart by their structural commitments alone.
In an immature institution, positions may be partially interchangeable, with their distinct identities dependent on contingent occupancy or local convention rather than structural commitment.
Mature institutions exhibit *position uniqueness*; immature institutions tolerate *position interchangeability*.

## Open questions

- **Reconstitutive downward causation requires agent-indexed structure.** Hodgson's claim is that institutions reshape agent dispositions over time — not just institutional facts but the agents' own operative logic.
  The current framework has one set of predicates per institutional position; this is the institution's structure, not any individual agent's.
  Formalizing Hodgson's claim requires agent-indexed structures for each agent, with a convergence condition: the agent-indexed structures gradually align with the institution's general structure as the agent's participation accumulates.
  Whether such agent-indexed structures are coherent within the framework's covering structure, and whether their convergence is definable within the framework or requires a separate modeling layer, is open.
  What is currently formal: the institution's predicates shape what counts as institutional fact; what is not yet formal: the feedback from those facts back onto the agents' own settling structures.

- **Institutional maturity convergence.** A mature institution has reached a fixed point in its constitutional structure.
  Whether every institution reaches this fixed point in finitely many revisions, or whether some institutions require ongoing revision indefinitely, is open.
  The framework's commitment to settling monotonicity (evidence accumulates) suggests convergence is possible in principle; whether real institutions actually converge or remain in perpetual revision is an empirical question the framework cannot decide on its own.

- **Institutional covering structure: which covering conditions are institutional?** Not every formal covering structure on a history corresponds to an institution.
  Whether the framework's general covering machinery captures all and only the structures that are institutionally interpretable, or whether institutions are a proper subclass of formal covering structures with additional conditions (consistency, recognition-coherence, etc.), is an open question.

- **The boundary between institution and convention.** Some normative systems are institutional (legal systems, corporate governance) while others are conventional (linguistic conventions, social customs).
  The framework treats both within the predication structure, but the boundary — what makes one a constitutive institution and the other a regulative convention — is not yet sharply drawn formally.
  The Searlean criterion (constitutive vs. regulative) gives one answer; whether the framework can derive the distinction from settlement-structural features alone is open.

---

## Supplementary formulation

```yaml
---
name: "institution"
date-created: 2026-03-06
date-updated: 2026-03-06
keywords:
  - SocialTheory
  - Governance
---
```

An institution is a stable, organized pattern of [practices](./practice.md) that structures how people act in a domain.
Hospitals, schools, courts, prisons, the military, churches, and markets are institutions.
So are less visible things: marriage, medical diagnosis, academic peer review, the job interview.

What makes something an institution rather than just a habit or a preference is that it persists beyond the individuals who participate in it.
A teacher retires; the school continues.
Institutions carry rules, roles, procedures, and expectations that exist before any particular person fills them and continue after that person leaves.

Institutions don't just constrain people — they produce the categories through which people understand themselves and each other.
A hospital doesn't just treat sick people; it produces the category of "patient," the role of "doctor," and the boundary between "healthy" and "ill."
[Michel Foucault](../../general/people/michel-foucault.md) analyzed institutions as the sites where [power/knowledge](power-knowledge.md) operates — where knowledge about people is produced through the same practices that exercise power over them [@foucault1977].
The categories institutions use to describe their subjects ("delinquent," "mentally ill," "learning disabled") aren't descriptions of pre-existing types but products of the institution's own practices of observation, classification, and management.
Institutions are [contingent](../../philosophy/terms/contingency.md): each emerged from specific historical developments that a [genealogical](genealogy.md) analysis can trace.

## Related terms

- [Practice](./practice.md) — the repeatable activities that institutions organize and sustain
- [Power/knowledge](power-knowledge.md) — the mechanism through which institutions produce knowledge as they exercise power
- [Governmentality](./governmentality.md) — the rationalities that organize institutional governance of populations
- [Legibility](./legibility.md) — the state's drive to make populations readable through institutional categories
- [Normalization](normalization.md) — the process through which institutions constitute standards of normality

---

## Supplementary formulation

```yaml
---
name: "institution"
date-created: 2026-03-06
date-updated: 2026-03-06
keywords:
  - SocialTheory
  - Governance
---
```

An institution is a stable, organized pattern of [practices](./practice.md) that structures how people act in a domain. Hospitals, schools, courts, prisons, the military, churches, and markets are institutions. So are less visible things: marriage, medical diagnosis, academic peer review, the job interview.

What makes something an institution rather than just a habit or a preference is that it persists beyond the individuals who participate in it. A teacher retires; the school continues. Institutions carry rules, roles, procedures, and expectations that exist before any particular person fills them and continue after that person leaves.

Institutions don't just constrain people — they produce the categories through which people understand themselves and each other. A hospital doesn't just treat sick people; it produces the category of "patient," the role of "doctor," and the boundary between "healthy" and "ill." [Michel Foucault](../../general/people/michel-foucault.md) analyzed institutions as the sites where [power/knowledge](power-knowledge.md) operates — where knowledge about people is produced through the same practices that exercise power over them [@foucault1977]. The categories institutions use to describe their subjects ("delinquent," "mentally ill," "learning disabled") aren't descriptions of pre-existing types but products of the institution's own practices of observation, classification, and management. Institutions are [contingent](../../philosophy/terms/contingency.md): each emerged from specific historical developments that a [genealogical](genealogy.md) analysis can trace.

## Related terms

- [Practice](./practice.md) — the repeatable activities that institutions organize and sustain
- [Power/knowledge](power-knowledge.md) — the mechanism through which institutions produce knowledge as they exercise power
- [Governmentality](./governmentality.md) — the rationalities that organize institutional governance of populations
- [Legibility](./legibility.md) — the state's drive to make populations readable through institutional categories
- [Normalization](normalization.md) — the process through which institutions constitute standards of normality

---

## Supplementary formulation

```yaml
---
name: institution
description: "An institution is a stable, organized pattern of [practices](practice.md) that structures how people act in a domain. Hospitals, schools, courts, prisons, the military, churches, and markets are institutions. So are less visible things: marriage, medical diagnosis, academic peer review, the job interview."
date-created: 2026-03-06
tags:
- social-theory
- governance
---
```

An institution is a stable, organized pattern of [practices](practice.md) that structures how people act in a domain.
Hospitals, schools, courts, prisons, the military, churches, and markets are institutions.
So are less visible things: marriage, medical diagnosis, academic peer review, the job interview.

What makes something an institution rather than just a habit or a preference is that it persists beyond the individuals who participate in it.
A teacher retires; the school continues.
Institutions carry rules, roles, procedures, and expectations that exist before any particular person fills them and continue after that person leaves.

Institutions don't just constrain people — they produce the categories through which people understand themselves and each other.
A hospital doesn't just treat sick people; it produces the category of "patient," the role of "doctor," and the boundary between "healthy" and "ill."
[Michel Foucault](../../../../../references/people/michel-foucault.md) analyzed institutions as the sites where [power/knowledge](power-knowledge.md) operates — where knowledge about people is produced through the same practices that exercise power over them [@foucault1977].
The categories institutions use to describe their subjects ("delinquent," "mentally ill," "learning disabled") aren't descriptions of pre-existing types but products of the institution's own practices of observation, classification, and management.
Institutions are [contingent](../../philosophy/theories/western/theories/metaphysics/terms/contingency.md): each emerged from specific historical developments that a [genealogical](genealogy.md) analysis can trace.
