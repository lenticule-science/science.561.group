---
description: "The Jacobian of a vector-valued function of several variables is the matrix of all its first-order partial derivatives, one row per output coordinate and one column per input coordinate. Its determinant, where defined, measures the local factor by which the function scales area, volume, or higher-dimensional content near a point — the exact rate at which the map stretches or compresses space there."
defines: jacobian
related: [matrix, determinant, linear-map, manifold]
date-created: 2026-08-21
type: term

---

For a function `f : ℝⁿ → ℝᵐ`, the Jacobian `J` at a point is the `m × n`
[matrix](./matrix.md) whose `(i,j)` entry is `∂fᵢ/∂xⱼ`, the rate of change
of the `i`-th output with respect to the `j`-th input, all evaluated at that
point. It is the best linear approximation of `f` near that point — the
[linear map](./linear-map.md) that `f` looks like under a microscope
there — which is why the Jacobian is the direct multivariable generalization
of a single-variable derivative: for `n = m = 1`, the Jacobian is just the
ordinary derivative, a 1×1 matrix.

When `n = m`, the Jacobian is square and its [determinant](./determinant.md)
is defined: this Jacobian determinant is the local area/volume scaling
factor of `f`, positive if `f` preserves orientation near that point and
negative if it reverses it, and exactly zero where the map locally
collapses dimension (fails to be locally invertible). This is precisely
what makes change-of-variables integration work — an integral transformed
into new coordinates picks up a factor of the absolute value of the
Jacobian determinant to correct for how those coordinates locally stretch
or compress space — and what the inverse function theorem needs to
guarantee a local inverse exists (a non-zero Jacobian determinant at a
point is sufficient). The same determinant is exactly what must be
non-zero, chart to chart, for the transition maps of a differentiable
[manifold](./manifold.md) to define a consistent, non-degenerate structure
across their overlaps.
