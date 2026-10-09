---
type: theorem
class: bc-square-instantiation
status: sketch
symbol: "P_{\\mathcal{S}, f} : (\\mathcal{B}_{O_1} \\otimes \\mathcal{B}_{O_2})|_{\\mathcal{C}_J} \\to \\mathcal{B}_{O_3}|_{\\mathcal{C}_J}"
depends-on: [succession-as-handoff-cobordism, jurisdiction-as-base-change, delegation-transport-via-beck-chevalley, office-as-double-settlement, jurisdiction]
realizes: [beck-chevalley-commutation-on-predication-bilattices, settling-cobordism-category, handoff-cobordism]
---

# Office merger as Beck–Chevalley square

When an office merger crosses a jurisdictional boundary — two offices in distinct sub-jurisdictions are consolidated into a single successor office whose jurisdiction may be either, both, or a newly-defined union — the substrate-algebraic structure is a **Beck–Chevalley square**: the [pair-of-pants succession cobordism](../morphisms/succession-as-handoff-cobordism.md) $P : \mathcal{B}_{O_1} \otimes \mathcal{B}_{O_2} \to \mathcal{B}_{O_3}$ and the [jurisdictional base-change](jurisdiction-as-base-change.md) $\iota_J : \mathcal{C}_J \hookrightarrow \mathcal{C}_{\mathrm{op}}$ commute, up to a canonical 2-cell guaranteed by [delegation-transport-via-beck-chevalley](delegation-transport-via-beck-chevalley.md).

The substantive content: **"merge then re-jurisdictionalize" agrees with "re-jurisdictionalize then merge"** *up to the canonical Beck–Chevalley iso*, in the same sense that "delegate then re-base" agrees with "re-base then delegate" in the cited delegation-transport theorem.
The deontic profile of the merged office under the target jurisdiction is canonically determined regardless of which order the operations are performed; the BC iso is unconditional.

This is not the deepest content of the theorem.
The deepest content is what the BC iso *exposes*: BC commutation always holds, so any operational failure of a cross-jurisdictional merger is *not* a failure of the square to commute but a failure of the merger's output cells to lie in the image of $\iota_{J_3}^*$ — an adjunction-image / counit-failure phenomenon, the same mechanism by which [delegation-transport-via-beck-chevalley](delegation-transport-via-beck-chevalley.md) diagnoses failed delegations.
The BC iso is what makes the failure diagnosable separately from the merger's algebraic structure.

## Setup

Let $O_1, O_2$ be offices in distinct sub-jurisdictions $\mathcal{J}_1, \mathcal{J}_2$ (per [jurisdiction-as-base-change](jurisdiction-as-base-change.md), each presenting an inclusion $\iota_{J_i} : \mathcal{C}_{J_i} \hookrightarrow \mathcal{C}_{\mathrm{op}}$).
Let $O_3$ be the proposed successor office in target jurisdiction $\mathcal{J}_3$, with inclusion $\iota_{J_3} : \mathcal{C}_{J_3} \hookrightarrow \mathcal{C}_{\mathrm{op}}$.

The merger is a [pair-of-pants succession cobordism](../morphisms/succession-as-handoff-cobordism.md) $P : \mathcal{B}_{O_1} \otimes \mathcal{B}_{O_2} \to \mathcal{B}_{O_3}$ in the [settling cobordism category](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cobordism-category.md), where $\mathcal{B}_{O_i}$ is the office boundary of $O_i$.

The jurisdictional placement is a base-change $\iota_{J_3}^* : \mathcal{E}_{\mathrm{op}} \to \mathcal{E}_{J_3}$ on the predication fibration, restricting cells to the target jurisdiction.

## The square

The diagram of interest is:

$$\begin{array}{ccc} \mathcal{B}_{O_1} \otimes \mathcal{B}_{O_2} & \xrightarrow{P} & \mathcal{B}_{O_3} \\ (\iota_{J_1}^* \otimes \iota_{J_2}^*) \downarrow & \;\Downarrow \varphi_{P, \iota} & \downarrow \iota_{J_3}^* \\ (\iota_{J_1}^* \mathcal{B}_{O_1}) \otimes (\iota_{J_2}^* \mathcal{B}_{O_2}) & \xrightarrow{P|_J} & \iota_{J_3}^* \mathcal{B}_{O_3} \end{array}$$

where $P|_J$ is the merger cobordism restricted to act on jurisdictionally-restricted boundaries — formally, the bulk settling of $P$ closed under $\mathcal{C}_{J_1} \cup \mathcal{C}_{J_2}$ rather than $\mathcal{C}_{\mathrm{op}}$, with output boundary restricted to $\mathcal{C}_{J_3}$.

Reading the square: the top-right path is "merge under full polity-wide closure rules, then restrict to $\mathcal{J}_3$"; the bottom-left path is "restrict each input to its own jurisdiction first, then merge under jurisdiction-only rules into $\mathcal{J}_3$."
The 2-cell $\varphi_{P, \iota}$ records the comparison.

## Statement

**Theorem (office merger commutes with jurisdictional base-change).** *Let $O_1, O_2, O_3$ be offices with jurisdictions $\mathcal{J}_1, \mathcal{J}_2, \mathcal{J}_3$ and let $P : \mathcal{B}_{O_1} \otimes \mathcal{B}_{O_2} \to \mathcal{B}_{O_3}$ be the [pair-of-pants succession cobordism](../morphisms/succession-as-handoff-cobordism.md) merging $O_1$ and $O_2$ into $O_3$.
Suppose:*

1. *(Compatibility.)
  The bulk closure rules of $P$ that fire are all in $\mathcal{C}_{J_1} \cup \mathcal{C}_{J_2} \cup \mathcal{C}_{J_3}$ (the merger uses no closure rule from outside the three jurisdictions).*

*Then, unconditionally:*

(a) *(BC iso for merger.)
The 2-cell $\varphi_{P, \iota}$ is invertible.
Equivalently: $\iota_{J_3}^* \circ Z(P) \cong Z(P|_J) \circ (\iota_{J_1}^* \otimes \iota_{J_2}^*)$ on cohomology.
The two paths through the square give canonically isomorphic transfer maps on the deontic-profile cohomology.
This holds regardless of any image condition; BC commutation is unconditional, exactly as in [beck-chevalley-commutation-on-predication-bilattices](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/beck-chevalley-commutation-on-predication-bilattices.md).*

(b) *(Inheritance of the four delegation invariants.)
The merged office $O_3$'s delegations transport under jurisdictional change with the same four invariants as the input offices' delegations: derivativity, accountability non-transfer, boundedness, revocability.
By [delegation-transport-via-beck-chevalley](delegation-transport-via-beck-chevalley.md), each invariant is a row-condition on the residuation table preserved by BC; the pair-of-pants merger combines the row-conditions multiplicatively (two derivative chains entering, one going out), and the resulting row-conditions on $O_3$'s residuation gate are exactly the conjunction of the input gates' row-conditions.*

(c) *(Operational success is image-condition, not BC.)* *Suppose additionally:*

  2. *(Image condition.)
    The deontic-profile cells of $\mathcal{B}_{O_3}$ that the merger writes lie in the image of $\iota_{J_3}^*$ (every cell the merged office's profile touches is in-jurisdiction for $\mathcal{J}_3$).*

*Then the transported merged profile $\iota_{J_3}^* Z(P)$ realizes the merged office's full deontic profile — the counit $\varepsilon : \exists_{\iota_{J_3}}^t (\iota_{J_3}^* z) \to z$ is an isomorphism on every output cell.
When condition (2) fails, the BC iso (a) continues to hold (it is unconditional), but the transported profile is missing content on the out-of-image cells: those cells either record $\bot$ (silently undefined under the new base) or, when so configured, carry an explicit `cross-jurisdiction-merger-failure-of` witness.
The operational failure is exclusively a failure of the adjunction image / counit — never a failure of BC commutation.*

## Sketch

**(a)** The pair-of-pants $P$ is a settling cobordism whose action on the deontic-profile cohomology is, per [handoff-cobordism](../../../objects/handoff-cobordism.md) and [settling-frobenius-structure](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-frobenius-structure.md), the Frobenius-algebra multiplication $Z(P) : Z(\mathcal{B}_{O_1}) \otimes Z(\mathcal{B}_{O_2}) \to Z(\mathcal{B}_{O_3})$.
The base-change $\iota_{J_3}^*$ is a [predicate-specialization](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-specialization.md) inclusion in the predicate category, hence one of the four canonical generators on which [Beck–Chevalley commutation on predication bilattices](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/beck-chevalley-commutation-on-predication-bilattices.md) gives an iso.
The Frobenius multiplication's compatibility with the predicate-category generators follows from the cellwise reduction (Part I of the cited theorem's proof): every cell of the merger's output boundary is computed by a cellwise rule on input cells, and cellwise rules commute with cellwise reindexing under $\iota_{J_3}^*$.
The 2-cell $\varphi_{P, \iota}$ assembles the cellwise commutations into the global square; by Part III of the cited theorem, $\varphi_{P, \iota}$ is an iso. $\square$ (Sketch (a))

**(b)** Each of the four delegation invariants is a row-condition on the residuation table $\rho_a$ as established in [delegation-transport-via-beck-chevalley](delegation-transport-via-beck-chevalley.md).
The pair-of-pants composition of two delegations $R^{B_1}, R^{B_2}$ — one from each input office — into a single delegation $R^{B_3}$ on the merged office is the cellwise meet (in the bilattice's information order) of the two input residuation outputs, evaluated on the merged authority cell $a_3 = a_1 \wedge a_2$.
The four invariants, being row-conditions, distribute over the meet: each row-condition holds on the merged delegation iff it held on both inputs.
Naturality in the base then transports the merged invariants under $\iota_{J_3}^*$ by the cited theorem's part (b). $\square$ (Sketch (b))

**(c)** When the image condition (2) holds, the counit $\varepsilon : \exists_{\iota_{J_3}}^t (\iota_{J_3}^* z) \to z$ on each output cell of the pair-of-pants is the standard adjunction unit/counit of an inclusion, hence an iso on every cell in the image.
When (2) fails — some cell of the pair-of-pants output lies outside $\mathrm{Im}(\iota_{J_3}^*)$ — the counit is not an iso on that cell, by the standard adjunction-image criterion of [@jacobs1999] §1.4 transported to the cobordism setting.
The post-base-change cell is then either $\bot$ (silent) or carries the explicit `cross-jurisdiction-merger-failure-of` witness if so configured.
BC commutation continues to hold for the pullback square in either case; the operational shortfall is exclusively a counit-image phenomenon. $\square$ (Sketch (c))

## The four canonical jurisdictional configurations

The merger's jurisdictional placement falls into four canonical configurations, distinguished by the relation between $(\mathcal{J}_1, \mathcal{J}_2)$ and $\mathcal{J}_3$:

**1.
Same-jurisdiction merger ($\mathcal{J}_1 = \mathcal{J}_2 = \mathcal{J}_3 = \mathcal{J}$).** The merger occurs entirely within a single jurisdiction.
The square is degenerate (all three jurisdictional inclusions are the same $\iota_J$), and the BC iso is the identity.
Operationally trivial; this is the standard "consolidate two like offices in the same polity" case.

**2.
Subsumption ($\mathcal{J}_1, \mathcal{J}_2 \subseteq \mathcal{J}_3$).** Both input jurisdictions are sub-jurisdictions of the target — for instance, two sub-departmental offices consolidated into a department-wide office.
The base-change $\iota_{J_3}^*$ is the identity on the input cells (since $\mathcal{C}_{J_i} \subseteq \mathcal{C}_{J_3}$); the BC iso restricts to the merger's own restriction map.
Operational reading: *expansion-by-merger always commutes with the parent jurisdiction's view of the merger.*

**3.
Carve-out ($\mathcal{J}_3 \subsetneq \mathcal{J}_1 \cap \mathcal{J}_2$).** The merged office's jurisdiction is strictly contained in both input jurisdictions' overlap — the merger transfers responsibility into a narrower jurisdiction than either input had.
The image condition (2) is restrictive: only those deontic cells of the pair-of-pants output that lie in $\mathrm{Im}(\iota_{J_3}^*)$ are recovered post-transport with $\varepsilon$ an iso.
Cells outside $\mathrm{Im}(\iota_{J_3}^*)$ are subject to the counit-image failure of (c), even though BC (a) continues to hold.
Operational reading: *narrowing-by-merger drops authority that has no in-jurisdiction expression — the BC iso confirms the algebra is sound; the dropped authority is recorded by counit-image failure.*

**4.
Federation ($\mathcal{J}_3 = \mathcal{J}_1 \cup \mathcal{J}_2$ or a newly-defined union).** The merged office's jurisdiction is exactly the union, or a new jurisdiction containing the union.
Image condition (2) is satisfied automatically if $\mathcal{C}_{J_3} = \mathcal{C}_{J_1} \cup \mathcal{C}_{J_2}$, harder otherwise.
Operational reading: *federated mergers preserve the deontic profile cell-for-cell, but require the federation jurisdiction to be charter-recognized first* (existence of $\iota_{J_3}$ as an inclusion is presupposed).

## What this earns

Five concrete consequences not visible from [succession-as-handoff-cobordism](../morphisms/succession-as-handoff-cobordism.md) and [delegation-transport-via-beck-chevalley](delegation-transport-via-beck-chevalley.md) taken separately:

1. **Cross-jurisdictional consolidations are auditable.** The BC iso (a) lets a polity audit "what did this merger transfer into the target jurisdiction" by computing either path of the square; the two paths agree unconditionally.
  The operational audit therefore reduces to checking the image condition (2) cell-by-cell on the pair-of-pants output: a cell is well-transported iff it lies in the image of $\iota_{J_3}^*$, and out-of-image cells are exactly the cells the merger fails to deliver into the target jurisdiction.
  This pinpoints, by counit-image failure rather than by BC-iso failure, which specific cells of the merger require external charter action to reach $\mathcal{J}_3$.

2. **Federation requires the federation jurisdiction to exist.** Configuration 4 above presupposes $\iota_{J_3}$ as a charter-recognized inclusion.
  Mergers that *implicitly* federate — by writing deontic cells that lie in $\mathcal{C}_{J_1} \cup \mathcal{C}_{J_2}$ but in no single recognized jurisdiction — encounter counit-image failure per (c) at the union cells.
  The substrate refuses to let the merger deliver cells without a recognized inclusion, formalizing the practitioner intuition that "you can't merge two divisions into a non-existent jurisdiction."

3. **Delegations across the merger inherit invariants per (b).** A deputy whose delegation predates the merger, granted by either input office, has a transported delegation under the merger that automatically satisfies the four invariants — derivativity, accountability non-transfer, boundedness, revocability — on the merged office's residuation gate.
  No re-issuance is required; the BC + Frobenius composition transports the invariants.

4. **Carve-out failures pre-fire.** Configuration 3 (carve-out) is the high-risk case: the merger may write cells outside $\mathcal{C}_{J_3}$ whose transport will counit-fail.
  The image-condition check of (c) detects this *at the merger event* — by listing the pair-of-pants output cells that are not in $\mathrm{Im}(\iota_{J_3}^*)$ — rather than later when the dropped cells are discovered as missing authority.
  Polities that audit carve-outs by checking the image condition pre-emptively avoid the standard "we merged the offices but forgot about department-X's cases" failure mode.

5. **The merger's order doesn't matter.** Configurations 2, 3, 4 all have the property that the order of "merge then jurisdictionalize" vs. "jurisdictionalize then merge" gives canonically isomorphic results.
  Polities that present the merger as a sequence (first merge under polity-wide rules, then restrict; or first restrict each input, then merge) can choose the order that's procedurally convenient without affecting the substantive result.

## Status

`sketch` because:

- The pair-of-pants $P$'s pullback-square presentation against $\iota_{J_3}$ requires explicit construction of the $\mathcal{C}_{\mathrm{op}}$-diagram: $P$ as a cobordism is a 2-morphism in the [settling cobordism category](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cobordism-category.md), and the BC theorem's pullback hypothesis applies to 1-morphisms in $\mathcal{C}_{\mathrm{op}}$.
  Lifting the BC iso to the 2-categorical level requires the [temporal Beck–Chevalley](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/temporal-beck-chevalley.md) result.
  The diagrammatic content is implied but not exhibited per case.
- The Frobenius-multiplication structure $Z(P)$ on the deontic-profile cohomology is invoked from [settling-frobenius-structure](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-frobenius-structure.md) at concept level; the explicit Frobenius axioms (associativity, commutativity, Frobenius identity) for office-merger multiplications are not verified here.
- The four-configuration enumeration is heuristic; the configuration-by-configuration verification of the image condition (2) requires per-configuration cell-counting that the present sketch only gestures at.
- The merger's compatibility with [restructure-as-visible-automorphism](../../../theorems/restructure-as-visible-automorphism.md) and the present subtheory's [charter-amendment-as-visible-automorphism](charter-amendment-as-visible-automorphism.md) — i.e., when a merger is itself a charter-amendment that requires a separate cosmeticity check — is noted but not developed.

The directional content — that office mergers crossing jurisdictional boundaries commute with jurisdictional base-change up to a BC iso, with image-failure as the operational risk — is the substantive proposal of this sketch.

## Position

This theorem joins three prior structures: the [pair-of-pants succession cobordism](../morphisms/succession-as-handoff-cobordism.md) (the merger's TQFT structure), [jurisdiction-as-base-change](jurisdiction-as-base-change.md) (the jurisdictional placement's algebraic structure), and [delegation-transport-via-beck-chevalley](delegation-transport-via-beck-chevalley.md) (the BC mechanism for transport across base-change).
Before it, the three sat in separate cells of the substrate; after it, they are coupled through the BC iso on the merger square, and the four jurisdictional configurations of an office merger are recognized as instances of one structure.

The companion theorem [delegation-transport-via-beck-chevalley](delegation-transport-via-beck-chevalley.md) handles the *single delegation under base-change* case; the present theorem handles the *multi-delegation merger under base-change* case.
Together they exhibit BC as the substrate's load-bearing coherence law for both single-source and multi-source authority transport.

## Where used

- [succession-as-handoff-cobordism](../morphisms/succession-as-handoff-cobordism.md) §*Mergers and splits as pair-of-pants* — supplies the cobordism $P$ that this theorem composes with $\iota_{J_3}^*$.
- [charter-amendment-as-visible-automorphism](charter-amendment-as-visible-automorphism.md) — when an office merger is presented as a charter amendment (Configuration 4 federations frequently are), the cosmeticity check applies to the *charter-cell* component while the BC iso applies to the *deontic-profile* component.
  The two checks are independent.
- [delegation-transport-via-beck-chevalley](delegation-transport-via-beck-chevalley.md) — the present theorem invokes the cited theorem's BC + naturality machinery on each delegation transported through the merger.
