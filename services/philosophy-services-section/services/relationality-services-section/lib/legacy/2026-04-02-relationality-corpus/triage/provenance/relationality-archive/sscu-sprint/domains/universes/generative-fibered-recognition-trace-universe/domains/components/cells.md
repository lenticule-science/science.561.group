---

name: cells
  - "Cells"
  - "cells"
date-created: 2025-12-26
introduces: concept
tags: []
---

## Concrete example first

If the full trace site has traces $\{t_0,t_1,t_2\}$, you might focus on $\{t_0,t_1\}$ because those are the traces relevant to one subsystem. Keep all [morphisms](../../../categories/ordinary-categories/terms/morphism.md) between them and inherit the same cover notion. Sheaves on that restricted site form a local universe for that subsystem.

## Formal definition

A **cell** is the local universe obtained from a full subcategory $U\subseteq T$ with induced topology $J|_U$. Its ambient category is
$\mathbf{Sh}(U,J|_U)$, and it relates to the global universe $\mathbf{Sh}(T,J)$ through restriction/inclusion geometric behavior.

Cells are generated localizations, not separate primitive universes.

## Why it matters in GFRTU

- It supports local analysis without abandoning global semantics.
- It provides a way to compare neighborhoods of traces.
- It explains how global behavior can be studied by local sub-sites.
