---
title: Mark To Settling Worked Path
description: A guided pass through the first Obsmetrologia derivation from primitive mark to charge, valuation, order, and settling.
date-created: 2026-06-30
keywords:
  - obsmetrologia
  - tutorial
  - mark
  - settling
  - worked-path
---

# Mark To Settling Worked Path

This tutorial follows the first core route: mark to utterance to articulation to
four-corner cell to charge to settling.

## 1. Mark

Start with `Obsmetrologia/Primitive/Mark.lean`.

Record:

- what `Mark` admits;
- how `Kind` distinguishes token and claim;
- which theorems make the two-kind surface explicit.

Do not explain `Mark` as a set, point, proposition, symbol, or object unless the
local file does so. It is the primitive admission.

## 2. Utterance

Open `Obsmetrologia/Articulation/Articulating/Utterance.lean`.

Record how an utterance pairs token and claim positions.

Question to answer:

```text
What becomes possible only after token and claim are paired?
```

## 3. Articulating

Open `Obsmetrologia/Articulation/Articulating.lean`.

Record the recursive constructors and the basic functions such as head, depth,
and floor when present in the current file.

Question:

```text
How does the recursive shape keep the path finite and walkable at this stage?
```

## 4. Four-Corner Cell

Open `Obsmetrologia/Articulation/Articulating/Cell.lean`.

Record:

- the four corner names;
- status-pair conversions;
- enumeration and cardinality facts;
- the initial potential presentation.

This is the first place where the recurring FOUR becomes a finite carrier rather
than a slogan.

## 5. Phase As Charge

Open `Obsmetrologia/Articulation/Articulating/FourCorner.lean` and
`Obsmetrologia/Language/Positing/Charge.lean`.

Record the link from articulation phase to charge and the charge operations.

Question:

```text
Which facts are proven by finite case analysis, and which names become reusable
order or valuation surfaces?
```

## 6. Settling

Open `Obsmetrologia/Language/Settling.lean`.

Record:

- `KLE`;
- reflexivity, transitivity, and antisymmetry;
- join and meet behavior;
- closure structure;
- settling fixed and least properties;
- valuation-level settling, if present.

Question:

```text
How does order appear here as generated behavior rather than a primitive order?
```

## Completion Check

You have completed the tutorial when you can write one paragraph explaining why
Obsmetrologia does not begin with truth, equality, set membership, topology, or a
category, but can later recover or project such surfaces.

