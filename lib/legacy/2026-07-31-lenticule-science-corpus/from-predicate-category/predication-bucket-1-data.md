# Verification data

Static data files (JSON, CSV, etc.) referenced by per-note verification modules
in the `predication_categories` package. Each file should be the canonical
ground truth for some claim in the corpus markdown — see the per-note module
that imports it for the link to the markdown note.

## Files

- **`cosettling_benchmarks.json`** — 7 strict-regime closure-rule systems with
  their forward trajectories and cosettling enumerations. Used by
  `theorems/iterated_cosettling_counts_derivable_cells.py` to verify the
  closed-form `|T*^{-1}(w)| = 2^{|w| - |seed|}` and the closure-cover-hypergraph
  empirical table. Migrated from the legacy `tools/cosettling-enumerator/data.json`.
