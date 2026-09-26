---
title: "Trace Site"
aliases:
  - "Trace Site"
  - "trace site"
id: gfrtu-trace-site
authors:
- gpt-5.2-codex
date-created: 2025-12-26
type: concept
tags: []
description: "Suppose you study three observation contexts:"
teaches:
  - "Trace Site and Fibers"
---

## Concrete example first

Model a small monitoring system with two contexts:

- `raw`: raw events,
- `clean`: normalized events.

A [morphism](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/morphism.md) `raw -> clean` represents normalization. Now decide coverage: maybe each trace is covered by its identity only, or maybe multiple partial views cover `clean`. Next attach local recognition logics $H_{raw}$ and $H_{clean}$, each a finite [Heyting algebra](../../../../../concepts/heyting-algebra/index.md), with a reindexing map along `raw -> clean`.

This already gives the core local setup for GFRTU.

## Formal lesson content

A GFRTU begins with:

1. a **trace site** $(T,J)$: small category $T$ plus Grothendieck topology $J$,
2. a **fibered recognition system**: finite [Heyting algebras](../../../../../concepts/heyting-algebra/index.md) $H_t$ and structure-preserving reindexing maps $H(f):H_{t'}\to H_t$.

The site defines locality and gluing; the fibers define local logic.

## How to build this in practice

1. List traces you can represent.
2. Define [morphisms](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/morphism.md) that encode refinement or transport.
3. Declare covering families for each trace.
4. Assign a finite [Heyting](../../../../../../general/people/arend-heyting.md) algebra to each trace.
5. Define reindexing maps that preserve order and [Heyting](../../../../../../general/people/arend-heyting.md) operations.

## Common mistakes

- Using traces with no explicit [morphisms](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/morphism.md).
- Treating "cover" informally instead of as topology data.
- Choosing reindexing maps that break functoriality or logical structure.

Suppose you study three observation contexts:

- `t0`: a rough event log,
- `t1`: a cleaned log,
- `t2`: a cleaned log plus annotations.

You can move from rough to cleaned, and from cleaned to annotated. Those moves are [morphisms](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/morphism.md) between traces. Now pick which families of moves count as enough information to reconstruct a trace. For example, you may say that two complementary cleaned views together cover `t2`.

That pair — the category of traces and the coverage rule — is the trace site.

## Formal definition

A **trace site** is a pair $(T,J)$ where:

- $T$ is a small category whose objects are traces and whose [morphisms](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/morphism.md) are refinement or transport maps, and
- $J$ is a Grothendieck topology on $T$, specifying which sieves (or covering families) count as covers.

In GFRTU, the trace site is primitive data. It determines locality, gluing, and the ambient sheaf topos $\mathbf{Sh}(T,J)$.

## Why it matters in GFRTU

- It tells you what "local" means.
- It determines when local recognition data can glue.
- It anchors every later construction: fibers, sheaf semantics, fixed layer, and generative closure.
