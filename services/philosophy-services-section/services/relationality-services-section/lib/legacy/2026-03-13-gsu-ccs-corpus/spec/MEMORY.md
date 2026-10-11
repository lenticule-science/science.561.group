# spec/MEMORY.md

Accumulated knowledge for the `spec/` department. Each entry is a MemoryEntry
(§memory-entry): a dated fact that should inform all future work here.
Append-only — entries are never deleted, only superseded by newer entries.

---

## 2026-03-16 — skill files are not unit files; domain/codomain labels do not collide

Skill files are a separate document type from unit files (math/, spec/). They
do not have `id:` frontmatter and do not appear in the knowledge graph. The
`domain:` and `codomain:` labels in skill file bodies are prose section labels,
not YAML fields — no conflict with the fields of the same names in unit
frontmatter.

## 2026-03-16 — cross-department messages sent re: PLANS rename and missing context files

Sent two FixNeeded/GapFound messages to root INBOX.md: (1) rename
proof/PLANS_PROOF.md and src/PLANS_SRC.md to PLANS.md; (2) create SOUL.md,
MEMORY.md, INBOX.md for math/, proof/, src/. Awaiting triage by those departments.

## 2026-03-16 — context-file unit types now specced

Five new spec files define the typed units for the six living documents:
spec/work-item.md (WorkItem, for PLANS.md), spec/message.md (Message, for
INBOX.md), spec/memory-entry.md (MemoryEntry, for MEMORY.md), spec/idea.md
(Idea, for IDEAS.md), spec/principle.md (Principle, for SOUL.md). Skills must
reference these types in domain/codomain when they read or write context files.

---

## 2026-03-16 — department not domain

When referring to math/, proof/, spec/, src/ as compartments of work, use
"department" not "domain". "Domain" is reserved for the categorical/skill
typing term (the `domain:` frontmatter field in skill and spec files).

---

## 2026-03-16 — skill frontmatter is now required

Every skill file must have YAML frontmatter with two fields:
- `description`: two sentences — (1) what it does to what, (2) when to use it
- `skill-closure-kind`: process | procedure | derivation | inquiry

The compliance audit in improve-specs will flag skills missing these fields.
All existing skills need to be retrofitted (see PLANS.md WI-1).

---

## 2026-03-16 — the six context files

Every department needs SOUL.md, AGENTS.md, MEMORY.md, INBOX.md, PLANS.md,
IDEAS.md. Read in that order on every agent entry. INBOX is read before PLANS
so incoming messages can enter the plan queue for the current session.

---

## 2026-03-16 — PLANS.md not PLANS_X.md

Standardized: each department uses PLANS.md, not PLANS_MATH.md, PLANS_PROOF.md
etc. math/ already has PLANS.md. proof/ and src/ still have old names —
see PLANS.md WI-4 and WI-5.

---

## 2026-03-16 — agent loop requires three exit conditions simultaneously

An improvement skill CANNOT exit while any one of these is unmet:
(1) PLANS queue is empty, (2) compliance audit finds no violations,
(3) next-spec-target returns null. Exiting on (1) alone is a bug.

---

## 2026-03-16 — Working vs Improving

Working = execute next work unit, no selection bias, any work type.
Improving = execute SkillfulWorkUnits with bias toward unblocking, plus
post-work-update and CoursOfWork tail-end cycles. Improving IS a Workflow.

---

## 2026-03-16 — error as first-class state

SkillResult has two branches: success (codomain value) or SkillError.
Failing silently is a spec violation. Every skill must emit a SkillError
with error_class, error_message, and context when it cannot produce its output.

---

## 2026-03-16 — spec/PLANS_SPEC.md renamed to spec/PLANS.md

The old file is gone. All references updated. If you see PLANS_SPEC.md
anywhere in spec/, it is a stale reference that needs fixing.
