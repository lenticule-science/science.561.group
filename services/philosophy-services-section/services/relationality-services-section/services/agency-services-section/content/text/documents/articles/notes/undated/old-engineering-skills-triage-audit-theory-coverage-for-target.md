---
name: audit-theory-coverage-for-target
description: "Walk a dev-docs path; for every cited theory entity, resolve via `fars show` and classify by status (proved / draft / stated / missing / not-a-theory-entity). Output a coverage report."
status: triage
owner-agent: theory-supporter
project: supporting-pypredcomp-development
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: audit-theory-coverage-for-target
---

The mechanical half of theory-coverage analysis. Pure data; no judgment.

## Inputs

- `target` — a path under `operations/engineering/tools/predication-computer/pypredcomp/docs/dev/` (file or directory).

## Outputs

A coverage report with shape (see [`specs/methodology/coverage-report-shape.md`](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/command/projects/supporting-pypredcomp-development/specs/methodology/_index.md)):

For each markdown file under `target`:

- The set of theory-entity slugs it cites (from frontmatter `depends-on:`, explicit math citations in body prose, and slug-shaped tokens).
- For each cited slug: status (`proved` / `draft` / `stated` / `missing` / `not-a-theory-entity`), location in the math substrate, presence of `lean:` binding.

## Procedure

1. Walk the target path.
2. For each `.md` file, parse frontmatter and body.
3. Extract candidate slugs: `depends-on:` list items, markdown links to anything under `library/theories/.../predication-categories/`, slug-shaped tokens in body prose.
4. For each candidate, call `fars show <slug>`. Classify the result.
5. Emit report in markdown with a table per file.

## Judgment is out of scope

This skill does not decide whether a citation is *load-bearing*. That's [`identify-load-bearing-theory-gaps`](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/content/artificial-intelligence/machine-learning/neural-network/language-models/agentic-systems/agent-skills/identify-load-bearing-theory-gaps/SKILL.md), which consumes this report.

## Graduation criteria

Will graduate to `operations/engineering/skills/<pack>/audit-theory-coverage-for-target/` once:

- It has run on at least three different dev-doc paths.
- The slug-extraction heuristic has been refined enough to have negligible false-positive rate.
- The captain has approved a stable coverage-report shape.
