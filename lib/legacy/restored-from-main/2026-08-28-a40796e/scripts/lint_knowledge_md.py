#!/usr/bin/env python3
"""Lint knowledge-base markdown (glossary terms, notes, person notes) against house conventions.

Usage: lint_knowledge_md.py FILE [FILE ...]
Exit 0 if all pass; 1 if any file has errors. Warnings don't fail the run.

Checks:
- YAML frontmatter block present and parseable (no external deps; naive key scan).
- Required keys: glossary terms & person notes need title/date-created/description;
  notes need name/description/date-created (detected by 'name:' vs 'title:').
- date-created is YYYY-MM-DD.
- description is a non-empty single sentence-ish string (warn if >400 chars).
- Body present after frontmatter (>= 200 chars for terms/persons, warn otherwise).
- No literal placeholder text (TODO/TKTK/lorem/FIXME) outside code fences.
- Warn on trailing whitespace and on markdown links to .md paths that don't exist
  (relative to the file).
"""
import os
import re
import sys

DATE_RE = re.compile(r"^\d{4}-\d{2}-\d{2}$")
PLACEHOLDER_RE = re.compile(r"\b(TODO|TKTK|FIXME|lorem ipsum)\b", re.I)
LINK_RE = re.compile(r"\]\((?!https?://|#|mailto:)([^)\s]+\.md)\)")


def parse_frontmatter(text):
    if not text.startswith("---\n"):
        return None, text
    end = text.find("\n---", 4)
    if end == -1:
        return None, text
    fm = text[4:end]
    body = text[end + 4:]
    keys = {}
    for line in fm.splitlines():
        m = re.match(r"^([A-Za-z][A-Za-z0-9_-]*):\s*(.*)$", line)
        if m:
            keys[m.group(1)] = m.group(2).strip().strip('"').strip("'")
    return keys, body


def lint(path):
    errors, warnings = [], []
    try:
        text = open(path, encoding="utf-8").read()
    except Exception as e:
        return [f"unreadable: {e}"], []

    keys, body = parse_frontmatter(text)
    if keys is None:
        return ["missing or unterminated YAML frontmatter"], []

    is_note = "name" in keys and "title" not in keys
    required = ["name", "description", "date-created"] if is_note else ["title", "description", "date-created"]
    for k in required:
        if k not in keys:
            errors.append(f"frontmatter missing required key: {k}")

    dc = keys.get("date-created", "")
    if dc and not DATE_RE.match(dc):
        errors.append(f"date-created not YYYY-MM-DD: {dc!r}")

    desc = keys.get("description", "")
    if "description" in keys and not desc and ">-" not in text.split("---")[1]:
        errors.append("description is empty")
    if len(desc) > 400:
        warnings.append(f"description is long ({len(desc)} chars)")

    stripped = body.strip()
    if len(stripped) < (120 if is_note else 200):
        warnings.append(f"body is short ({len(stripped)} chars)")

    # strip code fences before placeholder scan
    no_code = re.sub(r"```.*?```", "", body, flags=re.S)
    for m in PLACEHOLDER_RE.finditer(no_code):
        errors.append(f"placeholder text present: {m.group(0)!r}")

    for i, line in enumerate(body.splitlines(), 1):
        if line.rstrip("\n") != line.rstrip():
            warnings.append(f"trailing whitespace on body line {i}")
            break

    base = os.path.dirname(os.path.abspath(path))
    for m in LINK_RE.finditer(body):
        target = os.path.normpath(os.path.join(base, m.group(1)))
        if not os.path.exists(target):
            warnings.append(f"relative link target missing: {m.group(1)}")

    # STYLE.md: semantic linebreaks — flag fixed-width hard-wraps that split
    # a sentence mid-clause (line ends without terminal punctuation and the
    # next line continues in lowercase). Skips code fences, tables, lists,
    # headings, and link-reference lines.
    hard_wraps = 0
    first_wrap_line = None
    in_fence = False
    lines = no_code.count("```") and body.splitlines() or body.splitlines()
    for i in range(len(lines) - 1):
        line = lines[i].rstrip()
        if line.startswith("```"):
            in_fence = not in_fence
            continue
        if in_fence or not line:
            continue
        nxt = lines[i + 1].lstrip()
        if not nxt or nxt.startswith(("#", "-", "*", "|", ">", "```", "1", "2", "3", "4", "5", "6", "7", "8", "9")):
            continue
        if line.startswith(("#", "-", "*", "|", ">")):
            continue
        if len(line) < 50 or len(line) > 95:
            continue
        if line.endswith((".", "!", "?", ":", ";", '"', "”", ")", "»", "—", "-", ",", "…")):
            # comma/dash endings are legitimate clause breaks under sembr
            continue
        if nxt[0].islower() or nxt[0] in "([“\"'":
            hard_wraps += 1
            if first_wrap_line is None:
                first_wrap_line = i + 1
    if hard_wraps >= 3:
        warnings.append(
            f"looks hard-wrapped mid-sentence ({hard_wraps} suspect breaks, first at body line {first_wrap_line}) — STYLE.md wants semantic linebreaks (one sentence per line)"
        )

    # STYLE.md: real markdown — a note that talks about other notes should
    # link them, not name them in prose.
    if is_note and re.search(r"\b(the [a-z][a-z-]* note\b|note, this (same )?date|see the .* note\b)", no_code, re.I):
        if not LINK_RE.search(body):
            warnings.append(
                "mentions other notes but contains no markdown links — STYLE.md wants real relative links for cross-references"
            )

    return errors, warnings


def main(argv):
    if len(argv) < 2:
        print(__doc__)
        return 2
    failed = False
    for path in argv[1:]:
        errors, warnings = lint(path)
        for e in errors:
            print(f"ERROR {path}: {e}")
        for w in warnings:
            print(f"warn  {path}: {w}")
        if errors:
            failed = True
        elif not warnings:
            print(f"ok    {path}")
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
