"""Lawvere-quantale settling: shortest-path closure on a finite weighted graph.

Setup:
- Value category V = ([0, infinity], +, min) — Lawvere quantale of distances.
- Cells are pairs (s, o) for s, o in vertex set.
- v_0(s, o) = direct edge weight, or infinity if no edge.
- Closure step: T(v)(s, o) = min(v(s, o), min_z [v(s, z) + v(z, o)]) (Bellman-Ford relaxation).

The settling v_kappa is the all-pairs shortest-path matrix.

Empirical questions:
1. What is the closure ordinal kappa? (Strict-c regime claim: kappa <= n-1.)
2. How does V-monotonicity manifest? (Each iteration weakly decreases all entries.)
3. What is the firing pattern? (Which cells acquire content at which iteration?)
4. Does the Bellman-Ford bound match exactly, or is convergence often faster?
"""

import math
from itertools import product

INF = math.inf


def make_graph_from_edges(n, edges):
    """edges: list of (s, o, w). Returns v_0 as dict (s, o) -> weight."""
    v = {}
    for s in range(n):
        for o in range(n):
            v[(s, o)] = 0.0 if s == o else INF
    for s, o, w in edges:
        v[(s, o)] = min(v[(s, o)], w)
    return v


def closure_step(v, n):
    """One Bellman-Ford-flavored relaxation. Returns new v and list of cells that changed."""
    new_v = dict(v)
    changes = []
    for s, o in product(range(n), repeat=2):
        best = v[(s, o)]
        for z in range(n):
            cand = v[(s, z)] + v[(z, o)]
            if cand < best:
                best = cand
        if best < v[(s, o)]:
            changes.append((s, o, v[(s, o)], best))
            new_v[(s, o)] = best
    return new_v, changes


def settle(v, n, max_iter=100):
    """Iterate to fixed point. Returns (final_v, history) where history records changes per step."""
    history = []
    cur = v
    for k in range(max_iter):
        nxt, changes = closure_step(cur, n)
        history.append(changes)
        if not changes:
            return nxt, history, k
        cur = nxt
    raise RuntimeError(f"Did not converge in {max_iter} steps")


def fmt_v(v, n):
    rows = []
    for s in range(n):
        row = []
        for o in range(n):
            x = v[(s, o)]
            row.append("inf" if x == INF else f"{x:>4g}")
        rows.append("  ".join(row))
    return "\n".join(rows)


def report(name, n, edges, expected_bound=None):
    print(f"=== {name} ===")
    v0 = make_graph_from_edges(n, edges)
    print(f"v_0 ({n}x{n}):")
    print(fmt_v(v0, n))
    final, history, kappa = settle(v0, n)
    print(f"\nClosure ordinal kappa = {kappa}")
    if expected_bound is not None:
        print(f"Bellman-Ford bound is {expected_bound}; observed {kappa}; "
              f"{'matches' if kappa == expected_bound else 'tighter than bound'}")
    print(f"\nFinal v_kappa (all-pairs shortest paths):")
    print(fmt_v(final, n))
    print(f"\nFiring pattern: {[len(c) for c in history if c]} (changes per stage)")
    print(f"Total firings: {sum(len(c) for c in history)}")
    print()


if __name__ == "__main__":
    # Case 1: Path graph 0 -> 1 -> 2 -> 3, weights 1.
    # Bellman-Ford bound n-1 = 3. Should converge in 2 (since longest path is 3 edges,
    # but log2(3) suffices for repeated-squaring; B-F per-step gives 2).
    report(
        "Path graph P_4",
        4,
        [(0, 1, 1.0), (1, 2, 1.0), (2, 3, 1.0)],
        expected_bound=3,
    )

    # Case 2: Cycle C_4 with unit edges (directed forward only).
    report(
        "Directed cycle C_4 (forward only)",
        4,
        [(0, 1, 1), (1, 2, 1), (2, 3, 1), (3, 0, 1)],
        expected_bound=3,
    )

    # Case 3: Complete graph K_4 with random-ish weights.
    report(
        "K_4 with mixed weights",
        4,
        [(0, 1, 4), (0, 2, 1), (0, 3, 7),
         (1, 0, 4), (1, 2, 2), (1, 3, 5),
         (2, 0, 1), (2, 1, 2), (2, 3, 3),
         (3, 0, 7), (3, 1, 5), (3, 2, 3)],
        expected_bound=3,
    )

    # Case 4: A "tricky" graph designed to force more iterations:
    # 0 -> 1 -> 2 -> 3 -> 4 -> 5, plus a long-shortcut 0 -> 5 with weight 100.
    # Only iterations along the path can find the better route 5.
    report(
        "Long path P_6 with bad shortcut",
        6,
        [(0, 1, 1), (1, 2, 1), (2, 3, 1), (3, 4, 1), (4, 5, 1), (0, 5, 100)],
        expected_bound=5,
    )

    # Case 5: Disconnected components — two K_2's, no path between them.
    # Final v will have inf entries between components — closure ordinal = 0.
    report(
        "Two disconnected K_2",
        4,
        [(0, 1, 2), (1, 0, 2), (2, 3, 5), (3, 2, 5)],
        expected_bound=3,
    )
