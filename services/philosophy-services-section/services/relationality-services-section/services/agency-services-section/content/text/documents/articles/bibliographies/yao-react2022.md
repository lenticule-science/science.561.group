---
type: reference
class: foundational
status: active
authors: ["Shunyu Yao", "Jeffrey Zhao", "Dian Yu", "Nan Du", "Izhak Shafran", "Karthik Narasimhan", "Yuan Cao"]
year: 2022
venue: "ICLR 2023; arXiv:2210.03629"
title: "ReAct: Synergizing Reasoning and Acting in Language Models"
description: Yao, S., Zhao, J., Yu, D., Du, N., Shafran, I., Narasimhan, K., & Cao, Y.
---

# Yao et al. 2022 — ReAct

Yao, S., Zhao, J., Yu, D., Du, N., Shafran, I., Narasimhan, K., & Cao, Y.
(2022).
ReAct: Synergizing Reasoning and Acting in Language Models.
ICLR 2023. arXiv:2210.03629.

The foundational paper introducing the *ReAct* paradigm — interleaving reasoning (thought) and acting (tool calls / observations) in LLM agents.
The thought-action- observation loop is the structural template underlying essentially all subsequent agentic LLM systems.

Key contributions:

- **The interleaving insight.** Pure reasoning hallucinates; pure acting lacks direction; the loop lets each correct the other.
- **Demonstration of the gain.** Outperformed both pure-reasoning (CoT) and pure-acting baselines on knowledge-intensive (HotpotQA, FEVER) and decision-making (ALFWorld, WebShop) tasks.
- **Generalization across tasks.** The pattern works across diverse task types, suggesting the loop structure captures something general.

The paper's structural insight has aged well — every production agentic LLM system uses some form of the ReAct loop.
The specific implementation has evolved (prompt-based → function-calling APIs → computer use) but the loop structure is invariant.

ReAct is now standard pedagogical material for agentic LLMs and standard architectural template for new agentic systems.

Cited by: [tool-augmented-generation](../../../glossary/concepts/tool-augmented-generation.md), [action-trace](../notes/undated/action-trace.md), [from-react-to-tool-use](../notes/undated/from-react-to-tool-use.md).
