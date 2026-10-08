---
title: "Designing a Printed Wing"
date-created: 2026-03-06T00:00:00
type: curriculum-lesson
aliases:
  - "Designing a Printed Wing"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - additive-manufacturing
  - structural-engineering
  - aerodynamics
description: "A worked example tracing the design of an FDM-printed wing from airfoil selection through infill strategy, weight estimation, and structural validation — showing how print parameters become aerodynamic parameters."
teaches:
  - "infill density as structural design variable"
  - "print orientation and load path alignment"
  - "weight estimation for printed wings"
  - "surface finish effects on aerodynamic performance"
requires:
  - "airfoil"
  - "spar"
  - "rib"
  - "infill density"
  - "reynolds number"
  - "wing loading"
  - "chord"
  - "span"
---

This lesson works through the design of an FDM-printed wing for a small fixed-wing UAV — a 1.2 m span, 200 mm chord, electric-powered platform with a target flying weight of 1.5 kg. It shows how slicer settings become structural decisions, how print orientation determines failure modes, and how the surface finish of a printed wing interacts with [low-Reynolds-number aerodynamics](../../../glossary/terms/low-reynolds-number-aerodynamics.md) in ways that can help or hurt performance depending on flight condition.

## Starting point: the airframe requirements

The design target:

| Parameter | Value |
|---|---|
| Wingspan | 1.2 m |
| Chord | 200 mm (constant, for simplicity) |
| Wing area | 0.24 m² |
| Target flying weight | 1.5 kg |
| [Wing loading](../../../glossary/terms/wing-loading.md) | 6.25 kg/m² (61 N/m²) |
| Cruise speed | 12–15 m/s |
| Cruise [Reynolds number](../../../glossary/terms/reynolds-number.md) | ~160,000–200,000 |

At this Reynolds number, the wing operates squarely in the [low-Re regime](../../../glossary/terms/low-reynolds-number-aerodynamics.md) where laminar separation bubbles, surface roughness effects, and airfoil selection all interact strongly.

## Airfoil selection

At Re 160,000–200,000, conventional NACA 4-digit airfoils perform poorly. The NACA 2412 — a reliable workhorse at Re > 1,000,000 — develops a large laminar separation bubble on the upper surface that increases [drag](../../../glossary/terms/drag.md) by 80–100% compared to its high-Re performance.

Better choices for this regime:

| [Airfoil](../../../glossary/terms/airfoil.md) | Thickness | C_L at best L/D | L/D at Re 200k | Notes |
|---|---|---|---|---|
| Clark Y | 11.7% | 0.6–0.8 | ~30 | Simple flat bottom, easy to print |
| NACA 2412 | 12% | 0.5–0.7 | ~20 | Separation bubble penalty |
| Eppler 387 | 9.1% | 0.5–0.7 | ~45 | Designed for low Re; thin |
| AG35 | 8.4% | 0.4–0.6 | ~50 | Competition model airfoil |
| S1223 | 12.1% | 1.0–1.2 | ~35 | High lift, aft-loaded camber |

For a printed wing, the Clark Y is a pragmatic choice: its flat lower surface simplifies printing (the wing can be printed bottom-down with no support material on the critical lower surface), it has reasonable low-Re performance, and its 11.7% thickness provides internal volume for structure.

The thinner competition airfoils (Eppler 387, AG35) offer better aerodynamic performance but leave less internal volume for [infill](../../../glossary/terms/infill-density.md) and [spar](../../../glossary/terms/spar.md) structure — a real constraint when the wing must be self-supporting from the printer.

## Print orientation

The single most consequential decision in printed wing design is print orientation, because FDM parts are anisotropic: strong along deposited filament lines, weak between layers.

**Option A: Spanwise printing (filament runs tip-to-tip).** Each printed layer is a spanwise slice of the wing. Filament lines align with the primary bending load path. Layer adhesion (the weak axis) is loaded in shear, which it handles reasonably well. This orientation maximizes bending strength but requires the wing to fit within the printer's X or Y axis — a 600 mm semi-span needs a printer with at least 600 mm in one horizontal dimension, or the wing must be printed in segments and joined.

**Option B: Chordwise printing (filament runs leading-edge to trailing-edge).** The wing stands upright on the printer, with each layer being a chordwise cross-section. This fits easily on standard printers (200 mm [chord](../../../glossary/terms/chord.md) fits most beds). But the weak inter-layer bonds now align with the spanwise bending axis — exactly the worst orientation for wing loads. Bending strength can be 40–70% lower than Option A for the same infill.

**Option C: Vertical printing (wing printed on its trailing edge).** Filament lines run roughly spanwise in the lower layers and chordwise in upper layers. Provides moderate bending strength but requires extensive support material for the overhanging upper surface and produces poor surface finish on the supported side.

For most small UAV wings, **Option A (spanwise)** is preferred. If the semi-span exceeds printer capacity, the wing is printed in two or more segments with a [spar](../../../glossary/terms/spar.md) tube (carbon fiber rod or aluminum tube) bonded through aligned holes to carry bending loads across the joints.

## Infill strategy

Infill is where slicer software becomes structural engineering. The key insight: infill density does not need to be uniform. A wing experiences maximum bending moment at the root and near-zero bending at the tip. Matching infill to the load distribution saves weight without sacrificing strength.

### Worked weight estimate

Consider the 600 mm semi-span printed in PLA at 0.2 mm layer height, 2 perimeter walls (0.8 mm total wall thickness):

| Region | Span station | Infill density | Infill pattern | Rationale |
|---|---|---|---|---|
| Root (0–100 mm) | 0–17% | 30% | Gyroid | Maximum bending moment; gyroid resists multi-axis loads |
| Mid-span (100–350 mm) | 17–58% | 15% | Gyroid | Moderate bending; weight-efficient |
| Tip (350–600 mm) | 58–100% | 8% | Rectilinear | Low loads; rectilinear is lightest at low density |

Estimating weight for each section (PLA density 1.24 g/cm³, airfoil cross-section area ~2,400 mm² for Clark Y at 200 mm chord):

**Shell weight** (2 walls at 0.4 mm each, perimeter of ~460 mm):
- Wall cross-section: 460 mm × 0.8 mm = 368 mm²
- Per mm of span: 368 mm² × 1.24 mg/mm³ = 0.456 g/mm
- Full semi-span: 0.456 × 600 = 274 g

**Infill weight** (interior area ~2,032 mm² after subtracting walls):
- Root section (100 mm at 30%): 2,032 × 0.30 × 100 × 1.24 × 10⁻³ = 75.6 g
- Mid section (250 mm at 15%): 2,032 × 0.15 × 250 × 1.24 × 10⁻³ = 94.5 g
- Tip section (250 mm at 8%): 2,032 × 0.08 × 250 × 1.24 × 10⁻³ = 50.4 g

**Semi-span total: ~495 g. Full wing: ~990 g.**

This is heavy — 66% of the 1.5 kg flying weight, leaving only 510 g for fuselage, motor, battery, electronics, and payload. The wing weight must come down.

### Reducing wing weight

Options, in order of effectiveness:

1. **Reduce wall count to 1 perimeter (0.4 mm wall).** Halves shell weight to ~137 g per semi-span. Full wing shell: ~274 g. Risk: thin walls are fragile during handling and vulnerable to puncture.

2. **Reduce infill across the board.** Root 20%, mid 10%, tip 5%. Infill weight drops to roughly 130 g per semi-span. Full wing infill: ~260 g.

3. **Use a spar cap instead of infill for bending.** Print the wing hollow (3–5% infill for print stability) with a channel for a carbon fiber rod or tube. A 6 mm OD carbon tube weighing 15 g can carry the bending loads that 200+ g of PLA infill was providing. Total wing weight: 274 g (1-wall shell) + 80 g (minimal infill) + 30 g (spar tube, adhesive, root reinforcement) = ~384 g for the full wing.

Option 3 — hollow printed shell with carbon spar — is the standard approach for competitive printed wings. The print provides the aerodynamic shape; the carbon carries the structural loads.

## Infill pattern selection

Not all infill patterns are equal under wing loads:

| Pattern | Density needed for equivalent stiffness | Shear resistance | Print time | Notes |
|---|---|---|---|---|
| Rectilinear | Baseline | Poor off-axis | Fastest | Lines align with one axis; weak in other directions |
| Grid | 0.9× baseline | Good biaxial | Moderate | Two perpendicular line sets |
| Gyroid | 0.7× baseline | Good omnidirectional | Slowest | Continuous curved surface; no weak axis |
| Triangular | 0.8× baseline | Good in-plane | Moderate | Resists shear well |

[Gyroid infill](../../../glossary/terms/infill-density.md) provides the best strength-to-weight ratio for wing applications because wing loads are multi-directional: bending (spanwise), shear (vertical at the spar), and torsion (nose-up/nose-down from aerodynamic pitching moment). Gyroid has no preferred direction, so it resists all three load types without requiring alignment to a specific axis.

The practical penalty: gyroid prints 15–30% slower than rectilinear at the same density, because the curved paths require more acceleration and deceleration of the print head.

## Surface finish and aerodynamics

FDM layer lines create surface roughness of 0.1–0.3 mm height, depending on layer height and material. At the flight Reynolds number of this wing (~160,000–200,000), this roughness interacts with the [boundary layer](../../../glossary/terms/boundary-layer.md) in a complex way.

At Re 160,000 on a Clark Y:
- A **perfectly smooth** surface develops a laminar separation bubble starting around 40% chord on the upper surface. The bubble reattaches by ~60% chord but adds significant pressure drag. Predicted L/D ≈ 28.
- A **printed surface** (0.2 mm layer lines) trips the boundary layer to turbulent at ~15–25% chord, before the separation point. No bubble forms. Turbulent skin friction is higher, but elimination of the bubble reduces total drag. Predicted L/D ≈ 30–32.

At this Reynolds number, **the printed surface is actually better than a smooth surface.** The layer lines act as a distributed turbulator, solving the laminar separation bubble problem that purpose-designed turbulator strips are meant to address.

But this is not universally true. At Re 300,000 (higher speed or larger chord), a smooth surface would maintain attached laminar flow over more of the chord, and the forced early transition from print roughness would increase drag. The roughness that helps at Re 160,000 hurts at Re 300,000.

**The design implication:** the optimal surface finish depends on the flight condition. For a wing that operates at a single cruise speed, the print surface may be left as-is or even enhanced with intentional roughness. For a wing that must perform across a wide speed range, sanding and filling the surface to reduce roughness — then applying a turbulator strip at a specific chord location — gives more controlled and predictable performance.

## Structural validation

Before flying, the wing should be proof-loaded to verify that the structure meets the design loads:

**Design load case:** 3g pull-up at maximum weight.
- Wing lift at 3g: 1.5 kg × 9.81 m/s² × 3 = 44.1 N per semi-span
- Distributed as an elliptical load (approximation), root bending moment: ~44.1 × 0.6 × 0.42 ≈ 11.1 N·m

**Proof test:** Support the wing at the root, apply 4.5 kg (1.5× design load = 4.5g equivalent) distributed along the span using sandbags or weights. The wing should:
- Not fracture or delaminate
- Deflect no more than ~30 mm at the tip (excessive deflection changes the effective [angle of attack](../../../glossary/terms/angle-of-attack.md) distribution and degrades aerodynamic performance)
- Return to its original shape after load removal (no permanent set)

If the wing fails proof loading, the most common fixes are:
- Increase root infill density or extent
- Add a spar cap (carbon strip bonded to the upper and lower surfaces at the thickest point of the airfoil)
- Switch to a stronger infill pattern (gyroid instead of rectilinear)
- Increase wall count at the root

## The key insight

A printed wing is not just a structure shaped like an airfoil. It is an aerodynamic surface whose structural parameters (infill density, pattern, wall thickness, print orientation) directly affect its aerodynamic performance (through weight, stiffness, and surface finish), and whose aerodynamic operating condition (Reynolds number) determines whether the manufacturing artifact of layer lines helps or hurts. Designing a printed wing well requires thinking about structure and aerodynamics simultaneously — the slicer settings are as much aerodynamic decisions as they are structural ones.

## Related concepts

- [Additive Manufacturing in UAV Airframes](../../../glossary/terms/additive-manufacturing-in-uav-airframes.md) — broader treatment of FDM printing for UAV structures
- [Low-Reynolds-Number Aerodynamics](../../../glossary/terms/low-reynolds-number-aerodynamics.md) — the aerodynamic regime governing this wing's performance
- [Wing Planform Selection for UAVs](../../../glossary/terms/wing-planform-selection-for-uavs.md) — why this wing uses a conventional planform rather than a delta
