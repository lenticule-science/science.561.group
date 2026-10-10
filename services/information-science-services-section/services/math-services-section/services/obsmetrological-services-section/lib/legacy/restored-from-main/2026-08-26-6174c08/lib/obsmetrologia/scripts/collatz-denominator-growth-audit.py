#!/usr/bin/env python3
"""Finite audit for the canonical Collatz denominator-growth bound.

This script mirrors the recurrence formalized in
`Obsmetrologia/Closure/Collatz/CanonicalBarrierSeed.lean`.

For the canonical front-loaded parent barrier with `a` odd steps and trailing
even count `b`, write

    P = 2^(a+b+1),  D = P - 3^a,  T = 2^(b+1).

The target denominator-growth inequality is `D >= T` for `a >= 3`.
The recurrence avoids recomputing `3^a`:

* same-`b` transition, when `P < 3D`:
    P' = 2P,  D' = 3D - P,  T' = T
* up-step transition, when `P >= 3D`:
    P' = 4P,  D' = P + 3D,  T' = 2T

The script also audits the sharpened same-step margin

    3D - P >= T,

which is equivalent in Lean to the next same-`b` denominator bound, and checks
that same-`b` transitions never occur consecutively.
"""

from __future__ import annotations

import argparse
import json
import time
from pathlib import Path
from typing import Any


DEFAULT_MAX_A = 200_000
DEFAULT_COVERAGE_DIR = "sites/docs/coverage"
DEFAULT_CLOSEST_COUNT = 10


def exact_or_bits(n: int) -> int | dict[str, int]:
    """Keep small exact integers readable and summarize huge ones by bit length."""
    if n.bit_length() <= 256:
        return n
    return {"bits": n.bit_length()}


def ratio_lt(num: int, den: int, best: tuple[int, int] | None) -> bool:
    if best is None:
        return True
    best_num, best_den = best
    return num * best_den < best_num * den


def summarize_state(a: int, b: int, P: int, D: int, T: int, **extra: int | str) -> dict[str, Any]:
    return {
        "a": a,
        "b": b,
        "P": exact_or_bits(P),
        "D": exact_or_bits(D),
        "T": exact_or_bits(T),
        "P_bits": P.bit_length(),
        "D_bits": D.bit_length(),
        "T_bits": T.bit_length(),
        **extra,
    }


def audit(max_a: int, closest_count: int) -> dict[str, Any]:
    started = time.monotonic()

    # a = 1: b = 0, P = 2^(1+0+1), D = P - 3, T = 2^(0+1).
    a = 1
    b = 0
    P = 4
    D = 1
    T = 2

    transitions = {"same": 0, "up": 0}
    denominator_violations: list[dict[str, Any]] = []
    same_margin_violations: list[dict[str, Any]] = []
    consecutive_same_violations: list[dict[str, Any]] = []
    closest_denominator_margins: list[dict[str, Any]] = []
    closest_same_margins: list[dict[str, Any]] = []

    best_denominator_ratio: tuple[int, int] | None = None
    best_same_ratio: tuple[int, int] | None = None
    previous_transition = "start"

    while a <= max_a:
        if a >= 3:
            denominator_margin = D - T
            if denominator_margin < 0:
                denominator_violations.append(
                    summarize_state(a, b, P, D, T, margin=denominator_margin)
                )
                break
            if ratio_lt(denominator_margin, T, best_denominator_ratio):
                best_denominator_ratio = (denominator_margin, T)
                closest_denominator_margins.append(
                    summarize_state(a, b, P, D, T, margin=exact_or_bits(denominator_margin))
                )
                closest_denominator_margins.sort(
                    key=lambda item: (
                        item["margin"] if isinstance(item["margin"], int) else 10**100,
                        item["a"],
                    )
                )
                del closest_denominator_margins[closest_count:]

        if a == max_a:
            break

        same_transition = P < 3 * D
        if same_transition:
            same_margin = 3 * D - P - T
            if previous_transition == "same":
                consecutive_same_violations.append(
                    summarize_state(a, b, P, D, T, margin=exact_or_bits(same_margin))
                )
            if same_margin < 0:
                same_margin_violations.append(
                    summarize_state(a, b, P, D, T, margin=same_margin)
                )
            if ratio_lt(same_margin, T, best_same_ratio):
                best_same_ratio = (same_margin, T)
                closest_same_margins.append(
                    summarize_state(a, b, P, D, T, margin=exact_or_bits(same_margin))
                )
                closest_same_margins.sort(
                    key=lambda item: (
                        item["margin"] if isinstance(item["margin"], int) else 10**100,
                        item["a"],
                    )
                )
                del closest_same_margins[closest_count:]

            D = 3 * D - P
            P = 2 * P
            transitions["same"] += 1
            previous_transition = "same"
        else:
            D = P + 3 * D
            P = 4 * P
            T *= 2
            b += 1
            transitions["up"] += 1
            previous_transition = "up"

        a += 1

    return {
        "max_a": max_a,
        "transitions": transitions,
        "denominator_violations": denominator_violations,
        "same_margin_violations": same_margin_violations,
        "consecutive_same_violations": consecutive_same_violations,
        "closest_denominator_margins": closest_denominator_margins,
        "closest_same_margins": closest_same_margins,
        "final_state": summarize_state(a, b, P, D, T),
        "seconds": round(time.monotonic() - started, 3),
    }


def write_coverage(result: dict[str, Any], out_dir: Path) -> None:
    out_dir.mkdir(parents=True, exist_ok=True)
    json_path = out_dir / "collatz-denominator-growth-audit.json"
    markdown_path = out_dir / "collatz-denominator-growth-audit.md"

    json_path.write_text(f"{json.dumps(result, indent=2, sort_keys=True)}\n", encoding="utf8")

    lines = [
        "# Collatz Denominator-Growth Audit",
        "",
        f"- Max `a`: {result['max_a']}",
        f"- Same transitions: {result['transitions']['same']}",
        f"- Up transitions: {result['transitions']['up']}",
        f"- Denominator-bound violations: {len(result['denominator_violations'])}",
        f"- Same-step margin violations: {len(result['same_margin_violations'])}",
        f"- Consecutive same-step violations: {len(result['consecutive_same_violations'])}",
        f"- Seconds: {result['seconds']}",
        "",
        "## Closest Denominator Margins",
        "",
        "| a | b | margin | D bits | T bits |",
        "|---:|---:|---:|---:|---:|",
    ]
    for item in result["closest_denominator_margins"]:
        lines.append(
            f"| {item['a']} | {item['b']} | {item['margin']} | {item['D_bits']} | {item['T_bits']} |"
        )
    lines.extend([
        "",
        "## Closest Same-Step Margins",
        "",
        "| a | b | margin | D bits | T bits |",
        "|---:|---:|---:|---:|---:|",
    ])
    for item in result["closest_same_margins"]:
        lines.append(
            f"| {item['a']} | {item['b']} | {item['margin']} | {item['D_bits']} | {item['T_bits']} |"
        )
    lines.append("")

    markdown_path.write_text("\n".join(lines), encoding="utf8")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--max-a", type=int, default=DEFAULT_MAX_A)
    parser.add_argument("--closest-count", type=int, default=DEFAULT_CLOSEST_COUNT)
    parser.add_argument("--json", action="store_true")
    parser.add_argument("--no-coverage", action="store_true")
    parser.add_argument("--coverage-dir", default=DEFAULT_COVERAGE_DIR)
    args = parser.parse_args()

    result = audit(args.max_a, args.closest_count)
    if not args.no_coverage:
        write_coverage(result, Path(args.coverage_dir))
    if args.json:
        print(json.dumps(result, indent=2, sort_keys=True))

    failed = (
        result["denominator_violations"]
        or result["same_margin_violations"]
        or result["consecutive_same_violations"]
    )
    return 1 if failed else 0


if __name__ == "__main__":
    raise SystemExit(main())
