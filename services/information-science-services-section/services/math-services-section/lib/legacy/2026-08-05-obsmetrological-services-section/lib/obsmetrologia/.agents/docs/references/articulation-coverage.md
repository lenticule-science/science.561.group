---
title: Articulation Coverage Reference
description: Generated reference page listing Lean modules, Blueprint claim-site counts, and inherited Diataxis coverage for Articulation.
date-created: 2026-06-30
keywords:
  - obsmetrologia
  - reference
  - generated
  - coverage
  - articulation
---
# Articulation Coverage Reference

The utterance and articulating recursion that generate the first four-corner cell.

## Diataxis Pages

| Mode | Path |
| --- | --- |
| Tutorial | `tutorials/articulation-path.md` |
| Guide | `guides/articulation-maintenance.md` |
| Explanation | `explanations/articulation.md` |
| Reference | `references/articulation-coverage.md` |
| Concept atlas | `references/articulation-concept-atlas.md` |
| Term ledger | `references/articulation-term-ledger.md` |

## Lean Modules

| Module | Path |
| --- | --- |
| `Obsmetrologia.Articulation` | `Obsmetrologia/Articulation.lean` |
| `Obsmetrologia.Articulation.Articulating` | `Obsmetrologia/Articulation/Articulating.lean` |
| `Obsmetrologia.Articulation.Articulating.Cell` | `Obsmetrologia/Articulation/Articulating/Cell.lean` |
| `Obsmetrologia.Articulation.Articulating.FourCorner` | `Obsmetrologia/Articulation/Articulating/FourCorner.lean` |
| `Obsmetrologia.Articulation.Articulating.Utterance` | `Obsmetrologia/Articulation/Articulating/Utterance.lean` |

## Blueprint Claims

| Status | Kind | Label | Title | Lean | Path |
| --- | --- | --- | --- | --- | --- |
| leanok | proposition | `thm:articulation-cell` | Articulation cell | `Obsmetrologia.Articulating.Cell` | `docs/blueprint/src/chapters/articulation-predication/01-four-corner-cell.tex` |
| leanok | proposition | `thm:corner` | The four corners | `Obsmetrologia.Articulating.Corner` | `docs/blueprint/src/chapters/articulation-predication/01-four-corner-cell.tex` |
| leanok | proposition | `thm:status-correspondence` | Status correspondence | `Obsmetrologia.Articulating.Corner.ofStatus` | `docs/blueprint/src/chapters/articulation-predication/01-four-corner-cell.tex` |
| leanok | lemma | `thm:corner-iso` | Corners biject with status pairs | `Obsmetrologia.Articulating.Corner.ofStatus_toStatus` | `docs/blueprint/src/chapters/articulation-predication/01-four-corner-cell.tex` |
| leanok | theorem | `thm:corner-card` | There are exactly four cells | `Obsmetrologia.Articulating.Corner.card_eq_four` | `docs/blueprint/src/chapters/articulation-predication/01-four-corner-cell.tex` |
| leanok | proposition | `thm:articulation-cell-corner` | The corner of a cell | `Obsmetrologia.Articulating.Cell.corner` | `docs/blueprint/src/chapters/articulation-predication/01-four-corner-cell.tex` |
| leanok | proposition | `thm:articulation-cell-initial` | The potential presentation | `Obsmetrologia.Articulating.Cell.initial` | `docs/blueprint/src/chapters/articulation-predication/01-four-corner-cell.tex` |
| leanok | proposition | `thm:corner-surjective` | No empty cell | `Obsmetrologia.Articulating.Cell.corner_surjective` | `docs/blueprint/src/chapters/articulation-predication/01-four-corner-cell.tex` |
| leanok | proposition | `thm:entity-predicate` | Entity and predicate | `Obsmetrologia.Entity` | `docs/blueprint/src/chapters/articulation-predication/02-predication-seed.tex` |
| leanok | proposition | `thm:predication` | The predication cell | `Obsmetrologia.PredicationCell` | `docs/blueprint/src/chapters/articulation-predication/02-predication-seed.tex` |
| leanok | proposition | `thm:predication-seed` | The reflexive seed | `Obsmetrologia.PredicationCell.seed` | `docs/blueprint/src/chapters/articulation-predication/02-predication-seed.tex` |
| leanok | proposition | `thm:predicating-proper` | Predicating proper | `Obsmetrologia.PredicationCell.predicating` | `docs/blueprint/src/chapters/articulation-predication/02-predication-seed.tex` |
| leanok | proposition | `thm:predication-converse` | Converse | `Obsmetrologia.PredicationCell.converse` | `docs/blueprint/src/chapters/articulation-predication/03-predication-morphisms.tex` |
| leanok | proposition | `thm:predication-proj` | Projections | `Obsmetrologia.PredicationCell.subjProj` | `docs/blueprint/src/chapters/articulation-predication/03-predication-morphisms.tex` |
| leanok | proposition | `thm:predication-specialize` | Specialization | `Obsmetrologia.PredicationCell.specialize` | `docs/blueprint/src/chapters/articulation-predication/03-predication-morphisms.tex` |
| leanok | theorem | `thm:converse-involution` | Converse is an involution | `Obsmetrologia.PredicationCell.converse_converse` | `docs/blueprint/src/chapters/articulation-predication/03-predication-morphisms.tex` |
| leanok | theorem | `thm:converse-seed` | The seed is self-converse | `Obsmetrologia.PredicationCell.converse_seed` | `docs/blueprint/src/chapters/articulation-predication/03-predication-morphisms.tex` |
| leanok | theorem | `thm:converse-orientation` | Orientation is real | `Obsmetrologia.PredicationCell.converse_ne` | `docs/blueprint/src/chapters/articulation-predication/03-predication-morphisms.tex` |
| leanok | proposition | `thm:subjproj-idem` | Projections are idempotent | `Obsmetrologia.PredicationCell.subjProj_idem` | `docs/blueprint/src/chapters/articulation-predication/03-predication-morphisms.tex` |
| leanok | theorem | `thm:specialize-comp` | Specialization is functorial | `Obsmetrologia.PredicationCell.specialize_comp` | `docs/blueprint/src/chapters/articulation-predication/03-predication-morphisms.tex` |
| frontier | theorem | `thm:predicate-syntax-interpretation-frontier` | Semantic interpretation and fusion closure |  | `docs/blueprint/src/chapters/articulation-predication/04-predicate-operator-syntax.tex` |
| leanok | definition | `def:articulating` | Articulating | `Obsmetrologia.Articulating` | `docs/blueprint/src/chapters/primitives/02-utterance-and-articulating.tex` |
| leanok | proposition | `thm:floor` | Floor | `Obsmetrologia.Articulating.floor` | `docs/blueprint/src/chapters/primitives/02-utterance-and-articulating.tex` |
| leanok | lemma | `lem:articulating-oneway` | Articulating is one-way | `Obsmetrologia.Articulating.utter_ne_pair` | `docs/blueprint/src/chapters/primitives/02-utterance-and-articulating.tex` |
| leanok | proposition | `thm:four-object` | The canonical four-corner object | `Obsmetrologia.Articulating.FourCorner` | `docs/blueprint/src/chapters/recurring-four/01-the-keystone-the-recurring-four-is-one-object.tex` |
| leanok | proposition | `thm:cell-fourcorner` | A cell's four-corner | `Obsmetrologia.Articulating.Cell.fourCorner` | `docs/blueprint/src/chapters/recurring-four/01-the-keystone-the-recurring-four-is-one-object.tex` |



## Caution

Do not treat the four corners as metaphor; track the finite carrier and its Lean/Blueprint witnesses.
