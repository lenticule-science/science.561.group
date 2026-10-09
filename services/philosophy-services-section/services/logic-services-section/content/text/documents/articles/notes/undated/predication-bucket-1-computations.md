---
title: predicationcategories
description: Computational primitives + per-note verification modules for the predication-categories corpus.
---
# predication_categories

Computational primitives + per-note verification modules for the
predication-categories corpus. Phase 1 of the planned tooling
restructure.

## What this is

Three layers:

- **`primitives/`**: shared mathematical primitives (`Poset`, `OrderComplex`,
  `SimplicialComplex`, `CellularSheaf`, ...). Strictly typed, used by every
  per-note module. Add new primitives only when at least two per-note modules
  need them — premature abstraction is a known failure mode.

- **`examples/`** (and future `theorems/`, `objects/`): per-note Python modules
  mirroring the markdown structure. Each module corresponds to one markdown
  note in the corpus and contains the computational verifications of that
  note's claims. Functions are named `test_*` so pytest discovers them, and
  decorated with `@verifies(...)` / `@example_of(...)` / `@defines(...)` to
  register the link.

- **`link.py`**: the decorator + registry layer. Decorators register only;
  they do not execute or modify their target. Pytest discovery handles
  execution. `validate.py` checks metadata coherence (does the target
  markdown note exist? does the pass number match a section in the markdown?).

## Usage

Run all verifications as tests:

```
cd tools
pytest predication_categories/
```

Validate metadata coherence (do all `@verifies` targets exist in the corpus?):

```
cd tools
python -m predication_categories.validate
```

## Current scope

Primitives library (`primitives/`):

- `Poset`, `OrderComplex`, `SimplicialComplex`, `Simplex`, `ConstantSheaf` — finite simplicial complexes + Z-coefficient cohomology
- `PowersetFrame`, `FrameMorphism`, `FrameValuedSheaf` — frame-valued cellular sheaves with right-adjoint cosheaf side
- `DFrame`, `settling_dframe_at_clopen` — d-frames with con/tot validation
- `ClosureRuleSystem`, `Rule` — closure-rule systems with forward/cosettling enumeration
- `SubstitutionMatrix` + corpus instances (`FIBONACCI`, `THUE_MORSE`, `PADOVAN`, `TRIBONACCI`, `TETRANACCI`) — substitution dynamical systems with primitivity / Pisot / cohomological-rank computations

Per-note verification modules:

- `examples/`: per-fiber-d-frame-curry (6 passes), benchmark-1-fibonacci through benchmark-4-tetranacci, benchmark-5-epistemic-kripke + benchmark-6-crdt, benchmark-causal-triples-3-ary, benchmark-lorentzian-causal-set
- `theorems/`: iterated-cosettling-counts (with single-step-cosettling sub-theorem), four-regime-dichotomy, stochastic-stationary-as-settling, continuous-state-regime-classification, void-cone-associated-graded-direct, strong-mld-via-composed-duality

Tooling:

- `validate.py` — link metadata coherence (every `@verifies` target must exist; pass numbers must match markdown)
- `coverage.py` — % of corpus notes with computational verification, per kind

## Coverage

As of this writing: **42 registered links across 14 per-note modules + 3 primitives**, covering **20 / 389 corpus notes (5.1%)** — up from 0% before the migration. Run `python -m predication_categories.coverage` for current per-kind percentages.

The migration superseded and removed the following scattered tools — the per-note modules are now the sole source of computational verification:

- `tools/verify-zero-dim-curry/` → `examples/per_fiber_d_frame_curry_on_belnap_fiber.py`
- `tools/cosettling-enumerator/` → `theorems/iterated_cosettling_counts_derivable_cells.py` (data → `data/cosettling_benchmarks.json`)
- `tools/regime-classifier/`, `tools/anderson-putnam-cohomology/`, `tools/d-frame-cohomology/`, `tools/verdier-dual/`, `tools/run-benchmark/` → `theorems/four_regime_dichotomy.py` + `examples/benchmark_*_*.py`
- `tools/n-ary-settling/` → `examples/benchmark_causal_triples_3_ary.py`
- `tools/stochastic-settling/` → `theorems/stochastic_stationary_as_settling.py`
- `tools/lawvere-quantale-settling/`, `tools/continuous-V-step-n/` → `theorems/continuous_state_regime_classification.py`
- `tools/lorentzian-causal-set/` → `examples/benchmark_lorentzian_causal_set.py`
- `tools/void-cone-comparison/` → `theorems/void_cone_associated_graded_direct.py`
- `tools/strong-mld-orbits/` → `theorems/strong_mld_via_composed_duality.py`
- `tools/kripke-to-settling/`, `tools/crdt-to-settling/` → `examples/benchmark_5_epistemic_kripke.py`

Markdown references in the corpus were bulk-updated by `migrate_markdown_references.py` (one-shot; can be re-run safely — the regex no longer matches anything).

## Adding a new per-note module

1. Decide which markdown note it corresponds to (e.g. `examples/X.md` or
   `theorems/Y.md`).
2. Create the Python module at `predication_categories/examples/X.py`
   (or `predication_categories/theorems/Y.py` once that subpackage exists).
   Module name uses underscores; markdown slug uses dashes — that's expected.
3. Write functions named `test_*` and decorate them with the appropriate link:
   `@verifies("examples/X.md", pass_=N, claim="...")` for example passes,
   `@example_of("theorems/Y.md", instance="...")` for concrete theorem instances,
   `@defines("objects/Z.md")` for primitive class definitions.
4. The decorator only registers metadata — execution happens via pytest discovery.

## Adding a new primitive

Only add a primitive when at least two per-note modules will use it.
Otherwise inline the construction in the module that needs it. Premature
abstraction is the failure mode this package is trying to avoid in the
existing scattered `tools/` ecosystem.

## Non-goals

- Running `corpus build` (the existing `fars` toolkit handles this).
- Replacing existing scattered tools — those continue to work; this is a
  parallel infrastructure that future per-note modules can use.
- Substituting for proof verification — `link.verifies` doesn't make a
  sketch theorem proved; it just records that a computational instance
  has been checked.
