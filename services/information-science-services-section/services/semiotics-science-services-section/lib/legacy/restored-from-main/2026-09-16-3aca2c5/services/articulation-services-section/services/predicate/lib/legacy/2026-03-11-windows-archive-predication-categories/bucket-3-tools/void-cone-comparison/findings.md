# Cross-instance void-cone comparison: findings

Verifies the [value-agnostic-void-cone theorem](../../theorems/value-agnostic-void-cone.md) empirically.
Tests whether bilattice / stochastic / Lawvere quantale / Boolean Lorentzian void-cones on the same graph agree on the cohomologically-relevant quantities.

Run: `python3 compare.py --graph all --verbose`.

## Result

**Headline claim verified.** Across 5 graphs (default 4-vertex, disconnected, diamond, cycle, linear chain), all four value-category instances agree on:

- $V_\infty$ (cells permanently void)
- The set of fired cells (cells that left the void at any step)
- $|V_\infty|$ and total firing count

This is exactly what the value-agnostic theorem predicts: the *cohomologically-relevant* data (cell-counts, identities) is value-category-independent.

| Graph | $|V_\infty|$ | Total firings | Agreement |
|---|---|---|---|
| default | 8 | 1 | ✓ |
| disconnected | 16 | 1 | ✓ |
| diamond | 7 | 1 | ✓ |
| cycle | 0 | 3 | ✓ |
| linear chain (5 verts) | 10 | 6 | ✓ |

## Side observation: firing schedules can differ

The firing *cells* agree across all four instances, but the firing *schedule* — which step each firing happens at — can differ.
Most pronounced on the linear chain:

| Step | Bilattice firings | Stochastic firings | Lawvere firings |
|---|---|---|---|
| 1 | $\{(0,2), (1,3), (2,4)\}$ | $\{(0,2), (1,3), (2,4)\}$ | $\{(0,2), (1,3), (2,4)\}$ |
| 2 | $\{(0,3), (0,4), (1,4)\}$ | $\{(0,3), (1,4)\}$ | $\{(0,3), (0,4), (1,4)\}$ |
| 3 | — | $\{(0,4)\}$ | — |

Stochastic settles in 3 steps; bilattice and Lawvere in 2.
The reason is operational: the stochastic implementation uses *matrix-style* concatenation $T(v)(s, o) = \max_z P(s, z) \cdot v(z, o)$ (composition through direct neighbors only), while bilattice and Lawvere use *transitive-closure* concatenation $T(v)(s, o) = \max_z v(s, z) \cdot v(z, o)$ (composition through any intermediate where content has accumulated).

These are two different closure operators — both legitimate in their respective value categories, but with different convergence speeds.
The theorem's claim of agreement is on the *eventual* data ($V_\infty$, fired cells), which is invariant under schedule differences.
Cohomologically, $H^1 \cong \bigoplus_{\text{firings}} \mathbb{Z}$ has the same rank either way; the firing-ordinal index is just relabeled.

## What this means for the theorem

The value-agnostic theorem is *eventual-cohomology-invariant*: it claims agreement on the cohomological invariants, not on the closure-operator dynamics in detail.
The schedule difference is consistent with this — it's a refinement of the theorem statement that's outside its scope.

A potential strengthening: if one chose all four closure operators to use transitive-closure-style concatenation (the bilattice convention), schedules would also agree.
The theorem doesn't currently require this; the looser "support-respecting" hypothesis allows the matrix-multiplication semantics for stochastic.

## Reproduction

```
cd tools/void-cone-comparison
python3 compare.py --graph all --verbose
```

Add a graph: edit `GRAPHS` in `compare.py` with `(n_vertices, edge_list)`.
