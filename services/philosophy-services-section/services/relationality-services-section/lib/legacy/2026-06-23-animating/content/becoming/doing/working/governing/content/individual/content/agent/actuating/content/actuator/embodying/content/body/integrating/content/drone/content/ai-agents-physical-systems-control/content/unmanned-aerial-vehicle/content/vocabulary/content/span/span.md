---
title: "Span"
date-created: 2026-03-06T00:00:00
type: term
aliases:
  - "Span"
  - "span"
  - "wingspan"
defines:
  - "span"
  - "wingspan"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - Aerodynamics
description: "The tip-to-tip distance of a wing, the primary dimension governing induced drag and structural bending loads."
---

Span (or wingspan) is the distance from one wingtip to the other, measured perpendicular to the aircraft's longitudinal axis.
Together with [chord](./chord.md), it defines the wing planform area (S ≈ span × mean chord) and [aspect ratio](./aspect-ratio.md) (AR = span² / S).

Span is the most structurally consequential dimension of a wing.
Bending moment at the root scales with span squared (for a given wing loading), meaning that doubling the span quadruples the root bending load.
This is why high-span wings require heavy, stiff spars — and why [expendable airframes](../concepts/expendable-airframe-design.md) favor short spans that reduce structural requirements at the cost of aerodynamic efficiency.

Span also determines [induced drag](./induced-drag.md): longer spans produce weaker tip vortices for a given amount of [lift](./lift.md), reducing the energy lost to the wake.
This is the fundamental reason that high-endurance UAVs (MQ-9 Reaper: 20 m span; RQ-4 Global Hawk: 40 m span) use long, narrow wings.

Practical span limits for UAVs include: build volume of [3D printers](../concepts/additive-manufacturing-in-uav-airframes.md) or foam-cutting equipment, vehicle transport width, launch rail or catapult dimensions, and storage container size.
Many UAV designs use folding or detachable wings to decouple flight span from transport span.

## Related terms

- [Chord](./chord.md) — the perpendicular wing dimension
- [Aspect Ratio](./aspect-ratio.md) — span divided by mean chord, the ratio governing the efficiency-structure trade-off
