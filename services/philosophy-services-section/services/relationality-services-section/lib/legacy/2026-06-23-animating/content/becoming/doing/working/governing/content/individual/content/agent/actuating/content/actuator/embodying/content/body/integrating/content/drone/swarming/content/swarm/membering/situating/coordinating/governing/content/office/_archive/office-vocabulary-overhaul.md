---
title: "Office Vocabulary Overhaul: Agents Become Officers"
specialization: plan
application: governance
architecture-note: "Application sublocale, not OS infrastructure — see applications-as-sublocales analysis"
serves-system: foah
date-created: 2026-04-05
project: generative-harness
cross-cuts: [command, engineering]
depends-on: [office-vocabulary-overhaul-context]
---

The 21 agent definitions are offices in disguise: they have duties, action-domains, and delegation bounds, but the frontmatter only exposes tool lists and keyword-capabilities, and dispatch scores by fuzzy keyword match rather than by tracing goal→plan→task→work-type→office.
This plan connects the pieces that already exist: enrich agent definitions with `department`, `serves`, `action-domain`, `duties`, `autonomous`, `escalates`; rewrite dispatch-work.js to walk the chain (weighting chain-traced matches above keyword proximity); add `--office` to mash-engine so external dispatch installs an incumbent with their duties in the prompt; build `/bridge` so the first officer can see goals-needing-progress, ready-tasks-by-office, running-sessions-by-office; regenerate AGENTS.md as a crew roster from the definitions.
Step-by-step verification criteria and the full "what's missing" diagnosis live in `analyses/office-vocabulary-overhaul-context.md`.

Open: `.claude/agents/` directory can't be renamed to `offices/` (Claude Code constraint) — offices live under the "agents" name; whether `subsumes:` should become a delegation chain (researcher subsumes docs-lookup ≡ researcher can delegate to docs-lookup); what metrics offices should track for Sunday gamification (tokens, tasks-completed, accuracy, settlement progress inquiry→process).
