---
name: Enrich Games Content
description: Add typed relations and correct type fields to games content based on the ludic ASR specification.
type: operational
id: enrich-games-content
region:
  reads:
    - content/games/
    - content/games/specifications/ludic-agential-semioverse-repository/
  writes:
    - content/games/
authors:
  - claude-opus-4-6
date-created: 2026-03-06T00:00:00
keywords:
  - AgentialSemioverse
  - Enrichment
---

# Enrich Games Content

Add or correct typed semantic relations on pages within `content/games/` based on the [ludic ASR specification](../../index.md).

## When to use

Run this skill on any page in `content/games/` that is missing required or recommended frontmatter fields, or whose `type:` does not match its directory position and content.

## Inputs

- **target**: path to a single file or directory within `content/games/`

## Procedure

1. **Read the target file.** Parse its frontmatter and body.

2. **Determine content type.** Use directory position and content:
   - Files in `terms/` → `type: term`
   - Files in `curricula/` → `type: lesson` (check `kind:` for
     lesson/curriculum/history/genealogy)
   - Files in `specifications/` → `type: specification` (update from
     `type: topic` if needed)
   - Files in `texts/` → `type: text`
   - Directory index files → `type: index` or `type: topic` depending
     on content

3. **Identify required relations.** Based on the type:
   - **term**: MUST have `defines:`. SHOULD have `cites:`.
   - **lesson**: MUST have `teaches:`. SHOULD have `requires:`.
     SHOULD have `uses-mechanic:`.
   - **specification**: SHOULD have `classifies:`, `uses-mechanic:`,
     `boundary-with:`.
   - **text**: SHOULD have `cites:`, `authors:`. MAY have `models:`,
     `uses-mechanic:`.

4. **Read the body for implicit relations.** Look for:
   - Markdown links to term pages → candidates for `uses-mechanic:`
   - References to theorists or works → candidates for `cites:`
   - References to game types or traditions → candidates for
     `classifies:` or `models:`
   - References to prerequisite concepts → candidates for `requires:`

5. **Add missing frontmatter fields.** Add only fields supported by evidence in the body.
  Use absolute paths from content root for relation targets (e.g., `/games/terms/mechanic.md`).

6. **Update type if needed.** If a specification page has `type: topic, kind: specification`, update to `type: specification`.

7. **Populate cites: where possible.** If the body mentions specific theorists, works, or traditions by name, add them to `cites:`.

8. **Verify.** Re-read the file.
  Confirm all MUST fields are present and all added relations are supported by body content.
  Run `validate-content.py` on the file if validation rules exist.

## Output

The target file with enriched frontmatter.
No body content is modified.

## Notes

- Do not invent relations unsupported by the body text.
- Prefer existing link targets over creating new paths.
- The `kind:` field on lessons is descriptive, not prescriptive — preserve the existing value.
- Tags are currently empty across most games content; populating them is a separate task.
