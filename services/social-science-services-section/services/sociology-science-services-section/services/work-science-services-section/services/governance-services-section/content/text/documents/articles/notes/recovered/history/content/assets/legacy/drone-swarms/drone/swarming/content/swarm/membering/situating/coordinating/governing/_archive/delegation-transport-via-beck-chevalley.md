---
type: theorem
status: sketch
depends-on: [delegation, delegation-as-authority-residuation, jurisdiction-as-base-change, succession, novation, residuated-restriction-as-authority-gate, beck-chevalley-commutation-on-predication-bilattices, temporal-beck-chevalley, predication-fibration, predicate-specialization, right-residuation-operator, twist-product-right-residual, settling-monotonicity]
realizes: [delegation, jurisdiction, hohfeldian-succession, hohfeldian-novation]
see-also: [decomposition-as-base-change, military-command-chain-as-modal-composition]
---

# Delegated authority transports via Beck–Chevalley

The four normative-state moves that change the *base* under which a delegated jural relation lives — [jurisdiction](../objects/jurisdiction.md) restriction or extension, [succession](../../../../../../../../../../../../../../../../../../../../../predicated-work-services-section/services/predicated-governance-services-section/content/text/glossary/terms/succession.md) of an incumbent, [novation](../../../../../../../../../../../../../../../../../../../../../predicated-work-services-section/services/predicated-governance-services-section/content/text/glossary/terms/novation.md) of an underlying claim, and ordinary scope-amendment of a power — each presents a pullback square in the [predicate category](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) $\mathcal{C}_{\mathrm{op}}$ along which a delegation $R^B$ must transport.
The substrate guarantee that the transport is correct — that "delegate then re-base" agrees with "re-base then delegate" up to canonical isomorphism — is exactly [Beck–Chevalley commutation on predication bilattices](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/beck-chevalley-commutation-on-predication-bilattices.md), lifted to the [temporal 2-category](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/temporal-2-category.md) by [temporal Beck–Chevalley](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/temporal-beck-chevalley.md).

This theorem is the substrate-algebraic content of the standard practitioner doctrines that

- a deputy's grant survives the principal's office-succession iff the grant lies in the office's invariant scope (and not in the prior incumbent's personal scope);
- a delegation contracts when its jurisdiction contracts and extends only as far as the new jurisdiction's image admits;
- a novation of the underlying claim extinguishes the delegation iff the novation moves the source cells out of the relevant fiber image;
- *abdication* is exactly the degenerate case of delegation in which the base-change inclusion is the identity — which is what [delegation-as-authority-residuation](delegation-as-authority-residuation.md)'s open status item asked for.

## Statement

Let $R^P$ be a power jural relation held by principal $Q$ on scope $X$ in operations base $B_{\mathrm{op}}$, with authority value $a := \langle R^P, \texttt{kind-potential}, X\rangle \in \mathbf{FOUR}$.
Let $\rho_a := \mathrm{R}_a$ be the per-cell [right residuation](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/right-residuation-operator.md) gating delegation per [delegation-as-authority-residuation](delegation-as-authority-residuation.md).
Let $f : B' \to B_{\mathrm{op}}$ be a base-change morphism in $\mathcal{C}_{\mathrm{op}}$ representing one of the four normative-state moves below.

**Theorem (delegation transport).** *In the [predication fibration](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md), let $\pi : G \hookrightarrow X$ be the [predicate-specialization](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-specialization.md) inclusion encoding the delegation grant $G \subsetneq X$, and consider the pullback square*

$$\begin{array}{ccc} G' & \xrightarrow{\pi'} & X' \\ \tilde f \downarrow & \;\Downarrow \varphi & \downarrow f \\ G & \xrightarrow{\pi} & X \end{array}$$

*where $X' := f^*X$ is the re-based scope and $G' := \tilde f^* G = f^* X \cap G$ is the re-based grant.
Then on the cell-pattern of the candidate beneficiary-grant payload $g$:*

(a) *(BC iso for delegation.)
The Beck–Chevalley canonical 2-cell* $$\mathrm{BC}_\varphi(\rho_a g) \;:\; \exists_{\pi'}^{t}\bigl(\tilde f^*\,\rho_a g\bigr) \;\xrightarrow{\sim}\; f^*\bigl(\exists_\pi^{t}\,\rho_a g\bigr)$$ *is invertible.
Equivalently: re-basing the delegated cell along $f$ agrees with delegating the re-based cell, up to the canonical isomorphism $\mathrm{BC}_\varphi$.
The invertibility is the [beck-chevalley-commutation-on-predication-bilattices](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/beck-chevalley-commutation-on-predication-bilattices.md) result applied at the cell-pattern $\rho_a g$ that the delegation closure rule produces.*

(b) *(Authority-gate naturality.)
The residuation gate $\rho_a$ is natural in the base: for each row of the [residuated-restriction-as-authority-gate](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/residuated-restriction-as-authority-gate.md) table, the diagram*

$$\begin{array}{ccc} g & \xrightarrow{\rho_a} & \rho_a g \\ \tilde f^* \downarrow & & \downarrow \tilde f^* \\ \tilde f^* g & \xrightarrow{\rho_{f^*a}} & \rho_{f^*a}\,\tilde f^* g \end{array}$$

*commutes whenever the principal's authority cell $a$ is in the image of $f^*$ — i.e., when the principal's authority is itself defined on the re-based scope $X'$.
The four authority-profile rows ($a \in \{\bot, \mathbf{t}, \mathbf{f}, \top\}$) commute pointwise because $f^*$ is a Boolean-valued cell-fold and $\rho_a$ is computed cellwise per the table.*

(c) *(Transport is forced; no additional axiom.)
The closure rule that admits the transported delegation $f^*R^B$ on $X'$ is the (a)–(b) composite.
There is no choice in what the rule says; it is uniquely determined by BC + naturality.
The four delegation invariants from [delegation-as-authority-residuation](delegation-as-authority-residuation.md) — derivativity, accountability non-transfer, boundedness, revocability — are inherited by $f^*R^B$ row-by-row, since each invariant is a row-condition on $\rho_{f^*a}$ that BC translates from $\rho_a$.*

(d) *(Failure mode is image failure, not BC failure.)
A delegation fails to transport along $f$ exactly when the candidate-grant payload $g$ does not lie in the image of $f^*$ — equivalently, when the adjunction counit $\varepsilon_g : \exists_f^{t}(f^* g) \to g$ is not an isomorphism on the relevant cells.
BC continues to hold throughout.
The substrate then either (i) blocks the transport with an authority-gate $\bot$, marking the post-base-change derived cell as undefined, or (ii) — when the closure-rule system has been configured for it — emits an explicit `transport-failure-of` witness.*

## The four base-change instances

Each of the four normative moves yields a pullback square instance of (a)–(d), with concrete operational reading.

**1.
Jurisdiction restriction or extension.** Let $f = \iota_J : \mathcal{C}_J \hookrightarrow \mathcal{C}_{\mathrm{op}}$ be the inclusion of a sub-base per [jurisdiction-as-base-change](jurisdiction-as-base-change.md).
Then:

- *Restricting* a delegation to a narrower jurisdiction $\mathcal{C}_J$ is $\iota_J^* R^B$.
  By (a), the restricted delegation is well-defined on $G' = G \cap \mathcal{C}_J$.
  By (d), if the original $G$ had cells outside $\mathcal{C}_J$, those cells are blocked — they were exercised under the wider polity authority, not the in-jurisdiction authority.
  The deputy retains only the in-jurisdiction sub-grant.
- *Extending* a delegation to a wider jurisdiction is $\exists_{\iota_J}^t R^B$, the left-adjoint lift.
  By (d), this lift is genuine only on cells already in the image of $\iota_J^*$; cells the deputy never exercised in-jurisdiction cannot be conjured by the extension.
  Polity-wide extension of a sub-jurisdiction delegation requires re-issuance from the polity-level principal — it is not an automatic consequence of the deputy's prior in-jurisdiction record.

**2.
Succession of the principal.** Let $f = \sigma$ be the base-change presented by the [succession morphism](../../../../../../../../../../../../../../../../../../../../../predicated-work-services-section/services/predicated-governance-services-section/content/text/glossary/terms/succession.md) replacing incumbent $h_{i^*}$ with $h_{i^*+1}$ on office $O$.
(*The succession morphism's existing definition is a closure rule on incumbency cells; presenting it as a base-change morphism in $\mathcal{C}_{\mathrm{op}}$ requires factoring its incumbent-substitution through the principal-of-grant cell, which is a proposed extension to the morphism's current formalization.*) Under that presentation, the pullback square's BC instance partitions the prior incumbent's delegations into two classes:

- *Office-scope delegations*, in which the grant cells lie within $O$'s invariant action-domain — the cells the morphism `office-as-double-settlement` settles on $O$ rather than on $h_{i^*}$ personally.
  By (a)–(c), $\sigma^* R^B$ is well-defined and the deputy's grant survives the succession with $h_{i^*+1}$ as the new principal. *Continuity of staff under change of incumbent* is the substrate-algebraic content of (a) on this restriction.
- *Personal-scope delegations*, in which the grant cells are attached to $h_{i^*}$ as a person rather than to $O$.
  By (d), those cells lie outside the image of $\sigma^*$; the counit fails and the corresponding cells of $R^B$ are blocked.
  The deputy's personal-scope grant lapses with the prior incumbent's removal. *Personal authorizations do not survive succession* is the (d)-failure on the complement.

By [settling-monotonicity](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), neither outcome retracts a $\mathbf{t}$-cell to $\bot$: blocked personal-scope cells move to $\mathbf{f}$ via the explicit `transport-failure-of` witness, recording the lapse without violating monotonicity.
(*The office-vs-personal scope partition itself is a proposed structural distinction that `office-as-double-settlement` and `succession.md` do not yet make explicit; promoting this instance from sketch to draft requires the morphisms to add the partition's cell-discriminator.*)

**3.
Novation of the source claim.** Let $f = \nu$ be the base-change presented by the [novation morphism](../../../../../../../../../../../../../../../../../../../../../predicated-work-services-section/services/predicated-governance-services-section/content/text/glossary/terms/novation.md), which extinguishes $R^P$ (drives its `active` cell to retired-state) and creates $R^{P'}$.
(*The novation morphism's existing statement is in terms of paired claim-duty extinguish-and-create increments; presenting it as a base-change in $\mathcal{C}_{\mathrm{op}}$ on the scope-action structure of derivative grants is a proposed extension that the morphism file does not currently formalize.*) Under that proposed presentation, the (a)-image of $\nu^* R^B$ is the sub-grant of $G$ that re-attributes coherently to $R^{P'}$ — typically empty for genuine novation, since novation by design replaces the underlying obligor/scope.
By (d), the residual cells block; $R^B$ is extinguished as a derivative of the novated $R^P$.
The reading "novation extinguishes derivative grants" is consistent with — but stronger than — what `novation.md` currently states: the morphism's current statement formalizes extinguishment of the *paired correlate* (the duty), and the present theorem proposes the analogous BC-image-failure mechanism for the *derivative chain* ($R^B$ via `derived-from`).
When novation only modifies the scope-action $X$ to $X'$ without changing the obligor, $\nu^* R^B$ retains exactly the cells in $G \cap X'$ — the deputy's grant contracts to fit the novated scope.

**4.
Scope amendment of the principal's power.** Let $f : X' \hookrightarrow X$ be the inclusion of a contracted scope (for instance, when a charter amendment narrows the principal's powers).
Then $f^* R^B$ is the deputy's grant restricted to $G \cap X'$; the cells in $G \setminus X'$ are blocked.
Symmetrically, scope expansion via $f : X \hookrightarrow X^+$ does *not* automatically extend $R^B$: the deputy's grant remains on $G$, since $\exists_f^t R^B$ extends only where the deputy has prior cell-content, and prior cells are bounded by $G \subsetneq X \subsetneq X^+$.

## Sketch

**(a)** [Beck–Chevalley commutation on predication bilattices](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/beck-chevalley-commutation-on-predication-bilattices.md) gives the iso for the four predicate-category generators on any pullback square of $\mathcal{C}_{\mathrm{op}}$.
The delegation grant is encoded by a [predicate-specialization](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-specialization.md) $\pi$ — one of the four generators — so the BC iso applies to the pullback presented by the base-change $f$.
The cell-pattern at which BC is applied is the residuation output $\rho_a g$, since this is the cell the delegation closure rule writes into the substrate.
For the temporal coherence — required when the base-change is staged across settling-time, e.g. succession over multiple stages — [temporal Beck–Chevalley](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/temporal-beck-chevalley.md) lifts the iso through the $\mathbb{M} \dashv \mathbb{N}$ translation 2-cells coherently.

**(b)** The residuation $\rho_a = a \Rightarrow (-)$ on $\mathbf{FOUR}$ is computed cellwise per the [residuated-restriction-as-authority-gate](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/residuated-restriction-as-authority-gate.md) table.
The base-change reindexing $\tilde f^*$ is also a cellwise fold (it carries the cell at $(s, o)$ to the cell at $(\phi_f(s, o))$).
Two cellwise operations commute pointwise; the four authority-profile rows commute because each row is itself a cellwise function of $g$.
The naturality square commutes whenever $f^*a$ is well-defined — i.e., whenever the principal's authority cell lies in the image of $f^*$.
Outside that image, the comparison is between $\rho_a g$ at the original base and a residuation at the new base whose authority value is not determined by the original; the square is then governed by case (d), not (b).

**(c)** Each delegation invariant is a row-condition on the residuation table:

- Derivativity = row-1 ($a = \bot$) blocking on negative-content payloads.
- Accountability non-transfer = the structural separation of grant-cells (acted on by $\rho_a$) from accountability-cells (acted on by the outside-residuation clause).
- Boundedness = the $G \subsetneq X$ specialization condition.
- Revocability = row-4 ($a = \top$) failing the identity on $\mathbf{t}$-payloads.

Each row-condition is a property of the residuation operator alone; (b) gives that the operator transports along $f$ pointwise, hence each row-condition transports.
The transported delegation $f^* R^B$ is therefore not a new specification but the canonical re-basing of the original.

**(d)** When $g$ lies outside the image of $f^*$, the standard adjunction-image criterion ([@jacobs1999] §1.4) gives that the counit $\varepsilon_g : \exists_f^t(f^*g) \to g$ is not an isomorphism on the out-of-image cells.
BC continues to hold for the pullback square — the iso (a) is between two cell-patterns that agree on the in-image cells and are both undefined-or-zero on the out-of-image cells.
The substrate's authority-gate then either records $\bot$ (the cell is undefined under the new base) or — when the closure rule has the diagnostic clause — fires `transport-failure-of` to mark the lapse explicitly.
The choice between silent-bot and explicit-witness is a closure-rule-system configuration; neither violates BC. $\square$

## A proposed criterion for abdication-vs-delegation

[Delegation-as-authority-residuation](delegation-as-authority-residuation.md) closes with an open status item: *a purely-substrate-algebraic distinguishing criterion between abdication ($G = X$) and delegation ($G \subsetneq X$) is open.* The present theorem proposes a sketch criterion.
Take $f = \pi : G \hookrightarrow X$ to be the grant's specialization inclusion itself, viewed as a base-change morphism on its own scope.

Note that the [predication fibers](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) are thin (posetal in the bilattice order), so within a single fiber any BC iso is the trivial identity — "iso vs non-iso" is *not* the discriminating phenomenon.
The distinction lives instead in the **image and counit behavior** of the adjunction $\exists_\pi^t \dashv \pi^*$.

- *Delegation case ($G \subsetneq X$).* The inclusion $\pi$ is a strict (non-identity) specialization.
  The reindexing $\pi^* g$ is a *proper sub-cell-pattern* of $g$: it agrees with $g$ on $G$ and is undefined (or $\bot$) on $X \setminus G$.
  The image of $\exists_\pi^t \pi^*$ on $g$ is therefore the in-$G$ component of $g$, strictly smaller than $g$ in the bilattice's information order on $X \setminus G$.
  The deputy's cell-pattern $\rho_a(\exists_\pi^t \pi^* g)$ is observably distinguishable from the principal's $\rho_a g$ on the complement $X \setminus G$.
- *Abdication case ($G = X$).* The inclusion $\pi = \mathrm{id}_X$.
  The reindexing is the identity, $\pi^* g = g$, and the counit is an iso (trivially) on every cell.
  The "delegated" cell-pattern equals the principal's; on no cell of $X$ is there an observable difference between principal and "delegate."

The proposed sketch criterion is therefore: *a delegation increment is genuine iff the grant inclusion $\pi : G \hookrightarrow X$ is a strict specialization — equivalently, iff there is at least one cell of $X$ on which $\pi^*$ strips content (the counit fails to be the identity in the bilattice's information order on the complement).* The closure rule's existing $G \subsetneq X$ check is the cell-level expression of this strict-specialization condition.
This is a substrate-algebraic re-reading of the existing syntactic check via the adjunction's image behavior; it does not "close" the open item formally — that requires the upstream `delegation-as-authority-residuation` to be promoted past `sketch` and the closure-rule statement of delegation written explicitly in [closure-rule-language](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-language.md).
It does propose a categorical reading that the closure-rule statement should preserve.

## What this earns

Five concrete consequences not visible from the prior pair [delegation-as-authority-residuation](delegation-as-authority-residuation.md) + [jurisdiction-as-base-change](jurisdiction-as-base-change.md) taken separately.

1. **Continuity-of-staff under succession is structural, not policy.** That a deputy continues to hold an office-scope delegation when the principal succeeds is the BC iso (a) on the office-invariant component of the pullback, not a separate "carry-over" rule that has to be written into each charter.
  Personal-scope delegations lapse for the symmetric reason — they fall in the (d)-failure region.
  Charters that try to declare blanket continuity for personal-scope grants are specifying behavior the substrate refuses to support.

2. **Jurisdictional restriction commutes with delegation.** "Restrict the delegation, then check it under the new jurisdiction" gives the same cell-pattern as "check the delegation under the new jurisdiction, then restrict."
  This is the practitioner intuition for why a deputy's authority can be analyzed locally to each jurisdiction — the local analysis is canonical, not a useful approximation.
  A polity that runs jurisdictional federation can therefore audit each jurisdiction's delegation graph independently and compose the audits without re-derivation.

3. **Novation-extinguishment of derivatives is forced.** That novation of $R^P$ extinguishes the derivative $R^B$ is not a "common-sense" convention; it is the (d)-failure of the novation map's adjunction counit on the derivative cells.
  Specifications that try to preserve derivative grants across novation are asking the substrate to re-route cells through a counit that cannot be an iso on them.

4. **The four invariants survive transport.** A specification that establishes the four delegation invariants on the original $R^B$ does not need to re-establish them on $f^* R^B$; (c) gives them by row-by-row inheritance.
  This is why standard charters can say "delegation rules apply mutatis mutandis under jurisdictional change" without re-listing the invariants — the substrate-algebraic mutatis mutandis is BC.

5. **Abdication is a degenerate base-change (proposed reading).** The earlier "syntactic" $G \subsetneq X$ check has a proposed categorical reading: the grant's specialization inclusion is a strict (image-stripping) sub-base inclusion, distinguished from the identity by the adjunction-counit's image behavior, not by any (vacuous-in-thin-fibers) iso/non-iso dichotomy.
  Substrates that conflate $G = X$ with $G \subsetneq X$ are conflating two image geometries, and the resulting "delegation" is algebraically an abdication regardless of how the increment is labeled.

## Status

`sketch` because:

- The pullback-square presentations of the four base-change instances (jurisdiction, succession, novation, scope-amendment) need to be written out as explicit $\mathcal{C}_{\mathrm{op}}$-diagrams, with the predicate-specialization compositions made concrete on each.
  The diagrammatic content is implied by [predicate-generator-pullback-closure](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/predicate-generator-pullback-closure.md) but not exhibited per case.
- The naturality of $\rho_a$ in (b) is stated for $a$ in the image of $f^*$.
  The case where the principal's authority *itself* changes value across $f$ — for instance, an officer whose authority is downgraded under a jurisdictional restriction — needs the explicit dependence $a' = f^* a$ tracked through the residuation table; the four-row enumeration is straightforward but not done here.
- The `transport-failure-of` witness in (d) is referenced as a closure-rule configuration but the witness's full closure-rule shape (antecedent, consequent, fragment classification per [charter-tier-fragment-correspondence](questions/charter-tier-fragment-correspondence.md)) is open.
- The succession instance proposes a base-change presentation of the [succession morphism](../../../../../../../../../../../../../../../../../../../../../predicated-work-services-section/services/predicated-governance-services-section/content/text/glossary/terms/succession.md) and an office-scope-vs-personal-scope partition that the morphism's current closure-rule definition does not formalize.
  The novation instance proposes a derivative-chain extinguishment reading that goes beyond `novation.md`'s current paired-correlate-extinguishment statement.
  Promotion past `sketch` requires those morphism files to add the corresponding cell-discriminators or for this theorem to narrow its scope to the jurisdiction and scope-amendment instances (which are formalized) plus the succession/novation instances explicitly marked as conditional on the proposed morphism extensions.
- The proposed abdication-vs-delegation criterion (strict specialization via counit-image behavior) re-reads an existing syntactic closure-rule check categorically; promotion to formal resolution of the `delegation-as-authority-residuation` open item requires that theorem's own promotion past `sketch` and an explicit closure-rule-language statement of the delegation rule.

The directional content — that delegation transport is BC + residuation-naturality, with the four base-change moves as proposed instances and the abdication criterion as a proposed strict-specialization re-reading — is the substantive proposal of this sketch.
None of the four instances is presently a fully-formalized claim against the morphism files as they stand; each is a proposal for joint promotion alongside the corresponding morphism's own formalization work.

## Position

This theorem is the joint refinement of [delegation-as-authority-residuation](delegation-as-authority-residuation.md) and [jurisdiction-as-base-change](jurisdiction-as-base-change.md).
Before it, delegation lived in one cell of the substrate (the residuation gate) and base-change lived in another (the fibration's reindexing); after it, the two are coupled through the BC iso, and the four normative-state moves are recognized as instances of one structure.
The companion theorem [decomposition-as-base-change](../../../theorems/decomposition-as-base-change.md) does the analogous joining for task-side decomposition; together the two theorems exhibit BC as the substrate's load-bearing coherence law for *every* operation that re-bases a settled cell-pattern, on both the operational and the normative side of [operations-base](../../../objects/operations-base.md)'s two-coloring.

The companion [military-command-chain-as-modal-composition](military-command-chain-as-modal-composition.md) handles the *serial-composition* analogue (chains of delegations along a fixed base); the present theorem handles the *parallel-base-change* analogue (a single delegation transported across base-change).
The two together cover the algebraic content of "how delegated authority moves" — through ranks, through bases.
