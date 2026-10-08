---
name: scale-factor-calibration
kind: object
description: "The map from the cosmic-scott-skeleton's abstract letter-weights (w_a, w_b) to physical scale-factor e-folds — what turns the duality-gap's form |w_a-w_b|/2 into a number. The weight asymmetry is sourced internally by the big-bang-restriction (the deleted Tribonacci letter makes the surviving Fibonacci weights unequal), not by a foreign cosmology input. The exact weights and their e-fold normalization are worked in big-bang-restriction and e-fold-normalization."
member-of: weighted-tropical-reading
kind-of: calibration-map
status: hacking
title: scale-factor-calibration
---

**scale-factor-calibration** is the map from the abstract weights $w_a, w_b$ of the [`cosmic-scott-skeleton`](cosmic-scott-skeleton.md) to the physical scale-factor e-fold history.
Fixing it turns the [`duality-gap`](duality-gap.md)'s form $|w_a-w_b|/2$ into a number.

## The asymmetry is sourced internally

The weight asymmetry $w_a \neq w_b$ comes from the [`big-bang-restriction`](big-bang-restriction.md): the cosmic descent is the canonical **n-bonacci tower**, its rungs linked by delete-last-letter restrictions, and the Big Bang is the $3\to2$ (Tribonacci ↠ Fibonacci) instance.
The deleted Tribonacci letter is what makes the surviving Fibonacci weights unequal — so the asymmetry is internal to the restriction, not a foreign cosmology input.

## Worked downstream

- the **weights** themselves: [`big-bang-restriction`](big-bang-restriction.md) (the surviving-letter data of the $3\to2$ restriction).
- the **e-fold normalization** (the value-category map frequency → log that gives the exact tension): [`e-fold-normalization`](e-fold-normalization.md), where $f_a/f_b = L^2/(L+1)$ and the predicted ratio is 1.0916.
