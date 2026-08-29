---

name: token-efficiency-analysis
date-created: 2026-03-08T00:00:00
keywords:
  - token-efficiency
  - agent-architecture
  - progressive-automation
description: "Analysis of where agent tokens are spent in the emsemioverse, with concrete reduction strategies."
part-of: technology/specifications/agential-semioverse-repository
---

## Problem

Agent sessions spend tokens on infrastructure loading (reading
CLAUDE.md, AGENTS.md, policies, skills, plans) before any productive
work begins. Per-message overhead (the interpret-message skill) adds
further cost. The total baseline before any work is ~9,600 tokens,
and each message adds ~2,100 tokens of overhead.

## Token budget by source

| Source | Tokens | When loaded | Waste type |
|--------|--------|-------------|-----------|
| CLAUDE.md | ~700 | Every session | Setup procedures that run once |
| AGENTS.md | ~2,400 | Every session | Philosophy + rules duplicated in policies |
| Policies (9 files) | ~1,700 | Every session | All loaded even when irrelevant |
| interpret-message | ~2,100 | Every message | Section 0 runs every message; gates overengineered |
| Skill registry | ~2,700 | On-demand | Verbose table format |
| Plans directory | ~10,300 | On-demand | Completed plans, accumulated logs |
| MEMORY.md | ~1,000 | Every session | Duplicates CLAUDE.md |

## Reduction strategies

### 1. Split interpret-message into fast and full paths

The interpret-message skill has 9 steps. For simple commands ("commit
this", "fix the typo"), most steps are waste. Split into:

- **Fast path** (~300 tokens): for simple commands — just do the
  action. No skill coverage check, no plan capture, no text writing.
- **Full path** (~2,100 tokens): for substantive messages that need
  the encoding loop.

The skill already has "When NOT to run the full loop" (lines 166-173)
but it loads the full 2,100 tokens before checking.

### 2. Defer section 0 (improve skills from last turn)

Section 0 of interpret-message runs the skill improvement feedback
loop every message. This should run once per session (at the start of
the NEXT session) or on explicit request, not every message. Move it
to interpret-first-message or a dedicated feedback skill.

### 3. Compile policies to a single summary

The 9 policy files total ~1,700 tokens. Most sessions only need 2-3
of them. Options:

- **Compile to one-liners**: a single file with one sentence per
  policy (~200 tokens total). Full text available on demand.
- **Lazy load**: only load policies relevant to the current task.

### 4. Trim AGENTS.md

AGENTS.md contains philosophical context (~800 tokens) that doesn't
change session-to-session. Options:

- **Keep only operational rules** in AGENTS.md (~600 tokens).
- **Link to specs** for philosophical context instead of inlining it.

### 5. Archive completed plans

The plans directory has ~50 files. Completed and abandoned plans
should be moved to `plans/archive/` so they don't appear in the
review-plans output. The review-plans skill should only show active
and proposed plans by default.

### 6. Deduplicate MEMORY.md

MEMORY.md duplicates content from CLAUDE.md and AGENTS.md. Strip it
to information that is ONLY in memory (learned preferences, session
patterns) and not in any other loaded file.

## Impact estimate

| Strategy | Savings | Where |
|----------|---------|-------|
| Fast/full interpret-message | ~1,800 tokens/message (for simple msgs) | Per message |
| Defer section 0 | ~400 tokens/message | Per message |
| Compile policies | ~1,200 tokens/session | Session start |
| Trim AGENTS.md | ~1,900 tokens/session | Session start |
| Archive plans | ~5,000 tokens on review | On-demand |
| Deduplicate MEMORY.md | ~700 tokens/session | Session start |

For a typical 10-message session (6 simple, 4 substantive):
- Current: ~9,600 + (10 × 2,100) = ~30,600 tokens overhead
- Optimized: ~5,800 + (6 × 300) + (4 × 1,700) = ~14,400 tokens
- Reduction: ~53%

## What this analysis does NOT cover

- Token cost of reading source files during actual work (unavoidable).
- Token cost of writing content (unavoidable).
- Token cost of MCP tool calls (could be reduced by better caching
  but is a different problem).
