---
name: "Reynolds Number"
type: "term"
date-created: 2026-03-06
---

The dimensionless ratio of inertial to viscous forces in a flow, determining whether airfoil behavior is dominated by friction or momentum.

Reynolds number (Re) is the ratio of inertial forces to viscous forces in a fluid flow:

Re = V × L / ν

where V is flow velocity, L is a characteristic length (typically [chord](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/chord.md) for a wing), and ν is the kinematic viscosity of air (~1.5 × 10⁻⁵ m²/s at sea level).

Reynolds number is the most important scaling parameter in aerodynamics. Two wings with the same [airfoil](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/airfoil.md) shape and same angle of attack will behave identically if they have the same Reynolds number — regardless of whether one is a 100 mm model and the other a 10 m transport wing. Conversely, an airfoil that performs well at one Reynolds number may perform poorly at another.

The UAV spectrum spans an enormous Reynolds number range:

Platform class
Chord
Speed
Reynolds number

Indoor micro UAV
50 mm
5 m/s
~17,000

Small quadcopter (rotor blade)
20 mm
30 m/s
~40,000

FPV racing quad
100 mm
30 m/s
~200,000

Small fixed-wing (2 kg)
150 mm
15 m/s
~150,000

Tactical UAV (50 kg)
300 mm
30 m/s
~600,000

Shahed-class OWA
500 mm
50 m/s
~1,700,000

MQ-9 Reaper
800 mm
80 m/s
~4,300,000

RQ-4 Global Hawk
2,500 mm
170 m/s
~28,000,000

Below Re ≈ 500,000, the [boundary layer](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/boundary-layer.md) tends to remain laminar over much of the airfoil surface. Laminar boundary layers are thinner and produce less friction drag — but they are also more fragile, separating easily under adverse pressure gradients. This creates a regime (Re 50,000–200,000) where conventional airfoils suffer from **laminar separation bubbles**: the laminar boundary layer separates, transitions to turbulent in the free shear layer, and reattaches — forming a recirculation bubble that dramatically increases drag and reduces lift.

Specialized low-Reynolds-number airfoils manage this transition deliberately through careful camber and thickness distribution, turbulators (physical trips on the surface), or surface roughness. For [3D-printed](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/additive-manufacturing-in-uav-airframes.md) wings, the inherent surface roughness of FDM layer lines can inadvertently trip the boundary layer — sometimes beneficially (preventing laminar bubbles) and sometimes detrimentally (increasing turbulent friction drag). Whether the roughness helps or hurts depends on the Reynolds number, the layer height relative to the boundary layer thickness, and the chordwise location of the roughness.
