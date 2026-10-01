---
name: "Skin"
type: "term"
date-created: 2026-03-06
---

The outer covering of an airframe that defines the aerodynamic shape and may carry structural loads in shear and torsion.

Skin is the outer surface of a wing or fuselage — the material that contacts the airflow and defines the aerodynamic shape. Skin may be purely cosmetic (a non-structural covering over an internal skeleton) or structural (carrying shear and torsion loads as part of a semi-monocoque structure).

**Non-structural skin** is stretched or adhered over [ribs](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/rib.md) and [spars](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/spar.md) and carries no significant load. Examples: heat-shrink film (Monokote, Oracover) on model aircraft and small UAVs; thin fiberglass over a foam core.

**Structural skin** carries a significant fraction of the wing&rsquo;s torsion and shear loads. The skin acts as a thin-walled tube or box around the spar, forming a torque box that resists twisting under aerodynamic load. This semi-[monocoque](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/monocoque.md) approach is used in most UAVs above the hobby scale. Structural skin must resist:

- Shear from aerodynamic forces

- Torsion from offset lift and control surface hinge moments

- Panel buckling under compressive loads (the upper skin of a wing in positive-g flight is in compression)

Skin material choice depends on scale and budget:

- **Film or fabric** — lightest, non-structural. Sub-2 kg models and micro UAVs.

- **Fiberglass over foam** — moderate weight, good shape fidelity, semi-structural. The standard for many small to medium UAVs and expendable drones.

- **Carbon fiber composite** — highest stiffness-to-weight ratio, fully structural. Tactical through HALE UAVs.

- **[3D-printed](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/additive-manufacturing-in-uav-airframes.md) shell** — the outer perimeters (wall/shell count) of a printed wing serve as skin. Increasing shell count from 2 to 4 perimeters can improve torsional stiffness by 40–60% with modest weight increase, because the added material is at maximum distance from the neutral axis.

Skin surface quality directly affects aerodynamic performance. At low [Reynolds numbers](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/reynolds-number.md), surface roughness from FDM layer lines, fiberglass weave, or panel joints can increase [parasitic drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/parasitic-drag.md) by 5–15%. Whether this justifies the cost of sanding and painting depends on the mission duration and efficiency requirements.
