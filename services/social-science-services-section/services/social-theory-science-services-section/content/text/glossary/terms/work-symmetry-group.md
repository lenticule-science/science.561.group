---
type: definition
class: group-action
status: draft
symbol: "K_4 \\curvearrowright v^{\\mathrm{op}}"
depends-on: [operations-settling, operations-base]
realizes: [klein-four-symmetry, internal-z2-gauge]
title: Work symmetry group
description: The Klein-four group $K4 = \langle \sim, - \rangle$ — the natural symmetry of any bilattice carrying both negation and conflation — acts on every operations settling $v^{\mathrm{op}}$ by acting cellwise on its $\mathbf{FOUR}$-valued cells.
---

# Work symmetry group

The Klein-four group $K_4 = \langle \sim, - \rangle$ — the natural symmetry of any [bilattice](../../documents/articles/humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice.md) carrying both [negation](../../documents/articles/humanities/theories/math/theories/categories/theories/predication-categories/morphisms/negation.md) and [conflation](../../documents/articles/humanities/theories/math/theories/categories/theories/predication-categories/morphisms/conflation.md) — acts on every [operations settling](../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/operations-settling.md) $v^{\mathrm{op}}$ by acting cellwise on its $\mathbf{FOUR}$-valued cells. The four group elements have distinct, named operational readings:

| element | acts on $\mathbf{FOUR}$ as | operational reading |
|---|---|---|
| $\mathrm{id}$ | identity | the *recorded interpretation* — what the operations log reads as written |
| $\sim$ | swap $\mathbf{t} \leftrightarrow \mathbf{f}$, fix $\bot, \top$ | the **falsifier's interpretation** — read every positive witness as a negative one and vice versa, leaving "no evidence" and "contradicted" untouched |
| $-$ | swap $\bot \leftrightarrow \top$, fix $\mathbf{t}, \mathbf{f}$ | the [audit-conflation](../concepts/audit-conflation.md) reading — treat "absent record" and "contradicted record" as exchanged: silence becomes maximal evidence, contradiction becomes maximal absence |
| $\sim \circ -$ | both swaps | the **paranoid reading** — falsifier's interpretation under audit conflation; the dual reading along both axes |

Each element is a $K_4$-action on the cellwise valuation $v^{\mathrm{op}}_\tau : \mathrm{cells} \to \mathbf{FOUR}$, lifted to the trajectory $\tau \mapsto v^{\mathrm{op}}_\tau$ stagewise.

## What it preserves

The action of each $K_4$ element on $\mathbf{FOUR}$ either preserves or reverses each of the two bilattice orders:

- $\sim$ — preserves $\leq_k$, reverses $\leq_t$.
- $-$ — preserves $\leq_t$, reverses $\leq_k$.
- $\sim \circ -$ — reverses both.

Consequently:

- The **falsifier's interpretation** preserves [settling-monotonicity](../../documents/articles/humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md) — the trajectory $\tau \mapsto \sim \! v^{\mathrm{op}}_\tau$ is still $\leq_k$-monotone — but inverts the truth-order direction of each cell. The falsifier's settling closes if and only if the original closes; its closure ordinal is the same.
- The **audit-conflation reading** preserves the truth-order direction (a cell that gained positive evidence still gained it under $-$) but reverses the knowledge-order direction. The reading is *not* $\leq_k$-monotone, so it is not itself a valid operations settling — it inverts the accumulation invariant. This is the formal sense in which audit-conflation is "structurally inadmissible as live operations": it makes sense only as a re-reading of completed records, never as a forward dynamic.
- The **paranoid reading** reverses both — it is also not a valid forward settling, for the same reason as audit-conflation.

Only the orbit $\{\mathrm{id}, \sim\}$ — the [internal $\mathbb{Z}/2$ gauge](../../documents/articles/humanities/theories/math/theories/categories/theories/predication-categories/concepts/internal-z2-gauge.md) — preserves the operational structure as a forward dynamics. The full $K_4$ acts on the *static* bilattice but only the gauge subgroup acts on the *category of operations settlings*.

## What the gauge fixes

The gauge $\sim$ fixes cell positions: it is the identity on the underlying cell-system $E_{\mathrm{op}} \times E_{\mathrm{op}}$ from the [operations base](../../documents/articles/research/2026/07/31/lenticule-import/library/social-sciences/working/_archive/operations-base.md), and acts only on the values assigned at each cell. By [visible-automorphism-sources](../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/visible-automorphism-sources.md), the gauge therefore lies in the invisible automorphism subgroup $N(v^{\mathrm{op}})$ of any operations settling: it can stabilize a settling, but when it does, it acts trivially on the [settling-associated sheaf](../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agent-organization-engine/lib/relating/docs/settling-associated-sheaf.md) and contributes nothing to the visible automorphism quotient.

This has a sharp operational consequence: **swapping the role of "positive witness" and "negative witness" throughout the operations log — call it sign convention — is a gauge transformation**. It changes nothing observable about the operations settling. Two ships with opposite sign conventions on their event logs run mathematically identical operations.

The orbit-of-meaning of an operational state under the full $K_4$ — its 1, 2, or 4 distinct $K_4$-images — is, however, observable in the *cohomology*. The [equivariant settling cohomology](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/equivariant-settling-cohomology.md) decomposes $H^\bullet(\mathcal{F}^{\mathrm{op}})$ into $K_4$-isotypic components — the truth-axis component, the knowledge-axis component, and the diagonal — each carrying its own operational meaning.

## Cohomological decomposition

Restricting to the gauge subgroup $\mathbb{Z}/2 = \langle \sim \rangle$, the equivariant decomposition gives

$$H^\bullet(\mathcal{F}^{\mathrm{op}}) \;\cong\; H^\bullet(\mathcal{F}^{\mathrm{op}})^{+} \,\oplus\, H^\bullet(\mathcal{F}^{\mathrm{op}})^{-}$$

where the $+$-summand is the gauge-invariant part (classes the falsifier's reading agrees with) and the $-$-summand is the gauge-anti-invariant part (classes whose sign the falsifier flips). Operationally:

- $H^\bullet_+$ — invariants of the operations settling that *do not depend on the sign convention*: the regime class, the closure ordinal, the set of $\top$-cells (the [inconsistency sheaf](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/inconsistency-sheaf/inconsistency-sheaf.md)'s support), the [function](../../documents/articles/research/2026/07/31/lenticule-import/library/social-sciences/working/theorems/function-as-aperiodic-settling.md)-class invariant. These are robust to relabeling of "positive" and "negative."
- $H^\bullet_-$ — invariants whose sign flips under the falsifier: the *direction* of accumulated evidence, which faction each contradicted cell tilts toward, the orientation of the [adjudication-modes-and-h1](../../documents/articles/notes/undated/adjudication-modes-and-h1.md) classes (whether the resolved $\top$ went to $\mathbf{t}$ or $\mathbf{f}$).

The structural significance: **gauge-invariant content is the part of operational reality independent of the operator's evidentiary stance**; gauge-anti-invariant content is the part that reverses under a stance reversal.

The [cadence-modal-non-normality](../../documents/articles/notes/undated/cadence-modal-non-normality.md) computation lives in $H^1$; whether its non-normality class sits in $H^1_+$ or $H^1_-$ is an open structural question for the cadence theory.

## Where it lifts

The full $K_4$ does not act on the category of operations settlings (only the gauge subgroup does). But it acts on the *static* bilattice and therefore on:

- Single cellwise valuations $v^{\mathrm{op}}_\tau$ at each fixed stage.
- The [settling-associated sheaf](../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agent-organization-engine/lib/relating/docs/settling-associated-sheaf.md) viewed as a $\mathbf{FOUR}$-valued sheaf, ignoring the dynamics.
- The classifying invariants in $H^\bullet$ — the [equivariant settling cohomology](../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/equivariant-settling-cohomology.md) is a full $K_4$-decomposition.

The gauge subgroup is what bridges static bilattice symmetry to settling-dynamic symmetry; the conflation generator $-$ is the symmetry that "lives only on completed records," the formal home of post-hoc audit reasoning. The [retrospect-via-cosettling](../../../../../sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/retrospect-via-cosettling.md) morphism uses the conflation generator natively.

## Where used

- [retrospect-via-cosettling](../../../../../sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/retrospect-via-cosettling.md) — uses the conflation generator $-$ to read backward from a closure state.
- [restructure-as-visible-automorphism](../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/concepts/restructure-as-visible-automorphism.md) — the gauge subgroup explains why some reorganizations are operationally invisible.
- [audit-conflation](../concepts/audit-conflation.md) — the conflation generator $-$ is the formal mechanism behind the audit-conflation phenomenon.
- [adjudication-modes-and-h1](../../documents/articles/notes/undated/adjudication-modes-and-h1.md) — the affirm/retract/acknowledge mode distribution lives in $H^1_-$ (sign-sensitive) under the gauge decomposition.
