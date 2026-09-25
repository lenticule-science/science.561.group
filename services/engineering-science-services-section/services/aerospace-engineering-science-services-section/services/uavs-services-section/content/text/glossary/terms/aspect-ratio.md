---
name: "Aspect Ratio"
date-created: 2026-03-06
aliases:
  - "Aspect Ratio"
  - "aspect ratio"
  - "AR"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - Aerodynamics
description: "The ratio of wingspan to mean chord, governing the trade-off between aerodynamic efficiency and structural simplicity."
---

Aspect ratio (AR) is the ratio of a wing's span to its mean chord (average width), or equivalently, the square of the span divided by the wing planform area. A long, narrow wing (sailplane, AR 15–30) has high aspect ratio; a short, wide wing (delta fighter, AR 1.5–3) has low aspect ratio.

High aspect ratio reduces induced drag — the drag penalty caused by generating lift with a finite-span wing. This improves cruise efficiency and range. But high-aspect-ratio wings are structurally demanding: the long spar must resist large bending moments, requiring stronger (heavier, more expensive) materials and more precise manufacturing.

The UAV spectrum spans nearly the entire practical range of aspect ratios:

| Platform | AR | Rationale |
|---|---|---|
| Expendable delta (Shahed, LUCAS) | 1.5–2.5 | Structural simplicity, manufacturing tolerance |
| FPV racing quad (arm span / body) | N/A | Rotary-wing; disc loading replaces AR |
| Small fixed-wing (Raven, hand-launch) | 5–8 | Balance of portability and efficiency |
| Tactical (ScanEagle) | 8–12 | Loiter endurance priority |
| MALE (MQ-9 Reaper, TB2) | 12–20 | Long-endurance cruise efficiency |
| HALE (RQ-4 Global Hawk) | 25–30 | Maximum aerodynamic efficiency at altitude |

A delta wing with AR 2.0 has roughly four times the [induced drag](./induced-drag.md) of a conventional wing with AR 8.0 at the same lift coefficient — but the delta's [spar](./spar.md) weighs less, costs less, and can be manufactured by unskilled labor or [3D printing](./additive-manufacturing-in-uav-airframes.md) with wide tolerances. The choice of aspect ratio is always a compromise between aerodynamic efficiency and structural/manufacturing cost — see [Wing Planform Selection for UAVs](./wing-planform-selection-for-uavs.md).

## Related terms

- [Wing Loading](./wing-loading.md) — the complementary parameter that, together with aspect ratio, defines the flight envelope
- [Induced Drag](./induced-drag.md) — the drag component directly governed by aspect ratio
- [Span](./span.md) — the dimension that aspect ratio relates to chord
