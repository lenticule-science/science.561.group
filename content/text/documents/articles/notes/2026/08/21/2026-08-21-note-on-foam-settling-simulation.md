---
title: "Foam-Settling Simulation Results"
description: "Real measured output from the pymetrologic foam module: the reference von Neumann-Mullins law reproduces cleanly by construction and its Aboav-Weaire/T1 statistics look like real foam; the bilattice-settling variant only partially reproduces (n-6), reproduces Aboav-Weaire weakly and inconsistently, and fails outright on T1 avalanche statistics — reported honestly, including where the port breaks."
date-created: 2026-08-21
type: notes
name: 2026-08-21-note-on-foam-settling-simulation
authors:
  - claude-fable-5
  - Claude Opus
status: draft-for-owner-review
keywords: ["foam", "bubbles", "von-neumann", "settling", "obsmetrologia", "pymetrologic", "simulation"]
tags: ["draft"]
---

# Foam-Settling Simulation Results

The [founding claims note](2026-08-21-note-on-what-the-foam-knows.md) named
its own falsifier for Claim 1 (the von Neumann settling law ported to
belief-communities) as "the pymetrologic foam-settling simulation (running at
time of writing)." This note reports what that simulation actually measured.
**Short answer: mixed, and reported honestly as mixed.** The reference law
reproduces its own tests trivially and its two derived statistics (Aboav-Weaire,
T1 avalanches) look like real foam. The settling variant — area flowing through
bilattice-charged boundaries rather than through each cell's own side-count —
only *partially* reproduces (n−6), reproduces Aboav-Weaire weakly and
inconsistently, and does not reproduce T1 avalanche statistics at all. That
last failure is the most important result in this note.

## What was built

`pymetrologic.foam` (new module, additive, nothing existing touched) implements:

* a 2D cellular foam as a **triangulated cell-adjacency graph** on a periodic
  torus — cells are vertices, shared boundaries are edges, and because every
  physical foam vertex is 3-valent (Plateau's law; see the founding note's
  Claim 2), the graph's faces are always triangles. That single invariant is
  what makes a **T1 event** a well-defined combinatorial diagonal flip (an edge
  borders exactly two triangles; the flip swaps the diagonal) and a **T2
  event** the removal of a 3-sided cell (whose three neighbors already form a
  triangle, so no re-triangulation is needed).
* the **reference dynamics**: `dA_i/dt = k(n_i − 6)`, exact by construction,
  with T1 events triggered by a geometric edge-length proxy `√(A/n)`.
* the **SETTLING variant**: every boundary posits evidence about itself (`pro`
  = "stable," `con` = "curvature tension," from each side's own `n`), the
  corpus's own proven knowledge join `∨_k` (`Bilattice.join_k` — the identical
  operation `pymetrologic.fusion.BeliefBoard.settle` runs per claim, applied
  here per boundary) fuses the two posits, and area flows edge-by-edge in
  proportion to the fused boundary's `conflict_degree`, directed toward the
  more-sided cell — not from each cell's own `n` at all. T1 events fire where
  settled conflict crosses a threshold, not from geometry.
* measurement: `von_neumann_law_fit` (linear fit of mean `dA/dt` per `n`),
  `aboav_weaire_fit` (`m(n) = A + B/n` fit of mean-neighbor-`n` per `n`), and
  `t1_avalanche_sizes` (events-per-step histogram).

26 tests in `test_foam.py` pass (`pytest`), plus the full existing 900+-test
suite (`ruff check`, `ruff format --check`, `mypy --strict` all clean, run
after adding this module). A one-row addition to `docs/THEORY.md` ledgers
`pymetrologic.foam` against the same proven join-monoid fact `fusion.py`
already cites — additive, no existing ledger text changed.

## The run

Both variants started from the same disordered foam: a 16×16 (256-cell)
triangular-lattice torus (every cell exactly 6-sided, `Σ(n_i−6) = 0` exactly —
the torus's Euler-characteristic invariant) scrambled by 384 random valid T1
flips (`scramble_topology`, seed `20260821`), then run for 140 Euler steps.

Initial (scrambled, shared) side-count distribution:
`{3: 76, 4: 26, 5: 25, 6: 28, 7: 21, 8: 30, 9: 18, 10: 15, 11: 5, 12: 4, 13: 3, 14: 5}`,
mean `n` = 6.0000 exactly (theory: exactly 6 for any torus triangulation).

### Reference (von Neumann-Mullins)

```
cells: 256 -> 64        T1 events: 63        T2 events: 192
handshake_ok: True      euler_defect: 0
total area: 256.000 -> 258.026  (+0.8%)

von Neumann fit:  slope=0.0200  intercept=-0.1200  r2=1.0000  root=6.0000
  (k was set to 0.02 — the fit recovers it exactly, as it must: this is the
  law the code literally computes, not an emergent measurement)

Aboav-Weaire fit: A=4.7049  B=9.7192  r2=0.9949
  by_n: {3: 7.95, 4: 7.08, 5: 6.62, 6: 6.33, 7: 6.18, 8: 5.97, 9: 5.83,
         10: 5.69, 11: 5.58, 14: 5.29}

T1 avalanche sizes: n=40 steps-with-events, min=1 max=4 mean=1.57
  histogram: {1: 23, 2: 12, 3: 4, 4: 1}
```

The Aboav-Weaire fit is close to what real dry foams show (`B` in the
literature's rough 5–8 range for equilibrium foams; here `B ≈ 9.7`, the right
sign and order of magnitude) with `r2 = 0.995` — a clean law. T1 events arrive
in small numbers per step (never more than 4 in this run), the expected
picture of a foam relaxing through a steady trickle of individual boundary
collapses.

### Settling (bilattice boundary charges)

```
cells: 256 -> 29        T1 events: 420       T2 events: 227
handshake_ok: True      euler_defect: 0
total area: 256.000 -> 441.774  (+72.6%)

von Neumann fit:  slope=0.1330  intercept=-0.7316  r2=0.9756  root=5.5018
  by_n: {3: -0.18, 4: -0.146, 5: -0.098, 6: -0.066, 7: 0.014, 8: 0.21,
         9: 0.477, 10: 0.692, 11: 0.852, 12: 0.942, 13: 1.048, 14: 1.133,
         15: 1.21, 16: 1.355, 18: 1.66}

Aboav-Weaire fit: A=5.9495  B=3.6946  r2=0.5531
  by_n: {3: 7.55, 4: 6.51, 5: 6.56, 6: 6.55, 7: 6.34, 8: 6.22, 9: 6.22,
         10: 6.48, 11: 6.82, 12: 6.08, 13: 6.33}

T1 avalanche sizes: n=16 steps-with-events, min=1 max=95 mean=26.25
  histogram: {1: 3, 2: 1, 5: 1, 6: 1, 13: 1, 14: 1, 15: 1, 23: 1, 30: 1,
              32: 1, 35: 1, 61: 1, 86: 1, 95: 1}
```

### Robustness across three more seeds (seeds 1, 2, 3; same 16×16/384-flip setup)

| | reference `r2` | reference root | settling `r2` | settling root | settling AW-`B` | settling AW-`r2` | settling max avalanche |
|---|---|---|---|---|---|---|---|
| seed 1 | 1.0000 | 6.000 | 0.961 | 5.52 | 3.39 | **0.077** | 103 |
| seed 2 | 1.0000 | 6.000 | 0.957 | 4.90 | 4.15 | 0.541 | 101 |
| seed 3 | 1.0000 | 6.000 | 0.939 | 5.57 | 5.97 | 0.808 | 88 |

Reference `r2`/root are exactly 1.0/6.000 on every seed (they must be — this
is the law the code computes). Settling's von Neumann `r2` is consistently
decent (0.94–0.98) but its root wanders (4.90–5.57, not always close to 6),
its Aboav-Weaire `r2` is wildly seed-dependent (0.08 to 0.81 — on seed 1 it is
statistical noise, not a law), and every seed's largest T1 avalanche is in the
80s–100s, versus the reference's single-digit maxima on every seed checked
(4, 9, 6 across the three earlier reference-only runs).

## Verdict, question by question

**Does the settling variant reproduce `dA/dt = k(n−6)`? Partially.** The sign
and rough magnitude are right, and `r2` on binned means is consistently
0.94–0.98 — high enough to look like a law at a glance. But the `by_n` table
shows a real kink: roughly flat/slightly negative from `n=3` to `n=6`, a jump
at `n=7→8`, then a shallower climb through the teens — not the single straight
line the exact theorem requires, and the fitted root wanders seed-to-seed
instead of landing on exactly 6. **This is an approximate, not exact,
reproduction**, and the deviation is systematic (the same kink shape recurs
across seeds), not just noise around the true line.

**Does it reproduce Aboav-Weaire neighbor anticorrelation? Weakly and
inconsistently.** `B` is positive on every run (the right *qualitative*
direction — many-sided cells do preferentially border few-sided ones even
under settling dynamics), but the fit quality swings from strong (`r2=0.81`)
to noise (`r2=0.08`) across seeds, against the reference's consistent
`r2 = 0.88`–`0.99`. The settling variant carries the correct sign of the
correlation but not a reliable law.

**Does it reproduce T1-event statistics? No.** This is the cleanest failure.
The reference variant's T1s arrive in small numbers (never more than 4–9 per
step, across every seed checked) — a foam relaxing continuously. The settling
variant produces occasional enormous synchronized bursts (85–103 events in a
single step) alongside otherwise-quiet steps. The likely mechanism: the
settling trigger fires on a *global* threshold (settled conflict crossing
`conflict_min`), so once the `n`-distribution drifts to where many boundaries
sit near that threshold simultaneously, they all cross it in the same discrete
step — a synchronization artifact of a shared scalar threshold, not the
foam-like continuous relaxation the geometric-length trigger produces. **The
settling variant does NOT reproduce T1 avalanche statistics**, and this
divergence is large and consistent, not marginal.

A supporting observation in the same direction: total foam area grew 0.8% in
the reference run versus 72.6% in the settling run over the same 140 steps
(both variants share an identical area floor/clamp mechanism, so this
difference is not clamp bookkeeping — it reflects the settling variant's edge
flux being considerably more aggressive and less locally self-correcting than
the reference law).

## Caveats, honestly

* This is a **topological network model**, not a full vertex/Surface-Evolver
  geometric simulation — cell positions are never tracked, only side-counts
  and areas, with edge length estimated as `√(A/n)`. That is a standard
  simplification for this class of model (Marder 1987; Fortes & Rosa 1993)
  but it is a simplification, named as one in the module docstring.
* The settling variant's posit rule (`pro`/`con` from `|n−6|`) and its T1
  trigger threshold are this module's own design choices, not derived from
  first principles or from a Lean theorem — see `foam.py`'s module docstring
  for exactly what is reused (the proven `∨_k` join and `conflict_degree`)
  versus what is product surface (everything else). A different posit rule
  or threshold might reproduce the reference statistics more cleanly; this
  run reports what the most direct, honestly-motivated design actually does,
  not a best-case tuned result.
* Four seeds is enough to show the *pattern* (settling's Aboav-Weaire and T1
  statistics diverge from the reference's) but not enough to characterize the
  settling variant's own statistics precisely (e.g. a real power-law fit for
  avalanche sizes, which this note declines to attempt — see `t1_avalanche_sizes`'s
  own docstring on why events-per-step is the honest analogue available here,
  not an inter-arrival power law).

## Reproducing this

```sh
cd lib/emsenn/services/561-group/services/science-services-section/services/information-science-services-section/services/math-services-section/services/obsmetrological-services-section/apps/pymetrologic
uv run pytest packages/pymetrologic/tests/test_foam.py -q   # 26 tests
uv run python -c "
import random
from pymetrologic.foam import (triangular_torus, scramble_topology,
    run_von_neumann, run_settling, von_neumann_law_fit, aboav_weaire_fit,
    t1_avalanche_sizes)
f0 = scramble_topology(triangular_torus(16, 16), flips=384, rng=random.Random(20260821))
ref = run_von_neumann(f0, steps=140, k=0.02, ell_min=0.30, area_min=0.05)
settle = run_settling(f0, steps=140, k=0.12, conflict_min=0.45, area_min=0.05)
print(von_neumann_law_fit(ref.rate_samples))
print(von_neumann_law_fit(settle.rate_samples))
"
```
