---
description: "Routes a list of PromptUnits to their correct department queues by writing each unit into the appropriate context file. Use after interpret-prompt to place PromptUnits where the owning department's improvement skill will find them."
skill-closure-kind: procedure
---

# route-prompt-units

domain:
- `units` — list of PromptUnits produced by `interpret-prompt`

For each unit in `units`, apply the rule matching its `type`:

**Principle units** — routed directly to SOUL.md (not to INBOX):
- Principles are meta-level constraints, not work to be done. They do not need
  departmental triage.
- IF `department` is `root` or the principle is cross-cutting:
  → Append to root `SOUL.md` as a Principle entry (see [principle](../spec/principle.md)).
  → Check for existing principles that already capture the intent — only append
    if genuinely novel.
- IF scoped to a specific department:
  → Append to `{department}/SOUL.md` as a Principle entry.

**All other unit types** — routed to the target department's INBOX.md as a Message:
- The receiving department's improvement skill triages INBOX before working PLANS
  and IDEAS. It decides what becomes a WorkItem, what becomes an Idea, and what
  gets deferred. Do not write directly to IDEAS or PLANS from here.
- Compose a Message (see [message](../spec/message.md)) with:
  - `from: root`
  - `type:` `GapFound` for Gap/Question units; `FixNeeded` for WorkItem units;
    `Discovery` for Idea/Conjecture units
  - `urgency: Normal` unless the unit is explicitly marked blocking
  - `subject:` one sentence from `unit.text`
  - body: full content of the unit including all type-specific fields
    (`action`, `problem`, `evidence`, `location` as applicable), plus context
    about which operator prompt it came from and when
- Append the Message to `{department}/INBOX.md`.
- IF `{department}/INBOX.md` does not exist:
  → Call `skills/deposit-message-in-agent-inbox.md` to send a GapFound to root about
    the missing INBOX file, then append to root INBOX.md instead.

After routing all units:
- Produce a routing report: for each unit, one line: `{type} → {department}/INBOX.md`
  (or `→ {department}/SOUL.md` for Principles)

codomain: a routing report listing where each PromptUnit was placed; and the set
of context file edits made.
