---
title: "Torsion"
type: "term"
date-created: 2026-03-07
---

The twisting load about a structural member's longitudinal axis — produced in wings by the offset between the aerodynamic center and the shear center.

Torsion is the internal twisting moment about the longitudinal axis of a structural member. In a wing, torsion arises because the aerodynamic resultant force does not generally act through the structural [shear](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/shear-force.md) center — the offset between the two creates a twisting moment that tries to rotate the wing nose-up or nose-down along its [span](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/span.md).

The pitching moment coefficient of the [airfoil](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/airfoil.md) is the primary source: cambered airfoils produce a nose-down pitching moment that twists the wing leading-edge-down under load. [Control surface](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/control-surface.md) deflections add torsional loads — an [aileron](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/aileron.md) deflected down on one wing adds a nose-down twist to that wing.

## Why torsion matters

### Flutter

[Flutter](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/flutter.md) — the most dangerous aeroelastic instability — is fundamentally a coupling between wing bending and wing torsion. If aerodynamic forces can twist the wing faster than the structure can resist, the twisting increases the [angle of attack](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/angle-of-attack.md), which increases the aerodynamic force, which increases the twist — a divergent feedback loop that destroys the wing in seconds. Torsional stiffness is the primary structural defense against flutter. A wing can be strong enough to carry all bending and shear loads but still flutter if its torsional stiffness is insufficient.

### Control reversal

At high speed, a wing with low torsional stiffness can twist enough under aileron load that the twist-induced lift change opposes the intended control input. Deflecting an aileron down to roll right twists the wing nose-down, reducing lift on that wing — if the twist effect exceeds the aileron effect, the aircraft rolls left instead. This is aileron reversal, and the speed at which it occurs (the reversal speed) is determined entirely by the wing&rsquo;s torsional stiffness.

### Divergence

If the aerodynamic pitching moment at a given angle of attack exceeds the wing&rsquo;s torsional restoring moment, the wing twists progressively until it fails. The speed at which this occurs (the divergence speed) sets an upper speed limit that is independent of flutter. Forward-swept wings are particularly susceptible because aerodynamic forces tend to increase the sweep-induced bending-torsion coupling.

## Torsional stiffness in different structures

A closed-section structure (skin forming a continuous loop around the wing cross-section) is far stiffer in torsion than an open section. The torsional stiffness of a closed thin-walled section is proportional to the enclosed area squared — a large wing section with thin skin can be torsionally stiffer than a small section with thick walls. This is why aircraft wing design invariably uses closed sections, even when a simpler open-section construction might suffice for bending.

For [3D-printed](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/additive-manufacturing-in-uav-airframes.md) wings, torsional stiffness is often the limiting structural concern. A printed wing with gyroid [infill](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/infill-density.md) has reasonable bending stiffness (resisted by the infill and skin) but may lack torsional stiffness because the infill does not form a structurally continuous closed section. Adding a continuous outer skin — even a thin layer of fiberglass or packing tape — can dramatically improve torsional stiffness by closing the section.
