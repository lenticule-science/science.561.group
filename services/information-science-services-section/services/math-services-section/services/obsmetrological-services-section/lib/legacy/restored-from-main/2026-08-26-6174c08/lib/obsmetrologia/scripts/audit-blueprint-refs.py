#!/usr/bin/env python3
"""
audit-blueprint-refs.py -- audit \\lean{...} references in the blueprint
(docs/blueprint/src/**/*.tex) against the Obsmetrologia Lean library.

What it does
------------
1. Extracts every name inside every \\lean{...} annotation in the blueprint
   (a single \\lean{...} may hold several comma-separated names, and a single
   proposition may carry several \\lean{...} annotations).
2. Checks each *distinct* name against the library in one shot: it writes a
   temp file that `import Obsmetrologia`s and emits one `#check @Name` line
   per distinct name, then runs `lake env lean` on it once and parses the
   `unknown identifier` errors out of the output. This is the authoritative
   pass -- if `lake env lean` accepts the name, the reference is good,
   regardless of what any grep heuristic thinks.
3. For every stale name, tries to suggest the current correct name by
   grepping Obsmetrologia/ for declaration heads (def/theorem/lemma/
   structure/inductive/abbrev/instance/class/axiom), reconstructing each
   candidate's fully-qualified name from its enclosing `namespace ... end`
   nesting, and looking for:
     (a) an unambiguous declaration with the *same final segment* elsewhere
         in the library (a namespace move), or
     (b) an unambiguous, close-spelling declaration in the *same namespace*
         (an obvious rename, e.g. potential -> absurd), via difflib.
   Grep/namespace-reconstruction is only ever used to *locate* a fix; the
   #check batch in step 2 is what decides whether a name is stale at all.
4. Reports every stale reference as `file:line: STALE_NAME` with a
   `-> SUGGESTED_NAME` line when a fix was found unambiguously, or
   `-> AMBIGUOUS (no unique fix found)` otherwise.
5. With --fix, rewrites the .tex files in place for every stale reference
   that has an unambiguous suggested replacement (word-boundary-safe
   substitution restricted to the dotted-identifier alphabet), leaving
   ambiguous/unfixable ones untouched, then re-runs the check.

Exit status
-----------
0 if no stale \\lean{...} references remain after the (optional) --fix pass.
1 if any stale references remain (ambiguous or otherwise) -- the remaining
  ones are printed either way.

Usage
-----
    scripts/audit-blueprint-refs.py            # audit only, exit 0/1
    scripts/audit-blueprint-refs.py --fix       # apply unambiguous fixes, then audit
    scripts/audit-blueprint-refs.py --fix --dry-run   # show what --fix would change, change nothing
"""
from __future__ import annotations

import argparse
import difflib
import re
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
BLUEPRINT_SRC = ROOT / "docs" / "blueprint" / "src"
LIB_DIR = ROOT / "Obsmetrologia"

LEAN_TAG_RE = re.compile(r"\\lean\{([^}]*)\}")

# Declaration-head alphabet: what a dotted Lean identifier is made of.
# Used to build safe word-boundary regexes so a fix-replace of "Foo.bar"
# never touches "Foo.bar2" or "Foo.barBaz".
_IDENT_CHAR = r"[A-Za-z0-9_'\.]"

DECL_HEAD_RE = re.compile(
    r"^\s*(?:@\[[^\]]*\]\s*)*"
    r"(?:private\s+|protected\s+|noncomputable\s+|scoped\s+|local\s+)*"
    r"(?:def|theorem|lemma|structure|inductive|abbrev|instance|class|axiom)\s+"
    r"([A-Za-zΑ-Ωα-ω_][A-Za-z0-9_'!?]*)"
)
NAMESPACE_OPEN_RE = re.compile(r"^\s*namespace\s+(\S+)\s*$")
NAMESPACE_END_RE = re.compile(r"^\s*end(?:\s+(\S+))?\s*$")
SECTION_OPEN_RE = re.compile(r"^\s*section\b")


# ---------------------------------------------------------------------------
# Step 1: collect \lean{...} references from the blueprint
# ---------------------------------------------------------------------------

_COMMENT_SPLIT_RE = re.compile(r"(?<!\\)%")


def find_lean_refs() -> list[tuple[Path, int, str]]:
    """Return (texfile, line_no, name) for every name inside every \\lean{...}.

    \\lean{...} annotations never span multiple lines in this blueprint (verified
    empirically), so this works line-by-line and strips LaTeX `%` comments first --
    otherwise documentation lines like `% \\lean{Obsmetrologia.Foo} names the
    intended declaration` (a syntax example in a comment, e.g. content.tex) would
    be misreported as a stale/dangling reference.
    """
    refs: list[tuple[Path, int, str]] = []
    for texfile in sorted(BLUEPRINT_SRC.rglob("*.tex")):
        for line_no, raw_line in enumerate(texfile.read_text().splitlines(), start=1):
            code = _COMMENT_SPLIT_RE.split(raw_line, maxsplit=1)[0]
            for m in LEAN_TAG_RE.finditer(code):
                for raw_name in m.group(1).split(","):
                    name = raw_name.strip()
                    if name:
                        refs.append((texfile, line_no, name))
    return refs


# ---------------------------------------------------------------------------
# Step 2: the authoritative #check batch
# ---------------------------------------------------------------------------

def batch_check(names: set[str]) -> tuple[set[str], str]:
    """Run one `lake env lean` invocation checking every distinct name.

    Returns (stale_names, raw_stdout).
    """
    tmp = tempfile.NamedTemporaryFile(
        mode="w", suffix=".lean", delete=False, dir=str(ROOT), prefix="_audit_check_"
    )
    try:
        tmp.write("import Obsmetrologia\n")
        for n in sorted(names):
            tmp.write(f"#check @{n}\n")
        tmp.close()
        proc = subprocess.run(
            ["lake", "env", "lean", tmp.name],
            cwd=str(ROOT),
            capture_output=True,
            text=True,
            timeout=900,
        )
    finally:
        Path(tmp.name).unlink(missing_ok=True)

    stale: set[str] = set()
    err_re = re.compile(
        r"error\((?:lean\.unknownIdentifier|lean\.unknownConstant)\):"
        r"\s*Unknown (?:identifier|constant)\s*`([^`]+)`"
    )
    for line in proc.stdout.splitlines():
        m = err_re.search(line)
        if m:
            stale.add(m.group(1))
    return stale, proc.stdout


# ---------------------------------------------------------------------------
# Step 3: build a full index of the library's declarations, for suggestions
# ---------------------------------------------------------------------------

def build_declaration_index() -> list[tuple[str, str, str]]:
    """Return list of (full_dotted_name, short_name, namespace_prefix)."""
    index: list[tuple[str, str, str]] = []
    for leanfile in sorted(LIB_DIR.rglob("*.lean")):
        ns_stack: list[str] = []  # stack of ('ns', name) or ('sec', None) markers
        for line in leanfile.read_text().splitlines():
            m_ns = NAMESPACE_OPEN_RE.match(line)
            if m_ns:
                ns_stack.append(("ns", m_ns.group(1)))
                continue
            m_end = NAMESPACE_END_RE.match(line)
            if m_end:
                if ns_stack:
                    ns_stack.pop()
                continue
            if SECTION_OPEN_RE.match(line):
                ns_stack.append(("sec", None))
                continue
            m_decl = DECL_HEAD_RE.match(line)
            if m_decl:
                short = m_decl.group(1)
                prefix_parts = [name for kind, name in ns_stack if kind == "ns"]
                prefix = ".".join(prefix_parts)
                full = f"{prefix}.{short}" if prefix else short
                index.append((full, short, prefix))
    return index


# The corner-naming convention ruled 2026-08-05 (docs/history/corner-naming-
# convention.md) relabels the four `Articulating.Corner` constructors. Names
# coined before the ruling can have their *declaration-local* identifier
# built out of the old labels (e.g. `..._stable_iff_bad`,
# `..._stableToAbsurd_...`); the library itself was renamed to match the new
# reading. This is a one-step rotation of the four labels, applied only to
# the final (unqualified) segment of a dotted name -- never to the namespace
# path, which is unaffected by the corner ruling.
CORNER_ROTATION = {"stable": "active", "active": "potential", "potential": "absurd", "absurd": "stable"}
_CORNER_TOKEN_RE = re.compile(
    r"(?<![A-Za-z])(stable|active|potential|absurd)(?![a-z])"
    r"|(?:(?<=[a-z])|(?<=_)|^)(Stable|Active|Potential|Absurd)(?![a-z])"
)


def _rotate_corner_tokens(short_name: str) -> str | None:
    """Apply the corner-label rotation to every corner token in a short (unqualified)
    declaration name, respecting underscore_case and camelCase word boundaries.
    Returns None if no corner token was found (rotation isn't applicable)."""

    def repl(m: re.Match) -> str:
        if m.group(1):
            return CORNER_ROTATION[m.group(1)]
        return CORNER_ROTATION[m.group(2).lower()].capitalize()

    new_short, n = _CORNER_TOKEN_RE.subn(repl, short_name)
    return new_short if n else None


def suggest_fix(stale_name: str, index: list[tuple[str, str, str]]) -> str | None:
    """Best-effort unambiguous replacement for a stale dotted name, or None."""
    if "." not in stale_name:
        final = stale_name
        stale_prefix = ""
    else:
        stale_prefix, final = stale_name.rsplit(".", 1)

    all_full_names = {full for full, _, _ in index}

    # (a) namespace move: same final segment, unique full name elsewhere.
    same_final = sorted({full for full, short, _ in index if short == final})
    if len(same_final) == 1:
        return same_final[0]

    # (b) corner-label rotation: same namespace, final segment's corner tokens
    # (stable/active/potential/absurd) rotated by the 2026-08-05 ruling, and the
    # result is an actual declaration.
    rotated_final = _rotate_corner_tokens(final)
    if rotated_final is not None:
        candidate = f"{stale_prefix}.{rotated_final}" if stale_prefix else rotated_final
        if candidate in all_full_names:
            return candidate

    # (c) obvious rename within the same namespace: close spelling, same prefix.
    siblings = [short for _, short, prefix in index if prefix == stale_prefix]
    if siblings:
        close = difflib.get_close_matches(final, siblings, n=2, cutoff=0.6)
        if len(close) == 1:
            return f"{stale_prefix}.{close[0]}" if stale_prefix else close[0]

    # (d) if (a) had >1 candidates, try narrowing by matching prefix similarity
    if len(same_final) > 1:
        exact_prefix = [f for f in same_final if f.rsplit(".", 1)[0] == stale_prefix]
        if len(exact_prefix) == 1:
            return exact_prefix[0]

    return None


# ---------------------------------------------------------------------------
# Step 5: apply fixes
# ---------------------------------------------------------------------------

def apply_fix(texfile: Path, old_name: str, new_name: str) -> int:
    """Word-boundary-safe replace of old_name -> new_name in texfile. Returns count."""
    text = texfile.read_text()
    pattern = re.compile(
        r"(?<!" + _IDENT_CHAR + r")" + re.escape(old_name) + r"(?!" + _IDENT_CHAR + r")"
    )
    new_text, n = pattern.subn(new_name, text)
    if n:
        texfile.write_text(new_text)
    return n


# ---------------------------------------------------------------------------
# main
# ---------------------------------------------------------------------------

def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--fix", action="store_true", help="apply unambiguous fixes to the .tex files")
    ap.add_argument("--dry-run", action="store_true", help="with --fix, print what would change but don't write files")
    args = ap.parse_args()

    refs = find_lean_refs()
    if not refs:
        print("No \\lean{...} references found under docs/blueprint/src/ -- nothing to audit.")
        return 0

    distinct_names = {name for _, _, name in refs}
    print(f"Found {len(refs)} \\lean{{...}} references ({len(distinct_names)} distinct names). "
          f"Checking against the library with one `lake env lean` batch...")
    stale, raw_output = batch_check(distinct_names)

    if not stale:
        print("All \\lean{...} references resolve. Nothing stale.")
        return 0

    print(f"\n{len(stale)} distinct name(s) are stale, appearing in {sum(1 for _,_,n in refs if n in stale)} reference(s):\n")

    index = build_declaration_index()
    suggestions: dict[str, str | None] = {n: suggest_fix(n, index) for n in stale}

    fixed_count = 0
    ambiguous_names: set[str] = set()

    # Report grouped by file, in file order, for readability.
    by_file: dict[Path, list[tuple[int, str]]] = {}
    for texfile, line_no, name in refs:
        if name in stale:
            by_file.setdefault(texfile, []).append((line_no, name))

    for texfile in sorted(by_file):
        rel = texfile.relative_to(ROOT)
        for line_no, name in sorted(by_file[texfile]):
            suggestion = suggestions.get(name)
            if suggestion:
                print(f"{rel}:{line_no}: {name}\n    -> SUGGESTED: {suggestion}")
            else:
                print(f"{rel}:{line_no}: {name}\n    -> AMBIGUOUS (no unique fix found)")
                ambiguous_names.add(name)

    if args.fix:
        print("\nApplying unambiguous fixes...")
        for name, suggestion in suggestions.items():
            if not suggestion:
                continue
            for texfile in sorted(by_file):
                if not any(n == name for _, n in by_file[texfile]):
                    continue
                if args.dry_run:
                    print(f"  (dry-run) would replace {name} -> {suggestion} in {texfile.relative_to(ROOT)}")
                    continue
                n = apply_fix(texfile, name, suggestion)
                if n:
                    fixed_count += n
                    print(f"  replaced {n} occurrence(s) of {name} -> {suggestion} in {texfile.relative_to(ROOT)}")
        if not args.dry_run:
            print(f"\nApplied {fixed_count} replacement(s). Re-checking...")
            refs2 = find_lean_refs()
            distinct2 = {name for _, _, name in refs2}
            stale2, _ = batch_check(distinct2)
            if not stale2:
                print("All \\lean{...} references resolve after fixing.")
                return 0
            print(f"\n{len(stale2)} name(s) still stale after fixing (ambiguous / unfound):")
            for name in sorted(stale2):
                print(f"  {name}")
            return 1

    if ambiguous_names:
        print(f"\n{len(ambiguous_names)} name(s) remain ambiguous (no unique fix found) -- left for manual resolution:")
        for name in sorted(ambiguous_names):
            print(f"  {name}")

    return 1


if __name__ == "__main__":
    sys.exit(main())
