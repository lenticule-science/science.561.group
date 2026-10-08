---
type: reference
class: foundational
status: active
authors: ["Timo Schick", "Jane Dwivedi-Yu", "Roberto Dessì", "Roberta Raileanu", "Maria Lomeli", "Luke Zettlemoyer", "Nicola Cancedda", "Thomas Scialom"]
year: 2023
venue: "NeurIPS 2023; arXiv:2302.04761"
title: "Toolformer: Language Models Can Teach Themselves to Use Tools"
description: Schick, T., Dwivedi-Yu, J., Dessì, R., Raileanu, R., Lomeli, M., Zettlemoyer, L., Cancedda, N., & Scialom, T.
---

# Schick et al. 2023 — Toolformer

Schick, T., Dwivedi-Yu, J., Dessì, R., Raileanu, R., Lomeli, M., Zettlemoyer, L., Cancedda, N., & Scialom, T.
(2023).
Toolformer: Language Models Can Teach Themselves to Use Tools.
NeurIPS 2023. arXiv:2302.04761.

The paper demonstrating that LLMs can learn tool use *self-supervised* — generating their own training data for tool calls.
The approach:

1. Sample candidate tool-call insertion points in training text.
2. Generate candidate calls.
3. Evaluate whether each call improves prediction of subsequent tokens.
4. Retain useful calls; discard others.
5. Fine-tune on the resulting tool-augmented corpus.

Result: the model learns to invoke tools (calculator, search, calendar, translation, QA system) at appropriate points in generation, without prompting.

Key contributions:

- **Self-supervised tool learning.** Tool use becomes a learned capacity rather than purely prompted.
- **Demonstration of the approach.** Successful tool invocation across multiple tool types.
- **Architectural template.** The self-supervised pattern has been applied in subsequent work to other capabilities.

The paper was influential in establishing tool use as a *model capability* rather than just a deployment technique.
Subsequent work (Toolformer-style training of newer models, ToolLLM, etc.) builds on this.

The approach has limits — Toolformer's tool list was relatively small; scaling to large tool registries required different techniques (Gorilla, ToolLLM).

Cited by: [tool-augmented-generation](../../../glossary/concepts/tool-augmented-generation.md), [from-react-to-tool-use](../notes/undated/from-react-to-tool-use.md).
