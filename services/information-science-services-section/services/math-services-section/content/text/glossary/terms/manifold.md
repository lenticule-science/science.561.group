---
description: "A manifold is a topological space that is locally homeomorphic to Euclidean space, built by gluing together patches (charts) via transition maps that agree on their overlaps. A differentiable manifold requires those transition maps to be smooth, which is what makes calculus — derivatives, integration, the Jacobian of a transition map — meaningful on a space that need not be flat or even globally coordinatizable."
defines: manifold
related: [topological-space, homeomorphism, sheaf, jacobian]
date-created: 2026-08-21
type: term

---

A manifold is defined locally and assembled globally. Around every point
there is an open neighborhood (a chart) that looks exactly like an open
subset of ℝⁿ for some fixed dimension `n` — a
[homeomorphism](./homeomorphism.md) between the neighborhood and Euclidean
space — but the manifold as a whole need not look like ℝⁿ anywhere, and
frequently cannot even be given one global coordinate system without
singularities (a sphere is the standard example: any single flat map of it
tears or distorts somewhere). Where two charts overlap, the composite map
from one chart's coordinates to the other's — the transition map — is
required to be continuous; for a *differentiable* manifold it is required
to be smooth, so that a function differentiable in one chart's coordinates
is automatically differentiable, by the same value, in any overlapping
chart's coordinates.

The [Jacobian](./jacobian.md) of a transition map is exactly what makes this
consistency checkable and quantifiable: its determinant measures how area
or volume scales between the two charts' coordinate systems at a point, and
requiring it to be non-zero (and of consistent sign, for an orientable
manifold) is what keeps the differentiable structure well defined across
the overlap. This is the same gluing discipline that appears, more
generally, as the [sheaf](./sheaf.md) condition: local data — here, a chart
and its coordinate functions — that agree on overlaps determine one
consistent global object, and a manifold is the special case of this
gluing discipline where the local data being glued is Euclidean coordinate
structure itself.
