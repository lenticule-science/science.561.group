# MEMORY.md

Accumulated cross-session knowledge for the root / orchestrator level. Each
entry is a MemoryEntry. Append-only.

---

## 2026-03-16 -- §-reference convention abolished

The `§anchor-id` cross-reference syntax has been replaced by standard markdown
links `[text](relative/path.md)`. Source-of-truth change is in root CLAUDE.md
(hard rule) and root SOUL.md (principle `links-not-sigils`). spec/specs.md
updated. FixNeeded messages sent to math/INBOX.md and proof/INBOX.md.
Spec migration queued as WI-16 and WI-17 in spec/PLANS.md.

## 2026-03-16 -- do-work / interpret-prompt / route-prompt-units skills written

Three root-level orchestration skills added: do-work (entry point for
multi-department prompts), interpret-prompt (classifies prompt text into typed
PromptUnits), route-prompt-units (routes PromptUnits to department INBOXes).
Multi-department escalation rule added to root AGENTS.md.

## 2026-03-16 -- src/ context files created

src/SOUL.md, src/MEMORY.md, src/INBOX.md, src/IDEAS.md created. src/INBOX.md
contains the derivation architecture message (src/read/markdown.py, src/derive/,
src/models/unit.py).

## 2026-03-16 -- unit-moves-are-deletions and inbox-first principles adopted

Two new repo-wide principles: (1) operator prompts route through department
INBOX.md, same as agent messages — not directly to IDEAS/PLANS; (2) when a
Unit moves between files, it is deleted from source and inserted at destination,
no redirect stubs. route-prompt-units rewritten accordingly. spec/idea.md
updated to remove `done` status and "NOT deleted" rule.

### Session — 2026-03-17 (wind-down)

Built three major workflow families: clarify (find-confusing.md + clarify.md: find confusing passages by type, ask targeted questions, edit toward clarity), pick-examples (score and select canonical examples per file type), and fix-weak (find-weak-{math-unit,skill,spec,runbook}.md + fix-weak family + find-weak.yaml runbook + dispatch-skill.yaml runbook). Added `dispatch` frontmatter block to skill-file-format spec: skills can now declare routing logic as structured data executed by dispatch-skill.yaml, moving IF/ELSE from prose into machine-readable frontmatter. Changed wrap-prompt.yaml prescript from "NLI" framing to "repository agent" framing. Wrote specs for system, engine, runbook, repository, service following concept-level (not instance-level) pattern. Added optional Encodings/Implementations sections to spec/specs.md.

**Open threads:**
- `src/engine/ → src/repo/` migration: tracked in src/PLANS.md `migrate-engine-to-repo`
- `math/` §-reference migration: ~250 files, batch job; tracked in math/PLANS.md `section-reference-migration`
- `spec/` link-migration: ~80 refs across ~20 files; tracked in spec/PLANS.md `link-migration`
- `proof/skills/` link migration: ~10 refs; tracked in proof/PLANS.md `section-reference-migration`
- `runbook-executor spec`: spec/PLANS.md `runbook-executor-spec`; needed before src/ can implement the executor

## 2026-03-17 -- two machines: relational-repository and relational-service-system

This repo contains two distinct machines:

relational-repository — markdown + YAML runbooks + Python scripts. Flat files, git-versioned, human-editable. Standards for authoring content: math units, specs, skills, runbooks.

relational-service-system — SQLite + PydanticAI + LangGraph + FastAPI/FastMCP. Self-contained Docker image. Ingests repository content and runs it as a live service.

They are two different machines, not two layers of one machine. Current focus: relational-repository.

