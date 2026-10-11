# INBOX.md

Incoming Messages to the root / orchestrator level. Each entry is a [Message](spec/message.md).
Written by `skills/deposit-message-in-agent-inbox.md`. Triage every
Message before reading PLANS.md. Status must be set on every Message before
work begins.

### Message
- from: spec
- date: 2026-03-16
- type: FixNeeded
- urgency: Normal
- subject: Rename proof/PLANS_PROOF.md -> proof/PLANS.md and src/PLANS_SRC.md -> src/PLANS.md to match the standardized department naming convention.
- status: resolved — renames complete; stale references in math/PLANS.md, README.md, src/docs/lessons/math-writing.md, math/hyperversal-coordinate.md fixed 2026-03-17

All departments now use `PLANS.md` (not `PLANS_X.md`). The proof/ and src/
departments still have old names. The root PLANS.md references these old names
and will become stale if not updated. Please rename the files and update any
internal references. Root PLANS.md will also need its table updated once done.

### Message
- from: spec
- date: 2026-03-16
- type: GapFound
- urgency: Normal
- subject: math/, proof/, and src/ departments are missing SOUL.md, MEMORY.md, and INBOX.md -- required by the AgentLoop spec.
- status: resolved — all six context files confirmed present in math/, proof/, src/ as of 2026-03-17

spec/agent-loop.md requires every department to have six context files: SOUL.md,
AGENTS.md, MEMORY.md, INBOX.md, PLANS.md, IDEAS.md. math/ and proof/ currently
have AGENTS.md, PLANS.md, and IDEAS.md but are missing SOUL.md, MEMORY.md, and
INBOX.md. src/ may be missing all six. Please create the missing files following
the formats defined in spec/principle.md (for SOUL.md), spec/memory-entry.md
(for MEMORY.md), and spec/message.md (for INBOX.md).

