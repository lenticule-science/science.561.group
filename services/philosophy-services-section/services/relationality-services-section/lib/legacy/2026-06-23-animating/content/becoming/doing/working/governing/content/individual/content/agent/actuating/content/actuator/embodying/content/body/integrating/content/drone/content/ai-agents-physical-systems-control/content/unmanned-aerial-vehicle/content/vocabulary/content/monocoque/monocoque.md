---
title: "Monocoque"
date-created: 2026-03-06T00:00:00
type: term
aliases:
  - "Monocoque"
  - "monocoque"
  - "semi-monocoque"
defines:
  - "monocoque"
  - "semi-monocoque"
authors:
  - emsenn
  - claude-opus-4-6
keywords:
  - StructuralEngineering
description: "A structural approach where the outer skin carries the primary loads, minimizing or eliminating internal framework."
---

Monocoque (French: "single shell") is a structural design philosophy where the outer [skin](./skin.md) of a structure carries all or most of the loads — bending, torsion, and shear — without a separate internal skeleton.
A pure monocoque has no internal frame; a **semi-monocoque** adds internal stiffeners ([spars](./spar.md), [ribs](./rib.md), stringers, bulkheads) to prevent the skin from buckling under compression, while the skin still carries a significant share of the load.

Most UAV airframes above the hobby scale are semi-monocoque: the fuselage is a skin tube stiffened by bulkheads and longerons, and the wing is a skin-covered torque box formed around one or two spars with periodic ribs.

[3D-printed](../concepts/additive-manufacturing-in-uav-airframes.md) UAV components can approach true monocoque construction.
A printed fuselage tube with 3–4 perimeter walls and moderate [infill](./infill-density.md) is effectively a monocoque — the "skin" (perimeter walls) and "structure" (infill) are printed as a single continuous part.
This eliminates the assembly step of attaching skin to frame and is one of the key advantages of additive manufacturing for airframe production.

Foam-core composite construction is another near-monocoque approach: the foam core defines the shape and resists compression, while the fiberglass or carbon skin carries tension and shear.
This is the primary construction method for the Shahed-136 and similar expendable UAV families.

## Related terms

- [Skin](./skin.md) — the outer surface that carries loads in monocoque construction
- [Spar](./spar.md) — the internal beam that distinguishes semi-monocoque from pure monocoque
- [Composite](./composite.md) — the material class most commonly used for monocoque UAV structures
