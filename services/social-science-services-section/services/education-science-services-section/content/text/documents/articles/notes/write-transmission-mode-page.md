---
description: Create a knowledge transmission mode page describing how knowledge moves, what it preserves, and whose interests it serves
id: write-transmission-mode-page
name: write-transmission-mode-page
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "write a transmission mode page"
  - "create a transmission mode"
  - "document a knowledge transmission mode"
inputs:
  mode: string
outputs:
  path: string
region:
  reads: ["content/"]
  writes: ["content/education/disciplines/knowledge-transmission/"]
dependencies:
  - make-content-folder
scopes: []
part-of: education/specifications/educational-agential-semioverse-repository
---
Write a transmission mode page for: $ARGUMENTS

## Instructions

1. Read the style guide at `content/writing/texts/style-guide.md`.

2. Read existing transmission mode pages to understand the pattern:

```bash
find content/education/disciplines/knowledge-transmission/terms -name "*.md" | sort
```

3. Read at least two existing pages in that directory, plus the discipline index at `content/education/disciplines/knowledge-transmission/index.md`.

4. Write the transmission mode page following this structure:

### Required structure

**Location:** `content/education/disciplines/knowledge-transmission/terms/{mode-slug}.md`

**Frontmatter:**
```yaml
---
title: "mode name"
aliases:
  - "mode name"
date-created: [current ISO 8601]
type: transmission-mode
tags:
  - KnowledgeTransmission
  - [additional relevant tags]
defines:
  - "mode name"
---
```

**Body sections:**

- **Opening definition** (1-2 sentences): What this mode IS — how knowledge moves through it.

- **What it preserves**: What kinds of knowledge travel well through this mode. Be specific: not "information" but "procedural knowledge embedded in muscle memory" or "narrative structure that encodes relational obligations."

- **What it transforms or loses**: What changes when knowledge passes through this mode. Every transmission mode is also a transformation — name what is gained and lost. This is the medium-awareness that the vault's design philosophy requires.

- **Politics of the mode**: Whose knowledge does this mode serve? Who controls it? How does it relate to power? A mode is never neutral — oral transmission serves communities that maintain it; textual transmission serves those with literacy and archives; institutional transmission serves those who control institutions.

- **Relationship to other modes**: How this mode interacts with, complements, or conflicts with other transmission modes. What happens when knowledge moves between modes (e.g., oral → textual, embodied → institutional).

- **Related terms**: Bulleted list linking to related concepts.

### Rules

- Every mode page MUST address what the mode loses or transforms. A mode described only by what it carries is incomplete.
- Every mode page MUST address the politics of the mode. Transmission is never neutral.
- Connect to specific traditions. Do not describe modes abstractly — name the communities and practices that use them.
- Respect knowledge sovereignty. Some transmission modes (ceremonial, restricted oral) involve knowledge that is intentionally bounded. Describe the mode without extracting the content it carries.
- Link to pedagogy and learning terms where the mode intersects with teaching practice.

5. After writing, update `content/education/disciplines/knowledge-transmission/terms/index.md` and `content/education/disciplines/knowledge-transmission/index.md` if needed.
