---
title: directed research cell
generated-by: modal-research-setting
generates: cokleisli-research-category
status: derived
session: 2026-06-23
description: "A directed research cell is the elementary act of DRR:"
---


A **directed research cell** is the elementary act of DRR:

```text
r : X -> C Y
```

`X` is the situated input: experience, evidence, question, instrument-reading, or
resource state. `Y` is the claim-form. `C Y` is that claim-form under the modal
closure that will make stabilization meaningful.

## Definition

In a [modal research setting](modal-research-setting.md),
a directed research cell from `X` to `Y` is a morphism in `E`:

```text
r : X -> C Y
```

The cell is directed because its domain and codomain are not interchangeable.
It moves from an unsettled source toward a closable claim.

## Lemma: a research cell is a typed proof term

A directed research cell is not metadata about a research event. It is the term
inhabiting the type "from `X`, produce `Y` under closure `C`."

## Proof

By Curry-Howard directionality, an arrow `X -> C Y` is simultaneously a program
from input to closed claim, a proof of the implication from evidence-context to
claim-closure, and a morphism in the research category. By Yoneda, the cell is
known by its arrows: what it admits from `X`, what it targets in `C Y`, and how
it composes with later cells.
