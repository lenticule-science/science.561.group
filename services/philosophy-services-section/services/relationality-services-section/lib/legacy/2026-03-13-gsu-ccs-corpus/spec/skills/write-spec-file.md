---
description: "Writes a new spec file for a node given its math unit ids and four claim lists (MUST, CANNOT, CAN, PENDING). Use when a concept has enough mathematical grounding and a non-empty MUST list to warrant a new spec file."
skill-closure-kind: process
---

# write-spec-file
*Process — no branching. Execute each line.*

Given: node name, math unit id(s), MUST list, CANNOT list, CAN list, PENDING list.

1. Create `spec/[node-name].md`
2. Write line: `# [Node Name]`
3. Write section `## What this is` — one paragraph stating the mathematical object and citing each math unit id as `§unit-id`
4. Write section `## MUST` — one bullet per item in MUST list; each bullet ends with `— §unit-id`
5. Write section `## CANNOT` — one bullet per item in CANNOT list; each bullet ends with `— breaks §unit-id`
6. Write section `## CAN` — one bullet per item in CAN list; no citation required
7. Write section `## Pending` — one bullet per item in PENDING list; each bullet ends with `— blocked by: [gap name]`; if PENDING list is empty, write the section header with the single line `(none)`
8. Save the file
