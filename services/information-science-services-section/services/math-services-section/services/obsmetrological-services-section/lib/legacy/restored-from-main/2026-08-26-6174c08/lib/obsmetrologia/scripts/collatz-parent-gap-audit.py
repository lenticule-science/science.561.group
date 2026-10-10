#!/usr/bin/env python3
"""Finite audit for the Collatz parent-barrier residue gap.

This script mirrors the Lean definitions in
`Obsmetrologia/Closure/Collatz/{AffineTrace,FirstPassage,SemigroupGap,ResidueGap}.lean`.
It enumerates parent-barrier prefixes through a bounded parent-prefix length and
checks the residue form of the gap:

    C < D * r, where D = 2*B - A, M = 2*B, and D*r == C mod M.

It also reports the exact carry quotient (D*r - C) / M and checks the
proved-equivalent quotient-positivity face of the same lock.

The same residue `r` is the least representative of the first-passage cylinder
`pE`. The audit therefore also checks the proved-equivalent bad-cylinder face:
`r` must realize `pE`, and its first-passage iterate must descend.

The default bound is parent-prefix length 28, which gives 1,166,059 parent
barriers and 1,166,057 nontrivial checks.
"""

from __future__ import annotations

import argparse
import json
import sys
import time
from pathlib import Path


DEFAULT_MAX_DEPTH = 28
EXPECTED_PARENT_BARRIERS_AT_28 = 1_166_059
EXPECTED_NONTRIVIAL_CHECKS_AT_28 = 1_166_057
DEFAULT_CLOSEST_COUNT = 10


def iter_next_frontier(frontier: list[tuple[int, int, int, str]]) -> list[tuple[int, int, int, str]]:
    """Extend active noncontracting prefixes by `E` and `O`."""
    next_frontier: list[tuple[int, int, int, str]] = []
    for A, B, C, word in frontier:
        even = (A, 2 * B, C, f"{word}E")
        if even[1] <= even[0]:
            next_frontier.append(even)

        odd = (3 * A, 2 * B, 3 * C + B, f"{word}O")
        if odd[1] <= odd[0]:
            next_frontier.append(odd)
    return next_frontier


def is_trivial_parent_barrier(depth: int, A: int, B: int, C: int) -> bool:
    """The two terminal-adjacent parent barriers are `[]` and `[O]`."""
    return depth == 0 or (depth == 1 and A == 3 and B == 2 and C == 1)


def step(seed: int) -> int:
    """The accelerated Collatz step used by the Lean `step` definition."""
    if seed % 2 == 0:
        return seed // 2
    return (3 * seed + 1) // 2


def branch(seed: int) -> str:
    """The branch letter read by the Lean `branch` definition."""
    return "E" if seed % 2 == 0 else "O"


def follows_word(seed: int, word: str) -> tuple[bool, int, str]:
    """Run `seed` through `word`, returning realization status, image, and observed word."""
    current = seed
    observed: list[str] = []
    ok = True
    for letter in word:
        actual = branch(current)
        observed.append(actual)
        if actual != letter:
            ok = False
        current = step(current)
    return ok, current, "".join(observed)


def record_closest(
    closest: list[dict[str, int | str]],
    candidate: dict[str, int | str],
    limit: int,
) -> None:
    """Keep the `limit` smallest positive margins seen so far."""
    if limit <= 0:
        return
    closest.append(candidate)
    closest.sort(key=lambda item: (item["margin"], item["depth"], item["word"]))
    del closest[limit:]


def audit(max_depth: int, closest_count: int) -> dict[str, int | float | list[int] | list[dict[str, int | str]]]:
    frontier = [(1, 1, 0, "")]
    parent_barriers = 0
    nontrivial_checked = 0
    parent_barriers_by_depth: list[int] = []
    nontrivial_checked_by_depth: list[int] = []
    closest_margins: list[dict[str, int | str]] = []
    violations: list[dict[str, int | str]] = []
    quotient_violations: list[dict[str, int | str]] = []
    quotient_consistency_violations: list[dict[str, int | str]] = []
    cylinder_realization_violations: list[dict[str, int | str]] = []
    bad_cylinder_violations: list[dict[str, int | str]] = []
    bad_cylinder_consistency_violations: list[dict[str, int | str]] = []
    started = time.monotonic()

    for depth in range(max_depth + 1):
        depth_parent_barriers = 0
        depth_nontrivial_checked = 0
        for A, B, C, word in frontier:
            if A >= 2 * B:
                continue

            parent_barriers += 1
            depth_parent_barriers += 1
            if is_trivial_parent_barrier(depth, A, B, C):
                continue

            nontrivial_checked += 1
            depth_nontrivial_checked += 1
            D = 2 * B - A
            M = 2 * B
            r = (C * pow(D, -1, M)) % M
            first_passage_word = f"{word}E"
            cylinder_ok, cylinder_image, observed_word = follows_word(r, first_passage_word)
            margin = D * r - C
            carry_quotient = max(margin, 0) // M
            margin_record = {
                "word": word,
                "first_passage_word": first_passage_word,
                "depth": depth,
                "A": A,
                "B": B,
                "C": C,
                "D": D,
                "M": M,
                "r": r,
                "cylinder_image": cylinder_image,
                "observed_word": observed_word,
                "margin": margin,
                "carry_quotient": carry_quotient,
            }
            quotient_positive = 0 < carry_quotient
            margin_positive = C < D * r
            cylinder_descends = cylinder_image < r
            bad_cylinder = not cylinder_descends
            if margin > 0:
                record_closest(closest_margins, margin_record, closest_count)
            if not cylinder_ok:
                cylinder_realization_violations.append(margin_record)
            if not margin_positive:
                violations.append(margin_record)
            if not quotient_positive:
                quotient_violations.append(margin_record)
            if margin_positive != quotient_positive:
                quotient_consistency_violations.append(margin_record)
            if bad_cylinder:
                bad_cylinder_violations.append(margin_record)
            if bad_cylinder != (not margin_positive):
                bad_cylinder_consistency_violations.append(margin_record)

        parent_barriers_by_depth.append(depth_parent_barriers)
        nontrivial_checked_by_depth.append(depth_nontrivial_checked)

        if depth < max_depth:
            frontier = iter_next_frontier(frontier)

    return {
        "max_parent_prefix_length": max_depth,
        "parent_barriers": parent_barriers,
        "parent_barriers_by_depth": parent_barriers_by_depth,
        "nontrivial_checked": nontrivial_checked,
        "nontrivial_checked_by_depth": nontrivial_checked_by_depth,
        "closest_positive_margins": closest_margins,
        "violations": violations,
        "quotient_violations": quotient_violations,
        "quotient_consistency_violations": quotient_consistency_violations,
        "cylinder_realization_violations": cylinder_realization_violations,
        "bad_cylinder_violations": bad_cylinder_violations,
        "bad_cylinder_consistency_violations": bad_cylinder_consistency_violations,
        "seconds": round(time.monotonic() - started, 3),
    }


def write_coverage(result: dict[str, int | float | list[int] | list[dict[str, int | str]]], out_dir: Path) -> None:
    out_dir.mkdir(parents=True, exist_ok=True)
    json_path = out_dir / "collatz-parent-gap-audit.json"
    markdown_path = out_dir / "collatz-parent-gap-audit.md"

    json_path.write_text(f"{json.dumps(result, indent=2, sort_keys=True)}\n", encoding="utf8")

    rows = [
        "| parent-prefix length | parent barriers | nontrivial checked |",
        "|---:|---:|---:|",
    ]
    parent_by_depth = result["parent_barriers_by_depth"]
    nontrivial_by_depth = result["nontrivial_checked_by_depth"]
    assert isinstance(parent_by_depth, list)
    assert isinstance(nontrivial_by_depth, list)
    for depth, (parent_count, nontrivial_count) in enumerate(zip(parent_by_depth, nontrivial_by_depth)):
        rows.append(f"| {depth} | {parent_count} | {nontrivial_count} |")

    closest_rows = [
        "| margin | quotient | depth | parent word | first passage | r | image | A | B | C | D | M |",
        "|---:|---:|---:|:---|:---|---:|---:|---:|---:|---:|---:|---:|",
    ]
    closest = result["closest_positive_margins"]
    assert isinstance(closest, list)
    for item in closest:
        closest_rows.append(
            f"| {item['margin']} | {item['carry_quotient']} | "
            f"{item['depth']} | `{item['word']}` | `{item['first_passage_word']}` | "
            f"{item['r']} | {item['cylinder_image']} | "
            f"{item['A']} | {item['B']} | "
            f"{item['C']} | {item['D']} | {item['M']} |"
        )

    markdown = [
        "# Collatz Parent-Gap Audit",
        "",
        f"- Max parent-prefix length: {result['max_parent_prefix_length']}",
        f"- Parent barriers: {result['parent_barriers']}",
        f"- Nontrivial checked: {result['nontrivial_checked']}",
        f"- Violations: {len(result['violations'])}",
        f"- Quotient violations: {len(result['quotient_violations'])}",
        f"- Quotient consistency violations: {len(result['quotient_consistency_violations'])}",
        f"- Cylinder realization violations: {len(result['cylinder_realization_violations'])}",
        f"- Bad-cylinder violations: {len(result['bad_cylinder_violations'])}",
        f"- Bad-cylinder consistency violations: {len(result['bad_cylinder_consistency_violations'])}",
        f"- Seconds: {result['seconds']}",
        "",
        "## Closest Positive Margins",
        "",
        *closest_rows,
        "",
        "## Counts By Depth",
        "",
        *rows,
        "",
    ]
    markdown_path.write_text("\n".join(markdown), encoding="utf8")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--max-depth", type=int, default=DEFAULT_MAX_DEPTH)
    parser.add_argument("--json", action="store_true")
    parser.add_argument("--no-default-expectations", action="store_true")
    parser.add_argument("--no-coverage", action="store_true")
    parser.add_argument("--coverage-dir", default="sites/docs/coverage")
    parser.add_argument("--closest-count", type=int, default=DEFAULT_CLOSEST_COUNT)
    args = parser.parse_args()

    result = audit(args.max_depth, args.closest_count)
    if not args.no_coverage:
        write_coverage(result, Path(args.coverage_dir))

    if args.json:
        print(json.dumps(result, indent=2, sort_keys=True))
    else:
        print(
            "max parent-prefix length:",
            result["max_parent_prefix_length"],
        )
        print("parent barriers:", result["parent_barriers"])
        print("nontrivial checked:", result["nontrivial_checked"])
        print("violations:", len(result["violations"]))
        print("quotient violations:", len(result["quotient_violations"]))
        print("quotient consistency violations:", len(result["quotient_consistency_violations"]))
        print("cylinder realization violations:", len(result["cylinder_realization_violations"]))
        print("bad-cylinder violations:", len(result["bad_cylinder_violations"]))
        print("bad-cylinder consistency violations:", len(result["bad_cylinder_consistency_violations"]))
        print("seconds:", result["seconds"])

    if (
        result["violations"]
        or result["quotient_violations"]
        or result["quotient_consistency_violations"]
        or result["cylinder_realization_violations"]
        or result["bad_cylinder_violations"]
        or result["bad_cylinder_consistency_violations"]
    ):
        return 1

    if not args.no_default_expectations and args.max_depth == DEFAULT_MAX_DEPTH:
        if result["parent_barriers"] != EXPECTED_PARENT_BARRIERS_AT_28:
            print("unexpected parent-barrier count", file=sys.stderr)
            return 1
        if result["nontrivial_checked"] != EXPECTED_NONTRIVIAL_CHECKS_AT_28:
            print("unexpected nontrivial-check count", file=sys.stderr)
            return 1

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
