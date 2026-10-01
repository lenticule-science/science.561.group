---
name: "Stall"
date-created: 2026-03-06
---

The rapid loss of lift that occurs when a wing exceeds its critical angle of attack and airflow separates from the upper surface.

A stall occurs when a wing exceeds its critical [angle of attack](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/angle-of-attack.md) — the angle at which airflow can no longer follow the curvature of the upper surface. The [boundary layer](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/boundary-layer.md) separates, the pressure difference that generates [lift](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/lift.md) collapses, and [drag](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/drag.md) increases sharply. The aircraft pitches nose-down (or, if asymmetric, drops a wing and enters a spin).

Stall speed — the minimum airspeed at which level flight is possible — is determined by maximum lift coefficient and [wing loading](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/wing-loading.md):

V_stall = √(2W / (ρ × S × C_L_max))

Stall behavior varies by [airfoil](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/airfoil.md) type and wing [planform](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/wing-planform-selection-for-uavs.md):

- **Thin airfoils** (common at low [Reynolds numbers](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/reynolds-number.md) in small UAVs) tend to stall abruptly — the entire upper surface separates almost simultaneously. This can cause sudden, unrecoverable loss of control.

- **Thick airfoils** stall gradually from the trailing edge forward, giving progressive warning and partial lift retention.

- **Delta wings** stall at very high angles of attack (30°+), with separated flow generating vortex lift from the leading edge — a different and more progressive stall mechanism than conventional airfoils.

- **Swept wings** tend to stall at the tips first, which can cause pitch-up (the tips are behind the center of gravity) — a dangerous characteristic countered by washout or wing fences.

For autonomous UAVs, stall protection is typically implemented in the [flight controller](../../../../services/aerospace-engineering-science-services-section/services/uavs-services-section/content/text/glossary/terms/flight-controller.md) as a pitch or airspeed limit rather than relying on a pilot&rsquo;s physical sensation of airframe buffet.
