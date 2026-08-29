---
id: jurisdictional-invocation
description: "A JurisdictionalInvocation is a triple (G, F, φ) — an invoker G with standing in F, a forum F with jurisdiction J = (A, T_J, H_J, V), and a matter φ — such that G's act introduces φ into F's nucleus domain H^J_t, enabling σ^J_t to evaluate JV(A, φ, t). Before invocation, φ exists as a fiber element in H_t but is not within F's active matter queue. After invocation, the forum must either fix JV(A, φ, t) ∈ H*_t (proceed) or return it to ⊥ (dismiss for want of jurisdiction)."
defines: JurisdictionalInvocation
related: Jurisdiction, Standing, Act, JurisdictionalVires, Dismissal, JurisdictionalDeclination, JurisdictionalSubmission, Forum
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  invoker: person
  forum: relational-universe
  matter: relational-history-fiber-proposition
output: relational-history-fiber-proposition
ast:
  relational-universe-morphism:
    - invoker:
        - forum
        - matter
    - matter:
        - invoker
        - forum
---

# JurisdictionalInvocation

## Formal definition

An **JurisdictionalInvocation** is a triple $(G, F, \varphi)$:

$$\mathcal{Inv} = (G : \mathrm{Person},\; F : \mathrm{Forum},\; \varphi \in H_t)$$

where: - $G$ is the **invoker** — the party introducing the matter; $G$ must hold assertive [Standing](standing.md) in $F$ for the act-class $\Phi$ that includes introducing matters of the type $\varphi$ - $F$ is the **forum** with jurisdiction $\mathcal{J} = (A, T_J, H_J, V)$ — the normative system whose nucleus $\sigma^{\mathcal{J}}_t$ is being requested to operate on $\varphi$ - $\varphi \in H_t$ is the **matter** — the fiber element being introduced; it exists in $H_t$ prior to invocation but is not in $F$'s sub-fiber $H^J_t$ until $G$'s act places it there

**The invocation act.** $G$'s invocation is a fiber element $\delta_{\mathrm{inv}} \in H^{\mathrm{inv}}_t$ — an element in the invocation sub-fiber — that satisfies:

$$\delta_{\mathrm{inv}} = \mathrm{Intro}(G, F, \varphi, t)$$

where $\mathrm{Intro}$ is the constitutive rule "invoker $G$ presenting matter $\varphi$ to forum $F$ at $t$ counts as $\varphi$ entering $F$'s active-matter queue $H^J_t$."
JurisdictionalInvocation is an act in the sense of [Act](act.md): it is authored by $G$, occurs at $t$, and produces a new settled element — $\varphi$ is now a pending matter within $H^J_t$.

**Effect on the forum's nucleus.** After invocation, the forum's saturation nucleus $\sigma^{\mathcal{J}}_t$ is obligated to evaluate $\mathrm{JV}(A, \varphi, t) = R_{\mathcal{J}}(\mathrm{pos}(A, t), \varphi, V(t, \varphi))$.
The nucleus must produce one of two outcomes:

1. **Proceed**: all four jurisdiction conditions hold — $t \in T_J$, $\varphi \in H_J$, $V(t, \varphi) = \top$, $\mathrm{pos}(A, t) \in \mathrm{Fix}(\sigma_t)$ — so $\mathrm{JV}(A, \varphi, t) \in H^{*\mathcal{J}}_t$.
  The matter is valid before the forum.
2. **Dismiss**: at least one condition fails. $\mathrm{JV}(A, \varphi, t) \notin H^{*\mathcal{J}}_t$.
  The matter is ultra vires; $F$ has no normative basis to act on it.
  The forum's nucleus fixes $\bot$ in the relevant sub-fiber.

**What invocation is not.** JurisdictionalInvocation does not enlarge $T_J$, $H_J$, or $V$.
It does not create jurisdiction.
It activates the evaluative machinery on a specific $\varphi$.
The jurisdiction either covers $\varphi$ or it does not; invocation forces the determination.

## Nuclear reading

The invocation act introduces a matter into the forum's potential domain.
At the nuclear level, the relevant object is the invocation proposition $\delta_{\mathrm{inv}} \in H_t$ and its relationship to $\mathrm{Fix}(\sigma_t)$.

**Definition (invocation act as a fiber element).** $\delta_{\mathrm{inv}} \in H_t$ is the proposition "invoker $G$ has presented matter $\varphi$ to forum $F$ at $t$."
The condition $\delta_{\mathrm{inv}} \in \mathrm{Fix}(\sigma_t)$ means the invocation is past-saturated: the act has been genuinely performed and is not merely asserted.
This is a definition.

**Proposition 1 (invocation and jurisdictional validity are independent fiber elements).** The elements $\delta_{\mathrm{inv}}$ and $\mathrm{JV}(A, \varphi, t) = \mathrm{pos}(A, t) \wedge \varphi$ are distinct elements of $H_t$.
Their relationship — specifically, whether $\delta_{\mathrm{inv}} \in \mathrm{Fix}(\sigma_t)$ implies $\mathrm{JV}(A, \varphi, t) \in \mathrm{Fix}(\sigma_t)$ — is not a consequence of the nuclear axioms alone.

*Proof.* The nuclear axioms (extensiveness, idempotence, meet-preservation) apply uniformly to all elements of $H_t$ and say nothing about implications between distinct elements.
Whether $\delta_{\mathrm{inv}} \leq \mathrm{JV}(A, \varphi, t)$ holds in the Heyting algebra, or whether $\delta_{\mathrm{inv}}$ implies $\mathrm{JV}(A, \varphi, t)$ as a Heyting implication, depends on the normative content encoded in $H_t$, not on the nuclear axioms. $\square$

**Proposition 2 (settled invocation and settled jurisdictional validity are jointly settled).** If $\delta_{\mathrm{inv}} \in \mathrm{Fix}(\sigma_t)$ and $\mathrm{JV}(A, \varphi, t) \in \mathrm{Fix}(\sigma_t)$, then $\delta_{\mathrm{inv}} \wedge \mathrm{JV}(A, \varphi, t) \in \mathrm{Fix}(\sigma_t)$.

*Proof.* By meet-preservation of $\sigma_t$ (see [Meet Preservation](../math/relational-history-fiber-nucleus-meet-preservation.md)):

$$\sigma_t(\delta_{\mathrm{inv}} \wedge \mathrm{JV}(A, \varphi, t)) = \sigma_t(\delta_{\mathrm{inv}}) \wedge \sigma_t(\mathrm{JV}(A, \varphi, t)) = \delta_{\mathrm{inv}} \wedge \mathrm{JV}(A, \varphi, t). \quad \square$$

When both the invocation is properly made and the jurisdictional conditions are met, the joint proposition is settled.
This is the nuclear content of "invocation accepted and jurisdiction confirmed" being a stable settled fact.

**Proposition 3 (the meet of invocation with dismissed matter).** If $\delta_{\mathrm{inv}} \in \mathrm{Fix}(\sigma_t)$ and $\mathrm{JV}(A, \varphi, t) \notin \mathrm{Fix}(\sigma_t)$ (jurisdiction is not established), then $\delta_{\mathrm{inv}} \wedge \mathrm{JV}(A, \varphi, t) \notin \mathrm{Fix}(\sigma_t)$.

*Proof.* By meet-preservation: $\sigma_t(\delta_{\mathrm{inv}} \wedge \mathrm{JV}(A, \varphi, t)) = \delta_{\mathrm{inv}} \wedge \sigma_t(\mathrm{JV}(A, \varphi, t))$.
Since $\mathrm{JV}(A, \varphi, t) \notin \mathrm{Fix}(\sigma_t)$, we have $\sigma_t(\mathrm{JV}(A, \varphi, t)) > \mathrm{JV}(A, \varphi, t)$ (by extensiveness, see [Saturation Nucleus](../math/relational-history-fiber-saturating-nucleus.md)).
Therefore $\delta_{\mathrm{inv}} \wedge \sigma_t(\mathrm{JV}(A, \varphi, t)) > \delta_{\mathrm{inv}} \wedge \mathrm{JV}(A, \varphi, t)$, so $\delta_{\mathrm{inv}} \wedge \mathrm{JV}(A, \varphi, t) \notin \mathrm{Fix}(\sigma_t)$. $\square$

This is the nuclear basis of dismissal: a proper invocation of a matter outside the forum's jurisdiction does not produce a settled acceptance.
The invocation is settled ($\delta_{\mathrm{inv}} \in \mathrm{Fix}(\sigma_t)$) but the jurisdictional validity proposition is not, and their meet is accordingly not settled.

**Proposition 4 (idempotence of invocation act).** $\sigma_t(\sigma_t(\delta_{\mathrm{inv}})) = \sigma_t(\delta_{\mathrm{inv}})$.

*Proof.* Idempotence of $\sigma_t$ (see [Idempotence](../math/relational-history-fiber-nucleus-idempotence.md)). $\square$

A valid invocation does not become "more invoked" under further saturation.
The act either enters $\mathrm{Fix}(\sigma_t)$ or it does not; there is no intermediate state.

**What is not derivable from the nuclear axioms alone.** The claim that invocation cannot be un-received — that once $\delta_{\mathrm{inv}} \in \mathrm{Fix}(\sigma_t)$ the forum is obligated to evaluate jurisdiction — is not a consequence of the nuclear axioms.
It requires an additional norm specifying that forums must respond to properly made invocations.
Similarly, the claim that $\delta_{\mathrm{inv}} \in \mathrm{Fix}(\Delta_t)$ (that the invocation is transfer-stable, persisting into all forward extensions) requires the extension-structure condition defining $\mathrm{Fix}(\Delta_t)$ (see [Transfer Nucleus](../math/relational-history-fiber-transferring-nucleus.md)), which is not derivable from the nuclear axioms alone.
Commutation of $\sigma_t$ and $\Delta_t$ (see [Commutation](../math/relational-history-fiber-nucleus-commutation.md)) ensures compatibility but does not establish the transfer-stability of $\delta_{\mathrm{inv}}$ in particular.

## JurisdictionalInvocation and multiple forums

A single matter $\varphi$ may be invoked before multiple forums $F_1, F_2$ simultaneously — generating invocation acts $\delta^1_{\mathrm{inv}}$ and $\delta^2_{\mathrm{inv}}$ in separate sub-fibers.
The resulting $\mathrm{JV}(A_1, \varphi, t)$ and $\mathrm{JV}(A_2, \varphi, t)$ may both be in $H^*_t$ (concurrent jurisdiction).
The conflict resolution rules from [NormConflict](norm-conflict.md) then determine which forum's resolution propagates as the authoritative $H^*_t$ settlement.

## Open questions

- Whether invocation is itself subject to dismissal: can the forum determine that $G$ lacks standing before evaluating whether it has jurisdiction over $\varphi$?
  This requires a two-stage nucleus evaluation: first $\sigma^{\mathrm{standing}}_t$ (processing standing), then $\sigma^{\mathcal{J}}_t$ (processing jurisdictional validity).
- Whether a forum can be obligated to receive an invocation — whether there is a meta-norm that requires forums to evaluate jurisdiction when properly invoked, or whether a forum can decline to receive the invocation before evaluating it (the "door is closed" refusal, distinct from dismissal for want of jurisdiction).
