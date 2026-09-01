# Void monoid

Directional Preordered Monoid (DPM) experiments. The free monoid over
generators G under bypass dynamics is a failure simulator: histories
are relational acts, bypass normalization is the physics, non-confluence
is failure.

## Toys

- [`void.py`](void.py) — CLI for growing and measuring DPMs.
  `python void.py grow a b c --bypass a>b b>c [--grades 12] [--tower N]`
- [`universe.py`](universe.py) — Void failure physics engine. The free
  monoid over G under BypassStep dynamics, instrumented for failure
  observation.
- [`grow_dpm.py`](grow_dpm.py) — Animate the growth of the DPM. Layout
  is the bypass DAG with y = max-depth-to-settlement (PS at bottom,
  unsettled at top). Saves `grow_dpm.gif` plus PNG frames for ffmpeg.
- [`living_dpm.py`](living_dpm.py) — The DPM as a living process. Each
  grade's histories start tense (bypass pressure); bypasses fire in
  interleaved rounds; the whole grade settles together.
- [`manifold_dpm.py`](manifold_dpm.py) — 3D spatiotemporal manifold of
  the DPM. Grade *n* → ring of 3^n histories at height *z = n·Z_SCALE*;
  bypass edges become chords within each ring.
- [`tower.py`](tower.py) — The tower operator. At each level, take
  Determined histories at seed_grade as the next generators; induced
  bypass preserves grade. Φ(G, ⊳) = (Determined(FreeMonoid(G, ⊳),
  seed_grade), ⊳_induced).
- [`zeta.py`](zeta.py) — Generating-function poles as phase transitions
  in beta-space (z = e^-β). Old drafts predicted β_c = ln(φ) ≈ 0.481
  (Fibonacci pole assuming F=empty); empirically F ≠ empty, PS follows
  Padovan, the actual pole is at ln(ρ) ≈ 0.281.
- [`pewpew.py`](pewpew.py) — Skeleton of the void grade structure:
  void = (), grade(h) = len(h), step(g) = g+1. Notes that void is
  unreachable from non-void via bypass (bypass preserves grade) and
  incomparable in bypass order with anything of different grade.
- [`void_tower.py`](void_tower.py) — Earlier tower implementation,
  marked by the author with a warning that it was written during a
  period of conceptual drift and probably implements bad math.
  Verify against `organizing-infinite-voidmath.md` and
  `organizing-finite-voidmath.md` before trusting.
