---
type: reference
class: academic
status: cited
authors: [Yao, Shunyu, Zhao, Jeffrey, Yu, Dian, Du, Nan, Shafran, Izhak, Narasimhan, Karthik, Cao, Yuan]
year: 2023
title: "ReAct: Synergizing Reasoning and Acting in Language Models"
venue: "International Conference on Learning Representations (ICLR 2023)"
description: S.
---

## Source

S.
Yao, J.
Zhao, D.
Yu, N.
Du, I.
Shafran, K.
Narasimhan, Y.
Cao.
"ReAct: Synergizing Reasoning and Acting in Language Models."
In *International Conference on Learning Representations (ICLR 2023)*. arXiv:2210.03629.

## Form

Conference paper.
The canonical introduction of the *ReAct* prompting pattern that interleaves reasoning traces and tool-use actions in large-language-model agents.

## Content summary

Introduces *ReAct*: a prompting pattern in which a language model alternates between *thought* steps (free-form reasoning about the current state and the next action to take) and *act* steps (calling tools or producing actions whose results are observed and fed back into subsequent thoughts).
The paper demonstrates the pattern on question-answering (HotpotQA, FEVER), where the model interleaves reasoning about which Wikipedia article to consult with calls to a search tool, and on interactive task environments (ALFWorld, WebShop), where reasoning about the goal alternates with calls that act on the environment.
The result is that interleaving reasoning and acting outperforms reasoning-alone (Chain-of-Thought) and acting-alone (action-only agents) on both classes of task.
ReAct became the canonical reference for *agent loops* in the LLM era — observe → reason → act → observe → reason → act — and the conceptual ancestor of subsequent agent frameworks (LangChain agents, OpenAI function-calling agents, Anthropic agent loops).
