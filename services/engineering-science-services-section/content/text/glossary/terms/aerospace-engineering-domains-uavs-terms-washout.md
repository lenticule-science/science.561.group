---
title: "Washout"
type: "term"
date-created: 2026-03-06
---

A decrease in angle of incidence from wing root to tip, ensuring the root stalls first and preserving aileron authority at high angles of attack.

Washout is a deliberate twist built into a wing such that the [angle of attack](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/angle-of-attack.md) at the tip is lower than at the root. Typically 1–4° of washout is used, meaning the tip [airfoil](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/airfoil.md) is angled slightly nose-down relative to the root airfoil.

**Why washout matters:** Without washout, a rectangular or tapered wing tends to [stall](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/stall.md) at the tips first — the tips operate at higher local angles of attack due to induced downwash effects and taper geometry. Tip stall is dangerous: it causes sudden loss of [aileron](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/aileron.md) authority (since ailerons are outboard) and can trigger a spin. With washout, the root reaches its stall angle first while the tips still have margin, preserving roll control into the stall.

**Geometric washout** — physically twisting the wing structure so the tip has a lower incidence angle. Simple to implement in construction: a twisted spar, a jig that holds the tip at a different angle, or a [3D print](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/additive-manufacturing-in-uav-airframes.md) with the twist modeled into the CAD geometry.

**Aerodynamic washout** — using a lower-[camber](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/camber.md) or thinner airfoil at the tip than at the root, so the tip produces less lift at a given angle of attack without physically twisting the structure. More complex to design but avoids the manufacturing challenge of holding a precise twist angle during construction or printing.

For [3D-printed](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/additive-manufacturing-in-uav-airframes.md) wings, washout can be modeled precisely in CAD and reproduced identically in every print — an advantage over hand-built foam-core wings where washout depends on jig accuracy and builder skill. However, warpage during printing or cooling can introduce unintended twist, so the as-built washout should be verified before flight.

Delta wings generate a related effect naturally: the strong leading-edge vortices that form at high angles of attack tend to break down at the tip first, giving progressive stall behavior without explicit washout. This is one reason delta [planforms](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/wing-planform-selection-for-uavs.md) are forgiving of manufacturing imprecision.
