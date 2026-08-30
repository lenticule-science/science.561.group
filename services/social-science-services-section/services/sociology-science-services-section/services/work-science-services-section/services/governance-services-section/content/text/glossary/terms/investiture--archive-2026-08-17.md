---

title: "Investiture"
description: "An Investiture is a four-tuple (R, I⁺, I⁻, μ) — a role R with defined authority and accountability, a formal assumption act I⁺ that creates the role-binding, a corresponding relief act I⁻ that dissolves it, and a mutual acknowledgement condition μ required for either act to be valid. The defining structure: authority does not transfer by presence, proximity, or rank — only by the completion of I⁺ with μ satisfied."
defines: Investiture
related: Captain, DutyOfficer, Incumbent, Delegation, Discharge, Office, StatusFunctionDeclaration, Authority, Trust, Norm, HohfeldianPosition, Record
date-created: 2026-03-19
---

## Formal definition

An **Investiture** is a four-tuple $\mathcal{V} = (R, I^+, I^-, \mu)$:

$$\mathcal{V} = (R : \mathrm{Role},\; I^+ : \mathrm{AssumptionAct},\; I^- : \mathrm{ReliefAct},\; \mu : I^+ \times I^- \to \{0,1\})$$

where:
- $R$ is the **role** — the office, position, or watch whose authority and accountability transfer through the investiture; $R$ specifies what authority is conferred, what accountability attaches, and what non-delegable duties are activated
- $I^+$ is the **assumption act** — the formal event that binds $R$ to its new holder; before $I^+$, the incoming holder has no authority from $R$; after $I^+$, they have full authority and accountability
- $I^-$ is the **relief act** — the formal event that unbinds $R$ from its current holder; before $I^-$, the outgoing holder retains full authority and accountability even if physically absent; after $I^-$, they have none
- $\mu$ is the **mutual acknowledgement condition** — the requirement that both parties explicitly confirm the transfer; $\mu = 1$ iff both the incoming holder and the outgoing holder (or the investiture authority) have acknowledged the transfer; without $\mu = 1$, neither $I^+$ nor $I^-$ is complete

**Five invariants.** $\mathcal{V}$ is a valid investiture iff it satisfies:

1. **No transfer by presence**: authority does not transfer because the incoming holder arrives, because a superior is watching, or because time has elapsed. $I^+$ must be explicitly performed. The STCW formulation: "the officer in charge of the navigational watch shall continue to be responsible... despite the presence of the master on the bridge, until informed specifically that the master has assumed that responsibility and this is mutually understood."

2. **Mutual acknowledgement**: $\mu = 1$ requires explicit acknowledgment from both parties. Unilateral assumption ("I'm taking over") without the outgoing holder's acknowledgment is not a valid $I^+$. The outgoing holder's statement "I am relieved" and the incoming holder's "I relieve you" are the canonical form. Without $\mu$, the outgoing holder remains accountable.

3. **Continuity**: at no moment during a valid investiture is $R$ unoccupied. The outgoing holder retains $R$ until the instant $I^-$ is complete; at that same instant, the incoming holder has $R$ via $I^+$. There is no gap and no overlap.

4. **Emergency suspension**: if a crisis is in progress, $I^+$ is deferred. The outgoing holder cannot be relieved mid-maneuver, mid-incident, or mid-emergency. The incoming holder waits. The temporal scope of $R$ stretches to accommodate the crisis before relief can occur.

5. **Documentary record**: a valid investiture is documented — in a log entry, a memorandum of assumption, a formal order, or a public declaration. The document is the institutional record that makes the transfer legally and normatively effective as against third parties.

## Investiture as a StatusFunctionDeclaration

An Investiture is exactly a [StatusFunctionDeclaration](./status-function-declaration.md): the constitutive speech act of the form "X counts as Y in context C." Applied to investiture: "the incoming holder $X$ counts as the occupant of office $R$ in context $C$ (the institutional setting where the office exists)." The [StatusFunctionDeclaration](./status-function-declaration.md) four-tuple $(X, Y, C, A)$ maps directly:
- $X$ = the incoming holder (the target of the declaration)
- $Y$ = the status of office-occupancy (with its full [HohfeldianPosition](../domains/hohfeldian/terms/hohfeldian-position.md) profile — the powers, duties, privileges, and immunities of the office)
- $C$ = the institutional context in which the office exists (the organization, the ship, the command structure)
- $A$ = the authorizing act — the mutual acknowledgement $\mu$ plus the documentary record, together constituting the felicity conditions that make the declaration valid

The mutual acknowledgement $\mu$ is the felicity condition that distinguishes a valid investiture from a failed one. A unilateral declaration ("I'm taking command") without $\mu$ fails the felicity check: it is an attempt at a [StatusFunctionDeclaration](./status-function-declaration.md) that does not succeed because the conditions for recognition are not met.

The [Trust](trust.md) structure is activated at the moment of investiture: the outgoing holder extends [Trust](trust.md) to the incoming holder within the domain of the office — they accept vulnerability to the incoming holder's exercise of the office's authority. The incoming holder becomes the entrusted party; the office's domain is the trust domain. The [Trust](trust.md) triple $\mathcal{T} = (Q_{\mathrm{out}}, Q_{\mathrm{in}}, D_R)$ where $D_R$ is the domain of the role $R$ is the relational structure of every handover.

## Investiture as the installation act for Captain and DutyOfficer

The investiture tuple is the formal content of the [Captain](../../../terms/captain.md)'s installation act $I$ and the [DutyOfficer](duty-officer.md)'s assumption protocol $I^+$:

| Role | $I^+$ form | $I^-$ form | $\mu$ form |
|---|---|---|---|
| Captain (military) | Change-of-command ceremony + memorandum | Relief orders + ceremony | Both commanders salute; outgoing says "I relinquish command" |
| Captain (maritime) | Official log entry + flag state notification | Same, with survey of defects | Log signed by both |
| DutyOfficer (naval OOD) | "I relieve you" with positional announcement | "I stand relieved" | Both verbal statements logged |
| DutyOfficer (army OD) | Guard mount ceremony | Reverse ceremony | Both officers face their guards; salutes exchanged |
| DutyOfficer (maritime OOW) | STCW handover checklist complete + mutual acknowledgment | "I stand relieved of the watch" | Mutual statement logged in deck log |

## Investiture vs. delegation

Delegation ($Q$ grants $G$ to $B$) does not require investiture. A staff officer's appointment is a delegation without an assumption ceremony. What distinguishes the duty officer and captain from the staff officer is that their authority is positional — it occupies a slot that can only be held by one party at a time — and therefore requires investiture to transfer cleanly.

The formal difference: delegation creates concurrent authority (principal retains authority, delegate gains derivative authority). Investiture transfers exclusive authority (the prior holder loses authority at the moment the incoming holder gains it).

## Nuclear reading

We work in the fiber Heyting algebra $H_t$ at a fixed history $t \in T$, with [saturation nucleus](../../../humanities/domains/math/relational-history-fiber-saturating-nucleus.md) $\sigma_t$ and [transfer nucleus](../../../humanities/domains/math/relational-history-fiber-transferring-nucleus.md) $\Delta_t$. Both are extensive, idempotent ([Idempotence](../../../humanities/domains/math/relational-history-fiber-nucleus-idempotence.md)), meet-preserving ([Meet Preservation](../../../humanities/domains/math/relational-history-fiber-nucleus-meet-preservation.md)), and commuting ([Commutation](../../../humanities/domains/math/relational-history-fiber-nucleus-commutation.md)).

**Definition (Incumbency proposition).** Let $\iota \in H_t$ be the *incumbency proposition* — the proposition "the incoming holder occupies role $R$." Before investiture, $\iota$ is an element of $H_t$ but is not $\sigma_t$-fixed: $\sigma_t(\iota) > \iota$, meaning the accumulated past record does not yet fully recognize the holder as installed.

**Definition (What investiture means in the nuclear model).** Investiture is modeled as the act of advancing history by a step $s_{\mathrm{inv}}$: history moves from $t$ to $t' = s_{\mathrm{inv}} \star t$. The new saturation nucleus $\sigma_{t'}$ at the extended history $t'$ satisfies $\sigma_{t'}(\iota) = \iota$ — the incumbency proposition is meaning-settled at $t'$ because the restriction profile of $\iota$ to all sub-histories of $t'$ (including the investiture event $s_{\mathrm{inv}}$) now fully determines $\iota$'s status. This is a *definition* of what the investiture step means in the nuclear model, not a derived theorem.

**Remark (Acts do not change $\sigma_t$).** The investiture act does not modify $\sigma_t$ at the original history $t$. It generates a new history $t'$ with a new nucleus $\sigma_{t'}$. The claim "$\iota \in \mathrm{Fix}(\sigma_t)$ after investiture" is a category error: investiture moves from $t$ to $t'$, and $\iota \in \mathrm{Fix}(\sigma_{t'})$ is the correct statement. The nucleus $\sigma_t$ at the original history is unaffected.

**Proposition (Saturation fixedness after investiture).** At $t' = s_{\mathrm{inv}} \star t$ with $\iota \in \mathrm{Fix}(\sigma_{t'})$:
$$\sigma_{t'}(\iota) = \iota$$
and therefore $\iota$ is meaning-settled at $t'$ — the installed recognition is stable with respect to the entire accumulated record up to $t'$.

*Proof.* This follows directly from the definition of $\mathrm{Fix}(\sigma_{t'})$: an element $a \in \mathrm{Fix}(\sigma_{t'})$ iff $\sigma_{t'}(a) = a$. The claim is definitional of what $\iota \in \mathrm{Fix}(\sigma_{t'})$ means. $\square$

**Definition (Induction gap).** Even after investiture, $\iota \in \mathrm{Fix}(\sigma_{t'})$ does not imply $\iota \in \mathrm{Fix}(\Delta_{t'})$. The *induction gap* is the interval $[\iota, \Delta_{t'}(\iota)]$ in $H_{t'}$. Since $\Delta_{t'}$ is extensive and $\iota$ may not yet be present in the image of every forward restriction map from $t'$, this gap can be nonempty. The induction step is the subsequent act that places $\iota$ into $\mathrm{Fix}(\Delta_{t''})$ at a further history $t''$: the role-binding is not only recognized but committed to every future extension.

**Proposition (Doubly-stable role-binding requires both stages).** The full installation $\iota \in H^*_{t''} = \mathrm{Fix}(\sigma_{t''}) \cap \mathrm{Fix}(\Delta_{t''})$ requires:
1. The investiture step advancing to $t'$ where $\iota \in \mathrm{Fix}(\sigma_{t'})$ (first stage: recognition).
2. An induction step advancing to $t''$ where additionally $\iota \in \mathrm{Fix}(\Delta_{t''})$ (second stage: operative commitment).

*Proof.* $H^*_{t''} = \mathrm{Fix}(\sigma_{t''}) \cap \mathrm{Fix}(\Delta_{t''})$ requires both conditions simultaneously. Neither condition implies the other in general: $\mathrm{Fix}(\sigma_{t''})$ and $\mathrm{Fix}(\Delta_{t''})$ are distinct sub-algebras of $H_{t''}$ whose intersection is $H^*_{t''}$. The two-stage structure follows from this independence. $\square$

**Proposition (Relief dissolves recognition).** Relief ($I^-$ with $\mu = 1$) advances history to $t''' = s_{\mathrm{rel}} \star t''$. At $t'''$, the incumbency proposition $\iota$ for the outgoing holder is no longer $\sigma_{t'''}$-fixed: the accumulated record now includes the relief event, and $\sigma_{t'''}(\iota) > \iota$. The outgoing holder's role-binding is displaced from the fixed fiber at $t'''$.

*Proof.* The relief step $s_{\mathrm{rel}}$ generates a new history $t''' = s_{\mathrm{rel}} \star t''$ where the restriction profile of $\iota$ to the sub-history $t''$ still reflects the prior holder, but the restriction profile to $s_{\mathrm{rel}} \star t''$ no longer contains the outgoing holder's binding. By definition of $\sigma_{t'''}$, this changes the saturation: $\sigma_{t'''}(\iota) \neq \iota$. (This is the nuclear rendering of the invariant: "after $I^-$, the outgoing holder has no authority from $R$.") $\square$

## Open questions

- Whether the mutual acknowledgement condition $\mu$ can be waived in emergency succession — whether a unilateral assumption of command (with documentary record) satisfies a weakened form of $\mu$ when the outgoing holder is incapacitated or absent.
- Whether investiture is the general form of which the [Proxy](proxy.md)'s authorization is a special case — whether the proxy's authorization is a partial investiture (bounded by act-class $\varphi$) rather than a full role-binding.
- The formal relationship between investiture and the [Clerk](../../../terms/clerk.md)'s authentication: whether the clerk's role is to provide the documentary record that completes the institutional recognition ($\mu$) component of the investiture.
