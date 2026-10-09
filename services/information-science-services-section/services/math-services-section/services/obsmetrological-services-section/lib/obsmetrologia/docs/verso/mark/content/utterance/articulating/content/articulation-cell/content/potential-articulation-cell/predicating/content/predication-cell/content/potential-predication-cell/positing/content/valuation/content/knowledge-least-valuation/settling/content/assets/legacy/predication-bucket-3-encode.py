#!/usr/bin/env python3
"""
Encode a small CRDT system as a corpus settling.

Bridge tool for benchmark case 6 (CRDT convergence). Takes a CRDT specification
— replicas, operations applied at each, the merge function — and runs the
state-merging closure to a fixed point. Reports the resulting settling's
regime, closure ordinal, and per-firing d-frame structure.

The encoding:

  - **Entity set** E = R (replicas).
  - **Predicate set** Π = {keys k} (the keys / fields tracked by the CRDT).
  - **Predication-cell** (r, r, k) carries the bilattice value v(r, k).
  - **Closure rule**: replicas merge with each other under the CRDT's merge
    operation. For each pair (r, r'), at each stage, v(r, k) ⊔ v(r', k) is
    propagated (where ⊔ is the CRDT's merge — typically a join in a
    commutative monoid / semilattice).

Bilattice-valued CRDTs:
  - For boolean-valued CRDTs (e.g., G-Counter monotonic increments): bilattice
    value = t (set) or bot (unset).
  - For paraconsistent CRDTs (concurrent contradictory updates): bilattice
    value = top when conflicting, t/f for individual concurrent updates.

For typical CRDTs (G-Counter, OR-Set, LWW-Register), the merge operation is
*idempotent and commutative*, so the closure converges quickly — finite stages
in finite-replica systems (strict regime).

Usage:
  python3 encode.py --example two-replica-or-set
  python3 encode.py --example three-replica-paraconsistent-merge
"""
from __future__ import annotations

import argparse
import json
import sys


# Bilattice values used for CRDT state encoding:
#   t   = positive evidence / set / present
#   f   = negative evidence / removed (in OR-Set / tombstone)
#   top = concurrent conflicting updates from different replicas (paraconsistent)
#   bot = no evidence / no operation seen yet


def truth_join(values: list[str]) -> str:
    """Bilattice truth-join (≤_t-lub) — used for OR-Set-style CRDTs where
    multiple replicas can see different states.

    Truth order: f ≤_t bot, top ≤_t t (the usual Belnap arrangement, with
    bot/top in the middle). Actually for our use:
      f ≤_t bot, top ≤_t t                  (information-only)
      ≤_t-join: t > top, bot, f ; ...

    Wait — for CRDT merging the right operation is the *knowledge* join (≤_k-lub),
    which combines information. ≤_k: bot < t,f < top.
    ≤_k-join is information-union: any t-evidence + any f-evidence = top.
    """
    if not values:
        return "bot"
    result = values[0]
    for v in values[1:]:
        result = _binary_knowledge_join(result, v)
    return result


def _binary_knowledge_join(x: str, y: str) -> str:
    """Knowledge-order join (≤_k-lub) — the natural CRDT merge for paraconsistent
    state. Combines evidence: any combination produces top if both t and f are
    present; otherwise the more-informative value wins.

    ≤_k order: bot < t, bot < f, t < top, f < top.
    """
    if x == y:
        return x
    if x == "bot":
        return y
    if y == "bot":
        return x
    if x == "top" or y == "top":
        return "top"
    # x and y are both in {t, f} and not equal — they conflict, so top.
    return "top"


def parse_operations(ops: list) -> dict[str, dict[str, str]]:
    """Group operations by replica → {key: bilattice_value}."""
    out: dict[str, dict[str, str]] = {}
    for op in ops:
        replica, key, value = op
        out.setdefault(replica, {})[key] = value
    return out


def crdt_closure(spec: dict) -> dict:
    """Run the CRDT merge closure on a multi-replica system to fixed point."""
    replicas = spec["replicas"]
    keys = spec["keys"]
    initial_ops = spec["operations"]
    op_per_replica = parse_operations(initial_ops)

    # Initial state: each replica has only its own operations.
    state: list[dict[str, dict[str, str]]] = []
    initial_state: dict[str, dict[str, str]] = {}
    for r in replicas:
        replica_ops = op_per_replica.get(r, {})
        initial_state[r] = {k: replica_ops.get(k, "bot") for k in keys}
    state.append(initial_state)

    firings_per_stage: list[list[tuple[str, str]]] = [[]]

    # Merge rounds: each replica merges with all others.
    max_stages = 50
    for stage in range(1, max_stages):
        prev = state[-1]
        new = {r: dict(prev[r]) for r in replicas}
        firings: list[tuple[str, str]] = []

        for r in replicas:
            for k in keys:
                # Merge with all other replicas' current values.
                all_values = [prev[other][k] for other in replicas]
                merged = truth_join(all_values)
                if new[r][k] != merged:
                    firings.append((r, k))
                    new[r][k] = merged

        state.append(new)
        firings_per_stage.append(firings)

        if not firings:
            break

    closure_ordinal = len(state) - 1
    if not firings_per_stage[-1]:
        state = state[:-1]
        firings_per_stage = firings_per_stage[:-1]
        closure_ordinal -= 1

    if closure_ordinal < max_stages:
        regime = "strict"
        kappa = f"{closure_ordinal} (finite)"
    else:
        regime = "needs-investigation"
        kappa = f"did not converge in {max_stages} stages"

    # Classify firings by bilattice-value type.
    firings_classified: list[dict] = []
    for stage, firings in enumerate(firings_per_stage):
        for (r, k) in firings:
            value = state[stage][r][k]
            firing_type = (
                "truth-only" if value == "t"
                else "falsity-only" if value == "f"
                else "⊤-firing" if value == "top"
                else "⊥-firing"
            )
            firings_classified.append({
                "stage": stage,
                "replica": r,
                "key": k,
                "value": value,
                "firing_type": firing_type,
            })

    counts = {"truth-only": 0, "falsity-only": 0, "⊤-firing": 0, "⊥-firing": 0}
    for f in firings_classified:
        counts[f["firing_type"]] += 1

    return {
        "replicas": replicas,
        "keys": keys,
        "closure_ordinal": closure_ordinal,
        "regime": regime,
        "kappa": kappa,
        "stage_count": len(state),
        "total_firings": len(firings_classified),
        "firing_type_counts": counts,
        "firings": firings_classified,
        "final_state": state[-1] if state else {},
        "convergence": all(state[-1][r] == state[-1][replicas[0]] for r in replicas),
    }


# Example specifications.
EXAMPLES = {
    "two-replica-or-set": {
        # Two replicas; each adds different elements; they merge to consensus.
        "replicas": ["r1", "r2"],
        "keys": ["alice_in_set", "bob_in_set"],
        "operations": [
            ["r1", "alice_in_set", "t"],   # r1 adds alice
            ["r2", "bob_in_set", "t"],     # r2 adds bob
        ],
    },
    "three-replica-paraconsistent-merge": {
        # Three replicas, with one replica reporting a *conflict* (paraconsistent).
        # r1 says "p is true". r2 says "p is false". r3 has not seen anything.
        "replicas": ["r1", "r2", "r3"],
        "keys": ["p"],
        "operations": [
            ["r1", "p", "t"],
            ["r2", "p", "f"],
            # r3 has no operation: starts at bot.
        ],
    },
    "two-replica-tombstone-conflict": {
        # OR-Set style: one replica adds, the other removes.
        "replicas": ["r1", "r2"],
        "keys": ["alice"],
        "operations": [
            ["r1", "alice", "t"],   # add alice
            ["r2", "alice", "f"],   # remove alice (concurrently)
        ],
    },
}


def report(result: dict) -> str:
    lines: list[str] = []
    lines.append("=== CRDT system as settling ===")
    lines.append(f"Replicas: {result['replicas']}")
    lines.append(f"Keys:     {result['keys']}")
    lines.append("")
    lines.append(f"Closure ordinal: κ = {result['kappa']}")
    lines.append(f"Regime:          {result['regime']}")
    lines.append(f"Total firings:   {result['total_firings']}")
    lines.append(f"All replicas converged to same state: {result['convergence']}")
    lines.append("")
    lines.append("Firing-type counts:")
    for ft, c in result["firing_type_counts"].items():
        lines.append(f"  {ft:14}: {c}")
    lines.append("")
    if result["total_firings"] <= 30:
        lines.append("Firing log:")
        for f in result["firings"]:
            lines.append(f"  τ={f['stage']:2}  {f['replica']:6}  {f['key']:20}  → {f['value']:6}  ({f['firing_type']})")
    lines.append("")
    if result["final_state"]:
        lines.append("Final state at fixed point:")
        for r, kv in result["final_state"].items():
            for k, v in kv.items():
                if v != "bot":
                    lines.append(f"  v({r}, {k}) = {v}")

    # Tag whether convergence-with-paraconsistency is present:
    has_top = result["firing_type_counts"]["⊤-firing"] > 0
    if has_top:
        lines.append("")
        lines.append("⊤-firings detected: paraconsistent CRDT state — concurrent conflicting")
        lines.append("updates produced top values during convergence. The d-frame structure on")
        lines.append("H¹ would record these as consistency-fails-on-singleton-pair generators.")

    return "\n".join(lines)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--example", help="run a built-in example")
    ap.add_argument("--spec", help="JSON spec inline")
    ap.add_argument("--list", action="store_true", help="list built-in examples")
    args = ap.parse_args()

    if args.list:
        for name in EXAMPLES:
            print(f"  {name}")
        return 0

    if args.example:
        if args.example not in EXAMPLES:
            print(f"Unknown: {args.example}", file=sys.stderr)
            return 1
        spec = EXAMPLES[args.example]
    elif args.spec:
        spec = json.loads(args.spec)
    else:
        ap.print_help()
        return 1

    result = crdt_closure(spec)
    print(report(result))
    return 0


if __name__ == "__main__":
    sys.exit(main())
