"""Lorentzian causal-set settling: sprinkled events in 1+1 Minkowski.

Setup:
- Sprinkle N events uniformly in a rectangular region [0, T] x [-X, X] of 1+1 Minkowski.
- Causal precedence: e_1 = (t_1, x_1) precedes e_2 = (t_2, x_2) iff
    t_2 - t_1 >= |x_2 - x_1|  (timelike-or-null future)
- Build the seed precedence relation, take transitive closure.
- Settling = full causal precedence relation.

Empirical questions:
1. Apex (causally-connected pairs): how many?
2. Void (spacelike pairs): how many?
3. Apex of void (V_inf, permanently-spacelike): how many? (For finite causal sets, V_inf = void.)
4. Closure ordinal kappa.
5. Comparison with continuum predictions (P. Myrheim-Meyer style).
"""

import random
import math
from itertools import product


def sprinkle(N, T, X, seed=None):
    """Sprinkle N events uniformly in [0, T] x [-X, X]."""
    if seed is not None:
        random.seed(seed)
    return [(random.uniform(0, T), random.uniform(-X, X)) for _ in range(N)]


def is_causal(e1, e2):
    """Is e1 in the causal past of e2 (timelike-or-null)?"""
    t1, x1 = e1
    t2, x2 = e2
    if t2 < t1:
        return False
    return (t2 - t1) >= abs(x2 - x1)


def all_causal_pairs(events):
    """Full causal relation: e1 precedes e2 iff e1 in past lightcone of e2."""
    n = len(events)
    return {(i, j) for i in range(n) for j in range(n) if i != j and is_causal(events[i], events[j])}


def seed_precedences(events):
    """Hasse-cover seed: elementary causal links only (no intermediate event).

    e1 -> e2 is a link iff e1 precedes e2 AND there is NO e3 with e1 < e3 < e2.
    The transitive closure of these links recovers the full causal relation.
    """
    full = all_causal_pairs(events)
    n = len(events)
    links = set()
    for (i, j) in full:
        # Check: is there any k with (i, k) and (k, j) in full?
        is_link = True
        for k in range(n):
            if k == i or k == j:
                continue
            if (i, k) in full and (k, j) in full:
                is_link = False
                break
        if is_link:
            links.add((i, j))
    return links


def transitive_closure_with_history(prec, n):
    """Iterate transitive closure, tracking each iteration's new firings."""
    cur = set(prec)
    history = [set(cur)]
    for k in range(50):
        new_pairs = set()
        for (i, j) in cur:
            for (jj, l) in cur:
                if jj == j and (i, l) not in cur and (i, l) not in new_pairs and i != l:
                    new_pairs.add((i, l))
        if not new_pairs:
            break
        cur |= new_pairs
        history.append(set(cur))
    return cur, history


def parallel_closure_step(prec, n):
    """One parallel matrix-square step: (i, l) gets added if there's any j with (i,j) and (j,l)."""
    new_prec = set(prec)
    fired = []
    for i in range(n):
        for l in range(n):
            if i == l or (i, l) in prec:
                continue
            for j in range(n):
                if (i, j) in prec and (j, l) in prec:
                    new_prec.add((i, l))
                    fired.append((i, l))
                    break
    return new_prec, fired


def settle_parallel(prec, n):
    cur = set(prec)
    history = [set(cur)]
    fire_log = [[]]
    for k in range(50):
        nxt, fired = parallel_closure_step(cur, n)
        history.append(set(nxt))
        fire_log.append(fired)
        if not fired:
            return nxt, history, fire_log, k
        cur = nxt
    raise RuntimeError("Did not converge")


def report(name, events, T, X):
    n = len(events)
    print(f"=== {name} ===")
    print(f"  Events: N = {n}, region [0, {T}] x [-{X}, {X}]")
    spacetime_volume = T * 2 * X
    density = n / spacetime_volume
    print(f"  Density: {density:.3f} events/unit-area")

    seed = seed_precedences(events)
    print(f"  Seed precedences (direct light-cone pairs): {len(seed)}")

    final, history, fire_log, kappa = settle_parallel(seed, n)
    print(f"  Closure ordinal kappa = {kappa}")
    print(f"  Apex (causal pairs): {len(final)} of {n*(n-1)} ordered pairs")
    print(f"  Apex / total: {len(final) / max(1, n*(n-1)):.3f}")

    # Spacelike pairs: pairs (i, j) with i != j and neither (i, j) nor (j, i) in apex.
    apex_undirected = set()
    for (i, j) in final:
        apex_undirected.add(frozenset([i, j]))
    n_pairs = n * (n - 1) // 2
    apex_und_count = len(apex_undirected)
    spacelike_count = n_pairs - apex_und_count
    print(f"  Unordered pairs total: {n_pairs}")
    print(f"  Causally-connected (timelike-or-null): {apex_und_count}")
    print(f"  Spacelike-separated: {spacelike_count}")
    print(f"  Spacelike fraction: {spacelike_count / max(1, n_pairs):.3f}")

    # Per-iteration firings
    print(f"  Firings per iteration:")
    for k, fired in enumerate(fire_log):
        if fired:
            print(f"    step {k}: {len(fired)} firings")

    # Dimension estimator (Myrheim-Meyer-flavored): use ratio of links to events.
    # For 1+1 Minkowski, theoretical: spacelike_fraction depends on aspect ratio of region.
    # For T = 2X, the lightcone-volume / total-volume ratio determines.
    print()
    return {
        "n": n,
        "apex_directed": len(final),
        "spacelike": spacelike_count,
        "kappa": kappa,
    }


if __name__ == "__main__":
    # Case 1: Diamond causal set (manually constructed minimal example).
    print("=== MANUAL: Diamond causal set ===")
    # Events at: a = (0, 0), b = (1, 1), c = (1, -1), d = (2, 0).
    # a precedes b, c (each is one timelike unit forward).
    # b, c precede d (each one timelike unit forward).
    events_diamond = [(0, 0), (1, 1), (1, -1), (2, 0)]
    report("Diamond (4 events)", events_diamond, T=2, X=1)

    # Case 2: Small sprinkling.
    random.seed(42)
    events1 = sprinkle(8, T=4, X=2)
    report("Sprinkled 1+1 Minkowski, N=8", events1, T=4, X=2)

    # Case 3: Larger sprinkling.
    random.seed(43)
    events2 = sprinkle(16, T=4, X=2)
    report("Sprinkled 1+1 Minkowski, N=16", events2, T=4, X=2)

    # Case 4: Wide region (more spacelike pairs).
    random.seed(44)
    events3 = sprinkle(16, T=2, X=4)
    report("Wide region (T=2, X=4), N=16", events3, T=2, X=4)

    # Case 5: Tall narrow region (more timelike pairs).
    random.seed(45)
    events4 = sprinkle(16, T=8, X=1)
    report("Tall region (T=8, X=1), N=16", events4, T=8, X=1)
