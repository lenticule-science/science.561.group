---
name: "Stress"
date-created: 2026-03-07
---

Force per unit area within a material — the fundamental quantity governing whether a structure holds or fails.

Stress is the internal force per unit area that develops within a material when external loads are applied. It is measured in pascals (Pa) or, more practically in aerospace, in megapascals (MPa). Stress is what the material *feels*; [structural load](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/structural-load.md) is what the vehicle *experiences*. The engineer&rsquo;s task is to ensure that the stresses produced by the worst expected loads remain below the material&rsquo;s capacity.

σ = F / A

where σ is stress, F is force, and A is the cross-sectional area over which that force is distributed. The same force applied over a smaller area produces higher stress — this is why a thin [spar](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/spar.md) web fails before a thick one under the same load, and why [safety factors](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/safety-factor.md) in aerospace must account for stress concentrations at holes, notches, and joints.

## Types of stress

**Tensile stress** — the material is being pulled apart. The lower surface of a wing under aerodynamic [lift](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/lift.md) is in tension: the wing bends upward, stretching the bottom skin and [spar](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/spar.md) cap. Tensile failure is usually the critical mode for metals.

**Compressive stress** — the material is being pushed together. The upper surface of a loaded wing is in compression. Thin structures under compression can buckle — fail by geometric instability rather than material fracture — which is why aircraft skins are stiffened with stringers and [ribs](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/rib.md).

**Shear stress** — the material is being loaded parallel to a surface rather than perpendicular to it. [Spar](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/spar.md) webs carry shear loads from aerodynamic forces. Adhesive bond lines in [composite](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/composite.md) structures fail in shear. See [shear force](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/shear-force.md).

**Bearing stress** — compressive stress at the contact point between a fastener (bolt, rivet, pin) and the hole it passes through. A common failure mode in bolted composite joints: the bolt crushes the laminate around the hole.

## Stress in aerospace design

Aerospace structures are designed to be as light as possible while keeping stresses below allowable limits. This means operating at higher stress levels (closer to the material&rsquo;s capacity) than most engineering disciplines — a bridge might use 30% of its steel&rsquo;s [yield strength](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/yield-strength.md); an aircraft wing skin might use 70–80%. The [safety factor](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/safety-factor.md) (typically 1.5 for crewed aircraft, 1.1–1.3 for [expendable](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/expendable-airframe-design.md) UAVs) is the margin that prevents this approach from killing people.

Stress concentrations — local increases in stress around geometric discontinuities (holes, notches, fillets, ply drops) — are the source of most aerospace structural failures. A circular hole in a plate under tension produces a stress concentration factor of 3.0: the stress at the edge of the hole is three times the average stress in the plate. Design around stress concentrations is a central preoccupation of aerospace structural engineering.
