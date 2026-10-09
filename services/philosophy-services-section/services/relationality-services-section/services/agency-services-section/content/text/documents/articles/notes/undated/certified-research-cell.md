---
title: certified research cell
generated-by: cokleisli-research-category
generates: research-residual; research-invariant; research-witness-topos
status: derived
session: 2026-06-23
description: A certified research cell is a directed research cell that has stabilized under the closure it invokes.
---


A **certified research cell** is a directed research cell that has stabilized
under the closure it invokes.

## Definition

For `r : X -> C Y`, certification is the condition:

```text
C r ~= r
```

read in the coKleisli research category. Equivalently, `r` factors through a
stable `C`-coalgebra:

```text
gamma : Y -> C Y
```

where `gamma` satisfies the coalgebra laws.

## Theorem: idempotence is certification

For a directed research cell `r : X -> C Y`, the following are equivalent:

- `C r ~= r` in the coKleisli research category;
- `r` factors through a `C`-coalgebra on `Y`;
- composing `r` with any certified cell remains certified.

## Proof

If `C r ~= r`, applying the closure again adds no new research content. The image
of `r` is therefore stable enough to be read as carried by a coalgebra structure
on `Y`. Conversely, if `r` factors through a `C`-coalgebra, the coalgebra laws say
that reapplying `C` agrees with the existing stabilized structure, so `C r ~= r`.
Finally, coalgebras are closed under the coKleisli composition used by research
cells, so certified cells compose with certified cells and remain certified.

This is the core proof of DRR: certification is not a social stamp or a file
state. It is the internal fixed-point condition of the research arrow.
