#!/usr/bin/env python3
"""
Encode a multi-agent epistemic Kripke frame as a corpus settling.

Bridge tool for benchmark case 5 (epistemic Kripke frame). Takes a Kripke
frame specification — worlds, agents with accessibility relations, atomic
propositions with bilattice-valued initial valuation — and runs the
paraconsistent epistemic closure to a fixed point. Reports the resulting
settling's regime, closure ordinal, and per-firing classification suitable
for downstream framework analysis.

The encoding:

  - **Entity set** E = W (worlds).
  - **Predicate set** Π = {atomic propositions p} ∪ {K_i p for each agent i, prop p}
  - **Predication-cell** (w, w, p) carries the bilattice value v(w, p).
  - **Closure rule** (per S5 with paraconsistent values):
      K_i p at world w :=  bilattice knowledge-meet of v(w', p) over all
                           R_i-accessible worlds w'.

  - **Settling stage τ** = K-iteration depth. At τ=0, only the atomic V is
    settled. At τ=1, K_i p facts settle. At τ=2, K_i K_j p facts. Etc.

For finite frames, the closure terminates at finite τ (strict regime). For
frames with infinitely many worlds or non-S5 accessibility, settling can
reach Scott-continuous (κ=ω) or beyond.

Bilattice values: t (true), f (false), top (paraconsistent: both), bot (no
evidence).

Usage:
  python3 encode.py --example two-agent-disagreement
  python3 encode.py --spec '{"worlds": [...], ...}' (JSON inline)
"""
from __future__ import annotations

import argparse
import json
import sys
from typing import Optional


# Bilattice {bot, t, f, top} with knowledge meet (information-glb) and truth meet
# (truth-conjunction). For epistemic K_i: knowledge-meet over accessible worlds —
# i agrees with x iff all accessible worlds support x consistently.
#
# Knowledge meet (≤_k): bot is the knowledge minimum; top is the knowledge maximum.
#   meet_k(t, f) = bot   (no consensus on truth value, hence no information)
#   meet_k(t, t) = t
#   meet_k(t, top) = t   (top is "more informative" in knowledge order)
#   meet_k(t, bot) = bot
#   meet_k(top, top) = top
KNOWLEDGE_ORDER = {
    "bot": 0,
    "t":   1,
    "f":   1,
    "top": 2,
}


def knowledge_meet(values: list[str]) -> str:
    """Bilattice knowledge meet (≤_k-glb) of a list of bilattice values.
    The greatest lower bound under the knowledge order, where:

      bot ≤_k t,  bot ≤_k f,  t ≤_k top,  f ≤_k top
      (bot is min, top is max, t and f are incomparable middle elements)

    For S5 epistemic logic: K_i p at w = knowledge-meet of v(w', p) over
    R_i-accessible w'. The meet captures the information common to all
    worlds i considers possible.
    """
    if not values:
        return "top"  # vacuous meet (over empty set) is the max element

    # Reduce step by step with binary meet, exploiting commutativity.
    result = values[0]
    for v in values[1:]:
        result = _binary_meet(result, v)
        if result == "bot":
            return "bot"  # absorbing element, short-circuit
    return result


def _binary_meet(x: str, y: str) -> str:
    """Binary knowledge-order meet."""
    if x == y:
        return x
    if x == "bot" or y == "bot":
        return "bot"
    if x == "top":
        return y
    if y == "top":
        return x
    # x and y are both in {t, f} and not equal — incomparable, meet is bot.
    return "bot"


def parse_accessibility(acc_list: list) -> dict[str, set]:
    """Convert accessibility list of (from, to) pairs into a per-world neighbor map."""
    out: dict[str, set] = {}
    for pair in acc_list:
        w_from, w_to = pair
        out.setdefault(w_from, set()).add(w_to)
    return out


def epistemic_closure(spec: dict) -> dict:
    """Run the paraconsistent epistemic closure on a Kripke frame to fixed point.

    Returns the settling data: per-world per-prop value at each iteration depth,
    closure ordinal, regime classification.
    """
    worlds = spec["worlds"]
    agents = spec["agents"]
    accessibility = {
        ag: parse_accessibility(spec["accessibility"][ag])
        for ag in agents
    }
    atoms = spec["atoms"]
    initial_valuation = spec["valuation"]

    # Build the full valuation. Predicates Π = atoms + {K_i p for each i, p}.
    # We track v[stage][world][predicate] -> bilattice value.
    valuation: list[dict[str, dict[str, str]]] = []

    # Stage 0: atomic valuation only.
    stage_0 = {w: dict(initial_valuation[w]) for w in worlds}
    # Initialise K_i p as "bot" (no information yet).
    for w in worlds:
        for ag in agents:
            for p in atoms:
                stage_0[w][f"K_{ag}_{p}"] = "bot"
    valuation.append(stage_0)

    firings_per_stage: list[list[tuple[str, str]]] = [[]]

    # Iterate until fixed point (or max_stages safety cap).
    max_stages = 100
    for stage in range(1, max_stages):
        prev = valuation[-1]
        new = {w: dict(prev[w]) for w in worlds}
        firings: list[tuple[str, str]] = []

        # Compute K_i p for each agent, prop, world.
        for ag in agents:
            for p in atoms:
                key = f"K_{ag}_{p}"
                for w in worlds:
                    accessible = accessibility[ag].get(w, set())
                    if not accessible:
                        new_value = "top"  # vacuous
                    else:
                        # Look at the value of *p* (atomic) AND any deeper K facts
                        # at the previous stage in the accessible worlds.
                        accessible_values = [prev[w_acc][p] for w_acc in accessible]
                        new_value = knowledge_meet(accessible_values)
                    if new[w][key] != new_value:
                        firings.append((w, key))
                        new[w][key] = new_value

        # Also iterate K_i K_j p facts: for higher-order knowledge.
        # We handle this by iterating the closure long enough that all
        # K_i K_j K_k ... p compositions stabilise. The above loop only does
        # depth-1 K facts. For higher depth, run again with K facts available
        # as inputs.
        for ag in agents:
            for p in atoms:
                # Higher-order: K_ag of every existing K_other_p?
                for other_ag in agents:
                    inner_key = f"K_{other_ag}_{p}"
                    outer_key = f"K_{ag}_{inner_key}"
                    if outer_key not in new[worlds[0]]:
                        for w in worlds:
                            new[w][outer_key] = "bot"
                    for w in worlds:
                        accessible = accessibility[ag].get(w, set())
                        if not accessible:
                            new_value = "top"
                        else:
                            accessible_values = [prev[w_acc].get(inner_key, "bot")
                                                 for w_acc in accessible]
                            new_value = knowledge_meet(accessible_values)
                        old = new[w].get(outer_key, "bot")
                        if old != new_value:
                            firings.append((w, outer_key))
                            new[w][outer_key] = new_value

        valuation.append(new)
        firings_per_stage.append(firings)

        # Fixed-point check: no new firings = converged.
        if not firings:
            break

    closure_ordinal = len(valuation) - 1  # last stage with new firings + 1
    # Strip the final no-firings stage:
    if not firings_per_stage[-1]:
        valuation = valuation[:-1]
        firings_per_stage = firings_per_stage[:-1]
        closure_ordinal -= 1

    # Classify regime: finite closure ordinal => strict (κ < ω).
    if closure_ordinal < 100:
        regime = "strict"
        kappa = f"{closure_ordinal} (finite)"
    else:
        regime = "needs-investigation"
        kappa = "did not converge in 100 stages"

    # Per-firing classification: bilattice value at the firing point.
    firings_classified: list[dict] = []
    for stage, firings in enumerate(firings_per_stage):
        for (w, pred) in firings:
            value = valuation[stage][w][pred]
            firing_type = (
                "truth-only" if value == "t"
                else "falsity-only" if value == "f"
                else "⊤-firing" if value == "top"
                else "⊥-firing"
            )
            firings_classified.append({
                "stage": stage,
                "world": w,
                "predicate": pred,
                "value": value,
                "firing_type": firing_type,
            })

    counts = {"truth-only": 0, "falsity-only": 0, "⊤-firing": 0, "⊥-firing": 0}
    for f in firings_classified:
        counts[f["firing_type"]] += 1

    return {
        "worlds": worlds,
        "agents": agents,
        "atoms": atoms,
        "closure_ordinal": closure_ordinal,
        "regime": regime,
        "kappa": kappa,
        "stage_count": len(valuation),
        "total_firings": len(firings_classified),
        "firing_type_counts": counts,
        "firings": firings_classified,
        "final_valuation": valuation[-1] if valuation else {},
    }


# Example specifications.
EXAMPLES = {
    "two-agent-disagreement": {
        "worlds": ["w1", "w2"],
        "agents": ["alice", "bob"],
        "accessibility": {
            "alice": [["w1", "w1"], ["w1", "w2"], ["w2", "w1"], ["w2", "w2"]],  # Alice cannot distinguish
            "bob":   [["w1", "w1"], ["w2", "w2"]],  # Bob can distinguish
        },
        "atoms": ["p"],
        "valuation": {
            "w1": {"p": "t"},
            "w2": {"p": "f"},
        },
    },
    "three-agent-paraconsistent-witness": {
        "worlds": ["w1", "w2", "w3"],
        "agents": ["alice", "bob", "carol"],
        "accessibility": {
            "alice": [["w1", "w2"], ["w2", "w1"], ["w3", "w3"],
                      ["w1", "w1"], ["w2", "w2"]],
            "bob":   [["w1", "w3"], ["w3", "w1"], ["w2", "w2"],
                      ["w1", "w1"], ["w3", "w3"]],
            "carol": [["w1", "w1"], ["w2", "w2"], ["w3", "w3"]],
        },
        "atoms": ["p"],
        "valuation": {
            "w1": {"p": "t"},
            "w2": {"p": "f"},
            "w3": {"p": "top"},  # paraconsistent witness world
        },
    },
}


def report(result: dict) -> str:
    lines: list[str] = []
    lines.append("=== Kripke frame as settling ===")
    lines.append(f"Worlds:       {result['worlds']}")
    lines.append(f"Agents:       {result['agents']}")
    lines.append(f"Atoms:        {result['atoms']}")
    lines.append("")
    lines.append(f"Closure ordinal: κ = {result['kappa']}")
    lines.append(f"Regime:          {result['regime']}")
    lines.append(f"Total firings:   {result['total_firings']}")
    lines.append("")
    lines.append("Firing-type counts:")
    for ft, c in result["firing_type_counts"].items():
        lines.append(f"  {ft:14}: {c}")
    lines.append("")
    if result["total_firings"] <= 30:
        lines.append("Firing log (per-stage):")
        for f in result["firings"]:
            lines.append(f"  τ={f['stage']:2}  {f['world']:6}  {f['predicate']:30}  → {f['value']:6}  ({f['firing_type']})")
    lines.append("")
    if result["final_valuation"] and len(result["worlds"]) <= 5:
        lines.append("Final valuation at fixed point:")
        for w in result["worlds"]:
            preds = result["final_valuation"][w]
            for k, v in preds.items():
                if v != "bot":  # filter out trivial entries
                    lines.append(f"  v({w}, {k}) = {v}")
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

    result = epistemic_closure(spec)
    print(report(result))
    return 0


if __name__ == "__main__":
    sys.exit(main())
