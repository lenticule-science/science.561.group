#!/usr/bin/env python3
"""
AuditPackaging.py -- the packaging honesty gate.

Recovers the intent of the pre-checkpoint `scripts/audit-obsmetrologia-packaging.mjs`
(deleted at commit 2567048c, "Checkpoint existing worktree state"; see `git show
2567048c~1:scripts/audit-obsmetrologia-packaging.mjs`) as a stdlib-only Python script,
narrowed to what the current task calls for:

1. Every `.lean` file under `Obsmetrologia/` must be transitively reachable, via
   `import` lines, from the root `Obsmetrologia.lean`. A file that compiles but is
   never imported from the root is an orphan: `lake build` never type-checks it as
   part of the library, so a broken orphan can sit on the tree indefinitely without
   any gate noticing. This is exactly the packaging failure `lean_lib` config alone
   cannot catch (Lake happily globs every `.lean` file under a `lean_lib`'s root
   namespace regardless of whether anything imports it).
2. Every `import Obsmetrologia....` line must name a module that actually resolves
   to a file on disk. A typo'd or stale import is either a build error (if Lake
   still catches it) or, worse, silently drops content from what a reader thinks is
   being pulled in.

What this does NOT re-implement from the old script: the lakefile.toml stanza
cross-checks, duplicate-module-name detection, and default-target validation --
`scripts/CheckNames.lean` and normal `lake build` failures already cover most of
that ground for the current single-`lean_lib` layout, and re-deriving all of it
here would be scope creep past what this task asks for.

Exit 0 = every `.lean` file under `Obsmetrologia/` is reachable from the root and
every import resolves. Exit 1 = orphans and/or dangling imports found (each listed).

Usage: scripts/AuditPackaging.py
"""
from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
LIB_DIR = ROOT / "Obsmetrologia"
ROOT_MODULE_FILE = ROOT / "Obsmetrologia.lean"
ROOT_MODULE_NAME = "Obsmetrologia"

IMPORT_RE = re.compile(r"^\s*import\s+([A-Za-z0-9_'.]+)\s*$")

# A small, explicit, commented whitelist of modules under Obsmetrologia/ that are
# intentionally not imported from the root spine (e.g. standalone worked examples
# not meant to be part of the load-bearing library). Empty today -- if the audit
# below ever finds an orphan that is genuinely meant to stay unwired, name it here
# with a one-line reason rather than silently special-casing it in the walk logic.
ORPHAN_WHITELIST: dict[str, str] = {}


def module_name_for(path: Path) -> str:
    """The dotted module name a `.lean` file under ROOT corresponds to."""
    rel = path.resolve().relative_to(ROOT)
    return ".".join(rel.with_suffix("").parts)


def file_for_module(module: str) -> Path:
    return (ROOT / Path(*module.split("."))).with_suffix(".lean")


def find_lean_files(base: Path) -> list[Path]:
    return sorted(p for p in base.rglob("*.lean"))


def import_lines(path: Path) -> list[tuple[str, int]]:
    """Every `import <module>` line in `path`, as (module, 1-based line number)."""
    out: list[tuple[str, int]] = []
    with path.open(encoding="utf-8") as fh:
        for i, line in enumerate(fh, start=1):
            m = IMPORT_RE.match(line)
            if m:
                out.append((m.group(1), i))
    return out


def main() -> int:
    if not ROOT_MODULE_FILE.exists():
        print(f"AuditPackaging: missing root module file {ROOT_MODULE_FILE}", file=sys.stderr)
        return 1
    if not LIB_DIR.is_dir():
        print(f"AuditPackaging: missing library directory {LIB_DIR}", file=sys.stderr)
        return 1

    lean_files = find_lean_files(LIB_DIR)
    module_to_file: dict[str, Path] = {}
    dangling_imports: list[tuple[Path, int, str]] = []
    duplicate_modules: list[tuple[str, Path, Path]] = []

    for f in lean_files:
        mod = module_name_for(f)
        if mod in module_to_file:
            duplicate_modules.append((mod, module_to_file[mod], f))
        else:
            module_to_file[mod] = f

    # Every import naming an Obsmetrologia.* module (the local root namespace) must
    # resolve to a file that exists -- whether or not that file is itself reachable
    # (reachability is checked separately below).
    all_lean_files_with_root = [ROOT_MODULE_FILE] + lean_files
    for f in all_lean_files_with_root:
        for module, lineno in import_lines(f):
            if module == ROOT_MODULE_NAME or module.startswith(ROOT_MODULE_NAME + "."):
                target = file_for_module(module)
                if not target.is_file():
                    rel_f = f.relative_to(ROOT)
                    dangling_imports.append((rel_f, lineno, module))

    # Reachability: walk the import graph from the root module file.
    graph: dict[str, list[str]] = {}
    for mod, f in module_to_file.items():
        graph[mod] = [m for m, _ in import_lines(f)]
    root_imports = [m for m, _ in import_lines(ROOT_MODULE_FILE)]

    reachable: set[str] = set()
    stack = list(root_imports)
    while stack:
        mod = stack.pop()
        if mod in reachable:
            continue
        reachable.add(mod)
        stack.extend(graph.get(mod, []))

    orphans = sorted(
        mod for mod in module_to_file
        if mod not in reachable and mod not in ORPHAN_WHITELIST
    )

    findings = False

    if duplicate_modules:
        findings = True
        print(f"AuditPackaging: {len(duplicate_modules)} duplicate module name(s):")
        for mod, first, second in duplicate_modules:
            print(f"  {mod}: {first.relative_to(ROOT)} and {second.relative_to(ROOT)}")
        print()

    if dangling_imports:
        findings = True
        print(f"AuditPackaging: {len(dangling_imports)} import(s) that do not resolve to a file:")
        for rel_f, lineno, module in dangling_imports:
            print(f"  {rel_f}:{lineno}: import {module} -- no such file ({file_for_module(module).relative_to(ROOT)})")
        print()

    if orphans:
        findings = True
        print(f"AuditPackaging: {len(orphans)} orphan module(s) under Obsmetrologia/ "
              f"not reachable from the root {ROOT_MODULE_NAME}.lean:")
        for mod in orphans:
            print(f"  {mod} ({module_to_file[mod].relative_to(ROOT)})")
        print()
        print("Either import it from its natural hub, or add it to ORPHAN_WHITELIST above "
              "with a one-line reason for staying unwired.")

    if findings:
        return 1

    print(
        f"AuditPackaging: OK -- {len(lean_files)} .lean file(s) under Obsmetrologia/, "
        f"all reachable from {ROOT_MODULE_NAME}.lean, every local import resolves."
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
