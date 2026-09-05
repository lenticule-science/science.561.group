---
title: "Usage"
date-created: 2026-03-06T00:00:00
---

This repository is primarily a personal tool for @emsenn to establish new repositories quickly and consistently.

List templates:

```bash
python3 establish.py list-templates
```

Create from YAML config:

```bash
python3 establish.py init --config examples/python-package.yaml
```

Create from CLI (no YAML):

```bash
python3 establish.py init --template python-package --output-path ./code/my-lib --name "My Lib"
```

Operational flags:

- `--dry-run`: print planned actions without writing
- `--force`: allow writing into an existing output directory
- `--templates-dir`, `--licenses-dir`: override template/license roots (or env `ESTABLISH_TEMPLATES_DIR` / `ESTABLISH_LICENSES_DIR`)
