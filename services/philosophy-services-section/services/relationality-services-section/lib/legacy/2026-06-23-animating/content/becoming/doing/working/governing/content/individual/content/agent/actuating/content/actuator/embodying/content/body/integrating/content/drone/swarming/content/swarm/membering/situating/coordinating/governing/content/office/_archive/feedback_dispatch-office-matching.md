---
name: Dispatch must match work to offices
description: Don't dispatch generic duty officers for specialized work — use the right office. Research goes to researcher, writing goes to writer, trivial ops you do yourself.
---

Don't dispatch generic "duty officers" for specialized work.
The user caught this immediately: dispatching an untyped claude -p process to write library terms is like assigning a deckhand to navigate.

**Why:** The harness has 22 offices with specific action domains, duties, and model tiers.
Using a generic dispatch ignores all of that.
The duty-dispatch skill encodes the patterns.

**How to apply:** Before dispatching, ask: what office handles this?
Use Agent tool with subagent_type for in-session specialized work.
Reserve mash-engine start for process-type tasks where a generic agent is fine (audits, checks, bulk file ops).
Never dispatch research or writing externally without office context.
Trivial operations (mkdir, simple edits) — just do them directly.
