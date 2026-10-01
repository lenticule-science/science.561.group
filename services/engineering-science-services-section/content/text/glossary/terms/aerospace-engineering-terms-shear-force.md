---
name: "Shear Force"
date-created: 2026-03-07
---

The internal force acting perpendicular to a structural member's axis — carried by spar webs, shear panels, and skins in aircraft structures.

Shear force is the internal force acting perpendicular to the longitudinal axis of a structural member. In a wing, the shear force at any spanwise station equals the total aerodynamic [lift](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/lift.md) outboard of that station. Like [bending moment](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/bending-moment.md), shear force is maximum at the wing root and zero at the tip.

Shear force produces shear [stress](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/stress.md) — stress acting parallel to a surface rather than perpendicular to it:

τ = V × Q / (I × t)

where τ is shear stress, V is shear force, Q is the first moment of area above the point of interest, I is the second moment of area, and t is the thickness of the member at the point. Shear stress is highest at the neutral axis (where bending stress is zero) and zero at the outer surfaces (where bending stress is highest). This complementary distribution is why efficient beam sections use thick flanges for bending (top and bottom) and thin webs for shear (middle).

## Shear in aircraft structures

### Spar webs

The primary path for shear force in a wing is the [spar](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/spar.md) web — the vertical plate connecting the upper and lower spar caps. The web carries shear while the caps carry bending. A thin web is structurally efficient for shear but vulnerable to shear buckling — wrinkling or folding when the shear stress exceeds a critical value. Stiffeners (vertical posts riveted or bonded to the web) increase the buckling threshold without adding much weight.

### Skin panels

In [monocoque](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/monocoque.md) and semi-monocoque structures (the standard in aerospace), the [skin](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/skin.md) carries shear loads in addition to aerodynamic pressure. A closed section (the skin forming a continuous tube around the wing) is dramatically stiffer in shear and [torsion](../../../../services/aerospace-engineering-science-services-section/content/text/glossary/terms/torsion.md) than an open section — this is why aircraft wings are closed-section structures even when the internal [spar](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/spar.md) carries most of the bending.

### Bonded joints

In [composite](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/composite.md) and adhesive-bonded structures, the bond line between parts is loaded almost entirely in shear. The adhesive must resist shear stress across its entire bond area. Bond failures in composite aircraft are almost always shear failures at the adhesive layer. This is why surface preparation (cleaning, sanding, priming) dominates composite bonding procedures — a 10% reduction in bond shear strength can be the difference between flight loads and failure.

### 3D-printed structures

In FDM-printed parts, the inter-layer bond is the weakest shear plane. Loads that produce shear stress along layer boundaries are the most dangerous loading condition for [printed airframes](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/additive-manufacturing-in-uav-airframes.md). Print orientation choices that align layers perpendicular to the dominant shear plane — as discussed in [Designing a Printed Wing](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/documents/articles/notes/designing-a-printed-wing.md) — are essential for structural integrity.
