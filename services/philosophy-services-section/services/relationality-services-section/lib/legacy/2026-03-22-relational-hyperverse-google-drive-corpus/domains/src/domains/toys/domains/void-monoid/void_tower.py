# WARNING: PROBABLY IMPLEMENTS BAD MATH
# This code was written during a period of significant conceptual drift.
# Verify all structure and terminology against organizing-infinite-voidmath.md
# and organizing-finite-voidmath.md before trusting anything here.


# WARNING: PROBABLY IMPLEMENTS BAD MATH
# This code was written during a period of significant conceptual drift.
# Verify all structure and terminology against organizing-infinite-voidmath.md
# and organizing-finite-voidmath.md before trusting anything here.

from itertools import product

class Void:
    def __init__(self):
        self._pair = None
    def pair(self):
        if self._pair is None:
            self._pair = (Face(self, 0), Face(self, 1))
        return self._pair

class Face:
    def __init__(self, void, position):
        self.void = void
        self.position = position
    def bypasses(self, other):
        return self.position == 0 and other.position == 1
    def __repr__(self):
        return f"Face({self.position})"

void = Void()
active, potential = void.pair()

# --- histories ---

def all_histories(n, gens):
    if n == 0:
        return [()]
    return list(product(gens, repeat=n))

def one_step(h, bypasses):
    results = []
    for i in range(len(h) - 1):
        if bypasses(h[i], h[i+1]):
            results.append(h[:i] + (h[i+1], h[i]) + h[i+2:])
    return results

def closure(h, bypasses):
    visited, frontier = set(), {h}
    while frontier:
        cur = frontier.pop()
        visited.add(cur)
        for nxt in one_step(cur, bypasses):
            if nxt not in visited:
                frontier.add(nxt)
    return visited

def possible_settled(h, bypasses):
    return not any(bypasses(h[i], h[i+1]) for i in range(len(h)-1))

def necessary_settled(h, gens, bypasses):
    return all(any(bypasses(g, h[i]) or bypasses(h[i], g) for g in gens) for i in range(len(h)))

def doubly_settled(h, gens, bypasses):
    return possible_settled(h, bypasses) and necessary_settled(h, gens, bypasses)

# --- induced bypass for next level ---

def induced_bypasses(d1, d2, base_bypasses):
    if d1 == d2:
        return False
    return any(base_bypasses(g1, g2) for g1 in d1 for g2 in d2)

# --- tower step ---

def tower_step(gens, bypasses_fn, seed_grade=2):
    histories = all_histories(seed_grade, gens)
    det = [h for h in histories if doubly_settled(h, gens, bypasses_fn)]
    if not det:
        return None, None
    new_byp = lambda d1, d2: induced_bypasses(d1, d2, bypasses_fn)
    return det, new_byp

# --- run ---

def label(g):
    if isinstance(g, Face):
        return '+' if g.position == 0 else '-'
    return ''.join(label(x) for x in g)

def run():
    gens = list(void.pair())
    byp  = lambda a, b: a.bypasses(b)

    for level in range(4):
        bp_pairs = [(label(a), label(b)) for a in gens for b in gens if byp(a, b)]
        print(f"
=== Level {level} ===")
        print(f"  generators ({len(gens)}): {[label(g) for g in gens]}")
        print(f"  bypass pairs: {bp_pairs}")

        for n in range(min(6, 40000 // max(len(gens)**2, 1))):
            histories = all_histories(n, gens)
            ds = [h for h in histories if doubly_settled(h, gens, byp)]
            nc = [h for h in histories
                  if len({e for e in closure(h, byp) if possible_settled(e, byp)}) > 1]
            print(f"  grade {n}: {len(histories):>6} histories  "
                  f"{len(ds):>5} DS  {len(nc):>5} NC")

        gens, byp = tower_step(gens, byp)
        if gens is None:
            print("tower terminates")
            break

run()