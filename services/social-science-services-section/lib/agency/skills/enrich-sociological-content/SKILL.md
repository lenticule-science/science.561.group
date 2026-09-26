---
name: enrich-sociological-content
description: Classify a sociological page (term / concept / school / lesson / text) and add the typed relations its content supports — `cites:`, `produces:`, `sustains:`, `integrates:`, etc.
requires-capabilities:
  - read
  - path-corpus
  - markdown-search-workbench
  - term-intension
  - read-term-catalog
  - markdown-metadata-workbench
  - relate-relations
  - write
---

# Enrich Sociological Content

Sociological writing has its own structural vocabulary: terms (single phenomena), concepts (mechanisms), schools (theoretical traditions), lessons (structured teaching), texts (arguments, case studies). The relations between them — citation, integration, contestation — carry the field's structural content. This skill makes that structure explicit in frontmatter when the body supports it.

## When to use

A sociological page makes citations, integrates concepts, or operates within a tradition, but its frontmatter doesn't yet show that. The body shouldn't change; the metadata should reflect what the body does.

## How it works

1. **Read the page.** Note current `type:`, `defines:`, `tags:`, existing relations.

2. **Classify the sociological content type.**
   - Defines a single term or names a phenomenon → `term`.
   - Explains how multiple terms relate as a mechanism → `concept`.
   - Presents a theoretical tradition with commitments and methods → `school`.
   - Teaches through structured sequence with prerequisites → `lesson`.
   - Advances an argument or presents a case study → `text`.

3. **Identify required and recommended relations:**

   | Type | MUST have | SHOULD have |
   |------|-----------|-------------|
   | `term` | `defines:` | `cites:`, `school:` |
   | `concept` | `defines:` | `integrates:`, `cites:`, `produces:`, `sustains:` |
   | `school` | — | `cites:`, `extends:`, `contests:` |
   | `lesson` | `requires:`, `teaches:` | `uses-concepts:` |
   | `text` | — | `cites:`, `authors:`, `supports:`, `contests:` |

4. **Read the body for implicit relations.**
   - References to thinkers or texts → `cites:`.
   - What conditions produce a phenomenon → `emerges-under:`.
   - What a mechanism generates → `produces:`.
   - What a mechanism maintains → `sustains:`.
   - Multiple named terms assembled into a framework → `integrates:`.
   - Named theoretical traditions → `school:`.
   - Critique of other positions → `contests:`.

5. **Update `type:` if appropriate.** Pages currently typed `term` may actually function as `concept` (explaining a mechanism rather than defining vocabulary). If the content primarily shows how things work together rather than defining a single thing, type should be `concept`.

6. **Populate `cites:` from body references.** If the body references thinkers or specific works, add them to `cites:`. This is the most commonly missing relation in existing sociology content.

7. **Verify.** Re-read the page; confirm frontmatter matches the body.

## Rules

- Don't modify body content.
- Don't add relations to pages you haven't read.
- Prefer existing page paths for relation targets. If a target doesn't exist, use a descriptive string rather than a broken path.
- A term without `defines:` is ill-formed; a term without `cites:` is merely incomplete. Don't force relations the content doesn't support.
- The `school:` relation is for explicit tradition affiliation. Don't assign affiliation based on directory location alone — a term in `sociology/terms/` may be used by multiple schools.

## Note

This skill encodes a particular structural vocabulary that doesn't currently match the potential library frontmatter conventions. Confirm with the potential spec before applying — the relations enumerated here are from the original sociology-content spec; the current library may use different ones.
