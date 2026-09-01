#!/usr/bin/env python3
"""
void.py — grow and measure a directional preordered monoid

Usage:
  python void.py grow a b c --bypass a>b b>c
  python void.py grow a b c --bypass a>b b>c --grades 12
  python void.py grow a b c --bypass a>b b>c --tower 3
  python void.py grow a b c --bypass a>b b>c --fibonacci
  python void.py grow a b c --bypass a>b b>c --spectrum
  python void.py grow a b c --bypass a>b b>c --tower 2 --spectrum

Bypass syntax:  a>b  means a bypasses b
"""

import argparse, sys, time, math
sys.path.insert(0, '.')
from pewpew import (
    void, grade, all_histories, grade_stats,
    doubly_settled, possible_settled, necessary_settled,
    bypass_closure, maximal_endpoints, make_dpm,
)
from itertools import product as iproduct
from math import comb

# ---------------------------------------------------------------------------
# Sequence recognition

_KNOWN = {}

def _load_known(n_max=16):
    phi = (1 + 5**0.5) / 2
    rho = 1.3247179572447460259
    fib = [0, 1]
    while len(fib) <= n_max + 2:
        fib.append(fib[-1] + fib[-2])
    pad = [1, 1, 1]
    while len(pad) <= 3 * n_max + 4:
        pad.append(pad[-2] + pad[-3])
    tri = [n*(n+1)//2 for n in range(n_max + 2)]
    return {"Fibonacci": fib, "Padovan-grade": [pad[3*n+2] for n in range(n_max+1)],
            "Triangular": tri, "2^n": [2**n for n in range(n_max+1)],
            "3^n": [3**n for n in range(n_max+1)], "n+1": list(range(1, n_max+2))}

def recognize(seq, known):
    hits = []
    for name, ref in known.items():
        length = min(len(seq), len(ref))
        if length >= 3 and seq[:length] == ref[:length]:
            hits.append(name)
    return hits or ["(unknown)"]

# ---------------------------------------------------------------------------
# Fibonacci basin analysis

def fibonacci_basin(generators, bypasses, n):
    """
    For each Determined endpoint d at grade n, compute |exclusive basin of d|.
    Returns: list of (d, basin_size), sorted by OccurrenceCount of first partnered gen.
    """
    histories  = all_histories(n, generators)
    det        = [h for h in histories if doubly_settled(h, generators, bypasses)]

    # Build exclusive basin: histories whose *only* Determined endpoint is d
    result = []
    for d in det:
        basin = 0
        for h in histories:
            endpoints = {e for e in bypass_closure(h, bypasses)
                         if doubly_settled(e, generators, bypasses)}
            if endpoints == {d}:
                basin += 1
        result.append((d, basin))
    return result

def diagonal_sums(rows):
    """rows[k] = basin sizes at grade k (list of ints, one per DS endpoint)."""
    n_max = len(rows) - 1
    diags = []
    for n in range(n_max + 1):
        s = sum(rows[n-k][k] for k in range(n//2 + 1)
                if n-k >= 0 and k < len(rows[n-k]))
        diags.append(s)
    return diags

# ---------------------------------------------------------------------------
# Tower

def induced_bypass(d1, d2, base_byp):
    if d1 == d2:
        return False
    return any(base_byp(g1, g2) for g1 in d1 for g2 in d2)

def tower_step(generators, bypasses, seed_grade=2):
    det = [h for h in all_histories(seed_grade, generators)
           if doubly_settled(h, generators, bypasses)]
    if not det:
        return None, None
    new_byp = lambda d1, d2: induced_bypass(d1, d2, bypasses)
    return det, new_byp

def gen_label(g):
    if isinstance(g, str): return g
    return "".join(gen_label(x) for x in g)

# ---------------------------------------------------------------------------
# Main

def parse_bypass(specs):
    pairs = set()
    for s in specs:
        if ">" not in s:
            print(f"  error: bypass spec '{s}' must be 'X>Y'", file=sys.stderr)
            sys.exit(1)
        a, b = s.split(">", 1)
        pairs.add((a.strip(), b.strip()))
    return lambda a, b: (a, b) in pairs

def run_grow(generators, bypasses, max_grade, time_limit, known):
    print(f"\nGenerators ({len(generators)}): {generators}")
    bp = [(a,b) for a in generators for b in generators if bypasses(a,b)]
    print(f"Bypass pairs ({len(bp)}): {bp}")
    print()
    print(f"  {'n':>3}  {'total':>8}  {'PS':>7}  {'NS':>7}  {'DS':>5}"
          f"  {'S':>7}  {'T':>7}  {'F':>8}  {'NC':>6}  {'max':>4}")

    seqs = {k: [] for k in ("total","ps","ns","ds","s","t","f","nc")}
    rows = []
    for n in range(max_grade + 1):
        t0 = time.time()
        total, ps, ns, ds, nc, mx = grade_stats(n, generators, bypasses)
        dt = time.time() - t0
        s, t_pos, f = ps-ds, ns-ds, total-ps-ns+ds
        print(f"  {n:>3}  {total:>8}  {ps:>7}  {ns:>7}  {ds:>5}"
              f"  {s:>7}  {t_pos:>7}  {f:>8}  {nc:>6}  {mx:>4}  ({dt:.2f}s)")
        for k, v in zip(seqs, (total,ps,ns,ds,s,t_pos,f,nc)): seqs[k].append(v)
        rows.append((n, total, ps, ns, ds, nc, s, t_pos, f))
        if dt > time_limit:
            print("  (time limit reached)")
            break

    print()
    print("Sequence recognition:")
    for name, seq in seqs.items():
        hits = recognize(seq, known)
        print(f"  {name:>8}: {hits}")
    return rows

def run_spectrum(rows):
    print("\nEigenvalue spectrum (growth ratios at late n):")
    print(f"  {'pos':>8}  {'ratio n-1->n':>14}  {'-> eigenvalue':>14}  {'-> beta':>10}")
    cols = [("total",1),("ps",2),("ns",3),("ds",4),("s",6),("t",7),("f",8)]
    for name, col in cols:
        vals = [r[col] for r in rows if r[col] > 0]
        if len(vals) < 4: continue
        ratios = [vals[i]/vals[i-1] for i in range(1,len(vals))]
        late = ratios[-min(3,len(ratios)):]
        ev = sum(late)/len(late)
        beta = math.log(ev) if ev > 1 else 0.0
        print(f"  {name:>8}  {late[-1]:>14.5f}  {ev:>14.5f}  {beta:>10.5f}")

    print()
    print("  Known constants:")
    rho = 1.3247179572447460259
    phi = (1+5**0.5)/2
    for name, val in [("rho (plastic)", rho), ("rho^2", rho**2), ("rho^3=rho+1", rho**3),
                      ("phi (golden)", phi), ("sqrt(2)", 2**0.5),
                      ("2", 2.0), ("3", 3.0)]:
        print(f"    {name:>16} = {val:.5f}  (beta = {math.log(val):.5f})")

def run_fibonacci(generators, bypasses, max_grade, known):
    print("\nFibonacci basin analysis:")
    print(f"  (basin size of each Determined endpoint)")
    basin_rows = []
    for n in range(min(max_grade+1, 9)):
        basins = fibonacci_basin(generators, bypasses, n)
        sizes  = [sz for _, sz in basins]
        basin_rows.append(sizes)
        labels = ["".join(gen_label(g) for g in d) for d, _ in basins]
        print(f"  n={n}: {list(zip(labels, sizes))}")
    print()
    print("  Diagonal sums:")
    diags = diagonal_sums(basin_rows)
    print(f"  {diags}")
    fib = [0,1,1,2,3,5,8,13,21,34,55,89,144,233]
    shifted = fib[1:len(diags)+1]
    match = all(d==f for d,f in zip(diags, shifted))
    print(f"  Fibonacci F(n+1): {shifted[:len(diags)]}")
    print(f"  Match: {match}")

def run_tower(generators, bypasses, levels, max_grade, time_limit, known, do_spectrum):
    print(f"\nTower iteration ({levels} levels, seed_grade=2):")
    G, byp = generators, bypasses
    for lvl in range(levels + 1):
        labels = [gen_label(g) for g in G]
        bp = [(gen_label(a), gen_label(b)) for a in G for b in G if byp(a,b)]
        print(f"\n{'='*50}")
        print(f"Level {lvl}: {len(G)} generators, {len(bp)} bypass pairs")
        print(f"  gens:   {labels[:8]}{'...' if len(labels)>8 else ''}")
        print(f"  bypass: {bp[:8]}{'...' if len(bp)>8 else ''}")
        rows = run_grow(G, byp, max_grade, time_limit, known)
        if do_spectrum:
            run_spectrum(rows)
        if lvl < levels:
            G_new, byp_new = tower_step(G, byp)
            if G_new is None:
                print("\nTower terminates (no Determined histories at seed_grade).")
                break
            G, byp = G_new, byp_new

# ---------------------------------------------------------------------------

def main():
    p = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("command", choices=["grow"])
    p.add_argument("generators", nargs="+")
    p.add_argument("--bypass", nargs="+", default=[], metavar="X>Y",
                   help="bypass pairs, e.g. a>b b>c")
    p.add_argument("--grades", type=int, default=9, metavar="N",
                   help="compute up to grade N (default 9)")
    p.add_argument("--time",   type=float, default=4.0, metavar="SEC",
                   help="stop a grade if it takes longer than SEC seconds (default 4)")
    p.add_argument("--tower",  type=int, default=0, metavar="LEVELS",
                   help="iterate the tower LEVELS times")
    p.add_argument("--fibonacci", action="store_true",
                   help="run Fibonacci basin analysis")
    p.add_argument("--spectrum", action="store_true",
                   help="print eigenvalue spectrum")
    args = p.parse_args()

    generators = args.generators
    bypasses   = parse_bypass(args.bypass)
    known      = _load_known(args.grades + 2)

    if args.tower > 0:
        run_tower(generators, bypasses, args.tower, args.grades, args.time,
                  known, args.spectrum)
    else:
        rows = run_grow(generators, bypasses, args.grades, args.time, known)
        if args.spectrum:
            run_spectrum(rows)
        if args.fibonacci:
            run_fibonacci(generators, bypasses, args.grades, known)

if __name__ == "__main__":
    main()
