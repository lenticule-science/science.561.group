---
description: Create a pedagogical school or tradition page with core claims, methods, key texts, critiques, and cross-tradition links
id: write-school-page
name: write-school-page
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "write a school page"
  - "create a school page"
  - "document a pedagogical tradition"
inputs:
  school: string
  discipline: string?
outputs:
  path: string
region:
  reads: ["content/"]
  writes: ["content/education/"]
dependencies:
  - make-content-folder
scopes: []
part-of: education/specifications/educational-agential-semioverse-repository
title: write-school-page
---
Write a school page for: $ARGUMENTS

## Instructions

1. Read the style guide at `content/writing/texts/style-guide.md`.

2. Read at least two existing school pages to understand the established pattern:
   - `content/education/disciplines/pedagogy/schools/critical-pedagogy/index.md`
   - `content/education/disciplines/pedagogy/schools/indigenous-pedagogies/index.md`

3. Identify the school's intellectual context. Check what already exists:

```bash
find content/education/disciplines/pedagogy/schools -name "index.md" | sort
```

4. Read relevant term pages, people pages, and cross-domain references (sociology, philosophy) that connect to this school.

5. Propose the school page to emsenn before writing. The proposal should include:
   - School name and where it fits among existing schools
   - 2-3 core claims the tradition makes
   - Key thinkers (with dates and affiliations where relevant)
   - How it relates to existing school pages
   - What the critiques section will cover

6. After confirmation, write the school page following this structure:

### Required school page structure

**Location:** `content/education/disciplines/pedagogy/schools/{school-slug}/index.md`

**Frontmatter:**
```yaml
---
title: "School Name"
aliases:
  - "School Name"
  - "school name"
date-created: [current ISO 8601]
type: school
tags:
  - [relevant tags]
---
```

**Body sections, in order:**

- **Opening paragraph**: 3-5 sentences. What this tradition IS, where it comes from, what it asserts about education. No hedging — state the core position clearly.

- **Core claims or common threads**: What the tradition argues. Use bold labels for each claim. These are the tradition's assertions about education — not neutral descriptions but committed positions.

- **Key thinkers and texts**: Named individuals with their works, dates, and brief descriptions of contributions. Use full names on first mention with `[wikilinks](wikilinks)` to people pages. Include nationality, tribal affiliation, or institutional context where relevant.

- **Relationship to other traditions**: How this school connects to, differs from, or conflicts with other pedagogical traditions represented in the vault. Use `[wikilinks](wikilinks)` to other school pages. Be specific about points of convergence and divergence — not "X is related to Y" but "X shares Y's commitment to Z but differs on W."

- **Critiques and limitations**: Honest assessment of the tradition's blind spots, tensions, and boundaries. Every school page MUST have this section. Include:
  - Internal tensions within the tradition
  - Critiques from other traditions
  - What the tradition cannot address or does poorly
  - Medium limitations (what cannot be transmitted through text)

### Rules

- Every school page MUST have a Critiques and limitations section. A tradition presented without critique is propaganda, not scholarship.
- Name the people. Intellectual traditions are made by specific people in specific contexts. Do not present ideas as free-floating.
- Cross-link to other domains. Pedagogical traditions connect to sociology (social reproduction, decolonization), philosophy (epistemology, ethics), and other education disciplines (learning theory, knowledge transmission). Make these connections explicit.
- Do not flatten diversity. If a school encompasses multiple distinct traditions (as Indigenous pedagogies encompasses hundreds of nations), say so explicitly.
- Cite sources with `[@citekey]`. Check `bibliography.bib` for existing entries.

7. After writing, check for term pages that should link to this school and update them.
