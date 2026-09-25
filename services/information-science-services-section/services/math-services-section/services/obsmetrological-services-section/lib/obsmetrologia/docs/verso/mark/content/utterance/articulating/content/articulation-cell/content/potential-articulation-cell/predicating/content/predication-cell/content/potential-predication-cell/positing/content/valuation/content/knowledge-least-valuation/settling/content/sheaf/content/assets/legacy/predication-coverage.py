"""Computational-coverage report: which corpus notes have associated Python verifications.

Walks every per-note module to register decorators, then walks the corpus's
markdown directories (`theorems/`, `examples/`, `objects/`, `morphisms/`) and
reports:

- Total markdown notes per kind.
- Counts with computational verification (any `verifies` / `example_of` /
  `defines` link targeting that note).
- List of unverified theorems / examples — candidates for future computational
  backing.

Usage: `python -m predication_categories.coverage` (run from the chapter root,
or use `python -m predication_categories.coverage --root /path/to/chapter`).

The output complements `fars audit` (which surfaces structural risk in the
markdown dependency graph). Coverage surfaces the *computational-verification*
gap — places where the markdown asserts something but no Python checks it.
"""

from __future__ import annotations

import argparse
from collections import defaultdict
from pathlib import Path

from . import link as link_module
from .validate import force_register_all


KINDS_TO_REPORT = ("theorems", "examples", "objects", "morphisms")


def report_coverage(corpus_root: Path) -> dict[str, dict[str, int]]:
    """Compute computational coverage stats per markdown-note kind.

    Returns a dict like:
        {
            "theorems": {"total": 180, "verified": 6, "unverified": 174},
            "examples": {"total": 95, "verified": 1, "unverified": 94},
            ...
        }
    """
    force_register_all()
    targeted_slugs: set[str] = {link.target for link in link_module.all_links()}

    stats: dict[str, dict[str, int]] = {}
    unverified_per_kind: dict[str, list[str]] = {}

    for kind in KINDS_TO_REPORT:
        kind_dir = corpus_root / kind
        if not kind_dir.exists():
            continue
        notes = sorted(kind_dir.glob("*.md"))
        verified = []
        unverified = []
        for note_path in notes:
            slug = f"{kind}/{note_path.name}"
            if slug in targeted_slugs:
                verified.append(slug)
            else:
                unverified.append(slug)
        stats[kind] = {
            "total": len(notes),
            "verified": len(verified),
            "unverified": len(unverified),
        }
        unverified_per_kind[kind] = unverified

    return stats, unverified_per_kind


def render_markdown_report(
    stats: dict[str, dict[str, int]],
    unverified_per_kind: dict[str, list[str]],
    show_unverified: bool = False,
) -> str:
    """Render the coverage report as markdown."""
    lines = ["# Computational coverage", ""]
    lines.append("Per-kind counts of markdown notes with vs without registered Python verifications.")
    lines.append("")
    lines.append("| Kind | Total | Verified | % Verified |")
    lines.append("|---|---:|---:|---:|")
    for kind, s in stats.items():
        pct = (100.0 * s["verified"] / s["total"]) if s["total"] else 0.0
        lines.append(f"| `{kind}` | {s['total']} | {s['verified']} | {pct:.1f}% |")
    lines.append("")
    total_links = sum(s["verified"] for s in stats.values())
    total_notes = sum(s["total"] for s in stats.values())
    overall_pct = (100.0 * total_links / total_notes) if total_notes else 0.0
    lines.append(f"**Overall: {total_links} / {total_notes} = {overall_pct:.1f}% verified.**")

    if show_unverified:
        lines.append("")
        lines.append("## Unverified notes")
        for kind, slugs in unverified_per_kind.items():
            if not slugs:
                continue
            lines.append("")
            lines.append(f"### {kind}")
            for slug in slugs[:50]:
                lines.append(f"- `{slug}`")
            if len(slugs) > 50:
                lines.append(f"- _(... and {len(slugs) - 50} more)_")

    return "\n".join(lines) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--root",
        type=Path,
        default=None,
        help="Corpus chapter root directory (defaults to ../.. from this module)",
    )
    parser.add_argument(
        "--show-unverified",
        action="store_true",
        help="Include the full list of unverified notes (one per line)",
    )
    parser.add_argument(
        "--out",
        type=Path,
        default=None,
        help="Write the report to this file (default: stdout)",
    )
    args = parser.parse_args()

    if args.root is None:
        args.root = Path(__file__).parent.parent.parent

    stats, unverified = report_coverage(args.root)
    report = render_markdown_report(stats, unverified, show_unverified=args.show_unverified)

    if args.out:
        args.out.write_text(report, encoding="utf-8")
        print(f"Wrote coverage report to {args.out}")
    else:
        print(report)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
