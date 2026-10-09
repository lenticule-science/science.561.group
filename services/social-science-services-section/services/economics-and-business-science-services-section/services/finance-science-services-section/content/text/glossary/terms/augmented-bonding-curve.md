---
name: "Augmented Bonding Curve"
date-created: 2026-10-08
aliases:
  - "augmented bonding curve"
  - "ABC"
description: "A bonding curve extended with a Hatch phase, an entry and exit tribute that feed a separate funding pool, and vesting of early tokens, so that a commons is funded by the friction of trading its token."
references: {}
---

An **augmented bonding curve** is the Commons Stack's extension of the [bonding curve](./bonding-curve.md): a Hatch phase raises the initial reserve from early contributors, whose tokens vest on a half-life; a share theta of the raise and an entry or exit tribute on every trade go to a funding pool rather than the reserve; and the curve is parameterized by Hatch raise, theta, Hatch price and open price (kappa = open price / hatch price / (1 - theta)). The Token Engineering Commons ran one on Gnosis Chain from 2022-01-13 (19.82% reserve ratio, 2% entry and 12% exit tributes) and on Optimism after 2023-12; its figures, shutdown and failure modes are in [Bonding Curves and the Token Engineering Commons](../../documents/articles/notes/2026/10/08/2026-10-08-bonding-curves-and-the-tec.md). See [hatch](./hatch.md).
