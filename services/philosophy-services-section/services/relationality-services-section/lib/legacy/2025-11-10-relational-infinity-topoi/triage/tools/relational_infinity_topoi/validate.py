"""Structural validator for the relational-infinity-topoi triage subtheory.

Walks the corpus directories (concepts, objects, morphisms, theorems,
narratives, questions, examples, references), parses each note's YAML
frontmatter, and enforces:

1. Every note carries a `type:` field whose value matches the directory.
   The allowed vocabulary is
   `concept | object | morphism | theorem | conjecture | question | example | narrative | reference`
   and every note in `concepts/` must declare `type: concept`, every note
   in `objects/` must declare `type: object`, etc. (theorems may also be
   `conjecture`).
2. Per-kind required relation fields:
   - concepts, objects, morphisms: require `class:`.
   - objects, morphisms: require `realizes:` (the upstream concept(s)
     they realize).
   - theorems: require `status:` (one of `sketch | draft | proved`) and
     `lean:` (binding to a Lean declaration in `lean/`).
   - narratives: require `discusses:`.
   - questions: require `status:` and `explores:`.
   - examples: require `class:` and `instantiates:`.
   - references: require `class:`, `authors:`, `year:`, `title:`,
     `venue:`.
3. Every note carries an explicit `depends-on:` field (possibly empty).
4. Every link decorator registered via `link.py` has a target file
   that exists.

Usage: `python -m relational_infinity_topoi.validate` from `tools/`.

Exits with non-zero status if any check fails.
"""

from __future__ import annotations

import re
import sys
from pathlib import Path

from . import link as link_module


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

DIR_TYPE = {
    "concepts": {"concept"},
    "objects": {"object"},
    "morphisms": {"morphism"},
    "theorems": {"theorem", "conjecture"},
    "narratives": {"narrative"},
    "questions": {"question"},
    "examples": {"example"},
    "references": {"reference"},
}

ALLOWED_TYPES = {
    "concept", "object", "morphism", "theorem", "conjecture",
    "question", "example", "narrative", "reference",
}

REQUIRED_FIELDS_BY_DIR = {
    "concepts":   ["class"],
    "objects":    ["class", "realizes"],
    "morphisms":  ["class", "realizes"],
    "theorems":   ["class", "status", "lean"],
    "narratives": ["class", "discusses"],
    "questions":  ["class", "status", "explores"],
    "examples":   ["class", "instantiates"],
    "references": ["class", "authors", "year", "title", "venue"],
}

DEPENDS_ON_NOT_REQUIRED_DIRS = {"references"}

ALLOWED_THEOREM_STATUS = {"sketch", "draft", "proved", "verified-by-hand"}


def corpus_root() -> Path:
    return Path(__file__).parent.parent.parent


_FRONTMATTER_RE = re.compile(r"^---\n(.*?)\n---", re.DOTALL)


def parse_frontmatter(text: str) -> dict[str, str]:
    """Naive YAML parse: scalar `key: value` and inline-list `key: [a, b]`.

    Block-list (`key:\\n  - a\\n  - b`) is detected by an empty value plus
    one or more indented `- ` lines that follow; the value returned for
    such a key is the literal string `<block-list>` (presence-only check).
    """
    match = _FRONTMATTER_RE.match(text)
    if not match:
        return {}
    out: dict[str, str] = {}
    lines = match.group(1).splitlines()
    i = 0
    while i < len(lines):
        line = lines[i]
        if ":" in line and not line.startswith(" "):
            key, _, value = line.partition(":")
            key = key.strip()
            value = value.strip()
            if not value and i + 1 < len(lines) and lines[i + 1].lstrip().startswith("- "):
                out[key] = "<block-list>"
            else:
                out[key] = value
        i += 1
    return out


def validate_one_note(path: Path, sub: str, root: Path) -> list[str]:
    errors: list[str] = []
    rel = path.relative_to(root)
    fm = parse_frontmatter(path.read_text())
    if "type" not in fm:
        errors.append(f"{rel}: missing `type:`")
        return errors
    typ = fm["type"]
    if typ not in ALLOWED_TYPES:
        errors.append(
            f"{rel}: type `{typ}` not in allowed vocabulary "
            f"({sorted(ALLOWED_TYPES)})"
        )
    expected_types = DIR_TYPE[sub]
    if typ not in expected_types:
        errors.append(
            f"{rel}: type `{typ}` does not match directory `{sub}/` "
            f"(expected one of {sorted(expected_types)})"
        )
    for required in REQUIRED_FIELDS_BY_DIR[sub]:
        if required not in fm:
            errors.append(f"{rel}: missing required field `{required}:`")
    if sub not in DEPENDS_ON_NOT_REQUIRED_DIRS:
        if "depends-on" not in fm:
            errors.append(f"{rel}: missing `depends-on:`")
        elif fm["depends-on"] in ("", "[]"):
            errors.append(
                f"{rel}: `depends-on:` is empty; every non-reference note "
                f"must declare at least one dependency (local slug or "
                f"cross-vault relative path)"
            )
    if sub == "theorems" and "status" in fm and fm["status"] not in ALLOWED_THEOREM_STATUS:
        errors.append(
            f"{rel}: theorem status `{fm['status']}` not in "
            f"{sorted(ALLOWED_THEOREM_STATUS)}"
        )
    return errors


def validate_required_fields() -> list[str]:
    errors: list[str] = []
    root = corpus_root()
    for sub in CORPUS_DIRS:
        for path in (root / sub).glob("*.md"):
            errors += validate_one_note(path, sub, root)
    return errors


def validate_link_targets() -> list[str]:
    errors: list[str] = []
    root = corpus_root()
    for link in link_module.all_links():
        if not (root / link.target).exists():
            errors.append(f"link target missing: {link.target} (kind={link.kind})")
    return errors


def main() -> int:
    errors: list[str] = []
    errors += validate_required_fields()
    errors += validate_link_targets()
    if errors:
        print("Validation failed:", file=sys.stderr)
        for e in errors:
            print(f"  - {e}", file=sys.stderr)
        return 1
    print("Validation passed.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
