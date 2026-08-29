---
title: "Accountability"
description: "Accountability is a triple (B, S, A) — a bearer B, a scope S, and an accountability function A: Outcomes(S) → {B} — a total map assigning every outcome within S to B as the answerable party. The defining structure: accountability is backward-looking, total, and non-transferable by delegation. B is answerable for everything that happens in S regardless of who caused it, who was delegated to handle it, or whether B was present. Delegation distributes authority; it never lifts accountability."
defines: Accountability
related: Duty, Captain, DutyOfficer, Delegation, Discharge, Officer, Principal, Sanction, Breach, Trust, Responsibility
date-created: 2026-03-20
id: accountability
date-modified: 2026-03-20
params:
  bearer: person
  scope: area
  accountability-function: relational-universe-morphism
output: relational-history-fiber-fixed-layer
ast:
  relational-history-saturating-nucleus:
    - accountability-function:
        - bearer
        - scope
    - relational-history-transferring-nucleus:
        - bearer
        - scope
        - accountability-function
---

## Formal definition

**Accountability** is a triple $\mathcal{Ac} = (B, S, A)$:

$$\mathcal{Ac} = (B : \mathrm{Person},\; S : \mathrm{Scope},\; A : \mathrm{Outcomes}(S) \to \{B\})$$

where:
- $B$ is the **bearer** — the single party who is answerable for all outcomes within $S$; accountability is always personal — it attaches to a named individual, not a role in the abstract
- $S$ is the **scope** — the precisely bounded domain (unit, vessel, command, area, project) within which $A$ operates; $S$ must be bounded for accountability to be determinate; "accountable for everything" with no scope boundary is not accountability but a rhetorical claim
- $A : \mathrm{Outcomes}(S) \to \{B\}$ is the **accountability function** — total, constant, and surjective; every outcome $o \in \mathrm{Outcomes}(S)$ maps to $B$; there is no outcome in $S$ for which $B$ is not answerable

**Four invariants.** $\mathcal{Ac}$ is a valid accountability structure if and only if:

1. **Totality**: $A$ is defined on all of $\mathrm{Outcomes}(S)$.
There is no outcome within $S$ for which accountability is unassigned.
The "accountability gap" — outcome without an accountable party — is a structural failure of the normative system, not a description of a real accountability.

2. **Non-transferability by delegation**: for any delegation $\mathcal{D} = (B, G, D_{\mathrm{sub}})$ from $B$ to a subordinate within $S$, the accountability function $A$ is unchanged: $A(o) = B$ for all $o \in \mathrm{Outcomes}(S)$.
Delegation distributes authority; it does not modify $A$.
The canonical formulation (U.S. Navy Regulations, Art. 0802): "delegation of authority shall in no way relieve the commanding officer of continued responsibility."

3. **Installation-anchoring**: $A$ is binding from the moment of $B$'s [Investiture](./investiture.md) $I^+$ into the position that carries scope $S$.
Before $I^+$: $A$ does not apply to $B$ with respect to $S$.
After $I^+$: $A$ applies and cannot be suspended short of $I^-$ (formal relief).
Physical absence, incapacitation, or delegation does not suspend $A$.

4. **Scope-exclusivity**: within $S$, only $B$ is accountable under this instance of $\mathcal{Ac}$.
Other parties may have duties, may face sanctions, and may be blamed — but accountability in the formal sense (the total function $A$) belongs to $B$ alone for $S$.
Two parties cannot share one accountability without it being undefined which one is answerable for which outcome.

## Accountability vs. adjacent concepts

The precision of accountability requires distinguishing it from several adjacent concepts with which it is routinely confused:

**Accountability vs. Duty.** A [Duty](./duty.md) is forward-looking: $B$ must perform act $\varphi$ by deadline $\tau$.
Accountability is backward-looking: $B$ is answerable for outcome $o$ that has already occurred or will occur.
Duty says what $B$ must do; accountability says who is answerable for what happened.
A duty can be discharged; accountability cannot be discharged — it persists through the outcome's entire causal history.
An officer can fully discharge every duty and still be held accountable for an outcome caused by a subordinate's failure.

**Accountability vs. Responsibility.** Responsibility is causal and moral: $B$ is responsible for $o$ if and only if $B$'s act caused $o$ and $B$ had the relevant intention or recklessness.
Responsibility can be absent when causation is absent.
Accountability is positional: $B$ is accountable for $o$ if and only if $o \in \mathrm{Outcomes}(S)$, regardless of causation.
A captain is accountable for a navigation error made by a subordinate watchstander, even if the captain was asleep.
The captain did not cause it; the captain is still accountable for it.

**Accountability vs. Liability.** [HohfeldianPosition](../../../../services/hohfeldian-services-section/content/text/glossary/terms/hohfeldian-position.md) Liability is the condition of having one's normative position alterable by another's power — it is a second-quartet position.
Legal liability (exposure to suit, penalty, or remedy) is a consequence of breach or wrongdoing.
Accountability is the pre-breach condition: the position that generates liability when outcomes are bad.
Being accountable is what makes one *liable to be held accountable* if outcomes are poor.

**Accountability vs. Blame.** Blame is a reactive attitude — a normative emotion expressed toward a party.
Accountability is a structural position — a formal assignment of answerability.
Blame may be appropriate even where formal accountability is absent (a bystander who could have helped); accountability may hold where blame would be inappropriate (a commanding officer whose unit failed despite all reasonable measures).

## Nuclear reading

**Definitions.** The **accountability proposition** at history $t$ is:

$$\mathrm{Ac}(B, o, t) \;=\; R_{\mathcal{Ac}}\!\bigl(\iota(B, O_S, t_0),\; \mathrm{out}(o, t)\bigr) \;\in\; H_t$$

where $\iota(B, O_S, t_0) \in H_t$ is the investiture record — the settled proposition that $B$ was installed in office $O_S$ at $t_0 \leq t$ — $\mathrm{out}(o, t) \in H_t$ is the proposition that $o$ is a scope-$S$ outcome at $t$, and $R_{\mathcal{Ac}}$ is the constitutive rule ([Constitution](./constitution.md)) that installation in $O_S$ makes one accountable for scope-$S$ outcomes.

$R_{\mathcal{Ac}}$ is a **natural transformation**: it commutes with all restriction maps of the presheaf. This means $\rho^*_{t't}(R_{\mathcal{Ac}}(a, b)) = R_{\mathcal{Ac}}(\rho^*_{t't}(a), \rho^*_{t't}(b))$ for all one-step extensions $t' \geq t$.

**Proposition 1 (Accountability proposition is doubly stable when the investiture is doubly stable):** If $\iota(B, O_S, t_0) \in H^*_t$, then $\mathrm{Ac}(B, o, t) \in H^*_t$ for all $o \in \mathrm{Outcomes}(S)$.

*Proof.* Since $\sigma_t$ is determined by restriction maps and $R_{\mathcal{Ac}}$ commutes with restriction maps (naturality), the restriction profile of $\mathrm{Ac}(B, o, t)$ across all $t_0 < t$ is constituted by the profile of $\iota(B, O_S, t_0)$ and $\mathrm{out}(o, t)$ through $R_{\mathcal{Ac}}$. If $\iota(B, O_S, t_0) \in \mathrm{Fix}(\sigma_t)$, then the restriction profile of $\iota$ already constitutes $\iota$ as $\sigma_t$-settled. The naturality of $R_{\mathcal{Ac}}$ then implies the restriction profile of $\mathrm{Ac}(B, o, t)$ is likewise constituted as $\sigma_t$-settled: $\sigma_t(\mathrm{Ac}(B, o, t)) = \mathrm{Ac}(B, o, t)$.

For $\Delta_t$: $\Delta_t(\mathrm{Ac}(B, o, t)) = \mathrm{Ac}(B, o, t)$ iff the accountability proposition is in the image of every one-step forward extension restriction. Since $\iota(B, O_S, t_0) \in \mathrm{Fix}(\Delta_t)$ (investiture records are globally stable: settled at $t_0$ and in the image of every forward restriction until $I^-$) and $R_{\mathcal{Ac}}$ commutes with restriction maps, $\mathrm{Ac}(B, o, t)$ is in the image of every one-step forward extension restriction. Therefore $\mathrm{Ac}(B, o, t) \in \mathrm{Fix}(\Delta_t)$.

Together: $\mathrm{Ac}(B, o, t) \in H^*_t$. $\square$

*Consequence.* For all $t \in T_S$ with $t \geq t_0$: the entire scope $\mathrm{Outcomes}(S)$ is $\mathrm{Ac}$-covered at $t$. The totality invariant holds at every history in $T_S$.

**Proposition 2 (Immutability — acts at $t$ do not modify $\sigma_t$ or $\Delta_t$):** No act at history $t$ — delegation, assignment, order — modifies $\sigma_t$ or $\Delta_t$. Such acts are history steps $s$ generating $t' = s \star t$; the nuclei at $t$ are determined by the restriction maps of the presheaf up to $t$, unchanged by steps at $t$.

*Proof.* $\sigma_t$ is determined by the restriction maps $H(i_{t_0, t})$ for $t_0 < t$. A step $s$ at $t$ extends the presheaf diagram above $t$ without modifying the existing morphisms. $\square$

**Proposition 3 (Non-delegability):** A delegation step $s_\delta$ generates a new history $t' = s_\delta \star t$. At $t'$:

$$\mathrm{Ac}(B, o, t') = R_{\mathcal{Ac}}\!\bigl(\iota(B, O_S, t_0),\; \mathrm{out}(o, t')\bigr)$$

and $\mathrm{Ac}(B, o, t') \in H^*_{t'}$.

*Proof.* The delegation step adds the delegation record $\delta$ to the fiber $H_{t'}$. The constitutive rule $R_{\mathcal{Ac}}$ takes as inputs the investiture record $\iota(B, O_S, t_0)$ and the outcome proposition — $\delta$ is neither of these inputs and appears in neither. By the naturality of $R_{\mathcal{Ac}}$, the restriction-profile class of $\iota(B, O_S, t_0)$ at $t'$ remains settled (delegation does not retract the investiture), so $\iota(B, O_S, t_0) \in \mathrm{Fix}(\sigma_{t'})$. By Proposition 1 applied at $t'$: $\mathrm{Ac}(B, o, t') \in H^*_{t'}$. $\square$

*Note.* The non-delegability result does not rest on "$\sigma_t$ not reading the authority sub-fiber" — an imprecise formulation that anthropomorphizes the nucleus. The correct statement: $R_{\mathcal{Ac}}$ has no clause taking a delegation record as input; $\sigma_{t'}$ is determined by restriction profiles; the restriction profile of $\mathrm{Ac}$ at $t'$ is determined by $\iota$ and $R_{\mathcal{Ac}}$, neither of which involves $\delta$.

**Proposition 4 (Conjunction of accountability propositions is doubly stable):** If $\mathrm{Ac}(B, o_1, t), \mathrm{Ac}(B, o_2, t) \in H^*_t$, then $\mathrm{Ac}(B, o_1, t) \wedge \mathrm{Ac}(B, o_2, t) \in H^*_t$.

*Proof.* By meet-preservation of $\sigma_t$ and $\Delta_t$: $\sigma_t(a \wedge b) = \sigma_t(a) \wedge \sigma_t(b)$ and $\Delta_t(a \wedge b) = \Delta_t(a) \wedge \Delta_t(b)$. $\square$

**Global section.** Define the accountability presheaf $\mathcal{A}^B : T_S^{\mathrm{op}} \to \mathbf{Set}$ by $\mathcal{A}^B_t = \{o \in H_t : \mathrm{Ac}(B, o, t) \in H^*_t\}$, with restriction maps $\rho^*_{t't} : \mathcal{A}^B_t \to \mathcal{A}^B_{t'}$ given by fiber restriction on outcomes. The accountability function $A$ is a **global section** of $\mathcal{A}^B$ over $T_S$: the assignment $t \mapsto \mathrm{Outcomes}(S) \cap H_t$ is compatible with all restriction maps, because $\rho^*_{t't}(\mathrm{Ac}(B, o, t)) = \mathrm{Ac}(B, \rho^*_{t't}(o), t')$ by naturality of $R_{\mathcal{Ac}}$. The totality invariant is the global section condition: every outcome at every history in $T_S$ is in $\mathcal{A}^B_t$, and these local assignments cohere.

**Breach.** When $B'$'s act $\varphi'$ has a non-trivial gap for an outcome within $S$: the gap is a fact in $H_{t'}$ (the act sub-fiber). The accountability presheaf $\mathcal{A}^B$ is unchanged — $\mathrm{Ac}(B, o, t') \in H^*_{t'}$ still holds. What the accountability structure determines is that the normative consequences of the gap attach to $B$'s answerability, not $B'$'s, for scope-$S$ outcomes.

## Accountability and the captain

The [Captain](../../../../../../../military-science-services-section/content/text/glossary/terms/captain.md) holds the most complete accountability structure in any vessel: $A$ is total over $\mathrm{Outcomes}(S)$ with no exceptions, installation-anchored, non-transferable, and scope-exclusive.
The captain is the limiting case because:

1. Scope singularity: exactly one captain per scope $S$, so $A$ is unambiguously total
2. Anti-override authority: the captain's decisions within $\Pi \subseteq S$ cannot be overridden, so the captain cannot claim their accountability is diminished by external interference within $\Pi$
3. Non-delegable duties: certain duties in $\Lambda$ cannot be delegated, so the accountability for those acts is even more tightly coupled — neither the authority nor the accountability can be passed down

The duty officer's accountability is bounded: it applies only to $\mathrm{Outcomes}(W)$ (outcomes during watch interval $W$) and terminates at $I^-$ (watch relief).
The duty officer's accountability is a restriction of the captain's accountability to the watch interval.

## Open questions

- Whether accountability can be *shared* — whether two parties can both hold $(B_1, S, A_1)$ and $(B_2, S, A_2)$ with $A_1, A_2 : \mathrm{Outcomes}(S) \to \{B_1, B_2\}$ respectively, and whether shared accountability generates any coherent normative structure or whether it collapses to no accountability (diffusion of responsibility).
- Whether the accountability function $A$ can be partially defined over time: beginning at $I^+$ and contracting as sub-scopes are delegated, or whether the totality invariant requires $A$ to be constant throughout the installation period.
- Whether accountability survives installation: once $B$ is relieved ($I^-$), does accountability for past outcomes in $S$ persist? In law, it does (past acts remain attributable to past commanders). Whether this requires $A$ to be defined over $\mathrm{Outcomes}(S) \times T_S$ (history-indexed) rather than just $\mathrm{Outcomes}(S)$.
