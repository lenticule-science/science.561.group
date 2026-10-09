"""3-ary settling: causal triples with mechanism composition.

Setup:
- Alphabet Sigma = {0, 1, 2} (3 events).
- Cells: triples (s, o, m) in Sigma^3, 27 total. (s = cause, o = effect, m = mechanism.)
- Initial settling v_0: seed of known causal triples (bilattice value 't'); rest are bot.
- Closure rule (genuine 3-ary):
    if v(s, o, m_1) = t and v(o, q, m_2) = t,
    then v(s, q, (m_1 + m_2) mod 3) = t.
  (Mechanism composes as addition mod 3 — treats mechanism as Z/3.)

Track:
- Closure ordinal (iterations to fixed point)
- Firing pattern (which cells fire when)
- Final settling: how many cells become t
- Compared to binary projection: what would the binary transitive closure look like?
"""

from itertools import product

ALPHABET = [0, 1, 2]
N_EVENTS = len(ALPHABET)


def make_initial(seed_triples, sigma_size=N_EVENTS):
    """seed_triples: list of (s, o, m). Returns dict of all 27 cells, seeded ones True."""
    v = {}
    for s, o, m in product(range(sigma_size), repeat=3):
        v[(s, o, m)] = (s, o, m) in seed_triples
    return v


def closure_step_3ary(v, sigma_size=N_EVENTS):
    """One step of 3-ary causal-transitive closure with mechanism composition."""
    new_v = dict(v)
    fired = []
    for s, o, m1 in product(range(sigma_size), repeat=3):
        if not v[(s, o, m1)]:
            continue
        for q, m2 in product(range(sigma_size), repeat=2):
            if not v[(o, q, m2)]:
                continue
            m_new = (m1 + m2) % sigma_size
            if not new_v[(s, q, m_new)]:
                new_v[(s, q, m_new)] = True
                fired.append((s, q, m_new))
    return new_v, fired


def settle_3ary(v_0, max_iter=50):
    history = [(dict(v_0), [])]
    cur = v_0
    for k in range(max_iter):
        nxt, fired = closure_step_3ary(cur)
        history.append((dict(nxt), fired))
        if not fired:
            return nxt, history, k
        cur = nxt
    raise RuntimeError("Did not converge")


def closure_step_binary(v_bin, sigma_size=N_EVENTS):
    """One step of binary transitive closure on (s, o) — for comparison."""
    new_v = dict(v_bin)
    fired = []
    for s, o in product(range(sigma_size), repeat=2):
        if not v_bin[(s, o)]:
            continue
        for q in range(sigma_size):
            if v_bin[(o, q)] and not new_v[(s, q)]:
                new_v[(s, q)] = True
                fired.append((s, q))
    return new_v, fired


def settle_binary(seed_pairs, sigma_size=N_EVENTS, max_iter=50):
    v = {(s, o): (s, o) in seed_pairs for s, o in product(range(sigma_size), repeat=2)}
    history = [(dict(v), [])]
    cur = v
    for k in range(max_iter):
        nxt, fired = closure_step_binary(cur)
        history.append((dict(nxt), fired))
        if not fired:
            return nxt, history, k
        cur = nxt


def report(name, seed_triples):
    print(f"=== {name} ===")
    print(f"Seed triples: {seed_triples}")
    v_0 = make_initial(seed_triples)
    print(f"Cells with t in v_0: {sum(1 for x in v_0.values() if x)}")

    final, history, kappa = settle_3ary(v_0)
    print(f"\nClosure ordinal kappa = {kappa}")
    final_count = sum(1 for x in final.values() if x)
    print(f"Cells with t in v_kappa (3-ary): {final_count} / 27")

    print(f"\nFirings per iteration:")
    for k, (_, fired) in enumerate(history):
        if fired:
            print(f"  step {k}: {len(fired)} firings")

    # Binary projection: just (s, o) without mechanism.
    seed_pairs = list(set((s, o) for s, o, m in seed_triples))
    final_bin, history_bin, kappa_bin = settle_binary(seed_pairs)
    final_bin_count = sum(1 for x in final_bin.values() if x)
    print(f"\nBinary projection (s, o) closure:")
    print(f"  closure ordinal: {kappa_bin}")
    print(f"  cells with t: {final_bin_count} / 9")

    # The genuine 3-ary structure: are there triples (s, q, m) with m != "any" specific?
    triples_per_pair = {}
    for (s, o, m), val in final.items():
        if val:
            triples_per_pair.setdefault((s, o), []).append(m)
    print(f"\nMechanism diversity per (s, o)-pair (in v_kappa):")
    diverse = 0
    for sopair, ms in sorted(triples_per_pair.items()):
        if len(ms) > 1:
            diverse += 1
            print(f"  ({sopair[0]}, {sopair[1]}): mechanisms {sorted(ms)}")
    if diverse == 0:
        print(f"  no pair has multiple mechanisms (suggests arity-collapse)")

    # Cohomological-rank-flavored measurement:
    # rank H^1 ~ number of NSC firings.
    # In strict regime, H^1 = 0 trivially. But we can count distinct cell-types reached.
    cell_types_reached = sum(1 for x in final.values() if x)
    print(f"\nCohomological precursor: cells reached = {cell_types_reached}/27 (3-ary), {final_bin_count}/9 (binary)")
    print(f"  Ratio: {cell_types_reached / final_bin_count:.2f}x more 3-ary cells than binary cells")
    print()


if __name__ == "__main__":
    # Case 1: Single seed triple — minimal start.
    report("Single seed (0, 1, 1)", [(0, 1, 1)])

    # Case 2: Two seeds enabling composition.
    report("Two seeds (0, 1, 1), (1, 2, 1)", [(0, 1, 1), (1, 2, 1)])

    # Case 3: Cycle-generating seeds.
    report("Cyclic seeds (0, 1, 1), (1, 2, 1), (2, 0, 1)",
           [(0, 1, 1), (1, 2, 1), (2, 0, 1)])

    # Case 4: Multi-mechanism seed.
    report("Multi-mechanism (0, 1, 0), (0, 1, 1), (1, 2, 1)",
           [(0, 1, 0), (0, 1, 1), (1, 2, 1)])

    # Case 5: Full 9 binary seeds, all with mechanism 0 — should generate all (s, o, 0).
    full_pairs = [(s, o, 0) for s, o in product(range(3), repeat=2) if s != o]
    report("All directed binary seeds (mechanism 0)", full_pairs)
