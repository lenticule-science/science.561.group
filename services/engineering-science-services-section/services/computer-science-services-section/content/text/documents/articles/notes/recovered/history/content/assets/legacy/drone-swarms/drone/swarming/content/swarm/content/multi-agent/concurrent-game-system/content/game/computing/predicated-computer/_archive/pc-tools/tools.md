# tools/

Scripts for validation, dependency audit, monograph build, and per-construction computation.

Each tool lives in its own subdirectory with its own data; one-off computations and their inputs/outputs go here, not in `/tmp/`.

The corpus is early; this directory is empty pending the toolkit. Anticipated tools:

- `validator/` — frontmatter and link validation; orphan detection; topological-order check.
- `dep-audit/` — cross-reference audit across the corpus.
- `compose/` — monograph build pipeline.

When a tool is added, document it here.
