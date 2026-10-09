---
type: bibliography
key: farneback2002
reference-type: misc
authors:
  - Farnebäck, Gunnar
year: 2002
title: "Specification of the Go Text Protocol, version 2, draft 2"
publisher: "lysator.liu.se"
url: "https://www.lysator.liu.se/~gunnar/gtp/gtp2-spec-draft2/gtp2-spec.html"
description: The Go Text Protocol (GTP) is the standard text-based command/response protocol by which a controller (a GUI, a game server, or another program) drives a Go-playing engine — asking it to accept a move, play a color, resign, or report a…
---

## Why this is central

The Go Text Protocol (GTP) is the standard text-based command/response
protocol by which a controller (a GUI, a game server, or another
program) drives a Go-playing engine — asking it to accept a move, play a
color, resign, or report a version — first developed within the GNU Go
project (first appearing in GNU Go development version 2.7.95, 2000-05-18)
and specified as version 2 by Gunnar Farnebäck in this October 2002
draft. It remains the interface nearly every Go engine (GNU Go, KataGo,
Leela Zero) implements for programmatic play.

This corpus names GTP as one of its three canonical outside-format
interchange boundaries, alongside SGF and KataGo's own JSON protocol:
[Reframe and Standards](../notes/2026-08-29-note-on-reframe-and-standards.md)
states plainly that GTP sits "at the engine-play boundary" — the point
where this section's own engines and opponent bots (see the
implementation ladder in [Go-Science History](../notes/2026-08-29-note-on-goscience-history.md),
"scripted heuristics now → shaped GnuGo Phase 2 → KataGo human-style nets
Phase 3") would be driven, or would drive an external engine, without
becoming the section's internal notation. [Weiqi/Go App Landscape](../notes/2026-08-29-note-on-go-app-landscape.md)
documents Sabaki as exactly this kind of GTP front-end, wrapping engines
including KataGo and Leela Zero for technical users.

## What it does not settle

GTP is a move/command protocol, not a position-storage format (that is
SGF's job, see [hollosi1997](hollosi1997.md)) and not an analysis-result
format (that is KataGo's own JSON protocol, see
[katago-analysis-engine](katago-analysis-engine.md)). The spec itself
states it is "a draft only," and this corpus has not yet built or wired
any GTP-speaking engine or controller — the citation records the
standard this section commits to at that boundary, not a shipped
integration.

## Bridges

- [hollosi1997](hollosi1997.md) — SGF, the sibling protocol at the position-interchange boundary
- [katago-analysis-engine](katago-analysis-engine.md) — KataGo's JSON protocol at the analysis boundary
- [Reframe and Standards](../notes/2026-08-29-note-on-reframe-and-standards.md) — names GTP as the engine-play boundary format, non-canonical against house RMN
- [Go-Science History](../notes/2026-08-29-note-on-goscience-history.md) — the opponent-engine ladder GTP would drive
