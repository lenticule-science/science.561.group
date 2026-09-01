---
type: theorem
class: cobordism-instantiation
status: draft
symbol: "H_{\\mathcal{S}} : \\mathcal{B}_{O,\\mathrm{prior}} \\to \\mathcal{B}_{O,\\mathrm{next}}"
depends-on: [succession, office-as-double-settlement, incumbent, deontic-modality]
realizes: [handoff-cobordism, settling-cobordism-category]
---

# Succession as handoff cobordism

The [succession](succession.md) operation, formalized in predicated-governance as a closure rule with immediate joint settlement, lifts to a [handoff cobordism](../../../objects/handoff-cobordism.md) on the operations settling restricted to the office's substrate. The cobordism formalism makes precise *what content the office carries through a succession*, *how that content composes across chained successions*, and *what the cohomological obligations of the office are at each transition*.

The lift is not a definitional rephrasing — it adds substrate-algebraic structure that the closure-rule presentation alone does not surface: the office's *deontic profile* travels as the boundary's cohomology class, the *interregnum* is the cobordism's bulk closure ordinal, and the *vacancy outcome* is a cobordism whose out-boundary retains the office's persistent cells (per *dignitas non moritur*) but lacks the incumbency cells.

## The handoff boundary of an office

Let $O$ be an [office](../objects/office-as-double-settlement.md) with current incumbent $\mathrm{Inc}_{i^*}$ and successor list $L = (h_0, h_1, \ldots, h_n)$. The cells in $E_{\mathrm{op}} \times E_{\mathrm{op}}$ associated with $O$ at stage $\tau$ are:

- The **double-settlement cells**: $\langle h, \texttt{instituted-into}, O\rangle$ and $\langle h, \texttt{inducted-into}, O\rangle$ for the current and prospective holders.
- The **deontic-profile cells**: per [deontic-modality](teaching/explanations/deontic-modality.md), the jural-relation cells encoding the office's powers, duties, privileges, immunities — $\langle O, \pi_d, *\rangle$ for each deontic predicate $\pi_d$ in the office's profile.
- The **succession-priority cells**: $\langle O, \texttt{succession-priority-}i, h_i\rangle$ encoding the list $L$.
- The **office-history cells**: $\langle O, \texttt{instituted-at}, \tau_0\rangle$, $\langle O, \texttt{vacant-at}, \tau\rangle$, etc.

Call this cell-system $B_O \subseteq E_{\mathrm{op}} \times E_{\mathrm{op}}$. The **office boundary at stage $\tau$** is the predication system $\mathcal{B}_{O, \tau} = (B_O, \mathcal{C}_O, v^{\mathrm{op}}_\tau|_{B_O})$ — the closure-stable subset of $v^{\mathrm{op}}_\tau$ on $B_O$ together with the office-internal closure rules.

When $\tau$ is the firing stage of the succession closure rule, $\mathcal{B}_{O, \tau}$ is the *closing state of the prior incumbency*; when $\tau + 1$ is the post-firing stage, $\mathcal{B}_{O, \tau + 1}$ is the *opening state of the next incumbency*.

## The succession cobordism

**Definition.** Let $\tau_*$ be the stage at which the succession closure rule fires on $\mathrm{Inc}_{i^*}$, transferring incumbency to $h_{i^* + 1}$. The **succession cobordism** is the handoff cobordism

$$H_{\mathcal{S}} : \mathcal{B}_{O,\mathrm{prior}} \to \mathcal{B}_{O,\mathrm{next}}$$

with:

- *In-boundary* $\mathcal{B}_{O,\mathrm{prior}} = \mathcal{B}_{O, \tau_*}$ — the office's closure-stable cells at the moment of activation, including the prior incumbent's double-settlement cells (still settled at $\mathbf{t}$ until extinguished), the office's deontic profile, the succession list, and the office history.
- *Out-boundary* $\mathcal{B}_{O,\mathrm{next}} = \mathcal{B}_{O, \tau_* + \Delta}$ — the office's closure-stable cells after the bulk transition, including the new incumbent's joint-settled double-settlement cells, the (typically unchanged) deontic profile, the (typically unchanged) succession list, and the updated history.
- *Bulk* $v^{\mathrm{op}}_{H_{\mathcal{S}}}$ — the operations settling restricted to $\mathcal{C}_O$ over the interregnum, running the succession closure rule together with whatever induction, recognition, or installation closure rules fire during the transition.
- *Closure ordinal* of the bulk: 0 for **immediate assumption** (the succession closure rule's joint-settlement consequent — see [succession](succession.md) §*Immediate assumption*); finite for an interregnum requiring auxiliary closure (e.g., recognition firings, induction ceremony); $\omega$ or higher for protracted disputed transitions.

The cobordism is a [settling cobordism](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cobordism-category.md) instantiated on $\mathcal{C}_O$ — the office-internal subcategory of the operations base.

## Special cases of $H_{\mathcal{S}}$

**Immediate assumption** (US Navy Reg. Art. 0801; Presidential Succession Act). Closure ordinal of the bulk is 0. The cobordism is degenerate to a *thin cobordism* — in-boundary and out-boundary differ only by the joint-settled double-settlement cells of $h_{i^* + 1}$ and the extinguished cells of $\mathrm{Inc}_{i^*}$. No interregnum, no intervening closure work.

**Vacancy** (no $h_i$ available). The cobordism's out-boundary is the *vacancy boundary* $\mathcal{B}_{O,\mathrm{vac}}$ — the office's deontic-profile cells persist (per *dignitas non moritur*; see [office-as-double-settlement](../objects/office-as-double-settlement.md)), but no double-settlement cells are settled. Structurally this is a cobordism $\mathcal{B}_{O,\mathrm{prior}} \to \mathcal{B}_{O,\mathrm{vac}}$ rather than a degenerate one — the office continues, the incumbency does not.

**Interregnum.** The cobordism's bulk closure ordinal is positive: an extended period during which the succession is contested, recognition is in flight, or auxiliary closure rules (mourning periods, ratification by external bodies, etc.) must fire before the next double-settlement closes. The interregnum's *visible duration* is the bulk closure ordinal; its *operational content* is the bulk settling itself.

**Disputed succession.** Two competing $h_{i^* + 1}$ candidates have $A_i = \mathbf{t}$ simultaneously. By the closure-2-monad lax idempotence cited in [succession](succession.md) §*Coverage and chain integrity*, the bulk still reaches a fixed point — but the fixed-point boundary now carries a non-trivial $H^1$-class (per [adjudication-modes-and-h1](../../../theorems/adjudication-modes-and-h1.md)) recording the unresolved competing-candidate cells. The cobordism's out-boundary is *closure-stable but cohomologically loaded*: the dispute is not a failure to close but a structural feature of the office's transition.

## Cohomological reading: the deontic profile as $H^\bullet(\mathcal{B}_O)$

By the TQFT reading of the [handoff cobordism](../../../objects/handoff-cobordism.md), the cohomology functor $Z = H^\bullet(\mathcal{F}_{(-)})$ assigns to each office boundary a graded module $Z(\mathcal{B}_O)$ and to each succession cobordism a transfer linear map $Z(H_{\mathcal{S}}) : Z(\mathcal{B}_{O,\mathrm{prior}}) \to Z(\mathcal{B}_{O,\mathrm{next}})$.

Operational reading:

- $Z(\mathcal{B}_O)$ is the **office's standing obligation structure** — the deontic profile expressed as cohomological classes. Powers, duties, privileges, immunities each contribute a generator; standing controversies, unfulfilled requirements, and pending appeals each contribute a $H^1$-class.
- $Z(H_{\mathcal{S}})$ is the **transfer map under succession**: the kernel is what the succession *sheds* (obligations that lapse with the prior incumbency — strictly personal honors, individual undertakings); the cokernel is what the succession *adds* (obligations introduced at induction — new oaths, new acknowledgments).

For most offices in active polities, $Z(H_{\mathcal{S}})$ is close to the identity: the deontic profile transfers nearly entirely, and only marginal personal-incumbent-specific structure is added or removed. The deviation from identity is the substrate-algebraic content of *"every succession changes the office a little"* — a perceptible institutional truth that the cobordism formalism makes precise.

## Composition: dynastic chains and rotational succession

Composition of succession cobordisms $H_{\mathcal{S},2} \circ H_{\mathcal{S},1}$ is the chained succession: $h_0 \to h_1 \to h_2$. The composite cobordism's closure ordinal is the ordinal sum of the two interregna; the composite transfer map is $Z(H_{\mathcal{S},2}) \circ Z(H_{\mathcal{S},1})$.

A **closed chain** $H_{\mathcal{S},n} \circ \cdots \circ H_{\mathcal{S},1}$ ending at the original incumbent (or original incumbency state) is the succession-cobordism instantiation of [rotational-authority](../objects/rotational-authority.md). The TQFT partition function $Z(\Sigma)$ of the closed chain is the **cycle invariant** of the rotation — the trace of the transfer map around the cycle. A non-degenerate trace records that the office is materially different after the rotation than before, even if the same individual returns; a trace equal to the identity records a *clean* rotation that fully restores the office.

## Mergers and splits as pair-of-pants

The pair-of-pants succession cobordism $P : \mathcal{B}_{O_1} \otimes \mathcal{B}_{O_2} \to \mathcal{B}_{O_3}$ is the substrate-algebraic structure of a **office merger** — two offices' deontic profiles are merged into a single successor office. Conversely, $P^\vee : \mathcal{B}_{O_3} \to \mathcal{B}_{O_1} \otimes \mathcal{B}_{O_2}$ is an **office split** — one office's profile is divided between two successor offices.

By [settling-frobenius-structure](../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-frobenius-structure.md), the pair-of-pants $Z(P)$ is a multiplication on the cohomology — i.e., merging two offices is *Frobenius-algebraic on their deontic profiles*. The combined $Z(P)(z_1 \otimes z_2)$ is the deontic profile of the merged office; the failure of associativity, commutativity, or unit conditions on this multiplication records the structural cost of the merger.

## Distinction from the closure-rule presentation

The closure-rule presentation of [succession](succession.md) treats succession as a *single firing event*: activation predicate $P$ fires, the joint-settlement consequent settles new cells, done. The cobordism presentation adds three layers the closure-rule presentation does not:

1. **Boundary content.** Succession is not just a state-update; it is a transfer of a *bounded subset of office-content* from prior to next. The cobordism makes that subset explicit and closure-stable.
2. **Interregnum structure.** The bulk closure ordinal is an invariant of the transition. The closure-rule presentation collapses this to a single firing; the cobordism preserves it.
3. **Cohomological transfer.** The deontic profile is a graded module, and succession is a linear map on it. The closure-rule presentation does not surface this structure.

The two presentations are compatible: every closure-rule firing in the bulk settling of $H_{\mathcal{S}}$ corresponds to a step in the succession's substrate-algebraic content, and the cobordism's in/out boundaries restrict to the closure-rule's antecedent and consequent cells. The cobordism is the *richer* structure that absorbs the closure-rule presentation as a special-case bulk.

## Where used

- [office-as-double-settlement](../objects/office-as-double-settlement.md) — succession transfers the office's double-settlement cells; the cobordism's out-boundary contains the new incumbent's joint-settled pair.
- [restructure-as-visible-automorphism](../../../theorems/restructure-as-visible-automorphism.md) — a succession cobordism is *cosmetic* iff its transfer map is identity-up-to-relabeling on $\mathcal{B}_O$ (e.g., the new incumbent's cells differ from the prior's only by entity-relabeling on never-recorded cells); it is *substantive* iff $Z(H_{\mathcal{S}})$ has non-trivial kernel or cokernel.
- [retrospect-via-cosettling](../../../morphisms/retrospect-via-cosettling.md) — retrospect on $v^{\mathrm{op}}_{O,\mathrm{next}}$ at any post-succession stage carries the realized-trajectory floor of the office's prior deontic profile; the counterfactual reading admits preimages without that profile, formalizing the *was this really the same office?* question.
- [delegation-as-authority-residuation](../theorems/delegation-as-authority-residuation.md) — delegations made by $\mathrm{Inc}_{i^*}$ enter the cobordism's boundary as cohomological classes; whether they survive the transfer (i.e., whether the next incumbent inherits the delegations) is governed by $Z(H_{\mathcal{S}})$ and the [delegation-transport-via-beck-chevalley](../theorems/delegation-transport-via-beck-chevalley.md) base-change identities.
