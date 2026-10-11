# INBOX.md

Incoming Messages to the src/ department. Each entry is a [Message](spec/message.md).
Written by `skills/deposit-message-in-agent-inbox.md`. Triage every
Message before reading PLANS.md. Status must be set on every Message before
work begins.

### Message
- from: root
- date: 2026-03-17
- type: WorkItem
- urgency: Normal
- subject: Add PostToolUse hook to warn when .md files are backtick-quoted instead of linked
- status: acknowledged — promoted to src/PLANS.md as `add-md-link-hook`

---

### Message
- from: root
- date: 2026-03-16
- type: GapFound
- urgency: Normal
- subject: src/ derivation architecture -- markdown reader, derive/ scripts, and Pydantic Unit models needed.
- status: deferred

These came from operator prompt on 2026-03-16. Background: `spec/unit.md` defines
Unit conceptually; `src/` needs the code counterpart.

### Message
- from: root
- date: 2026-03-17
- type: FixNeeded
- urgency: Normal
- subject: migrate src/engine/ to src/repo/
- status: acknowledged — promoted to src/PLANS.md as `migrate-engine-to-repo`

Rename src/engine/ → src/repo/ to match the relational-repository / relational-service-system split. Update all imports (src.engine.* → src.repo.*), update .mcp.json command, update docker-compose.yml. The service stubs (agents/, graphs/, frontier/, normalization_kernel/, observation_layer/) move to src/service/.

