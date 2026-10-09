#!/usr/bin/env python3
"""
tangle.py — extract and deduplicate references from all math/*.md frontmatter.
Writes math/_references.yaml in CSL-YAML format.
"""
import yaml
import re
import sys
from pathlib import Path

REPO_DIR = Path(__file__).parent.parent.parent
MATH_DIR = REPO_DIR / 'math'

def parse_frontmatter(path):
    text = path.read_text(encoding='utf-8')
    m = re.match(r'^---\n(.*?)\n---\n', text, re.DOTALL)
    if not m:
        return {}
    try:
        return yaml.safe_load(m.group(1)) or {}
    except yaml.YAMLError:
        return {}

def main():
    seen = {}
    for md in sorted(MATH_DIR.rglob('*.md')):
        fm = parse_frontmatter(md)
        for ref in fm.get('references', []):
            rid = ref.get('id')
            if rid and rid not in seen:
                seen[rid] = ref
    refs = list(seen.values())
    out = MATH_DIR / '_references.yaml'
    out.write_text(yaml.dump({'references': refs}, allow_unicode=True, sort_keys=False), encoding='utf-8')
    print(f"Wrote {len(refs)} references to {out}")

if __name__ == '__main__':
    main()
