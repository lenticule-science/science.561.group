---
title: "Theory sources for the computer system (pointers)"
description: "Where the primary-source theory of computing lives in content/, what it claims, and which code artifacts realize it. Pointers and checkable mappings, not exposition."
date: 2026-06-21
status: index
---

# Theory sources for the computer system

This is an index, not a treatise.
Each line is checkable: open the file or grep the code.

## Where the theory is

- **Primary source (read it):** `content/_triage/2026/06/18/2026-06-18-mysterious-machines-strategy-self-and-the-concurrent-game.md` and its engine companion `content/_triage/2026/06/17/2026-06-17-mysterious-spacetime-geometries-of-the-void.md`.
- **Live theory tree:** `content/mark/…/articulating/…/positing/…/settling/…` — the descent (articulating → predicating → positing → settling), organized by `content/CLAUDE.md`'s generator/generated rule.
- **Older, do not cite as primary:** `content/_archive/…/predicated-computer/…` predates the current code (it frames the substrate as `assert/retract/traverse`, which the live append-only model contradicts).

## What the primary source claims (plainly)

- The theory of computation is the `*`-autonomous category of **concurrent games with symmetry** [Castellan–Clairambault–Winskel 2017].
- One category, three readings: **computation** (strategy vs the world), **agency** (strategy vs a model of itself), **play** (strategy vs a chosen opponent).
- A **strategy** = a relation given a Player/Opponent side over an arena (a prime event structure).
- Tower `relation → agent → game → computer`; a **computer is a game made repeatable** = the Kleisli category of the `!
  ` exponential on CGS.
- **Cut = the pipe**: composing strategies is linear-logic cut; running is cut-elimination; the shell `|` and the stdin→stdout process boundary are that cut.

## How it maps to our code (checkable)

| theory | code artifact |
|---|---|
| strategy / morphism | an `action` in `lib/relating-experimental/src/acting/action.mts` |
| cut / pipe | CLI pipe between two `dispatch` calls; cross-package carrier hand-off |
| carrier on the wire | json/eavt/form/string codecs (`acting/codecs.mts`) |
| witnessed play | EAVT row per call (`acting/invocation.mts`), `log → state → record` |
| four-valued verdict | (claimed for HTTP status classes; not yet implemented) |

## Corrections already absorbed (do not re-litigate)

- Settling is monotone: the evidence log is append-only; `state` is its projection; there is no `retract`/`delete` operation.
  This is a plain fact, not a finding.
- The `_archive` predicated-computer / web-serving-computer docs are older than the code; use them only where the primary source agrees.
