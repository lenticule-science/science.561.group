---
name: "Fundamental Law of Active Management"
date-created: 2026-09-05
aliases:
  - "fundamental law of active management"
  - "Grinold-Kahn law"
description: "Grinold and Kahn's relation stating that a strategy's information ratio scales with the accuracy of its individual forecasts times the square root of the number of independent bets it makes."
references:
  grinold1989:
    authors: ["Richard C. Grinold"]
    title: "The Fundamental Law of Active Management"
    publication: "Journal of Portfolio Management 15(3)"
    year: 1989
  grinoldkahn1999:
    authors: ["Richard C. Grinold", "Ronald N. Kahn"]
    title: "Active Portfolio Management: A Quantitative Approach for Producing Superior Returns and Controlling Risk"
    publisher: "McGraw-Hill"
    year: 1999
---

The **fundamental law of active management** (Grinold 1989; developed fully in Grinold & Kahn 1999) relates a strategy's achieved skill to two separate quantities: how accurate each individual forecast is, and how many independent forecasts the strategy makes. In its standard approximate form,

**IR ≈ IC × √BR**

where **IR** is the information ratio (active return divided by active risk, the strategy-level analogue of the [sharpe-ratio](./sharpe-ratio.md)), **IC** is the information coefficient (the correlation between a forecast and the outcome it predicts, a per-bet skill measure), and **BR** is breadth, the number of independent bets made per year.

The law's central, often-missed implication is that a strategy with a modest, honestly measured information coefficient can still reach a strong information ratio by making many independent bets, while a strategy with an impressively high information coefficient measured on very few, correlated bets can have a weak and unreliable information ratio. "Independent" is the load-bearing word: doubling the number of highly correlated bets does not double breadth the way doubling the number of genuinely uncorrelated bets does, so a fund's practical work in raising breadth is finding more independent sources of forecast rather than more copies of the same one.

The law is a modeling approximation, not an identity: it assumes the forecasts are combined optimally and that IC is stable and roughly comparable across the bets being counted, assumptions a real, decaying, cross-correlated signal set violates to some degree. Used carefully, it explains why a fund built on many weak, independent public signals is a coherent strategy in its own right rather than a weaker substitute for finding one strong signal.
