---
type: bibliography
key: katago-analysis-engine
reference-type: misc
authors:
  - Wu, David J.
  - lightvector (KataGo project)
year: 2020
title: "KataGo Analysis Engine documentation"
publisher: GitHub
url: "https://github.com/lightvector/KataGo/blob/master/docs/Analysis_Engine.md"
description: The KataGo analysis engine is a JSON-over-stdin/stdout interface, distinct from GTP, purpose-built to analyze large numbers of positions in parallel with cross-position batching — the documentation states it is "primarily intended for…
---

## Why this is central

The KataGo analysis engine is a JSON-over-stdin/stdout interface,
distinct from GTP, purpose-built to analyze large numbers of positions in
parallel with cross-position batching — the documentation states it is
"primarily intended for people writing tools — for example, to run as
the backend of an analysis server or website," with an example
configuration shipped at `cpp/configs/analysis_example.cfg`. This is the
specific protocol [Reframe and Standards](../notes/2026-08-29-note-on-reframe-and-standards.md)
names as this section's third canonical outside-format boundary: "the
KataGo JSON analysis protocol" at "the analysis boundary," sitting
alongside SGF ([hollosi1997](hollosi1997.md)) at the position boundary
and GTP ([farneback2002](farneback2002.md)) at the engine-play boundary —
none of the three canonical against the house's own RMN notation, each a
read/write interchange point.

This is also the concrete shape of the "engine review service" that
[Obsmetrologia and Go Strategy](../research-articles/obsmetrologia-and-go-strategy.md)
repeatedly names as a not-yet-built dependency: its falsification paths
for both surviving research candidates require computing statistics
"once the platform's engine review service exists," and that service's
data source, per this section's own standards note, is exactly this
analysis-engine JSON protocol rather than a hand-rolled wrapper around
GTP.

## What it does not settle

The analysis engine reports scalar per-move and per-point statistics
(win rate, score, ownership mean and standard deviation) — it does not
interpret them strategically. [Obsmetrologia and Go Strategy](../research-articles/obsmetrologia-and-go-strategy.md)
treats exactly this limit as its starting point: KataGo's "shipped
per-point ownership standard deviation and score variance" are named as
"scalar sampling statistics" that blur the distinction its own aji
conjecture is trying to formalize (a position that resolves with deeper
reading versus one whose status structurally depends on undetermined
context elsewhere on the board).

## Bridges

- [wu2019](wu2019.md) — the KataGo paper this engine implements
- [hollosi1997](hollosi1997.md), [farneback2002](farneback2002.md) — the sibling interchange formats at the position and engine-play boundaries
- [Reframe and Standards](../notes/2026-08-29-note-on-reframe-and-standards.md) — names the KataGo JSON protocol as the analysis boundary
- [Obsmetrologia and Go Strategy](../research-articles/obsmetrologia-and-go-strategy.md) — the not-yet-built engine-review service this protocol would feed, and the scalar-statistic limit it starts from
