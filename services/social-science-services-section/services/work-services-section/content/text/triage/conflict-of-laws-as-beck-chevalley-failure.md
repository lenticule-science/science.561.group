---
type: theorem
class: beck-chevalley-failure-instantiation
status: sketch
symbol: "\\text{conflict-of-laws}(J_1, J_2) \\;\\Leftrightarrow\\; \\mathrm{BC}_{J_1, J_2} \\text{ fails}"
depends-on: [jurisdiction, polity, jural-relation, normative-system]
realizes: [beck-chevalley-commutation-on-predication-bilattices, temporal-beck-chevalley, jurisdiction-as-base-change, federation-cohomology-as-mayer-vietoris, delegation-transport-via-beck-chevalley]
---

# Conflict of laws as Beck–Chevalley failure on jurisdictional cover

A **conflict of laws** — the substrate-algebraic content of *"two jurisdictions assign incompatible legal consequences to the same operational situation"* — presents as a **failure of the Beck–Chevalley square** on the relevant jurisdictional cover. Specifically: when the BC square formed by two jurisdictional base-changes (per [jurisdiction-as-base-change](jurisdiction-as-base-change.md)) and a shared operational sub-region does not commute, the two jurisdictions produce non-isomorphic cell-patterns on the shared region — the precise substrate-algebraic content of *"the two laws conflict on this overlap."*

By [beck-chevalley-commutation-on-predication-bilattices](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/beck-chevalley-commutation-on-predication-bilattices.md), BC commutation holds on the predication bilattice under regular-monomorphism hypotheses; when those hypotheses fail on a jurisdictional pair, the BC square fails and a conflict of laws is generated. The conflict's resolution — the practitioner-recognized choice-of-law rules — is exactly the choice of which BC-failure-mode the federation-or-comity recognizes as authoritative.

By [federation-cohomology-as-mayer-vietoris](federation-cohomology-as-mayer-vietoris.md), a BC failure on a jurisdictional pair produces overlap-difference content in $H^0(\mathcal{F}^{J_{12}})$; that content lifts to a federation-level $\delta$-image $H^1(\mathcal{F}^J)$-class **only when** the difference is not in the image of the cohomological difference map — i.e., when no constituent pair can collectively realize it. (The converse — that every BC failure generates a federation-level $H^1$ obstruction — does not hold; pairwise-realizable BC failures are absorbed by $\mathrm{Im}(\text{diff}) = \ker \delta$ and impose no federation-only adjudication burden.)

The substantive claim is that **conflict-of-laws is a Beck–Chevalley failure, not a "rule disagreement," and is operationally distinct from federation-level adjudication burden** — though the two are linked via the cited Mayer–Vietoris connection.

## Setup: the jurisdictional BC square

Per [jurisdiction-as-base-change](jurisdiction-as-base-change.md), each jurisdiction $J_i$ presents as an inclusion $\iota_{J_i} : \mathcal{C}_{J_i} \hookrightarrow \mathcal{C}_{\mathrm{op}}$ on the closure-rule system, with associated base-change $\iota_{J_i}^* : \mathcal{E}_{\mathrm{op}} \to \mathcal{E}_{J_i}$ on the predication fibration.

Given two jurisdictions $J_1, J_2$ with a shared operational sub-region $\mathcal{C}_{J_1} \cap \mathcal{C}_{J_2} = \mathcal{C}_{J_{12}}$, the **jurisdictional BC square** is:

$$\begin{array}{ccc}
\mathcal{E}_{\mathrm{op}}|_{J_{12}} & \xrightarrow{\iota_{J_1, J_{12}}^*} & \mathcal{E}_{J_1}|_{J_{12}} \\
\downarrow \iota_{J_2, J_{12}}^* & & \downarrow \iota_{J_1, J_2}^? \\
\mathcal{E}_{J_2}|_{J_{12}} & \xrightarrow{\iota_{J_2, J_1}^?} & \mathcal{E}_{J_1, J_2}|_{J_{12}}
\end{array}$$

where the four corners are the cell-systems on the overlap $J_{12}$ as seen from the operational base, from $J_1$, from $J_2$, and from the joint $(J_1, J_2)$ structure. The four edges are the base-change functors. The square's BC condition — that the two paths from top-left to bottom-right produce isomorphic functors — is the requirement that the two jurisdictions agree on what they make of the overlap.

A **conflict of laws** is a configuration in which the BC condition fails: the two paths produce non-isomorphic cell-patterns on $J_{12}$, so the legal consequence assigned to a shared operational situation differs depending on which jurisdiction's path is taken first.

## Statement

**Theorem (conflict-of-laws as BC failure).** *Let $J_1, J_2$ be two jurisdictions with shared operational sub-region $J_{12}$, and let $\mathrm{BC}_{J_1, J_2}$ denote the jurisdictional Beck–Chevalley square on $J_{12}$. Then:*

(a) **(Conflict iff BC fails.)** *A **conflict of laws** between $J_1$ and $J_2$ on operational situation $\sigma \in J_{12}$ is, substrate-algebraically, the configuration in which $\mathrm{BC}_{J_1, J_2}$ fails to commute when evaluated on the cell-pattern presenting $\sigma$. Equivalently: there exist cells $c \in \mathcal{E}_{\mathrm{op}}|_{J_{12}}$ at $\sigma$ such that $(\iota_{J_1, J_2}^? \circ \iota_{J_1, J_{12}}^*)(c) \not\cong (\iota_{J_2, J_1}^? \circ \iota_{J_2, J_{12}}^*)(c)$.*

(b) **(BC commutes ⟹ conflict-free overlap.)** *If $\mathrm{BC}_{J_1, J_2}$ satisfies the regular-monomorphism hypotheses of [beck-chevalley-commutation-on-predication-bilattices](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/beck-chevalley-commutation-on-predication-bilattices.md), then BC commutes on $J_{12}$ and $J_1, J_2$ produce isomorphic cell-patterns on every shared operational situation — no conflict of laws arises on $J_{12}$.*

(c) **(BC failure ⟹ federation-level $H^1$ contribution.)** *If $\mathrm{BC}_{J_1, J_2}$ fails on $J_{12}$, the failure produces a non-trivial difference $(\iota_{J_1, J_2}^? \circ \iota_{J_1, J_{12}}^*)(c) - (\iota_{J_2, J_1}^? \circ \iota_{J_2, J_{12}}^*)(c)$ in $H^0(\mathcal{F}^{J_{12}})$. By [federation-cohomology-as-mayer-vietoris](federation-cohomology-as-mayer-vietoris.md) (statement (d)), this contributes to the federation-level $\delta$-image $H^1(\mathcal{F}^J)$ exactly when the difference is *not* in the image of the cohomological difference map — i.e., when no constituent pair $(\alpha_1, \alpha_2) \in H^0(\mathcal{F}^{J_1}) \oplus H^0(\mathcal{F}^{J_2})$ collectively realizes the BC-failure-induced overlap content.*

(d) **(Choice-of-law as BC-failure resolution.)** *The practitioner-recognized **choice-of-law rules** — *"in case of conflict between $J_1$-law and $J_2$-law on $\sigma$, apply $J_k$-law"* for $k \in \{1, 2\}$, or some weighted mixture — present as **selection of a BC-failure resolution path**: the rule specifies which path through the BC square the federation (or the courts of jurisdiction $k$) takes as authoritative when the square fails. Each choice-of-law rule is a function $\rho : \mathrm{BC\text{-}failures} \to \mathrm{paths}$ on the BC square; the rule's substrate-algebraic content is which corner of the BC square's bottom-right is treated as the canonical answer.*

(e) **(Temporal BC failure ⟹ retroactivity conflict.)** *When the BC failure is in the temporal direction — two jurisdictions disagree about whether a *past* operational situation falls under the new or old law — the [temporal-beck-chevalley](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/temporal-beck-chevalley.md) machinery applies. The cited theorem establishes BC commutation in the strict regime; in the permissive regime, temporal BC may fail, generating a **retroactivity conflict** — the substrate-algebraic content of *"is this past act judged under old or new law?"* The strict-regime / permissive-regime distinction tracks the practitioner-recognized distinction between *"clear retroactive application"* (strict, no conflict) and *"contested retroactive application"* (permissive, BC-failure-generated).*

## Sketch

**(a)** The BC square's commutation is the assertion that the two compositions $\iota_{J_1, J_2}^? \circ \iota_{J_1, J_{12}}^*$ and $\iota_{J_2, J_1}^? \circ \iota_{J_2, J_{12}}^*$ are naturally isomorphic. Failure of commutation is the existence of a cell $c$ on which the two compositions disagree. The substrate-algebraic interpretation: the cell $c$ records an operational situation $\sigma$ on $J_{12}$, and the two compositions record what each jurisdiction makes of $\sigma$ when the other jurisdiction's pull-back is considered. Disagreement on $c$ is the precise content of *"two jurisdictions assign different legal consequences to the same operational situation."* $\square$ (Sketch (a))

**(b)** The cited [beck-chevalley-commutation-on-predication-bilattices](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/beck-chevalley-commutation-on-predication-bilattices.md) theorem establishes BC commutation under standard hypotheses on the predication bilattice. When $J_1, J_2$ have regular-monomorphism inclusions into $\mathcal{C}_{\mathrm{op}}$ and the overlap $J_{12}$ is itself a regular-monomorphism inclusion, the BC square satisfies the cited theorem's hypotheses. The conclusion — BC commutes, no conflict on $J_{12}$ — is direct. $\square$ (Sketch (b))

**(c)** When BC fails, the difference $(\iota_{J_1, J_2}^? \circ \iota_{J_1, J_{12}}^*)(c) - (\iota_{J_2, J_1}^? \circ \iota_{J_2, J_{12}}^*)(c)$ is a non-zero cell-pattern in the overlap-fiber, hence (after passing to cohomology) a non-zero class in $H^0(\mathcal{F}^{J_{12}})$. By [federation-cohomology-as-mayer-vietoris](federation-cohomology-as-mayer-vietoris.md) statement (d), this class produces a non-trivial $\delta$-image in $H^1(\mathcal{F}^J)$ exactly when the class is in $H^0(\mathcal{F}^{J_{12}}) \setminus \mathrm{Im}(\text{diff})$ — when no constituent pair can collectively realize it. So BC failure in itself produces overlap-difference content; whether this content lifts to a federation-level $H^1$ obstruction depends on the cohomological structure of the difference map at the relevant degree. $\square$ (Sketch (c))

**(d)** A choice-of-law rule selects, for each BC-failure case, one of the two compositions as authoritative. Substrate-algebraically: the rule is a section of the BC square's bottom-right corner, picking $(\iota_{J_1, J_2}^? \circ \iota_{J_1, J_{12}}^*)(c)$ or $(\iota_{J_2, J_1}^? \circ \iota_{J_2, J_{12}}^*)(c)$ as the recognized cell-pattern. The choice has cohomological consequences: different choices select different $H^1$-representatives in the federation cohomology. By [adjudication-modes-and-h1](../../../theorems/adjudication-modes-and-h1.md), each $H^1$-representative corresponds to an adjudication-mode obligation; choice-of-law rules are the adjudication-mode-selection layer that resolves the BC failure for the federation. $\square$ (Sketch (d))

**(e)** [temporal-beck-chevalley](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/temporal-beck-chevalley.md) establishes that the temporal BC square commutes in the strict regime. The strict regime corresponds operationally to the legal regime in which retroactive application of new law is *clearly excluded* — past acts are judged under past law, period. The permissive regime corresponds operationally to the legal regime in which retroactive application is contested — some retroactive content (curative legislation, ex-post-facto criminal-law restrictions) is governed by case-by-case rules. The temporal BC failure in the permissive regime is the precise substrate-algebraic content of *"the temporal scope of the new law is itself contested."* $\square$ (Sketch (e))

## Operational consequences

### Conflict-of-laws is structural, not procedural

The (a) reading clarifies a frequent confusion: conflict-of-laws is *not* a mere disagreement between authorities, resolvable by negotiation or comity. It is a **structural feature of the jurisdictional cover** — specifically, a Beck–Chevalley failure on the jurisdictional pair. Substrates that try to resolve conflicts purely procedurally (e.g., "the more recent statute prevails") without addressing the underlying BC failure will see the conflict re-emerge in different operational form whenever new cells appear in $J_{12}$. The structural fix is either (i) restructure the jurisdictional inclusions to be regular monomorphisms (per (b)) — operationally, redefine the jurisdictional boundaries — or (ii) install a choice-of-law rule (per (d)) that consistently resolves the BC failure.

### Choice-of-law rules are BC-failure-resolution policies

The (d) reading makes choice-of-law rules formally precise: each rule is a section of the BC square's bottom-right corner. Different rules — *"forum law applies,"* *"law of the situs,"* *"law most favorable to the party,"* *"law of the closer connection"* — are different sections, each selecting a different canonical answer for BC-failure cases. The substrate-algebraic distinction between rules is the distinction between sections; the practitioner-recognized "interest analysis" of conflict-of-laws scholarship is, substrate-algebraically, the analysis of which section is operationally appropriate to which BC-failure pattern.

### Federation-level adjudication burden = unresolvable BC failures

The (c) reading combines the present theorem with [federation-cohomology-as-mayer-vietoris](federation-cohomology-as-mayer-vietoris.md): the federation-level $H^1$ adjudication burden is generated by BC failures whose overlap-content is not in $\mathrm{Im}(\text{diff})$ — failures the constituents cannot jointly resolve through their own cohomological apparatus. Operationally: federations acquire adjudication burden from *unresolvable* conflict-of-laws cases — those where neither constituent's choice-of-law rule, applied to its own pull-back of the conflict, suffices to determine the answer. The federation's choice-of-law jurisprudence is its policy for handling these unresolvable BC failures.

This refines the federation-cohomology theorem's reading: the *type* of operational content that generates federation-only $H^1$ is *exactly* the BC-failure-induced overlap content not in the constituent-pair image. Federation-level constitutional courts spend most of their time on this content (the "residual jurisdiction" of constitutional adjudication), and substrate-algebraically this is a precise prediction.

### Retroactivity is temporal-BC-failure structural status

The (e) reading establishes that whether retroactive application of law is *clear* or *contested* is determined by whether the relevant temporal BC square is in the strict or permissive regime. Operationally: legal systems that produce stable, non-contested retroactivity rulings are operating in the strict-regime sub-settling on temporal BC; systems with contested, case-by-case retroactivity outcomes are operating in the permissive regime. The substrate-algebraic content: retroactivity-conflict rate is a measurable feature of the polity's temporal-regime profile, not a mere adjudicative choice.

## Status

`sketch` because:

- The jurisdictional BC square as drawn requires that $\iota_{J_1, J_2}^?, \iota_{J_2, J_1}^?$ — the lifts to the joint $(J_1, J_2)$-structure — exist as well-defined functors. For some jurisdictional pairs these lifts may not be canonical without extra choice; the per-pair characterization of when canonical lifts exist is per-substrate empirical.
- The cited [beck-chevalley-commutation-on-predication-bilattices](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/beck-chevalley-commutation-on-predication-bilattices.md) theorem establishes BC commutation under regular-monomorphism hypotheses, but the specialization to jurisdictional inclusions — which are typically not regular monomorphisms in messy real systems — is itself an empirical question. The boundary between commuting and non-commuting jurisdictional pairs is part of what the (a) reading aims to characterize, but the precise locus of the boundary requires per-substrate analysis.
- The (c) connection to [federation-cohomology-as-mayer-vietoris](federation-cohomology-as-mayer-vietoris.md) is correct in direction but uses that theorem's (d), which is itself a one-way implication; the federation-level $H^1$ contribution from BC failure depends on the surjectivity properties of the difference map, which the cited theorem leaves as a per-cover characterization.
- The (e) temporal-BC reading uses [temporal-beck-chevalley](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/temporal-beck-chevalley.md)'s strict-regime BC commutation; the permissive-regime failure case is asserted as the locus of contested retroactivity but not verified via specific failure exhibitions.

The directional content — that conflict-of-laws is a Beck-Chevalley failure on the jurisdictional cover, that choice-of-law rules are sections of the BC square's bottom-right corner, that federation adjudication burden traces to BC-failure-induced overlap content not in the constituent-pair image, and that retroactivity is a temporal-BC-regime status — is the substantive proposal of this sketch.

## Where used

- [jurisdiction-as-base-change](jurisdiction-as-base-change.md) — supplies the per-jurisdiction base-change functors the BC square is built from.
- [federation-cohomology-as-mayer-vietoris](federation-cohomology-as-mayer-vietoris.md) — supplies the cohomological framework in which BC failures contribute to federation-level $H^1$; the present theorem is the BC-square-level mechanism behind that contribution.
- [delegation-transport-via-beck-chevalley](delegation-transport-via-beck-chevalley.md) — uses the same BC machinery for delegation transport; the present theorem and the cited theorem are companion applications of [beck-chevalley-commutation-on-predication-bilattices](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/beck-chevalley-commutation-on-predication-bilattices.md) — one to authority transport, one to inter-jurisdictional conflict.
- [office-merger-as-beck-chevalley-square](office-merger-as-beck-chevalley-square.md) — office mergers across jurisdictions are BC squares whose commutation governs whether the merger is operationally clean or generates a conflict-of-laws-style anomaly; the present theorem clarifies the failure mode.
- [adjudication-modes-and-h1](../../../theorems/adjudication-modes-and-h1.md) — supplies the adjudication-mode taxonomy; choice-of-law rules per (d) select among adjudication-mode obligations corresponding to $H^1$-representatives.
- [recognition-as-bigraded-common-knowledge](recognition-as-bigraded-common-knowledge.md) — recognition of a foreign judgment is the inverse direction of the BC square (importing a $J_2$-cell into $J_1$); the present theorem clarifies when such recognition is BC-clean and when it requires explicit choice-of-law adjudication.

## Open downstream

- *Multilateral conflict-of-laws as higher BC-failure.* When three or more jurisdictions overlap on a shared operational situation, the relevant BC structure is the higher-arity Čech-style BC tower (per [cech-derived-comparison-on-bitopological-site](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/cech-derived-comparison-on-bitopological-site.md)). Multilateral conflict-of-laws — common in international taxation, environmental law, internet governance — has a higher-cohomological structure that the binary BC square does not capture. Whether the practitioner-recognized "rule of comity" suffices for the higher tower or whether new substrate-algebraic primitives are needed is open.
- *Comity as BC-section transport.* Comity — the recognition of one jurisdiction's judgments by another — is the transport of a BC-section from one BC square to another (typically, a bilateral transport extended to multilateral by composition). Whether the comity-transport composes coherently across jurisdictional networks (i.e., whether the comity-section assignments form a 2-cocycle on the jurisdictional cover) is a structural question with operational stakes.
- *Forum-shopping as BC-failure exploitation.* Forum-shopping — choosing where to sue based on which jurisdiction's choice-of-law rule is favorable — is, substrate-algebraically, the exploitation of BC-failures whose section-choices differ between jurisdictions. Whether forum-shopping incidence is a measurable function of the federation's BC-failure topology, and whether forum-shopping-resistant designs require BC-commutation enforcement at the federation level, is open empirical-formal territory.
