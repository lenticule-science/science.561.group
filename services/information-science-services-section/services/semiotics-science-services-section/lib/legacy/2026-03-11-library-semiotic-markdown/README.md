# Semiotic Markdown

A syntax-friendly Markdown dialect for building meaning over plaintext semantic data.

Status: draft / personal hobby project.

## Repository kind: tooling-contract

This is a **tooling-contract repository**: it specifies and implements a contract for how Markdown is written, parsed, and indexed in this ecosystem.

It is not generic “Markdown best practices”.
The point is semiotic operability: a consistent, enforceable surface that hosts (CI, editors, local operators) can validate and rely on.

## Transformer surface

In the “contract as transformer” framing:

- inputs: Markdown carriers (a file, a repo, or a vault directory)
- constraints: a concrete Markdown dialect and semantic extraction rules (see `spec/semiotic-markdown.md`)
- outputs: parsed structure + extracted records + diagnostics; a deterministic index representation suitable for downstream operators

Enforcement surface (current):

- spec text (`spec/semiotic-markdown.md`)
- Python reference implementation (`src/`)
- executable tests + fixtures (`tests/`)

## What this repo contains

- The specification: `spec/semiotic-markdown.md`
- A Python reference implementation (parser + extractor + vault indexer)
- Tests, examples, and golden fixtures

## Build (optional)

If you have `pandoc` installed, you can export the spec to HTML/PDF:

```bash
make html
make pdf
```

## Install (Python)

From a local checkout:

```bash
python -m pip install -e ".[dev]"
```

## CLI

Index a vault (directory) of `*.md` files and emit extraction JSON:

```bash
smd index /path/to/vault > vault.json
```

## Python API

```python
from pathlib import Path
from semiotic_markdown import index_vault

records = index_vault(Path("/path/to/vault"))
print(records[0].doc_id)
```

## Contributing

See `CONTRIBUTING.md`.
For discussion, use GitHub Issues or email `emsenn@emsenn.net`.

## License

MIT.
See `LICENSE`.

## Git hooks (optional)

Enable local hooks (Conventional Commits, whitespace/size checks) with:

```bash
scripts/setup-git-hooks
```

## Plans

- [ ] Create standard Pandoc publication filter
