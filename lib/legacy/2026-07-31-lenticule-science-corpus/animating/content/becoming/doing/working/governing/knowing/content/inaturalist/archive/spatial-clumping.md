---
title: "Failure mode: spatial clumping"
---

Spatial clumping happens when many observations cluster in a few locations. This reflects observer access, not necessarily ecological importance.

## Indicators

- High observation density near trailheads, roads, or urban centers.
- Large unsampled gaps within the same region.
- Multiple observations recorded from the same coordinates over long periods.

## Mitigation practices

- Diversify observation sites deliberately.
- Use projects or checklists to plan coverage.
- Record coordinate uncertainty honestly instead of forcing precise points.

## What goes wrong if you do this poorly

Clumped data can create false “hotspots” and understate distributions in less visited habitats. In spatial models, this bias can dominate predictions more than environmental variables.

## Sources

- Hijmans (2012) on spatial bias in biodiversity data: <https://doi.org/10.1111/j.2041-210X.2011.00172.x>

## Spatial thinning method (basic)

1. Export observations with coordinates.
2. Set a minimum distance threshold (e.g., 1 km).
3. Use GIS or R tooling (e.g., `spThin`) to thin points.
4. Document the threshold and rationale.
