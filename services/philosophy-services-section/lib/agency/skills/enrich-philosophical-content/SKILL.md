---
name: enrich-philosophical-content
description: Classify a philosophical page (claim / argument / objection / response) and add the typed relations its content actually supports — without inventing relations.
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

# Enrich Philosophical Content

Philosophical writing has a small grammar of moves — claims, arguments, objections, responses — and the relations between them carry most of the structural content. This skill names that grammar and adds it to a page's frontmatter when the body actually supports it.

## When to use

A philosophical page is light on structural metadata but its body makes claims, presents arguments, or stages objections that could be made explicit through frontmatter relations. The body shouldn't change; the metadata should reflect what the body is doing.

## How it works

1. **Read the page.** Note its current `type:`, `defines:`, `tags:`, and any existing relations.

2. **Classify the philosophical content type** based on the body:
   - Advances a proposition as true, inviting evaluation → `claim`.
   - Presents premises and a conclusion supporting a claim → `argument`.
   - Challenges a specific claim or argument → `objection`.
   - Replies to an objection → `response`.
   - If none of these apply, leave the general type (`term`, `concept`, `text`).

3. **Identify required and recommended relations:**

   | Type | MUST have | SHOULD have |
   |------|-----------|-------------|
   | `claim` | — | `argued-by:` |
   | `argument` | `supports:` | `argument-form:`, `requires:` |
   | `objection` | `targets:` | `addressed-by:`, `proposes:` |
   | `response` | `addresses:` | `revises:`, `concedes:` |

4. **Read the body for implicit relations.** Phrases that signal:
   - Tradition the content belongs to → `tradition:`.
   - "Argues that," "supports the claim" → `supports:`.
   - "Objects to," "challenges" → `targets:`.
   - References to prerequisite concepts → `requires:`.

5. **Add only relations the content supports.** Do not invent relations the body doesn't actually establish.

6. **Update `type:` if appropriate.** Most pages currently typed `term` or `concept` may actually be making a claim, presenting an argument, or raising an objection. The type should reflect what the body does.

7. **Add `tradition:` where applicable.** Intuitionistic, classical, pragmatist, etc. — only when the page actually operates within a specific tradition.

8. **Verify.** Re-read the page to confirm the frontmatter is consistent with the body.

## Rules

- Don't modify body content. This skill only touches frontmatter.
- Don't add relations to pages you haven't read.
- Prefer existing page paths for relation targets. If a target page does not exist, use a descriptive string value rather than a broken path.
- Philosophical types have fewer MUST requirements than mathematical types. A claim without arguments is a weaker assertion, not ill-formed. Don't force relations the content doesn't support.

## Note

This skill encodes a particular structural vocabulary (the claim/argument/objection/response set) that doesn't currently match the potential library frontmatter conventions. Confirm with the potential spec before applying — the relations enumerated here are *the* set the original spec used; the current library may use a different set or call them differently.
