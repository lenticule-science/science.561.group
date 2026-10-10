---
description: "Scans all skills/ directories and returns skills ranked by weakness: missing closure-kind, no domain/codomain, vague step conditions, broken references."
skill-closure-kind: inquiry
---

# find-weak-skill

domain: `scope` — a skills directory path, or blank to scan all (`skills/`,
`math/skills/`, `spec/skills/`, `src/skills/`, `proof/skills/`)

codomain: a ranked list of skill files from weakest to strongest, each with a score
and a list of defects tagged `auto` or `needs-input`

---

Read all `.md` files in scope.

For each file, check:

- **Missing `description`** (−2, auto): no `description` in frontmatter
- **Missing `skill-closure-kind`** (−3, needs-input): no closure kind declared; cannot
  determine what type of work this skill does
- **No `domain` declaration** (−3, needs-input): skill takes input but doesn't name it
- **No `codomain` declaration** (−3, needs-input): skill produces output but doesn't name it
- **Vague step condition** (−2, needs-input): a step contains "as appropriate", "if needed",
  "where relevant", or "as necessary" without a stated condition
- **Unnumbered steps** (−1, auto): steps exist but are not numbered
- **Broken reference** (−3, needs-input): step calls a skill, file, or runbook that does
  not exist in the repo
- **No steps** (−4, needs-input): body has a heading but no numbered steps or procedure
- **Step calls itself** (−3, needs-input): recursive reference without a stated termination
  condition
- **Empty or heading-only body** (−5, needs-input)

Score = sum of penalties. Return files sorted ascending by score. Exclude score = 0.
Report total defect count.
