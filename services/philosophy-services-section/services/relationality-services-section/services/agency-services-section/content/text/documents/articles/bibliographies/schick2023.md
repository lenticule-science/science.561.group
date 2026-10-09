---
type: reference
class: preprint
status: active
cites:
  - teaching/explanations/environmental-action.md
  - teaching/explanations/tool-schema.md
  - ../objects/tool-call.md
  - ../morphisms/tool-invocation.md
  - ../theorems/tool-schema-bounds-action-space.md
title: Schick et al. (2023) — Toolformer
description: "Full citation: Schick, T., Dwivedi-Yu, J., Dessì, R., Raileanu, R., Lomeli, M., Zettlemoyer, L., Cancedda, N., and Scialom, T."
---

# Schick et al. (2023) — Toolformer

**Full citation:** Schick, T., Dwivedi-Yu, J., Dessì, R., Raileanu, R., Lomeli, M., Zettlemoyer, L., Cancedda, N., and Scialom, T.
"Toolformer: Language Models Can Teach Themselves to Use Tools." arXiv 2302.04761, 2023.
Published at NeurIPS 2023.

## Summary

Toolformer demonstrates that language models can be trained to use external APIs — a calculator, a QA system, a Wikipedia search, a translation API, a calendar — without requiring human annotations for when and how to call them.
The model learns to insert API calls in its own text generation and use the results to produce more accurate continuations.

The mechanism: the model generates text containing API call markup (e.g., `[Calculator(3+4) → 7]`); the markup is executed; the result is inserted into the text.
This is the first systematic demonstration that language models could be taught to invoke structured external functions as part of their generation process.

## Contribution to the agents theory

Toolformer is the empirical origin of the tool-use mechanism that the agents theory takes as foundational.
The [environmental-action](../../../glossary/concepts/environmental-action.md) concept, the [tool-schema](../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/content/tool/content/tool-use/schick2023/teaching/explanations/tool-schema.md) concept, and the [tool-invocation](../notes/undated/tool-invocation.md) morphism all depend on the tool-use mechanism that Toolformer demonstrates is learnable.

The [tool-schema-bounds-action-space](../notes/undated/tool-schema-bounds-action-space.md) theorem's Part 1 (the model cannot invoke what is not in the schema set) is the operational constraint that Toolformer illustrates: the model produces API call markup only for APIs it was trained on (or provided in context).
The schema set defines the boundary of what the model can call.
