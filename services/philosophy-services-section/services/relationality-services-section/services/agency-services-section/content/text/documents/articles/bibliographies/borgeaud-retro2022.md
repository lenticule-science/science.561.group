---
type: reference
class: foundational
status: active
authors: ["Sebastian Borgeaud", "Arthur Mensch", "Jordan Hoffmann", "Trevor Cai", "Eliza Rutherford", "Katie Millican", "George van den Driessche", "Jean-Baptiste Lespiau", "Bogdan Damoc", "Aidan Clark", "et al."]
year: 2022
venue: "ICML 2022"
title: "Improving Language Models by Retrieving from Trillions of Tokens"
description: Borgeaud, S., Mensch, A., Hoffmann, J., Cai, T., Rutherford, E., Millican, K., van den Driessche, G., Lespiau, J.-B., Damoc, B., Clark, A., et al.
---

# Borgeaud et al. 2022 — RETRO

Borgeaud, S., Mensch, A., Hoffmann, J., Cai, T., Rutherford,
E., Millican, K., van den Driessche, G., Lespiau, J.-B.,
Damoc, B., Clark, A., et al. (2022). Improving Language
Models by Retrieving from Trillions of Tokens. *ICML 2022*.

RETRO (Retrieval-Enhanced Transformer) integrates retrieval
deep into the transformer architecture rather than only at
input, with a frozen retriever returning chunks from a
2-trillion-token database. Cross-attention layers allow each
intermediate transformer block to consult retrieved chunks.

Key result: RETRO matches the performance of a 25× larger
parameter-only model on language modeling, by externalizing
knowledge to the retrieval database. This gave concrete
evidence that the *small model + large memory* architecture
can compete with the *large model* architecture at substantial
parameter savings.

The architectural pattern (retrieval at every layer, not just
at input) influences subsequent retrieval-augmented LM work,
though most production deployments still use the simpler
input-augmented form from Lewis et al. 2020.

Cited by:
[retrieval-augmented-generation](../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/memory/archive/teaching/explanations/retrieval-augmented-generation.md).
