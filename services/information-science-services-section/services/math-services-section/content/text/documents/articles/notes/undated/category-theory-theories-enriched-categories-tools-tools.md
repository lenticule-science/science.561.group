---
title: enriched-categories tools
description: Computational modules for the enriched-categories chapter.
---
# enriched-categories tools

Computational modules for the enriched-categories chapter. Each module is self-contained Python that computes a piece of enriched-categorical mathematics.

## Modules

- `enriched_categories/examples/lawvere_laplacian_h1_graphs.py` — fixed points of the unsigned-weighted-meet Lawvere-Laplacian $L^1$ on constant V-sheaves over connected graphs, for various commutative unital quantales V (Boolean, Łukasiewicz, Lawvere). Establishes that $|\mathrm{Fix}(L^1)| = |V|$ uniformly across V's and across connected graphs regardless of first Betti number — a feature of the unsigned-meet operator on undirected 1-complexes (signed-orientation-dependent content is not captured).

## Conventions

Each module:

- Is self-contained — no imports from sister chapters' toolkits.
- Includes its tests as pytest-discoverable functions; the file may be run with `python -X utf8 -m pytest path/to/module.py -v -s`.
- Documents what it computes and what it does not at the top of the file.
