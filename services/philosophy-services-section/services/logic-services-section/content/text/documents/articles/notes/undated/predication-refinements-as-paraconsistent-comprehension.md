---
type: theorem
class: engineering-claim
status: proved
depends-on:
  - refined-type
  - check-type
  - type-record
  - predication-fiber-algebra
  - predicate-specialization
  - predicate-category
  - predication-hyperdoctrine
  - lawvere-comprehension-classical
  - lawvere-comprehension-paraconsistent
  - twist-product
  - predication-fiber-residuation
  - closure-rule-system
  - closure-ordinal
  - four-regime-dichotomy
  - regime-classification-for-substrate
  - modal-necessity-operator
see-also:
  - type-soundness
  - graded-effects-via-q-enriched-fusion
  - capability-non-amplification
  - paraconsistency-as-substrate-discipline
  - refinement-type-decidability-boundary
title: Refined types are paraconsistent comprehension over the predication fibration
description: Claim.
---

# Refined types are paraconsistent comprehension over the predication fibration

**Claim.** Let $T$ be a [type-record](../../research/2026/07/31/objects/type-record.md) whose extension is the predicate $p_T$ in the substrate's [predication hyperdoctrine](../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-hyperdoctrine.md), and let $φ \in A_{p_T}$ be a refinement value in the [predication fiber algebra](../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) over $p_T$. Fix a *designation policy* $d \in \{\mathbf{t}, \top\}$ — truth-order top or knowledge-order top, declared on the refined type. Then the [refined type](../../research/2026/07/31/lenticule-import/teaching/explanations/refined-type.md) $\{T \mid φ\}_d$ is, structurally,

$$\{T \mid φ\}_d \;=\; \{p_T : φ\}_d \;\in\; \mathcal{C}/p_T,$$

the value of the right adjoint $\{p_T : -\}_d$ furnished by the [classical Lawvere comprehension theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/predication-hyperdoctrine/references/lawvere-comprehension-classical.md) when $d = \mathbf{t}$ (the everyday default), and by the [paraconsistent Lawvere comprehension theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/predication-hyperdoctrine/references/lawvere-comprehension-paraconsistent.md) when $d = \top$ (the federation-active / settled-information variant). Both adjoints exist on the substrate's hyperdoctrine; refined-type declarations choose one.

Three corollaries follow structurally:

1. **Refinement subtyping is predicate-specialization on carved domains.** A [predicate-specialization](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/predicate-specialization.md) morphism $\{T \mid φ\}_d \to \{T \mid ψ\}_d$ in $\mathcal{C}/p_T$ exists iff $φ^{-1}(d) \subseteq ψ^{-1}(d)$ — set inclusion of the designated cells. This is the substrate's structural subtyping check: a per-cell membership comparison on $φ$ and $ψ$ at the designation, *not* a global cellwise inequality between $φ$ and $ψ$ across all of $A_{p_T}$.
2. **Weakest-precondition refinement is fiber residuation.** The residuated implication $φ \Rightarrow ψ$ in the [predication fiber residuation theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/predication-fiber-algebra/references/predication-fiber-residuation.md) is the strongest refinement whose intersection with $φ$ is contained in $ψ$.
3. **Refinement check-decidability is regime-determined.** Per [regime-classification-for-substrate](../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/regime-classification-for-substrate.md), [check-type](../../research/2026/07/31/morphisms/check-type.md) on a refined type terminates with a definite verdict if and only if the refinement's [closure-rule system](../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md) sits in the strict or Scott-continuous regime; transfinite-bounded refinements terminate only with an explicit budget; aperiodic refinements do not terminate as a static check at all.

The proved status of this theorem is the **structural identification** above — the refined-type/comprehension/specialization/residuation/regime correspondences. It is *not* a claim about the operational signature of the current [check-type](../../research/2026/07/31/morphisms/check-type.md) morphism or about an upgraded form of [type-soundness](../../research/2026/07/31/lenticule-import/type-soundness.md); see "Soundness-layer alignment" for the scope split.

## Proof

### Part 1 (Comprehension identification)

For the truth designation $d = \mathbf{t}$: per the [classical Lawvere comprehension theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/predication-hyperdoctrine/references/lawvere-comprehension-classical.md), the assignment

$$\{p_T : φ\}_{\mathbf{t}} \;:=\; \big(\,q_φ \to p_T\,\big),\quad \mathrm{dom}(q_φ) := φ^{-1}(\mathbf{t}),$$

is the right adjoint to the truth-order extension functor $\mathrm{Ext}^t : \mathcal{C}/p_T \to \mathcal{E}_{p_T}$. The refined type's everyday contract — admit $v$ at $\{T \mid φ\}_{\mathbf{t}}$ iff $φ(v) = \mathbf{t}$ — is exactly the membership condition $v \in φ^{-1}(\mathbf{t})$ on the comprehension object's domain.

For the knowledge designation $d = \top$: per the [paraconsistent Lawvere comprehension theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/predication-hyperdoctrine/references/lawvere-comprehension-paraconsistent.md), the assignment

$$\{p_T : φ\}_\top \;:=\; \big(\,q_φ \to p_T\,\big),\quad \mathrm{dom}(q_φ) := φ^{-1}(\top),$$

is the right adjoint to the knowledge-order extension functor $\mathrm{Ext}^k$. The refined type's settled-information contract — admit $v$ at $\{T \mid φ\}_\top$ iff $φ(v) = \top$, i.e. iff $v$ has both positive and negative evidence settled for $φ$ — is exactly the membership condition $v \in φ^{-1}(\top)$. By the universal property, in either designation the comprehension object is the unique-up-to-iso *substrate-canonical* carving of $p_T$ along $φ$ at that designation, and admits exactly those specializations $g : q \to p_T$ whose extension refines $φ$ in the corresponding order.

The two adjoints carve different sub-supports of $p_T$ — they are *not* the same object — and a refined-type declaration must commit to one designation; the substrate then runs the corresponding admission rule. The default is $\mathbf{t}$.

### Part 2 (Refinement subtyping is specialization)

Fix the designation $d \in \{\mathbf{t}, \top\}$ on both sides. A specialization morphism $f : \{T \mid φ\}_d \to \{T \mid ψ\}_d$ in $\mathcal{C}/p_T$ exists iff $\mathrm{dom}(q_φ) \subseteq \mathrm{dom}(q_ψ)$, iff $φ^{-1}(d) \subseteq ψ^{-1}(d)$. The corresponding morphism is exhibited concretely as the inclusion of carved domains; the substrate's subtyping check is therefore set-inclusion on the designated cells, computed cell-by-cell from $φ(v)$ and $ψ(v)$ values the substrate already records at admission. This is *not* equivalent to a global cellwise inequality $φ \leq_t ψ$ across all of $A_{p_T}$: the comprehension only sees the designated cells, and values off the designated set place no constraint on the morphism's existence. The earlier reading "subtyping = global $\leq_t$" was a special case under additional assumptions on $φ, ψ$ (e.g. both two-valued at the designation); the structural fact is the weaker designated-domain-inclusion statement here.

The truth and knowledge subtypings are *also* distinct relations (since $\mathbf{t}$-domains and $\top$-domains in general differ). Mixed-designation subtyping between a truth-designated and knowledge-designated refinement of the same base is a separate question the substrate must declare explicitly; it is not given by either adjunction directly.

### Part 3 (Weakest precondition is fiber residuation)

By the [predication fiber residuation theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/predication-fiber-algebra/references/predication-fiber-residuation.md), the [twist-product fusion](../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md) $\odot$ and the [twist-product right residual](../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-right-residual.md) $\Rightarrow$ form an adjoint pair under $\leq_t$, cellwise on $A_{p_T}$:

$$φ \odot ψ \leq_t χ \;\iff\; φ \leq_t ψ \Rightarrow χ.$$

Reading the left-hand side as "the refined type carved by $φ$ further refined by $ψ$ implies $χ$," the right-hand side is exactly the Hoare-logic weakest-precondition contract: $ψ \Rightarrow χ$ is the weakest refinement on $T$ such that whenever $ψ$ is added to it, the result implies $χ$. The substrate's standard $\odot \dashv \Rightarrow$ adjunction therefore *is* the substrate's refinement-implication calculus; no separate verification-condition generator is required, and per [graded-effects-via-q-enriched-fusion](../../research/2026/07/31/lenticule-import/graded-effects-via-q-enriched-fusion.md) it composes uniformly with effect grades on the same fiber.

### Part 4 (Decidability is regime-determined)

A refinement $φ$ is *checked* by the substrate by computing, on a candidate value $v$, the closure $\mathrm{cl}_φ(v) \in A_{p_T}$ generated by $φ$'s closure-rule system per the substrate's standard [closure-rule application](../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/closure-rule-application.md). Per [closure-ordinal](../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/closure-ordinal.md), the closure terminates at an ordinal $\kappa(φ)$. The four regimes ([four-regime-dichotomy](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md)) partition refinements by $\kappa(φ)$:

- $\kappa(φ) < \omega$ — *strict*. Per [four-regime-dichotomy](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md), this regime is characterized by finite $\mathbf{L}, E, \mathcal{C}$. Per [strict-regime-engineering-envelope](../../research/2026/theorems/strict-regime-engineering-envelope.md), [check-type](../../research/2026/07/31/morphisms/check-type.md) is finite fiber-algebra closure; verdict in finitely many steps.
- $\kappa(φ) = \omega$ — *Scott-continuous*. The closure operator is Scott-continuous on an infinite base. Per [scott-continuous-regime-engineering-envelope](../../research/2026/theorems/scott-continuous-regime-engineering-envelope.md) and [scott-continuous-regime-mld-polynomial](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/mutually-locally-derivable/references/scott-continuous-regime-mld-polynomial.md), check-type terminates at the standard $\omega$-iteration the substrate already runs; per-step work polynomial in fiber size; verdict definite.
- $\omega < \kappa(φ) < \omega_1$ — *transfinite-bounded*. Non-Scott-continuous closure with countable cofinality. Per [transfinite-bounded-regime-engineering-envelope](../../research/2026/theorems/transfinite-bounded-regime-engineering-envelope.md), check-type terminates, but only at a countable transfinite ordinal; substrate-checkable only with explicit budget. With budget exhausted the verdict is $\bot$ — *not* $\mathbf{f}$ — and the refinement is admitted under the substrate-recorded "incomplete check" discipline.
- $\omega_1 \leq \kappa(φ)$ — *aperiodic*. Per [aperiodic-regime-engineering-envelope](../../research/2026/theorems/aperiodic-regime-engineering-envelope.md), the closure orbit is strictly $\leq_k$-ascending across $\omega_1$-many stages, so no finite-resource fixed point; check-type returns $\bot$ in finite resources. Admission requires proof-carrying or runtime-deferred discipline.

The classification depends on $φ$'s rule-language fragment, by [rule-language-realizability-determines-regime](../../research/2026/theorems/rule-language-realizability-determines-regime.md), so the regime is statically inferable from the refinement language alone — the substrate does not need to discover regime dynamically.

$\square$

## Engineering consequence

- **One discipline, four regimes.** The previous "decidable / decidable-with-help / undecidable" trichotomy is replaced by the four-regime structural fact. Engineers read a refinement's regime from the rule-language fragment it sits in, and the substrate's discipline (admit-direct, admit-with-budget, admit-with-proof-obligation, refuse) follows.
- **Refinement subtyping for free.** The substrate's universal $\leq_t$ check on fiber-algebra values does subtyping; no bespoke entailment engine.
- **Hoare-logic for free.** The substrate's universal $\odot \dashv \Rightarrow$ adjunction does weakest-precondition / strongest-postcondition computation; no bespoke VC generator.
- **Bilattice-valued check-type (structural target).** Structurally, [check-type](../../research/2026/07/31/morphisms/check-type.md)'s verdict on a refined type is the value $φ(v) \in A_{p_T}$ — naturally a bilattice element with four cardinal cases in $\mathbf{FOUR}$: $\mathbf{t}$ classically valid, $\mathbf{f}$ classically refuted, $\bot$ undetermined-within-budget, $\top$ contested-by-evidence. The current `check-type` morphism returns the engineer-facing $\{\text{valid},\text{invalid}\}$ projection of this value (per the truth-designated comprehension); fully exposing the FOUR-valued verdict is a non-trivial uplift of the surrounding [type-soundness](../../research/2026/07/31/lenticule-import/type-soundness.md) discipline (which currently states soundness against the binary projection) and is recorded as such — see "Soundness-layer alignment" below.
- **Federation-active refinements compose modally.** A refinement under [modal-necessity](modal-necessity-operator.md) survives federation envelopes per [federation-convergence](../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/federation-convergence.md); the same machinery that handles capability federation handles refinement federation.
- **Refinement, effect, capability share machinery.** Per the q-enriched-fiber decomposition (see [graded-effects-via-q-enriched-fusion](../../research/2026/07/31/lenticule-import/graded-effects-via-q-enriched-fusion.md) and [capability-non-amplification](../../research/2026/07/31/lenticule-import/capability-non-amplification.md)), refinements occupy the same fiber-algebra coordinate as effects and capabilities; composition across all three is one operation.
- **Type-soundness sharpens.** [type-soundness](../../research/2026/07/31/lenticule-import/type-soundness.md)'s "Part 3 (Refinement preservation)" is now backed by a structural identification rather than a gesture: refinement preservation is the cartesian-lift property of the predicate-specialization morphism, valid by construction, with the discipline-parameter recorded as the regime.

## What the theorem rules out

- **A separate entailment engine for refinement subtyping.** The substrate uses $\leq_t$ on $A_{p_T}$ for every other discipline; a refinement-only entailment relation would be a duplicated structure non-conformant with [conformance-implies-substrate-properties](../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/conformance-implies-substrate-properties.md).
- **Boolean-only refinement satisfaction *as the substrate's structural discipline*.** A check-type that returns only `valid`/`invalid` and treats that as the whole of the refinement-check result discards the $\bot$ and $\top$ cells, which by the theorem are structural — not artifacts of incomplete checking. A Boolean-only discipline cannot record budget-exhausted refinements as distinct from refuted ones, breaking auditability. (The current `check-type` morphism's binary signature is a projection of the structural verdict for the engineer-facing surface, not a redefinition of the discipline; see "Soundness-layer alignment.")
- **Refinement disciplines disconnected from regime.** A substrate that picks refuse-vs-defer-vs-proof-carry on a per-refinement basis without reference to the rule-language regime is making policy choices the regime classification has already determined; the policy surface is *which* regimes the substrate admits at all, not a free-floating dial per refinement.
- **Per-refinement decidability declarations.** Decidability is a property of the refinement-language fragment, not of the individual refinement. A substrate that asks the engineer to declare per-refinement "this one is decidable" is asking the engineer to do work the regime classification does for free.

## What the theorem requires

The structural identification proved here (refined types as Lawvere comprehension at a declared designation, subtyping as designated-domain inclusion, weakest-precondition as fiber residuation, decidability as regime) requires only:

- The substrate's [predication hyperdoctrine](../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-hyperdoctrine.md) is the one used elsewhere — refinements live in the same fibers as the substrate's other predication content, not in a parallel structure.
- Per [regime-classification-for-substrate](../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/regime-classification-for-substrate.md), the regime under which a refinement is admitted is statically inferable from the rule-language fragment.
- Per [conformance-implies-substrate-properties](../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/conformance-implies-substrate-properties.md), the runtime passes its refinement-comprehension conformance suite for the designation it declares.

The theorem does **not** require that [check-type](../../research/2026/07/31/morphisms/check-type.md) currently expose the FOUR-valued verdict at its engineer-facing signature, nor that [type-soundness](../../research/2026/07/31/lenticule-import/type-soundness.md) currently be stated against the bilattice. Those are the soundness-layer uplift recorded in the next section, separate from what is proved here.

## Soundness-layer alignment

The structural verdict described in Part 1 lives in the bilattice $A_{p_T}$ with four cardinal cases. The current [type-soundness](../../research/2026/07/31/lenticule-import/type-soundness.md) theorem in this subtheory states preservation and progress against `check-type`'s binary `valid`/`invalid` signature — i.e. the truth-designated $\{\mathbf{t}\}$ vs. $\{\mathbf{f}, \bot, \top\}$ projection of the bilattice verdict. The structural identification of this theorem is therefore *consistent with* the existing soundness statement (the binary projection is the truth-designated reading at the engineer-facing surface), but does *not yet upgrade* it to a FOUR-valued / regime-parametric soundness statement.

The lift to a regime-parametric soundness — preservation and progress stated against the bilattice verdict, with the recorded regime parameterizing what counts as an admissible $\bot$ outcome — is recorded as the `draft` theorem [type-soundness-regime-parametric](../../research/2026/07/31/lenticule-import/type-soundness-regime-parametric.md), separate from the present theorem. Until that draft is fully formalized (Lean realization, worked-example chain, witness-record schemas), the FOUR-valued reading of `check-type` developed here should be understood as the *structural target* the soundness layer is converging toward, not as a property the surrounding theorems already certify.

## Position

This theorem grounds [refined-type](../../research/2026/07/31/lenticule-import/teaching/explanations/refined-type.md) in the predication-categories machinery directly — replacing the previous gestural "predicate constraining values" reading with the structural identification "right adjoint of the extension functor." Together with [type-soundness](../../research/2026/07/31/lenticule-import/type-soundness.md) (typing as fibration), [graded-effects-via-q-enriched-fusion](../../research/2026/07/31/lenticule-import/graded-effects-via-q-enriched-fusion.md) (effects as quantale grade), [capability-non-amplification](../../research/2026/07/31/lenticule-import/capability-non-amplification.md) (capabilities as modal restriction), and [evaluation-as-closure-2-monad-algebra](../../research/2026/07/31/lenticule-import/evaluation-as-closure-2-monad-algebra.md) (evaluation as algebra), the runtime's five disciplines — typing, refinement, effect, capability, evaluation — sit at five structural coordinates of one predication fibration: types in the base, refinements in the comprehension, effects in the quantale grade, capabilities in the modal accessibility, evaluation in the closure algebra. The functional-runtime-platform's discipline is *one* fibration with five coordinates, not five disciplines stitched together.

The theorem also resolves the structural part of [refinement-type-decidability-boundary](../../research/2026/07/31/lenticule-import/questions/refinement-type-decidability-boundary.md): the decidability boundary is the four-regime classification, not a refinement-language-fragment trichotomy, and the engineer-visible discipline is regime-determined. The remaining engineering questions on that note (which regimes the substrate admits, what witness content records the regime, how contestation is resolved) are now policy declarations rather than open structural questions.
