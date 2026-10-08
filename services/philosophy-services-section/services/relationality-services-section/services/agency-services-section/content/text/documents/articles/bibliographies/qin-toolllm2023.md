---
type: reference
class: foundational
status: active
authors: ["Yujia Qin", "Shihao Liang", "Yining Ye", "Kunlun Zhu", "Lan Yan", "Yaxi Lu", "Yankai Lin", "Xin Cong", "Xiangru Tang", "Bill Qian", "Sihan Zhao", "Lauren Hong", "Runchu Tian", "Ruobing Xie", "Jie Zhou", "Mark Gerstein", "Dahai Li", "Zhiyuan Liu", "Maosong Sun"]
year: 2023
venue: "ICLR 2024; arXiv:2307.16789"
title: "ToolLLM: Facilitating Large Language Models to Master 16000+ Real-world APIs"
description: Qin, Y.
---

# Qin et al. 2023 — ToolLLM

Qin, Y. et al. (2023).
ToolLLM: Facilitating Large Language Models to Master 16000+ Real-world APIs.
ICLR 2024. arXiv:2307.16789.

The paper introducing *ToolBench* (a corpus of 16,000+ real-world REST APIs from RapidAPI) and *ToolLLaMA* (an LLM fine-tuned for tool use at this scale).
The work extended Gorilla's approach to substantially larger real-world API registries.

Key contributions:

- **Largest tool-use benchmark.** ToolBench's 16,000+ APIs from RapidAPI represent realistic registry scale.
- **Depth-first search-based decision tree.** Algorithm for evaluating tool-call sequences, improving multi-step task success.
- **ToolEval.** Automatic evaluation framework for tool-use benchmarks.
- **Demonstration that fine-tuning competes with ChatGPT.** ToolLLaMA approached ChatGPT-level tool use with open weights.

ToolLLM demonstrated that large-scale tool use was a tractable problem and that the open-source ecosystem could approach closed-vendor tool-use quality with appropriate training.

The paper has been influential in:

- Establishing benchmarks for tool-use evaluation at scale.
- Demonstrating retrieval + selection as viable for large registries.
- Justifying investment in tool-specialized models.

Cited by: [tool-selection](../../../glossary/concepts/tool-selection.md), [tool-registry](../notes/undated/tool-registry.md).
