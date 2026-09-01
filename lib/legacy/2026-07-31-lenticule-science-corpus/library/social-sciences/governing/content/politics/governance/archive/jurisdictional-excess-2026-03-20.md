---

title: "JurisdictionalExcess"
description: "JurisdictionalExcess is a triple (B, J, φ) — an officer B, a full jurisdiction J = (A, T_J, H_J, V), and an act φ — where Q_vires(φ, A, t) = 1 (φ is intra vires within J) but Q_vires(φ, B, t) = 0 (φ falls outside B's personal sub-jurisdiction Z = J|_B). The defining structure: excess is the gap between the full jurisdiction's nuclear domain and the officer's delegated sub-domain. The act is valid — it creates duties — but B has exceeded the scope of their authority, acquiring a duty to the principal for the transgression."
date-created: 2026-03-20
---

## Formal definition

**JurisdictionalExcess** is the triple $(B, \mathcal{J}, \varphi)$:

$$(B : \mathrm{Officer},\; \mathcal{J} = (A, T_J, H_J, V) : \mathrm{Jurisdiction},\; \varphi \in H_t)$$

where the **excess condition** holds:

$$Q_{\mathrm{vires}}(\varphi, A, t) = 1 \;\wedge\; Q_{\mathrm{vires}}(\varphi, B, t) = 0$$

$\varphi$ is intra vires within the full jurisdiction $\mathcal{J}$ but outside $B$'s personal sub-jurisdiction $Z = \mathcal{J}|_B$.

**Sub-jurisdiction.** $Z = \mathcal{J}|_B = (B, T_J \cap T_B, H_J \cap H_B, V|_{T_B \times H_B})$ is the restriction of $\mathcal{J}$ to $B$'s temporal scope $T_B$ and fiber scope $H_B$, from [Jurisdiction](./jurisdiction.md) §Delegation. $B$ holds second-quartet Hohfeldian Powers within $Z$ and lacks them outside it, even within $\mathcal{J}$.

**Three ways $B$ acts in excess:**

1. **Territorial excess**: $t \in T_J$ but $t \notin T_B$ — $B$ issues instructions outside their temporal or geographic window (e.g., a duty officer who acts during another officer's watch period)
2. **Subject-matter excess**: $\varphi \in H_J$ but $\varphi \notin H_B$ — $B$ acts on a type of matter outside their delegated subject-matter scope (e.g., a logistics officer issuing operational orders)
3. **Validity excess**: $V(t, \varphi) = \top$ but $V|_{T_B \times H_B}(t, \varphi) = \bot$ — $\varphi$ satisfies $\mathcal{J}$'s validity predicate but fails $B$'s sub-jurisdiction validity predicate (e.g., an act that requires principal's countersignature)

## JurisdictionalExcess vs. ultra vires

|  | $Q_{\mathrm{vires}}(\varphi, A, t)$ | $Q_{\mathrm{vires}}(\varphi, B, t)$ | Duty created? | Violation |
|---|---|---|---|---|
| **Intra vires** | 1 | 1 | Yes | None |
| **JurisdictionalExcess** | 1 | 0 | Yes (within $\mathcal{J}$) | Insubordination |
| **Ultra vires** | 0 | 0 | No | Void act |

The key asymmetry: excess creates valid duties. The third party receiving $B$'s instruction is bound — their duty arises from $\mathcal{J}$, not from $Z$. What $B$ has violated is $B$'s duty to the principal $A$: $B$ is unauthorized, not invalid.

This is why "I was just following orders" and "the order was unauthorized" are different normative situations: if $B$'s order was in excess, it creates a duty in the target; if it was ultra vires, it creates no duty. The target who obeys an excess order is not acting wrongly toward $\mathcal{J}$; the target who obeys an ultra vires order may be.

## Nuclear reading

The excess condition involves two fiber elements in $H_t$: $\mathrm{pos}(A, t)$ (the positional authority of the full jurisdiction holder $A$) and $\mathrm{pos}(B, t)$ (the positional authority of the delegate $B$ within sub-jurisdiction $Z$). Both are propositions in the fiber Heyting algebra.

**Definition (excess in terms of Fix(σ_t)).** The excess condition $Q_{\mathrm{vires}}(\varphi, A, t) = 1 \wedge Q_{\mathrm{vires}}(\varphi, B, t) = 0$ translates, using the definition from [JurisdictionalVires](./jurisdictional-vires.md), to:

$$\mathrm{pos}(A, t) \wedge \varphi \in \mathrm{Fix}(\sigma_t) \quad \text{and} \quad \mathrm{pos}(B, t) \wedge \varphi \notin \mathrm{Fix}(\sigma_t).$$

This is a definition of the excess condition at the nuclear level; it does not require additional axioms to state.

**Proposition 1 (excess is compatible with σ_t axioms).** The simultaneous conditions $\mathrm{pos}(A,t) \wedge \varphi \in \mathrm{Fix}(\sigma_t)$ and $\mathrm{pos}(B,t) \wedge \varphi \notin \mathrm{Fix}(\sigma_t)$ are logically consistent with the nuclear axioms for $\sigma_t$, provided $\mathrm{pos}(B, t) \wedge \varphi < \mathrm{pos}(A, t) \wedge \varphi$ in $H_t$.

*Proof.* The meet-preservation axiom says $\sigma_t(a \wedge b) = \sigma_t(a) \wedge \sigma_t(b)$ for all $a, b \in H_t$ (see [Meet Preservation](../../humanities/theories/math/relational-history-fiber-nucleus-meet-preservation.md)). Suppose $\mathrm{pos}(A,t) \in \mathrm{Fix}(\sigma_t)$ and $\varphi \in \mathrm{Fix}(\sigma_t)$; then $\mathrm{pos}(A,t) \wedge \varphi \in \mathrm{Fix}(\sigma_t)$ (by meet-preservation). Now suppose $\mathrm{pos}(B, t) < \mathrm{pos}(A, t)$ (the delegate's positional authority is strictly weaker) and $\mathrm{pos}(B, t) \notin \mathrm{Fix}(\sigma_t)$, so $\sigma_t(\mathrm{pos}(B, t)) > \mathrm{pos}(B, t)$. Then:

$$\sigma_t(\mathrm{pos}(B,t) \wedge \varphi) = \sigma_t(\mathrm{pos}(B,t)) \wedge \sigma_t(\varphi) = \sigma_t(\mathrm{pos}(B,t)) \wedge \varphi > \mathrm{pos}(B,t) \wedge \varphi,$$

so $\mathrm{pos}(B,t) \wedge \varphi \notin \mathrm{Fix}(\sigma_t)$. The two conditions are simultaneously satisfiable. $\square$

**Proposition 2 (Fix(σ_t) is closed under the meet of valid elements).** If $\mathrm{pos}(A,t) \wedge \varphi \in \mathrm{Fix}(\sigma_t)$, then for any $\psi \in \mathrm{Fix}(\sigma_t)$, $(\mathrm{pos}(A,t) \wedge \varphi) \wedge \psi \in \mathrm{Fix}(\sigma_t)$.

*Proof.* Direct application of meet-preservation: $\sigma_t((\mathrm{pos}(A,t) \wedge \varphi) \wedge \psi) = \sigma_t(\mathrm{pos}(A,t) \wedge \varphi) \wedge \sigma_t(\psi) = (\mathrm{pos}(A,t) \wedge \varphi) \wedge \psi$. $\square$

This means: valid acts within $\mathcal{J}$ remain valid when conjoined with other settled propositions. The excess act's settled status within $\mathcal{J}$ is robust under conjunction with settled facts.

**What is not derivable from the nuclear axioms alone.** The claim that an excess act "creates a valid duty" — i.e., that $\mathrm{pos}(A,t) \wedge \varphi \in \mathrm{Fix}(\sigma_t)$ implies a duty for the target party — is not a consequence of the nuclear axioms. The nuclear axioms tell us about the closure structure of $\mathrm{Fix}(\sigma_t)$; they do not interpret elements of $\mathrm{Fix}(\sigma_t)$ as duties. The duty-creation interpretation requires an additional axiom connecting settled propositions in particular sub-fibers to Hohfeldian normative positions. This is not derivable and must be stipulated.

Similarly, the claim that $B$ acquires a new duty to $A$ for the excess is not derivable from the nuclear axioms. It requires the additional normative structure specifying that violation of a delegated scope constraint generates accountability obligations. The nuclear axioms establish only the fixed-point structure.

**Remark (the excess fact in H*_t requires scope-boundary axiom).** The expression $\mathrm{Exc}(B, \varphi, t)$ — the excess as a settled fiber element — can be defined as $\mathrm{pos}(A,t) \wedge \varphi \wedge \neg(\mathrm{pos}(B,t) \wedge \varphi)$ in the Heyting algebra (using Heyting negation $\neg$). That this element belongs to $\mathrm{Fix}(\sigma_t)$ given the hypotheses of Proposition 1 would follow from meet-preservation only if $\neg(\mathrm{pos}(B,t) \wedge \varphi) \in \mathrm{Fix}(\sigma_t)$. Whether the nucleus commutes with Heyting negation in this way is not guaranteed by the three nuclear axioms (extensiveness, idempotence, meet-preservation); it requires an additional property. This is an open point.

## JurisdictionalExcess and judgment

In the [Judgment](../../../terms/judgment.md) structure, the officer's zone $Z$ is the sub-jurisdiction within which discretionary authority is exercised. An act $\alpha \notin Z$ but $\alpha \in \mathcal{J}$ is excess: the officer made a judgment call outside their zone. The act may have been correct (the right outcome for the situation) while still being insubordinate (outside the zone). Correctness of outcome and authorization of process are separate assessments.

## Open questions

- Whether excess is a continuous quality rather than binary: whether the degree to which $\varphi$ falls outside $Z$ (how far outside $T_B$ or $H_B$) constitutes a graded violation, or whether all excess is equally insubordinate regardless of degree.
- Whether ratification — a principal $A$ subsequently endorsing $B$'s excess act — retroactively converts the excess into an intra vires act: whether $\sigma^Z_t$ can be retroactively applied with a new domain that includes $\varphi$, or whether the ratification creates a new act rather than validating the old one.
