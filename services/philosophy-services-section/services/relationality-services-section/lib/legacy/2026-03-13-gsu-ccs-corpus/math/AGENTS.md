# math/AGENTS.md

The `math/` department is the upstream source of truth for the repository.
It defines mathematical objects, states results, and establishes what is true.
All other departments are downstream: proof/ formalizes math/, spec/ constrains
encoding of math/, src/ implements spec/.

Entry skill: `math/skills/improve-math.md`. Full loop: `math/skills/do-math-work.md`.

---

## Context files

Read in this order on every agent entry:

| File | Purpose |
|------|---------|
| `math/SOUL.md` | Why this department exists; core principles; what must never be compromised |
| `math/AGENTS.md` | This file — orientation, scope, permissions, entry-point skills |
| `math/MEMORY.md` | Accumulated cross-session knowledge: patterns, lessons, decisions |
| `math/INBOX.md` | Incoming messages from other departments; triage before planning |
| `math/PLANS.md` | Active workflows and committed work queue |
| `math/IDEAS.md` | Raw unplanned material; mined into PLANS each pass |

---

## Scope

| Location | What lives there |
|----------|-----------------|
| `math/*.md` | One unit file per mathematical concept |
| `math/skills/*.md` | Skills that operate on math/ content |
| `math/_manifest.yaml` | Ordered list of all unit files; determines build order |
| `math/PLANS.md` | Committed work items in Workflow format |
| `math/IDEAS.md` | Raw ideas; mined into PLANS when actionable |

---

## Permissions

- **Write freely:** `math/*.md`, `math/skills/*.md`, `math/_manifest.yaml`, all context files above
- **Read only:** `spec/` (when a skill explicitly instructs it)
- **Cross-department write:** `spec/IDEAS.md` only, via `math/skills/file-spec-dispute.md`
- **Never write:** `proof/`, `src/`, any other `spec/` file

---

## Skills

| Skill | Type | What it produces |
|-------|------|-----------------|
| `do-math-work` | Procedure | Full AgentLoop pass; loops until exit conditions hold |
| `improve-math` | Procedure | One math improvement work unit |
| `write-unit` | Process | A new math unit file |
| `critique-unit` | Derivation | Structured critique of a unit against spec |
| `reform-unit` | Procedure | Repaired unit (TRIM or REFERENCES branch) |
| `trim-unit` | Process | Unit with dead content removed |
| `fix-references` | Process | Unit with broken citations fixed |
| `extract-subunit` | Process | A sub-concept extracted to its own unit file |
| `conjecture-unit` | Process | A new Conjecture unit extracted from a remark |
| `classify-unit-frontmatter` | Derivation | Frontmatter additions judgment for a unit |
| `apply-unit-frontmatter` | Process | Unit with frontmatter additions applied |
| `build-math` | Process | Build result (ok or error) |
| `find-naming-targets` | Inquiry | List of units with naming violations |
| `improve-math-naming` | Procedure | Applied naming fixes (user-approved) |
| `name-math-unit` | Derivation | Name recommendation for a unit |
| `rename-unit` | Process | Unit renamed with all citations updated |
| `audit-spec-alignment` | Derivation | Alignment report: valid/unsupported/contradicted claims |
| `file-spec-dispute` | Process | Dispute filed to spec/IDEAS.md |
