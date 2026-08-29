---
type: concept
class: process-action
depends-on: []
---

# Retraction

A reverse extruder motion executed during a non-printing travel move to relieve pressure in the [hotend](./predication-hotend.md) melt zone, preventing molten polymer from oozing out the nozzle while the toolhead repositions. After the travel completes, the extruder advances by the same amount to re-pressurize before resuming extrusion.

Two parameters define a retraction event:
- **Distance** — typical $0.5$–$1.5$ mm for direct-drive extruders, $3$–$6$ mm for Bowden setups (the longer Bowden tube has more compressible melt volume to relieve).
- **Speed** — typical $25$–$60$ mm/s; faster relieves more pressure quickly but stresses the extruder gearing and risks filament grinding.

Retraction is necessary because melt-zone pressure does not decay instantly when motion stops. Without retraction, residual pressure plus gravity continue to push polymer out of the nozzle for the duration of the travel move; the resulting droplet either trails as a [string](./predication-stringing.md) between the previous and next print location, or pools on the part as a blob.

Retraction is not free. Each retraction event:
- Adds $\sim 0.5$–$2$ s to print time (most of which is the deceleration/acceleration of the extruder, not the move itself).
- Cycles filament back through the hotend's fusion zone — repeated retraction at the same Z height can cause melt-zone heat-creep, partial degradation, and eventually clogs.
- Withdraws partially-degraded polymer back up the filament path; on repeated cycles this material re-enters the melt zone and accumulates.

Slicers tune retraction events down by:
- **Combing.** Routing travel moves through already-printed regions where any ooze is invisible; combing avoids the retraction altogether at cost of slightly longer travel.
- **Avoid-crossing-perimeters.** A heuristic that prefers travel paths that don't cross outer perimeters (where ooze would scar the surface).
- **Wipe.** Continuing extrusion-direction motion for a short distance after deceleration to "wipe" the nozzle on the just-printed surface.
- **Z-hop.** Lifting the nozzle by 0.1–0.4 mm during travel to clear the part surface; sometimes paired with retraction, sometimes a substitute.

Retraction tuning is one of the most-fiddled FFF parameters and one of the most material-dependent — PLA tolerates aggressive retraction; PETG retracts poorly (stringing-prone); TPU retracts very poorly (the soft filament buckles in the extruder under reverse motion).
