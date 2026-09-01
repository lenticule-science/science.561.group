---
description: Create a new plan document for a proposed body of work
id: create-plan
name: create-plan
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "create a plan"
  - "write a plan"
  - "plan for"
  - "propose work on"
inputs:
  title: string
  motivation: string?
outputs:
  path: string
region:
  reads: ["content/technology/specifications/agential-semioverse-repository/plans/"]
  writes: ["content/technology/specifications/agential-semioverse-repository/plans/"]
dependencies: []
scopes: []
part-of: technology/specifications/agential-semioverse-repository
---
Create a plan for: $ARGUMENTS

## Instructions

1. Read the plans specification at
   `content/technology/specifications/agential-semioverse-repository/plans/index.md`.

2. Determine the next plan number by listing existing plans:

```bash
ls content/technology/specifications/agential-semioverse-repository/plans/[0-9]*.md 2>/dev/null | sort | tail -1
```

If no plans exist, start at 0001. Otherwise increment.

3. Copy the template:

```bash
cp content/technology/specifications/agential-semioverse-repository/plans/_template-plan.md \
   content/technology/specifications/agential-semioverse-repository/plans/NNNN-slug.md
```

4. Fill in the plan:

   - **title**: concise description of the work
   - **date-created**: today's date in ISO 8601
   - **authors**: who proposed the plan (emsenn, claude, or both)
   - **status**: `draft` (plans always start as drafts)
   - **Summary**: one paragraph — what and why
   - **Motivation**: why this work matters now, what problem it solves
   - **Steps**: numbered, concrete, verifiable actions
   - **Done when**: acceptance criteria as a checklist
   - **Dependencies**: what must exist before this work can start
   - **Log**: initial entry with creation date

5. Do NOT set status to `active`. Only emsenn approves plans.

6. Report the path of the created file.

## Anti-slop checklist

- Steps are concrete actions, not vague aspirations
- Acceptance criteria are verifiable (not "improve X" but "X passes Y check")
- Dependencies reference actual files or specs that exist
- The plan covers ONE body of work, not multiple unrelated tasks
- The plan does not duplicate an existing active plan
