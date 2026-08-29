---
id: succession
description: "A Succession is a pair (O, L) — an office O and a priority-ordered succession list L = (h₀, h₁, ..., hₙ) of candidate holders — together with an activation predicate P that fires when the primary holder h₀ is unavailable. When P fires, the relief of h₀ and the emergency investiture of the first available candidate hᵢ occur simultaneously. The defining structure: succession is a latent ordered family of sections over the same office position; the active section is the minimum-index element for which the candidate is present and the activation condition holds. Formally: the succession list is a total ordering on the set of candidate sections of the role fibration; succession selects the minimum with respect to that ordering among the candidates currently in a settable state."
defines: Succession
related: Investiture, Relief, Captain, DutyOfficer, Office, Enrollment, Duty
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  office: office
  succession-list: relational-universe-fiber-proposition
  activation-predicate: relational-history-restriction-map
output: relational-history-fiber-fixed-layer
ast:
  ordered-section-family:
    - succession-list:
        - office
    - activation-predicate:
        - succession-list
        - office
---

# Succession

## Formal definition

A **Succession** is a pair $\mathcal{S} = (O, L)$:

$$\mathcal{S} = (O : \mathrm{Office},\; L = (h_0, h_1, \ldots, h_n) : \mathrm{PriorityList})$$

together with: - An **activation predicate** $P : H_{t^*} \to \{0, 1\}$ — the condition under which the primary holder $h_0$ is no longer able to maintain the settled binding $h_0 \in H^*_{t^*}$ - An **availability predicate** $A_i : H_{t^*} \to \{0, 1\}$ for each candidate $h_i$ — whether $h_i$ is present, capable, and eligible to assume $O$ - A **succession act** $\iota_i$ — the emergency investiture of the minimum-index available candidate $h_i$ when $P$ fires

The succession selects the **active section** $h_{i^*}$ where:

$$i^* = \min\{i \in \{0, \ldots, n\} \mid P(h_i^{\mathrm{current}}) = 0 \text{ for all } j < i \text{ and } A_i(h_i) = 1\}$$

The active section $h_{i^*}$ is immediately installed: $\sigma_{t^*}(h_{i^*}\text{-binding}) = h_{i^*}\text{-binding}$ — the binding settles as soon as assumption is documented.

**Four invariants.** $\mathcal{S}$ is a valid succession iff:

1. **Coverage**: $L$ covers all succession positions — for every possible activation scenario, at least one $h_i$ has $A_i = 1$.
  A succession list that leaves the office vacant under some activation scenario is incomplete.

2. **Priority uniqueness**: no two candidates share the same priority index. $L$ is a strict total order, not a partial order.
  Ties in succession order are resolved by institutional rule (seniority, date of rank, date of enrollment) before the succession list is established.

3. **Immediate assumption**: when $P$ fires and $h_{i^*}$ is identified, assumption is immediate — not upon completion of a ceremony, not upon acknowledgement from a superior, but at the moment of documented self-assumption.
  Emergency succession does not wait for normal investiture procedures.
  The documentation is performed by the incoming holder; the record establishes the time of assumption and the triggering condition.

4. **Chain integrity**: if $h_{i^*}$ also becomes unavailable during the same activation event (compound emergency), the succession falls to $h_{i^*+1}$, and so on.
  The chain does not terminate until the list is exhausted (office goes vacant) or a holder assumes and maintains the position.

## US law and military doctrine

**United States statutory succession**: the Presidential Succession Act (3 U.S.C. §§19, 20) establishes an ordered list of 18 officers who assume the Presidency upon the President's inability to serve.
The Succession Act is the canonical institutional expression of the succession tuple: a fixed priority list, an activation predicate (death, resignation, inability), an availability predicate (constitutional eligibility, willingness), and immediate assumption upon activation.

**US Navy Regulations, Art.
0801**: "When the commanding officer is absent or is incapacitated, command shall devolve upon the next eligible officer present for duty."
This is succession invariant 3: immediate, by operation of regulation, without ceremony.
The executive officer becomes commanding officer; if absent, the next senior qualified officer; and so on.

**SOLAS Chapter V, Regulation 34-1** (as cited in [Captain](captain.md)) protects the master's safety authority.
Under SOLAS, the succession of masters is regulated by the flag state — the ship's Safety Management Certificate must name the master.
Emergency succession at sea requires the relief entry in the Official Log and notification to the flag state as soon as practicable.

**Uniform Code of Military Justice, Art.
7a** (Apprehension): any commissioned officer may apprehend any person subject to the UCMJ. **Art.
15** (NJP) and command succession: when a commander is unavailable, the next in line automatically holds NJP authority.
The succession is not a grant of authority but an operation of law — the succession list is defined by regulatory structure, not by the commander's choice.

**ICS (Incident Command System)**: FEMA NIMS Section 3.4 specifies command transfer when the Incident Commander is unavailable.
The succession is the Deputy IC, then the Operations Section Chief, following a predefined order.
Transfer must be documented in the Incident Action Plan.

## The ordered family of sections

In section-theoretic terms ([Section](../math/section.md)): the succession list $L = (h_0, h_1, \ldots, h_n)$ is a **priority-ordered family of candidate sections** over the office position $O$:

$$L_i = s_O^{(i)} : \{O\} \to H_{t^*}$$

where $s_O^{(i)}$ is the candidate $h_i$'s potential section (their claim on the office, not yet settled).
The section condition $\pi_O \circ s_O^{(i)} = \mathrm{id}_{\{O\}}$ holds for each candidate — they are each positioned to fill the role — but only the active section is in $H^*_{t^*}$ (doubly settled).
The inactive sections remain in $H_{t^*} \setminus H^*_{t^*}$: they are candidate sections, not settled ones.

When $P$ fires: the primary section $s_O^{(0)} \mapsto \bot_{H_{t^*}}$ (dissolved by the activation event), and the succession act $\iota_{i^*}$ settles $s_O^{(i^*)}$ into $H^*_{t^*}$:

$$\sigma_{t^*}(s_O^{(i^*)}(O)) = s_O^{(i^*)}(O)$$

The nucleus $\sigma_{t^*}$ is the settling mechanism — the assumption documentation is the $\sigma_{t^*}$ trigger.

## Succession vs. delegation vs. investiture

| Dimension | Investiture | Succession | Delegation |
|---|---|---|---|
| Trigger | Planned handover | Activation predicate (emergency) | Principal's decision |
| Selection | Named incoming holder | Minimum-index available candidate | Named beneficiary |
| Authority type | Exclusive positional authority | Exclusive positional authority (emergency) | Derivative, concurrent authority |
| Accountability | Transfers to incoming holder | Transfers to successor | Stays with principal |
| Mutual ack. required | Yes ($\mu = 1$) | No (self-documented) | Not required |
| Math | Section installation with counit | Ordered section family; activation selects minimum | Sub-presheaf sharing |

## Open questions

- Whether the succession list $L$ has a canonical representation as a fiber in the authority presheaf — whether $(h_0, h_1, \ldots, h_n)$ is a well-ordered subset of a larger fiber $H_{t^*}$ and the succession act is the projection to the $\sigma_{t^*}$-closed element of minimum index.
- Whether compound emergency (multiple consecutive activation events consuming successors) is a well-defined morphism in the category of office-filling sequences, and whether there is a canonical "exhausted" state (all candidates unavailable, office vacant) that is a terminal object in this category.
- Whether the succession list's completeness requirement (invariant 1) corresponds to a covering condition in the site topology $J$ — whether the family $\{h_0, h_1, \ldots, h_n\}$ is a $J$-covering family of the office $O$ in the sense that every context in which $O$ must be filled is covered by at least one available candidate.
