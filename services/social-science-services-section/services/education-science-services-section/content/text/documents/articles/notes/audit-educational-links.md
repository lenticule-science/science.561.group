---
description: Audit cross-references between education content and other domains, identifying missing bidirectional links
id: audit-educational-links
name: audit-educational-links
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "audit educational links"
  - "check cross-references"
  - "audit education cross-links"
inputs:
  scope: string?
outputs:
  missing_links: number
  recommendations: object
region:
  reads: ["content/"]
  writes: []
dependencies: []
scopes: []
part-of: education/specifications/educational-agential-semioverse-repository
---
Audit educational cross-references: $ARGUMENTS

## What this does

Checks that cross-references between education content and other domains (sociology, philosophy, linguistics, mathematics, general) are bidirectional and complete. The vault's design philosophy treats emergent connections between domains as primary — but connections that exist in only one direction are invisible from the other side.

## Instructions

1. Determine scope. If a specific path is given, audit that subtree. Otherwise, audit all of `content/education/`.

2. For each `.md` file in scope, extract all links to files outside `content/education/`:

```bash
grep -roh '$$.*$$(.*\.md)' content/education/ | grep -v 'content/education/' | sort -u
```

3. For each outbound link, check whether the target file links back to the source (or to any file in `content/education/`).

4. For each file in scope, check whether files in other domains link TO it:

```bash
grep -rl 'education/' content/sociology/ content/philosophy/ content/linguistics/ content/mathematics/ content/general/ 2>/dev/null
```

5. Classify each finding:

### Link categories

- **Bidirectional**: A links to B and B links to A (or to A's parent/sibling). Good.
- **Outbound only**: Education references another domain but that domain does not reference education back. The connection is invisible from the other side.
- **Inbound only**: Another domain references education but education does not reference it back. Education content misses a relevant connection.
- **Missing**: A conceptual relationship exists (same person, same concept, same tradition referenced in both domains) but no explicit link connects them.

### Priority assessment

For each missing or one-directional link, assess priority:

- **High**: The connection is central to understanding both pages (e.g., a pedagogy school page that discusses a sociological concept without linking to the sociology term page).
- **Medium**: The connection would be useful but is not essential (e.g., a general person page that could link to the education context where they appear).
- **Low**: The connection exists conceptually but a link would add clutter without clarity.

## Output format

```
## Cross-Reference Audit: [scope]

### Summary
- Files scanned: X
- Outbound links checked: X
- Bidirectional: X
- Outbound only: X
- Inbound only: X

### Missing or one-directional links (High priority)

| Source | Target | Direction | Recommendation |
|---|---|---|---|
| [source path] | [target path] | outbound only | Add link from target to source |

### Missing or one-directional links (Medium priority)
[same format]

### Missing or one-directional links (Low priority)
[same format]
```

Do not make edits. Report only. The vault owner decides which links to add.
