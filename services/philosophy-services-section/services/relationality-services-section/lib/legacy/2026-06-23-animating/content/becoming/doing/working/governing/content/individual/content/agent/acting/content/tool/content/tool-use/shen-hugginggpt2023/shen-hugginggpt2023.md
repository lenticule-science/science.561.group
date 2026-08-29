---
type: reference
class: foundational
status: active
authors: ["Yongliang Shen", "Kaitao Song", "Xu Tan", "Dongsheng Li", "Weiming Lu", "Yueting Zhuang"]
year: 2023
venue: "NeurIPS 2023; arXiv:2303.17580"
title: "HuggingGPT: Solving AI Tasks with ChatGPT and its Friends in Hugging Face"
---

# Shen et al. 2023 — HuggingGPT

Shen, Y., Song, K., Tan, X., Li, D., Lu, W., & Zhuang, Y.
(2023).
HuggingGPT: Solving AI Tasks with ChatGPT and its Friends in Hugging Face.
NeurIPS 2023. arXiv:2303.17580.

The paper introducing *HuggingGPT*, a system using ChatGPT as orchestrator to coordinate ML models from HuggingFace as tools.
The system:

1. **Task planning.** ChatGPT decomposes user request into sub-tasks.
2. **Model selection.** Selects HuggingFace models appropriate for each sub-task.
3. **Task execution.** Invokes selected models.
4. **Response generation.** Aggregates results into final response.

Key contributions:

- **LLM-as-orchestrator pattern.** Demonstrated LLMs could effectively coordinate other ML models as tools.
- **Cross-modal capability.** Combining vision, speech, language models through tool use.
- **End-to-end task completion.** Sophisticated tasks requiring multiple specialized models completed through tool composition.

HuggingGPT was influential in:

- Establishing *LLMs as orchestrators* as a viable pattern.
- Demonstrating *ML models as tools* — extending tool use beyond APIs to include other AI systems.
- Foreshadowing multi-agent and multi-model architectures that became prominent subsequently.

The specific system was a research demonstration; the *pattern* it demonstrated has become standard in production agentic systems that combine LLM orchestration with specialized models for vision, speech, code, and other modalities.

Cited by: [tool-selection](teaching/explanations/tool-selection.md).
