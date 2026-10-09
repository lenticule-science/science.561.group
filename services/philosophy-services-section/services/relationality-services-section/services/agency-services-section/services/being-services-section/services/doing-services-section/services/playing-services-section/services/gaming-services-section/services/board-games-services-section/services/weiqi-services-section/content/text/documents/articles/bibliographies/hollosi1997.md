---
type: bibliography
key: hollosi1997
reference-type: misc
authors:
  - Hollosi, Arno
year: 1997
title: "SGF - Smart Game Format, FF[4]"
publisher: "red-bean.com"
url: "https://www.red-bean.com/sgf/sgf4.html"
description: SGF FF[4] is the current, widely-implemented version of the Smart Game Format — a text-only, tree-based format for storing game records of two-player board games, authored by Arno Hollosi in 1997 as the successor to Anders Kierulf's FF[1]…
---

## Why this is central

SGF FF[4] is the current, widely-implemented version of the Smart Game
Format — a text-only, tree-based format for storing game records of
two-player board games, authored by Arno Hollosi in 1997 as the successor
to Anders Kierulf's FF[1] (1987) and Martin Müller's FF[3] (1993); FF[2]
was never made public. It is the format nearly every Go server, client,
and engine uses to exchange game records.

This corpus names SGF FF[4] explicitly as one of its three canonical
outside-format interchange boundaries: [Reframe and Standards](../notes/2026-08-29-note-on-reframe-and-standards.md)
states that "SGF FF[4], GTP (Go Text Protocol), and the KataGo JSON
analysis protocol are outside formats, read and written for interchange
with the world's engines and servers — SGF at the position-interchange
boundary" — with the house's own diagram/notation conventions (RMN)
staying canonical internally and round-tripping through SGF only at that
boundary. The [Weiqi Kernel Constitution](../notes/weiqi-kernel-constitution.md)
lists "SGF parse/serialize" as one of the kernel's own indivisible
responsibilities, and the same note records a proposed refit of
`weiqi-lsp` toward "a real language server for SGF and the house diagram
notation" (see [farneback2002](farneback2002.md) for the sibling protocol
at the engine-play boundary).

## What it does not settle

SGF is a storage and interchange format for positions and game trees; it
says nothing about legality, scoring, or ruleset semantics — those are
exactly what this section's kernel computes independently and what SGF
records must be checked against, per the [Weiqi LSP Constitution](../notes/weiqi-lsp-constitution.md)'s
refusal to "guess a life-and-death verdict" or invent an unverified rule.

## Bridges

- [Weiqi Kernel Constitution](../notes/weiqi-kernel-constitution.md) — SGF parse/serialize as a kernel responsibility
- [Weiqi LSP Constitution](../notes/weiqi-lsp-constitution.md) — anticipates SGF-notation fenced code blocks as a checkable input
- [Reframe and Standards](../notes/2026-08-29-note-on-reframe-and-standards.md) — names SGF as the position-interchange boundary, non-canonical against house RMN
- [farneback2002](farneback2002.md) — GTP, the sibling protocol at the engine-play boundary
