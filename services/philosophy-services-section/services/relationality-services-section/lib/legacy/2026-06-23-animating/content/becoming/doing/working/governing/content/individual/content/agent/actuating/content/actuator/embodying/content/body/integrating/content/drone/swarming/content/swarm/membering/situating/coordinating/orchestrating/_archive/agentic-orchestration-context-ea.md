---
name: agentic-orchestration-context
specialization: analysis
date-created: 2026-04-01
serves: agentic-orchestration
---

## What we are building

Agent configuration *composed* from structured data, not hand-maintained.
Hierarchy: 1. **Structured data** — component registrations with typed frontmatter (agents, skills, commands, rules, hooks) 2. **Deterministic composition** — scripts that read registrations and generate deployment artifacts 3. **Rendered text** — CLAUDE.md, AGENTS.md, settings.json, session-start context 4. **Inference** — fires only where composition cannot resolve the situation

The less inference, the more reliable.
The harness does two things: *composes* session context from components (extending ⊙), and *tests* whether a component applies (restricting ⇒).
Both directions of a residuation — same algebra as Lambek (grammar), Lawvere (logic), Busaniche-Cignoli (bilattice).
When both are computable deterministically, no inference needed for routine work.

## Why ECC is the gold standard

Everything-Claude-Code (136 skills, 60 commands, 30 agents) is the most mature Claude Code harness available.
It achieved this empirically, without a theory of *why* its structure works.
Our research offers candidates (predication-as-residuation for composition/restriction; work taxonomy for component maturation; FARS for the data model).
ECC is the conformance target; our research is the enrichment.
Don't diverge from ECC layout without principled reason.
Source: `operations/engineering/fars/src/everything-claude-code/`.

## The settlement path in action

| Settlement stage | Harness equivalent | What it means |
|---|---|---|
| Inquiry | Observation | Raw session data |
| Derivation | Instinct | Pattern detected, meaning emerging |
| Procedure | Skill / Agent | Reliable pattern, judgment required |
| Process | Hook / Script | Deterministic |

Push work down this table.
Every observation → instinct → skill → hook is settlement.

## Completed phases

- **Phase 1: Separate source from deployment** — source at `operations/engineering/fars/agentic/`; harness config at `fars/harnesses/agentic/claude-code/`; install.js copies to `.claude/`.
- **Phase 2: Continuous learning pipeline** — hooks observe; observer agent (Haiku, background) detects patterns, writes instincts with confidence scores; `/evolve`, `/promote`.
- **Phase 3: Session infrastructure** — session start/end hooks, state persistence, strategic-compact skill, save/resume.
- **Phase 4: Generative index composition** — `generate-root-agentic-files.js` reads component frontmatter and composes CLAUDE.md + AGENTS.md deterministically. install.js runs it after copy.

## Upcoming phases

- **Phase 5a: SOUL.md + MEMORY.md generation** — extend the generator; SOUL from charter + identity fields; MEMORY from memory-file frontmatter.
- **Phase 5b: Memory system research** — ECC retrieval patterns; bilattice scoring for relevance (speculative); decay/confidence/recency weighting; memory vs. context boundary.
  Output: design document.
- **Phase 5c: ECC conformance audit** — skill frontmatter schema, hook architecture (matcher-driven w/ runtime gating), agent.yaml vs. md, manifest-driven selective install vs. `"*"` wildcard.
- **Phase 6: Clean the work taxonomy terms** — current term files conflate (1) the real-world concept, (2) relational math, (3) implementation ideas.
  Editorial separation needed before harness can trust its own vocabulary.
  Blocks Phase 7.
- **Phase 7: Computational bridge** — encode (H,A,D_O,I+), (Q,G,B,ρ), (N,R,Π,G) as schemas + verification functions hooks evaluate.
  Unified `create-entity` primitive where predicates derive capabilities; scripts/tools as graph-queryable entities; predicate-derived ocaps (dispatch = relational join agents.capabilities ⋈ task.requires).

## Repo resources (2026-04-02 survey)

Not yet integrated into any plan: - Relational computer architecture (30+ service specs in `library/theories/science/theories/relating/theories/technology/theories/computing/`) - `distributed-relationality.md` (one universe, many partial views) - 100+ application specs in `docs/app/spec/` - 80+ application ideas in `ideas/README.md` - FARS 80+ terms at `operations/engineering/fars/docs/terms/` - Old ideas at `personnel/emsenn/projects/emsdeavor/developing/semiotic-repository/planning/ideas/` (semiotic cell machine, event-stream records, relational source control, hypertensor topos machine) - Triage: `operations/engineering/triage/content/buckets/tech/relational-system/`, `library/theories/science/theories/relating/triage/Delta Register/`

## Idea integrations (2026-04-04)

- **ECC2 feature ports:** inter-session messaging (typed msgs in EAVT with read flag, daemon polls); comprehensive tool logging with risk scores; session output streaming; rich MCP config (sequential-thinking, playwright, evalview, omega-memory).
- **Cells as models:** every frontmatter-validated file is a micro-cell; auto-record-events is CCE apply; compose() merge is CCE merge. ~11K cells → algebraic model zoo.
  MCP unifies access.
- **Companion agent:** Haiku-tier session-spawned agent polling bridge channel.
  Could be Jadepol's backend.
  Watches fleet health, failure reports, attention, ledger balance.
- **MCP expansion:** resources (domains, plans, channels with change-notifications); prompts (skills as discoverable capabilities); mutation tools (create_task, update_status, dispatch_officer, write_term/text); federation between 561 nodes; local ollama as MCP server.

## Directive: directives-as-entities (2026-04-05)

Per captain directive: directives are queryable entities with their own command-set.
State: create-record.js handles `directive` type; 6 directive entities at records/directives/ with `status: open`.
Remaining folds into `parameterizable-record-commands`: build `list-directives`, `close-directive`; session-start queries graph for open directives.

## Related work tracked separately

- charter-and-organizational-infrastructure (Track A feeds Phase 6; Track B IS Phase 7)
- composable-writing-guide (domain capability)
- generalize-verify-command
- ideas-system
- agent-governance-enrichment (library-side grounding; produces terms Phase 7 depends on)
- ops-dispatch-stage (consumes governance theory)

## Success criteria

- CLAUDE.md + AGENTS.md generated, not maintained
- Adding new skill/agent/command = writing one file with correct frontmatter
- ECC layout conventions followed unless documented divergence
- Settlement path visible: trace any hook back to originating observations
- At least one harness operation (composition / skill selection / delegation) implements extending/restricting residuation as verifiable computation, not just design analogy
