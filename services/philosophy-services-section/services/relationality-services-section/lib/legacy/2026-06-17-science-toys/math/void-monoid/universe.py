#!/usr/bin/env python3
"""
universe.py — void failure physics engine

The free monoid over G under bypass dynamics (BypassStep) is a failure
simulator. Histories are relational acts; bypass normalization is the
physics; non-confluence is failure.

The geometry of failure — where normalization splits into incomparable
Possible endpoints — IS the crystal structure. This engine simulates
that geometry and measures it with a battery of physical observables.

Simulation:
  BypassStep dynamics run on all grade-n histories. Full bypass DAG
  collected. For each history: Possible endpoints, settlement depths,
  first bypass fired on each path (for temporal classification).

Measurement battery (--measures flag):
  positions      four-position taxonomy (Determined/Flowing/Stopped/Unsettled)
  dag            bypass DAG geometry: degree distribution, depth profile
  defects        defect network geometry: Euler chi, diameter, clustering
  thermodynamics Z(beta), F(beta), C(beta), S(beta) from settlement depths
  temporal       arrow of time: upstream-first vs downstream-first endpoints
  entropy        settlement entropy: information content of failure geometry
  boundary       bulk/boundary ratio: fraction of bulk that reaches H*
  entanglement   Entangled pairs per Determined history
  tower          LevelOperator seeding (derived Bypasses from commutation)
  sequences      sequence recognition (Padovan, Fibonacci etc.) — opt-in
"""

import sys, time, math, argparse
if hasattr(sys.stdout, 'reconfigure'):
    sys.stdout.reconfigure(encoding='utf-8', errors='replace')
from collections import deque, defaultdict
from itertools import product as _product
from dataclasses import dataclass, field
from typing import FrozenSet, Dict, List, Set, Tuple, Optional

# ---------------------------------------------------------------------------
# Physical constants

RHO  = 1.3247179572   # plastic constant: real root of x^3 = x + 1
RHO3 = RHO**3         # ~2.3247 — growth rate of Possible-settled

# ---------------------------------------------------------------------------
# Free monoid (voidmath.md)

Void = ()
def Prepend(g, h): return (g,) + h

# ---------------------------------------------------------------------------
# BypassStep relation (voidmath.md)
# (BypassStep (Prepend a (Prepend b tail)) (Bypasses a b)) = (Prepend b (Prepend a tail))
# Congruence: fires at any matching adjacent position

def BypassStep_all(h, Bypasses):
    out = []
    for (a, b) in Bypasses:
        for i in range(len(h) - 1):
            if h[i] == a and h[i+1] == b:
                out.append(h[:i] + (b, a) + h[i+2:])
    return out

def BypassStepSource(h, Bypasses):
    return bool(BypassStep_all(h, Bypasses))

# ---------------------------------------------------------------------------
# Four positions (voidmath §Two Conditions)

def Possible(h, Bypasses):
    return not BypassStepSource(h, Bypasses)

def HasPartner(g, Bypasses):
    return any(a == g for (a, b) in Bypasses)

def Necessary(h, Bypasses):
    return all(HasPartner(g, Bypasses) for g in h)

def four_position(h, Bypasses):
    p = Possible(h, Bypasses)
    n = Necessary(h, Bypasses)
    if p and n:  return "Determined"
    if p:        return "Stopped without partners"
    if n:        return "Flowing with partners"
    return           "Unsettled"

# ---------------------------------------------------------------------------
# Entangled pairs (voidmath §Determined)
# (Entangled h g g') <- (Bypasses g g') (AppearsIn h g) (AppearsIn h g')

def Entangled(h, Bypasses):
    gens = set(h)
    return [(a, b) for (a, b) in Bypasses if a in gens and b in gens]

# ---------------------------------------------------------------------------
# Bypass dynamics: BFS from h, tracking first bypass fired to each node

def bypass_dynamics(h, Bypasses):
    """
    BFS from h through BypassStep.
    Returns:
      visited      : dict h' -> BFS depth (min steps from h)
      first_bypass : dict h' -> bypass pair (a,b) of first step on path to h'
                     (None for h itself; canonical = sorted(Bypasses) ordering)
    """
    sorted_bp  = sorted(Bypasses)
    visited    = {h: 0}
    first_bypass = {h: None}
    q = deque([h])
    while q:
        curr = q.popleft()
        d    = visited[curr]
        for (a, b) in sorted_bp:
            for i in range(len(curr) - 1):
                if curr[i] == a and curr[i+1] == b:
                    nxt = curr[:i] + (b, a) + curr[i+2:]
                    if nxt not in visited:
                        visited[nxt] = d + 1
                        fb = first_bypass[curr] if first_bypass[curr] is not None else (a, b)
                        first_bypass[nxt] = fb
                        q.append(nxt)
    return visited, first_bypass

# ---------------------------------------------------------------------------
# Grade simulation: collect full failure geometry

@dataclass
class GradeData:
    n:               int
    G:               list
    Bypasses:        set
    position_counts: dict            # position name -> count
    det_histories:   list            # Determined histories
    # Per-history (non-Possible only):
    endpoints:       dict            # h -> frozenset of Possible endpoints
    first_bypass_to: dict            # h -> {endpoint -> bypass_pair of first step}
    max_depth:       dict            # h -> max BFS depth to any endpoint
    defect_pairs:    Set[FrozenSet]  # frozenset({e1, e2}) for non-confluent h
    no_possible:     int             # histories with no Possible endpoint (symmetric trap)

def simulate_grade(n, G, Bypasses):
    histories = [Void] if n == 0 else [tuple(p) for p in _product(G, repeat=n)]

    counts = {"Determined": 0, "Flowing with partners": 0,
              "Stopped without partners": 0, "Unsettled": 0}
    det_histories = []
    endpoints     = {}
    first_bypass_to = {}
    max_depth     = {}
    defect_pairs  = set()
    no_possible   = 0

    for h in histories:
        pos = four_position(h, Bypasses)
        counts[pos] += 1

        if pos in ("Determined", "Stopped without partners"):
            endpoints[h]       = frozenset([h])
            first_bypass_to[h] = {h: None}
            max_depth[h]       = 0
            if pos == "Determined":
                det_histories.append(h)
        else:
            visited, fb_map = bypass_dynamics(h, Bypasses)
            poss = frozenset(v for v in visited if Possible(v, Bypasses))

            if not poss:
                no_possible += 1
                endpoints[h]       = frozenset()
                first_bypass_to[h] = {}
                max_depth[h]       = max(visited.values()) if len(visited) > 1 else 0
            else:
                endpoints[h]       = poss
                first_bypass_to[h] = {ep: fb_map.get(ep) for ep in poss}
                max_depth[h]       = max((visited[ep] for ep in poss), default=0)

                if len(poss) > 1:
                    eps = sorted(poss, key=str)
                    for i in range(len(eps)):
                        for j in range(i+1, len(eps)):
                            defect_pairs.add(frozenset([eps[i], eps[j]]))

    return GradeData(
        n=n, G=G, Bypasses=Bypasses,
        position_counts=counts,
        det_histories=det_histories,
        endpoints=endpoints,
        first_bypass_to=first_bypass_to,
        max_depth=max_depth,
        defect_pairs=defect_pairs,
        no_possible=no_possible,
    )

# ---------------------------------------------------------------------------
# Symmetric bypass check (Traps lemma)

def symmetric_bypass_pairs(Bypasses):
    return {frozenset([a, b]) for (a, b) in Bypasses if (b, a) in Bypasses}

# ---------------------------------------------------------------------------
# Measurement: four-position counts

def measure_positions(gd):
    nc = sum(1 for ep in gd.endpoints.values() if len(ep) > 1)
    total = sum(gd.position_counts.values())
    return dict(total=total, nc=nc, **gd.position_counts,
                no_possible=gd.no_possible)

# ---------------------------------------------------------------------------
# Measurement: bypass DAG geometry
#
# The bypass DAG at grade n is a directed graph on |G|^n nodes.
# Source nodes: histories with in-degree 0 (no BypassStep points to them).
# Sink nodes: Possible histories (out-degree 0 — no BypassStep departs).
# Width at depth d: number of nodes reachable in exactly d BFS steps from sources.
# Out-degree distribution: how many BypassSteps can fire from each history.

def measure_dag_geometry(gd, Bypasses):
    n = gd.n
    if n == 0:
        return {"sources": 1, "sinks": 1, "max_out": 0,
                "degree_dist": {0: 1}, "width_dist": {0: 1}, "max_depth": 0}

    histories = [tuple(p) for p in _product(gd.G, repeat=n)]

    out_deg = {}
    in_deg  = defaultdict(int)
    for h in histories:
        succs = BypassStep_all(h, Bypasses)
        out_deg[h] = len(succs)
        for s in succs:
            in_deg[s] += 1

    degree_dist = defaultdict(int)
    for h in histories:
        degree_dist[out_deg[h]] += 1

    sources = [h for h in histories if in_deg[h] == 0]
    sinks   = [h for h in histories if out_deg[h] == 0]

    # BFS depth from all sources simultaneously
    depth_map = {}
    q = deque()
    for s in sources:
        depth_map[s] = 0
        q.append(s)
    while q:
        h = q.popleft()
        for h2 in BypassStep_all(h, Bypasses):
            if h2 not in depth_map:
                depth_map[h2] = depth_map[h] + 1
                q.append(h2)

    width_dist = defaultdict(int)
    for d in depth_map.values():
        width_dist[d] += 1

    return {
        "sources":     len(sources),
        "sinks":       len(sinks),
        "max_out":     max(out_deg.values(), default=0),
        "degree_dist": dict(sorted(degree_dist.items())),
        "width_dist":  dict(sorted(width_dist.items())),
        "max_depth":   max(depth_map.values(), default=0),
    }

# ---------------------------------------------------------------------------
# Measurement: defect network geometry
#
# Nodes = Possible histories (stable configurations).
# Edges = unordered pairs that are both endpoints of the same non-confluent history.
# This IS the crystal's fault geometry.
#
# Euler characteristic chi = V - E (trees: chi = 1 per component; cycles reduce chi)
# Diameter = max shortest path in the undirected defect graph
# Clustering = fraction of triangles to connected triplets

def measure_defect_geometry(defect_pairs):
    if not defect_pairs:
        return {}

    nodes = set()
    adj   = defaultdict(set)
    for pair in defect_pairs:
        a, b = sorted(pair, key=str)
        nodes.add(a); nodes.add(b)
        adj[a].add(b); adj[b].add(a)

    V = len(nodes)
    E = len(defect_pairs)

    # Connected components
    visited, components = set(), []
    for start in nodes:
        if start in visited: continue
        comp = set()
        q    = deque([start])
        while q:
            v = q.popleft()
            if v not in visited:
                visited.add(v); comp.add(v)
                q.extend(adj[v] - visited)
        components.append(len(comp))

    # Degree sequence
    degrees = sorted([len(adj[v]) for v in nodes], reverse=True)

    # Diameter (BFS from each node — only feasible for small graphs)
    diameter = 0
    if V <= 500:
        for start in nodes:
            dist = {start: 0}
            q    = deque([start])
            while q:
                v = q.popleft()
                for u in adj[v]:
                    if u not in dist:
                        dist[u] = dist[v] + 1
                        q.append(u)
            diameter = max(diameter, max(dist.values(), default=0))

    # Clustering coefficient
    triangles = 0
    triplets  = 0
    for v in nodes:
        nb = list(adj[v])
        k  = len(nb)
        if k < 2: continue
        triplets += k * (k - 1) // 2
        for i in range(k):
            for j in range(i + 1, k):
                if nb[j] in adj[nb[i]]:
                    triangles += 1
    clustering = triangles / triplets if triplets > 0 else 0.0

    return {
        "V":          V,
        "E":          E,
        "chi":        V - E,
        "diameter":   diameter,
        "clustering": clustering,
        "deg_max":    max(degrees, default=0),
        "deg_mean":   sum(degrees) / len(degrees) if degrees else 0.0,
        "deg_seq":    degrees[:8],
        "components": sorted(components, reverse=True),
    }

# ---------------------------------------------------------------------------
# Measurement: thermodynamics of the settlement process
#
# Microstate: non-Possible history h.
# Energy: E(h) = max settlement depth (max steps to reach a Possible endpoint).
# Degeneracy: g(h) = number of distinct Possible endpoints (branching factor).
#
# Z(beta) = sum_h g(h) * exp(-beta * E(h))
# F(beta) = -log Z(beta)                          [free energy]
# <E>(beta) = sum_h g(h)*E(h)*exp(-beta*E(h)) / Z [mean energy]
# C(beta) = beta^2 * (<E^2> - <E>^2)             [specific heat / heat capacity]
# S(beta) = beta * <E> - F(beta)                  [entropy]
#
# The critical inverse temperature beta_c is where C peaks.

def measure_thermodynamics(grade_data_list, Bypasses, n_beta=40):
    betas = [0.05 * (i + 1) for i in range(n_beta)]   # 0.05 to 2.0

    Z   = defaultdict(float)
    Em  = defaultdict(float)   # sum g(h)*E*exp(...)
    E2m = defaultdict(float)   # sum g(h)*E^2*exp(...)

    for gd in grade_data_list:
        for h, eps in gd.endpoints.items():
            if Possible(h, gd.Bypasses):
                continue
            k   = len(eps)
            if k == 0:
                continue
            E_h = gd.max_depth.get(h, 0)
            for beta in betas:
                w = k * math.exp(-beta * E_h)
                Z[beta]   += w
                Em[beta]  += E_h * w
                E2m[beta] += E_h * E_h * w

    results = []
    for beta in betas:
        z = Z[beta]
        if z <= 0:
            continue
        em  = Em[beta] / z
        e2m = E2m[beta] / z
        F   = -math.log(z)
        C   = beta**2 * (e2m - em**2)
        S   = beta * em - F
        results.append({"beta": beta, "Z": z, "F": F, "E": em, "C": C, "S": S})

    return results

# ---------------------------------------------------------------------------
# Measurement: partition function (grade-level)
# Z(beta) = sum_n Possible-settled(n) * exp(-beta * n)
# Kept for backward compat / --measures sequences

def measure_partition(seq, betas=None):
    BETA_C_PAD = 3 * math.log(RHO)   # ~0.8427
    if betas is None:
        betas = [0.3, 0.5, 0.7, BETA_C_PAD * 0.9, BETA_C_PAD,
                 BETA_C_PAD * 1.1, 1.2, 1.5]
    results = {}
    for beta in sorted(set(betas)):
        Z = sum(d * math.exp(-beta * n) for n, d in enumerate(seq) if d > 0)
        results[beta] = Z
    return results

# ---------------------------------------------------------------------------
# Measurement: temporal split (arrow of time proxy)

def measure_temporal(grade_data_list, Bypasses):
    bp_rank  = {bp: i for i, bp in enumerate(sorted(Bypasses))}
    max_rank = len(bp_rank) - 1
    results  = []
    for gd in grade_data_list:
        upstream = downstream = unclear = 0
        for h, eps in gd.endpoints.items():
            if len(eps) <= 1:
                continue
            fb_map = gd.first_bypass_to.get(h, {})
            for ep in eps:
                fb = fb_map.get(ep)
                if fb is None:
                    unclear += 1
                else:
                    r = bp_rank.get(fb, -1)
                    if r == 0:
                        upstream += 1
                    elif r == max_rank:
                        downstream += 1
                    else:
                        unclear += 1
        total    = upstream + downstream
        fraction = (upstream - downstream) / total if total > 0 else None
        results.append({"n": gd.n, "upstream": upstream,
                         "downstream": downstream, "unclear": unclear,
                         "fraction": fraction})
    return results

# ---------------------------------------------------------------------------
# Measurement: settlement entropy

def measure_entropy(grade_data_list):
    results = []
    for gd in grade_data_list:
        total_H = count = 0
        max_H   = 0.0
        for h, eps in gd.endpoints.items():
            k = len(eps)
            if k > 1:
                H_h     = math.log(k)
                total_H += H_h
                max_H    = max(max_H, H_h)
                count   += 1
        results.append({"n": gd.n, "nc_count": count,
                         "avg_entropy": total_H / count if count else 0.0,
                         "max_entropy": max_H,
                         "total_entropy": total_H})
    return results

# ---------------------------------------------------------------------------
# Measurement: bulk / boundary ratio

def measure_boundary(grade_data_list):
    results = []
    for gd in grade_data_list:
        total = sum(gd.position_counts.values())
        det   = gd.position_counts["Determined"]
        ratio = det / total if total > 0 else 0.0
        reaches_boundary = sum(
            1 for h, eps in gd.endpoints.items()
            if all(four_position(ep, gd.Bypasses) == "Determined" for ep in eps)
            and eps
        )
        results.append({
            "n":                 gd.n,
            "total":             total,
            "det":               det,
            "boundary_fraction": ratio,
            "reaches_boundary":  reaches_boundary,
            "reaches_fraction":  reaches_boundary / total if total > 0 else 0.0,
        })
    return results

# ---------------------------------------------------------------------------
# Measurement: entanglement density

def measure_entanglement(grade_data_list, Bypasses):
    results = []
    for gd in grade_data_list:
        if not gd.det_histories:
            results.append({"n": gd.n, "avg_pairs": 0.0, "total_pairs": 0, "max_pairs": 0})
            continue
        pair_counts = [len(Entangled(h, Bypasses)) for h in gd.det_histories]
        results.append({
            "n":           gd.n,
            "avg_pairs":   sum(pair_counts) / len(pair_counts),
            "total_pairs": sum(pair_counts),
            "max_pairs":   max(pair_counts),
        })
    return results

# ---------------------------------------------------------------------------
# Sequence recognition (optional, --measures sequences)

_PADOVAN = [1,1,1,2,2,3,4,5,7,9,12,16,21,28,37,49,65,86,114,151,
            200,265,351,465,616,816,1081,1432,1897,2513,3329,4410,5842]

_PHI   = (1 + 5**0.5) / 2
_SQRT5 = 5**0.5

def _padovan(n):
    if n < len(_PADOVAN): return _PADOVAN[n]
    seq = list(_PADOVAN)
    while len(seq) <= n: seq.append(seq[-2] + seq[-3])
    return seq[n]

def recognize_sequence(seq):
    if len(seq) < 3: return []
    hits = []
    pad3 = [_padovan(3*i + 2) for i in range(len(seq))]
    if seq == pad3[:len(seq)]:
        hits.append("Pad(3n+2)  [plastic constant rho^3 ~= 2.3247]")
    pad3b = [_padovan(3*i) for i in range(len(seq))]
    if seq == pad3b[:len(seq)]:
        hits.append("Pad(3n)  [plastic constant]")
    fibs = [round(_PHI**(n+1) / _SQRT5) for n in range(len(seq))]
    if seq == fibs[:len(seq)]:
        hits.append("F(n+1)  [Fibonacci / golden ratio phi]")
    if seq == list(range(1, len(seq)+1)):
        hits.append("n+1  [linear]")
    for k in [2, 3, 4]:
        if seq == [k**n for n in range(len(seq))][:len(seq)]:
            hits.append(f"{k}^n")
    if len(seq) >= 5 and all(seq[n] == seq[n-2] + seq[n-3] for n in range(3, len(seq))):
        hits.append(f"Padovan recurrence (seeds {seq[0]},{seq[1]},{seq[2]})")
    if len(seq) >= 4 and all(seq[n] == seq[n-1] + seq[n-2] for n in range(2, len(seq))):
        hits.append(f"Fibonacci recurrence (seeds {seq[0]},{seq[1]})")
    if len(seq) >= 4 and seq[-1] > 0:
        ratios = [seq[i]/seq[i-1] for i in range(1, len(seq)) if seq[i-1] > 0]
        if len(ratios) >= 3:
            r = ratios[-1]
            if all(abs(x - r) < 0.01 * r for x in ratios[-3:]):
                hits.append(f"geometric ~{r:.5f}^n")
    return hits if hits else ["(unrecognized)"]

# ---------------------------------------------------------------------------
# LevelOperator: derived bypass from commutation in parent dynamics
#
# D1 bypasses D2 iff D1+D2 ->* D2+D1 in the parent bypass dynamics.
# This is the CORRECT derivation: the Level 1 bypass relation is not
# inherited from generator-level pairs, but derived from whether D1 and
# D2 actually commute (swap) under the Level 0 bypass dynamics.
# Levels are connected because Level 1's structure IS Level 0's dynamics.

def derived_bypass(det_histories, parent_bypasses):
    new_bp = set()
    for D1 in det_histories:
        for D2 in det_histories:
            if D1 == D2: continue
            concat = D1 + D2
            target = D2 + D1
            if concat == target: continue      # same arrangement — not a bypass
            vis, _ = bypass_dynamics(concat, parent_bypasses)
            if target in vis:
                new_bp.add((D1, D2))
    return new_bp

# ---------------------------------------------------------------------------
# Run one level: simulate all grades, apply measurement battery

def run_level(level, G, Bypasses, seed_grade, max_grade, max_levels, active):
    ind = "  " * level
    sym = symmetric_bypass_pairs(Bypasses)

    print(f"\n{ind}{'='*72}")
    print(f"{ind}Level {level}  |G|={len(G)}  |Bypasses|={len(Bypasses)}"
          + (f"  [!{len(sym)} symmetric — Traps lemma / U_G diverges]" if sym else ""))
    if level > 0:
        gs = [str(g)[:24] for g in list(G)[:4]]
        print(f"{ind}  generators (first 4): {gs}{'...' if len(G) > 4 else ''}")
    print(f"{ind}{'='*72}")

    grade_data_list  = []
    det_seq          = []
    poss_seq         = []
    all_defect_pairs = set()
    next_G = next_Bp = seed_msg = None

    for n in range(max_grade + 1):
        t0 = time.time()
        gd = simulate_grade(n, G, Bypasses)
        elapsed = time.time() - t0
        grade_data_list.append(gd)
        det_seq.append(gd.position_counts["Determined"])
        poss_seq.append(gd.position_counts["Determined"] +
                        gd.position_counts["Stopped without partners"])
        all_defect_pairs |= gd.defect_pairs

        if "positions" in active:
            m  = measure_positions(gd)
            md = max(gd.max_depth.values(), default=0)
            print(f"{ind}  n={n:2d}"
                  f"  total={m['total']:>6}"
                  f"  Det={m['Determined']:>5}"
                  f"  Flow={m['Flowing with partners']:>5}"
                  f"  Stop={m['Stopped without partners']:>5}"
                  f"  Unset={m['Unsettled']:>6}"
                  f"  nc={m['nc']:>4}"
                  f"  maxd={md:>3}"
                  f"  ({elapsed:.3f}s)")

        if "dag" in active and n > 0:
            dg = measure_dag_geometry(gd, Bypasses)
            if dg["max_depth"] > 0:
                w_str = " ".join(str(dg["width_dist"].get(d, 0))
                                 for d in range(dg["max_depth"] + 1))
                deg_str = " ".join(f"{k}:{v}" for k, v in
                                   list(dg["degree_dist"].items())[:5])
                print(f"{ind}       DAG  src={dg['sources']:>4}  snk={dg['sinks']:>4}"
                      f"  max_out={dg['max_out']}"
                      f"  depth_profile=[{w_str}]"
                      f"  out_dist=[{deg_str}]")

        if "defects" in active and gd.defect_pairs:
            dnet = measure_defect_geometry(gd.defect_pairs)
            print(f"{ind}       defect  V={dnet['V']}  E={dnet['E']}"
                  f"  chi={dnet['chi']}"
                  f"  diam={dnet['diameter']}"
                  f"  cluster={dnet['clustering']:.3f}"
                  f"  deg={dnet['deg_seq'][:5]}"
                  f"  comp={dnet['components'][:4]}")

        if "entropy" in active:
            er = measure_entropy([gd])[0]
            if er["nc_count"] > 0:
                print(f"{ind}       entropy  avg={er['avg_entropy']:.3f}"
                      f"  max={er['max_entropy']:.3f}"
                      f"  nc={er['nc_count']}")

        if "entanglement" in active and gd.det_histories and n > 0:
            er = measure_entanglement([gd], Bypasses)[0]
            if er["max_pairs"] > 0:
                print(f"{ind}       entangle  avg={er['avg_pairs']:.2f}"
                      f"  max={er['max_pairs']}"
                      f"  total={er['total_pairs']}")

        # LevelOperator seed (collected here, computed after all grades)
        if n == seed_grade and next_G is None and level < max_levels - 1:
            _det = list(gd.det_histories)
            next_G     = _det
            next_Bp    = None  # deferred — computed after grade loop
            _seed_det  = _det  # stash for post-loop computation

    # Compute derived bypass after all grades are done (can reference gd from loop)
    if next_G is not None:
        t0 = time.time()
        next_Bp  = derived_bypass(next_G, Bypasses)
        sym_new  = symmetric_bypass_pairs(next_Bp)
        bp_time  = time.time() - t0
        seed_msg = (f"{ind}  >> LevelOperator  grade {seed_grade}"
                    f"  -> {len(next_G)} generators"
                    f"  {len(next_Bp)} derived bypasses"
                    + (f"  [!{len(sym_new)} symmetric]" if sym_new else "")
                    + f"  ({bp_time:.3f}s)")

    if seed_msg:
        print(seed_msg)

    # -------------------------------------------------------------------
    # Post-grade measurements

    if "boundary" in active:
        print(f"\n{ind}--- Bulk / boundary ---")
        brs = measure_boundary(grade_data_list)
        print(f"{ind}  {'n':>3}  {'total':>7}  {'H*':>6}  {'Poss':>6}  "
              f"{'H*/tot':>8}  {'Pos/tot':>9}")
        for br, ps in zip(brs, poss_seq):
            print(f"{ind}  {br['n']:>3}  {br['total']:>7}  {br['det']:>6}  {ps:>6}"
                  f"  {br['boundary_fraction']:>8.4f}"
                  f"  {ps/br['total']:>9.4f}")

    if "temporal" in active and len(Bypasses) >= 2:
        print(f"\n{ind}--- Temporal split ---")
        print(f"{ind}  upstream=rank-0 bypass fires first  downstream=rank-last first")
        trs = measure_temporal(grade_data_list, Bypasses)
        any_p = False
        for tr in trs:
            if tr["upstream"] + tr["downstream"] + tr["unclear"] > 0:
                fstr = f"{tr['fraction']:+.4f}" if tr["fraction"] is not None else "N/A"
                print(f"{ind}  n={tr['n']:>2}:  up={tr['upstream']:>4}  "
                      f"dn={tr['downstream']:>4}  unc={tr['unclear']:>4}  frac={fstr}")
                any_p = True
        if not any_p:
            print(f"{ind}  (no non-confluent histories at this level)")

    if "thermodynamics" in active:
        thermo = measure_thermodynamics(grade_data_list, Bypasses)
        if thermo:
            print(f"\n{ind}--- Thermodynamics  (E=settlement depth, g=endpoint count) ---")
            # Find C peak
            c_peak  = max(thermo, key=lambda r: r["C"])
            f_at_1  = next((r for r in thermo if abs(r["beta"] - 1.0) < 0.03), None)
            print(f"{ind}  C(beta) peaks at beta={c_peak['beta']:.2f}"
                  f"  (C={c_peak['C']:.4f}  E_mean={c_peak['E']:.3f}  S={c_peak['S']:.3f})")
            # Print table around peak
            lo = max(0, thermo.index(c_peak) - 4)
            hi = min(len(thermo), thermo.index(c_peak) + 5)
            print(f"{ind}  {'beta':>6}  {'Z':>10}  {'F':>8}  {'E':>7}  {'C':>8}  {'S':>8}")
            for r in thermo[lo:hi]:
                marker = "  <-- peak" if r is c_peak else ""
                print(f"{ind}  {r['beta']:>6.3f}  {r['Z']:>10.3f}"
                      f"  {r['F']:>8.3f}  {r['E']:>7.3f}"
                      f"  {r['C']:>8.4f}  {r['S']:>8.3f}{marker}")

    if "defects" in active and all_defect_pairs:
        print(f"\n{ind}--- Cumulative defect network (all grades) ---")
        dnet = measure_defect_geometry(all_defect_pairs)
        print(f"{ind}  V={dnet['V']}  E={dnet['E']}  chi={dnet['chi']}"
              f"  diam={dnet['diameter']}  cluster={dnet['clustering']:.3f}"
              f"  deg_mean={dnet['deg_mean']:.2f}  comp={dnet['components'][:6]}")

    if "sequences" in active and len(poss_seq) >= 4:
        print(f"\n{ind}--- Sequence recognition ---")
        nc_seq = [sum(1 for ep in gd.endpoints.values() if len(ep) > 1)
                  for gd in grade_data_list]
        for name, seq in [("Det", det_seq), ("Poss", poss_seq), ("nc", nc_seq)]:
            hits   = recognize_sequence(seq)
            ratios = [round(seq[i]/seq[i-1], 4) for i in range(1, len(seq))
                      if seq[i-1] > 0 and seq[i] > 0]
            print(f"{ind}  {name}: {seq[:8]}  ratios:{ratios[-4:]}")
            for h in hits:
                print(f"{ind}    => {h}")

    return next_G, next_Bp

# ---------------------------------------------------------------------------

def main():
    p = argparse.ArgumentParser(description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--generators",       nargs="+", default=["a", "b", "c"])
    p.add_argument("--bypass",           nargs="+", default=["a>b", "b>c"], metavar="X>Y")
    p.add_argument("--seed-grade",       type=int,  default=2)
    p.add_argument("--grades-per-level", type=int,  default=6)
    p.add_argument("--max-levels",       type=int,  default=3)
    p.add_argument("--measures",         nargs="+",
                   default=["positions", "dag", "defects", "thermodynamics",
                             "temporal", "entropy", "boundary", "entanglement", "tower"],
                   metavar="MEASURE",
                   help="Available: positions dag defects thermodynamics temporal "
                        "entropy boundary entanglement tower sequences")
    args = p.parse_args()

    Bypasses = set()
    for s in args.bypass:
        a, b = s.split(">", 1)
        Bypasses.add((a.strip(), b.strip()))
    G      = list(args.generators)
    active = set(args.measures)

    print("VOID FAILURE PHYSICS ENGINE")
    print(f"G = {G}  Bypasses = {sorted(Bypasses)}")
    print(f"LevelOperator: Level 1 bypass derived from commutation in Level 0 dynamics")
    print(f"               (D1 bypasses D2  iff  D1+D2 ->* D2+D1 in parent DPM)")

    try:
        level          = 0
        prev_structure = None
        while level < args.max_levels:
            next_G, next_Bp = run_level(
                level, G, Bypasses,
                seed_grade   = args.seed_grade,
                max_grade    = args.grades_per_level,
                max_levels   = args.max_levels,
                active       = active,
            )

            if next_G is None or len(next_G) < 2:
                print(f"\nLevelOperator: no generators seeded at level {level}.")
                break

            new_structure = (len(next_G), len(next_Bp))
            if prev_structure == new_structure:
                print(f"\nLevelOperator: fixed point  |G|={new_structure[0]}"
                      f"  |Bypasses|={new_structure[1]}")
                run_level(level + 1, next_G, next_Bp,
                          seed_grade   = args.seed_grade,
                          max_grade    = args.grades_per_level,
                          max_levels   = args.max_levels,
                          active       = active)
                break

            prev_structure = new_structure
            G, Bypasses    = next_G, next_Bp
            level += 1

        print(f"\nTower complete.")

    except KeyboardInterrupt:
        print(f"\nStopped.")

if __name__ == "__main__":
    main()
