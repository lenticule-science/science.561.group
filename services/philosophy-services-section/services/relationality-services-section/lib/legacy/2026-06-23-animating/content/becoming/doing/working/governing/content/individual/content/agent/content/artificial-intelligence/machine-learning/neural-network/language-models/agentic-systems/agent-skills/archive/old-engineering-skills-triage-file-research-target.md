---
name: file-research-target
description: "When a load-bearing theory gap exceeds local prep, write a research-target record into supporting-predcalc-research/questions/research-targets/ and link the dev claim to it as a blocker."
status: triage
owner-agent: theory-supporter
project: supporting-pypredcomp-development
blocked-by:
  - "operations/command/projects/supporting-predcalc-research/specs/methodology/research-target-shape.md"
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

The hand-off skill. Writes into the sibling project's inbox.

## Inputs

- `dev-claim` — the dev-doc claim that surfaced the gap.
- `theory-entity` — the under-proved entity in the math substrate.
- `release-window` — which pypredcomp release this gates.
- `load-bearing-rationale` — why this is load-bearing per the methodology spec (cite the rule).

## Procedure

1. Generate a slug from the theory-entity name.
2. Write the record at `operations/command/projects/supporting-predcalc-research/questions/research-targets/<slug>.md` with the frontmatter shape from [`research-target-shape.md`](../../../../../../../command/projects/supporting-predcalc-research/specs/methodology/_index.md).
3. Add a `blocked-by:` entry on the dev claim pointing back at the research-target record.
4. Append a one-line entry to the project's `implementation/notes.md` recording the filing.

## What this skill does NOT do

- Attempt to answer the research target. The sibling project's `mathematical-researcher` does that.
- Decide priority. The sibling project's `prioritize-research-targets` does that.

## Graduation criteria

Will graduate once `research-target-shape.md` has landed and the skill has filed at least three real research targets that the sibling project has consumed.
