---
type: question
status: open
depends-on: []
title: "Open: Where is the AM-versus-conventional economic crossover?"
description: For a part of given geometry and material, at what production volume does AM become more expensive per part than the cheapest conventional alternative (machining, casting, injection molding)?
---

# Open: Where is the AM-versus-conventional economic crossover?

For a part of given geometry and material, at what production volume does AM become *more* expensive per part than the cheapest conventional alternative (machining, casting, injection molding)? And how is that crossover moving over time?

## The classic rule of thumb

Pre-2020 AM economics literature gave: AM wins below ~100 parts/year for metal, below ~1,000 parts/year for polymer. Above those, conventional dominates because tooling amortization becomes negligible and AM's per-part time cost stays high.

This rule is now wrong in three directions:

1. **AM productivity is rising.** Multi-laser LPBF (4 lasers in 2020 → 12 lasers in 2026 production systems), MJF binder-jet metal (Desktop Metal Production System), and high-speed FFF (Bambu X1, Prusa XL with 5 toolheads) have moved the per-part economics significantly.
2. **Tooling cost is rising for some processes.** Complex injection-mold tooling for short-run consumer products is now in the $50k–$500k range, pushing the crossover for plastic AM upward.
3. **Part consolidation changes the comparison.** A consolidated AM part replaces an assembly; the AM economic comparison must include the *eliminated* assembly labor and inventory.

## Sub-questions

1. **Crossover for production-grade polymer AM.** HP MJF and Carbon DLS claim crossovers in the thousands of parts; independent verification (Atzeni & Salmi 2012, updated by Baumers et al. 2017, Yang et al. 2024) gives mixed results.
2. **Crossover for metal AM in aerospace.** Per-part cost is dominated by post-processing (HIP, machining, NDE) and qualification, not by build time. Reducing these is where the next economic improvement lies.
3. **Distributed-manufacturing economics.** If AM enables on-demand production at the point of use (eliminating warehousing, shipping, inventory), the economic comparison shifts. The COVID-era distributed-PPE experience (Petsiuk et al. 2020) is suggestive; the steady-state question is unresolved.
4. **Embodied energy.** LCA studies (Le et al. 2017, Faludi et al. 2017) show AM is *not* automatically greener: the per-part energy of LPBF is high, and only the near-net-shape advantage and supply-chain reduction make the comparison favorable. The true crossover depends on transport assumptions.

## Why this matters

Misjudging crossover is expensive in both directions: under-investing in AM where it would dominate, or over-committing to AM where injection molding wins. The question is operational not theoretical, but the structure of the answer (a function of part complexity, material, batch size, geographic distribution) is theoretical.

## References

- Atzeni, E., Salmi, A. (2012). "Economics of additive manufacturing for end-usable metal parts." *IJAMT* 62(9–12).
- Baumers, M., et al. (2017). "Industrial AM economics." *Technological Forecasting and Social Change* 102.
- Wohlers Report 2024 — see [`wohlers-2024.md`](./predication-wohlers-2024.md).
