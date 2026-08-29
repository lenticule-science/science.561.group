---

title: "Jurisdiction"
description: "Jurisdiction is a four-tuple (A, T_J, H_J, V) — an authority A, a sub-site T_J ⊆ T of the history monoid, a sub-fiber H_J ⊆ H|_{T_J} of the fiber bundle restricted to T_J, and a validity condition V — such that A's instructions create valid duties within T_J × H_J and have no normative force outside it. The defining structure: jurisdiction is a sub-topos of the full relational universe within which an authority's second-quartet powers are operative. Acts within jurisdiction propagate toward H*_t; acts outside it do not."
defines: Jurisdiction
related: Authority, HohfeldianPosition, Judgment, Instruction, Norm, NormativeSystem, Standing, Area, Delegation, Captain
date-created: 2026-03-20
---

## Formal definition

**Jurisdiction** is a four-tuple $\mathcal{J} = (A, T_J, H_J, V)$:

$$\mathcal{J} = (A : \mathrm{Authority},\; T_J \hookrightarrow T,\; H_J \hookrightarrow H|_{T_J},\; V : T_J \times H_J \to \Omega)$$

where: - $A$ is the **authority** — the party whose normative powers are operative within the jurisdiction; $A$ holds second-quartet Hohfeldian Powers within $(T_J, H_J)$ and lacks them outside it - $T_J \subseteq T$ is the **history sub-site** — the temporal/spatial/subject-matter scope of the jurisdiction; acts at histories $t \in T_J$ fall within jurisdiction; acts at $t \notin T_J$ do not; $T_J$ is equipped with the Grothendieck topology induced from $(T, J)$ - $H_J \subseteq H|_{T_J}$ is the **fiber sub-bundle** — the sub-fiber of the history fiber restricted to $T_J$ that the jurisdiction covers; not all of $H_t$ at $t \in T_J$ need be within jurisdiction — jurisdiction is typically restricted to a subject-matter sub-fiber (criminal matters, admiralty, equity) - $V : T_J \times H_J \to \Omega$ is the **validity condition** — the predicate that an act at $(t, a) \in T_J \times H_J$ satisfies in order to fall within $A$'s jurisdiction; acts that satisfy $V$ are jurisdictionally valid; those that fail $V$ are ultra vires

**Jurisdiction as sub-topos.** $\mathcal{J}$ corresponds to a sub-topos:

$$\mathbf{Sh}(T_J, J|_{T_J}) \hookrightarrow \mathbf{Sh}(T, J)$$

The inclusion is a geometric morphism — the fiber bundle over $T_J$ is a sub-sheaf of the full bundle.
Within this sub-topos, $A$'s nucleus $\sigma^A_t$ is operative: $A$'s acts propagate toward $H^{*A}_t$.
Outside it, $\sigma^A_t$ is not defined on the relevant elements.

## What this is

**Jurisdiction** is the formal structure of "where authority applies."
It is more precise than scope ([Area](../../../../../../../../philosophy/terms/area.md)) because it specifies not just a region but a sub-fiber within that region (subject-matter jurisdiction), a validity condition (the type of acts covered), and the embedding of that sub-structure into the full relational universe.

The intuition: an authority's normative powers do not operate on all of $H_t$ for all $t$.
A maritime court has jurisdiction over admiralty matters ($H_J$ = admiralty sub-fiber) at histories where maritime jurisdiction is invoked ($T_J$ = histories with maritime nexus).
Its orders are valid within this sub-topos; outside it, the orders are ultra vires regardless of the court's formal existence.

## Three jurisdiction types

**Personal jurisdiction** ($T_J$ determined by the subject's presence or consent): whether the authority can bind the specific person $G$.
The history sub-site $T_J$ is the set of histories where $G$ is present in or consented to the authority's domain.
Personal jurisdiction without subject-matter jurisdiction is insufficient for valid orders.

**Subject-matter jurisdiction** ($H_J$ determined by the type of claim): whether the authority can adjudicate or govern this type of matter. $H_J$ is the sub-fiber of propositions of the relevant type.
A probate court has subject-matter jurisdiction over estate matters; it lacks it over criminal conduct — the criminal-matter sub-fiber is outside $H_J$ even if the history $t \in T_J$.

**Territorial/temporal jurisdiction** (determined by $T_J$ directly): whether the authority's acts cover this place and time.
The history sub-site $T_J$ is a spatio-temporal region.
An authority's instructions at $t \in T_J$ propagate toward $H^*_{T_J}$; at $t \notin T_J$, the instructions do not create duties in the relevant fiber.

**Concurrent jurisdiction**: two authorities $A_1$ and $A_2$ both have jurisdiction at $(t, a) \in T_J \times H_J$ — their jurisdiction sub-topoi overlap.
This is the formal analog of overlapping legal systems (federal and state courts; maritime and domestic courts).
Conflict rules (lex posterior, lex superior, lex specialis) determine which authority's acts propagate toward $H^*_t$ when their orders conflict within the overlap.

## Jurisdiction and judgment

[Judgment](../../../terms/judgment.md) requires zone $Z$ — the scope within which the judging officer has discretionary authority.
Zone $Z$ is the jurisdiction restricted to the officer's personal scope: $Z = \mathcal{J}|_B = (B, T_J \cap T_B, H_J \cap H_B, V|_{T_B \times H_B})$ where $T_B$ and $H_B$ are the officer's temporal and fiber positions.
An act $\alpha$ within $Z$ is both within the officer's jurisdiction and within their discretionary scope; it is *intra vires* for the officer.

Excess of jurisdiction in judgment is the condition $\alpha \notin Z$: the officer acts within $\mathcal{J}$ (the authority's full jurisdiction) but outside $Z$ (the officer's personal sub-jurisdiction).
The act is valid within $\mathcal{J}$ but unauthorized within $Z$ — an insubordinate act rather than an ultra vires one.

An ultra vires act is $\alpha \notin \mathcal{J}$ entirely: the act is not within any jurisdiction that would make it normatively valid.
Ultra vires acts produce elements in $H_t \setminus H^{*}_t$ that the normative system's nucleus will not propagate — they are dead letters.

## Jurisdiction and delegation

[Delegation](../../../../../terms/delegation.md) from $A$ to $B$ within scope $D_{\mathrm{sub}}$ creates a derived jurisdiction:

$$\mathcal{J}_B = (B,\; T_J \cap T_{D_{\mathrm{sub}}},\; H_J \cap H_{D_{\mathrm{sub}}},\; V|_{D_{\mathrm{sub}}})$$

$B$'s derived jurisdiction is a restriction of $A$'s jurisdiction to the sub-scope of the delegation.
The key properties: 1. $\mathcal{J}_B \subseteq \mathcal{J}_A$: the delegate's jurisdiction is always a subset of the principal's 2. $\mathcal{J}_A \neq \mathcal{J}_B + \mathcal{J}_{A \setminus B}$: the principal's remaining jurisdiction after delegation is not defined by subtraction; $A$ retains the full jurisdiction $\mathcal{J}_A$, with $B$ holding a derived sub-jurisdiction within it 3.
The anti-override domain ([Captain](../../../../../terms/captain.md) invariant 4): within $\Pi \subseteq S$, external authorities cannot override $A$'s sub-jurisdiction — $\mathcal{J}_A|_{\Pi}$ is immune from external power

## Nuclear reading

The nuclear structure of jurisdiction concerns which elements of the fiber Heyting algebra $H_t$ are in the reach of a given authority's saturation nucleus, and what the nuclear axioms alone entail about that reach.

**Definition (jurisdictional scope at t).** Given jurisdiction $\mathcal{J} = (A, T_J, H_J, V)$, the **jurisdictional scope** at $t$ is the sub-object $H^J_t \subseteq H_t$ consisting of those fiber elements $\varphi$ for which $t \in T_J$ and $\varphi \in H_J$.
This is a definition: $H^J_t$ is specified by the jurisdiction parameters, not derived from the nuclear axioms.

**Definition (jurisdictional validity proposition).** For $\varphi \in H^J_t$ with $V(t, \varphi) = \top$ and $\mathrm{pos}(A, t) \in H_t$ (the proposition that $A$ holds the relevant positional authority at $t$), the **jurisdictional validity proposition** is the meet:

$$\mathrm{JV}(A, \varphi, t) \;:=\; \mathrm{pos}(A, t) \wedge \varphi \;\in\; H_t.$$

This is a definition.
The meet is the fiber-level expression of the joint condition "authority holds AND act is within scope AND validity is satisfied."
We use the Heyting algebra meet $\wedge$ on $H_t$; no additional structure is required.

**Proposition 1 (within-scope settlement propagates from settled authority).** Suppose $\varphi \in H^J_t$, $V(t, \varphi) = \top$, and $\mathrm{pos}(A, t) \in \mathrm{Fix}(\sigma_t)$.
Suppose additionally that $\varphi \in \mathrm{Fix}(\sigma_t)$ (the matter is itself past-saturated).
Then $\mathrm{JV}(A, \varphi, t) = \mathrm{pos}(A, t) \wedge \varphi \in \mathrm{Fix}(\sigma_t)$.

*Proof.* By hypothesis $\sigma_t(\mathrm{pos}(A, t)) = \mathrm{pos}(A, t)$ and $\sigma_t(\varphi) = \varphi$.
By meet-preservation of $\sigma_t$ (see [Meet Preservation](../../humanities/theories/math/relational-history-fiber-nucleus-meet-preservation.md)):

$$\sigma_t(\mathrm{pos}(A, t) \wedge \varphi) = \sigma_t(\mathrm{pos}(A, t)) \wedge \sigma_t(\varphi) = \mathrm{pos}(A, t) \wedge \varphi.$$

So $\mathrm{JV}(A, \varphi, t) \in \mathrm{Fix}(\sigma_t)$. $\square$

**Proposition 2 (unsettled authority blocks settlement of jurisdictional validity).** Suppose $\mathrm{pos}(A, t) \notin \mathrm{Fix}(\sigma_t)$, i.e., $\sigma_t(\mathrm{pos}(A, t)) > \mathrm{pos}(A, t)$.
Then for any $\varphi \in H_t$:

$$\sigma_t(\mathrm{JV}(A, \varphi, t)) = \sigma_t(\mathrm{pos}(A, t)) \wedge \sigma_t(\varphi) \geq \mathrm{pos}(A, t) \wedge \varphi = \mathrm{JV}(A, \varphi, t),$$

with equality iff $\sigma_t(\mathrm{pos}(A, t)) \wedge \sigma_t(\varphi) = \mathrm{pos}(A, t) \wedge \varphi$.
This can fail: if $\sigma_t(\mathrm{pos}(A, t)) > \mathrm{pos}(A, t)$ strictly, then $\mathrm{JV}(A, \varphi, t) \notin \mathrm{Fix}(\sigma_t)$ whenever $\varphi > \bot$ (since $\sigma_t(\mathrm{JV}(A, \varphi, t)) \geq \sigma_t(\mathrm{pos}(A, t)) \wedge \varphi > \mathrm{pos}(A, t) \wedge \varphi$).
So $A$'s instruction cannot be settled if $A$'s positional authority is unsettled.

*Proof.* Apply meet-preservation: $\sigma_t(\mathrm{pos}(A,t) \wedge \varphi) = \sigma_t(\mathrm{pos}(A,t)) \wedge \sigma_t(\varphi)$.
If $\sigma_t(\mathrm{pos}(A,t)) > \mathrm{pos}(A,t)$ and $\sigma_t(\varphi) \geq \varphi > \bot$ (by extensiveness), then the product strictly exceeds $\mathrm{pos}(A,t) \wedge \varphi$. $\square$

**What is not derivable from the nuclear axioms alone.** The claim that an act $\varphi$ outside $H^J_t$ cannot be advanced into $\mathrm{Fix}(\sigma_t)$ "by $A$'s act" requires the additional axiom that $A$'s act can only produce propositions in $H^J_t$.
The nuclear axioms $\sigma_t \circ \sigma_t = \sigma_t$, $a \leq \sigma_t(a)$, $\sigma_t(a \wedge b) = \sigma_t(a) \wedge \sigma_t(b)$ govern the behavior of $\sigma_t$ on all of $H_t$ uniformly; they do not restrict the domain of the nucleus to $H^J_t$.
The scope boundary $H^J_t$ is an additional structural specification of the jurisdiction, external to the nuclear axioms.
Accordingly: the claim "ultra vires acts cannot reach $\mathrm{Fix}(\sigma_t)$" is not derivable from the nuclear axioms alone; it requires the scope-boundary axiom as an additional hypothesis.

**Proposition 3 (idempotence: jurisdictional validity is not iterated).** $\sigma_t(\sigma_t(\mathrm{JV}(A, \varphi, t))) = \sigma_t(\mathrm{JV}(A, \varphi, t))$.

*Proof.* Idempotence of $\sigma_t$ (see [Idempotence](../../humanities/theories/math/relational-history-fiber-nucleus-idempotence.md)) applied to $\mathrm{JV}(A, \varphi, t) \in H_t$. $\square$

There is no "more jurisdictionally valid" beyond the first application of $\sigma_t$.
An act that reaches $\mathrm{Fix}(\sigma_t)$ is fully settled; an act that does not is not advanced by further applications.

**Proposition 4 (meet of jurisdictional validity propositions).** If $\mathrm{JV}(A, \varphi_1, t) \in \mathrm{Fix}(\sigma_t)$ and $\mathrm{JV}(A, \varphi_2, t) \in \mathrm{Fix}(\sigma_t)$, then $\mathrm{JV}(A, \varphi_1, t) \wedge \mathrm{JV}(A, \varphi_2, t) \in \mathrm{Fix}(\sigma_t)$.

*Proof.* $\mathrm{Fix}(\sigma_t)$ is closed under meets by meet-preservation (this is Proposition 1 of constitution.md, applied here). $\square$

This is the conjunction property for jurisdictional authority: if two instructions are both within jurisdiction, their conjunction is also within jurisdiction.

**Transfer-fixedness and the transfer nucleus.** The commutation axiom $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ (see [Commutation](../../humanities/theories/math/relational-history-fiber-nucleus-commutation.md)) ensures that $\mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t) = H^*_t$ is well-defined.
An element $\mathrm{JV}(A, \varphi, t) \in H^*_t$ iff $\sigma_t(\mathrm{JV}(A, \varphi, t)) = \mathrm{JV}(A, \varphi, t)$ (past-saturated) AND $\Delta_t(\mathrm{JV}(A, \varphi, t)) = \mathrm{JV}(A, \varphi, t)$ (transfer-stable, meaning for every $s \perp t$ there exists $b \in H_{s \star t}$ with $H(i_{s,t})(b) = \mathrm{JV}(A, \varphi, t)$; see [Transfer Nucleus](../../humanities/theories/math/relational-history-fiber-transferring-nucleus.md)).
Whether a specific $\mathrm{JV}(A, \varphi, t)$ is transfer-stable depends on the structure of the fiber bundle, not on the nuclear axioms alone; it is not derivable in general and must be checked case by case.

## Open questions

- Whether every jurisdiction can be represented as a sub-topos inclusion, or whether there are jurisdictions that require a more general geometric morphism (e.g., a surjection or a localization rather than a full sub-topos embedding).
- Whether conflicting jurisdictions — two authorities with overlapping jurisdiction sub-topoi — can be formally ranked by a priority order on authorities, and whether this priority order is a natural transformation between the inclusion functors.
- Whether "declining jurisdiction" (a court that refuses to hear a case despite having jurisdiction) corresponds to a retraction of the inclusion morphism — a natural transformation from the sub-topos back to a point — and whether this retraction creates any normative obligations for the declining authority.
