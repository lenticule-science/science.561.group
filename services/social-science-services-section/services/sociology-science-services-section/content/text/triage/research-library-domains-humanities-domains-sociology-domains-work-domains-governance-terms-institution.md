---
title: "Institution"
description: "An Institution is a quintuple (Pos, D, CR, Rec, BG) — a position set, a deontic profile assignment, a constitutive rule set of the form 'X counts as Y in context C', a collective recognition predicate, and background conditions. The defining structure: a rule-system that creates and maintains institutional facts by collective acceptance, persisting independently of any particular set of participants. Three traditions: Searle (constitutive rules and status-functions), North (rules of the game vs. organizations as players), Hodgson (institutions reshape agent dispositions over time)."
date-created: 2026-03-19
date-modified: 2026-04-28
---

## What this is

An **Institution** is a system of constitutive rules of the form *X counts as Y in context C* that brings institutional facts into existence by collective acceptance. The mechanism is the **Status Function Declaration**: a speech act (or equivalent collective act) that installs a status-function — a deontic power, right, obligation, or permission — on an entity or agent relative to the institution. The institution is not reducible to its members; it consists of the generative rule-system that defines what positions exist and what it means to occupy them.

## Formal tuple

An **Institution** is a quintuple $I = (\text{Pos}, D, \text{CR}, \text{Rec}, \text{BG})$:

$$I = (\text{Pos},\; D : \text{Pos} \to \text{HPos},\; \text{CR},\; \text{Rec},\; \text{BG})$$

where:
- $\text{Pos}$ is the set of **positions** (named offices; see [Office](../../../terms/office.md))
- $D : \text{Pos} \to \text{HohfeldianProfile}$ assigns each position its deontic profile — the powers, duties, privileges, and immunities of any occupant
- $\text{CR} \subseteq \{(X, Y, C)\}$ is the **constitutive rule set** — triples of the form *X counts as Y in context C* that generate institutional facts from brute facts
- $\text{Rec}$ is the **collective recognition** predicate — the ongoing acceptance by participants that keeps the institutional facts operative; without $\text{Rec}$, CR is a dead letter
- $\text{BG}$ is the **background condition** — the brute-fact substrate (physical, computational, material) within which the institution operates

An institution is **operative** at history $t$ if and only if: $\text{CR}$ is consistent, $\text{Rec}_t$ holds for the relevant participant population, and $\text{BG}_t$ is satisfied.

**Four invariants.** $I$ is an institution iff it satisfies:

1. **Constitutive rule sufficiency**: $\text{CR}$ must be rich enough to generate all the institutional facts required for $I$ to be $I$ — it must specify what positions exist, what actions count as exercises of which powers, and what conditions bring new institutional facts into existence. Regulative rules (rules that regulate pre-existing behavior) are not sufficient; the institution's rules must *constitute* the facts they govern. Searle's criterion: the rule-form *X counts as Y in context C* must appear; *do not do X* is regulative, not constitutive.

2. **Collective recognition persistence**: $\text{Rec}$ must hold continuously over the relevant participant population for $I$ to remain operative. The institution is not a physical object; it exists only insofar as it is collectively recognized. A monetary system ceases to function when participants stop accepting money as money. A legal system ceases to function when officials stop treating law as binding. $\text{Rec}$ is not a one-time act but an ongoing condition — the institution's existence is constitutively dependent on sustained collective acceptance.

3. **Position occupancy independence**: $I$ persists through complete turnover of position-occupants. The positions $\text{Pos}$ and their deontic profiles $D$ exist independently of any particular person filling them. This is the formal content of institutional persistence: the institution is not the set of current officeholders but the rule-system that defines what offices exist and what occupancy entails. North's formulation: the institution is the rules of the game; the players (occupants) are variable.

4. **Background condition satisfaction**: $\text{BG}_t$ must be satisfied — the brute-fact substrate must support the institution's operation. An institution requires a medium: physical, computational, or social. A property rights institution requires a physical world with objects that can be possessed and transferred. A computational institution requires a file-system or database substrate. Changing the medium (from paper deeds to blockchain) may preserve the institution if the enabling conditions are the same; but removing all media destroys the institution regardless of how well-specified its constitutive rules are.

The three traditions (Searle, North, Hodgson) each emphasize a different component: Searle emphasizes CR; North emphasizes Pos and D; Hodgson emphasizes the feedback from $\text{Rec}$ back onto $\text{BG}$ over time (reconstitutive downward causation — not captured in the static tuple).

## Settlement reading

In framework terms, an institution corresponds to a **covering structure** on histories: what families of acts and witnessings count as collectively satisfying the institution's constitutive rules. Each constitutive rule is a structural condition: the rule's [predication cell](../../../../../../math/domains/voidmath/terms/predication-cell.md) must reach affirming [settlement](../../../../../../math/domains/voidmath/terms/settlement.md) for the rule to be operative.

For each rule $(X, Y, C) \in \text{CR}$, there is a *recognition* predicate (the rule has been accepted by the relevant community) and an *execution* predicate (the rule's institutional facts carry forward into continuations). The institution is operative at $t$ iff every constitutive rule's predicates have reached affirming joint settlement at $t$:

| Joint settlement of $(p_{\mathrm{recognition}}, p_{\mathrm{execution}})$ for a rule | Institutional state |
|---|---|
| Both affirmingly settled | Rule operative: recognized and stable |
| Recognition settled, execution not | Collectively recognized but institutionally fragile — the community accepts the rule but the structure does not maintain it forward |
| Execution settled, recognition not | Institutionally required but not yet recognized — the rule is structurally in force but collective acceptance has not settled it |
| Neither settled | Dead letter — proposed in $\text{CR}$ but lacking both recognition and institutional backing |

The three informal conditions — CR consistent, $\text{Rec}_t$ holds, $\text{BG}_t$ satisfied — collapse into the single condition that every constitutive rule's predicates have reached affirming joint settlement.

**Persistence.** A rule operative at $t'$ remains operative at every history reachable backward from $t'$ — operative rules are globally coherent across the institution's history. This is the formal content of position-occupancy independence: the institutional structure is a global feature of the institution's history, not merely a local fact at one moment.

## Three theoretical traditions

**Searle (1995, 2010)**: constitutive rules and status-functions. A constitutive rule does not merely regulate behavior that could occur without it — it creates the behavior it regulates. *Touchdowns score six points* does not regulate an independently existing event; it constitutes the event by defining it. An institution is a system of such rules. Status-functions are the deontic powers assigned by these rules: the right to vote, the duty to obey, the power to authorize. These exist only within the institutional context $C$.

**North (1990)**: institutions as **constraints** (rules of the game) distinct from **organizations** (the players). The institution is the rule-set that structures interaction; an organization is a group of agents pursuing goals within that rule-set. The distinction is critical: a legal system is an institution (it defines the rules); a specific agent serving in a court is a player in the game the institution defines.

**Hodgson (2006)**: institutions as enduring social structures with **reconstitutive downward causation** — they not only constrain agents but reshape agents' dispositions and identities over time. An agent who serves long within an institution internalizes its constitutive rules; this is not captured by Searle's synchronic account or North's purely constraint-based view.

## Structural components

Every institution has five structural components:

| Component | What it is |
|---|---|
| Positions | The offices — named normative slots that agents can occupy (see [Officer](./officer.md)) |
| Deontic profiles | The Hohfeldian rights, duties, powers, and immunities associated with each position |
| Constitutive rules | The "X counts as Y in C" rules generating the institutional facts |
| Collective recognition | The sustaining act — the ongoing acceptance that keeps the institution operative |
| Background conditions | The brute-fact substrate within which the institution operates |

The institution is not any one of these alone. Remove the constitutive rules and you have only a social habit. Remove collective recognition and you have a dead letter. Remove the deontic profiles and you have a mere label system.

## Institution vs. organization

North's distinction bears emphasis: **an institution is the rules; an organization is the players**. A company (organization) operates within contract law, property law, and employment law (institutions). A scientific community (organization) operates within the norms of peer review, citation, and epistemic standards (institutions). A legal system is an institution — it defines rules, roles, and deontic powers. A specific court operating within that legal system is an organization — a group pursuing a goal within the institutional frame.

This distinction prevents a common error: conflating the persistence of an institution with the persistence of a particular group. The institution persists when the rule-system persists. The organization dissolves when its members disperse.

## Relation to vessel

A [Vessel](../../../../../../philosophy/terms/vessel.md) is an institution in the Searlean sense: its constitutive rules assign the status *captain* to an agent (giving that agent the deontic power to issue orders the crew is obligated to follow), assign *crew* status to other agents (giving them duties of obedience and privileges of protection), and define the charter as the constitutive document. The vessel's registry is the persistence mechanism of the institutional identity — it maintains the collective recognition even through complete crew replacement.

## Relation to normative system

A [NormativeSystem](./normative-system.md) is the computationally precise formalization of an institution. Where the institution is defined by constitutive rules and collective acceptance, a normative system is defined by a formal tuple with explicit roles, scenes, and deontic constraints. Every institution can be approximated as a normative system; not every normative system captures the reconstitutive downward causation that Hodgson identifies in mature institutions.

## Institution vs. enterprise vs. substrate

| Concept | What it is | Persists by | Unity |
|---|---|---|---|
| [Substrate](../../../../../../../../science/domains/biology/domains/mycology/terms/substrate.md) | Medium + enabling conditions | Physical/computational structure | Enabling conditions |
| **Institution** | Constitutive rule-system | Collective recognition | CR + Rec |
| [Enterprise](../../../terms/enterprise.md) | Aim-generative cooperative activity | Hard core + generative mechanism | Hard core |
| [Company](../../../terms/company.md) | Institutionally constituted enterprise | Standing + charter | Charter + standing |

MacIntyre's distinction: enterprises (practices) are *carried* by institutions but are not identical to them. Institutions are concerned with maintaining their own structure and external goods; enterprises are concerned with pursuing internal goods. An institution can persist after its enterprise has degenerated (a university can persist as a bureaucratic institution after genuine scholarship has been replaced by credential-production). An enterprise cannot persist without at least a minimal institutional form (some set of constitutive rules and collective recognition).

## Operating within vs. operating on

A foundational distinction in institutional analysis is between two kinds of institutional acts:

**Operating within the institution** — acts that take the constitutive rules as fixed. Agents and outputs move through the institution's structure, but the institution's recognition mechanism — its rules — does not change. This is the day-to-day institutional operation: holding office, exercising power, fulfilling duty, contracting under existing law.

**Operating on the institution** — acts that change the constitutive rules themselves. Constitutional amendments, fundamental charter revisions, jurisdictional boundary changes are all operations-on-the-institution. They are not moves within the game but changes to the rules of the game (North's distinction).

The framework formalizes this distinction by distinguishing the institution's operations on its current constitutive rules (within) from operations that revise the constitutive rules themselves (on). The latter requires a higher-order authorization than the former — typically a constitutional or charter-level power that not all officers hold.

**Constitutional amendment.** A constitutional amendment that changes which acts count as valid institutional moves is an *operation on* the institution. If the amendment is conservative — every rule recognized in the old institution is also recognized in the new — the old institution is a sub-institution of the new. If the amendment is non-conservative, some previously recognized rules are revoked, and institutional facts whose support was in the revoked rules may need to be re-evaluated under the new rules.

## Mature institutions

A **mature institution** is one whose constitutional structure has stabilized: its constitutive rules are no longer evolving rapidly, its recognition has stabilized across generations of participants, and its operations consistently produce settled institutional facts. In framework terms: the institution's settlement structure has reached a fixed point under the institution's own pattern of operation.

By contrast, an **immature institution** has not yet stabilized. Its constitutive rules are still evolving as participants negotiate their interpretation; its recognition is incomplete or contested; its operations sometimes produce contested or fragile institutional facts. New institutions characteristically pass through such phases of immaturity before stabilizing.

A useful diagnostic: in a mature institution, distinct positions are constitutionally distinguishable — the institution can tell its offices apart by their structural commitments alone. In an immature institution, positions may be partially interchangeable, with their distinct identities dependent on contingent occupancy or local convention rather than structural commitment. Mature institutions exhibit *position uniqueness*; immature institutions tolerate *position interchangeability*.

## Open questions

- **Reconstitutive downward causation requires agent-indexed structure.** Hodgson's claim is that institutions reshape agent dispositions over time — not just institutional facts but the agents' own operative logic. The current framework has one set of predicates per institutional position; this is the institution's structure, not any individual agent's. Formalizing Hodgson's claim requires agent-indexed structures for each agent, with a convergence condition: the agent-indexed structures gradually align with the institution's general structure as the agent's participation accumulates. Whether such agent-indexed structures are coherent within the framework's covering structure, and whether their convergence is definable within the framework or requires a separate modeling layer, is open. What is currently formal: the institution's predicates shape what counts as institutional fact; what is not yet formal: the feedback from those facts back onto the agents' own settling structures.

- **Institutional maturity convergence.** A mature institution has reached a fixed point in its constitutional structure. Whether every institution reaches this fixed point in finitely many revisions, or whether some institutions require ongoing revision indefinitely, is open. The framework's commitment to settling monotonicity (evidence accumulates) suggests convergence is possible in principle; whether real institutions actually converge or remain in perpetual revision is an empirical question the framework cannot decide on its own.

- **Institutional covering structure: which covering conditions are institutional?** Not every formal covering structure on a history corresponds to an institution. Whether the framework's general covering machinery captures all and only the structures that are institutionally interpretable, or whether institutions are a proper subclass of formal covering structures with additional conditions (consistency, recognition-coherence, etc.), is an open question.

- **The boundary between institution and convention.** Some normative systems are institutional (legal systems, corporate governance) while others are conventional (linguistic conventions, social customs). The framework treats both within the predication structure, but the boundary — what makes one a constitutive institution and the other a regulative convention — is not yet sharply drawn formally. The Searlean criterion (constitutive vs. regulative) gives one answer; whether the framework can derive the distinction from settlement-structural features alone is open.
