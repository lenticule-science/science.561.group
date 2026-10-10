---
title: First Reading Path
description: A tutorial route for entering Obsmetrologia from the live proof spine without collapsing its vocabulary into familiar external mathematics.
date-created: 2026-06-30
keywords:
  - obsmetrologia
  - tutorial
  - reading-path
  - foundation
  - diataxis
---

# First Reading Path

This tutorial is for a future agent or reader entering Obsmetrologia for the
first time.

## Goal

Reach the point where "relational/informational mathematics" means the local
derivation spine, not a familiar external field.

## Step 1: Read The Operating Contract

Open:

- `AGENTS.md`;
- `CLAUDE.md`;
- `README.md`.

Extract only live rules:

- active root is `sites/obsmetrologia.emsenn.net`;
- Lean modules live under `Obsmetrologia/`;
- Blueprint lives under `docs/blueprint`;
- Verso lives under `docs/verso`;
- corpus and notes live under `dev/content`;
- past `Mark` and `Articulating`, nothing is free.

## Step 2: Read The Import Spine

Open `Obsmetrologia.lean`.

Read the import order as a derivation order:

1. `Primitive`;
2. `Articulation`;
3. `Language`;
4. `Calculus`;
5. `Site`;
6. `Closure`;
7. `Cohomology`;
8. `Dynamics`;
9. `Persistence`;
10. `Relational`;
11. `Thermodynamics`;
12. `Computing`.

Do not jump ahead to the familiar names. The later names are downstream.

## Step 3: Read The Documentation Architecture

Open:

- `docs/verso/ObsmetrologiaManual/PartVI/DocumentationArchitecture.lean`;
- `docs/verso/ObsmetrologiaManual/PartVI/DiataxisCoverage.lean`;
- `docs/verso/ObsmetrologiaManual/PartVI/ConceptIndex.lean`.

Learn the local coverage rule:

- namespace equals topic;
- module equals concept;
- declaration equals term.

## Step 4: Read The First Formal Chain

Read in order:

- `Obsmetrologia/Primitive/Mark.lean`;
- `Obsmetrologia/Articulation/Articulating/Utterance.lean`;
- `Obsmetrologia/Articulation/Articulating.lean`;
- `Obsmetrologia/Articulation/Articulating/Cell.lean`;
- `Obsmetrologia/Articulation/Articulating/FourCorner.lean`;
- `Obsmetrologia/Language/Positing/Charge.lean`;
- `Obsmetrologia/Language/Settling.lean`.

At each file, ask:

- what earlier object does this require?
- what new carrier appears?
- what theorem or construction prevents a familiar shortcut?

## Step 5: Compare With Blueprint

Open the matching Blueprint sections:

- `docs/blueprint/src/chapters/02-two-primitives.tex`;
- `docs/blueprint/src/chapters/primitives/01-marks-and-kinds.tex`;
- `docs/blueprint/src/chapters/primitives/02-utterance-and-articulating.tex`;
- `docs/blueprint/src/chapters/03-articulation-predication.tex`;
- `docs/blueprint/src/chapters/articulation-predication/01-four-corner-cell.tex`;
- `docs/blueprint/src/chapters/04-value-four-bilattice.tex`;
- `docs/blueprint/src/chapters/05-settling.tex`.

Notice how the formal graph names claim-sites rather than teaching the whole
manual.

## Step 6: Stop Before Explaining Too Much

Before writing a page, state the object in the local form:

```text
<Object> is generated from <inputs>, currently carried by <module/node>, and
supports <outputs>.
```

If you cannot fill this in from live files, keep reading.

