---

name: trace-site
  - "Trace Site and Fibers"
date-created: 2025-12-26
tags: []
teaches:
  - "Trace Site and Fibers"
---

## Concrete example first

Model a small monitoring system with two contexts:

- `raw`: raw events,
- `clean`: normalized events.

A [morphism](../../../categories/ordinary-categories/terms/morphism.md) `raw -> clean` represents normalization. Now decide coverage: maybe each trace is covered by its identity only, or maybe multiple partial views cover `clean`. Next attach local recognition logics $H_{raw}$ and $H_{clean}$, each a finite [Heyting algebra](../../../../teaching/explanations/heyting-algebra/index.md), with a reindexing map along `raw -> clean`.

This already gives the core local setup for GFRTU.

## Formal lesson content

A GFRTU begins with:

1. a **trace site** $(T,J)$: small category $T$ plus Grothendieck topology $J$,
2. a **fibered recognition system**: finite [Heyting algebras](../../../../teaching/explanations/heyting-algebra/index.md) $H_t$ and structure-preserving reindexing maps $H(f):H_{t'}\to H_t$.

The site defines locality and gluing; the fibers define local logic.

## How to build this in practice

1. List traces you can represent.
2. Define [morphisms](../../../categories/ordinary-categories/terms/morphism.md) that encode refinement or transport.
3. Declare covering families for each trace.
4. Assign a finite [Heyting](../../../../../../../../../library/references/people/arend-heyting.md) algebra to each trace.
5. Define reindexing maps that preserve order and [Heyting](../../../../../../../../../library/references/people/arend-heyting.md) operations.

## Common mistakes

- Using traces with no explicit [morphisms](../../../categories/ordinary-categories/terms/morphism.md).
- Treating "cover" informally instead of as topology data.
- Choosing reindexing maps that break functoriality or logical structure.
