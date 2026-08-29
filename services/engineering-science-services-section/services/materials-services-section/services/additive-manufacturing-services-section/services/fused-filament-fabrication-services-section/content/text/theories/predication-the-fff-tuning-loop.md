---
type: narrative
introduces: [extrusion-multiplier, pressure-advance, retraction]
discusses: [layer-adhesion]
---

# The FFF tuning loop

A new (machine, material) pair is, by default, mis-tuned: the slicer's idealized flow model and the actual physical extrusion drift apart in predictable ways. The "tuning loop" is the sequence of small calibration prints that close that gap; serious FFF users run it once per filament spool and the loop has a canonical order.

**Step 0: PID-tune the hotend and bed.** Marlin: `M303 E0 S215 C5`. Klipper: `PID_CALIBRATE`. Without stable temperature control, no downstream calibration is reproducible. One-time per hardware change.

**Step 1: Calibrate e-steps.** Mark the filament 120 mm above the extruder; extrude 100 mm; measure remaining; scale `M92 E<value>`. One-time per extruder. Sets *commanded-to-actual* extrusion mapping.

**Step 2: Set [extrusion multiplier](./predication-extrusion-multiplier.md) (flow).** Print a thin-walled cube; measure wall thickness; compute $f$. Per filament spool. Sets *actual-to-deposited-volume* mapping. The single most important per-spool calibration.

**Step 3: Temperature tower.** Print a multi-segment tower spanning $190$–$230$°C in $10$°C steps. Inspect each segment for surface, overhang, stringing, and bridge quality. Pick the *highest* temperature at which all four are acceptable — it maximizes [layer adhesion](./predication-layer-adhesion.md) without overheating. See [nozzle-temperature-vs-layer-adhesion-tradeoff](./predication-nozzle-temperature-vs-layer-adhesion-tradeoff.md).

**Step 4: [Retraction](./predication-retraction.md) tuning.** Print a stringing test (tall narrow towers with travel between them). Sweep retraction distance ($0.5$–$2$ mm direct-drive, $3$–$6$ mm Bowden) in $0.2$ mm steps. Pick the lowest distance with no visible strings.

**Step 5: [Pressure advance](./predication-pressure-advance.md) (Klipper) or linear advance (Marlin).** Print the firmware-specific test pattern; visually identify the $K$ at which corner over-extrusion just disappears. Per filament; shifts modestly per spool.

**Step 6: Maximum volumetric flow.** Print a thin-walled cube at increasing speed until the bead develops gaps. The speed at which gaps appear, times bead area, is the hotend's effective $Q_{\max}$. Set this as the slicer's maximum-volumetric-flow ceiling.

After steps 0–6 the (machine, material, profile) triple is calibrated. Subsequent prints with this material reproduce reliably; mechanical-property tests give consistent results; appearance is uniform.

**The loop is filament-specific, not material-specific.** Two spools of PLA from the same manufacturer can require $f$ values $0.04$ apart due to diameter variance. A spool change without re-tuning $f$ is a common source of "my prints suddenly went to hell." Logging $f$ on the spool with a marker is good practice.

**The loop is not a one-time event.** Hardware drifts: nozzle wear, extruder gear wear, bed-leveling drift, thermistor drift. A revisit every 50–100 print hours catches drift before it produces failures.

The corpus equivalent: each tuning step writes a small piece of state into the printer's effective profile. Running the loop in a different order can produce inconsistent results because steps interact (e.g. retraction tuning depends on temperature, which depends on flow). The order above is the de facto standard.
