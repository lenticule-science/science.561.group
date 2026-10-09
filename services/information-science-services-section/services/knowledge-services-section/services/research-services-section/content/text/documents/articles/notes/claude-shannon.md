---
title: "Claude Shannon"
date-created: 2026-03-03T00:00:00
type: person
aliases:
  - "Shannon"
  - "Claude Shannon"
  - "Claude E. Shannon"
keywords:
  - mathematics
description: "American mathematician and electrical engineer whose mathematical theory of communication founded information theory, defining information as the reduction of uncertainty."
cites:
  - "A Mathematical Theory of Communication"
---

Claude Elwood Shannon (1916–2001) was an American mathematician and electrical engineer. His 1948 paper "A Mathematical Theory of Communication" [cite:@shannon_MathematicalTheoryCommunication_1948] founded information theory as a mathematical discipline, providing the formal framework for quantifying, transmitting, and encoding information.

## Core ideas

- **Information as uncertainty reduction**: Shannon defined information not as meaning but as the resolution of uncertainty. A message carries information to the extent that it narrows the set of possible states the receiver considers. This definition deliberately excludes semantics — Shannon's information theory measures how much is communicated, not what. This exclusion is both the theory's power (it applies universally to any communication channel) and its limit (it cannot address meaning, relevance, or significance).
- **Entropy**: Shannon adopted the term entropy from thermodynamics to name the average uncertainty in a random variable — equivalently, the average amount of information produced per message. A source with high entropy produces messages that are hard to predict; a source with low entropy produces messages that are easy to predict. Shannon entropy provides the theoretical limit on lossless data compression.
- **Channel capacity**: Shannon proved that every communication channel has a maximum rate — the channel capacity — at which information can be transmitted with arbitrarily low error probability. This theorem, the noisy channel coding theorem, is the foundational result of information theory: it guarantees that reliable communication is possible even over noisy channels, provided the transmission rate stays below capacity.
- **Redundancy and noise**: Shannon's framework distinguishes signal (the intended message) from noise (unwanted disturbance in the channel). Redundancy — the inclusion of more symbols than strictly necessary — allows the receiver to detect and correct errors introduced by noise. Natural languages are highly redundant; mathematical codes can be designed with optimal redundancy for specific channels.

## Notable works

- "A Mathematical Theory of Communication" (1948) [cite:@shannon_MathematicalTheoryCommunication_1948]
- "Communication Theory of Secrecy Systems" (1949)
- "Prediction and Entropy of Printed English" (1951)

## Related

- [Norbert Wiener](./norbert-wiener.md) — fellow founder of the information-[cybernetics](../../information/disciplines/cybernetics/index.md) nexus
- [Cybernetics](../../information/terms/cybernetics.md) — the parallel discipline of feedback and control
- [Gregory Bateson](./gregory-bateson.md) — extended information theory into ecology and mind
