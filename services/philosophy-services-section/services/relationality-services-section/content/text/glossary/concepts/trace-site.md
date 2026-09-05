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
---

## Concrete example first

Suppose you study three observation contexts:

- `t0`: a rough event log,
- `t1`: a cleaned log,
- `t2`: a cleaned log plus annotations.

You can move from rough to cleaned, and from cleaned to annotated. Those moves are [morphisms](../../../../../../../information-science-services-section/services/math-services-section/services/categorical-services-section/services/ordinary-categories-services-section/content/text/glossary/terms/morphism.md) between traces. Now pick which families of moves count as enough information to reconstruct a trace. For example, you may say that two complementary cleaned views together cover `t2`.

That pair — the category of traces and the coverage rule — is the trace site.

## Formal definition

A **trace site** is a pair $(T,J)$ where:

- $T$ is a small category whose objects are traces and whose [morphisms](../../../../../../../information-science-services-section/services/math-services-section/services/categorical-services-section/services/ordinary-categories-services-section/content/text/glossary/terms/morphism.md) are refinement or transport maps, and
- $J$ is a Grothendieck topology on $T$, specifying which sieves (or covering families) count as covers.

In GFRTU, the trace site is primitive data. It determines locality, gluing, and the ambient sheaf topos $\mathbf{Sh}(T,J)$.

## Why it matters in GFRTU

- It tells you what "local" means.
- It determines when local recognition data can glue.
- It anchors every later construction: fibers, sheaf semantics, fixed layer, and generative closure.
