---
type: theorem
status: established
class: empirical-law
depends-on: [layer, build-orientation, overhang]
title: Surface roughness depends on the angle between surface normal and build axis
description: Claim.
---

# Surface roughness depends on the angle between surface normal and build axis

**Claim.** The unfinished surface roughness $R_a$ of an AM part depends predictably on the angle $\theta$ between the local surface normal and the build axis. The dependence has three regimes:

- **Top surface ($\theta = 0$, surface normal up):** smoothest; $R_a$ set by layer-internal scan-track or bead artifacts.
- **Side surfaces ($\theta = 90°$, surface normal horizontal):** "stair-stepping" set by the layer height $h$. For a sloped surface at angle $\phi$ from horizontal, the apparent $R_a \approx h \cos\phi / 4$ as a geometric lower bound.
- **Down-facing surfaces ($\theta > 90°$, surface normal pointing down — i.e. overhanging surfaces):** roughest; set by support-contact marks (FFF, LPBF) or by sag (FFF) or by un-melted dross (LPBF).

**Quantitative summary (typical values).**

| Process | Top $R_a$ | Side ($\phi = 0°$) | Side ($\phi = 45°$) | Down-facing $R_a$ |
|---|---|---|---|---|
| FFF (0.2 mm layer) | 5–10 μm | 50 μm | 35 μm | 100–500 μm |
| LPBF (50 μm layer) | 5–10 μm | 12 μm | 8 μm | 30–80 μm |
| SLA (50 μm layer) | 1–3 μm | 12 μm | 8 μm | 5–10 μm (after support removal) |
| MJF / SLS | 5–10 μm | 8–15 μm | 8–15 μm | 8–15 μm (no supports) |

**Design corollary.** Orient the part so that *cosmetic* and *sealing* surfaces face up or vertical, never down. If a sealing surface must be on a down-face, plan for machining stock and a finishing operation.

**Why down-facing is so much worse.**

- *FFF.* The first bead deposited on a support layer must bridge gaps in the support; its underside takes on the support's surface signature. Soluble supports (PVA, BVOH, HIPS) reduce this to ~50 μm; PLA-on-PLA supports leave 100–500 μm marks.
- *LPBF.* The first scan-track on un-melted powder partially sinters loose particles to its underside. Dross hangs from the part underside; chemical etching or machining is the standard remediation.
- *SLA.* Support contact points leave $\sim 0.3$ mm-diameter "nibs" that must be sanded.

**Process-side mitigations.**

- Adaptive layer height (thinner layers on shallow slopes) reduces stair-stepping at the cost of build time. Implemented in PrusaSlicer, OrcaSlicer for FFF.
- Optimized scan strategy on down-facing surfaces in LPBF (lower energy density, "skin" parameters) reduces dross.
- Smaller support tip-to-part contacts in SLA (1–3 mm² touch) reduce nib size at the cost of support-failure risk.

**Frontier.** The 2022– literature on *non-planar slicing* (Etienne et al. 2019, Mitropoulou et al. 2020, Fang et al. 2020) attempts to make stair-stepping go away by depositing along curved layers that follow the part surface. Live in research, niche in production. See open question on non-planar toolpath planning.

**References.**

- Pyka, G., et al. (2013). "Surface modification of Ti6Al4V open porous structures produced by AM." *Advanced Engineering Materials*.
- Strano, G., et al. (2013). "Surface roughness analysis, modelling and prediction in selective laser melting." *Journal of Materials Processing Technology* 213.
- Fox, J. C., Moylan, S. P., Lane, B. M. (2016). "Effect of process parameters on the surface roughness of overhanging structures in laser PBF." *Procedia CIRP* 45.
