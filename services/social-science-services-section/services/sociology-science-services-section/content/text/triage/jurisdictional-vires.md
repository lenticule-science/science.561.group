---
id: jurisdictional-vires
description: "JurisdictionalVires is a quality Q_vires(φ, A, t) ∈ {0,1} — the quality of an act φ relative to authority A at history t — where Q_vires = 1 (intra vires) iff JV(A, φ, t) ∈ H*_t: all four jurisdiction conditions hold simultaneously. Q_vires = 0 (ultra vires) whenever any condition fails. The defining structure: vires is the natural transformation that evaluates whether φ has a settled path through A's jurisdictional nucleus. It is a quality of the act, not of the authority — the same authority A may be intra vires on one act and ultra vires on another at the same history."
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  act: relational-history-fiber-proposition
  authority: relational-universe
  history: relational-history
output: relational-history-fiber-proposition
ast:
  relational-history-saturating-nucleus:
    - act:
        - authority
        - history
    - authority:
        - act
        - history
---

# JurisdictionalVires

## Formal definition

**JurisdictionalVires** is the quality $Q_{\mathrm{vires}} : \mathrm{ActClass} \times \mathrm{Authority} \times T \to \{0, 1\}$ defined by:

$$Q_{\mathrm{vires}}(\varphi, A, t) = \begin{cases} 1 & \text{if } \mathrm{JV}(A, \varphi, t) \in H^{*\mathcal{J}}_t \\ 0 & \text{otherwise} \end{cases}$$

where $\mathrm{JV}(A, \varphi, t) = R_{\mathcal{J}}(\mathrm{pos}(A, t), \varphi, V(t, \varphi))$ is the jurisdictional validity proposition from [Jurisdiction](./jurisdiction.md).

$Q_{\mathrm{vires}} = 1$ is called **intra vires** ("within the powers"). $Q_{\mathrm{vires}} = 0$ is called **ultra vires** ("beyond the powers").

**Intra vires iff all four hold simultaneously:**

1. $t \in T_J$ — territorial/temporal scope: the act occurs within the jurisdiction's history sub-site
2. $\varphi \in H_J$ — subject-matter scope: the act is of a type within the jurisdiction's sub-fiber
3. $V(t, \varphi) = \top$ — validity condition: the act satisfies the jurisdiction's specific validity predicate
4. $\mathrm{pos}(A, t) \in \mathrm{Fix}(\sigma_t)$ — positional authority: $A$ actually holds the relevant Hohfeldian Power at $t$

**Four ultra vires failure modes.** Each corresponds to one condition's failure:

| Failure | Formal condition | Name |
|---|---|---|
| $t \notin T_J$ | Territorial/temporal scope fails | Ultra vires by territory |
| $\varphi \notin H_J$ | Subject-matter scope fails | Ultra vires by subject-matter |
| $V(t, \varphi) = \bot$ | Validity condition fails | Ultra vires by validity |
| $\mathrm{pos}(A, t) \notin \mathrm{Fix}(\sigma_t)$ | Positional authority unsettled | Ultra vires by want of authority |

These are not mutually exclusive: an act can fail on multiple conditions simultaneously.

## JurisdictionalVires vs. excess

**JurisdictionalVires** measures whether an act is within $A$'s full jurisdiction $\mathcal{J}$. **[JurisdictionalExcess](./jurisdictional-excess.md)** is the condition of being intra vires within $\mathcal{J}$ but outside an officer's personal sub-jurisdiction $Z = \mathcal{J}|_B$:

$$\mathrm{JurisdictionalExcess}(B, \varphi, t) \iff Q_{\mathrm{vires}}(\varphi, A, t) = 1 \;\wedge\; Q_{\mathrm{vires}}(\varphi, B, t) = 0$$

JurisdictionalExcess is insubordination, not invalidity. An act in excess of sub-jurisdiction creates valid duties within $\mathcal{J}$ but $B$ violated their standing orders in issuing it. An ultra vires act creates no duties at all — it is a dead letter.

## Nuclear reading

Using the nuclear axioms for $\sigma_t$ and $\Delta_t$ on $H_t$, and the definition $\mathrm{JV}(A, \varphi, t) := \mathrm{pos}(A, t) \wedge \varphi$ from [Jurisdiction](./jurisdiction.md):

**Definition (intra vires and ultra vires).** $Q_{\mathrm{vires}}(\varphi, A, t) = 1$ iff $\mathrm{JV}(A, \varphi, t) \in \mathrm{Fix}(\sigma_t)$. $Q_{\mathrm{vires}}(\varphi, A, t) = 0$ otherwise. This is a definition, naming the fixed-point condition.

**Proposition 1 (ultra vires acts remain in H_t but not in Fix(σ_t)).** For any $\varphi \in H_t$, the extensiveness axiom $\varphi \leq \sigma_t(\varphi)$ (see [Saturation Nucleus](../math/relational-history-fiber-saturating-nucleus.md)) gives $\sigma_t(\varphi) \geq \varphi$, so $\varphi$ is always a valid element of $H_t$. The condition $Q_{\mathrm{vires}} = 0$ does not remove $\varphi$ from $H_t$; it asserts $\sigma_t(\varphi) > \varphi$, i.e., $\varphi$ is not yet saturated. The act exists in the fiber as an unsettled element.

*Proof.* Extensiveness: $a \leq \sigma_t(a)$ for all $a \in H_t$. So $\varphi \in H_t$ regardless of the value of $\sigma_t(\varphi)$. The membership condition $\varphi \in \mathrm{Fix}(\sigma_t)$ is the additional requirement $\sigma_t(\varphi) = \varphi$, which may or may not hold. $\square$

**Proposition 2 (intra vires conjunction).** If $Q_{\mathrm{vires}}(\varphi_1, A, t) = 1$ and $Q_{\mathrm{vires}}(\varphi_2, A, t) = 1$, then $Q_{\mathrm{vires}}(\varphi_1 \wedge \varphi_2, A, t) = 1$, provided $\mathrm{pos}(A, t) \in \mathrm{Fix}(\sigma_t)$.

*Proof.* By hypothesis and definition, $\mathrm{JV}(A, \varphi_1, t) = \mathrm{pos}(A,t) \wedge \varphi_1 \in \mathrm{Fix}(\sigma_t)$ and $\mathrm{JV}(A, \varphi_2, t) = \mathrm{pos}(A,t) \wedge \varphi_2 \in \mathrm{Fix}(\sigma_t)$. By meet-preservation of $\sigma_t$ (see [Meet Preservation](../math/relational-history-fiber-nucleus-meet-preservation.md)):

$$\sigma_t((\mathrm{pos}(A,t) \wedge \varphi_1) \wedge (\mathrm{pos}(A,t) \wedge \varphi_2)) = \sigma_t(\mathrm{pos}(A,t) \wedge \varphi_1) \wedge \sigma_t(\mathrm{pos}(A,t) \wedge \varphi_2).$$

Since both terms on the right equal themselves, the meet equals $(\mathrm{pos}(A,t) \wedge \varphi_1) \wedge (\mathrm{pos}(A,t) \wedge \varphi_2) = \mathrm{pos}(A,t) \wedge (\varphi_1 \wedge \varphi_2) = \mathrm{JV}(A, \varphi_1 \wedge \varphi_2, t)$. So $\mathrm{JV}(A, \varphi_1 \wedge \varphi_2, t) \in \mathrm{Fix}(\sigma_t)$, giving $Q_{\mathrm{vires}}(\varphi_1 \wedge \varphi_2, A, t) = 1$. $\square$

**Proposition 3 (idempotence: vires quality does not iterate).** For any $\varphi \in H_t$, $\sigma_t(\sigma_t(\varphi)) = \sigma_t(\varphi)$ (see [Idempotence](../math/relational-history-fiber-nucleus-idempotence.md)). Consequently: if $Q_{\mathrm{vires}}(\varphi, A, t) = 0$, applying $\sigma_t$ once produces $\sigma_t(\varphi)$; applying it again produces the same element. The nucleus does not "creep" toward $\varphi$ over multiple applications — the gap between $\varphi$ and $\sigma_t(\varphi)$ is fully resolved in one step, and the result is stable.

*Proof.* Direct application of the idempotence axiom to $\sigma_t(\varphi) \in H_t$: $\sigma_t(\sigma_t(\varphi)) = \sigma_t(\varphi)$. $\square$

**What is not derivable from the nuclear axioms alone.** The scope boundary for authority $A$ — which elements of $H_t$ are in $H^J_t$ (within $A$'s subject-matter and territorial scope) and which are outside it — is not determined by the axioms for $\sigma_t$ and $\Delta_t$. Those axioms apply uniformly to all elements of $H_t$. The claim that $A$'s acts can produce settled elements only within $H^J_t$ requires an additional scope-boundary axiom specifying the structural domain of $A$'s constitutive rule. Without that axiom, the nuclear axioms alone do not establish the ultra vires barrier. Any nuclear reading that treats "outside scope" as a derivable consequence of $\sigma_t$ alone is incorrect.

**Remark (transfer-stability of vires quality).** Whether $\mathrm{JV}(A, \varphi, t) \in \mathrm{Fix}(\Delta_t)$ holds — that is, whether the intra vires condition is transfer-stable — depends on whether for every $s \perp t$ there exists $b \in H_{s \star t}$ with $H(i_{s,t})(b) = \mathrm{JV}(A, \varphi, t)$ (see [Transfer Nucleus](../math/relational-history-fiber-transferring-nucleus.md)). The commutation axiom $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ (see [Commutation](../math/relational-history-fiber-nucleus-commutation.md)) ensures these conditions are compatible. But whether transfer-stability holds for a specific $\mathrm{JV}$ requires knowing the extension structure of the fiber bundle, which is not a consequence of the nuclear axioms alone.

## JurisdictionalVires and normative consequences

**Intra vires, good outcome**: the duty is created; the target is bound; accountability attaches to $A$ for the instruction.

**Intra vires, bad outcome (excess)**: the duty is created (valid within $\mathcal{J}$) but $B$ has exceeded $Z$; $B$ acquires a duty to the principal for the excess. The third party (duty-target) is still bound.

**Ultra vires**: no duty is created; the instruction is a dead letter; $A$ may have breached a duty (to not issue ultra vires instructions); depending on the normative system, the target party may be under no obligation to obey and may have a privilege to disregard.

## Open questions

- Whether $Q_{\mathrm{vires}}$ is monotone in authority hierarchy: if $A_1 \prec A_2$ (A_1 is subordinate to A_2) and $Q_{\mathrm{vires}}(\varphi, A_1, t) = 1$, does $Q_{\mathrm{vires}}(\varphi, A_2, t) = 1$? This would mean superior authorities are always at least as broadly empowered as subordinates — not obviously true if subject-matter jurisdiction is partitioned rather than nested.
- Whether a partially ultra vires act can be severed: if $\varphi = \varphi_1 \wedge \varphi_2$ with $Q_{\mathrm{vires}}(\varphi_1, A, t) = 1$ and $Q_{\mathrm{vires}}(\varphi_2, A, t) = 0$, is $\varphi_1$ a valid intra vires instruction independently? This is the severability doctrine; it requires the Heyting algebra to support decomposition of instructions.

## Consolidated material from jurisdictional-vires-2026-03-20.md

---

title: "JurisdictionalVires"
description: "JurisdictionalVires is a quality Q_vires(φ, A, t) ∈ {0,1} — the quality of an act φ relative to authority A at history t — where Q_vires = 1 (intra vires) iff JV(A, φ, t) ∈ H*_t: all four jurisdiction conditions hold simultaneously. Q_vires = 0 (ultra vires) whenever any condition fails. The defining structure: vires is the natural transformation that evaluates whether φ has a settled path through A's jurisdictional nucleus. It is a quality of the act, not of the authority — the same authority A may be intra vires on one act and ultra vires on another at the same history."
defines: JurisdictionalVires
related: Jurisdiction, Act, JurisdictionalInvocation, JurisdictionalExcess, JurisdictionalDeclination, HohfeldianPosition, Standing
date-created: 2026-03-20
---

where $\mathrm{JV}(A, \varphi, t) = R_{\mathcal{J}}(\mathrm{pos}(A, t), \varphi, V(t, \varphi))$ is the jurisdictional validity proposition from [Jurisdiction](./jurisdiction.md).

**JurisdictionalVires** measures whether an act is within $A$'s full jurisdiction $\mathcal{J}$. **[JurisdictionalExcess](./jurisdictional-excess.md)** is the condition of being intra vires within $\mathcal{J}$ but outside an officer's personal sub-jurisdiction $Z = \mathcal{J}|_B$:

Using the nuclear axioms for $\sigma_t$ and $\Delta_t$ on $H_t$, and the definition $\mathrm{JV}(A, \varphi, t) := \mathrm{pos}(A, t) \wedge \varphi$ from [Jurisdiction](./jurisdiction.md):

**Proposition 1 (ultra vires acts remain in H_t but not in Fix(σ_t)).** For any $\varphi \in H_t$, the extensiveness axiom $\varphi \leq \sigma_t(\varphi)$ (see [Saturation Nucleus](../../humanities/theories/math/relational-history-fiber-saturating-nucleus.md)) gives $\sigma_t(\varphi) \geq \varphi$, so $\varphi$ is always a valid element of $H_t$. The condition $Q_{\mathrm{vires}} = 0$ does not remove $\varphi$ from $H_t$; it asserts $\sigma_t(\varphi) > \varphi$, i.e., $\varphi$ is not yet saturated. The act exists in the fiber as an unsettled element.

*Proof.* By hypothesis and definition, $\mathrm{JV}(A, \varphi_1, t) = \mathrm{pos}(A,t) \wedge \varphi_1 \in \mathrm{Fix}(\sigma_t)$ and $\mathrm{JV}(A, \varphi_2, t) = \mathrm{pos}(A,t) \wedge \varphi_2 \in \mathrm{Fix}(\sigma_t)$. By meet-preservation of $\sigma_t$ (see [Meet Preservation](../../humanities/theories/math/relational-history-fiber-nucleus-meet-preservation.md)):

**Proposition 3 (idempotence: vires quality does not iterate).** For any $\varphi \in H_t$, $\sigma_t(\sigma_t(\varphi)) = \sigma_t(\varphi)$ (see [Idempotence](../../humanities/theories/math/relational-history-fiber-nucleus-idempotence.md)). Consequently: if $Q_{\mathrm{vires}}(\varphi, A, t) = 0$, applying $\sigma_t$ once produces $\sigma_t(\varphi)$; applying it again produces the same element. The nucleus does not "creep" toward $\varphi$ over multiple applications — the gap between $\varphi$ and $\sigma_t(\varphi)$ is fully resolved in one step, and the result is stable.

**Remark (transfer-stability of vires quality).** Whether $\mathrm{JV}(A, \varphi, t) \in \mathrm{Fix}(\Delta_t)$ holds — that is, whether the intra vires condition is transfer-stable — depends on whether for every $s \perp t$ there exists $b \in H_{s \star t}$ with $H(i_{s,t})(b) = \mathrm{JV}(A, \varphi, t)$ (see [Transfer Nucleus](../../humanities/theories/math/relational-history-fiber-transferring-nucleus.md)). The commutation axiom $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ (see [Commutation](../../humanities/theories/math/relational-history-fiber-nucleus-commutation.md)) ensures these conditions are compatible. But whether transfer-stability holds for a specific $\mathrm{JV}$ requires knowing the extension structure of the fiber bundle, which is not a consequence of the nuclear axioms alone.
