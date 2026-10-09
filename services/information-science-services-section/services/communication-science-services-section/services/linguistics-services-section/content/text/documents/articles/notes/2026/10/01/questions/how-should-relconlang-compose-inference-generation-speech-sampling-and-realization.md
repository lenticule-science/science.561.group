---
kind: question
status: open-with-established-separation
explores:
  - relconlang
  - signcraft
  - generation
  - inference
  - realization
  - pragmatics
---
# How should RelConLang compose inference generation, speech sampling, and realization?

The current software uses "generation" for at least two different operations.

`signcraft/inference/generate` performs **knowledge-state continuation**. It finds enabled attributes, scores them through closure and disagreement energy, then samples one semantic move. It does not generate RelConLang surface text.

`signcraft/inference/speak` performs **corpus-continuation surface sampling**. It selects a predicate and arguments from attested saturation fibers and emits a simple RelConLang clause. It does not consult target evidence or realize most RelConLang grammar.

The actual language-specific operation still missing is **semantic realization**:

[
(Intent, Content, Context, Stance, Force, Register)
longrightarrow Surface.
]

A plausible experimental composition is therefore:

[
KnowledgeState
	o CandidateMeaning
	o EmissionPolicy
	o RealizationPlan
	o RelConLangSurface.
]

An inference continuation may propose content, but it does not itself become speech. A corpus-sampled clause may be useful for language-evolution experiments, but it does not acquire epistemic warrant by being sampled.

The work should preserve separate receipt types for inference choice, lexical sampling, semantic preservation, and evidential warrant.
