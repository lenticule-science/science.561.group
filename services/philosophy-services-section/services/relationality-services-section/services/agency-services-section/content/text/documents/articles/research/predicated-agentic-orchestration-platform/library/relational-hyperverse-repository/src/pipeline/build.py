#!/usr/bin/env python3
"""
build.py — assemble math/ source files into relational-universe.md.

Usage:
    python src/pipeline/build.py [--output PATH]

Reads _manifest.yaml for file order. Strips YAML frontmatter from all files
except _00_preamble.yaml (which becomes the document header). Appends a
bibliography section rendered from _references.yaml if it exists.
"""
import yaml
import re
import sys
from pathlib import Path

REPO_DIR = Path(__file__).parent.parent.parent
MATH_DIR = REPO_DIR / 'math'
BUILD_DIR = REPO_DIR / 'build'
DEFAULT_OUT = BUILD_DIR / 'relational-hyperverse.md'

def strip_frontmatter(text):
    """Remove YAML frontmatter block, return body text."""
    m = re.match(r'^---\n.*?\n---\n?', text, re.DOTALL)
    if m:
        return text[m.end():]
    return text

def render_preamble(path):
    """Render _00_preamble.yaml as a markdown header block."""
    text = path.read_text(encoding='utf-8')
    # Strip YAML front-matter delimiters if present
    m = re.match(r'^---\n(.*?)\n---\n?$', text, re.DOTALL)
    if m:
        text = m.group(1)
    fm = yaml.safe_load(text)
    lines = []
    if fm.get('title'):
        lines.append(f"# {fm['title']}")
    if fm.get('subtitle'):
        lines.append(f"\n*{fm['subtitle']}*")
    if fm.get('author'):
        authors = ', '.join(
            a if isinstance(a, str) else f"{a.get('given','')} {a.get('family','')}".strip()
            for a in fm['author']
        )
        if authors:
            lines.append(f"\n{authors}")
    if fm.get('abstract'):
        lines.append(f"\n## Abstract\n\n{fm['abstract'].strip()}")
    return '\n'.join(lines) + '\n\n'

def render_references(path):
    """Render _references.yaml as a markdown bibliography section."""
    data = yaml.safe_load(path.read_text(encoding='utf-8'))
    refs = data.get('references', [])
    if not refs:
        return ''
    lines = ['\n---\n\n## References\n']
    for ref in sorted(refs, key=lambda r: r.get('id', '')):
        rid = ref.get('id', '')
        authors = ref.get('author', [])
        author_str = '; '.join(
            a if isinstance(a, str) else f"{a.get('family', '')}, {a.get('given', '')}"
            for a in authors
        ) if authors else ''
        year = ''
        issued = ref.get('issued', {})
        if isinstance(issued, dict):
            year = str(issued.get('year', ''))
        title = ref.get('title', '')
        publisher = ref.get('publisher', '')
        parts = [p for p in [author_str, year, f'*{title}*' if title else '', publisher] if p]
        lines.append(f"- [{rid}] {'. '.join(parts)}.")
    return '\n'.join(lines) + '\n'

def main():
    out_path = DEFAULT_OUT
    if '--output' in sys.argv:
        idx = sys.argv.index('--output')
        out_path = Path(sys.argv[idx + 1])

    manifest_path = MATH_DIR / '_manifest.yaml'
    manifest = yaml.safe_load(manifest_path.read_text(encoding='utf-8'))
    file_order = manifest['order']

    chunks = []
    for rel in file_order:
        path = MATH_DIR / rel
        if not path.exists():
            print(f"WARNING: {path} not found, skipping", file=sys.stderr)
            continue
        if rel == '_00_preamble.yaml':
            chunks.append(render_preamble(path))
        else:
            text = path.read_text(encoding='utf-8')
            body = strip_frontmatter(text).strip()
            if body:
                chunks.append(body + '\n\n')

    refs_path = MATH_DIR / '_references.yaml'
    if refs_path.exists():
        chunks.append(render_references(refs_path))

    out_path.parent.mkdir(exist_ok=True)
    output = '\n'.join(chunks)
    out_path.write_text(output, encoding='utf-8')
    print(f"Wrote {out_path} ({len(output)} chars, {output.count(chr(10))} lines)")

if __name__ == '__main__':
    main()
