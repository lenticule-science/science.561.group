---
description: Record an idea under the appropriate thing's directory
id: record-idea
name: record-idea
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "record idea"
  - "note this idea"
  - "idea about"
inputs:
  idea: string
  thing: string?
outputs:
  path: string
region:
  reads: ["content/"]
  writes: ["content/"]
dependencies:
  - find-thing
scopes: []
part-of: technology/specifications/agential-semioverse-repository
title: record-idea
---
Record idea: $ARGUMENTS

## Instructions

1. **Identify the thing** the idea belongs to. Use `/find-thing` if needed.

2. **Append to or create `ideas.md`** in the thing's directory. If `ideas.md`
   does not exist, create it with frontmatter:
   ```yaml
   ---
   title: "Ideas — {thing title}"
   date-created: {today}
   ---
   ```

3. **Add the idea** as a dated entry:
   ```markdown
   ## {date} — {brief title}

   {idea content}
   ```

4. **Report** the path and what was recorded.
