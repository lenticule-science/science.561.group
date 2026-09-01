---
name: "universe level"
aliases:
  - "universe level"
  - "universe levels"
  - "Set"
date-created: 2026-03-01T00:00:00
keywords:
  - Agda
---

In Agda, types are organized into a hierarchy of universes to avoid paradoxes. The base universe is `Set` (also written `Set₀`), which contains ordinary types like `Nat`, `Bool`, and `List Nat`. The type `Set` itself belongs to `Set₁`, which belongs to `Set₂`, and so on:

```
Nat : Set
Set : Set₁
Set₁ : Set₂
...
```

This stratification prevents Russell's paradox: no universe contains itself.

Agda supports **universe polymorphism** — definitions can be parameterized over a universe level variable `ℓ`, allowing them to work at any level:

```agda
id : {A : Set ℓ} → A → A
id x = x
```

This polymorphism avoids duplicating definitions for each universe level. The standard library uses universe polymorphism throughout.

## Related terms

- pattern matching — works at all universe levels
- standard library — uses universe-polymorphic definitions
