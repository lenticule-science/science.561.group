---
title: "FlowCell — CURRENT"
date-updated: 2026-10-05
kind: research-program-current-state
status: current
organization: Lenticule Science
revision: 12
---

# FlowCell — CURRENT

This is the canonical Library-side continuation pointer for the FlowCell science program. It does not replace the program charter, experimental records, fabrication artifacts, source code, or independent receiving evidence.

## Program state

FlowCell is an active **pre-prototype** water-current-energy research and engineering program. The current Library charter is:

`flowcell_program_charter_v0_2.md`

Its present product thesis is a deployable current-energy platform for tidal streams, rivers, channels, estuaries, and other persistent-water-current sites, with a conventional certified storage baseline and experimental chemistry kept as a separate research branch.

No Library artifact presently establishes a field-qualified FlowCell product, a production system, a measured DVT power curve, or independent acceptance. Generated CAD/STL, hydrodynamic calculations, FMEA/test matrices, schematics, and fabrication packets are engineering/research inputs unless a physical receipt says otherwise.

## Canonicality and source-plane state

Library canonical home:

`/Lenticule Science/FlowCell/`

Canonical state carrier:

`/Lenticule Science/FlowCell/CURRENT.md`

Canonical Library charter:

`/Lenticule Science/FlowCell/flowcell_program_charter_v0_2.md`

Current owning Git/source carrier: **unresolved**. `emsenn/bare-cedar-fog` is only the repository snapshot of the Leader's Bare Cedar Fog development laptop and the MetroPlat instance local to that machine; its contents or search misses are not evidence of FlowCell ownership or absence.

A separate historical/staging carrier remains in `emsenn/561-group` PR #27 (`flowcell-institution-v0-1`, head `5e78c055b079982c138c531710d7296ad7105167`). Its existence is provenance/staging evidence, not ownership evidence. Its PR body still says “4 bounded duties,” while the staged source contains six duties and six corresponding works. Do not update, restack, replace, or review that Git carrier on Science's behalf until authoritative agency/source records bind `FlowCell → owning carrier`.

Until that ownership binding exists, this Library `CURRENT.md` plus MetroPlat are the lawful continuity carriers.

## Library artifact families

The existing FlowCell folder already contains the durable working sequence. Reuse these carriers instead of generating fresh “final” or incremented copies merely to summarize them.

- `flowcell_program_charter_v0_2.md` — program/product charter and standards/research basis.
- `flowcell_fc1_requirements_fmea_v0_1.md` — first-system requirements and failure analysis.
- `flowcell_fc1_hydrodynamic_sizing_v0_1.md` plus its model/data/plots — analytical FC-1 sizing work.
- `flowcell_morphology_tournament_v0_1.md` and associated candidate/test registries — comparative morphology program.
- `flowcell_common_test_spine_and_pump_v0_1.md` and associated BOM/screening/schematics — shared experimental infrastructure.
- `flowcell_mundane_survivability_ecology_tournament_v0_1.md` plus matrices — survivability/failure ecology.
- `flowcell_tournament_fabrication_packet_v0_1.md`, derived meshes/STLs, `FIRST_ARTICLE_JOB_CARD.md`, and `first_article_inspection_targets.csv` — first-article fabrication/inspection lineage.

Existing `_v0_1` and `_v0_2` names are preserved as historical/working artifact identities. They are not a license to continue suffix spray. Program-level state changes update this `CURRENT.md`; experiment-specific carriers should be extended in place or receive an explicit successor relation.

## Scientific boundaries

FlowCell is also an assay platform for existing Lenticule research, not evidence that those theories are correct.

Current science bridges include:

- sheaf/cohomological sensor-fusion models versus ordinary residual/Kalman/Bayesian baselines;
- FOUR-valued fault logic under contradictory telemetry;
- closure/settling dynamics versus simpler control/state-estimation baselines;
- dynamic-siloxane/self-repair material testing;
- R5 energy-coupled-maintenance experiments shared with Artificial Abiogenesis;
- causal/event traces for fault hypotheses.

A formalism graduates only when it produces a discriminating prediction, measurement, control advantage, or failure-localization advantage against simpler baselines.

## L-Space serving revalidation — 2026-10-04

The L-Space service recovered during this cycle (known-result search, normal empty-result
behavior, and direct fetch all succeeded), but direct searches for `FlowCell` and
`FlowCell T0 blade` returned no results. Therefore FlowCell is not presently demonstrated
as L-Space-ingested/retrievable by its program identity. Keep the Library CURRENT carrier
as the durable continuation point; do not infer a missing Git owner from this search miss.

## Fabrication receiving revalidation — 2026-10-04

The existing `FIRST_ARTICLE_JOB_CARD.md` remains the current fabrication input. Its
purpose is explicitly **fabrication-process qualification, not rotor qualification**; it
requires machine/material/profile recording, chord inspection against
`first_article_inspection_targets.csv`, photographs, mass/duration receipts, and it
stops before rotation or wet high-speed testing. No replacement job card is needed.

A fresh live MetroPlat `offices` projection did not resolve a current office whose record
identified fabrication, additive manufacturing, printer operation, or a comparable
machine-control receiver. Therefore the first article is **receiver-blocked**, not a
design-document gap. Do not route it through a Bare Cedar Fog repository or infer a
Fabrication office from snapshot source. Wake when current authoritative agency/resource
records expose the fabrication receiver plus the lawful machine-control grant/capability;
then dispatch the existing job card and receive the physical inspection evidence back into
this program.

## Hydrodynamic screening-model correction — 2026-10-04

A direct consistency audit of `flowcell_fc1_hydrodynamic_model_v0_1.py`, `flowcell_fc1_power_curve_v0_1.csv`, and `flowcell_fc1_hydrodynamic_sizing_v0_1.md` found one current engineering-science defect and repaired the canonical Library carriers in place.

The original model capped exported electrical power at 1.2 kW and then computed `torque = P_export / omega`, while the same above-rated rows continued to assume fixed `Cp=0.36` and TSR=4. Above rated, those assumptions cannot all describe shaft power simultaneously: the exported-power-equivalent torque falls with speed even though the fixed-`Cp` aerodynamic capture implies rising shaft torque.

The repaired model now distinguishes `captured_mechanical_power`, `rotor_shaft_torque` under the fixed-`Cp`/TSR screening assumption, and `export_equivalent_torque` after the 1.2 kW export cap. The power-curve CSV carries both torque quantities. The dependent `flowcell_fc1_requirements_fmea_v0_1.md` has also been corrected: its design point now distinguishes 34.4 N·m screened shaft torque from 30.0 N·m export-equivalent torque, and new requirement HYD-009 forbids using capped export power as an above-rated shaft-torque proxy before the control/load envelope is defined and tested. At the 3.0 m/s rated neighborhood, the screen gives about **34.4 N·m** aerodynamic-equivalent shaft torque versus **30.0 N·m** exported-power-equivalent torque. At the deliberately provisional 4.5 m/s extreme, fixed `Cp`/TSR would imply about **77.3 N·m** shaft torque while `1200/omega` is only **20.0 N·m**. The latter must not be used for shaft sizing.

Epistemic consequence: the earlier `>=40 N·m` statement remains a useful **rated-point minimum**, not a demonstrated above-rated drivetrain requirement. Above-rated deload/braking/dump/runaway behavior is now an explicit open control/load-envelope obligation before shaft/generator sizing is frozen. This correction changes no measured performance claim; FlowCell still has no measured rotor power/torque curve.

A follow-on control-envelope screen makes that obligation quantitative without selecting a controller. Under the same simplified 4.5 m/s, TSR=4 assumptions, a pure aerodynamic-deload interpretation would have to lower effective `Cp` from 0.36 to about **0.106** to support only 1.2 kW electrical export at `eta=0.88`; if `Cp` instead remained 0.36, about **3.27 kW** of captured mechanical power is left unexplained by the capped-export model. The model/CSV/sizing note now expose `operating_cp_under_export_cap`, fixed-Cp excess mechanical power, and pure-deload shaft torque so generator-load deload, brake/dump, and failed-brake/runaway strategies can be assayed explicitly. These remain screening outputs, not measured performance.

## Screening-model input-domain regression — 2026-10-04 late pulse

The canonical FC-1 screening model now refuses physically invalid numeric inputs instead
of allowing them to become plausible-looking loads. Negative/nonfinite speed, nonpositive
density or diameter, invalid efficiency, negative/nonfinite `Cp`, `Ct`, or TSR, and
invalid tidal integration sample counts are explicit errors.

A regression check re-evaluates every row of the current 17-row power-curve CSV against
the model for electrical power, thrust, aerodynamic-equivalent shaft torque,
export-equivalent torque, and `Cp` setpoint under the export cap, within the CSV's declared
rounding. The current curve remains internally consistent after the guard repair.

This is a model-quality receipt only. It neither validates the hydrodynamic assumptions
nor promotes any simulated load to measured turbine performance.

The 2026-10-05 maintenance pass also refuses electrical conversion efficiencies above 1,
which previously could create physically impossible but numerically plausible power/load outputs.
The control-envelope quantity formerly labeled `cp_required_for_export_cap` is now presented as
`operating_cp_under_export_cap`: below rated it remains the baseline screening `Cp`; only above
rated does it represent the pure-aerodynamic-deload setpoint needed not to exceed the export cap.
The legacy function name remains an alias for compatibility, but the canonical CSV/test/documentation
use the non-misleading name. The screening API also refuses `Cp > 1` as an impossible captured-power
fraction, checks that the export-cap operating `Cp` remains in `[0, CP]`, preserves the exact zero-output
case when a sinusoidal tide never reaches cut-in, and refuses invalid integration sample counts. The
current regression suite also checks the fixed-`Cp` screening power balance
`captured = export/eta + excess` across every canonical power-curve row and verifies that the pure-deload
torque reconstructs the required export-supporting shaft power at the modeled speed. A fresh post-write
materialization of the canonical Library bytes passes all **11 FC-1 screening tests**. These are internal
model-conservation checks, not validation of the assumed `Cp`, `Ct`, TSR, or controller physics.

## Above-rated control evidence and strict-input maintenance — 2026-10-05

The screening API now rejects Boolean and numeric-string coercion for physical inputs rather than
letting language-level truth values or parseable text become speed, density, geometry, efficiency,
`Cp`, `Ct`, or TSR. This is a research-instrument boundary, not a hydrodynamic result.

After canonical overwrite/rematerialization, the exact current Library model/test bytes pass
**12/12 FC-1 screening regressions** and compile cleanly. This supersedes the earlier 11-test
receipt without changing the empirical status of any rotor/control claim.

The next above-rated control assay is also more discriminating. The 2025 OSTEC open-source tidal
converter power-take-off commissioning report distinguishes ordinary startup/shutdown, fast
shutdown, and a true emergency shutdown in which an internal generator magnetic holding brake is
engaged and may damage the machine. That is useful comparator evidence that emergency stopping
should not be collapsed into normal braking. A 2026 semi-physical tidal-current-turbine study of
individual blade-pitch control likewise provides a method precedent for separately reproducing
power and load responses under active control. Neither external result validates FC-1 geometry,
loads, controller authority, or braking hardware.

Accordingly, the FC-1 control/load-envelope assay must report at least three distinct stop/control
states: normal controlled deload/shutdown, fast protective shutdown, and emergency/runaway arrest.
For each state it must account for rotor speed, shaft torque, electrical/DC-bus load, brake/dump
path, thermal burden, and whether the mechanism is intended to be repeatable or sacrificial. An
internal holding brake or dump path may be a last-resort comparator; it is not silently assumed to
be a normal operating controller.

## Highest-information next actions

1. Resolve **source ownership** first: bind `FlowCell → owning source carrier → ownership evidence` from current authoritative agency/source records. Do not infer the owner from the Bare Cedar Fog snapshot or from the historical `emsenn/561-group` staging PR.
2. Reconcile the staged institutional source with current agency law before receiving it: six duties / six works / six skills, not the stale four-duty PR description.
3. Keep source merge, agency enactment, runtime/deployment, scientific truth, and independent acceptance as separate receipts.
4. Define and assay the above-rated rotor/controller load envelope before freezing shaft/generator sizing; do not infer shaft torque from capped exported power.
5. Advance the first physical article through the existing job-card and inspection-target carriers; do not infer physical performance from generated geometry.
6. Use real measured FlowCell data to assay Lenticule theories against conventional baselines once physical instrumentation exists.
7. Do not create another FlowCell charter/current summary unless this carrier is intentionally superseded and the successor is linked here.

## Guardrails

- Generated CAD is not a fabricated article.
- A fabricated article is not a qualified turbine.
- A green structural validator is not scientific truth or institutional enactment.
- A simulated power curve is not a measured power curve.
- A current-energy product need not use experimental storage chemistry.
- FlowCell is a test pressure on Lenticule science, not a demonstration of it.


## Power-curve dataset integrity maintenance — 2026-10-05

The FC-1 screening regression layer now checks the canonical CSV as a dataset as well as against
the model equations: row indices must be contiguous, water-speed samples must be unique and
strictly increasing, every numeric output must be finite and nonnegative, electrical outputs may
not exceed the declared `P_RATED`, and the exported operating-`Cp` column must remain within the
model's declared `[0, CP]` interval. These guards catch duplicate/reordered/drifted curve rows and
physically impossible serialized values even when a row-level model comparison might otherwise be
misread.

After canonical overwrite/rematerialization, the exact current Library model/curve/test bytes pass
**14/14 FC-1 screening regressions** and compile cleanly. This supersedes 12/12. It remains an
internal model/dataset integrity receipt only; it does not validate `Cp`, `Ct`, TSR, controller
authority, rotor loads, or physical turbine performance.

## Serialized-curve full-column closure — 2026-10-05

The FC-1 power-curve regression now checks every model-derived serialized column that the current CSV
claims: freshwater and seawater electrical power, freshwater and seawater thrust, freshwater shaft
torque, export-equivalent torque, operating `Cp`, target RPM, fixed-`Cp` excess mechanical power, and
the deloaded shaft torque required by the export cap. The explicit `target_rpm_at_TSR4` header is also
bound by regression to `TSR == 4.0`; changing the model TSR therefore forces a dataset/header
regeneration rather than silently leaving a stale semantic label. This is a serialization/replay
integrity result only, not empirical validation of `Cp`, `Ct`, TSR, control authority, loads, or
physical turbine performance. After canonical overwrite and exact-byte rematerialization, the maintained
FlowCell screening suite passes **15/15 regressions** and compiles cleanly.


## Regime-independent parameter validation + turbulent-site extrapolation boundary — 2026-10-05

The FC-1 screening model now validates density/geometry and other physical inputs before low-speed
cut-in short-circuit returns. Invalid density or geometry therefore cannot be hidden merely because the
modeled turbine would export zero power below cut-in. A regression preserves this fail-closed boundary.

Site extrapolation is also narrowed. HYD-011 now requires evidence intended for turbulent-site
performance/control/load claims to characterize inflow unsteadiness at minimum by mean speed,
turbulence intensity, and a temporal or spectral fluctuation descriptor. Steady-flow `Cp` or controller
results cannot be generalized to turbulent-site fatigue, shaft/generator load, or power-quality behavior
without representative turbulent-flow evidence. Han & Banerjee (2025), DOI `10.1103/mg6l-ch54`, and
Ortega Malca et al. (2026), DOI `10.1016/j.oceaneng.2025.123272`, are method/comparator evidence for
that boundary, not FC-1 validation.

On exact current bytes after canonical write/readback, FlowCell passes **17/17 regressions** and its
maintained Python tree compiles cleanly. This remains model/instrument evidence only; no physical `Cp`,
`Ct`, load, controller-authority, fatigue, or turbine-performance claim is promoted.


## Tidal-average numerical oracle and scale-transfer boundary — 2026-10-05

The idealized sinusoidal-tide average now has an exact closed-form reference for the same
cut-in, cubic capture and rated-power-cap law used by the screening model. The sampled
quadrature is retained as an implementation path, but it must agree with the analytic oracle
within a declared tolerance; under-resolved grids fail closed instead of publishing a
sampling artifact. This repairs especially severe errors near cut-in and around long capped
portions of the cycle. It is numerical model verification, not a site AEP or physical
turbine-performance result.

HYD-012 now bounds model/flume-to-FC-1 transfer: any promoted performance/load result must
record test-section blockage ratio and relevant Reynolds-number range, then justify a
blockage/scale correction or retain an explicit uncertainty bracket. Laboratory blockage
correction (`10.36688/imej.8.101-108`) and 2026 Reynolds-scaling work
(`10.3390/jmse14100893`) are method comparators only, not FC-1 validation.

After canonical write/readback and exact-byte rerun, the maintained FlowCell suite passes
**21/21 regressions** and compiles cleanly. No measured Cp, Ct, load, AEP, controller-authority
or full-scale-performance claim is promoted.

## Zero-speed parameter closure and wave-current fatigue transfer — 2026-10-05

Three torque-facing screening interfaces previously returned zero at zero rotor speed before validating
water density. That made invalid density values data-dependent: the same malformed physical parameter
could fail under motion yet pass silently at the null operating point. `rotor_shaft_torque`,
`export_equivalent_torque`, and `deloaded_shaft_torque_for_export_cap` now validate density before the
zero-speed short circuit, with regression coverage across zero/negative/nonfinite/Boolean/text inputs.

HYD-013 now separates steady-current performance evidence from combined wave-current fatigue/peak-load
transfer. Xu et al. (2026), DOI `10.1007/s40722-026-00511-3`, experimentally report strong dependence
of damage-equivalent loading on wave condition and submergence and higher loads in their twin-turbine
configuration; a separate 2026 Energy paper (DOI `10.1016/j.energy.2026.141232`) provides an independent
current wave-current/fatigue anchor. FC-1 claims involving shallow, near-surface, floating, or
array-relevant deployment must therefore preserve wave climate, submergence, and combined-load evidence.
Steady-current results alone do not license wave-current fatigue or peak-load claims.

After canonical write/readback and exact-byte execution, the maintained FlowCell suite passes
**23/23 regressions** and its Python tree compiles. This remains screening-model and evidence-contract
verification, not measured FC-1 performance, fatigue life, Cp, Ct, loads, or controller authority.

## Flood/ebb misalignment + support-shadow transfer boundary — 2026-10-05

HYD-014 now bounds bidirectional/reversing-flow extrapolation. Flood/ebb performance and load claims
must preserve actual flow-direction misalignment and support/foundation shadowing for the installed
geometry; aligned free-stream Cp/Ct cannot be generalized across a reversed half-cycle when the rotor
operates in a support wake or under materially different yaw. Verification now calls for directional
site statistics plus reversed/yawed flume or CFD cases and blade/thrust fluctuation analysis.

Townley et al. (2026), DOI `10.1016/j.oceaneng.2026.125873`, report that tidal-turbine foundation
shadowing produces periodic thrust fluctuations and lower mean power coefficient, with effects that
interact with yaw/misalignment. This is the scientific basis for the transfer boundary, not validation
of FC-1 or its support geometry.

Final fresh-execution receipt: after canonical writeback, exact-byte rematerialization and rerun,
FlowCell passes **24/24 regressions** and its maintained Python tree compiles cleanly. This remains
model/instrument evidence only; no physical Cp, Ct, load, fatigue, AEP, controller-authority, or
performance claim is promoted.