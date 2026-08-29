---
name: find-weak-runbook

description: "Scans runbooks/ and returns runbooks ranked by weakness: missing inputs/outputs, steps without ids, hardcoded values, broken step references."
skill-closure-kind: inquiry
---

domain: none — reads `runbooks/*.yaml` autonomously

codomain: a ranked list of runbooks from weakest to strongest, each with a score
and a list of defects tagged `auto` or `needs-input`

---

Read all `runbooks/*.yaml`.

For each file, check:

- **Missing `id`** (−2, auto)
- **Missing `description`** (−2, auto)
- **Missing `skill-closure-kind`** (−2, auto): must be one of `process`, `procedure`,
  `derivation`, `inquiry`
- **No `inputs` block** (−3, needs-input): runbook takes parameters but none declared
- **No `outputs` block** (−3, needs-input): runbook produces results but none declared
- **Step missing `id`** (−2, auto): one or more steps have no `id` field
- **Hardcoded environment value** (−3, needs-input): a step contains a literal path,
  hostname, or credential that should be a named input
- **Broken step reference** (−3, needs-input): a `call` step references a runbook `id`
  that does not exist in `runbooks/`
- **Template reference to undefined variable** (−3, needs-input): a `{{...}}` expression
  references a step id or input name that is not declared
- **No steps** (−5, needs-input): `steps:` block is empty or absent

Score = sum of penalties. Return files sorted ascending by score. Exclude score = 0.
Report total defect count.
