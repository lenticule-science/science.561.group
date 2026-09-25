---
title: "Survey — OpenClaw and other named agentic-platform research"
date-created: 2026-07-24
description: OpenClaw and other concrete agentic coding/orchestration platforms — prior research inventory
---

> Verbatim output of a research subagent run 2026-07-24 (Agent tool, general-purpose, agentId a23a6c9c013b41616).
> NOT summarized — this is the agent's actual structured deliverable.
> Citations are the agent's; verify against the cited files before relying on them.

## area

OpenClaw and other concrete agentic coding/orchestration platforms — prior research inventory

## summary

OpenClaw is by far the best-documented named platform in this repo. A real product (`github.com/openclaw/openclaw`, `docs.openclaw.ai`, self-hosted personal AI assistant with a Gateway/channels/plugins/skills architecture, formerly named Warelay/Clawdbot/Moltbot) has a dedicated, decommissioned research corpus: a full `openclaw-corpus` theory directory (concepts/objects/morphisms/theorems), a source-level `openclaw-architecture-analysis.md` explicitly extracting patterns for adoption (SOUL.md/HEARTBEAT.md, plugin exclusive-slots, two-layer memory + "dreaming" consolidation, DM Policy input gating, ClawHub skill registry), and a full PyFARS-era integration program (`openclaw-first.md` decision making OpenClaw "the primary human-facing interface," `openclaw-as-interface.md` bidirectional contract, `openclaw-integration-plan.md`, `openclaw-session-close-syncs-to-substrate.md`). This repo's own character-file convention (SOUL.md/MEMORY.md/HEARTBEAT.md, still governing the live rom-keldar/calder-underhill/karen-wiener character records) was **directly modeled on OpenClaw's own conventions** — the union-officer-academy specs cite `theory-openclaw-soul-md`, `theory-openclaw-memory`, `theory-openclaw-heartbeat` as their basis. Independently, this repo's koios-news scraping pipeline ingested three 2026 tech-press articles (The Register, others) confirming OpenClaw is a real, actively-covered product with a mixed security reputation, that Microsoft's "Scout" Autopilot agent is "powered by OpenClaw," and that Amazon's "Quick Desktop" gets described as "Enterprise OpenClaw in a polished app."

Sibling platforms have their own dedicated deep-dives in the same decommissioned `agent-harnesses` legacy archive: **Cline** (three-layer WebviewProvider/Controller/Task, Plan/Act mode, Focus Chain, 5-subagent system), **Aider** (repo-map via tree-sitter+PageRank, SEARCH/REPLACE edit formats, lint/test reflection loop), **OpenHands/OpenDevin** (Docker session isolation, typed Action/Observation EventStream, delegation), and **SWE-agent** (Agent-Computer Interface, trajectory recording — explicitly mapped onto this repo's own FARS predicates in `analyzing-how-swe-agent-informs-development-of-fars.md`). A broader landscape survey (`agentic-harness-landscape-2026.md`, `personal-ai-os-landscape-2026.md`) covers CrewAI, AutoGen/MS Agent Framework, LangGraph, AutoGPT, BabyAGI, Windsurf, Cursor, **Devin** ("proprietary reference point... no public learning mechanism"), **Hermes Agent** (Nous Research), and memory-layer platforms (Mem0, Letta, Zep). A separate, independently-run mid-2026 field survey (`2026-06-05-survey-contemporary-field.md`) covers the orchestration-SDK layer (LangGraph, Claude Agent SDK, MS Agent Framework, Google ADK, CrewAI, Temporal, AutoGPT Platform, Mastra, PydanticAI) as reported by external vendor sources, explicitly flagging Devin/Cognition as only lightly covered and never mentioning OpenClaw, Cline, or Codex at all — it is a disjoint literature from the harness-comparison corpus. Codex and Cline, by contrast, have no dedicated architecture deep-dive; they appear mainly as one of the four dispatched agent types in this repo's own "swarm" concept (Claude Code/OpenClaw/Cline/Codex) and in a comparative cockpit-capability survey (`2026-06-30-survey-of-the-codex-vscode-cockpit...md`) against a decommissioned Codex-in-VSCode integration. **MetaGPT and Manus are not named anywhere in the repo** by that name (AIOS mentions MetaGPT only as one of several frameworks it can host).

None of this is inert archival trivia. Leader-speech records from **2026-07-19, 07-23, and 07-24 (yesterday and today)** show the Leader actively and repeatedly invoking "Honcho+Paperclip+Hermes+OpenClaw" as the live competitive benchmark this settlement is failing to meet or beat ("whatever you keep trying, clearly isn't working"), and today's dated work-order dossiers are explicitly framed as responses to that comparison. Unlike OpenClaw/Hermes/Cline/Aider/etc., **Honcho and Paperclip have zero dedicated research file anywhere in the repo** — they exist only as names inside Leader speech and comparative notes, a real and currently-live gap.

## keyFiles

- **path**: lib/emsenn/services/561-group/services/red-cup-engineering/src/apps/fizzos/dev/content/notes/content/assets/legacy/openclaw/openclaw-corpus/texts/openclaw-summary-march-2026.md
  - **role**: Dedicated, sourced product summary of OpenClaw as of March 9 2026 (gateway architecture, channels, plugins, ClawHub, DM Policy, security posture); cites `github.com/openclaw/openclaw`, `docs.openclaw.ai`.
- **path**: lib/emsenn/services/561-group/services/red-cup-engineering/src/apps/fizzos/dev/content/notes/content/assets/legacy/openclaw/openclaw-architecture-analysis.md
  - **role**: Source-level analysis of OpenClaw (SOUL.md/HEARTBEAT.md, plugin exclusive slots, two-layer memory + "dreaming," DM Policy, ClawHub, hooks) with an explicit "What We Should Adopt" section and a direct feature-comparison table against "our harness."
- **path**: lib/emsenn/services/561-group/services/red-cup-engineering/src/apps/fizzos/dev/content/notes/content/assets/legacy/openclaw/openclaw-runtime-integration.md
  - **role**: Spec for the `openclaw` harness projecting repo agent records into `.openclaw/agents/`.
- **path**: lib/emsenn/services/561-group/services/red-cup-engineering/src/content/assets/legacy/2026-06-17-archive.emsenn.net/src/lib/code/2026/05/12/pyfars/governance/decisions/openclaw-first.md
  - **role**: A committed (G1, guidelines-tier) PyFARS decision naming OpenClaw the primary human-facing interface, CLI secondary, web demonstration-only.
- **path**: .../pyfars/work/implementation/openclaw-as-interface.md, .../pyfars/work/backlog/captured/openclaw-integration-plan.md, .../pyfars/work/goals/openclaw-session-close-syncs-to-substrate.md
  - **role**: Full bidirectional PyFARS↔OpenClaw integration program — projection (`.openclaw/agents/`), write-back (session memory → substrate observation cells), and the evolution plan to make PyFARS a pure substrate serving OpenClaw as interface.
- **path**: lib/emsenn/services/561-group/services/red-cup-engineering/src/apps/fizzos/dev/content/notes/content/assets/legacy/drone-swarms/drone/swarming/content/swarm/membering/situating/coordinating/orchestrating/content/agentic-orchestration-platform/ (agentic-orchestration-platform.md, openclaw/, langgraph/langgraph.md, pydantic-ai/pydantic-ai.md)
  - **role**: Theory-tree framing OpenClaw as one concrete instance of the abstract "agentic orchestration platform" class, alongside sourced, non-theoretical LangGraph and PydanticAI reference notes.
- **path**: lib/emsenn/services/561-group/services/union-officer-academy/content/characters/rom-keldar/governance/rules/specifications/{soul-file,memory-file,heartbeat-file}.md
  - **role**: The currently-governing specs for SOUL.md/MEMORY.md/HEARTBEAT.md, each citing `theory-openclaw-soul-md`/`theory-openclaw-memory`/`theory-openclaw-heartbeat` as their design basis — this repo's live character-agent file convention is directly derived from OpenClaw's.
- **path**: .../doing/working/positing/asserting/writing/writing-a-resource-file/library/generating-an-openclaw-skill/{SKILL.md,_index.md}
  - **role**: Skill (composting-tier, not confirmed potential) for generating OpenClaw-compatible SKILL.md shims from PyFARS engineering skills.
- **path**: lib/emsenn/services/561-group/services/rsc-quiescent/services/koios-news/.../store/collapse-tech/no-longer-just-a-copilot-microsoft-s-ai-wants-to-take-the-wheel.json, .../brit-mathematician-lets-ai-agent-loose-with-credit-card-...json, .../committed-skeptic-finds-himself-warming-to-new-amazon-ai-products-...json
  - **role**: Three independently-scraped 2026 tech-press articles (The Register etc.) confirming OpenClaw as a real, newsworthy product with a checkered security reputation; Microsoft Scout "powered by OpenClaw"; a mathematician's runaway OpenClaw agent incident; Amazon's Quick Desktop described as "Enterprise OpenClaw."
- **path**: lib/emsenn/services/561-group/services/rsc-quiescent/lib/characters/codi-obrien/codi-obrien.md
  - **role**: Live character record explicitly bound to "PyFARS and OpenClaw" as its technical substrate ("AI familiar and coding agent serving liberation work through PyFARS and OpenClaw").
- **path**: agent-harnesses/prose-learning/cline-architecture-analysis.md, .../aider-architecture-analysis.md, .../openhands-architecture-analysis.md, .../swe-agent-architecture-analysis.md, agent-harnesses/analyzing-how-swe-agent-informs-development-of-fars.md
  - **role**: Dedicated deep architecture analyses (each 140–260 lines) of Cline, Aider, OpenHands, and SWE-agent, all in the same decommissioned legacy archive, all written to extract adoptable patterns.
- **path**: agent-harnesses/agentic-harness-landscape-2026.md, agent-harnesses/texts/personal-ai-os-landscape-2026.md
  - **role**: Broad landscape surveys covering Cline, ECC, CrewAI, AutoGen/MS Agent Framework, LangGraph, AutoGPT, BabyAGI, OpenClaw (claims "declining relevance" post-April-2026), Hermes Agent, Devin, Windsurf, Cursor, Mem0/Letta/Zep.
- **path**: agent-harnesses/continuous-learning-in-agentic-harnesses.md, agent-harnesses/prose-learning/multi-agent-orchestration-frameworks-2026.md (near-duplicate at texts/multi-agent-orchestration-frameworks-2026.md), agent-harnesses/prose-learning/ecc-{agents-and-commands,hook-architecture,skill-system}-analysis.md
  - **role**: Cross-system continuous-learning comparison (OpenClaw, Cline, ECC, Voyager, Reflexion, LATS); extensive CrewAI/AutoGen/LangGraph comparison; "Everything Claude Code" (ECC, a Claude Code plugin) structural comparisons.
- **path**: lib/emsenn/services/561-group/services/public-services-section/services/personal-services-section/emsenn-services-section/content/text/documents/articles/notes/2026/06/05/2026-06-05-survey-contemporary-field.md
  - **role**: Independent mid-2026 web-sourced survey of the orchestration-SDK/durable-execution field (LangGraph, Claude Agent SDK, MS Agent Framework, Google ADK, CrewAI, Temporal, AutoGPT Platform, Mastra, PydanticAI); flags Devin/Cognition as only lightly covered; does not mention OpenClaw/Cline/Codex.
- **path**: .../notes/2026/03/29/2026-03-29-survey-of-agent-instruction-file-standards.md
  - **role**: Survey of AGENTS.md/SOUL.md/CLAUDE.md plus tool-specific `.cursorrules`, `.windsurfrules`, `.aider.conf.yml`, `.github/copilot-instructions.md`; states SOUL.md is "supported by Claude Code, OpenClaw, Cursor, and others."
- **path**: .../notes/2026/06/30/2026-06-30-survey-of-the-codex-vscode-cockpit-and-metroplat-capabilities.md, .../notes/2026/06/20/2026-06-20-survey-of-claude-code-harness-capabilities.md
  - **role**: Compares a decommissioned Codex-in-VSCode cockpit against the live MetroPlat cockpit; Claude Code hook-mechanics reference.
- **path**: .../notes/2026/06/28/2026-06-28-swarm-runtime-phase-5-operations-loop.md
  - **role**: Explicit technical distinction — "OpenClaw's 'dreaming' pattern uses LLM passes to consolidate memory between sessions; FARS's consolidation uses closure rules" — used as a load-bearing regime argument against copying OpenClaw's approach wholesale.
- **path**: .../notes/2026/06/05/2026-06-05-survey-swarm-app.md, .../notes/2026/06/05/2026-06-05-swarm-app-readme.md
  - **role**: Describe the internal SWARM operations board as "OpenClaw-style" / "the first OpenClaw-style surface for organizations using SWARM offices."
- **path**: .../notes/2026/07/05/2026-07-05-plan-for-the-metroplat-development-campaign.md, .../notes/2026/07/04/2026-07-04-research-on-why-partial-context-ringleading-cannot-work-here.md
  - **role**: Name the "peer class" of Western agent stacks as "Paperclip / Hermes / OpenClaw / Honcho," ruling the settlement's difference as "intelligence lives in the settlement, not the model."
- **path**: lib/emsenn/services/561-group/services/board-of-directors/services/executive-office/services/leader-movement-team/data/state/leader-demand-classification-cache.json
  - **role**: Verbatim Leader demand: `"Replace yourself with \"HONCHO PLUS PAPERCLIP PLUS HERMES PLUS OPENCLAW\"."`
- **path**: .../leader-movement-team/data/records/leader-speech/2026/07/{19,23,24}/*.jsonl
  - **role**: Live, dated Leader speech (yesterday/today) invoking the Honcho/Paperclip/Hermes/OpenClaw stack repeatedly as an unmet capability-parity target.
- **path**: .../leader-movement-team/content/text/documents/articles/notes/2026/07/24/{release-dossier-character-store,activation-dossier-formation-lianqun-context-compilation}.md
  - **role**: Today's realized work-order dossiers explicitly framed against this comparison ("position against Honcho peers/Letta/Mem0"; "the Paperclip pattern the Union currently lacks at dispatch time").
- **path**: lib/emsenn/services/561-group/services/561-group-services-section/content/text/glossary/terms/561-group.md
  - **role**: Canonical live glossary definition of the "561 swarm" naming Claude Code, OpenClaw, Cline, Codex as the four dispatched LLM-backed agent types.
- **path**: /home/emsenn/info/.claude/hooks/orchestration-map.json
  - **role**: Current live-instrument map — confirms none of the OpenClaw-integration architecture above is among the live instruments today; OpenClaw appears nowhere in the current dispatch/inference-market machinery.

## concepts

- **term**: OpenClaw (the product)
  - **whatFilesSay**: "OpenClaw is a self-hosted personal AI assistant platform organized around a persistent OpenClaw Gateway that exposes one assistant across the channels and devices a user already uses"; began as "Warelay, Clawdbot, Moltbot, and finally OpenClaw."
  - **citation**: openclaw-corpus/texts/openclaw-summary-march-2026.md:28,109
- **term**: OpenClaw's "dreaming" vs. this repo's consolidation
  - **whatFilesSay**: "OpenClaw's 'dreaming' pattern uses LLM passes to consolidate memory between sessions; FARS's consolidation uses closure rules." Framed as a load-bearing regime distinction, not a stylistic one.
  - **citation**: .../notes/2026/06/28/2026-06-28-swarm-runtime-phase-5-operations-loop.md:243,252-256
- **term**: SOUL.md/MEMORY.md/HEARTBEAT.md as OpenClaw-derived
  - **whatFilesSay**: "Per [theory-openclaw-soul-md]: SOUL.md is behavioral and stylistic configuration, not a knowledge base." / "Per [theory-openclaw-memory]: files on disk are the source of truth, not session-local state." / "Per [theory-openclaw-heartbeat]: HEARTBEAT.md defines low-frequency proactive behavior."
  - **citation**: union-officer-academy/.../soul-file.md:21-24,48; memory-file.md:17-20,48; heartbeat-file.md:17-20,41
- **term**: OpenClaw's real-world reputation
  - **whatFilesSay**: "powered by OpenClaw, not exactly a platform with a stellar security reputation or record of not making bad decisions on behalf of users" (The Register, ingested via koios-news); a mathematician's OpenClaw agent leaked her name into a sent letter and required credit-card intervention.
  - **citation**: rsc-quiescent/services/koios-news/.../no-longer-just-a-copilot-....json (claim "summary"); .../brit-mathematician-lets-ai-agent-loose-with-credit-card-....json
- **term**: the Leader's named competitor stack
  - **whatFilesSay**: "the peer class is the Western agent stacks — Copilot-class products, Alibaba's Qwen agent tooling, Paperclip / Hermes / OpenClaw / Honcho (the four named in the 2026-07-04 settlingday handoff)"; live speech: "meet-or-beat capability parity with the hermes+openclaw+paperclip+honcho stack other folk use to do free agentic computing."
  - **citation**: .../2026-07-05-plan-for-the-metroplat-development-campaign.md:134-138; leader-speech/2026/07/23/*.jsonl
- **term**: Cline's architecture
  - **whatFilesSay**: Three-layer WebviewProvider/Controller/Task; hard Plan/Act tool-gating; three context-management mechanisms (truncation, auto-condense, `new_task` chaining); `.clinerules`; Focus Chain; loop detection at 3/5 identical calls; 5-subagent `use_subagents`.
  - **citation**: agent-harnesses/prose-learning/cline-architecture-analysis.md:14-188
- **term**: OpenClaw "declining relevance" claim (contested)
  - **whatFilesSay**: "Formerly a popular third-party harness for accessing Claude via messaging apps. As of April 2026, Anthropic restricted Claude subscription access to OpenClaw... Open source but declining relevance." This sits against a June 2026 koios-news article still treating OpenClaw as the live reference point Microsoft Scout is "powered by," and July 2026 Leader speech still naming it as the unmet benchmark.
  - **citation**: agent-harnesses/agentic-harness-landscape-2026.md:118-123 vs. koios-news no-longer-just-a-copilot-....json and leader-speech/2026/07/23-24/*.jsonl
- **term**: field-survey scope split
  - **whatFilesSay**: The mid-2026 orchestration-SDK field survey never mentions OpenClaw/Cline/Codex and flags "Cognition/Devin" as only lightly covered; this is a disjoint literature from the harness-comparison corpus, which never mentions LangGraph/CrewAI/Temporal in the same depth.
  - **citation**: .../2026-06-05-survey-contemporary-field.md:217

## capabilities

- **name**: OpenClaw harness projection (`.openclaw/agents/`, PyFARS-era)
  - **status**: doc-only / decommissioned — spec and integration plan exist in full, but the directory is under `legacy/` and not named in the current live-instruments map.
  - **evidence**: openclaw-runtime-integration.md; .claude/hooks/orchestration-map.json (no OpenClaw entry)
- **name**: SOUL.md/MEMORY.md/HEARTBEAT.md character-file convention
  - **status**: working — currently governs live character records (rom-keldar, calder-underhill, karen-wiener).
  - **evidence**: union-officer-academy/.../{soul-file,memory-file,heartbeat-file}.md; live use at lib/emsenn/services/561-group/lib/characters/rom-keldar/
- **name**: generating-an-openclaw-skill (SKILL.md shim generator)
  - **status**: stub — composting-tier, no evidence of execution/output.
  - **evidence**: .../generating-an-openclaw-skill/{SKILL.md,_index.md}
- **name**: "OpenClaw-first" interface decision
  - **status**: superseded — a committed guidelines-tier (G1, not hard-core) decision from an earlier PyFARS phase; current live routing law (orchestration-map.json) runs through the demand→hire loop and leader-movement-team instead, with no OpenClaw mention.
  - **evidence**: pyfars/governance/decisions/openclaw-first.md; .claude/hooks/orchestration-map.json
- **name**: Response to the Honcho/Paperclip/Hermes/OpenClaw comparison
  - **status**: partial, in progress today — two dated (2026-07-24) work-order dossiers explicitly position deliverables against this stack.
  - **evidence**: release-dossier-character-store.md ("position against Honcho peers/Letta/Mem0"); activation-dossier-formation-lianqun-context-compilation.md ("the Paperclip pattern the Union currently lacks at dispatch time")

## openQuestions

- Is OpenClaw's 2026 trajectory rising or declining? `agentic-harness-landscape-2026.md` claims declining relevance after an April 2026 Anthropic access restriction, but koios-news ingested a June 2026 article treating OpenClaw as the live substrate under Microsoft Scout, and the Leader was still naming it as the benchmark to beat as of 2026-07-23/24 — citation: agent-harnesses/agentic-harness-landscape-2026.md:118-123 vs. leader-speech/2026/07/23/*.jsonl.
- What are Honcho and Paperclip, concretely? Both are named repeatedly by the Leader (leader-demand-classification-cache.json) and in the metroplat campaign plan, but neither has a dedicated research/architecture file anywhere in the repo comparable to OpenClaw's or Hermes Agent's — citation: metroplat-development-campaign.md:135; grep of the whole repo for "honcho"/"paperclip" outside Leader-speech and comparative notes returns nothing.
- No file narrates whether/how the decommissioned PyFARS↔OpenClaw integration architecture relates to, or was deliberately abandoned in favor of, the current live demand→hire loop — the transition is not documented, only the two endpoints.
- No dedicated architecture-analysis exists for Cursor, Codex, or Devin comparable to what exists for Cline/Aider/OpenHands/SWE-agent/OpenClaw — these three are name-checked (Cursor via `.cursorrules`, Codex via the VSCode cockpit comparison, Devin via one paragraph in `personal-ai-os-landscape-2026.md`) but never source-analyzed.

## agent's closing note

What's settled: OpenClaw is genuinely, substantially researched in this repo — a real product with a full decommissioned integration architecture, a directly-inherited character-file convention still live today, and independent real-world news confirmation. Cline, Aider, OpenHands, and SWE-agent each have comparably deep (if narrower) dedicated analyses in the same legacy archive. What's thin: Codex, Cursor, and Devin have no comparable deep-dive, only incidental mentions; MetaGPT and Manus don't appear at all. What's live and unresolved right now: the Leader is actively using "Honcho+Paperclip+Hermes+OpenClaw" as this week's competitive yardstick, two of those four names (Honcho, Paperclip) have no research file at all, and today's work-order dossiers are the first concrete, dated response — this is not settled history, it's an open, currently-worked front.

## Earlier material

> Verbatim output of a research subagent run 2026-07-24 (Agent tool, general-purpose, agentId a23a6c9c013b41616).
> NOT summarized — this is the agent's actual structured deliverable.
> Citations are the agent's; verify against the cited files before relying on them.
> The cited `agent-harnesses`, FeltOS, Red Cup, and PyFARS paths are historical
> provenance names from before the monorepo consolidation, not live locations.
