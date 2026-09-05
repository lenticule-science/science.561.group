---
name: continuous-learning-improvement
date-created: 2026-04-04
domains:
  - operations/engineering
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

## What We Have vs What ECC Has

### Observation Capture

| Feature | 561 (ours) | ECC |
|---------|-----------|-----|
| Hook type | PostToolUse JS | PreToolUse + PostToolUse bash |
| Secret scrubbing | Yes (regex) | Yes (same regex) |
| Truncation | 5000 chars | 5000 chars |
| Rotation | 10 MB auto-rotate | 10 MB auto-rotate |
| Subagent skip | Yes (agent_id check) | Yes (5-layer guard) |
| Project detection | git remote hash | git remote hash (identical) |
| Storage | operations/engineering/records/observations/ | ~/.claude/homunculus/projects/{hash}/ |

**Verdict: Parity.** Our observe.js is a clean JS port of ECC's observe.sh. No changes needed.

### Pattern Detection (Observer)

| Feature | 561 (ours) | ECC |
|---------|-----------|-----|
| Trigger | Stop hook, 1h cooldown, 15+ tool calls, 20+ observations | Same thresholds |
| Model | Haiku | Haiku |
| Sample size | Last 500 lines | Last 500 lines |
| Pattern types | Corrections, errors, workflows, preferences | Same 4 types |
| Output | Instinct .md files with frontmatter | Same format |
| Lock file | Yes (.observer-running) | Yes |

**Verdict: Parity.** Our observer-loop.js mirrors ECC. The observer agent spec (observer.md) is functionally identical.

### Instinct Storage & Scoring

| Feature | 561 (ours) | ECC |
|---------|-----------|-----|
| Storage | records/instincts/personal/ and inherited/ | ~/.claude/homunculus/instincts/ + projects/{hash}/instincts/ |
| Format | Markdown + YAML frontmatter | Markdown + YAML frontmatter |
| Confidence scale | 0.3-0.85 initial | Same |
| Current instincts | 3 (all project-scoped) | N/A |
| Confidence decay | **Not implemented** | -0.02/week without observation |
| Confidence boost | **Not implemented** | +0.05 per confirming observation |
| Confidence penalty | **Not implemented** | -0.1 per contradicting observation |

**Verdict: GAP.** We create instincts but never update their confidence after creation. Confidence is set once by the observer and stays frozen.

### Session Briefing

| Feature | 561 (ours) | ECC |
|---------|-----------|-----|
| Orientation | Yes (datastore-composed) | Yes (static + package manager) |
| Memory | Yes (memory/*.md files) | No equivalent |
| Instincts at start | Yes (top 15, conf >= 0.5) | Yes (all, conf >= 0.5) |
| Previous session | Yes (full frontmatter + body) | Yes (last 10 messages, tools, files) |
| Active tasks | **Yes** (from datastore) | No equivalent |

**Verdict: We're ahead.** Our session-start hook is richer than ECC's — we have memory, datastore composition, and active task listing that ECC lacks. The previous session record is more structured (frontmatter vs raw message extraction).

### Instinct Management Commands

| Command | 561 (ours) | ECC |
|---------|-----------|-----|
| /instinct-status | Yes | Yes |
| /evolve | Yes | Yes |
| /promote | Yes | Yes |
| /learn | Yes | Yes |
| /learn-eval | Yes | Yes |
| instinct-cli.py | **No** — commands are prompt-based, not tooled | Yes — 1700-line Python CLI |

**Verdict: Structural difference.** ECC has a deterministic Python CLI that does the actual instinct management (file I/O, clustering, promotion logic). Our commands are prompt-based — they tell Claude what to do, but Claude executes it ad hoc each time. This means:
- Our /evolve produces different results each run (LLM variance)
- Our /promote has no automated cross-project detection
- No programmatic instinct querying or filtering

---

## Five Questions Answered

### 1. How does ECC detect patterns ACROSS sessions?

ECC accumulates observations in project-scoped JSONL files that persist across sessions. The observer reads the last 500 lines regardless of which session produced them. Cross-session detection is implicit: if the same pattern appears in observations from sessions A, B, and C, the observer sees all of them in one pass.

**Our gap:** Same mechanism. We do this too. No gap here.

### 2. How does ECC score instinct confidence?

Initial score by observation count (1-2: 0.3, 3-5: 0.5, 6-10: 0.7, 11+: 0.85). Then **dynamic evolution**: +0.05 per confirming observation, -0.1 per contradiction, -0.02/week decay.

**Our gap:** We set confidence once at creation. No evolution. An instinct created with 0.7 stays at 0.7 forever, even if the user contradicts it repeatedly. This is the single most impactful gap — stale instincts that don't decay will eventually poison the briefing.

### 3. How does ECC promote instincts to skills?

Two-step: `/evolve` clusters related instincts into candidate skills/commands/agents. `/promote` moves project-scoped instincts to global scope when seen in 2+ projects with avg confidence >= 0.8. The instinct-cli.py handles file operations deterministically.

**Our gap:** We only have one project, so cross-project promotion is irrelevant. But the /evolve → skill pipeline matters. Our /evolve is prompt-only; ECC's uses instinct-cli.py to do the clustering programmatically then presents candidates. The difference: ECC's clustering is reproducible; ours is not.

### 4. How does ECC brief the agent at session start with accumulated learning?

session-start.js loads: (1) previous session summary (last 10 messages, tools, files), (2) all instincts with confidence >= 0.5, (3) project context. It injects this as additionalContext in the SessionStart hook output.

**Our gap:** We're actually ahead here. Our session-start.js loads orientation from the datastore, memory files, instincts, previous session frontmatter, AND active tasks. ECC has no memory system or task tracking.

### 5. What would reduce the first officer's per-session coordination cost the most?

Ranked by impact on next-session cost:

1. **Confidence decay on instincts** — Without decay, the instinct list grows monotonically. Eventually the 15-instinct cap means useful recent instincts get crowded out by stale ones. A simple decay cron (or a check in session-start.js) prevents this. **Estimated savings: prevents future degradation, not immediate.**

2. **Deterministic instinct update in observe.js** — When the observer creates an instinct that already exists, it should update the existing instinct's confidence and date-last-seen rather than creating a duplicate or ignoring it. This is the "confirming observation" path that ECC's instinct-cli.py handles. **PORT the merge logic from instinct-cli.py's `_update_or_create_instinct` function.**

3. **Session-end summary that captures DECISIONS, not just file lists** — Our session-end.js records tools/files/domains, which is useful for orientation but doesn't capture what was DECIDED. ECC has the same limitation. Adding a "decisions made" or "key outcomes" field to the session record (extractable from the transcript) would let the next session skip re-derivation. **BUILD this — neither system has it.**

4. **Instinct-as-rule promotion path** — When an instinct hits 0.9+ confidence, it should be a candidate to become a rule in `.claude/rules/` (via the harness source). Rules load every session without the 15-instinct cap and without requiring the agent to "apply" them. The check-term-definitions instinct (0.8) is already almost a rule — and in fact, it duplicates content-conventions.md's "When the user says a specific word emphatically" rule. **BUILD a dedup check between instincts and existing rules.**

5. **Observer scheduling via cron instead of Stop hook** — The Stop hook trigger is unreliable (depends on session ending cleanly, cooldown alignment, etc.). A cron job running `node observer-loop.js --no-guards` every 4 hours would be more predictable. **BUILD — use our existing CronCreate infrastructure.**

---

## Specific Recommendations

### PORT from ECC (code/patterns to adapt)

1. **Confidence evolution logic** from `instinct-cli.py` lines ~200-260.
   - Add to observer-loop.js: when creating an instinct, check if one with the same `id` exists. If so, bump confidence by +0.05, update `date-last-seen`.
   - Add decay: in session-start.js (or a cron), reduce confidence by 0.02 for each week since `date-last-seen`. Drop instincts below 0.2.
   - Implementation: ~30 lines of JS in observer-loop.js.

2. **Contradiction detection** from observer agent spec.
   - When the observer sees a user correction that contradicts an existing instinct, apply -0.1 to that instinct's confidence.
   - This requires the observer's Haiku prompt to include existing instinct IDs so it can reference them.
   - Implementation: modify the observer prompt template to include current instinct list (~10 lines).

### BUILD (new for our system)

3. **Instinct-rule dedup check** in session-start.js.
   - Before displaying instincts, check if an instinct's trigger/action overlaps with an existing rule.
   - If overlap > 80% (simple substring match), skip the instinct and optionally mark it as "superseded."
   - Implementation: ~20 lines in session-start.js.

4. **Decision extraction in session-end.js.**
   - Parse transcript for patterns indicating decisions: "decided to", "going with", "chose", plan/task status changes.
   - Add a `decisions` array to the session record frontmatter.
   - Implementation: ~40 lines in session-end.js.

5. **Scheduled observer via cron.**
   - Create a cron trigger that runs observer-loop.js every 4 hours with `--no-guards`.
   - More reliable than depending on Stop hook + cooldown alignment.
   - Implementation: one CronCreate call.

### DO NOT PORT

- **Multi-project isolation** — We have one repo. The project hash system adds complexity without benefit.
- **instinct-cli.py** — 1700 lines of Python for a system that has 3 instincts. Our prompt-based commands are adequate until instinct count exceeds ~20.
- **instinct-import/export** — No team sharing use case currently.
- **detect-project.sh** — Our detect-project.js already does this.

---

## Priority Order for Implementation

| Priority | Item | Type | Effort | Impact |
|----------|------|------|--------|--------|
| 1 | Confidence evolution (boost + decay) | PORT | ~30 lines JS | Prevents instinct staleness |
| 2 | Instinct-rule dedup check | BUILD | ~20 lines JS | Removes redundant briefing tokens |
| 3 | Scheduled observer cron | BUILD | 1 cron config | More reliable pattern detection |
| 4 | Decision extraction in session-end | BUILD | ~40 lines JS | Richer session continuity |
| 5 | Contradiction detection | PORT | ~10 lines prompt | Enables confidence penalty path |

Total effort: ~120 lines of JS + 1 cron config. All changes go in `operations/engineering/fars/agentic/hooks/`.

---

## Current State Summary

Our continuous learning pipeline is architecturally complete — we have observation capture, pattern detection, instinct storage, session briefing, and management commands. The ECC system we ported from is the same architecture. The gaps are in **instinct lifecycle management**: we create instincts but never update, decay, or deduplicate them. Fixing this is straightforward (items 1-3 above, ~50 lines of JS) and directly reduces per-session coordination cost by keeping the instinct briefing relevant and non-redundant.
