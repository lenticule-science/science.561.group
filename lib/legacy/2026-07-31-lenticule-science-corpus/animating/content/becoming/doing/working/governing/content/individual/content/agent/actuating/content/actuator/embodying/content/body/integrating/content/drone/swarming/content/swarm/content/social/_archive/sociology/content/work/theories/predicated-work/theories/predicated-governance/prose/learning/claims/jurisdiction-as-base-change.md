---
type: theorem
status: sketch
depends-on: [jurisdiction, polity, jural-relation, deontic-modality, authority-gate, beck-chevalley-commutation-on-predication-bilattices, predication-fibration, predicate-specialization]
realizes: [jurisdiction, jurisdictional-invocation, jurisdictional-declination, ultra-vires]
---

# Jurisdiction is base-change in the predication fibration

The [jurisdiction object](../objects/jurisdiction.md) — an authority $A$ with sub-base $\mathcal{C}_J \subseteq \mathcal{C}_{\mathrm{op}}$, sub-stage-range $T_J \subseteq \lambda$, and validity condition $V$ — is exactly *base-change along the inclusion* $\iota_J : \mathcal{C}_J \hookrightarrow \mathcal{C}_{\mathrm{op}}$ in the [predication fibration](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md).
The four canonical jurisdictional moves of the [governance/jurisdiction subdomain](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/theories/jurisdiction/_index.md) — invocation, submission, declination, excess (ultra vires) — are the four canonical adjoint operations on $\iota_J$.

## Statement

**Theorem.** *Let $\mathcal{J} = (A, T_J, \mathcal{C}_J, V)$ be a [jurisdiction](../objects/jurisdiction.md) on operations base $B_{\mathrm{op}}$.
Let $\iota_J : \mathcal{C}_J \hookrightarrow \mathcal{C}_{\mathrm{op}}$ be the predicate-category inclusion.
Then in the [predication fibration](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md):*

(a) *(Reindexing is jurisdictional restriction.)
The reindexing functor $\iota_J^* : \mathcal{E}_{\mathrm{op}} \to \mathcal{E}_J$ takes a polity-wide valuation to its restriction to jurisdictional cells.
A jural relation $R$ on the polity restricts to its in-jurisdiction component $\iota_J^* R$.*

(b) *(Invocation is $\exists_{\iota_J}^k$.)
[Jurisdictional invocation](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/theories/jurisdiction/_index.md) — the move by which $A$ asserts jurisdiction over a specific matter — is the unit of the adjunction $\exists_{\iota_J}^k \dashv \iota_J^*$ in the knowledge order: it lifts a sub-base claim into the polity-wide cell-set, asserting that $A$'s authority's cells $\langle R^A, \texttt{within-jurisdiction-of}, \mathcal{J}\rangle$ are settled.*

(c) *(Declination is $\forall_{\iota_J}^k$.)
Jurisdictional declination is the counit of the adjunction $\iota_J^* \dashv \forall_{\iota_J}^k$: the polity-wide statement "$A$'s authority does not extend to this matter" is reflected by a sub-base statement constraining $A$'s in-jurisdiction cells.*

(d) *(Ultra vires is failure of the counit on out-of-image cells.)
An act attributed to $A$ on cells outside $\mathcal{C}_J$ is an act whose cell-pattern $\phi$ does not lie in the image of $\iota_J^*$.
On such $\phi$, the adjunction counit $\varepsilon_\phi : \exists_{\iota_J}^k(\iota_J^* \phi) \to \phi$ fails to be an isomorphism — $\iota_J^* \phi$ is determined only on the sub-base and the counit cannot recover the out-of-image cells of $\phi$.
The substrate records the resulting [authority-gate](teaching/explanations/authority-gate.md) block as the* ultra vires *witness $\langle a, \texttt{ultra-vires-of}, A\rangle = \mathbf{t}$, settling the act-cell to ineffective.
(Beck–Chevalley itself holds throughout; the failure is an image/counit phenomenon, not a BC failure.)*

(e) *(Submission is the dual lift.)
Jurisdictional submission — the party's acceptance that $A$'s jurisdiction extends over them — is the assertion that the party-cells lie in $\mathcal{C}_J$, supplying the cell-pattern for $\iota_J^*$ to act on.
Failure to object in time settles the submission cell by [settling-monotonicity](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md).*

## Sketch

**(a)** The [jurisdiction object](../objects/jurisdiction.md) specifies $\mathcal{C}_J \subseteq \mathcal{C}_{\mathrm{op}}$ — a subset of work predicates the jurisdiction governs.
This subset embeds via $\iota_J$.
By the [predication fibration](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md)'s axioms, every inclusion in $\mathcal{C}_{\mathrm{op}}$ has a reindexing functor $\iota_J^*$ on the fiber algebras that restricts cell-valuations to the sub-base.
A jural relation $R$ — a substrate entity carrying cells across many predicates — restricts to its in-$\mathcal{C}_J$ projection.

**(b)** [Beck–Chevalley](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/beck-chevalley-commutation-on-predication-bilattices.md) supplies the left-adjoint $\exists_{\iota_J}^k$ in the knowledge order.
The unit $\eta_\phi : \phi \to \iota_J^* \exists_{\iota_J}^k \phi$ on a sub-base cell-pattern $\phi$ asserts: in the polity-wide fiber, the cell-pattern "$A$ has jurisdictional authority over $\phi$" is at least as informative as $\phi$ itself in the sub-base.
This is exactly the operational content of invocation: filing a claim before the court (sub-base evidence on $\phi$) lifts to an institutional assertion (polity-wide cell on $A$'s jurisdiction over $\phi$).

**(c)** The right adjoint $\forall_{\iota_J}^k$ takes a sub-base property $\psi$ to "for all polity-wide cells whose restriction satisfies $\psi$."
Declination — "$A$ refuses jurisdiction over this matter" — is the assertion that the polity-wide cell pattern fails to satisfy $\forall_{\iota_J}^k(\text{authority-applicable})$, hence the matter is reflected back to a sub-base where $A$'s authority does not reach.
The court that finds it lacks subject-matter jurisdiction is asserting exactly this counit-failure cell.

**(d)** An act attributed to $A$ but whose cells lie outside $\mathcal{C}_J$ — say, a maritime court issuing a criminal-law judgment, when criminal-law predicates are not in $\mathcal{C}_J^{\mathrm{maritime}}$ — produces a candidate cell-pattern $\phi$ outside the image of $\iota_J^*$.
Since $\iota_J^*\phi$ records $\phi$'s content only on the sub-base, the counit $\varepsilon_\phi : \exists_{\iota_J}^k(\iota_J^* \phi) \to \phi$ cannot recover $\phi$'s out-of-image cells; the counit is not an isomorphism on them.
The act produces no valid extension of $A$'s authority cells; instead, the substrate's [authority-gate](teaching/explanations/authority-gate.md) check (residuated authority filter) settles to $\bot$ or to the explicit `ultra-vires` cell, marking the act as void.
The Beck–Chevalley commutation continues to hold for whatever pullback squares the act-cells *do* sit in; the void diagnosis comes from the adjunction-image criterion, not from a BC failure.

**(e)** Submission is the dual: the party asserts that their cells are within $\iota_J$'s image, hence amenable to $\iota_J^*$ restriction.
The classic "appearance is submission" doctrine reads as: appearing in court asserts the cells of the dispute are in $\mathcal{C}_J$.
Failure-to-object settles the submission cell by [settling-monotonicity](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md): the absence of a contesting witness leaves the submission inference unblocked.

(All five statements use the standard adjoint-pair structure on the inclusion $\iota_J$ and the [Beck–Chevalley commutation](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/beck-chevalley-commutation-on-predication-bilattices.md) result.) $\square$

## What this earns

The narrative content of the [governance/jurisdiction subdomain](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/theories/jurisdiction/_index.md) — that jurisdiction is a *relation*, not a possessed attribute, and that jurisdictional moves have their own structure of operations — becomes substrate-algebraic.
Specifically:

- **Jurisdictional analysis is fibration analysis.** Every question of "does $A$ have jurisdiction over $X$" reduces to "do the cells encoding $X$ lie in $\mathcal{C}_J^A$ in the predicate category."
  The question is testable on the substrate, not negotiated rhetorically.

- **The four jurisdictional moves are forced.** Invocation, submission, declination, excess are not a list of distinct primitives; they are the four operations the adjoint-pair structure on $\iota_J$ supports.
  There are no other jurisdictional moves at this level of structure.

- **Cross-jurisdiction interaction is composition.** When two authorities $A_1, A_2$ have overlapping jurisdictions $\mathcal{J}_1, \mathcal{J}_2$, the interaction is composition of the inclusions $\iota_{J_1}, \iota_{J_2}$.
  By [Beck–Chevalley](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/beck-chevalley-commutation-on-predication-bilattices.md), the resulting cohomology computes the cross-jurisdiction conflict cells exactly.
  Federation/preemption questions are diagrammatic.

- **Ultra vires is structural.** It's not an after-the-fact judgment that an act was beyond authority; it's a substrate-algebraic fact visible immediately when the act's cells fail to lie in the image of $\iota_J^*$ — equivalently, when the adjunction counit cannot recover the act's content on those cells.

## Why this gives the [jurisdiction object](../objects/jurisdiction.md) PCT content

The [jurisdiction object](../objects/jurisdiction.md) was specified as a quadruple $(A, T_J, \mathcal{C}_J, V)$.
The present theorem identifies the algebraic structure that the quadruple instantiates: $\iota_J$ is the inclusion the quadruple's $\mathcal{C}_J$ specifies; the adjoint pair $\exists_{\iota_J}^k \dashv \iota_J^* \dashv \forall_{\iota_J}^k$ is the operational machinery the quadruple's $A$ exercises; the validity condition $V$ is the [authority-gate](teaching/explanations/authority-gate.md) residuation guarding the gate.
The quadruple was a data shape; this theorem makes it a categorical structure.

## Relation to delegation and military-command

The chain-of-command analysis in [military-command-chain-as-modal-composition](military-command-chain-as-modal-composition.md) uses the same machinery in a different direction: instead of *restricting* an authority to a sub-base, it *composes* delegated authorities through ranks.
Both are operations on the predication fibration; the jurisdiction operation is base-change along an inclusion; the chain operation is composition of base-changes along delegation morphisms.
The two together exhaust the algebraic content of "scope and chain" in command-and-jurisdictional governance.
