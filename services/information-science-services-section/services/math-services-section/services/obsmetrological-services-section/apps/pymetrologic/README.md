# PyMetroLogic

A computational frontier-mathematics lab.
It realizes the 561-group predication theory as runnable Python and uses it to do work that the cellular sheaf package [PySheaf](https://github.com/kb1dds/pysheaf) does, and more.

The bet: a cellular sheaf is the degenerate, metric, poset-only shadow of a bilattice-valued predication sheaf.
Realize the general object and the special case falls out, while genuinely new structure, such as truth/knowledge-aware fibers, localized conflict, and settling dynamics, comes for free.

## Package

- **PyMetroLogic** is one Python distribution, imported as `pymetrologic`.
  `pymetrologic.*` is the Python implementation of the Lean `RelMath` library: bilattice fibers, predicate-category sites, predication sheaves, settling dynamics, causal/topological bridges, algebraic witnesses, and the executable shadows recorded in `docs/THEORY.md`.

Notebook-only experiments, including converted `exploring-the-wilderness` material, live in `notebooks/` until a Lean theorem, definition, frontier lemma, or ledgered corpus result earns them a place in `pymetrologic`.

## What "meet-or-beat PySheaf" means here

| | PySheaf | this lab |
|---|---|---|
| base | cell complex (poset) | predicate category / site (poset is the degenerate case) |
| fiber | metric set | bilattice fiber (truth and knowledge orders) |
| consistency | one scalar radius | per-cell, per-index conflict map + scalar |
| solving | optimization / nearest section | settling to a knowledge-join fixed point |
| inconsistency | hidden in the scalar | localized as Belnap "both" |

## Develop

```sh
uv sync --all-extras
uv run pytest
uv run ruff check . && uv run mypy
make lab       # ICK manifold serving this Python lab root
make lab-probe # prove the live ICK Jupyter handshake
make dag-coverage
make dag-query MODULE=RelMath.Mark
```

Notebooks are stored as paired `py:percent` files with Jupytext; generated `.ipynb` files are git-ignored unless a notebook intentionally needs to be checked in as an artifact.

`make lab` serves this directory through the Information Coherence Kernel.
This site does not own a separate Jupyter server: the demo is **ICK as Python lab**.
Notebook-shaped work enters through ICK's Jupyter-conformant surface at `/api/*`, while organizing's notebook carriers and actions remain the upstream math for the projection.
The local browser surface is `http://127.0.0.1:18809/`; the same service answers `/api`, `/api/kernelspecs`, `/api/kernels`, `/api/sessions`, and `/api/contents`.

`make lab-probe` is the client-side sanity check for that claim.
It creates and reads an ICK notebook session through `/api/*`; it does not launch JupyterLab or any sidecar process.

## The theory this realizes

Sourced from the 561-group corpus and the Lean `RelMath` library.
See `docs/THEORY.md` for the theorem-to-module ledger, and use `tools/dag_coverage.py` to compare Lean DAG coverage against PyMetroLogic's implementation DAG.
