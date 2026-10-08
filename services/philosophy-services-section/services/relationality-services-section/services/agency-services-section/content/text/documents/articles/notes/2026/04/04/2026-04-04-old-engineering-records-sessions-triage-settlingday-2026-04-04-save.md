---
name: settlingday-2026-04-04-save
introduces: session-save
date-created: 2026-04-04
session-id: settlingday-2026-04-04
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: settlingday-2026-04-04-save
---

## What WORKED

1. **Massive parallel dispatch via mash-engine** — 64 officers dispatched, all producing useful output. The dispatch pattern (build prompt, `mash-engine start -t`, record event) is reliable.
2. **Progressive automation demotions** — 4 agents demoted to deterministic tools (harness-cleaner, docs-lookup, graph-analyst, doc-updater). Each saves ~10K tokens per invocation.
3. **Cross-system research** — 20+ analysis texts produced from source code analysis of ECC, OpenClaw, Cline, Voyager, Reflexion, LATS, MemGPT, Mem0, CrewAI, AutoGen, LangGraph, FluffOS, SWE-Agent, OpenHands, Aider, MCP spec.
4. **Adoption priorities synthesis** — top 10 patterns ranked by leverage, implementation sequence defined, all 10 either implemented or dispatched.
5. **Non-LLM computation research** — grounded analysis of when classifiers/Markov chains/graph queries replace LLM inference. Bigram analysis of our own tool-call logs.
6. **Idea capture** — algebraic learning calculus, persistent first officer session, beyond-LLM computation. All with captain's exact words preserved.
7. **Chief-of-staff idea integration** — 32 ideas integrated into 11 plans.

## What Did NOT Work

1. **Background Agent subagents can't get Write permission** — researcher and writer agents dispatched via in-session `Agent()` were blocked from writing files because background agents can't prompt for approval. Fix: use mash-engine for all independent write work.
2. **Cloned repos as embedded git repos** — git complains about embedded repos. Need .gitignore entries or submodules.
3. **VPS too small for local models** — 1.6GB RAM VPS can't run even 0.5B models. Need Hetzner migration.
4. **Graph search on ops graph weak** — MCP graph_search only searched library graph initially. Fix dispatched but may not have landed.

## WHAT NOT TO RETRY

- Do NOT dispatch in-session background Agent for tasks that need to write files — use mash-engine
- Do NOT try to run Ollama or any model on the current VPS
- Do NOT use `git add -A` — it picks up embedded git repos from cloned sources

## Current Status

- 64 officers dispatched this session
- All 10 adoption priorities implemented or in flight
- 4 agent demotions complete (harness-cleaner, docs-lookup, graph-analyst, doc-updater)
- 12 new tools built
- 20+ library analysis texts produced
- 74 harness tests passing
- 10 repos cloned for reference

## Required Files for Resume

- operations/command/records/analyses/cross-system-adoption-priorities.md
- operations/command/records/analyses/offices-as-fuzzy-cells.md
- operations/command/records/analyses/ecc-feature-parity-checklist.md
- operations/engineering/fars/docs/vps-model-infrastructure-plan.md
- operations/engineering/fars/docs/fine-tuning-pipeline-design.md
- operations/engineering/fars/docs/session-review-pipeline.md
- operations/command/ideas/algebraic-learning-calculus.md
- operations/command/ideas/persistent-first-officer-session.md
- operations/command/ideas/beyond-language-models-for-agent-computation.md

## Updated Status (mid-session)

- 79 officers dispatched, 26 commits
- All 7 progressive automation demotions dispatched (6 delivered, pattern-detector in flight)
- All 10 adoption priorities implemented or dispatched
- 15+ new deterministic tools built
- 20+ library analysis texts produced
- 10 repos cloned (ECC, OpenClaw, Cline, Voyager, Reflexion, LATS, Letta, Mem0, SWE-Agent, OpenHands, Aider, FluffOS, MCP spec)
- Task graph cleaned (34 tasks correctly blocked by dependency propagation)
- Knowledge graph at 11,594 entities
- Harness: 26 agents, 58 commands, 40 skills, 33 hooks, 6 rules, 74 passing tests

## Exact Next Steps

1. Pattern-detector.js (#7 demotion) still in flight — commit when landed
2. Algebraic learning foundations research delivered — connect to cl-pipeline plan
3. Dwarf Fortress analysis likely landing — review for simulation patterns
4. Continue dispatching from ready queue — focus on CL pipeline integration
5. Run /learn-eval to capture session patterns as reusable skills
6. Consider VPS migration to Hetzner (plan exists at operations/engineering/fars/docs/vps-model-infrastructure-plan.md)
