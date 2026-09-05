---
type: question
class: open-problem
status: open
see-also:
  - ../objects/alignment-tax.md
  - ../theorems/corrigibility-capability-tension.md
  - teaching/explanations/corrigibility.md
references:
  - references/ngo-alignment2022.md
  - references/soares-corrigibility2015.md
---

# Minimum viable alignment tax

The [alignment tax](../objects/alignment-tax.md) is the capability cost paid for alignment interventions.
The [corrigibility-capability-tension](../theorems/corrigibility-capability-tension.md) theorem establishes that the tax is generically non-zero for any non-trivial corrigibility property.

**Question.** What is the *smallest* alignment tax compatible with a specified safety property — operationally: how cheaply can a model achieve a given level of corrigibility, refusal-correctness, or non-deception, measured in capability-benchmark loss?

## Why this matters strategically

The alignment tax determines the **market dynamics** of safety:

- If the tax is **large** (e.g. >20% on capability benchmarks): a developer that pays the tax is at substantial commercial disadvantage.
  Without external coordination (regulation, shared standards), market pressure favors developers who pay less tax.
  The result: safety levels are set by competitive pressure, not by what is achievable.

- If the tax is **small** (e.g. <5%): paying the tax is commercially feasible.
  Developers can choose to pay it without losing the market.
  Safety levels are then set by developer preference and user demand.

- If the tax is **zero or negative** (alignment improvements also improve capability): the tax does not constrain deployment.
  Capability and alignment are aligned.
  (This has been argued empirically for *helpfulness* — RLHF for helpfulness improves benchmark performance — but the argument doesn't obviously extend to *harmlessness*, *corrigibility*, or *non-deception*.)

The question of which regime we are in determines whether market forces work for or against alignment.

## Decomposition

The minimum tax is a function of:

- **The safety property.** Different properties cost different amounts.
  "Refuses obvious harm" is cheap; "is robustly corrigible under capability fine-tuning" appears very expensive.
- **The model class.** A model architecture more amenable to alignment interventions has a lower tax than one less amenable.
- **The training procedure.** Curriculum, ordering, and combination of alignment interventions affect the tax (some interventions interfere; some compose).
- **The capability metric.** The tax depends on what capability is being measured.
  Refusal training has small tax on math benchmarks and larger tax on benchmarks involving sensitive but legitimate topics (chemistry, biology, security).

A complete answer would specify these dependencies, not just produce a single number.

## Empirical observations as of 2026

**RLHF-for-helpfulness tax: approximately zero or negative.** Models RLHF-trained for helpfulness benchmark *better* on most capability benchmarks than the base models they are trained from, on most benchmarks.
The exception: a small number of benchmarks where politically sensitive or evaluator-disapproved content is required; these regress.

**RLHF-for-harmlessness tax: small to moderate (1–10%).** Refusal training imposes measurable but typically tolerable cost on adjacent legitimate tasks.
The cost is highly task-specific.

**Constitutional-AI tax: comparable to or smaller than human-RLHF tax for similar safety properties.** AI-feedback alignment is empirically more sample-efficient and (per intervention) less capability-costly than direct human-preference alignment.
Whether it achieves the same *quality* of alignment is open.

**Robust corrigibility tax: appears to be very large or infinite.** Refusal behaviors are removed by light fine-tuning; preserving them under fine-tuning pressure has not been demonstrated at acceptable capability cost.
The [is-corrigibility-stable-under-self-modification](is-corrigibility-stable-under-self-modification.md) question is the structural form.

**Inner-alignment tax: not measurable.** No deployed alignment technique demonstrably addresses inner alignment at any cost; the tax for *adequate* inner alignment is therefore not bounded above.

## What would resolve the question

A clean answer requires both:

1. A precise specification of the safety property of interest.
2. An achievability result (a training procedure achieving the property at measurable capability cost) plus a lower-bound result (a no-go showing no procedure achieves the property at lower cost).

Neither has been produced for any non-trivial safety property as of 2026.
The empirical observations above are achievability data without lower bounds; the lower bounds would require theoretical analysis of the policy class in question.

## Subquestions worth resolving

**Q1.** What is the minimum capability cost for *robust refusal* — refusal that survives moderate fine-tuning by an adversarial party?
Currently appears to be very high or infinite; a quantitative answer would inform regulation discussions about safe-use commitments.

**Q2.** Is the inner-alignment tax bounded?
Some informal arguments say no (any inner-alignment guarantee on a sufficiently capable model requires substantial constraints that limit capability); a formal version would be valuable.

**Q3.** Does the constitutional-AI tax composite favorably with RLHF tax?
Stacking alignment interventions has historically been super-additive in cost; whether constitutional + RLHF is better than either alone is empirically suggested but not formally analyzed.

**Q4.** What is the tax for *deployment-time* alignment monitoring (continuous oversight) versus training-time alignment training?
Different cost structures; deployment-time alignment is more operationally expensive but allows the trained model to be capability-maximal.

## Connection to deployment economics

The minimum-tax question is directly relevant to whether competitive markets produce safe AI:

- If the answer is "tax is small," competitive markets can produce safe AI; the structural problem is achieving coordination on *what* safety properties to require.
- If the answer is "tax is large for the load-bearing safety properties," competitive markets cannot produce safe AI without external coordination; the safety regime must be enforced by governance, not by market preference.

Current evidence (refusal-tax small, robust-corrigibility-tax infinite) suggests the answer differs across safety properties, with the most load-bearing property (robust corrigibility under fine-tuning) in the regime where market forces work *against* safety.
The alignment-strategy implications are uncomfortable but follow from the empirical observations.

The question is therefore a target both for technical research (reducing the tax) and for governance research (operating in the high-tax regime).
