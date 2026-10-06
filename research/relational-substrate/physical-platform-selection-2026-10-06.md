# Physical platform selection for the ordered-history null

Work ref: `relational-substrate-order-history-null`
Evidence cutoff: 2026-10-06

## Decision

Use **fluidic hysteron networks** as the first physical platform for the endpoint-sufficiency assay. Keep non-Brownian suspensions as a later, harder stress test.

## Why

The assay asks whether an AB/BA history label retains predictive information after the present material state has been measured well enough.

Fluidic hysterons provide unusually strong control of that null because their current configuration, switching thresholds, geometry, flow/pressure variables, and probe response can be measured directly. Rajput & Pahlavan, *Physical Review X*, accepted 2026-08-27, report a passive hydrodynamic hysteron platform with configuration-dependent thresholds and mixed-direction switching paths (DOI 10.1103/hh4n-pw7w). Those are useful because the experiment can enrich the endpoint-state description in explicit layers and ask whether the history coefficient collapses toward the measurement-error benchmark.

Non-Brownian suspensions remain scientifically valuable, and Padamata & Keim, *Physical Review Letters* 136, 258201 (published 2026-06-23), show coexisting directional and amplitude memories. But their relevant microstate is much higher dimensional. A residual history label would therefore be harder to distinguish from incompletely observed present configuration. That makes them a stronger later falsification platform, not the clean first assay.

## First apparatus-level protocol

1. Prepare independently reset nominally identical fluidic-hysteron networks.
2. Randomize two order-reversed driving histories AB and BA with matched total exposure, elapsed time, temperature, and final control variables.
3. Measure endpoint state in nested descriptions:
   - coarse: externally visible hysteron configuration;
   - intermediate: fiber shapes + branch flow rates/pressure drops;
   - rich: all observable geometric/hydraulic state available before the diagnostic probe.
4. Apply the same diagnostic flow protocol to every sample.
5. Fit held-out endpoint-only and endpoint-plus-history models at each state-description level.
6. Compare the fitted history coefficient to the analytic measurement-error curve in `order-history-null-analytic.md`.
7. Treat collapse with richer endpoint measurement as support for ordinary hidden-state memory. Treat a persistent residual only as falsification of endpoint sufficiency for that measured state; then search for missing present-state variables before considering a stronger relational interpretation.

## Falsifiers / controls

- independently reset samples;
- AA and BB controls;
- reversed probe order;
- replicate geometry;
- blind analysis of history label;
- pressure/flow sensor calibration;
- direct check for damage, drift, aging, temperature and evaporation;
- preregistered holdout split and stopping rule.

No result from this platform can by itself establish FOAM, constitutive semantics, or a metaphysical claim.
