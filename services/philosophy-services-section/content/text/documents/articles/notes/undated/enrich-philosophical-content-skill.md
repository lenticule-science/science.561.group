---
id: enrich-philosophical-content
description: "Enrich a philosophical page's frontmatter with domain-specific typed relations"
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "enrich philosophy"
  - "enrich philosophical content"
  - "add philosophy relations"
inputs:
  page_path: string
outputs:
  modified_path: string
  relations_added: string[]
region:
  reads: ["content/philosophy/"]
  writes: ["content/philosophy/"]
dependencies:
  - fix-frontmatter
aliases:
  - enrich-philosophical-content
title: Enrich Philosophical Content
---

# Enrich Philosophical Content

Add domain-specific typed relations to a philosophical page's frontmatter based on the [Philosophical ASR specification](../../../../triage/index.md).

## Procedure

1. **Read the target page.** Note its current `type:`, `defines:`, `tags:`, and any existing relations.

2. **Determine the philosophical content type.** Based on the page body:
   - Does it advance a proposition as true, inviting evaluation? → `claim`
   - Does it present premises and a conclusion supporting a claim? → `argument`
   - Does it challenge a specific claim or argument? → `objection`
   - Does it reply to an objection? → `response`
   - If none of these apply, keep the general ASR type (`term`, `concept`, `text`).

3. **Identify required relations.** Consult the [content types specification](../../../../triage/index.md) for MUST and SHOULD requirements:

   | Type | MUST have | SHOULD have |
   |------|-----------|-------------|
   | `claim` | — | `argued-by:` |
   | `argument` | `supports:` | `argument-form:`, `requires:` |
   | `objection` | `targets:` | `addressed-by:`, `proposes:` |
   | `response` | `addresses:` | `revises:`, `concedes:` |

4. **Read the page body for implicit relations.** Look for:
   - References to what tradition the content belongs to → `tradition:`
   - Phrases like "argues that," "supports the claim" → `supports:`
   - Phrases like "objects to," "challenges" → `targets:`
   - References to prerequisite concepts → `requires:`

5. **Add relations to frontmatter.** Only add relations that are accurate based on the page content. Do not invent relations the content does not support.

6. **Update `type:` if appropriate.** Most philosophical pages in this vault are currently typed `term` or `concept`. If the content is actually making a claim, presenting an argument, or raising an objection, the type should reflect that.

7. **Add `tradition:` where applicable.** If the page operates within a specific philosophical tradition (e.g., intuitionistic, classical, pragmatist), note it.

8. **Verify.** Re-read the page to confirm the frontmatter is consistent with the body.

## Constraints

- Do not modify body content. This skill only touches frontmatter.
- Do not add relations to pages you have not read.
- Prefer existing page paths for relation targets. If a target page does not exist, use a descriptive string value instead of a broken path.
- Philosophical types have fewer MUST requirements than mathematical types. A claim without arguments is an assertion — weaker, but not ill-formed. Do not force relations that the content does not support.
