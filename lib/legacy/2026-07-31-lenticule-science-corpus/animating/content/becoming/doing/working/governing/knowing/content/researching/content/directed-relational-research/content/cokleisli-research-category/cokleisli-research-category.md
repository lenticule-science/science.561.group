---
title: coKleisli research category
generated-by: directed-research-cell
generates: certified-research-cell
status: derived
session: 2026-06-23
---


The **coKleisli research category** is the category whose arrows are directed
research cells.

## Definition

Given the closure `C`, define `Research(C)` with:

- objects: the objects of the ambient research setting;
- morphisms `X => Y`: maps `X -> C Y`;
- identities: the coKleisli identities induced by the counit/unit structure of
  the modal composite;
- composition: the modal pull-push composition inherited from `C`.

For cells

```text
r : X -> C Y
s : Y -> C Z
```

their research composite is the coKleisli composite:

```text
s o r : X -> C Z
```

## Proposition: research acts compose as research

The composite of two directed research cells is again a directed research cell.

## Proof

The first cell lands in `C Y`, not bare `Y`; the second cell expects `Y` and
lands in `C Z`. The coKleisli structure of `C` is exactly the machinery that
extends `s` across the closure produced by `r` and then flattens the result back
to `C Z`. Therefore the composite has type `X -> C Z`, so it is again a directed
research cell.

This proves that multi-step inquiry is not an informal sequence of notes. It is
composition in `Research(C)`.
