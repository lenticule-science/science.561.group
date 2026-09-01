#!/usr/bin/env python3
"""
End-to-end benchmark pipeline orchestrator.

Runs a settling specification through the eight-step computation protocol
(narratives/computation-protocol.md), composing the four canonical tools:

  1. tools/regime-classifier/      — step 2 (regime + κ)
  2. tools/anderson-putnam-cohomology/ — step 3 (Ab-valued H¹)
  3. tools/d-frame-cohomology/     — step 4 (d-frame H¹ with per-firing D_μ)
  4. tools/verdier-dual/           — step 5 (cosheaf-side H_1 + duality check)
  5. tools/strong-mld-orbits/      — step 6 (composed-duality orbit type)

Outputs a markdown report at tools/build/benchmark-<name>.md conforming to the
protocol template, ready to be moved into examples/benchmark-N-<name>.md once
acceptance criteria are met.

Usage:
  python3 run.py --substitution fibonacci
  python3 run.py --substitution thue-morse
  python3 run.py --all
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent.parent
TOOLS = ROOT / "tools"
OUT = ROOT / "tools" / "build"

KNOWN_SUBSTITUTIONS = ["fibonacci", "thue-morse", "padovan", "tribonacci", "tetranacci"]


def run_tool(tool: str, args: list[str]) -> str:
    """Run a corpus tool and capture its stdout."""
    cmd = ["python3", str(TOOLS / tool)] + args
    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode != 0:
        return f"[ERROR running {tool}: {result.stderr}]"
    return result.stdout


def benchmark(substitution: str) -> str:
    """Run the full pipeline on a named substitution and produce a markdown report."""
    sub_arg = ["--substitution", substitution]

    regime = run_tool("regime-classifier/classify.py", sub_arg)
    ab_cohom = run_tool("anderson-putnam-cohomology/compute.py", [substitution])
    d_frame = run_tool("d-frame-cohomology/compute.py", sub_arg)
    verdier = run_tool("verdier-dual/compute.py", sub_arg)
    orbits = run_tool("strong-mld-orbits/compute.py", sub_arg)

    lines: list[str] = []
    lines.append(f"# Benchmark: {substitution}")
    lines.append("")
    lines.append("Computed via the canonical pipeline (`tools/run-benchmark/run.py`), conforming to the [computation protocol](../narratives/computation-protocol.md).")
    lines.append("")

    lines.append("## Step 1: Specification")
    lines.append("")
    lines.append(f"Named substitution: `{substitution}`. The closure rule is the standard substitution-rule encoding of the named case (see [step-$n$ substitution rule](../objects/step-n-substitution-rule.md)). Base $E = \\omega_1$, predicate set as defined by the alphabet, predicate category discrete on the alphabet, settling bound $\\lambda = \\omega_1 + 1$.")
    lines.append("")

    lines.append("## Step 2: Regime classification")
    lines.append("")
    lines.append("```")
    lines.append(regime.rstrip())
    lines.append("```")
    lines.append("")

    lines.append("## Step 3: $\\mathbf{Ab}$-valued cohomology")
    lines.append("")
    lines.append("```")
    lines.append(ab_cohom.rstrip())
    lines.append("```")
    lines.append("")

    lines.append("## Step 4: d-frame cohomology")
    lines.append("")
    lines.append("```")
    lines.append(d_frame.rstrip())
    lines.append("```")
    lines.append("")

    lines.append("## Step 5: Verdier dual")
    lines.append("")
    lines.append("```")
    lines.append(verdier.rstrip())
    lines.append("```")
    lines.append("")

    lines.append("## Step 6: Strong-MLD orbit type")
    lines.append("")
    lines.append("```")
    lines.append(orbits.rstrip())
    lines.append("```")
    lines.append("")

    lines.append("## Step 7: Literature comparison")
    lines.append("")
    lines.append("*To be filled in: agreement with Anderson-Putnam et al.'s computed cohomology for this substitution.*")
    lines.append("")

    lines.append("## Step 8: What's new")
    lines.append("")
    lines.append("*To be filled in: which classification refinements does the d-frame structure produce, beyond the shadow?*")
    lines.append("")

    lines.append("## Acceptance criteria checklist")
    lines.append("")
    lines.append("- [ ] Reproducibility: this report regenerates from `tools/run-benchmark/run.py --substitution " + substitution + "`.")
    lines.append("- [ ] Triangulation: at least two independent computations agree.")
    lines.append("- [ ] Literature alignment: agreement with the substitution-tilings literature (step 7).")
    lines.append("- [ ] Distinctness or admission: explicit statement of d-frame's contribution (step 8).")

    return "\n".join(lines) + "\n"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--substitution", help="named substitution to benchmark")
    ap.add_argument("--all", action="store_true", help="benchmark all known substitutions")
    args = ap.parse_args()

    OUT.mkdir(parents=True, exist_ok=True)

    if args.all:
        for sub in KNOWN_SUBSTITUTIONS:
            report = benchmark(sub)
            out_path = OUT / f"benchmark-{sub}.md"
            out_path.write_text(report)
            print(f"  → {out_path.relative_to(ROOT)}")
        return 0

    if not args.substitution:
        ap.print_help()
        return 1
    if args.substitution not in KNOWN_SUBSTITUTIONS:
        print(f"Unknown: {args.substitution}", file=sys.stderr)
        print(f"Available: {KNOWN_SUBSTITUTIONS}", file=sys.stderr)
        return 1

    report = benchmark(args.substitution)
    out_path = OUT / f"benchmark-{args.substitution}.md"
    out_path.write_text(report)
    print(f"  → {out_path.relative_to(ROOT)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
