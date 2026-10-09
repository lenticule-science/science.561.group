---
type: reference
class: academic
status: cited
authors: [Park, Joon Sung, O'Brien, Joseph C., Cai, Carrie J., Morris, Meredith Ringel, Liang, Percy, Bernstein, Michael S.]
year: 2023
title: "Generative Agents: Interactive Simulacra of Human Behavior"
venue: "Proceedings of the 36th Annual ACM Symposium on User Interface Software and Technology (UIST '23), Article 2"
description: J.S.
---

## Source

J.S. Park, J.C. O'Brien, C.J. Cai, M.R. Morris, P.
Liang, M.S. Bernstein.
"Generative Agents: Interactive Simulacra of Human Behavior."
In *Proceedings of the 36th Annual ACM Symposium on User Interface Software and Technology (UIST '23)*, Article 2, 2023. arXiv:2304.03442.

## Form

Conference paper.
The canonical reference for *generative agents* — LLM-driven agents that maintain persistent memory, reflect on their experiences, and plan over long timescales — and the source of the widely-cited *Smallville* simulation in which 25 such agents lived together and produced emergent social behavior.

## Content summary

Introduces a *generative-agent* architecture with three load-bearing components: (1) a *memory stream* recording the agent's full experience as natural-language observations, with retrieval ranked by recency, importance, and relevance; (2) a *reflection* mechanism that synthesizes higher-level inferences from recent memories (e.g., "I am a writer; I should attend tonight's poetry reading") and stores these reflections back in the memory stream as new memories; (3) a *planning* mechanism that generates daily plans top-down (broad sketch first, then progressively decomposed into hour-by-hour plans, then into action sequences) using the agent's reflections and persona as input.
The paper demonstrates the architecture in *Smallville*, a 2D town in which 25 generative agents form relationships, plan and attend a Valentine's Day party, and exhibit emergent social coordination without scripted interactions.
The architecture became the canonical reference for *long-horizon, persistent-memory* LLM agents.
