---
title: Relational Spreadsheet Program
kind: structure
layer: program
status: someday
derived_from:
- computer/structure/computer-kernel
uses:
- system/structure/recognition-carrier
- system/structure/trace-carrier
produces: []
---

This program expresses spreadsheets as recognitions so cells, formulas, and
tables are auditable and aligned with the relational calculus.

## Behaviour

- Represent sheets, cells, formulas, and views as recognitions with provenance.
- Bind formulas to earned operators; avoid hidden imperative state.
- Measure recalculation cost, dependencies, and data quality.

## Intended operators

- Create and edit sheets; compute formulas with trace.
- Import/export slices to other programs (finance, inventory, analytics).
- Audit lineage of cell values and resolve inconsistencies.

## Proof
- Derived from: [Computer Kernel](../../../computer/structure/computer-kernel.md).
- Shows that: this program instantiates the computer kernel to realise the described behaviour without extending machine semantics.

