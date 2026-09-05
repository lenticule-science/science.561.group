---
description: Record an architectural or operational decision as an ADR
id: record-decision
name: record-decision
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "record a decision"
  - "write a decision record"
  - "document this decision"
  - "ADR for"
inputs:
  title: string
  context: string?
  decision: string?
outputs:
  path: string
region:
  reads: ["content/technology/specifications/agential-semioverse-repository/plans/"]
  writes: ["content/technology/specifications/agential-semioverse-repository/plans/decisions/"]
dependencies: []
scopes: []
part-of: technology/specifications/agential-semioverse-repository
---
Record a decision about: $ARGUMENTS

## Instructions

1. Read the plans specification at
   `content/technology/specifications/agential-semioverse-repository/plans/index.md`
   for decision record format.

2. Determine the next decision number:

```bash
ls content/technology/specifications/agential-semioverse-repository/plans/decisions/[0-9]*.md 2>/dev/null | sort | tail -1
```

If no decisions exist, start at 0001. Otherwise increment.

3. Copy the template:

```bash
cp content/technology/specifications/agential-semioverse-repository/plans/decisions/_template-decision.md \
   content/technology/specifications/agential-semioverse-repository/plans/decisions/NNNN-slug.md
```

4. Fill in the decision record:

   - **title**: concise description of what was decided
   - **date-created**: today's date in ISO 8601
   - **authors**: who made or proposed the decision
   - **status**: `accepted` if emsenn approved it during the session,
     `proposed` if recording a recommendation for review
   - **Context**: what situation prompted this decision — what forces
     were at play, what problem needed solving
   - **Decision**: what was decided, stated clearly and directly
   - **Consequences**: what follows — what becomes easier, what becomes
     harder, what needs watching
   - **Alternatives considered**: what was rejected and why — include
     at least one alternative with a reason for rejection

5. Decision records are **append-only**. When a decision is superseded:
   - Add `superseded-by: NNNN` to the old record's frontmatter
   - Change its status to `superseded`
   - The new decision's Context should reference the old one
   - NEVER edit the body of the old decision

6. Report the path of the created file.

## When to record a decision

Record a decision when:

- A choice affects how the repository is organized or operates
- The choice involved considering alternatives
- Future sessions might wonder "why is it done this way?"
- emsenn makes a directive that changes how agents should work

Do NOT record decisions for:

- Routine content creation (that is a work unit, not a decision)
- Temporary workarounds (those go in working-notes.md)
- Implementation details that follow from an existing spec
