---
name: enrich-sociological-content
description: "Enrich a sociological page's frontmatter with domain-specific typed relations"
---

# Enrich Sociological Content

Add domain-specific typed relations to a sociological page's frontmatter based on the [Sociological ASR specification](../../index.md).

## Procedure

1. **Read the target page.** Note its current `type:`, `defines:`, `tags:`, and any existing relations.

2. **Determine the sociological content type.** Based on the page body and directory location:
   - Does it define a single term or name a phenomenon? → `term`
   - Does it explain how multiple terms relate as a mechanism? → `concept`
   - Does it present a theoretical tradition with commitments and methods? → `school`
   - Does it teach through structured sequence with prerequisites? → `lesson`
   - Does it advance an argument or present a case study? → `text`
   - If none of these apply, keep the general ASR type.

3. **Identify required relations.** Consult the [content types specification](../../index.md) for MUST and SHOULD requirements:

   | Type | MUST have | SHOULD have |
   |------|-----------|-------------|
   | `term` | `defines:` | `cites:`, `school:` |
   | `concept` | `defines:` | `integrates:`, `cites:`, `produces:`, `sustains:` |
   | `school` | — | `cites:`, `extends:`, `contests:` |
   | `lesson` | `requires:`, `teaches:` | `uses-concepts:` |
   | `text` | — | `cites:`, `authors:`, `supports:`, `contests:` |

4. **Read the page body for implicit relations.** Look for:
   - References to thinkers or texts → `cites:`
   - Discussion of what conditions produce a phenomenon → `emerges-under:`
   - Discussion of what a mechanism generates → `produces:`
   - Discussion of what a mechanism maintains → `sustains:`
   - Assembly of multiple named terms into a framework → `integrates:`
   - Named theoretical traditions → `school:`
   - Critique of other positions → `contests:`

5. **Add relations to frontmatter.** Only add relations that are accurate based on the page content.
  Do not invent relations the content does not support.

6. **Update `type:` if appropriate.** Many sociology pages in this vault are currently typed `term` when they function as `concept` pages (explaining mechanisms rather than defining vocabulary).
  If the content primarily shows how things work together rather than defining a single thing, the type should be `concept`.

7. **Populate `cites:` from body references.** If the body references specific thinkers (linked to `general/people/` pages) or specific works, add them to `cites:`.
  This is the most commonly missing relation in existing sociology content.

8. **Verify.** Re-read the page to confirm the frontmatter is consistent with the body.

## Constraints

- Do not modify body content.
  This skill only touches frontmatter.
- Do not add relations to pages you have not read.
- Prefer existing page paths for relation targets.
  If a target page does not exist, use a descriptive string value instead of a broken path.
- Sociological types have moderate MUST requirements.
  A term without `defines:` is ill-formed, but a term without `cites:` is merely incomplete.
  Do not force relations that the content does not support.
- The `school:` relation is for explicit tradition affiliation.
  Do not assign school affiliation based on directory location alone — a term in `sociology/terms/` may be used by multiple schools.
