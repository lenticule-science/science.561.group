---
type: concept
class: geometric-feature
symbol: \theta
depends-on: [layer, build-orientation]
title: Overhang
description: A surface region whose normal has a downward component — formally, the portion of a part's boundary $\partial G$ where the surface normal $\mathbf{n}$ satisfies $\mathbf{n} \cdot \hat{z} < 0$ in the build-axis coordinate frame.
---

# Overhang

A surface region whose normal has a downward component — formally, the portion of a part's boundary $\partial G$ where the surface normal $\mathbf{n}$ satisfies $\mathbf{n} \cdot \hat{z} < 0$ in the build-axis coordinate frame.

For each surface point an **overhang angle** $\theta$ is defined as the angle between the surface tangent and the build axis (equivalently, the angle from horizontal, with $\theta = 0$ being vertical and $\theta = 90°$ being a fully horizontal downward-facing surface).

The structural problem: each new layer extends laterally beyond the previous layer by $h \tan\theta$ where $h$ is layer height. For $\theta > \theta_{\max}$, the new bead overhangs the previous layer by more than half its width and either sags (FFF, SLA before cure), curls (FFF with insufficient cooling), or cannot be supported by the surrounding powder column (powder-bed processes do not need explicit support but can suffer from heat-bleed-induced "bossing").

Process-typical $\theta_{\max}$ values:

- FFF (PLA, well-cooled): $\theta_{\max} \approx 50$–$60°$ from vertical.
- FFF (ABS, no enclosure cooling): $\theta_{\max} \approx 35$–$45°$.
- SLA/MSLA: $\theta_{\max} \approx 30$–$45°$ before support is required.
- SLS/MJF: no overhang limit (powder bed self-supports); only thermal-stress and powder-removal constraints apply.
- DMLS: $\theta_{\max} \approx 35$–$45°$; supports are often welded-on for thermal anchoring, not just geometric support.

The "$45°$ rule" — that overhangs at or below $45°$ from vertical print without support — is approximately correct for most desktop FFF setups and is the standard heuristic taught to new users. It is an empirical rule with documented exceptions; see [overhang-angle-rule](./predication-overhang-angle-rule.md).

When $\theta > \theta_{\max}$ the design choices are:

1. Reorient the part to bring the surface within $\theta_{\max}$.
2. Add [supports](./predication-support.md) (sacrificial structures the slicer generates and removes after print).
3. Bridge: if the overhang is short ($< 50$ mm in FFF) and supported on both ends, span it as a [bridge](./predication-bridging.md).
4. Redesign the geometry to eliminate the overhang (chamfer the underside, add a fillet).

Choice (4) is the design-for-AM move and is preferred when the part is one's own design.

## Earlier material

1. Reorient the part to bring the surface within $\theta_{\max}$.
2. Add [supports](../../../../../../../../history-and-archaeology-science-services-section/content/text/documents/articles/notes/undated/support.md) (sacrificial structures the slicer generates and removes after print).
3. Bridge: if the overhang is short ($< 50$ mm in FFF) and supported on both ends, span it as a [bridge](../../../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication/material-science/additive-manufacturing/archive/bridging.md).
4. Redesign the geometry to eliminate the overhang (chamfer the underside, add a fillet).
