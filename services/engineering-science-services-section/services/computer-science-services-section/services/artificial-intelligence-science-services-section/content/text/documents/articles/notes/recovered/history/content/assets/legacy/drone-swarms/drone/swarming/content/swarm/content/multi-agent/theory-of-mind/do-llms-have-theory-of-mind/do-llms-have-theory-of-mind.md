---
type: question
status: open
see-also:
  - teaching/explanations/machine-theory-of-mind.md
  - teaching/explanations/the-llm-tom-debate.md
  - ../theorems/tom-from-behavior-bound.md
---

# Do LLMs have theory of mind?

## The question

Do large language models have theory of mind — the capacity to attribute mental states (beliefs, desires, intentions) to other agents and use these attributions to predict and explain behavior?

The question is foundational to understanding what contemporary AI systems are.
It is also empirically contested and methodologically fraught.

## What "have ToM" means

The question is partly about what would count as evidence:

- **Behavioral.** Producing ToM-consistent behavior across tasks.
  By this criterion, LLMs have substantial ToM.
- **Mechanistic.** Implementing ToM-like circuits internally.
  Currently unclear; mechanistic interpretability is preliminary.
- **Functional.** Using attributed mental states across diverse novel scenarios.
  LLMs have partial ToM by this criterion — succeed on some, fail on others.
- **Pragmatic (Dennettian).** ToM attribution is predictively useful.
  By this criterion, attributing ToM to LLMs is sometimes useful, sometimes misleading.

These criteria yield different answers.
The dispute is partly about *which question is being asked*.

## Empirical evidence

**For:**

- LLMs pass classical false-belief tasks (Kosinski 2023): GPT-4 at high accuracy.
- LLMs perform many ToM-relevant tasks fluently: perspective-taking, inferring user intent, modeling others' beliefs.
- LLM agents in multi-agent simulations exhibit ToM-consistent coordination.

**Against:**

- LLMs fail systematic perturbations of ToM tasks (Ullman 2023): performance drops on surface-altered versions.
- LLMs hallucinate mental states inconsistent with context.
- LLMs sometimes confuse perspectives (own with others', current with past, etc.).
- Apparent ToM may reflect training-data pattern matching rather than robust capacity.

## Why the question is hard

- **Underdetermination.** Per [tom-from-behavior-bound](../theorems/tom-from-behavior-bound.md), behavior alone doesn't determine ToM presence.
- **Task sensitivity.** Performance varies across tasks; no clean yes/no answer.
- **Model variability.** Different LLMs perform differently; the question isn't about LLMs as a class.
- **Mechanism opacity.** Without mechanistic interpretability, what LLMs are *doing* is unclear.
- **Anthropomorphism risk.** ToM attribution to LLMs may reflect our pattern-matching rather than LLM capacity.

## Hypotheses

**Robust ToM.** LLMs implement something genuinely ToM-like; failures reflect implementation limitations.

**Surface ToM.** LLMs match surface features of ToM tasks; "ToM" is pattern matching, not capacity.

**Partial ToM.** LLMs have some ToM components (perspective-taking, intent inference) but not others (robust false-belief reasoning).

**Different ToM.** LLMs have ToM-relevant capacities but structurally different from human ToM.

**No ToM.** LLMs lack ToM in any meaningful sense; apparent ToM behavior is artifact.

The hypotheses are partly compatible (e.g., partial + different); discriminating among them requires more mechanistic and behavioral evidence.

## What progress would look like

- **Mechanistic interpretability of ToM circuits.** Identifying whether LLMs implement ToM-like representations.
- **Robust ToM benchmarks.** Tests resistant to surface-feature exploitation.
- **Cross-model comparison.** Whether ToM-like behavior depends on architecture, scale, training.
- **Predictive theory.** Theory predicting when LLM ToM would work and fail.
- **Developmental analogies.** Whether LLM ToM trajectory across training resembles human development.

Each is partially developed.

## Why it matters

- **AI alignment.** Aligned AI requires modeling user intentions accurately; ToM capacity matters.
- **AI deception.** Capable deception requires ToM; understanding LLM ToM bears on deception risk.
- **AI assistance.** Helpful assistants need ToM to model user mental states.
- **AI safety arguments.** Many alignment arguments invoke or assume ToM; the assumption deserves scrutiny.
- **Moral status.** ToM is sometimes invoked in moral- status arguments about AI.

## Status

Open and active.
The empirical record continues to accumulate.
The methodological dispute persists.
A clean answer is unlikely soon; progress will come from combining behavioral, mechanistic, and theoretical work.
The question is also evolving as LLMs become more capable — what was true of GPT-3 may not be true of GPT-5.
