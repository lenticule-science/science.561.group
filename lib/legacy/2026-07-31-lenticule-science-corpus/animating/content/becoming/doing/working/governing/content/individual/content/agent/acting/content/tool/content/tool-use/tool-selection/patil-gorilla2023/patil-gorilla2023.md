---
type: reference
class: foundational
status: active
authors: ["Shishir G. Patil", "Tianjun Zhang", "Xin Wang", "Joseph E. Gonzalez"]
year: 2023
venue: "arXiv:2305.15334"
title: "Gorilla: Large Language Model Connected with Massive APIs"
---

# Patil et al. 2023 — Gorilla

Patil, S.G., Zhang, T., Wang, X., & Gonzalez, J.E. (2023).
Gorilla: Large Language Model Connected with Massive APIs. arXiv:2305.15334.

The paper introducing *Gorilla*, an LLaMA-based model fine-tuned to make accurate API calls across thousands of APIs (HuggingFace, TorchHub, TensorFlow Hub combined).
Demonstrated that LLM tool-call accuracy could substantially exceed prompt-based baselines for large API registries through targeted fine-tuning.

Key contributions:

- **Scaling tool use to thousands of APIs.** Where earlier systems handled tens of tools, Gorilla handled thousands.
- **Retrieval-augmented training.** During training, retrieve relevant API documentation as context.
- **Hallucination reduction.** Substantially fewer hallucinated API calls than prompt-only baselines on large registries.
- **Open release.** Gorilla weights and dataset released, enabling community work.

Gorilla showed that *specialized tool-use models* could substantially outperform general models on tool use, justifying targeted training for tool-heavy applications.
It anticipated subsequent work on tool- specialized models (ToolLLM, etc.) and the general direction of vendor function-calling APIs improving through tool-specific training.

The paper helped establish the *retrieval + selection* pattern for large tool registries that is now standard.

Cited by: [tool-selection](teaching/explanations/tool-selection.md), [tool-discovery](../morphisms/tool-discovery.md), [from-react-to-tool-use](teaching/explanations/from-react-to-tool-use.md).
