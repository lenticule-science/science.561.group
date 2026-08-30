---
description: Create an educational term definition page with proper structure, citations, and cross-references
id: write-term-page
name: write-term-page
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "write a term page"
  - "create a term page"
  - "define a term"
inputs:
  term: string
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
---
Write a term page for: $ARGUMENTS

## Instructions

1. Read the style guide at `content/writing/texts/style-guide.md`.

2. Identify which education discipline the term belongs to:
   - **pedagogy** — terms about teaching practice and theory
   - **learning** — terms about how understanding develops
   - **knowledge-transmission** — terms about how knowledge moves between people and communities

3. Read the discipline's existing `terms/index.md` to see what terms exist and what format they follow.

4. Check whether the term already exists:

```bash
find content/education -name "*.md" | xargs grep -li "$TERM" 2>/dev/null
```

5. Read any related term pages to understand the local context and linking conventions.

6. Write the term page following this structure:

### Required term page structure

**Location:** `content/education/disciplines/{discipline}/terms/{term-slug}.md`

**Frontmatter:**
```yaml
---
title: "term name"
aliases:
  - "term name"
  - "alternate name" # if applicable
date-created: [current ISO 8601]
type: term
tags:
  - [relevant tags, CamelCase]
defines:
  - "term name"
cites:
  - "Source Work Title"
---
```

**Body:**

- **Opening sentence**: State what the term IS in one clear sentence. Link the term to itself: `[Term](./term.md)`.
- **Definition** (1-3 paragraphs): Define the concept. Ground it in the intellectual tradition it comes from. Use `[@citekey]` for scholarly sources.
- **Concrete illustration**: At least one concrete example or scenario showing the concept in action. This is not optional — a term page without grounding in concrete experience reproduces the banking model.
- **Related terms** section: Bulleted list of related terms with one-line descriptions of the relationship. Use relative links.

### Rules

- One concept per page. If two concepts are genuinely inseparable, define both; otherwise split.
- Cite the intellectual source. Every educational term comes from somewhere — name the thinker, the text, the tradition.
- Link to the school or tradition where the term originates (if a school page exists).
- Do not define the term instrumentally ("this matters because the vault needs it"). Define it as genuine knowledge.
- Follow PTGAE: no vague adverbs, active voice, no telling the reader how to feel.
- First mention of a person uses their full name with a `[wikilink](wikilink)`.

7. After writing, update the discipline's `terms/index.md` to include the new term alphabetically.

8. Check for pages in other domains that should link to this term (e.g., sociology terms that reference the same concept). Report any recommended cross-links.
