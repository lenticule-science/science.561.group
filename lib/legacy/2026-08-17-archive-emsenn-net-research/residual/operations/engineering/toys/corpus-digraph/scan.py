#!/usr/bin/env python3
"""Scan repo .md frontmatter and body links, emit rows to sqlite.

Two tables:

  eavt   — frontmatter EAVT.
           e=stem, a=key path, v=scalar, t=mtime, src=relpath, flat∈{0,1}.

  links  — markdown body links [text](target).
           src=relpath, target_raw=as-written, target_resolved=relpath or NULL,
           line=line number, kind∈{relative,absolute,external,anchor,asset}.
           target_resolved is NULL when the link is broken (404).

Usage: python3 scan.py [repo_root=.] [db=eavt.db]
"""
import sqlite3, sys, yaml, datetime, re, os
from pathlib import Path

SCALAR = (str, int, float, bool, datetime.date, datetime.datetime, datetime.time)

ROOT = Path(sys.argv[1] if len(sys.argv) > 1 else ".").resolve()
DB   = Path(sys.argv[2] if len(sys.argv) > 2 else "eavt.db")

def split_frontmatter(text):
    if not text.startswith("---"):
        return None
    end = text.find("\n---", 3)
    if end < 0:
        return None
    return text[3:end].lstrip("\n")

def walk(obj, prefix=()):
    """Yield (attr_path_tuple, scalar_value, flat_bool).
    Top-level scalar → flat=1. Top-level list of scalars → one flat row each.
    Anything nested (dict inside, list of dicts) → one flat=0 row at the key, value None.
    """
    if isinstance(obj, dict):
        for k, v in obj.items():
            key = prefix + (str(k),)
            if isinstance(v, SCALAR) or v is None:
                yield key, v, 1
            elif isinstance(v, list) and all(isinstance(x, SCALAR) or x is None for x in v):
                for item in v:
                    yield key, item, 1
            else:
                yield key, None, 0

LINK_RE = re.compile(r'\[([^\]]+)\]\(([^)]+)\)')

def link_kind(target):
    if target.startswith(('http://', 'https://')): return 'external'
    if target.startswith('mailto:'): return 'external'
    if target.startswith('#'): return 'anchor'
    path = target.split('#')[0].split('?')[0]
    if not path.endswith('.md'): return 'asset'
    if path.startswith('/'): return 'absolute'
    return 'relative'

def main():
    conn = sqlite3.connect(DB)
    conn.executescript("""
        DROP TABLE IF EXISTS eavt;
        CREATE TABLE eavt (e TEXT, a TEXT, v TEXT, t REAL, src TEXT, flat INTEGER);
        CREATE INDEX eavt_e  ON eavt(e);
        CREATE INDEX eavt_a  ON eavt(a);
        CREATE INDEX eavt_av ON eavt(a, v);
        CREATE INDEX eavt_v  ON eavt(v);

        DROP TABLE IF EXISTS links;
        CREATE TABLE links (
            src TEXT,
            target_raw TEXT,
            target_resolved TEXT,
            line INTEGER,
            kind TEXT
        );
        CREATE INDEX links_src ON links(src);
        CREATE INDEX links_resolved ON links(target_resolved);
        CREATE INDEX links_kind ON links(kind);
    """)
    files = claims = nonflat = parse_errs = 0
    for md in ROOT.rglob("*.md"):
        if any(p in md.parts for p in ("node_modules", ".git")):
            continue
        try:
            text = md.read_text(encoding="utf-8", errors="replace")
        except Exception:
            continue
        fm = split_frontmatter(text)
        if fm is None:
            continue
        files += 1
        try:
            doc = yaml.safe_load(fm)
        except yaml.YAMLError:
            parse_errs += 1
            continue
        if not isinstance(doc, dict):
            continue
        e = md.stem
        t = md.stat().st_mtime
        src = str(md.relative_to(ROOT))
        for key, val, flat in walk(doc):
            conn.execute(
                "INSERT INTO eavt (e,a,v,t,src,flat) VALUES (?,?,?,?,?,?)",
                (e, ".".join(key), None if val is None else str(val), t, src, flat)
            )
            if flat: claims += 1
            else:    nonflat += 1

        # Index body links. Body is everything after the closing '---'.
        end = text.find("\n---", 3)
        body = text[end + 4:] if end >= 0 else text
        src_dir = md.parent
        for ln_idx, line in enumerate(body.split('\n'), start=1):
            for m in LINK_RE.finditer(line):
                target = m.group(2).strip()
                kind = link_kind(target)
                resolved = None
                if kind == 'relative':
                    path = target.split('#')[0].split('?')[0]
                    cand = (src_dir / path).resolve()
                    if cand.exists():
                        try:
                            resolved = str(cand.relative_to(ROOT))
                        except ValueError:
                            resolved = None
                elif kind == 'absolute':
                    path = target.split('#')[0].split('?')[0].lstrip('/')
                    cand = (ROOT / path)
                    if cand.exists():
                        resolved = str(cand.relative_to(ROOT))
                conn.execute(
                    "INSERT INTO links (src, target_raw, target_resolved, line, kind) VALUES (?,?,?,?,?)",
                    (src, target, resolved, ln_idx, kind)
                )
    conn.commit()

    print(f"{files} files scanned, {parse_errs} yaml errors")
    print(f"{claims} flat (scalar) claims, {nonflat} nested/non-SPO entries")
    print()
    print("top predicates (flat only):")
    for a, c in conn.execute(
        "SELECT a, COUNT(*) FROM eavt WHERE flat=1 GROUP BY a ORDER BY 2 DESC LIMIT 25"):
        print(f"  {c:5d}  {a}")
    print()
    print("predicates with nested bodies (shape breakage):")
    for a, c in conn.execute(
        "SELECT a, COUNT(*) FROM eavt WHERE flat=0 GROUP BY a ORDER BY 2 DESC LIMIT 15"):
        print(f"  {c:5d}  {a}")
    print()
    print("top entities by outbound claim count:")
    for e, c in conn.execute(
        "SELECT e, COUNT(*) FROM eavt WHERE flat=1 GROUP BY e ORDER BY 2 DESC LIMIT 15"):
        print(f"  {c:5d}  {e}")
    print()

    # link stats
    total = conn.execute("SELECT COUNT(*) FROM links WHERE kind IN ('relative','absolute')").fetchone()[0]
    broken = conn.execute("SELECT COUNT(*) FROM links WHERE kind IN ('relative','absolute') AND target_resolved IS NULL").fetchone()[0]
    ext = conn.execute("SELECT COUNT(*) FROM links WHERE kind='external'").fetchone()[0]
    pct = (broken / total * 100) if total else 0
    print(f"body links: {total} internal .md  ({broken} broken, {pct:.1f}%) + {ext} external")
    conn.close()

if __name__ == "__main__":
    main()
