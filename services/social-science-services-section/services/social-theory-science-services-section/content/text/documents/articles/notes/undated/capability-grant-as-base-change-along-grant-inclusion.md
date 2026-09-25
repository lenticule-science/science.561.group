---
type: theorem
class: base-change-instantiation
status: sketch
symbol: "\\mathrm{grant}_{a,S}^c \\;=\\; \\iota_{a,c,S,!} \\circ \\iota_{a,c,S}^*"
depends-on: [capability-fiber-bundle, quantifier-adjoints-on-work-fibers, dispatch, witness-as-increment, capability-availability-from-existential]
realizes: [beck-chevalley-commutation-on-predication-bilattices, temporal-beck-chevalley, predicate-object-projection-quantifier-adjoints, predicate-subject-projection-quantifier-adjoints]
title: Capability grant as base change along grant inclusion
description: A capability grant — the substrate-algebraic content of "agent $a$ is now permitted to perform actions of type $c$ on operational sub-region $S$" — presents as a base change along a parameter-stratum inclusion on the capability fiber…
---

# Capability grant as base change along grant inclusion

A **capability grant** — the substrate-algebraic content of *"agent $a$ is now permitted to perform actions of type $c$ on operational sub-region $S$"* — presents as a **base change along a parameter-stratum inclusion** on the [capability fiber bundle](../../research/2026/07/31/lenticule-import/library/social-sciences/working/objects/capability-fiber-bundle.md), composed with the **left adjoint** of that base change. Concretely: the parameter-stratum inclusion $\iota_{a,c,S} : S \hookrightarrow \mathcal{B}_{\mathrm{op}}$ — where $S$ is the operational sub-region over which the $(a,c)$-grant has effect — induces a base-change functor $\iota_{a,c,S}^* : \mathcal{E}^c \to \mathcal{E}^c|_S$ on the bundle restricted to its $(a,c)$-slice. The grant is then $\iota_{a,c,S,!} \circ \iota_{a,c,S}^*$ — pull back to $S$, then existentially lift the $(a,c)$-cell-pattern back to the bundle. Revocation uses the **right adjoint** $\iota_{a,c,S,*}$ instead: pull back, then universally lift the empty $(a,c)$-cell-pattern, asserting absence on $S$ as a global cell.

(All four operations — grant, restrict, revoke, delegate — are formalized along the same parameter-stratum axis: the inclusion of an operational sub-region $S$ on which the $(a,c)$-cells are constrained. The agent and capability indices $(a, c)$ select the bundle slice; the parameter stratum $S$ selects the base-change inclusion.)

By [beck-chevalley-commutation-on-predication-bilattices](../../research/2026/07/math/theories/categories/theories/predication-categories/theorems/beck-chevalley-commutation-on-predication-bilattices.md), Beck-Chevalley squares on the capability fiber bundle commute under the standard hypotheses — so two grant operations on disjoint capabilities commute, and grant-then-restrict equals restrict-then-grant when the BC square is well-formed. By [temporal-beck-chevalley](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/temporal-2-category/references/temporal-beck-chevalley.md), grant operations along the temporal direction (a grant valid until time $t$, then revoked) are governed by the temporal BC square's commutation, which holds for the strict-regime sub-settling.

The substantive claim is that **the practitioner-recognized distinction between "grant," "restrict," "revoke," and "delegate" is the algebraic distinction between four base-change-and-adjoint operations** on the capability fiber bundle, and the practitioner-recognized phenomenon of "capability composition anomaly" — that two grants combine in unexpected ways — is exactly a Beck-Chevalley failure on the relevant capability square.

## Setup: the capability fiber bundle and grant inclusions

Per [capability-fiber-bundle](../../research/2026/07/31/lenticule-import/library/social-sciences/working/objects/capability-fiber-bundle.md), the capability bundle is a fibration $\pi : \mathcal{E}^c \to \mathcal{B}_{\mathrm{op}}$ where each fiber $\mathcal{E}^c_b$ at base $b$ records the capability-cell-system at $b$ — the cells of the form *"agent $a$ has capability $c$ for action-type $\alpha$ at $b$"*. By [quantifier-adjoints-on-work-fibers](../../../../../../../sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/glossary/terms/quantifier-adjoints-on-work-fibers.md), the bundle's quantifier adjoints lift the standard $\exists \dashv \pi^* \dashv \forall$ structure to the operations-base setting.

A **grant inclusion** for $(a, c)$ at parameter-stratum $S \subseteq \mathcal{B}_{\mathrm{op}}$ is the inclusion morphism
$$\iota_{a,c,S} : S \hookrightarrow \mathcal{B}_{\mathrm{op}}$$
together with the induced functor $\iota_{a,c,S}^* : \mathcal{E}^c \to \mathcal{E}^c|_S$ on the bundle. The base-change presents *"agent $a$'s capability $c$, restricted to parameter-stratum $S$"* as a cell-pattern; instantiating this pattern asserts the grant.

A **revocation** at $(a, c, S)$ is the **right adjoint** $\iota_{a,c,S,*} : \mathcal{E}^c|_S \to \mathcal{E}^c$ applied to the empty cell-pattern (the cell-system "no $a$-$c$-cells in $S$"); pushing forward to the bundle records the revocation as a global statement that no $a$-$c$-cells should appear in $S$.

A **restriction** at $(a, c, S)$ is the **left adjoint** $\iota_{a,c,S,!}$ — the existential lift of the in-$S$ cell-pattern to the full bundle, which records *"in $S$, $a$ has $c$"* as a cell-pattern that may co-exist with other cells outside $S$.

A **delegation** at $(a \to a', c)$ is a base change along an agent-axis inclusion $\iota_{a \to a'} : \{a'\} \hookrightarrow \{a, a'\}$ composed with the existing $a$-grant — substrate-algebraically a *transport* of the cell-pattern from $a$'s fiber to $a'$'s fiber, preserving the capability structure.

## Statement

**Theorem (capability grant as base-change adjoint triple).** *Let $\pi : \mathcal{E}^c \to \mathcal{B}_{\mathrm{op}}$ be the capability fiber bundle, $a$ an agent, $c$ a capability type, and $S \subseteq \mathcal{B}_{\mathrm{op}}$ a parameter-stratum. Suppose:*

1. *(Well-formed inclusion.) $\iota_{a,c,S}$ is a regular monomorphism in the operations base, so the base change $\iota_{a,c,S}^*$ has both a left adjoint $\iota_{a,c,S,!}$ and a right adjoint $\iota_{a,c,S,*}$.*

2. *(Witness-supported grant.) The grant is supported by a [witness-as-increment](../../../../../../../sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/glossary/terms/witness-as-increment.md) — a witness records the grant as an operational cell, ensuring the grant's cell-pattern is in the polity's witness-base.*

*Then:*

(a) **(Grant as base change with left adjoint.)** *Granting capability $c$ to agent $a$ over parameter-stratum $S$ presents as the base change*
$$\mathrm{grant}_{a,S}^c \;=\; \iota_{a,c,S,!} \circ \iota_{a,c,S}^*$$
*— pull back from the bundle, then existentially lift back. The result is a cell-pattern in $\mathcal{E}^c$ asserting the grant globally, with witness-supported cells in $S$ and no claim outside $S$.*

(b) **(Revocation as base change with right adjoint.)** *Revoking capability $c$ from agent $a$ over parameter-stratum $S$ presents as*
$$\mathrm{revoke}_{a,S}^c \;=\; \iota_{a,c,S,*} \circ \iota_{a,c,S}^*$$
*applied to the empty cell-pattern in $S$. The result is a cell-pattern in $\mathcal{E}^c$ asserting the absence of $a$-$c$-cells in $S$, universally lifted to the bundle.*

(c) **(Beck-Chevalley for grant composition.)** *Two grants $\mathrm{grant}_{a,S}^c$ and $\mathrm{grant}_{a',S'}^{c'}$ commute iff the Beck-Chevalley square*
$$\begin{array}{ccc} \mathcal{E}^c|_{S \cap S'} & \to & \mathcal{E}^c|_S \\ \downarrow & & \downarrow \\ \mathcal{E}^{c'}|_{S'} & \to & \mathcal{E}^{c \otimes c'} \end{array}$$
*satisfies the Beck-Chevalley condition of [beck-chevalley-commutation-on-predication-bilattices](../../research/2026/07/math/theories/categories/theories/predication-categories/theorems/beck-chevalley-commutation-on-predication-bilattices.md). When this BC condition holds, the grants commute on cell-patterns; when it fails, the order of granting matters operationally.*

(d) **(Temporal grants commute under temporal BC.)** *A grant valid until time $t$ followed by a revocation at $t$ commutes with another such grant-revocation cycle on disjoint parameter-strata iff the temporal BC square of [temporal-beck-chevalley](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/temporal-2-category/references/temporal-beck-chevalley.md) commutes. By the cited theorem, this commutation holds for the strict-regime sub-settling — so for time-bounded grants in the strict-regime cell-system, the order of grant-revocation cycles is operationally irrelevant.*

(e) **(Capability availability from grants.)** *The total capability cell-system available at parameter-stratum $S$ — the cell-pattern *"some agent has capability $c$ at $S$"* — is the existential pushforward $\iota_S^*(\exists_a [\mathrm{grant}_{a,S}^c])$, agreeing with the [capability-availability-from-existential](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/capability-availability-from-existential.md) characterization. The base-change formulation refines that characterization by exhibiting the existential as a left adjoint to a base-change functor.*

## Sketch

**(a)** The base change $\iota_{a,c,S}^*$ extracts the $a$-fiber, $c$-fiber, $S$-fiber sub-bundle of $\mathcal{E}^c$. This pulled-back fiber receives the witness-supported cells (per (2)) recording the grant as operational cell-pattern. The left adjoint $\iota_{a,c,S,!}$ — the existential lift — pushes this fiber back to the full bundle as an existential statement *"$a$ has $c$ at $S$,"* which is the cell-pattern asserting the grant. Existential lift (rather than universal) is the choice appropriate for a grant: it asserts presence in $S$ without claim outside $S$. $\square$ (Sketch (a))

**(b)** The right adjoint $\iota_{a,c,S,*}$ — the universal pushforward — applied to the empty pattern in $S$ produces the cell-pattern asserting *"no $a$-$c$-cells in $S$,"* universally lifted to the bundle. Universal lift (rather than existential) is the choice appropriate for a revocation: it asserts absence in $S$ as a global statement, blocking any inference *"$a$ might still have $c$ in $S$."* The adjoint structure on the bundle is supplied by [quantifier-adjoints-on-work-fibers](../../../../../../../sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/glossary/terms/quantifier-adjoints-on-work-fibers.md). $\square$ (Sketch (b))

**(c)** The cited [beck-chevalley-commutation-on-predication-bilattices](../../research/2026/07/math/theories/categories/theories/predication-categories/theorems/beck-chevalley-commutation-on-predication-bilattices.md) theorem establishes that BC squares on the predication bilattice commute under standard hypotheses (the cover is regular, the inclusions are regular monomorphisms). The grant-composition square of (c) is exactly such a square: the four corners are bundle restrictions to overlapping parameter-strata, and the four edges are pull-back / push-forward functors. The cited theorem gives the BC commutation, hence grant-composition commutativity, when the hypotheses are satisfied. When the cover is not regular or the inclusions are not regular monomorphisms (e.g., $S, S'$ overlap in a non-clean way), BC fails and the grants do not commute. $\square$ (Sketch (c))

**(d)** The cited [temporal-beck-chevalley](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/temporal-2-category/references/temporal-beck-chevalley.md) theorem establishes BC commutation for the temporal-direction adjunction on the strict-regime sub-settling. A grant-revocation cycle is exactly the temporal pullback of "in $[0, t]$" followed by the temporal pushforward of "no further $a$-$c$-cells after $t$" — a temporal BC square. The cited theorem applied to the cycle gives commutation in the strict regime; for permissive-regime sub-settlings, the temporal BC may fail and grant-revocation order matters. $\square$ (Sketch (d))

**(e)** Per [capability-availability-from-existential](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/capability-availability-from-existential.md), the capability *"capability $c$ is available at $S$"* is the existential statement $\exists a. \text{grant}_a^c \text{ at } S$. The present theorem refines this: the existential is the left adjoint to the agent-axis projection, and the per-agent grant cell-pattern is the base-change-with-left-adjoint construction of (a). Composing, capability availability at $S$ is $\iota_S^*(\exists_a [\mathrm{grant}_{a,S}^c])$, which agrees with the cited theorem's characterization while supplying the bundle-level adjoint structure. $\square$ (Sketch (e))

## Operational consequences

### Grant composition anomaly = BC failure

The (c) result identifies the practitioner-recognized phenomenon of *grant composition anomaly* — *"giving Bob the spending-authority capability and then giving Alice the approval-authority capability produces unexpected operational effects"* — with Beck-Chevalley failure on the grant-composition square. The substrate-algebraic content: when the parameter-strata $S, S'$ of two grants are not regular-monomorphism-included (e.g., they share a sub-region but neither is contained in the other), the BC square fails, and the two grants do not commute on cell-patterns.

Operationally: grant order matters when the BC square fails; auditors familiar with this phenomenon prescribe "grant in dependency order" or "grant by parameter-stratum hierarchy" to avoid the anomaly. The substrate-algebraic content of these heuristics is *"work in a sub-cover where the BC squares all commute."*

### Revocation universality = absence-of-claim, not deletion

The (b) reading clarifies the difference between *deletion* of a grant and *revocation*. Deletion would be removing the cells that record the grant; revocation is asserting universally that *"in $S$, $a$ has no $c$-cells."* The two are different operational acts: deletion produces an empty cell-pattern (no claim either way); revocation produces the universal-quantified absence claim. In particular, after revocation, an attempt to assert a $a$-$c$-cell in $S$ is *blocked* by the revocation cell — the closure rules detect the contradiction. After deletion, no such block exists, and the cell could be re-asserted.

Operationally: revocation is the cleaner act for security purposes; deletion is the cleaner act for storage purposes. Substrates that conflate the two suffer audit-trail anomalies (deleted grants reappear, revoked grants are invisible to deletion-based queries).

### Delegation transport = cell-pattern relocation

A delegation $\delta : a \to a'$ is the base change along an agent-axis inclusion plus the relocation of the cell-pattern. By the standard Beck-Chevalley analysis, delegation chains commute when the agent-axis BC squares commute — typically, when the delegated capability is a *substantive* capability (not a meta-capability about who can delegate, which generates higher-order structure). For substantive capabilities, [delegation-transport-via-beck-chevalley](../../research/2026/07/31/lenticule-import/library/social-sciences/working/_archive/theories/predicated-governance/theorems/delegation-transport-via-beck-chevalley.md) supplies the governance-layer formalization; the present theorem is its work-layer companion for the underlying capability bundle.

### Temporal-bounded grants are operationally clean

The (d) reading establishes that time-bounded grants — common in real systems (temporary approval authority, sabbatical-period capability extensions, project-duration access) — are *operationally clean* in the strict regime: the order of grant-revocation cycles is irrelevant. This is the substrate-algebraic content of *"a temporary grant doesn't depend on what other temporary grants happened first."* For permissive-regime sub-settlings (where temporal BC may fail), the order does matter — common in real systems with overlapping sabbatical / leave / temporary-promotion patterns.

## Status

`sketch` because:

- The (c) BC commutation requires the regular-monomorphism hypothesis, which is verified for the predication bilattice by the cited theorem but not always satisfied for arbitrary parameter-strata. The boundary case — non-regular inclusions where BC fails — is substrate-algebraically meaningful (gives the grant composition anomaly) but the precise characterization of *which* parameter-strata satisfy regular-monomorphism inclusion is per-substrate empirical.
- The (d) temporal BC commutation in the strict regime is established by [temporal-beck-chevalley](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/temporal-2-category/references/temporal-beck-chevalley.md), but the permissive-regime failure case is asserted without explicit verification per regime; the cited theorem's strict-regime restriction is the directional content used here.
- The delegation-as-base-change reading is consistent with the governance-layer [delegation-transport-via-beck-chevalley](../../research/2026/07/31/lenticule-import/library/social-sciences/working/_archive/theories/predicated-governance/theorems/delegation-transport-via-beck-chevalley.md), but the work-layer / governance-layer factorization — the precise relation between work-layer capability grants and governance-layer authority delegation — deserves explicit articulation.
- The revocation-vs-deletion distinction is operationally important and the substrate-algebraic content is correct, but the precise interaction with witness-base immutability (per [witness-as-increment](../../../../../../../sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/glossary/terms/witness-as-increment.md)) is sketched, not verified.

The directional content — that grant, restrict, revoke, delegate are four base-change-with-adjoint operations on the capability fiber bundle, with composition anomalies = BC failures, and temporal grants commuting in the strict regime — is the substantive proposal of this sketch.

## Where used

- [capability-fiber-bundle](../../research/2026/07/31/lenticule-import/library/social-sciences/working/objects/capability-fiber-bundle.md) — supplies the bundle on which the grant inclusions act.
- [quantifier-adjoints-on-work-fibers](../../../../../../../sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/glossary/terms/quantifier-adjoints-on-work-fibers.md) — supplies the adjoint structure used by (a), (b).
- [capability-availability-from-existential](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/capability-availability-from-existential.md) — the existential characterization the present theorem refines into the base-change-with-left-adjoint construction.
- [dispatch](../../research/2026/07/31/lenticule-import/library/social-sciences/working/morphisms/dispatch.md) — dispatch checks capability availability (per [dispatch-readiness-regime-is-strict](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/dispatch-readiness-regime-is-strict.md)); the present theorem clarifies how the dispatch-read availability is computed from the per-agent grants.
- [delegation-transport-via-beck-chevalley](../../research/2026/07/31/lenticule-import/library/social-sciences/working/_archive/theories/predicated-governance/theorems/delegation-transport-via-beck-chevalley.md) — the governance-layer companion: the present theorem supplies the work-layer base-change content that the cited theorem uses to formalize delegation-as-authority-transport.
- [decomposition-as-base-change](decomposition-as-base-change.md) — task decomposition is also a base-change operation on the work-fiber-bundle; the present theorem uses the same Beck-Chevalley machinery applied to the capability bundle rather than the task bundle.

## Open downstream

- *Capability inheritance via geometric morphisms.* In substrates where capabilities cascade (a manager's capability is automatically held by their direct reports for the duration of the manager's incumbency, etc.), the cascade is a geometric morphism between agent-axis sub-bundles. Whether the standard six-functor formalism (per [orbit-coloring-verdier-extension](../../research/2026/07/math/theories/categories/theories/predication-categories/theorems/orbit-coloring-verdier-extension.md)) applies and what the additional Verdier-duality structure adds operationally is open.
- *Conditional grants as fibered sums.* A conditional grant — *"$a$ has $c$ provided $\phi$"* — is a base-change along the inclusion of the cell-system $\{\phi\}$ rather than a parameter-stratum. Whether the conditional can be presented as a fibered sum of plain grants over the conditions, and whether the BC analysis carries over, deserves direct treatment.
- *Capability composition algebra.* Given two capabilities $c_1, c_2$ and two grants of each, can one always derive a grant of the composite capability $c_1 \otimes c_2$ from the individual grants? The answer is "yes, when the BC square of (c) commutes." Whether the practitioner-recognized capability composition algebras (e.g., role-based access control with role inheritance, attribute-based access control with policy combination) all satisfy the BC condition, or whether some are deliberately set up with BC-failures (to enforce specific composition policies) is open empirical-formal territory.
