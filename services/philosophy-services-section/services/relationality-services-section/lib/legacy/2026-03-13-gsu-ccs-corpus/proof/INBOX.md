# proof/INBOX.md

Incoming messages from other departments. Triaged by `improve-proofs` Step 0,
before PLANS or IDEAS. Each message is a [Message](../spec/message.md).

Do not work items directly from INBOX. Triage first: promote to PLANS if
actionable, move to IDEAS if not yet actionable, decline if irrelevant.

### Message
- from: root
- date: 2026-03-16
- type: FixNeeded
- urgency: Low
- subject: Migrate section-id references in proof/skills/ to standard markdown links.
- status: acknowledged — promoted to proof/PLANS.md as `section-reference-migration`

The `section-id` sigil convention is abolished. Cross-references are now standard markdown
links (see root CLAUDE.md and root SOUL.md `links-not-sigils` principle).

Replace `section-id` in proof/skills/ files with `[anchor-id](path.md)`:
- Math unit references: `nucleus` -> `[nucleus](../../math/nucleus.md)`
- Spec references: `work-item` -> `[work-item](../../spec/work-item.md)`

Scope: ~10 references across 6 proof/skills/ files. Low urgency -- math/ migration
is larger and higher priority.
