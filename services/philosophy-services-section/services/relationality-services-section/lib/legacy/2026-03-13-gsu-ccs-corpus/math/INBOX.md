# math/INBOX.md

Incoming messages from other departments. Triaged by `do-math-work` on entry,
before PLANS or IDEAS. Each message is a [Message](../spec/message.md).

Do not work items directly from INBOX. Triage first: promote to PLANS if
actionable, move to IDEAS if not yet actionable, decline if irrelevant.

### Message
- from: root
- date: 2026-03-16
- type: FixNeeded
- urgency: Normal
- subject: Migrate all section-id references in math/ to standard markdown links.
- status: acknowledged — promoted to math/PLANS.md as `section-reference-migration`

The repository has adopted markdown links as the standard cross-reference syntax.
The `section-id` sigil convention is abolished (see root CLAUDE.md and root SOUL.md
`links-not-sigils` principle).

**What to do:** Replace every `section-id` occurrence in math/ unit files and
math/skills/ files with `[anchor-id](relative/path/to/file.md)`.

- References to other math/ units: `nucleus` -> `[nucleus](nucleus.md)` (same dir)
- References to spec/ concepts: `work-item` -> `[work-item](../spec/work-item.md)`

Scope: approximately 250 math/ unit files, each with multiple references.
This is a large mechanical migration. It is correct to batch it by file or by
section rather than attempting it all at once.

The `{#anchor-id}` syntax on headers MUST be kept -- that defines link targets and
is correct practice. Only the `section-id` reference syntax is being replaced.
