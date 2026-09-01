---
title: "repo-establisher"
date-created: 2026-03-06T00:00:00
---

Personal repository scaffolding for @emsenn: filesystem-based templates rendered with Jinja to help establish new repos consistently.

## Install

```bash
pip install jinja2 pyyaml
```

## Usage

List templates:

```bash
python3 establish.py list-templates
```

Create from YAML (recommended):

```bash
python3 establish.py init --config examples/research-notes.yaml
```

Create from CLI (alternative to YAML):

```bash
python3 establish.py init \
  --template research-notes \
  --output-path ./notebooks/soil-salinity-observations \
  --name "Soil Salinity Observations" \
  --description "Field notes and exploratory analysis" \
  --author emsenn \
  --contact-email emsenn@example.com \
  --organization "Independent Research" \
  --license-id CC-BY-4.0 \
  --created 2025-03-18 \
  --status exploratory \
  --tag ecology --tag soil --tag salinity
```

Operational flags (work in both modes):

- `--dry-run`: print planned actions
- `--force`: allow writing into an existing output directory
- `--templates-dir`: use a different `templates/` root
- `--licenses-dir`: use a different `licenses/` root

Note: established repos use versioned Git hooks by default (`core.hooksPath=.githooks`).

## Config schema (YAML)

```yaml
template: research-notes
output_path: ./notebooks/soil-salinity-observations

project:
  name: Soil Salinity Observations
  description: Field notes, measurements, and exploratory analysis.
  author: emsenn
  contact_email: emsenn@example.com   # optional but recommended
  organization: Independent Research

github:
  owner: your-org                    # optional; enables GitHub badges/links
  repo: soil-salinity-observations   # optional; defaults to slugified project name
  default_branch: main               # optional
  include_codeowners: true           # optional
  include_funding: false             # optional
  badges:
    tags: false                      # optional

license:
  id: CC-BY-4.0

metadata:
  created: 2025-03-18
  status: exploratory
  tags: [ecology, soil, salinity]
```

## Adding templates

- Add a new directory under `templates/<template-name>/`.
- Any file ending with `.j2` is rendered via Jinja, and the `.j2` suffix is removed.
- Paths can be templated too (example: `src/{{ project.python_package }}/__init__.py.j2`).
- Shared snippets live in `templates/_shared/` and can be `{% include %}`’d.

## Licenses

- License templates live in `licenses/` and are referenced as `{% include license.id ~ ".j2" %}`.
- If you use a new `license.id`, add a matching `licenses/<id>.j2`.
