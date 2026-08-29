---
id: instruction
description: "An Instruction is a five-tuple (I, φ, R, τ, A) — an issuer I holding the authority to direct, an act-class φ specifying what the recipient must do, a recipient R who is thereby placed under obligation, a deadline τ, and an authorizing position A ∈ HohfeldianPosition that grounds I's power to issue the instruction. The defining structure: an instruction exercises a Power to create a Duty in R — a second-quartet act producing a first-quartet obligation. Instruction differs from request (no power exercised) and assertion (no obligation created)."
defines: Instruction
related: Act, Commitment, Duty, Authority, HohfeldianPosition, Order, Norm, Delegation, Officer, Judgment
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  issuer: person
  act-class: relational-universe
  recipient: person
  deadline: relational-history
  authorizing-position: hohfeldian-position
output: relational-history-fiber-fixed-layer
ast:
  relational-history-transferring-nucleus:
    - issuer:
        - authorizing-position
        - act-class
    - recipient:
        - act-class
        - deadline
        - issuer
---

# Instruction

## Formal definition

An **Instruction** is a five-tuple $(I, \varphi, R, \tau, A)$:

$$(I : \mathrm{Person},\; \varphi : \mathrm{ActClass},\; R : \mathrm{Person},\; \tau \in T,\; A \in \mathrm{HohfeldianPosition})$$

where:
- $I$ is the **issuer** — the agent who issues the instruction; $I$ holds the authorizing position $A$ and exercises it by issuing this instruction
- $\varphi$ is the **act-class** — the type of act the recipient is directed to perform; the instruction specifies WHAT $R$ must do, not the specific act (the specific performance is $R$'s to determine within the act-class)
- $R$ is the **recipient** — the agent directed to perform $\varphi$; the instruction creates a [Duty](duty.md) in $R$ with $I$ as the correlative right-holder
- $\tau \in T$ is the **deadline** — the history by which $R$ must have performed an act of type $\varphi$; the instruction is breached if no such act occurs at any $t \leq \tau$
- $A \in \mathrm{HohfeldianPosition}$ is the **authorizing position** — the [Hohfeldian](hohfeldian-position.md) Power that $I$ exercises by issuing the instruction; $A$ must be a second-quartet Power with $R$ in the liability position; without a valid Power, the instruction has no normative force

## What this is

An **Instruction** is the directive speech act — the act of directing another to act. It exercises a second-quartet [Power](hohfeldian-position.md) to create a first-quartet [Duty](duty.md) in the recipient.

The structure: before the instruction, $R$ has no duty regarding $\varphi$. After the valid instruction, $R$ has a duty to perform $\varphi$ by $\tau$, with $I$ holding the correlative claim-right. The instruction is a normative-position-altering act — it changes the Hohfeldian landscape by creating a bilateral duty/claim pair.

**Validity condition.** The instruction $(I, \varphi, R, \tau, A)$ is **normatively valid** iff:
1. $I$ holds position $A$ — the authorizing position actually belongs to $I$
2. $A$ is a Power over $R$'s normative position regarding act-class $\varphi$ — $A$ is the right kind of power for this instruction
3. $R$ is in the liability position corresponding to $A$ — $R$'s normative position is alterable by $I$'s exercise of $A$
4. $\varphi$ is within the scope of $A$ — the act-class falls within what $I$'s Power covers

An instruction that fails any of these conditions is **ultra vires** — beyond the issuer's authority. Ultra vires instructions have surface form but no normative force; $R$ is not obligated to comply.

## Instruction and order

In military and institutional contexts, an instruction issued by a superior within a chain of command is an **order**. The distinction is scalar, not categorical: an order is an instruction with high authority, specific accountability for non-compliance, and typically a compressed deadline. The same tuple structure applies; the difference is in the strength of the authorizing position $A$ and the consequences of breach.

**Standing orders** (as in [DutyOfficer](duty-officer.md)) are instructions with $\tau = \infty$ — perpetual standing until superseded. They are transfer-settled ($\Delta_t$-fixed) instructions: the duty they create holds at all downstream histories until a subsequent instruction supersedes them.

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

## Nuclear reading

We work in the fiber Heyting algebra $H_t$ at each history $t \in T$, with [saturation nucleus](../math/relational-history-fiber-saturating-nucleus.md) $\sigma_t$ and [transfer nucleus](../math/relational-history-fiber-transferring-nucleus.md) $\Delta_t$. Both are extensive, idempotent ([Idempotence](../math/relational-history-fiber-nucleus-idempotence.md)), meet-preserving ([Meet Preservation](../math/relational-history-fiber-nucleus-meet-preservation.md)), and commuting ([Commutation](../math/relational-history-fiber-nucleus-commutation.md)).

**Definition (Instruction proposition).** An instruction $(I, \varphi, R, \tau, A)$ issued at history $t_0$ is modeled by a *directive proposition* $d \in H_{t_0}$. The instruction is *validly issued* iff:
$$\sigma_{t_0}(d) = d$$
meaning $d \in \mathrm{Fix}(\sigma_{t_0})$: the issuance event has been recognized and recorded in the accumulated history at $t_0$ — the authority's declaration is meaning-settled.

**Remark (Acts do not change $\sigma_t$).** The issuance act does not modify $\sigma_{t_0}$; it advances history to $t_1 = s_I \star t_0$ where the new $\sigma_{t_1}$ reflects the recorded issuance. The condition $d \in \mathrm{Fix}(\sigma_{t_1})$ is the correct statement: at $t_1$, the directive is meaning-settled.

**Definition (Binding instruction).** The instruction is *binding through deadline $\tau$* iff $d \in \mathrm{Fix}(\Delta_t)$ for all $t \leq \tau$ — the directive proposition is transfer-stable at every history from issuance through deadline. By the definition of $\Delta_t$, this means $d$ is present in the image of every forward restriction map $H(i_{s,t}) : H_{s \star t} \to H_t$ for all $s \perp t$: the obligation propagates to every extension without degradation.

**Definition (Instruction execution).** The instruction is *executed* at history $t'$ iff, at $t'$, the act-class $\varphi$ has been performed and its outcome $\varphi_{t'} \in H^*_{t'} = \mathrm{Fix}(\sigma_{t'}) \cap \mathrm{Fix}(\Delta_{t'})$ — the performance is doubly stable: meaning-recognized and committed to all further extensions.

**Proposition (Conjunction of instructions is an instruction).** If $d_1, d_2 \in \mathrm{Fix}(\sigma_t)$ are two validly issued instructions at history $t$, then $d_1 \wedge d_2 \in \mathrm{Fix}(\sigma_t)$.

*Proof.* By [Meet Preservation](../math/relational-history-fiber-nucleus-meet-preservation.md), $\sigma_t(d_1 \wedge d_2) = \sigma_t(d_1) \wedge \sigma_t(d_2) = d_1 \wedge d_2$. Therefore $d_1 \wedge d_2 \in \mathrm{Fix}(\sigma_t)$. $\square$

**Corollary.** A body of instructions issued at the same history is closed under finite conjunction: the combined directive of two recognized instructions is itself a recognized instruction.

**Proposition (Standing orders are transfer-stable).** A standing order with $\tau = \top$ (perpetual) satisfies $\Delta_t(d) = d$ for all $t$ in the history poset — it is $\Delta_t$-fixed at every history. This is the nuclear characterization of perpetual standing: the obligation holds in every extension regardless of what steps are taken.

*Proof.* Transfer-stability at $t$ means $d$ is in the image of every forward restriction map $H(i_{s,t})$ for all $s \perp t$. A standing order stipulates that no history extension supersedes the directive. Formally, the instruction's validity condition requires $d \in \mathrm{Fix}(\Delta_t)$ for all $t$ — this is the definition of its perpetual standing, not a consequence derived from other axioms. It is the nuclear rendering of "perpetual until superseded." $\square$

**Remark (Ultra vires instruction).** If the issuer $I$ does not hold the authorizing position $A$ at $t_0$, then the directive $d$ does not enter $\mathrm{Fix}(\sigma_{t_0})$: the act of utterance occurs but the saturation nucleus does not recognize it as authoritative — the restriction profile of $d$ to sub-histories does not include a valid authority record, so $\sigma_{t_0}(d) > d$ (the nucleus must do further work to place $d$ in its fixed fiber, work that cannot be done because the authority record is absent). The ultra vires instruction is meaning-open, not meaning-settled.

## Open questions

- Whether the issuer's authorizing position $A$ must be verified at issuance time only, or must be held throughout the instruction's validity period — whether an officer who issues an instruction and then loses the authorizing position (by investiture or discharge) retroactively voids the instruction's normative force.
- Whether instructions can be delegated: if $I$ instructs $R$ to perform $\varphi$, and $R$ sub-delegates to $R'$, does the original instruction bind $R'$? And is $R$'s duty discharged by $R'$'s performance, or does $R$ remain personally accountable?
- Whether there is a minimal instruction — an instruction whose act-class $\varphi$ is maximally specific (a single act rather than a class) — and whether such minimal instructions are the atoms from which all standing orders and general instructions are composed.
