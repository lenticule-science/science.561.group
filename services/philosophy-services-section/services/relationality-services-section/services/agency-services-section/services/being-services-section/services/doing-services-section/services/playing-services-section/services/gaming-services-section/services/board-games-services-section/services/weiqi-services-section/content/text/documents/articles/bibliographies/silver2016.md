---
type: bibliography
key: silver2016
reference-type: article
authors:
  - Silver, David
  - Huang, Aja
  - Maddison, Chris J.
  - Guez, Arthur
  - Sifre, Laurent
  - van den Driessche, George
  - Schrittwieser, Julian
  - Antonoglou, Ioannis
  - Panneershelvam, Veda
  - Lanctot, Marc
  - Dieleman, Sander
  - Grewe, Dominik
  - Nham, John
  - Kalchbrenner, Nal
  - Sutskever, Ilya
  - Lillicrap, Timothy
  - Leach, Madeleine
  - Kavukcuoglu, Koray
  - Graepel, Thore
  - Hassabis, Demis
year: 2016
title: "Mastering the game of Go with deep neural networks and tree search"
journal: "Nature 529(7587): 484–489"
doi: "10.1038/nature16961"
---

## Why this is central

This is the AlphaGo paper: a policy network (trained first by supervised
learning on human expert games, then refined by reinforcement learning
through self-play) and a value network, combined with Monte Carlo tree
search, achieving a 99.8% win rate against other Go programs and beating
the human European champion 5–0. It is the founding document of the
"AI-era rebalancing" this corpus already names: [Weiqi Strategic Theory](../research-articles/2026-08-29-note-on-weiqi-strategic-theory.md)
credits "AlphaGo and successors" from 2016 onward with revaluing several
settled professional judgments — the early 3-3 invasion under a 4-4
stone became standard, several long-canonical joseki were shown slightly
bad for one side, komi values were re-estimated — and cites this paper
and its 2017 successor by name for exactly that claim, again under a
"verify before public use" flag this carrier discharges.

It also grounds the AI-opponent lineage this section's own platform
planning depends on: [Go-Science History](../notes/2026-08-29-note-on-goscience-history.md)
describes an implementation ladder for in-app opponents running from
scripted heuristics through "shaped GnuGo Phase 2" to "KataGo human-style
nets Phase 3" — the tree-search-plus-network architecture this paper
introduced is the direct ancestor of every engine on that ladder.

## What it does not settle

AlphaGo (2016) still trains from human game records as a supervised-learning
starting point before self-play reinforcement learning refines it — the
"without human knowledge" claim belongs only to its 2017 successor,
[silver2017](silver2017.md). Nothing here addresses Go strategy vocabulary
(influence, thickness, aji) directly; the paper is an engineering and
machine-learning result whose *effect* on professional strategic judgment
is documented elsewhere in this corpus, not by the paper itself.

## Bridges

- [silver2017](silver2017.md) — the self-play-only successor this paper's supervised-learning stage precedes
- [Weiqi Strategic Theory](../research-articles/2026-08-29-note-on-weiqi-strategic-theory.md) — cites this paper for the AI-era revaluation of joseki, invasions, and komi
- [Go-Science History](../notes/2026-08-29-note-on-goscience-history.md) — the opponent-strength ladder this paper's architecture sits atop
- [Weiqi/Go App Landscape](../notes/2026-08-29-note-on-go-app-landscape.md) — the market of KataGo-descended play/analysis tools this lineage produced
