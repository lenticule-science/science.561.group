---
title: "Center of Pressure"
type: "term"
date-created: 2026-03-07
---

The point where the total aerodynamic force effectively acts — its position relative to the center of gravity determines stability.

The center of pressure (CP) is the point on a body where the resultant aerodynamic force can be considered to act. It is the single point that, if you replaced the entire distributed pressure field over the wing with a single force vector, would produce the same net force and moment.

For a wing, the center of pressure depends on the [angle of attack](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/angle-of-attack.md): at low AoA it lies aft; as AoA increases, it moves forward. This movement is what makes the center of pressure awkward for stability analysis — it is not a fixed point.

## Aerodynamic center: the fixed reference

The **aerodynamic center** (AC) is the point about which the pitching moment coefficient does not change with angle of attack. For most subsonic [airfoils](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/airfoil.md), the aerodynamic center is at approximately 25% of the [chord](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/chord.md) from the leading edge. This position is nearly constant regardless of angle of attack, making it far more useful than the center of pressure for design calculations.

The distinction:

- **Center of pressure** = the point where total aerodynamic force acts (moves with AoA)

- **Aerodynamic center** = the point where the moment stays constant as AoA changes (fixed at ~25% chord)

In practice, aerospace engineers work with forces and moments about the aerodynamic center rather than tracking the moving center of pressure. The lift force acts at the AC, and any residual pitching moment (from airfoil [camber](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/camber.md)) is treated as a constant couple.

## Stability: CP vs. CG

An aircraft is statically stable in pitch when the [center of gravity](../../documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/topics/uavs/terms/center-of-gravity.md) is forward of the **neutral point** — the aerodynamic center of the entire aircraft (including wing, tail, and fuselage contributions). If a gust increases the angle of attack, the additional lift force acting aft of the CG creates a nose-down restoring moment, pitching the aircraft back toward its trimmed condition.

For rockets, which lack aerodynamic surfaces that produce restoring moments in the same way, [stability](../../documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/aerospace-engineering/archive/stability.md) requires the center of pressure to be aft of the center of gravity. Fins at the base of a rocket push the CP aft, creating the same kind of restoring moment: if the rocket yaws, the fins generate a side force that pushes the tail back into alignment.

The general rule for both aircraft and rockets: **CG forward of CP/neutral point = stable; CG aft of CP/neutral point = unstable.** The distance between them, expressed as a percentage of the [chord](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/chord.md) (for aircraft) or body calibers (for rockets), is the static margin.
