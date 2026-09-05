# void — grade-0, prefix-minimum, identity of the free monoid
# unreachable from non-void via bypass because bypass preserves grade
# incomparable with all non-void in bypass order (bypass only relates same-grade)
void = ()
void_grade = 0

def step(g):   return g + 1
def grade(h):  return len(h)   # = void_grade iff h is void

def prepend(g, h):
    return (g,) + h


# bypass — directional, irreversible, grade-preserving
# :potential is not failure — it IS the terminal state the algebra is built on
def bypass_at(h, pos, bypasses):
    if pos + 1 < len(h) and bypasses(h[pos], h[pos + 1]):
        new = list(h)
        new[pos], new[pos + 1] = new[pos + 1], new[pos]   # swap; length preserved -> grade preserved
        return ("fired", tuple(new))
    return ("potential", h)


# state monad: History -> (value, History)
# void is the implicit ground — run starts there, nothing can return to it
def return_(a):
    return lambda h: (a, h)

def bind(m, f):
    def go(h):
        a, h_ = m(h)
        return f(a)(h_)
    return go

def run(m):
    return m(void)


# state operations
def prepend_(g):
    return lambda h: (None, prepend(g, h))

def bypass_(pos, bypasses):
    return lambda h: bypass_at(h, pos, bypasses)


# return_ used: read-only lifts that don't touch state
def grade_():
    return lambda h: (grade(h), h)

def history_():
    return lambda h: (h, h)


# settled predicates — built entirely on what "potential" means
def possible_settled(h, bypasses):
    return all(not bypasses(h[i], h[i + 1]) for i in range(len(h) - 1))

def necessary_settled(h, generators, bypasses):
    return all(any(bypasses(g, p) for p in generators) for g in h)

def doubly_settled(h, generators, bypasses):
    return possible_settled(h, bypasses) and necessary_settled(h, generators, bypasses)


# close over a specific DPM — generators and bypasses are the only external inputs
def make_dpm(generators, bypasses):
    return {
        "void":       void,
        "generators": generators,
        "bypasses":   bypasses,
        "run":        run,
        "return_":    return_,
        "bind":       bind,
        "prepend_":   prepend_,
        "bypass_":    lambda pos: bypass_(pos, bypasses),
        "grade_":     grade_,
        "history_":   history_,
        "settled_":   lambda: (lambda h: (doubly_settled(h, generators, bypasses), h)),
    }


# the paper's own running example — G := {a, b, c}, a bypasses b, b bypasses c
# the example that forces non-confluence:
#   abc -> bac  (a bypasses b, positions 0-1)
#   abc -> acb  (b bypasses c, positions 1-2)
# bac and acb are both possible-settled and neither can reach the other
_bypass_pairs = {("a", "b"), ("b", "c")}
dpm = make_dpm(
    generators = ["a", "b", "c"],
    bypasses   = lambda a, b: (a, b) in _bypass_pairs,
)

# --- exploration ---
from itertools import product as _product

def all_histories(n, generators):
    if n == 0:
        return [void]
    return [tuple(p) for p in _product(generators, repeat=n)]

def one_step_reachable(h, bypasses):
    return [h_ for i in range(len(h) - 1)
            for status, h_ in [bypass_at(h, i, bypasses)]
            if status == "fired"]

def bypass_closure(h, bypasses):
    visited, frontier = set(), {h}
    while frontier:
        h_ = frontier.pop()
        visited.add(h_)
        frontier |= set(one_step_reachable(h_, bypasses)) - visited
    return visited

def maximal_endpoints(h, bypasses):
    return {r for r in bypass_closure(h, bypasses) if possible_settled(r, bypasses)}


def grade_stats(n, generators, bypasses):
    histories = all_histories(n, generators)

    # adjacency list — only fired transitions (grade-preserving by construction)
    succs = {}
    for h in histories:
        succs[h] = [h_ for i in range(n - 1)
                    for st, h_ in [bypass_at(h, i, bypasses)]
                    if st == "fired"]

    # endpoints via memoized DFS
    # asymmetric bypass (a->b => not b->a) makes the bypass graph a DAG:
    # each fired step converts one (a,b) inversion into (b,a) which cannot re-fire
    # so no cycle is possible, and this recursion always terminates
    memo = {}
    def endpoints_of(h):
        if h in memo: return memo[h]
        if not succs[h]:
            memo[h] = frozenset([h])
        else:
            memo[h] = frozenset().union(*(endpoints_of(s) for s in succs[h]))
        return memo[h]

    ps = ns = ds = nc = max_ep = 0
    for h in histories:
        ep  = endpoints_of(h)
        p   = not succs[h]
        nec = necessary_settled(h, generators, bypasses)
        ps     += p
        ns     += nec
        ds     += p and nec
        nc     += len(ep) > 1
        max_ep  = max(max_ep, len(ep))

    return len(histories), ps, ns, ds, nc, max_ep


if __name__ == "__main__":
    import time

    G   = dpm["generators"]
    byp = dpm["bypasses"]

    # paper: 27 grade-3 histories, 16 possible-settled
    grade3   = all_histories(3, G)
    maximal3 = [h for h in grade3 if possible_settled(h, byp)]
    assert len(grade3)   == 27
    assert len(maximal3) == 16
    print(f"grade 3: {len(grade3)} histories, {len(maximal3)} possible-settled")

    # paper: of the 11 non-maximal, only abc is non-confluent
    non_maximal   = [h for h in grade3 if not possible_settled(h, byp)]
    non_confluent = [h for h in non_maximal if len(maximal_endpoints(h, byp)) > 1]
    assert len(non_maximal)   == 11
    assert non_confluent      == [("a", "b", "c")]
    print(f"non-maximal: {len(non_maximal)}, non-confluent: {non_confluent}")

    # paper: abc reaches exactly bac and acb
    endpoints = maximal_endpoints(("a", "b", "c"), byp)
    assert endpoints == {("b", "a", "c"), ("a", "c", "b")}
    print(f"abc endpoints: {sorted(endpoints)}")

    # four positions at grade 2
    print("\ngrade 2:")
    for h in sorted(all_histories(2, G)):
        ps = possible_settled(h, byp)
        ns = necessary_settled(h, G, byp)
        label = ("DoublySettled"          if ps and ns else
                 "flowing-with-partners"  if ns        else
                 "stopped-no-partner"     if ps        else
                 "Unsettled")
        print(f"  {''.join(h)}: {label}")

    # paper: no canonical path length to settlement — directed 3-cycle, grade 4
    dpm3 = make_dpm(
        generators = ["a", "b", "c"],
        bypasses   = lambda a, b: (a, b) in {("a","b"), ("b","c"), ("c","a")},
    )
    byp3 = dpm3["bypasses"]
    aabc = ("a", "a", "b", "c")
    ds_endpoints = {h for h in bypass_closure(aabc, byp3)
                    if doubly_settled(h, dpm3["generators"], byp3)}
    assert ("a", "a", "c", "b") in ds_endpoints
    assert ("b", "a", "a", "c") in ds_endpoints
    print(f"\naabc doubly-settled endpoints (3-cycle): {sorted(ds_endpoints)}")

    # grow it
    print(f"\n{'n':>4}  {'total':>7}  {'PS':>6}  {'NS':>6}  {'DS':>6}  {'NC':>7}  {'max-ep':>7}")
    for n in range(10):
        t0 = time.time()
        total, ps, ns, ds, nc, mx = grade_stats(n, G, byp)
        elapsed = time.time() - t0
        print(f"{n:>4}  {total:>7}  {ps:>6}  {ns:>6}  {ds:>6}  {nc:>7}  {mx:>7}  ({elapsed:.2f}s)")
        if elapsed > 4:
            print("  stopping")
            break
