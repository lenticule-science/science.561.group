---
title: Agent Working Notes (Deprecated)
date-created: 2025-06-05T00:00:00
date-updated: 2026-03-07T00:00:00
deprecated: true
---

**This file is deprecated.** Session state now lives in proper
emsemioverse structures:

- **Session progress** → plan log sections (append to each plan's
  `## Log` section)
- **Architectural choices** → decision records at
  `technology/specifications/agential-semioverse-repository/plans/decisions/`
- **Corrections from emsenn** → decision records or policy revisions
- **Key insights** → texts at
  `personal/projects/emsemioverse/texts/` or discipline-appropriate
  locations
- **Active work state** → review-plans skill and
  [TODO.md](../../TODO.md)
- **Project context** → [emsemioverse index](index.md)

See [working notes as symptom](texts/working-notes-as-symptom.md)
for why this file accumulated state it should not have.

The session history below is retained as a historical record but
SHOULD NOT be appended to. New sessions record progress in plan logs.

## Session-specific notes

**2026-03-07 (sixth session) outcomes:**
- Removed Shen/Jing/Qi/jiangshi from semiotic-project-management,
  closure-pressure, policy concept, emsemioverse texts. TCM stays in
  medicine/ only.
- Promoted spec-spec → `semiotic-specification/index.md`. Applied to
  semiotic-project-management. Plan 0020 for remaining specs.
- Decomposed semiotic-project-management into 12 term files.
- Created plans 0017-0024. Milestones: project-management-v1,
  semantic-pipeline-v1. All proposed.
- Wrote `semiotic-versioning/index.md` — versioning as semiotic
  interaction. Interprets semver as interaction surface preservation.
- Wrote `texts/governance-layers.md` — three-layer governance
  (policies → decisions → instructions). 5 gaps identified.
- Correction: remove Shen/Jing/Qi program built from one analogy.

**2026-03-07 (fifth session) outcomes:**
- Wrote semiotic-project-management spec (convention specification)
- Added goal: field to all 15 plans, connecting them to 5 goals
- Created goal 005 (semantic pipeline)
- Removed hand-built components/ directory (predicate graph does this)
- Corrections from emsenn: don't context-map by hand (use RDF/SHACL),
  don't write "first capability" for 5-year aspirations, stop
  hyperfocusing on DDD, apply PM practices instead of just researching

**2026-03-07 (fourth session) outcomes:**
- Added `delegate_task` (Tool 8) to ASR MCP server — direct Ollama bridge
- Ollama installed natively with qwen2.5:7b and gemma3:12b
- OpenClaw evaluated, skipped — direct HTTP integration is simpler
- Disk-full event (953GB at 100%) caused Docker corruption; cleared npm cache to recover
- Updated plan 0015 with Phase 3.5
- First heterogeneous agent capability: mechanical tasks can route to local models

**2026-03-07 (third session) outcomes:**
- Agent orchestration ecosystem survey (10 frameworks, 3 protocols)
  → `technology/disciplines/ai/topics/agents/texts/agent-orchestration-ecosystem-2026.md`
- OpenClaw identified as reference architecture (missed in initial survey)
- Created policy 009 (task selection by leverage, anti-recency-bias)
- MCP server tested: 189 skills, 15 plans found; package installed; server starts
- Wrote texts: architecture-beyond-claude-code, agent-orchestration-ecosystem-2026
- Key insight from emsenn: the system should support heterogeneous agents
  (Codex, local 7B models), and the scattered triage material (relational
  computer spec, hypertensor topos, information engine pipeline) should
  inform architectural thinking, not just be ignored as non-functional

**2026-03-07 (second session) outcomes:**
- Created interpret-first-message skill (session-opening message handler)
- Wrote prompting guide for emsenn (`texts/prompting-guide.md`)
- Wrote texts: first-message-as-initialization, two-sided-prompt-design
- Updated registry routing rules to distinguish first vs. subsequent messages
- Session focus: architecture for agent context economy — offloading
  mechanical work to the system so agents have context for generative thought

**2026-03-07 session outcomes:**
- Created policies 006-008 (research produces texts, build then fill
  gaps, prompts become artifacts)
- Renamed directives/ to policies/ (policies are repository-level
  habit-formation, reflecting j)
- Vision-extraction interview produced 4 concepts and 4 texts under
  `personal/projects/emsemioverse/`
- Built planning infrastructure: TODO.md, review-plans, update-plan
  skills, CLAUDE.md session start checks plans
- Created interpret-message skill (default message handler
  implementing the encoding loop)
- Promoted five-mathematical-systems from slop to
  `relationality/concepts/`
- Key insight from emsenn: the priority is better prompt-to-meaning
  pipelines, not formalization. Formalisms represent a level of
  closure that must be earned after meanings stabilize.

**Corrections from emsenn this session:**
- Every Thing IS a semioverse, not "one per discipline"
- Policies belong to Things, not to the repository
- The encoding loop (inputs → texts → terms → research →
  formalisms) must run on EVERY message, not be discussed
- Working notes should be thin pointers, not accumulated state
- Infrastructure (planning, governance) comes before leaf tasks
- The agent must encode meaning as content, not discuss it

## Project arc

See [emsemioverse index](index.md) for the formal hierarchy and
research cycle. See [the encoding loop](texts/the-encoding-loop.md)
for how prompts become content. See
[five mathematical systems](../../relationality/concepts/five-mathematical-systems.md)
for the 2x2 grid of mathematical universes.
