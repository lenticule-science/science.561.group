---
description: Update a plan — add log entries, change status, record progress
id: update-plan
name: update-plan
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "update plan"
  - "log progress on plan"
  - "complete plan"
  - "abandon plan"
inputs:
  plan_number: string
  action: string
outputs:
  path: string
region:
  reads: ["content/technology/specifications/agential-semioverse-repository/plans/"]
  writes: ["content/technology/specifications/agential-semioverse-repository/plans/"]
dependencies: []
scopes: []
part-of: technology/specifications/agential-semioverse-repository
---
Update plan: $ARGUMENTS

## Instructions

### 1. Find the plan

```bash
ls content/technology/specifications/agential-semioverse-repository/plans/[0-9]*.md | grep "$PLAN_NUMBER"
```

Read the plan file.

### 2. Determine the update type

- **log**: Add a dated entry to the Log section describing what
  was done. Include specific file paths created/modified.
- **activate**: Change status from `draft` to `active`. Only do
  this if emsenn has approved the plan.
- **complete**: Change status to `completed`. Only do this if ALL
  acceptance criteria in "Done when" are satisfied. Check each one.
- **abandon**: Change status to `abandoned`. Add a log entry
  explaining why.
- **step**: Mark a step as done in the Steps section (prefix with
  ~~strikethrough~~ or note "(DONE)") and add a log entry.

### 3. Make the edit

Edit the plan file with the update. Always add a log entry with
today's date for any change.

### 4. Commit

Commit the change with message: `Update plan NNNN: [what changed]`

### 5. Constraints

- Never change a plan's title or number.
- Never delete log entries.
- Never change status to `active` without emsenn's explicit
  approval in the current conversation.
- When completing a plan, verify each acceptance criterion is met
  and note how in the log entry.
