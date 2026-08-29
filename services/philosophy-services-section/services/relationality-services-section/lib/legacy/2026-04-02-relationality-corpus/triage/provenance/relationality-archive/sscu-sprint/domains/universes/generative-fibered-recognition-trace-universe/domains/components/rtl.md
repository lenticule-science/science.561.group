---

name: rtl
  - "Recognition Term language (RTL)"
  - "recognition term language (rtl)"
date-created: 2025-12-26
introduces: concept
tags: []
---

## Concrete example first

If $p$ and $q$ are recognition variables, RTL can build terms like $p\wedge q$, $p\vee q$, and $p\Rightarrow q$. In GFRTU, these are not just symbols: each term gets interpreted as an internal arrow in the sheaf topos.

## Formal definition

The **Recognition Term Language (RTL)** is a typed formal language for recognition expressions whose semantics is interpreted in $R=\mathbf{Sh}(T,J)$.

Its interpretation maps well-formed terms and judgments to internal objects and [morphisms](../../../categories/ordinary-categories/terms/morphism.md), with naturality and sheaf-compatibility constraints inherited from the topos semantics.

## Why it matters in GFRTU

- It provides a precise syntax for stating recognition claims.
- It links symbolic expressions to sheaf-theoretic semantics.
- It determines part of what generative closure must include.
