# tower.py — iterate the tower construction from voidmath.md
#
# Each level: take Determined histories at seed_grade as the next generators.
# Induced bypass: d1 ⊳ d2  iff  d1 ≠ d2  and  ∃ g1 ∈ d1, g2 ∈ d2: Bypasses(g1, g2)
#   (d1=d2 excluded — self-swap produces the same history, goes nowhere)
#
# The tower operator:  Φ(G, ⊳)  =  (Determined(FreeMonoid(G, ⊳), seed_grade), ⊳_induced)

import sys, time
sys.path.insert(0, '.')
from pewpew import *

# ---------------------------------------------------------------------------

def induced_bypass(d1, d2, base_byp):
    if d1 == d2:
        return False
    return any(base_byp(g1, g2) for g1 in d1 for g2 in d2)

def tower_step(generators, bypasses, seed_grade=2):
    """Build (generators, bypasses) for the next tower level."""
    det = [h for h in all_histories(seed_grade, generators)
           if doubly_settled(h, generators, bypasses)]
    if not det:
        return None, None
    new_byp = lambda d1, d2: induced_bypass(d1, d2, bypasses)
    return det, new_byp

def gen_label(g):
    """Flatten a (possibly nested) tuple generator to a readable string."""
    if isinstance(g, str):
        return g
    return "".join(gen_label(x) for x in g)

def bypass_graph_summary(generators, bypasses):
    pairs = [(g1, g2) for g1 in generators for g2 in generators if bypasses(g1, g2)]
    partnered = [g for g in generators if any(bypasses(g, g2) for g2 in generators)]
    return len(pairs), len(partnered), len(generators)

# ---------------------------------------------------------------------------

G0   = ["a", "b", "c"]
byp0 = lambda a, b: (a, b) in {("a", "b"), ("b", "c")}

SEED_GRADE = 2
MAX_GRADE  = 8
MAX_TOTAL  = 80_000
TIME_LIMIT = 5.0

print(f"Tower iteration — seed_grade={SEED_GRADE}")
print(f"Level 0 generators: {G0}")
print(f"Level 0 bypass: {{(a,b),(b,c)}}")
print()

G, byp = G0, byp0
prev_sequences = {}   # level -> list of (n, total, ps, ns, ds, nc, mx)

for level in range(6):
    n_pairs, n_partnered, n_gens = bypass_graph_summary(G, byp)
    labels = [gen_label(g) for g in G]

    print(f"{'='*60}")
    print(f"Level {level}:  {n_gens} generators,  {n_pairs} bypass pairs,  {n_partnered} partnered")
    print(f"  gens: {labels[:12]}{'...' if len(labels)>12 else ''}")
    bp_pairs = [(gen_label(g1), gen_label(g2)) for g1 in G for g2 in G if byp(g1, g2)]
    print(f"  bypass: {bp_pairs[:12]}{'...' if len(bp_pairs)>12 else ''}")
    print()
    print(f"  {'n':>3}  {'total':>8}  {'PS':>7}  {'NS':>7}  {'DS':>6}  {'NC':>6}  {'max-ep':>7}")

    rows = []
    for n in range(MAX_GRADE):
        t0 = time.time()
        total, ps, ns, ds, nc, mx = grade_stats(n, G, byp)
        dt = time.time() - t0
        print(f"  {n:>3}  {total:>8}  {ps:>7}  {ns:>7}  {ds:>6}  {nc:>6}  {mx:>7}  ({dt:.2f}s)")
        rows.append((n, total, ps, ns, ds, nc, mx))
        if dt > TIME_LIMIT or total > MAX_TOTAL:
            print("    (stopping early)")
            break

    prev_sequences[level] = rows
    print()

    G_new, byp_new = tower_step(G, byp, SEED_GRADE)
    if G_new is None:
        print("No Determined histories at seed_grade — tower terminates.")
        break
    G, byp = G_new, byp_new

# ---------------------------------------------------------------------------
# Sequence comparison: DS column across levels

print("="*60)
print("DS (Determined count) by grade across levels:\n")
print(f"  {'n':>3}", end="")
for lvl in sorted(prev_sequences):
    print(f"  {'L'+str(lvl):>8}", end="")
print()

max_n = max(rows[-1][0] for rows in prev_sequences.values())
for n in range(max_n + 1):
    print(f"  {n:>3}", end="")
    for lvl in sorted(prev_sequences):
        rows = {r[0]: r for r in prev_sequences[lvl]}
        ds = rows[n][4] if n in rows else "-"
        print(f"  {str(ds):>8}", end="")
    print()

print()

# NC sequence across levels
print("NC (non-confluent count) by grade across levels:\n")
print(f"  {'n':>3}", end="")
for lvl in sorted(prev_sequences):
    print(f"  {'L'+str(lvl):>8}", end="")
print()

for n in range(max_n + 1):
    print(f"  {n:>3}", end="")
    for lvl in sorted(prev_sequences):
        rows = {r[0]: r for r in prev_sequences[lvl]}
        nc = rows[n][5] if n in rows else "-"
        print(f"  {str(nc):>8}", end="")
    print()
