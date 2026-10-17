---
type: question
status: open
see-also:
  - teaching/explanations/machine-theory-of-mind.md
  - does-tom-require-embodiment.md
---

# Can theory of mind be learned from text alone?

## The question

LLMs are trained primarily on text (with some multimodal data).
Their training data describes mental states extensively — characters in stories have beliefs, desires, plans; people in conversations attribute mental states to each other.
Can ToM be learned from text alone, or does it require something text doesn't provide?

The question is empirically underdetermined and theoretically contested.

## What's at stake

If ToM can be learned from text alone:

- Pure-text-trained LLMs can in principle have robust ToM.
- Apparent LLM ToM is plausibly genuine learned capacity, not artifact.
- Scaling text training could improve ToM systematically.
- Multimodal training is not necessary for ToM.

If ToM requires more than text:

- LLM ToM is fundamentally limited by text-only training.
- Apparent ToM is more likely surface pattern matching.
- Multimodal embodied training may be necessary for robust ToM.
- Architectural changes beyond text prediction may be necessary.

The question is therefore central to predicting LLM ToM trajectory.

## Why text might suffice

- **Text describes mental states richly.** Stories, conversations, psychology texts contain extensive mental-state attribution.
- **ToM tasks are textual.** Standard false-belief tasks can be presented in text.
- **Linguistic categories carve mental states.** Beliefs, desires, intentions are linguistically marked categories that text-trained models can learn.
- **Empirical success.** LLMs perform many ToM tasks fluently when prompted, suggesting text training provides at least some ToM substrate.

## Why text might not suffice

- **No grounding.** Text describes mental states but doesn't ground them in experienced agency.
- **No first-person perspective.** Without first-person experience, modeling first-person perspectives is inferential at best.
- **No embodied interaction.** Real ToM develops through interactive social experience; text training lacks this.
- **Pattern matching trap.** Rich mental-state description in text enables pattern matching that *looks like* ToM without being it.
- **Brittleness.** LLM ToM brittleness on perturbation tests (Ullman 2023) is consistent with text-derived pattern matching rather than genuine ToM learning.

## What evidence might bear

- **Comparison with multimodal models.** If multimodal models exhibit substantially more robust ToM than text-only models, text training is insufficient.
- **Embodied LLM agents.** Whether agents with rich interactive experience develop better ToM than text-only models.
- **Mechanistic analysis.** Whether text-trained LLMs develop ToM-like representations.
- **Developmental analogy.** Whether the LLM ToM trajectory resembles or diverges from human ToM development (which involves text exposure but not primarily).

Some of this evidence is being developed; results are preliminary.

## Hypotheses

**Text suffices.** Pure text training can produce robust ToM with sufficient scale and appropriate data.

**Text suffices for partial ToM.** Text training produces some ToM components (recognition of mental- state vocabulary, surface attribution patterns) but not robust ToM.

**Text doesn't suffice for ToM.** Pure text training cannot produce ToM; apparent ToM is artifact.

**Text + tasks suffices.** Text training plus task- oriented fine-tuning (e.g., RLHF on ToM tasks) can produce ToM.

**Text + multimodal suffices.** Text combined with multimodal grounding suffices; text alone doesn't.

The hypotheses are not mutually exclusive at the boundaries (e.g., what counts as "robust" ToM matters).

## Why it matters

- **Predicting LLM ToM trajectory.** What text scaling can and cannot achieve.
- **Architectural implications.** Whether new architectures are needed for robust ToM.
- **Embodied AI investment.** Whether embodied AI is necessary for AI cognitive capacities.
- **Cognitive science.** Bears on how ToM is acquired in humans (text vs experience).

## Status

Open.
Empirical investigation is preliminary; the question requires comparing capabilities across training paradigms with controlled methodology that isn't yet standardized.
Likely to be answered gradually as empirical evidence accumulates and multimodal/embodied AI matures for comparison.
