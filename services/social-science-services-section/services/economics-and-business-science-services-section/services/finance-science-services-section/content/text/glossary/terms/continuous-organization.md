---
name: "Continuous Organization"
date-created: 2026-10-08
aliases:
  - "continuous organization"
  - "continuous securities offering"
  - "C-ORG"
description: "An organization financed through a bonding-curve contract with separate buy and sell curves, into which it pays a fixed share of realized revenue, so that token holders hold a claim on a reserve rather than on ownership."
references: {}
---

A **continuous organization** is Thibauld Favre's 2018 design in which an organization funnels a committed share of its revenue into a trust whose [bonding curve](./bonding-curve.md) has a linear buy curve and a sell curve derived from the buyback reserve; the issued FAIR tokens are a claim on that reserve, not on ownership or governance. Fairmint published a reference implementation and later moved to other instruments; the contract formulas, the beneficiary's exit fee and the absence of a deployed instance in the repository are in [Bonding Curves and the Token Engineering Commons](../../documents/articles/notes/2026/10/08/2026-10-08-bonding-curves-and-the-tec.md).
