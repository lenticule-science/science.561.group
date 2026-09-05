---
title: "Instruction"
description: "An Instruction is a five-tuple (I, φ, R, τ, A) — an issuer I holding the authority to direct, an act-class φ specifying what the recipient must do, a recipient R who is thereby placed under obligation, a deadline τ, and an authorizing position A ∈ HohfeldianPosition that grounds I's power to issue the instruction. The defining structure: an instruction exercises a Power to create a Duty in R — a second-quartet act producing a first-quartet obligation. Instruction differs from request (no power exercised) and assertion (no obligation created)."
date-created: 2026-03-20
---

## Formal definition

An **Instruction** is a five-tuple $(I, \varphi, R, \tau, A)$:

$$(I : \mathrm{Person},\; \varphi : \mathrm{ActClass},\; R : \mathrm{Person},\; \tau \in T,\; A \in \mathrm{HohfeldianPosition})$$

where:
- $I$ is the **issuer** — the agent who issues the instruction; $I$ holds the authorizing position $A$ and exercises it by issuing this instruction
- $\varphi$ is the **act-class** — the type of act the recipient is directed to perform; the instruction specifies WHAT $R$ must do, not the specific act (the specific performance is $R$'s to determine within the act-class)
- $R$ is the **recipient** — the agent directed to perform $\varphi$; the instruction creates a [Duty](../../../humanities/theories/sociology/theories/work/theories/governance/terms/duty.md) in $R$ with $I$ as the correlative right-holder
- $\tau \in T$ is the **deadline** — the history by which $R$ must have performed an act of type $\varphi$; the instruction is breached if no such act occurs at any $t \leq \tau$
- $A \in \mathrm{HohfeldianPosition}$ is the **authorizing position** — the [Hohfeldian](../../../humanities/theories/sociology/theories/work/theories/governance/theories/hohfeldian/terms/hohfeldian-position.md) Power that $I$ exercises by issuing the instruction; $A$ must be a second-quartet Power with $R$ in the liability position; without a valid Power, the instruction has no normative force

## What this is

An **Instruction** is the directive speech act — the act of directing another to act. It exercises a second-quartet [Power](../../../humanities/theories/sociology/theories/work/theories/governance/theories/hohfeldian/terms/hohfeldian-position.md) to create a first-quartet [Duty](../../../humanities/theories/sociology/theories/work/theories/governance/terms/duty.md) in the recipient.

The structure: before the instruction, $R$ has no duty regarding $\varphi$. After the valid instruction, $R$ has a duty to perform $\varphi$ by $\tau$, with $I$ holding the correlative claim-right. The instruction is a normative-position-altering act — it changes the Hohfeldian landscape by creating a bilateral duty/claim pair.

**Validity condition.** The instruction $(I, \varphi, R, \tau, A)$ is **normatively valid** iff:
1. $I$ holds position $A$ — the authorizing position actually belongs to $I$
2. $A$ is a Power over $R$'s normative position regarding act-class $\varphi$ — $A$ is the right kind of power for this instruction
3. $R$ is in the liability position corresponding to $A$ — $R$'s normative position is alterable by $I$'s exercise of $A$
4. $\varphi$ is within the scope of $A$ — the act-class falls within what $I$'s Power covers

An instruction that fails any of these conditions is **ultra vires** — beyond the issuer's authority. Ultra vires instructions have surface form but no normative force; $R$ is not obligated to comply.

## Instruction and order

In military and institutional contexts, an instruction issued by a superior within a chain of command is an **order**. The distinction is scalar, not categorical: an order is an instruction with high authority, specific accountability for non-compliance, and typically a compressed deadline. The same tuple structure applies; the difference is in the strength of the authorizing position $A$ and the consequences of breach.

**Standing orders** (as in [DutyOfficer](duty-officer.md)) are instructions with $\tau = \infty$ — perpetual standing until superseded. The duty they create holds at all subsequent times until a later instruction explicitly supersedes them.

## Instruction and the FARS

In the flatfile agential resource system, instructions appear as:
- PLANS.md entries: instructions to the next agent session to perform specific acts
- INBOX.md entries: instructions from upstream agents to downstream locale occupants
- SOUL.md / CLAUDE.md MUST clauses: standing orders — perpetual instructions from the system designers to all agents

Each MUST clause is an instruction with: issuer = system designer, act-class = the forbidden or required behavior, recipient = all agents, deadline = perpetual, authorizing-position = the designer's charter authority over the FARS.

## Instruction vs. request vs. assertion

| Speech act | Creates obligation? | Exercises power? | Recipient must comply? |
|---|---|---|---|
| **Assertion** | No | No | No — update epistemic state |
| **Request** | No | No | No — discretionary response |
| **Instruction** | Yes (duty) | Yes (power) | Yes — normatively |
| **Commitment** | Yes (self-duty) | No | Yes — self-accountable |

The key distinction: a request asks; an instruction directs. A request has no Hohfeldian Power behind it — the recipient's response is discretionary. An instruction has a Power behind it — the recipient is in the liability position and the instruction succeeds in creating a duty whether or not the recipient "accepts" it.

## Open questions

- Whether the issuer's authorizing position $A$ must be verified at issuance time only, or must be held throughout the instruction's validity period — whether an officer who issues an instruction and then loses the authorizing position (by investiture or discharge) retroactively voids the instruction's normative force.
- Whether instructions can be delegated: if $I$ instructs $R$ to perform $\varphi$, and $R$ sub-delegates to $R'$, does the original instruction bind $R'$? And is $R$'s duty discharged by $R'$'s performance, or does $R$ remain personally accountable?
- Whether there is a minimal instruction — an instruction whose act-class $\varphi$ is maximally specific (a single act rather than a class) — and whether such minimal instructions are the atoms from which all standing orders and general instructions are composed.
