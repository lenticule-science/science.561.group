---
title: Relational Spreadsheet Views
keywords:
  - idea
  - spreadsheet
  - views
part-of: relational-computer
description: "Treats spreadsheet-like tables as views over recognitions and measurements."
---
# Idea: Relational Spreadsheet Views

Treat spreadsheet-like tables as *views* over recognitions and measurements,
rather than as a separate, ad-hoc data silo.

## 1. Core recognitions

- `SheetViewRecognition`
  - A named table or grid with a query backing it (which recognitions appear as
    rows) and column definitions (which properties/measurements to project).
- `SheetCellRecognition`
  - A single cell tying together: row recognition, column definition, value,
    and provenance (formula, manual entry, or imported measurement).
- `SheetFormulaRecognition`
  - A formula definition (possibly expressed in the S-expression template
    language) that computes cell values from recognitions and measurements.

## 2. Topology and measurement

- **Topology**
  - Sheet views are bound to queries (see `dataview-query-language.md`) that
    select recognitions.
  - Columns map to properties or derived expressions on those recognitions.
  - Formulas link cells back to the acts/specs they rely on.
- **Measurement**
  - Track recalculation cost, refresh frequency, and error/repair events.
  - Coverage metrics: how much of a domain (finance, health, projects) is
    visible in at least one sheet.

## 3. Runbooks and flows

- `run_define_sheet_view`
  - Create or update a `SheetViewRecognition` by binding a query and columns.
- `run_recalculate_sheet`
  - Recompute values for a sheet (or subset) based on source recognitions and
    formulas; emit measurement events.
- `run_apply_sheet_edits`
  - Turn user edits in cells into updates to underlying recognitions, subject
    to policy and validation.

## 4. Cross-domain connections

- Provides spreadsheet surfaces for:
  - finance and budgeting, medical data, project tracking,
  - lab measurements and experiment logs,
  - MUD state summaries, governance dashboards, and more.
- Integrates with the GUI workbench and dataview-like query language as a
  familiar “grid” projection over the universal relational graph.

