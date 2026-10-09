---
type: bibliography
key: silver2017
reference-type: article
authors:
  - Silver, David
  - Schrittwieser, Julian
  - Simonyan, Karen
  - Antonoglou, Ioannis
  - Huang, Aja
  - Guez, Arthur
  - Hubert, Thomas
  - Baker, Lucas
  - Lai, Matthew
  - Bolton, Adrian
  - Chen, Yutian
  - Lillicrap, Timothy
  - Hui, Fan
  - Sifre, Laurent
  - van den Driessche, George
  - Graepel, Thore
  - Hassabis, Demis
year: 2017
title: "Mastering the game of Go without human knowledge"
journal: "Nature 550(7676): 354–359"
doi: "10.1038/nature24270"
description: "This is the AlphaGo Zero paper: unlike its 2016 predecessor (silver2016), it trains purely by reinforcement learning from self-play, starting from random play with no human game records at all, and surpasses every prior AlphaGo version."
---

## Why this is central

This is the AlphaGo Zero paper: unlike its 2016 predecessor
([silver2016](silver2016.md)), it trains purely by reinforcement learning
from self-play, starting from random play with no human game records at
all, and surpasses every prior AlphaGo version. It is cited alongside the
2016 paper in [Weiqi Strategic Theory](../research-articles/2026-08-29-note-on-weiqi-strategic-theory.md)
as one of the two works establishing "the AI-era revisions" to
professional Go judgment (invasions, joseki, komi values), and the
paper's own finding — that the system "independently discovers the same
fundamental principles of the game that took humans millennia to
conceptualize" — is the empirical basis for treating engine judgment as
evidence about Go strategy at all, which is the working assumption behind
this section's own engine-review plans.

Architecturally, this paper's self-play-only training loop and combined
policy/value network are the direct lineage [wu2019](wu2019.md) (KataGo)
names explicitly as what it accelerates: "Like AlphaZero and replications
such as ELF OpenGo and Leela Zero, our bot KataGo only learns from
neural-net-guided Monte Carlo tree search self-play" — a training regime
this paper introduced for Go before AlphaZero generalized it to chess and
shogi.

## What it does not settle

The paper is silent on strategy vocabulary (aji, thickness, direction of
play) and on endgame theory — its contribution is a training method and
an empirical result, not a strategic account. [Obsmetrologia and Go Strategy](../research-articles/obsmetrologia-and-go-strategy.md)
notes that engine evaluation of this kind is "monolithic" and does not
localize *why* a position favors one side, which is exactly the gap that
note's own conjectures (coordination cohomology, the inconsistency sheaf)
are aimed at, not answered by this paper or its successors.

## Bridges

- [silver2016](silver2016.md) — the supervised-learning-assisted predecessor this paper supersedes
- [wu2019](wu2019.md) — KataGo, the direct architectural and training-regime successor
- [Weiqi Strategic Theory](../research-articles/2026-08-29-note-on-weiqi-strategic-theory.md) — cites this paper for the AI-era revaluation of settled judgment
- [Obsmetrologia and Go Strategy](../research-articles/obsmetrologia-and-go-strategy.md) — names the limits of engine evaluation this paper's lineage produces
