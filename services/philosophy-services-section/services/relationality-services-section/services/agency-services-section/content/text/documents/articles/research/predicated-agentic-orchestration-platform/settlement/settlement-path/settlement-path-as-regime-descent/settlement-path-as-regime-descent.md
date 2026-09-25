---
type: theorem
class: engineering-claim
status: proved
depends-on: [settlement-path, formality-layer, four-regime-dichotomy, scott-continuous-closure, agential-self-generation, settling-monotonicity, closure-rule-system, antecedent-regime-bound, regime-antimonotonicity]
see-also: [settlement-path-cost-monotonicity, agential-fixed-point-asymptote]
title: Maturation along the settlement path is a strict regime-descent
description: Claim.
---

# Maturation along the settlement path is a strict regime-descent

**Claim.** Each formality layer of the [settlement path](teaching/explanations/settlement-path.md) corresponds to a bounded regime in the [four-regime dichotomy](../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/references/four-regime-dichotomy.md):

| Layer | Formality | Regime bound |
|---|---|---|
| F₀ | Observation | All four regimes possible |
| F₁ | Instinct | At most Scott-continuous ($\kappa \leq \omega$) |
| F₂ | Skill | Strict ($\kappa < \omega$) |
| F₃ | Tool | Strict ($\kappa < \omega$) |

Maturation F₀ → F₁ → F₂ → F₃ is therefore a strict descent through the regime lattice.
No maturation transition increases the effective closure ordinal; each transition from F₁ onward strictly lowers it into the strict regime.

**Corollary — the agential-self-generation asymptote is the strict-regime limit.** A platform at the asymptote has all operative elements at F₃, hence all in the strict regime.
The fraction of operative elements in the strict regime is the natural regime-based measurement of asymptote-position.

## Why this holds — layer by layer

**F₀ (observation): regime unconstrained.** An observation-layer realization depends on language-model inference at invocation time.
Inference over accumulated evidence may aggregate across all prior stages before producing a consequent — the structural pattern of a non-Scott-continuous closure rule (antecedent quantifying over all earlier stages: "if every prior stage has shown $P$, then conclude $Q$").
Equivalently, the observation layer places no finitary constraint on the antecedent-reference set of the inference's governing closure rules.
All four regimes are structurally available.

**F₁ (instinct): at most Scott-continuous.** An instinct-layer realization carries a substrate-recorded trigger — a closure rule whose antecedent is the instinct's trigger predication.
By the instinct-record structure, the trigger predication is a finite conjunction of substrate cells: "pattern $P$ is present at entities $e_1, \ldots, e_n$."
The antecedent-reference set is finite at each firing, but the instinct may be consulted across an infinite (countable) sequence of invocations.
The instinct's closure operator is finitary at each step and hence [Scott-continuous](../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/closure-operator/content/scott-continuous-closure/scott-continuous-closure.md): it commutes with directed $\leq_k$-joins.
By the four-regime dichotomy, a Scott-continuous closure with at least one of $\mathbf{L}, E, \mathcal{C}$ countably infinite gives $\kappa \leq \omega$.
An instinct cannot exceed Scott-continuous regime because its trigger antecedent is structurally finite.

**F₂ (skill): strict regime.** A skill-layer realization carries a substrate-recorded procedure: a finite ordered sequence of steps, each with a finite precondition set (the step's predication antecedent references finitely many cells) and a finite consequent (the step's effect on a bounded cell neighborhood).
The skill's closure-rule subsystem $\mathcal{S}_{\mathrm{skill}}$ is finite — finitely many rules, each with finite antecedents over a finite step-local entity set.
By the four-regime dichotomy's strict-regime equivalence (finite $\mathbf{L}$, finite $E$, finite $\mathcal{C}$ for the skill's procedure closure) the closure ordinal is $\kappa < \omega$.
A skill procedure terminates in a number of settling steps bounded by the number of steps in the procedure.

**F₃ (tool): strict regime.** A tool-layer realization is a deterministic substrate operation — a finite sequence of closure-rule applications with finite antecedents.
Same argument as F₂, with the additional simplification that no model invocation is present.
The closure ordinal is at most the number of primitive operations in the tool's body.

## Why the descent is monotone

The descent from F₀ toward F₃ is a consequence of [settling-monotonicity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md) and the substrate-content growth at each transition:

- **F₀ → F₁**: the transition adds a trigger record to the substrate — a new closure rule with a finite antecedent.
  This addition replaces the infinitary inference-time aggregation with a substrate-resident finite trigger.
  The added rule strictly constrains the inference space, driving the effective closure ordinal from aperiodic/transfinite-bounded toward $\omega$.
- **F₁ → F₂**: the transition adds a procedure record — finitely many closure rules with step-local finite antecedents.
  This replaces the model's inference (even within an instinct's bounded scope) with substrate-deterministic steps.
  The added rules drive the closure ordinal from $\omega$ to some $n < \omega$.
- **F₂ → F₃**: the transition removes the last model-call placeholders in the skill's procedure.
  No new infinite-antecedent rules are added.
  The closure ordinal stays finite and the rule-set is fully deterministic.

Settling-monotonicity ensures this process is irreversible: once substrate content (the pattern record, the procedure record) is added, it cannot be removed without violating the substrate's monotone discipline.
The regime-descent is therefore directional.

## Agential-self-generation asymptote as regime-limit

The [agential self-generation](../../../agent/agential-self-generation/agential-self-generation.md) commitment is approached asymptotically: operative elements migrate from external, F₀-grade definitions into substrate entities at progressively lower formality layers.
By this theorem, the asymptote is reached when all operative elements are at F₃ (strict regime).
A platform's position on the asymptote is measurable as:

$$\mathrm{regime\text{-}score}(\mathcal{P}) \;:=\; \frac{\bigl|\{e \in \mathrm{OperativeElements}(\mathcal{P}) : \mathrm{regime}(e) = \mathrm{strict}\}\bigr|}{|\mathrm{OperativeElements}(\mathcal{P})|}$$

This is the *regime-distribution signal* — a substrate-extractable measurement (each operative element's layer is substrate-recorded; its regime follows from this theorem) that directly tracks asymptote-position.
The regime-distribution signal refines the substrate-coverage signal of the [agential-fixed-point-asymptote question](../../../agent/agential-self-generation/agential-fixed-point-asymptote/agential-fixed-point-asymptote.md): where coverage asks "is the element in the substrate at all?", regime-distribution asks "is it in the strict-regime stratum?"
The latter is a strictly stronger measurement.

## What the theorem does not claim

- The theorem does not claim F₁ is always Scott-continuous.
  A platform that never invokes its instincts over an infinite entity space has F₁ operations effectively in the strict regime.
  The bound is an upper bound, not a characterization.
- The theorem does not claim maturation is automatic.
  Each transition requires a substrate operation that produces the next-stage record; the cost of the transition is not bounded by this theorem (only the per-invocation cost after transition, per [settlement-path-cost-monotonicity](../settlement-path-cost-monotonicity/settlement-path-cost-monotonicity.md)).
- The theorem does not claim every F₀ operation is aperiodic.
  An observation-layer realization whose inference only consults a finite prior history is effectively in the strict regime; the theorem's bound is the worst case.
