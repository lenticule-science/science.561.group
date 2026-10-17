---
title: Primitive Term Ledger
description: Generated declaration-scale term ledger for every Blueprint claim-site assigned to the Primitive Obsmetrologia topic.
date-created: 2026-06-30
keywords:
  - obsmetrologia
  - reference
  - generated
  - term-ledger
  - primitive
---
# Primitive Term Ledger

This ledger treats every assigned Blueprint claim-site as a term-scale documentation entry.
Rows inherit the topic Diataxis pages unless and until a dedicated concept or term page is written.

| Status | Kind | Label | Title | Lean | Uses | Path |
| --- | --- | --- | --- | --- | --- | --- |
| leanok | definition | `def:mark` | Mark | `Obsmetrologia.Mark` |  | `docs/blueprint/src/chapters/primitives/01-marks-and-kinds.tex` |
| leanok | proposition | `thm:kind` | Kind | `Obsmetrologia.Kind` | `def:mark` | `docs/blueprint/src/chapters/primitives/01-marks-and-kinds.tex` |
| leanok | lemma | `lem:two-kinds` | Exactly two kinds | `Obsmetrologia.Kind.two_kinds` | `thm:kind` | `docs/blueprint/src/chapters/primitives/01-marks-and-kinds.tex` |
| leanok | lemma | `lem:token-ne-claim` | Token and claim are distinct | `Obsmetrologia.Kind.token_ne_claim` | `thm:kind` | `docs/blueprint/src/chapters/primitives/01-marks-and-kinds.tex` |
| leanok | definition | `def:utterance` | Utterance | `Obsmetrologia.Utterance` | `def:mark`, `thm:kind` | `docs/blueprint/src/chapters/primitives/02-utterance-and-articulating.tex` |
