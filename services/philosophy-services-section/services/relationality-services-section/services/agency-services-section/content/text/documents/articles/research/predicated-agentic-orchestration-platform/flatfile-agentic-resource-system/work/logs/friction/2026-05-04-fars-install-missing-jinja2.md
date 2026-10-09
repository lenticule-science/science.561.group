---
name: 2026-05-04-fars-install-missing-jinja2
description: Fresh `uv tool install fars` is missing jinja2 — every template-driven harness fails
type: friction-log
class: package-deps
date: 2026-05-04
status: open
see-also: [2026-05-04-substrate-records-by-hand]
title: 2026-05-04-fars-install-missing-jinja2
date-created: 2026-05-04
---

# Fresh `uv tool install fars` is missing jinja2 — every template-driven harness fails

Installed fars via `uv tool install --editable /home/emsenn/561/operations/engineering/fars`.
Tried `fars install-harness nix-flake --dry-run` to materialize the new harness.
Got:

```
harness 'nix-flake': install failed — nix-flake harness requires jinja2 (install with `pip install jinja2`)
```

This isn't specific to the new harness — `repo-instructions`, `replit-config`, and any other Jinja-templated harness fail the same way.

Tried: the suggested `pip install jinja2` — failed with PEP 668 externally-managed-environment (the right answer in 2026 for Debian/Ubuntu).

Had to: `uv tool install --reinstall --with jinja2 --editable <fars-path>` to rebuild the tool's managed venv with jinja2 included.
Worked, but only obvious because I knew about uv's `--with`.

Violates: the substrate's commitment that *installing fars from its declared dependencies should produce a working fars*.
Every harness that uses templates (the majority) is unusable on a fresh install because jinja2 isn't in `pyproject.toml`'s `dependencies`.

Gap: fars's `pyproject.toml` declares only `pyyaml`.
Three plausible fixes, in order of escalation:

1. *Add jinja2 to runtime deps* — simplest. fars-the-CLI is the harness installer; harnesses are not optional in practice; jinja2 is part of the contract.
2. *Add `[project.optional-dependencies] harness = ["jinja2>=3"]`* — keeps jinja2 optional but discoverable; users would `uv tool install fars[harness]`.
  Better than current but still a sharp edge for newcomers who don't know about extras.
3. *Lazily install jinja2 from inside the installer when a templated harness is invoked* — cute but probably wrong; runtime pip-installation in a managed-venv tool is a layering violation.

(1) is the right answer.
The "lazily import jinja2 with a helpful error" pattern in `install_harness.py` was probably written when jinja2 was a heavy dep worth deferring; today it's small and used by every non-trivial harness, so the optional-import dance is performing scrupulousness without delivering benefit.

Adjacent friction worth flagging for the same fix-pass: harnesses targeting `.claude/` and similar dirs require **no** runtime deps beyond pyyaml; they would still install fine if jinja2 were a runtime dep.
So adding it doesn't break the lightweight non-templated harnesses.
