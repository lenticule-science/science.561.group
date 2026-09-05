"""Dependency-graph audit.

Walks every markdown note in this subtheory's note-type directories,
extracts the `depends-on:` list, and resolves each entry as either:

- a bare slug, looked up locally by globbing `*/<slug>.md` under the
  chapter root; or
- a relative path (containing `/`), checked for existence relative to
  the note's own location.

Then runs cycle detection over the local-slug edges and orphan
detection (notes with no inbound or outbound local dependency edges).

Reports unresolved entries, cycles, and orphans.

Usage (from `tools/`): `python -m dependency_audit.audit`
"""

from __future__ import annotations

import re
import sys
from pathlib import Path

CORPUS_DIRS = (
    "concepts",
    "objects",
    "morphisms",
    "theorems",
    "narratives",
    "questions",
    "examples",
    "references",
)

ORPHAN_EXEMPT_DIRS = {"references"}


def chapter_root() -> Path:
    return Path(__file__).parent.parent.parent


_FRONTMATTER_RE = re.compile(r"^---\n(.*?)\n---", re.DOTALL)
_LIST_INLINE_RE = re.compile(r"^\[(.*)\]$")


def parse_depends_on(text: str) -> list[str]:
    match = _FRONTMATTER_RE.match(text)
    if not match:
        return []
    fm_text = match.group(1)
    lines = fm_text.splitlines()
    depends: list[str] = []
    in_block = False
    for line in lines:
        if in_block:
            stripped = line.strip()
            if stripped.startswith("- "):
                value = stripped[2:].strip()
                if value.startswith('"') and value.endswith('"'):
                    value = value[1:-1]
                depends.append(value)
                continue
            if line and not line.startswith(" "):
                in_block = False
        if line.startswith("depends-on:"):
            rest = line[len("depends-on:"):].strip()
            if not rest:
                in_block = True
            else:
                inline = _LIST_INLINE_RE.match(rest)
                if inline:
                    items = [
                        item.strip().strip('"').strip("'")
                        for item in inline.group(1).split(",")
                    ]
                    depends.extend(item for item in items if item)
    return depends


def resolve_local_slug(slug: str, root: Path) -> Path | None:
    for sub in CORPUS_DIRS:
        candidate = root / sub / f"{slug}.md"
        if candidate.exists():
            return candidate
    return None


def collect_notes(root: Path) -> list[tuple[Path, str, str]]:
    """Return list of (path, sub, slug) for all corpus notes."""
    out: list[tuple[Path, str, str]] = []
    for sub in CORPUS_DIRS:
        for path in (root / sub).glob("*.md"):
            out.append((path, sub, path.stem))
    return out


def audit_resolution(notes, root: Path) -> tuple[list[str], dict[str, set[str]]]:
    """Resolve each note's depends-on entries; return (errors, local-edges)."""
    errors: list[str] = []
    edges: dict[str, set[str]] = {slug: set() for _, _, slug in notes}
    for path, _sub, slug in notes:
        depends = parse_depends_on(path.read_text())
        for entry in depends:
            if "/" in entry:
                target = (path.parent / entry).resolve()
                if not target.exists():
                    errors.append(
                        f"{path.relative_to(root)}: depends-on path missing: {entry}"
                    )
            else:
                resolved = resolve_local_slug(entry, root)
                if resolved is None:
                    errors.append(
                        f"{path.relative_to(root)}: depends-on slug not "
                        f"found in subtheory: {entry}"
                    )
                else:
                    edges[slug].add(entry)
    return errors, edges


def detect_cycles(edges: dict[str, set[str]]) -> list[list[str]]:
    """Return list of cycles found in the local-edge directed graph."""
    WHITE, GRAY, BLACK = 0, 1, 2
    color = {n: WHITE for n in edges}
    cycles: list[list[str]] = []
    stack: list[str] = []

    def visit(n: str) -> None:
        color[n] = GRAY
        stack.append(n)
        for m in sorted(edges.get(n, ())):
            if color.get(m, WHITE) == GRAY:
                idx = stack.index(m) if m in stack else 0
                cycles.append(stack[idx:] + [m])
            elif color.get(m, WHITE) == WHITE:
                visit(m)
        stack.pop()
        color[n] = BLACK

    for n in sorted(edges):
        if color[n] == WHITE:
            visit(n)
    return cycles


def detect_orphans(notes, edges: dict[str, set[str]]) -> list[str]:
    """A note is an orphan if it has no outbound and no inbound local edges,
    and it lives in a non-exempt directory."""
    inbound: dict[str, int] = {n: 0 for n in edges}
    for src, targets in edges.items():
        for t in targets:
            inbound[t] = inbound.get(t, 0) + 1
    orphans: list[str] = []
    for path, sub, slug in notes:
        if sub in ORPHAN_EXEMPT_DIRS:
            continue
        if not edges.get(slug) and inbound.get(slug, 0) == 0:
            orphans.append(f"{sub}/{slug}.md")
    return orphans


def main() -> int:
    root = chapter_root()
    notes = collect_notes(root)
    errors, edges = audit_resolution(notes, root)
    cycles = detect_cycles(edges)
    orphans = detect_orphans(notes, edges)

    if cycles:
        for c in cycles:
            errors.append(f"cycle in depends-on graph: {' -> '.join(c)}")
    if orphans:
        for o in orphans:
            errors.append(
                f"orphan: {o} has no local depends-on edges in or out "
                f"(reference notes are exempt)"
            )

    if errors:
        print("Dependency audit failed:", file=sys.stderr)
        for e in errors:
            print(f"  - {e}", file=sys.stderr)
        return 1
    print(f"Dependency audit passed ({len(notes)} notes, "
          f"{sum(len(v) for v in edges.values())} local edges, "
          f"0 cycles, 0 orphans).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
