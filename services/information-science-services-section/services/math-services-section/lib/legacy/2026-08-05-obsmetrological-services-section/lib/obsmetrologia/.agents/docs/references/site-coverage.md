---
title: Site Coverage Reference
description: Generated reference page listing Lean modules, Blueprint claim-site counts, and inherited Diataxis coverage for Site.
date-created: 2026-06-30
keywords:
  - obsmetrologia
  - reference
  - generated
  - coverage
  - site
---
# Site Coverage Reference

Basic, section, sheaf, D-frame, and enriched site surfaces downstream of valuation and settling.

## Diataxis Pages

| Mode | Path |
| --- | --- |
| Tutorial | `tutorials/site-path.md` |
| Guide | `guides/site-maintenance.md` |
| Explanation | `explanations/site.md` |
| Reference | `references/site-coverage.md` |
| Concept atlas | `references/site-concept-atlas.md` |
| Term ledger | `references/site-term-ledger.md` |

## Lean Modules

| Module | Path |
| --- | --- |
| `Obsmetrologia.Site` | `Obsmetrologia/Site.lean` |
| `Obsmetrologia.Site.Basic` | `Obsmetrologia/Site/Basic.lean` |
| `Obsmetrologia.Site.DFrame` | `Obsmetrologia/Site/DFrame.lean` |
| `Obsmetrologia.Site.Enriched` | `Obsmetrologia/Site/Enriched.lean` |
| `Obsmetrologia.Site.Section` | `Obsmetrologia/Site/Section.lean` |
| `Obsmetrologia.Site.Sheaf` | `Obsmetrologia/Site/Sheaf.lean` |

## Blueprint Claims

| Status | Kind | Label | Title | Lean | Path |
| --- | --- | --- | --- | --- | --- |
| leanok | theorem | `thm:bitopological-site-grothendieck` | The bitopological settling site is Grothendieck | `Obsmetrologia.Site.bitopological_site_grothendieck` | `docs/blueprint/src/chapters/sheaf-cohomology/00-bitopological-settling-site.tex` |
| leanok | theorem | `thm:no-temporal-covers` | Covers are fiber-local, not temporal | `Obsmetrologia.Site.no_temporal_covers` | `docs/blueprint/src/chapters/sheaf-cohomology/00-bitopological-settling-site.tex` |
| leanok | theorem | `thm:strict-site-finite-fiber` | The strict site has finite clopen fiber | `Obsmetrologia.Site.strict_site_finite_fiber` | `docs/blueprint/src/chapters/sheaf-cohomology/00-bitopological-settling-site.tex` |



## Caution

Do not use topology as a primitive explanation; name the generated site and section carrier.
