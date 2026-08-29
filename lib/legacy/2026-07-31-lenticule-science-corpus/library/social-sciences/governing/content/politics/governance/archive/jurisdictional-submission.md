---
id: jurisdictional-submission
description: "A JurisdictionalSubmission is a triple (G, A, S) — a party G, an authority A with jurisdiction J = (A, T_J, H_J, V), and a subject-matter scope S ⊆ H_J — such that G's act settles V_personal(t, G) = ⊤ for all matters in S, enabling σ^J_t to fix JV(A, φ, t) for φ ∈ S concerning G. The defining structure: submission is the act by which a party fills the personal-jurisdiction gap in V, converting a jurisdiction that has territorial and subject-matter scope but no personal authority over G into one that is complete with respect to G."
defines: JurisdictionalSubmission
related: Jurisdiction, JurisdictionalVires, JurisdictionalInvocation, Consent, HohfeldianPosition, Contract, Standing
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  submitting-party: person
  authority: relational-universe
  matter-scope: relational-universe
output: relational-history-fiber-proposition
ast:
  relational-history-saturating-nucleus:
    - submitting-party:
        - authority
        - matter-scope
    - authority:
        - submitting-party
        - matter-scope
---

# JurisdictionalSubmission

## Formal definition

A **JurisdictionalSubmission** is a triple $(G, A, S)$:

$$(G : \mathrm{Person},\; A : \mathrm{Authority},\; S \subseteq H_J)$$

where:
- $G$ is the **submitting party** — the party who consents to $A$'s jurisdiction; $G$ typically holds immunity from $A$'s jurisdiction by default (personal jurisdiction requires consent or presence) and submission is the act that lifts that immunity
- $A$ is the **authority** with jurisdiction $\mathcal{J} = (A, T_J, H_J, V)$ — the forum to which $G$ is consenting
- $S \subseteq H_J$ is the **matter-scope** — the specific sub-fiber within $A$'s subject-matter jurisdiction that the submission covers; $G$ may submit to personal jurisdiction for some matters and not others

**The submission act.** JurisdictionalSubmission is an act $\delta_{\mathrm{sub}} \in H^{\mathrm{sub}}_t$ that settles the personal jurisdiction component of $V$:

$$\delta_{\mathrm{sub}} \text{ settled} \;\Rightarrow\; V_{\mathrm{personal}}(t', G) = \top \quad \text{for all } t' \geq t, \varphi \in S$$

$V_{\mathrm{personal}}$ is the personal jurisdiction factor of the validity condition $V : T_J \times H_J \to \Omega$. When $V$ decomposes as $V = V_{\mathrm{territorial}} \wedge V_{\mathrm{personal}} \wedge V_{\mathrm{specific}}$, submission settles $V_{\mathrm{personal}}(t', G) = \top$ for the submitted scope $S$ — it does not affect the other factors.

**Four routes to personal jurisdiction.** JurisdictionalSubmission is one of four ways $V_{\mathrm{personal}}(t, G) = \top$ can be settled:

1. **Presence**: $G$ is physically within $T_J$ (territorial personal jurisdiction by presence)
2. **Domicile**: $G$ is domiciled within $T_J$'s geographic scope
3. **JurisdictionalSubmission**: $G$ explicitly consents to $A$'s jurisdiction for $S$
4. **Pre-existing relation**: $G$ holds a role or status that constitutively implies submission (an employee submits to their employer's authority over work matters; a member submits to their institution's authority)

Only submission (route 3) produces a new fiber element $\delta_{\mathrm{sub}} \in H^*_t$; the others are constitutive facts derivable from presence, domicile, or role-holding.

## What submission does and does not do

**JurisdictionalSubmission enables Case 1 of $\sigma^{\mathcal{J}}_t$.** Before submission, a matter $\varphi \in S$ concerning $G$ at history $t \in T_J$ may satisfy all conditions except $V_{\mathrm{personal}}(t, G) = \top$. The nucleus cannot fix $\mathrm{JV}(A, \varphi, t)$. After submission, $V_{\mathrm{personal}}$ is settled; the remaining conditions determine whether the matter proceeds.

**JurisdictionalSubmission does not expand subject-matter jurisdiction.** $G$'s submission to $A$ for matters $S$ does not give $A$ jurisdiction over matters outside $H_J$. JurisdictionalSubmission fills a gap in $V$; it cannot expand $T_J$ or $H_J$. An agreement between $G$ and $A$ purporting to give $A$ jurisdiction over matters outside $H_J$ is ultra vires as a matter of institutional design — the normative system that constitutes $A$ determines $H_J$, not $G$'s consent.

**JurisdictionalSubmission is not authority delegation.** [Delegation](delegation.md) transfers authority from $A$ to a subordinate. JurisdictionalSubmission transfers exposure from $G$'s immunity to $A$'s jurisdiction. The Hohfeldian positions are different: delegation exercises a power; submission waives an immunity.

## Nuclear reading

Submission is the act by which a party $G$ fills the personal-jurisdiction component of the validity condition $V$. At the nuclear level, the submission act is a fiber element $\delta_{\mathrm{sub}} \in H_t$ whose settlement in $\mathrm{Fix}(\sigma_t)$ represents $G$'s consent being genuinely established.

**Definition (submission as a fiber element).** The submission act $\delta_{\mathrm{sub}} \in H_t$ is the proposition "party $G$ has consented to authority $A$'s jurisdiction over matters in $S$ at $t$." The condition $\delta_{\mathrm{sub}} \in \mathrm{Fix}(\sigma_t)$ means the consent is past-saturated: it carries the same restriction profile to all sub-histories and no further saturation can enlarge it. This is a definition, not a theorem.

**Proposition 1 (submission does not expand Fix(σ_t) beyond H_J).** Suppose $\delta_{\mathrm{sub}} \in \mathrm{Fix}(\sigma_t)$ and let $\varphi \in H_t$ be a matter outside $H_J$ (the subject-matter scope of $\mathcal{J}$). The meet $\delta_{\mathrm{sub}} \wedge \varphi$ is an element of $H_t$. By extensiveness ($a \leq \sigma_t(a)$, see [Saturation Nucleus](../math/relational-history-fiber-saturating-nucleus.md)) and meet-preservation:

$$\sigma_t(\delta_{\mathrm{sub}} \wedge \varphi) = \sigma_t(\delta_{\mathrm{sub}}) \wedge \sigma_t(\varphi) = \delta_{\mathrm{sub}} \wedge \sigma_t(\varphi).$$

Whether $\delta_{\mathrm{sub}} \wedge \varphi \in \mathrm{Fix}(\sigma_t)$ depends on $\sigma_t(\varphi) = \varphi$, i.e., whether $\varphi$ itself is in $\mathrm{Fix}(\sigma_t)$. The nuclear axioms alone do not prevent $\varphi \notin H_J$ from being in $\mathrm{Fix}(\sigma_t)$. The scope restriction $\varphi \notin H_J$ is a structural condition on the jurisdiction, not a consequence of the nuclear axioms. This confirms: submission cannot expand subject-matter jurisdiction, but the reason is the scope-boundary axiom, not the nuclear axioms alone.

**Proposition 2 (settled submission conjoined with settled validity is settled).** If $\delta_{\mathrm{sub}} \in \mathrm{Fix}(\sigma_t)$ and $\mathrm{JV}(A, \varphi, t) = \mathrm{pos}(A, t) \wedge \varphi \in \mathrm{Fix}(\sigma_t)$, then $\delta_{\mathrm{sub}} \wedge \mathrm{JV}(A, \varphi, t) \in \mathrm{Fix}(\sigma_t)$.

*Proof.* By meet-preservation (see [Meet Preservation](../math/relational-history-fiber-nucleus-meet-preservation.md)):

$$\sigma_t(\delta_{\mathrm{sub}} \wedge \mathrm{JV}(A, \varphi, t)) = \sigma_t(\delta_{\mathrm{sub}}) \wedge \sigma_t(\mathrm{JV}(A, \varphi, t)) = \delta_{\mathrm{sub}} \wedge \mathrm{JV}(A, \varphi, t). \quad \square$$

The joint proposition "submission holds AND jurisdictional validity holds" is settled when each component is settled. This is the nuclear content of the claim that personal jurisdiction and subject-matter jurisdiction can both be satisfied simultaneously.

**Proposition 3 (idempotence: submission does not compound).** $\sigma_t(\sigma_t(\delta_{\mathrm{sub}})) = \sigma_t(\delta_{\mathrm{sub}})$.

*Proof.* Idempotence of $\sigma_t$ (see [Idempotence](../math/relational-history-fiber-nucleus-idempotence.md)) applied to $\delta_{\mathrm{sub}} \in H_t$. $\square$

Applying the saturation nucleus to a submission act twice is the same as applying it once. There is no "more submitted" beyond the first saturation. A submission either reaches $\mathrm{Fix}(\sigma_t)$ or it does not; there is no progressive approach.

**What is not derivable from the nuclear axioms alone.** The claims that submission is irrevocable mid-proceeding, that it persists at all $t' \geq t$, and that $G$ cannot withdraw consent once a matter is active are not consequences of the nuclear axioms. Irrevocability is a claim about the transfer nucleus: $\delta_{\mathrm{sub}} \in \mathrm{Fix}(\Delta_t)$, meaning for every $s \perp t$ there exists $b \in H_{s \star t}$ with $H(i_{s,t})(b) = \delta_{\mathrm{sub}}$ (see [Transfer Nucleus](../math/relational-history-fiber-transferring-nucleus.md)). Whether $\delta_{\mathrm{sub}} \in \mathrm{Fix}(\Delta_t)$ is not derivable from the nuclear axioms; it depends on the extension structure of the fiber bundle and must be given as a structural property of the submission act. The commutation axiom $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ (see [Commutation](../math/relational-history-fiber-nucleus-commutation.md)) ensures the two conditions are compatible, but does not establish that $\delta_{\mathrm{sub}}$ satisfies both.

**Remark (scope boundary of submission).** The submission act $\delta_{\mathrm{sub}}$ is defined for matters $\varphi \in S$. For $\varphi \notin S$, there is no submission proposition in the fiber — $\delta_{\mathrm{sub}}$ simply does not exist for that matter. This is not a statement about $\sigma_t$ failing to fix an existing element; it is a statement about which propositions exist in $H_t$. The nuclear axioms do not govern what propositions exist; they govern the closure structure of the propositions that do exist.

## Open questions

- Whether submission to one forum implicitly submits to its appellate hierarchy — whether $G$'s submission to $A$ implies submission to $A^+$ (the authority that reviews $A$'s decisions). This would be submission-upward-closure, a sheaf condition on the forum hierarchy.
- Whether submission can be conditional: $G$ submits to $A$'s jurisdiction only if $A$ applies rule $R$. The formal question: can $V_{\mathrm{personal}}(t, G)$ be conditioned on the normative system $\mathcal{N}$ applying a specific rule, making submission a biconditional settlement rather than a one-way waiver.
