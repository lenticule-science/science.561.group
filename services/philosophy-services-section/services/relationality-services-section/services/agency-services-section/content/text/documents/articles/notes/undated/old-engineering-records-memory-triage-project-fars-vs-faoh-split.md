---
name: project_fars-vs-faoh-split
description: Captain's architectural distinction — FARS (the substrate) is separate from FAOH (the harnesses that compose FARS muck into agent contexts)
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: project_fars-vs-faoh-split
---

Captain articulated 2026-04-05 session 246e6d58 (after compaction): as we build we're going to want to set up two things, not one.

**FARS** = the Flatfile Agentic Resource System itself.
- The substrate: flatfile store, markdown+frontmatter entities, triple extraction, bilattice algebra, reduction rules, fiber queries.
- Pure data-and-math. Language-agnostic (with a Node reference implementation).
- Provides a primitive epistemology and ontology that just about any other information builds on.
- "Just a very very simple amount of node and some markdown files."

**FARS Agentic Orchestration Harness(es)** (FAOH) = consumers of FARS.
- Tools that take FARS data and compose it into agent prompts, crew dispatch, workflow orchestration, session context, hook context.
- Where the `.claude/` harness, the `.codex/` harness, mash-engine's dispatch pipeline all live.
- Plural: multiple harnesses can compose the same FARS data differently (Claude Code harness, Codex harness, future Cursor/Aider/etc. harnesses).

**Why:** The substrate and its consumers have different design forces. FARS should be active, minimal, and math-grounded. Harnesses should be thick, product-specific, and iterable. Collapsing them (the current state, where `operations/engineering/fars/agentic/` mixes both) makes it impossible to reason about either cleanly. Under the voidmath reading, this is literally the firable/settled split: FARS is the settled face (entities, predicates, relations as data); FAOH is the firable face (potential reductions happening when agents read and write).

**How to apply:**
- When writing/reviewing an FARS component, ask: does this belong in the substrate (always loaded, harness-independent) or in a harness (specific to Claude Code / Codex / etc.)?
- Harness-specific concerns: hook invocation, skill invocation, agent definitions, command definitions, rule loading, tool registration for a specific agent product.
- Substrate concerns: triple extraction, frontmatter parsing, fiber algebra, reduction rules, datastore schema, entity validation, graph regeneration.
- The current `operations/engineering/fars/agentic/` folder mixes both. Next architectural move likely: separate `fars/core/` (substrate) from `fars/harnesses/claude-code/`, `fars/harnesses/codex/`, etc.

**Not yet acted on.** Recorded here so the distinction is available for the next refactor pass.
