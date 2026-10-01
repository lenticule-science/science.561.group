---
name: "Young's Modulus"
type: "term"
date-created: 2026-03-07
---

The ratio of stress to strain in the elastic region — the measure of a material's stiffness that determines how much it deflects under load.

Young&rsquo;s modulus (E) is the ratio of [stress](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/stress.md) to [strain](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/strain.md) in the elastic (recoverable) region of a material&rsquo;s behavior:

E = σ / ε

It is measured in gigapascals (GPa). A material with a high Young&rsquo;s modulus is stiff — it deflects little under load. A material with a low modulus is compliant — it deforms easily. Young&rsquo;s modulus is a material property: it does not change with the shape or size of the part, only with the material itself.

## Values for aerospace materials

Material
Young&rsquo;s Modulus (GPa)
Density (kg/m³)
Specific stiffness (E/ρ, MN·m/kg)

Steel (4130 alloy)
200
7,850
25

Aluminum (7075-T6)
72
2,810
26

Titanium (Ti-6Al-4V)
114
4,430
26

Carbon fiber composite (unidirectional)
130–180
1,550
84–116

Glass fiber composite
35–45
1,900
18–24

PLA (3D-print filament)
3.5
1,240
2.8

ABS (3D-print filament)
2.1
1,040
2.0

CF-nylon (3D-print filament)
6–9
1,150
5.2–7.8

Expanded polystyrene (foam core)
0.003–0.01
15–30
0.1–0.3

The last column — specific stiffness, Young&rsquo;s modulus divided by density — is more relevant for aerospace than raw modulus. Steel and aluminum have nearly identical specific stiffness (~26), which means a steel structure and an aluminum structure designed for the same stiffness weigh about the same. Carbon fiber composite roughly triples this figure, which is why it dominates high-performance airframe construction. 3D-print filaments are an order of magnitude lower, which is why [printed airframes](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/additive-manufacturing-in-uav-airframes.md) rely on geometric stiffness ([infill](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/infill-density.md) patterns, hollow sections with carbon [spar](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/spar.md) tubes) rather than material stiffness.

## Why stiffness matters beyond strength

A structure can be strong enough to carry its loads but too flexible to function:

- A wing that deflects excessively changes its effective [angle of attack](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/angle-of-attack.md) distribution, degrading aerodynamic performance.

- A wing that is too compliant in torsion can develop [flutter](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/flutter.md) — a destructive coupling between aerodynamic forces and structural vibration.

- A [flight controller](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/flight-controller.md) mounted on a compliant structure receives vibration-contaminated [IMU](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/imu.md) data, degrading navigation accuracy.

Designing for stiffness (governed by Young&rsquo;s modulus and cross-section geometry) is a separate problem from designing for strength (governed by [yield strength](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/yield-strength.md) and cross-section area). A 3D-printed wing [rib](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/rib.md) in PLA may be strong enough to carry flight loads but too flexible to maintain the [airfoil](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/airfoil.md) shape under aerodynamic pressure — the skin between ribs billows outward, distorting the pressure distribution.
