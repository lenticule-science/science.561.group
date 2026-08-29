---
title: "Config Schema"
date-created: 2026-03-06T00:00:00
---
# Config Schema

`establish.py` accepts either CLI flags or a YAML config file (`--config path/to/config.yaml`).

Top-level keys:

- `template` (string, required): template directory name under `templates/`
- `output_path` (string, required): where to create the repo (directory path)
- `project` (mapping, optional): project metadata used in templates
- `github` (mapping, optional): GitHub metadata used for badges/links and templates
- `license` (mapping, optional): license selection
- `metadata` (mapping, optional): free-form-ish metadata used by some templates
- `init_git` (bool, optional, default `true`): run `git init`
- `initial_commit` (bool, optional, default `false`): make an initial commit

## `project`

- `name` (string): display name (defaults to `output_path` folder name)
- `description` (string)
- `author` (string)
- `contact_email` (string): preferred for policies (Code of Conduct, Security)
- `organization` (string): used as a fallback GitHub owner if `github.owner` is not set

## `github`

- `owner` (string): GitHub org/user (enables badges when set)
- `repo` (string): GitHub repo name (defaults to slugified `project.name`)
- `default_branch` (string, default `main`)
- `include_codeowners` (bool, default `true`): if false, generates a commented CODEOWNERS placeholder
- `include_funding` (bool, default `false`): if true, generates a FUNDING.yml (otherwise commented placeholder)
- `badges` (mapping, optional):
  - `tags` (bool, default `false`): if true, renders tag badges (only when `metadata.tags` has 3 or fewer entries)

## `license`

- `id` (string): must correspond to a file `licenses/<id>.j2` (e.g. `MIT`, `Unlicense`, `WTFPL`)

## `metadata`

- `created` (YYYY-MM-DD): ISO date string
- `status` (string)
- `tags` (list of strings)
