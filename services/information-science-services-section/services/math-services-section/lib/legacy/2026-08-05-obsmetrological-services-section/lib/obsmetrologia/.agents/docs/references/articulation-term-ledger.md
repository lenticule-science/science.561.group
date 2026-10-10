---
title: Articulation Term Ledger
description: Generated declaration-scale term ledger for every Blueprint claim-site assigned to the Articulation Obsmetrologia topic.
date-created: 2026-06-30
keywords:
  - obsmetrologia
  - reference
  - generated
  - term-ledger
  - articulation
---
# Articulation Term Ledger

This ledger treats every assigned Blueprint claim-site as a term-scale documentation entry.
Rows inherit the topic Diataxis pages unless and until a dedicated concept or term page is written.

| Status | Kind | Label | Title | Lean | Uses | Path |
| --- | --- | --- | --- | --- | --- | --- |
| leanok | proposition | `thm:articulation-cell` | Articulation cell | `Obsmetrologia.Articulating.Cell` | `def:utterance`, `def:articulating` | `docs/blueprint/src/chapters/articulation-predication/01-four-corner-cell.tex` |
| leanok | proposition | `thm:corner` | The four corners | `Obsmetrologia.Articulating.Corner` | `thm:articulation-cell` | `docs/blueprint/src/chapters/articulation-predication/01-four-corner-cell.tex` |
| leanok | proposition | `thm:status-correspondence` | Status correspondence | `Obsmetrologia.Articulating.Corner.ofStatus` | `thm:corner` | `docs/blueprint/src/chapters/articulation-predication/01-four-corner-cell.tex` |
| leanok | lemma | `thm:corner-iso` | Corners biject with status pairs | `Obsmetrologia.Articulating.Corner.ofStatus_toStatus` | `thm:corner`, `thm:status-correspondence` | `docs/blueprint/src/chapters/articulation-predication/01-four-corner-cell.tex` |
| leanok | theorem | `thm:corner-card` | There are exactly four cells | `Obsmetrologia.Articulating.Corner.card_eq_four` | `thm:corner`, `thm:corner-iso` | `docs/blueprint/src/chapters/articulation-predication/01-four-corner-cell.tex` |
| leanok | proposition | `thm:articulation-cell-corner` | The corner of a cell | `Obsmetrologia.Articulating.Cell.corner` | `thm:articulation-cell`, `thm:corner`, `thm:status-correspondence` | `docs/blueprint/src/chapters/articulation-predication/01-four-corner-cell.tex` |
| leanok | proposition | `thm:articulation-cell-initial` | The potential presentation | `Obsmetrologia.Articulating.Cell.initial` | `thm:articulation-cell-corner` | `docs/blueprint/src/chapters/articulation-predication/01-four-corner-cell.tex` |
| leanok | proposition | `thm:corner-surjective` | No empty cell | `Obsmetrologia.Articulating.Cell.corner_surjective` | `thm:articulation-cell-corner`, `thm:corner-iso` | `docs/blueprint/src/chapters/articulation-predication/01-four-corner-cell.tex` |
| leanok | proposition | `thm:entity-predicate` | Entity and predicate | `Obsmetrologia.Entity` | `def:mark`, `thm:kind` | `docs/blueprint/src/chapters/articulation-predication/02-predication-seed.tex` |
| leanok | proposition | `thm:predication` | The predication cell | `Obsmetrologia.PredicationCell` | `thm:entity-predicate`, `thm:articulation-cell-corner` | `docs/blueprint/src/chapters/articulation-predication/02-predication-seed.tex` |
| leanok | proposition | `thm:predication-seed` | The reflexive seed | `Obsmetrologia.PredicationCell.seed` | `thm:predication`, `def:utterance` | `docs/blueprint/src/chapters/articulation-predication/02-predication-seed.tex` |
| leanok | proposition | `thm:predicating-proper` | Predicating proper | `Obsmetrologia.PredicationCell.predicating` | `thm:predication-seed`, `thm:articulation-cell-initial` | `docs/blueprint/src/chapters/articulation-predication/02-predication-seed.tex` |
| leanok | proposition | `thm:predication-converse` | Converse | `Obsmetrologia.PredicationCell.converse` | `thm:predication` | `docs/blueprint/src/chapters/articulation-predication/03-predication-morphisms.tex` |
| leanok | proposition | `thm:predication-proj` | Projections | `Obsmetrologia.PredicationCell.subjProj` | `thm:predication` | `docs/blueprint/src/chapters/articulation-predication/03-predication-morphisms.tex` |
| leanok | proposition | `thm:predication-specialize` | Specialization | `Obsmetrologia.PredicationCell.specialize` | `thm:predication` | `docs/blueprint/src/chapters/articulation-predication/03-predication-morphisms.tex` |
| leanok | theorem | `thm:converse-involution` | Converse is an involution | `Obsmetrologia.PredicationCell.converse_converse` | `thm:predication-converse` | `docs/blueprint/src/chapters/articulation-predication/03-predication-morphisms.tex` |
| leanok | theorem | `thm:converse-seed` | The seed is self-converse | `Obsmetrologia.PredicationCell.converse_seed` | `thm:predication-converse`, `thm:predication-seed` | `docs/blueprint/src/chapters/articulation-predication/03-predication-morphisms.tex` |
| leanok | theorem | `thm:converse-orientation` | Orientation is real | `Obsmetrologia.PredicationCell.converse_ne` | `thm:predication-converse` | `docs/blueprint/src/chapters/articulation-predication/03-predication-morphisms.tex` |
| leanok | proposition | `thm:subjproj-idem` | Projections are idempotent | `Obsmetrologia.PredicationCell.subjProj_idem` | `thm:predication-proj` | `docs/blueprint/src/chapters/articulation-predication/03-predication-morphisms.tex` |
| leanok | theorem | `thm:specialize-comp` | Specialization is functorial | `Obsmetrologia.PredicationCell.specialize_comp` | `thm:predication-specialize` | `docs/blueprint/src/chapters/articulation-predication/03-predication-morphisms.tex` |
| frontier | theorem | `thm:predicate-syntax-interpretation-frontier` | Semantic interpretation and fusion closure |  | `thm:raw-predicate-operators`, `thm:closure-operator` | `docs/blueprint/src/chapters/articulation-predication/04-predicate-operator-syntax.tex` |
| leanok | definition | `def:articulating` | Articulating | `Obsmetrologia.Articulating` | `def:utterance` | `docs/blueprint/src/chapters/primitives/02-utterance-and-articulating.tex` |
| leanok | proposition | `thm:floor` | Floor | `Obsmetrologia.Articulating.floor` | `def:articulating` | `docs/blueprint/src/chapters/primitives/02-utterance-and-articulating.tex` |
| leanok | lemma | `lem:articulating-oneway` | Articulating is one-way | `Obsmetrologia.Articulating.utter_ne_pair` | `def:articulating` | `docs/blueprint/src/chapters/primitives/02-utterance-and-articulating.tex` |
| leanok | proposition | `thm:four-object` | The canonical four-corner object | `Obsmetrologia.Articulating.FourCorner` | `thm:corner-status`, `thm:charge-is-phase` | `docs/blueprint/src/chapters/recurring-four/01-the-keystone-the-recurring-four-is-one-object.tex` |
| leanok | proposition | `thm:cell-fourcorner` | A cell's four-corner | `Obsmetrologia.Articulating.Cell.fourCorner` | `thm:four-object`, `def:articulating` | `docs/blueprint/src/chapters/recurring-four/01-the-keystone-the-recurring-four-is-one-object.tex` |
