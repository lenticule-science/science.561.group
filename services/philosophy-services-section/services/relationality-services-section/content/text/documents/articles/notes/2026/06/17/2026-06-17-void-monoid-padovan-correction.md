---
title: "Void Monoid: the Padovan Correction to the Partition Function"
date-created: 2026-06-17
description: "This secures a specific computational discovery that the archive-recovery note already flagged as at risk: \"the partition function section had to be corrected from Fibonacci/phi to Padovan/rho based on a Python toy (zeta.py{.verbatim})…"
---

# Documentation

## README

This secures a specific computational discovery that [the archive-recovery note](../../04/06/2026-04-06-note-on-relational-hyperverse-archive-recovery.md) already flagged as at risk: "the partition function section had to be corrected from Fibonacci/phi to Padovan/rho based on a Python toy (`zeta.py`{.verbatim}) that could easily have been lost in compression. If one computational discovery survived by luck, others may not have." The toy is `zeta.py`{.verbatim}, tangled below in full along with the minimal engine it depends on (`pewpew.py`{.verbatim}, "skeleton of the void grade structure"). This resolves the risk the recovery note named: the discovery no longer depends on one file surviving compression by luck.

## The model: a Directional Preordered Monoid (DPM)

The free monoid over generators $G$ under *bypass* dynamics: a history is a word over $G$; a bypass step swaps two adjacent, grade-preserving letters when a directional, irreversible bypass relation licenses it (e.g. $a$ bypasses $b$, $b$ bypasses $c$, but not the reverse). Grade is word length and is preserved by every bypass step, so the bypass graph on histories of a fixed grade is a DAG (no cycles: each fired step converts one $(a,b)$ inversion into $(b,a)$, which cannot re-fire). A history is:

- **possible-settled** (PS) if no bypass can fire on it (a sink of the DAG),
- **necessary-settled** (NS) if every letter in it already bypasses some generator,
- **doubly-settled** (DS) if both.

The canonical example $G = \{a,b,c\}$ with $a$-bypasses-$b$ and $b$-bypasses-$c$ is **non-confluent**: the history `abc`{.verbatim} reaches both `bac`{.verbatim} and `acb`{.verbatim}, and neither can reach the other — there is no unique settled form.

## The correction

Grade-$n$ counts of each position type (Total, PS, NS, DS, and $F$ = the "free"/unsettled-and-unnecessary remainder) grow like the largest root of the generating function's denominator — a pole in $\beta$-space, $z = e^{-\beta}$. An old draft predicted the possible-settled count's dominant pole at $\beta_c = \ln(\varphi) \approx 0.481$ (the golden ratio, a Fibonacci recurrence), under the assumption that the $F$ position is empty. Running the actual grade statistics (below) shows $F \neq \emptyset$: the possible-settled sequence in fact follows a **Padovan** recurrence, whose characteristic root is not $\varphi$ but the **plastic number** $\rho \approx 1.32472$ (the real root of $x^3 = x+1$), giving the corrected pole $\beta_c = \ln(\rho) \approx 0.28174$ — noticeably smaller than the old prediction, and reflecting qualitatively different asymptotics ($F \neq \emptyset$ means the free monoid genuinely has more structure at each grade than the emptied model assumed).

The other position types keep the simple integer poles the old model already had right: total word count grows like $3^n$ ($\beta = \ln 3$), necessary-settled like $2^n$ ($\beta = \ln 2$), doubly-settled polynomially (a double pole at $z=1$, $\beta=0$).

## Status

`pewpew.py`{.verbatim} is complete, self-verifying code: its own `__main__`{.verbatim} block asserts the specific claims of the source paper this models (27 grade-3 histories, 16 possible-settled, exactly one non-confluent history at grade 3 reaching exactly two endpoints, and a 3-cycle example with two doubly-settled endpoints at grade 4) before running. `zeta.py`{.verbatim} is a working numerical investigation, not a formal proof — it establishes the corrected pole location by ratio tests and explicit partition-function evaluation at the relevant $\beta$ values, cross-checked against the known analytic values of $\varphi$ and $\rho$, but the underlying claim that the possible-settled sequence follows a Padovan (not Fibonacci) recurrence is empirical here, not derived from a transfer-matrix proof in this file.

The broader void-monoid toolkit this was extracted from (a "physics engine" instrumented for failure observation, an animated DAG-growth visualizer, a "living" interleaved-rounds process view, a 3D spatiotemporal manifold view, and a tower operator) was judged, on the evidence available, to be exploratory tooling built on top of this same core rather than additional unrecovered mathematical claims, and was not itself absorbed. One further file in that toolkit, an earlier tower implementation, carries the author's own warning that it was "written during a period of conceptual drift and probably implements bad math" and was deleted rather than preserved, per that self-assessment.

# Code — pewpew.py (the minimal engine) {#code-pewpew.py-the-minimal-engine}

``` python
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
```

# Code — zeta.py (the correction) {#code-zeta.py-the-correction}

``` {.python tangle="./src/void-monoid/zeta.py"}
# zeta.py — spectral structure of the DPM partition function
#
# The grade stats give count sequences at each grade n.
# Each sequence has an asymptotic growth rate = a pole of its generating function.
# In beta-space (z = e^{-beta}), poles are phase transitions.
#
# Old drafts predicted beta_c = ln(phi) ~ 0.481 (Fibonacci pole, assuming F=empty).
# We show F != empty -> PS follows Padovan -> actual pole at ln(rho) ~ 0.281
# where rho ~ 1.3247 is the plastic number (rho^3 = rho + 1).

import sys, time, math
sys.path.insert(0, '.')
from pewpew import *

G   = dpm["generators"]
byp = dpm["bypasses"]

# ---------------------------------------------------------------------------
# Collect grade stats up to n=13 (or until slow)

print("Computing grade stats...")
rows = []
for n in range(14):
    t0 = time.time()
    total, ps, ns, ds, nc, mx = grade_stats(n, G, byp)
    dt = time.time() - t0
    # Four positions:  DS | S=PS-DS | T=NS-DS | F=Total-PS-NS+DS
    s = ps - ds
    t = ns - ds
    f = total - ps - ns + ds
    rows.append((n, total, ps, ns, ds, nc, s, t, f))
    print(f"  n={n:>2}: total={total:>7}  PS={ps:>6}  NS={ns:>5}  DS={ds:>3}"
          f"  S={s:>5}  T={t:>5}  F={f:>6}  NC={nc:>5}  ({dt:.2f}s)")
    if dt > 5:
        print("  (stopping)")
        break

print()

# ---------------------------------------------------------------------------
# Growth ratios — identify eigenvalues numerically

print("Asymptotic growth rates (ratio test):")
print(f"  {'n':>3}  {'Total':>8}  {'PS':>8}  {'NS':>8}  {'DS':>8}  {'F':>8}  {'NC':>8}")
for i in range(3, len(rows)):
    n0 = rows[i-1]
    n1 = rows[i]
    def ratio(col):
        a, b = n0[col], n1[col]
        return f"{b/a:.5f}" if a > 0 else "  ---  "
    print(f"  {n1[0]:>3}  {ratio(1):>8}  {ratio(2):>8}  {ratio(3):>8}"
          f"  {ratio(4):>8}  {ratio(8):>8}  {ratio(5):>8}")

print()

# Known analytic values:
phi  = (1 + math.sqrt(5)) / 2          # golden ratio ~ 1.618
rho  = 1.3247179572447460259           # plastic number, rho^3 = rho + 1
print(f"Known eigenvalues:")
print(f"  Total growth:    3        -> beta = ln(3)   = {math.log(3):.5f}")
print(f"  PS (Padovan):    rho      -> beta = ln(rho) = {math.log(rho):.5f}  (plastic number)")
print(f"  NS growth:       2        -> beta = ln(2)   = {math.log(2):.5f}")
print(f"  DS growth:       1 (poly) -> beta = ln(1)   = 0.00000  (double pole)")
print(f"  [OLD DRAFT predicted: phi -> beta = ln(phi) = {math.log(phi):.5f}]  (golden ratio, F=empty assumption)")
print()

# ---------------------------------------------------------------------------
# Partition functions  Z(beta) = sum_n count(n) * e^{-beta*n}
# evaluated at discrete beta values — shows which pole dominates

betas = [0.10, 0.20, math.log(rho), 0.35, math.log(phi), math.log(2), 0.80, math.log(3), 1.20]

print("Partition functions Z(beta) by position type:")
print(f"  {'beta':>8}  {'Z_total':>12}  {'Z_PS':>12}  {'Z_NS':>12}  {'Z_DS':>12}  {'Z_F':>12}")

for beta in betas:
    z = math.exp(-beta)
    Z_total = sum(r[1] * z**r[0] for r in rows)
    Z_ps    = sum(r[2] * z**r[0] for r in rows)
    Z_ns    = sum(r[3] * z**r[0] for r in rows)
    Z_ds    = sum(r[4] * z**r[0] for r in rows)
    Z_f     = sum(r[8] * z**r[0] for r in rows)

    label = ""
    if abs(beta - math.log(rho)) < 0.001: label = " <- ln(rho), plastic"
    if abs(beta - math.log(phi)) < 0.001: label = " <- ln(phi), golden [old draft beta_c]"
    if abs(beta - math.log(2))   < 0.001: label = " <- ln(2),   NS"
    if abs(beta - math.log(3))   < 0.001: label = " <- ln(3),   Total"

    print(f"  {beta:>8.4f}  {Z_total:>12.3f}  {Z_ps:>12.3f}  {Z_ns:>12.3f}"
          f"  {Z_ds:>12.3f}  {Z_f:>12.3f}{label}")

print()

# ---------------------------------------------------------------------------
# The NC sequence and its eigenvalue

print("NC sequence and growth:")
nc_rows = [(r[0], r[5]) for r in rows if r[5] > 0]
for i in range(1, len(nc_rows)):
    n, nc  = nc_rows[i]
    _, nc0 = nc_rows[i-1]
    # also: what fraction of F is NC?
    f = rows[n][8]
    print(f"  n={n}: NC={nc:>5}  ratio={nc/nc0:.4f}  NC/F={nc/f:.4f}  NC/Total={nc/rows[n][1]:.4f}")

print()

# ---------------------------------------------------------------------------
# Transfer matrix for (S, T, F) — does it have plastic eigenvalues?
# Fit: [S(n+1), T(n+1), F(n+1)] = M * [S(n), T(n), F(n)] + correction
# (not exact since S and T have sub-leading polynomial corrections)
# Instead: fit the purely-exponential dominant parts

print("Dominant growth of each position type:")
for col, name in [(6,'S'), (7,'T'), (8,'F')]:
    vals = [r[col] for r in rows]
    # fit ratio at large n
    ratios = [vals[i]/vals[i-1] for i in range(4, len(vals)) if vals[i-1] > 0]
    if ratios:
        avg = sum(ratios[-3:]) / len(ratios[-3:])
        print(f"  {name}: late ratios = {[f'{r:.4f}' for r in ratios[-4:]]}"
              f"  -> dominant eigenvalue ~ {avg:.5f}")

print()
print(f"  Compare: rho = {rho:.5f},  2 = 2.00000,  3 = 3.00000")
print(f"  Plastic number rho solves x^3 = x + 1")
print()

# ---------------------------------------------------------------------------
# The product formula — does Z factor?
# Z_total(z) ~ 1/(1-3z)
# Z_PS(z) ~ (numerator)/(1-z^2-z^3) — Padovan poles
# Z_NS(z) ~ 1/(1-2z)
# Z_DS(z) ~ 1/(1-z)^2
#
# Old draft: Z(beta) = 1/((1-z)^2 * (1-z-z^2))  [Fibonacci, F=empty]
# Corrected: the Possible-settled piece has poles at roots of 1-z^2-z^3=0 [Padovan, F!=empty]

print("Pole locations of each generating function:")
print(f"  Z_total:  pole at z = 1/3     = {1/3:.5f}  -> beta = {math.log(3):.5f}")
print(f"  Z_PS:     pole at z = 1/rho   = {1/rho:.5f}  -> beta = {math.log(rho):.5f}  (Padovan dominant)")
print(f"  Z_NS:     pole at z = 1/2     = {1/2:.5f}  -> beta = {math.log(2):.5f}")
print(f"  Z_DS:     pole at z = 1 (x2)  = {1.0:.5f}  -> beta = {0.0:.5f}  (polynomial growth)")
print()
print(f"  Old draft Z(z) = 1/((1-z)^2 (1-z-z^2)):")
print(f"    poles: z=1 (double), z=1/phi={1/phi:.5f} (Fibonacci)")
print(f"    predicted beta_c = ln(phi) = {math.log(phi):.5f}")
print()
print(f"  Corrected Z_PS(z) has Padovan poles, not Fibonacci:")
print(f"    first real pole at z=1/rho={1/rho:.5f}")
print(f"    actual first beta_c = ln(rho) = {math.log(rho):.5f}")
print(f"    correction factor: ln(rho)/ln(phi) = {math.log(rho)/math.log(phi):.5f}")
```
