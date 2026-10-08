---
type: bibliography
key: benson1976
reference-type: article-journal
authors:
  - Benson, David B.
year: 1976
title: "Life in the Game of Go"
container-title: "Information Sciences"
volume: "10"
page: "17-29"
doi: 10.1016/0020-0255(76)90059-1
verified: "https://www.sciencedirect.com/science/article/abs/pii/0020025576900591 and the University of Alberta seminar copy, fetched 2026-09-04"
description: The two-eyes theorem, proved.
---

## Why this is central

The two-eyes theorem, proved. Benson defines a region enclosed by one
colour as *vital* to a chain when every empty point of the region is a
liberty of that chain, and proves that a set of chains is unconditionally
alive (safe from capture no matter how many consecutive moves the opponent
gets) exactly when every chain in the set has at least two vital regions,
with a static graph algorithm equivalent to full lookahead. This is the
theorem the glass-sponge note §17.10 said was "not yet earned" and the
honeycomb article left as an open deliverable: the independence of the two
holes is *vitality*, and the theorem is fifty years old. What remains for
the house is to transport it: from chains and regions on the grid to genets
and future-facing faces on the honeycomb, in Lean, on top of
`Obsmetrologia.GameTheory.Weiqi.Board`.

## What it does not settle

Unconditional life is the strongest form of life; ordinary life (alive
given alternating play) is weaker and is what engines evaluate. Benson
settles the strong form only.

## Bridges

- [Berlekamp and Wolfe 1994](berlekamp-wolfe1994.md): the other exact theory the section rests on.
- [Two eyes on the honeycomb](../../../../../../../../../../../../../../../../../../../../../../social-science-services-section/services/economics-and-business-science-services-section/services/business-science-services-section/content/text/documents/articles/notes/2026/09/03/2026-09-03-note-on-exchanges-as-cells-in-an-enterprises-honeycomb.md): the transported statement.
