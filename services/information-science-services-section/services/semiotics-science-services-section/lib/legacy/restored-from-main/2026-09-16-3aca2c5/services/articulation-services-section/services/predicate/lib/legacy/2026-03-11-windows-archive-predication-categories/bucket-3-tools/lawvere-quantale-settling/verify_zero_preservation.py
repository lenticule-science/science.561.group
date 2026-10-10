"""Verify: in each value category, the closure operator preserves the
'closure-trivial element' at cells whose support-neighbors are all trivial.

This is the structural condition required for a value-category-agnostic
void-cone theorem.

Three value categories tested:
  Bilattice FOUR with closure 'transitive Boolean'
  Stochastic [0,1] with closure 'Markov step'
  Lawvere quantale [0, inf] with closure 'shortest-path'
"""

import math

INF = math.inf


# === Bilattice case ===
# Values: BOT, T, F, TOP. Closure: standard transitive closure on cells
# valued in {BOT, T} — fires (s, o) when there's a chain.

BOT, T, F, TOP = "BOT", "T", "F", "TOP"

def k_meet(a, b):
    """Minimal info between a and b in <=_k ordering. Bot=min, top=max."""
    if a == BOT or b == BOT: return BOT
    if a == TOP: return b
    if b == TOP: return a
    if a == b: return a
    return BOT  # T and F are incomparable

def k_join(a, b):
    """Max-info join in <=_k."""
    if a == BOT: return b
    if b == BOT: return a
    if a == TOP or b == TOP: return TOP
    if a == b: return a
    return TOP  # T join F = TOP

def closure_bilattice(v, n):
    """Transitive closure step: T(v)(s,o) = v(s,o) join (join_z v(s,z) meet v(z,o)).
    For Boolean-flavored closure, treat T as 'true', BOT as 'unset'."""
    new_v = dict(v)
    for s in range(n):
        for o in range(n):
            best = v[(s, o)]
            for z in range(n):
                cand = k_meet(v[(s, z)], v[(z, o)])
                best = k_join(best, cand)
            new_v[(s, o)] = best
    return new_v


def test_bilattice_zero_preservation():
    """If v is BOT everywhere, T(v) is BOT everywhere."""
    n = 4
    v = {(s, o): BOT for s in range(n) for o in range(n)}
    Tv = closure_bilattice(v, n)
    all_bot = all(Tv[(s, o)] == BOT for s in range(n) for o in range(n))
    print(f"Bilattice: all-BOT initial -> all-BOT after closure: {all_bot}")

    """If only cell (0,0) is T and the rest are BOT, then no other cell becomes T
    (because (0,0) alone can't form a chain to (s, o) with s != 0)."""
    v[(0, 0)] = T
    Tv = closure_bilattice(v, n)
    only_00_or_initial = all(
        Tv[(s, o)] == BOT or (s == 0 and o == 0)
        for s in range(n) for o in range(n)
    )
    print(f"Bilattice: single-T at (0,0) -> only (0,0) (and self-chains) become T: {only_00_or_initial}")
    # Actually self-chains: (0,0) join (0,0) meet (0,0) = T — preserved at (0,0).
    print(f"  (0,0) value after: {Tv[(0,0)]}")


# === Stochastic case ===
# Values: [0,1]. Closure: T(v)(s,o) = sum_z v(s,z) * P(z,o).

def closure_stochastic(v, P, n):
    new_v = {}
    for s in range(n):
        for o in range(n):
            new_v[(s, o)] = sum(v[(s, z)] * P[z][o] for z in range(n))
    return new_v


def test_stochastic_zero_preservation():
    n = 3
    P = [[0.5, 0.5, 0], [0, 0.5, 0.5], [0, 0, 1]]
    v = {(s, o): 0.0 for s in range(n) for o in range(n)}
    Tv = closure_stochastic(v, P, n)
    all_zero = all(Tv[(s, o)] == 0.0 for s in range(n) for o in range(n))
    print(f"Stochastic: all-zero initial -> all-zero after closure: {all_zero}")

    # If v is non-zero only at (0, 0), check what propagates.
    v[(0, 0)] = 1.0
    Tv = closure_stochastic(v, P, n)
    nonzero = {(s, o): Tv[(s, o)] for s in range(n) for o in range(n) if Tv[(s, o)] > 0}
    print(f"Stochastic: nonzero only at (0,0), 1 step -> nonzero at: {sorted(nonzero.keys())}")
    print(f"  Values: {nonzero}")
    # Should be: (0,0) -> P(0,0) = 0.5; (0,1) -> P(0,1) = 0.5. Cells (s, o) with s != 0 stay 0.


# === Lawvere quantale case ===
# Values: [0, inf]. Closure-monotonic order: SMALLER distance = more knowledge.
# So the *closure-trivial element* is INF (no path).
# Closure: T(v)(s,o) = min(v(s,o), min_z v(s,z) + v(z,o)).

def closure_lawvere(v, n):
    new_v = dict(v)
    for s in range(n):
        for o in range(n):
            best = v[(s, o)]
            for z in range(n):
                cand = v[(s, z)] + v[(z, o)]
                if cand < best:
                    best = cand
            new_v[(s, o)] = best
    return new_v


def test_lawvere_inf_preservation():
    n = 3
    # All cells at inf (no edges) — except diagonal which is 0 (zero distance to self).
    v = {(s, o): (0.0 if s == o else INF) for s in range(n) for o in range(n)}
    Tv = closure_lawvere(v, n)
    # Off-diagonal should stay inf.
    off_diag_inf = all(Tv[(s, o)] == INF for s in range(n) for o in range(n) if s != o)
    print(f"Lawvere: off-diag-inf initial -> off-diag-inf after closure: {off_diag_inf}")

    # Add one edge 0 -> 1 with weight 5.
    v[(0, 1)] = 5.0
    Tv = closure_lawvere(v, n)
    # (0,1) should still be 5, (1,0) and (s,o) with s, o not both involving 0,1 stay inf.
    finite_after = {(s, o): Tv[(s, o)] for s in range(n) for o in range(n) if Tv[(s, o)] < INF and s != o}
    print(f"Lawvere: single edge (0,1)=5 -> finite off-diag cells: {finite_after}")


if __name__ == "__main__":
    print("--- Verifying closure-trivial element preservation ---\n")
    test_bilattice_zero_preservation()
    print()
    test_stochastic_zero_preservation()
    print()
    test_lawvere_inf_preservation()
