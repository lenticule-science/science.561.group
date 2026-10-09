---
title: Continuous Learning System Architecture
description: Specification for a continuous learning system that captures Claude Code session patterns via observation hooks, detects patterns through background analysis, and evolves behaviors into reusable instincts.
date-created: 2026-03-31
type: note
name: continuous-learning-system
keywords:
  - observation-hooks
  - pattern-detection
  - instinct-evolution
  - session-analysis
  - observer-agent
specialization: plan
step-1: complete
step-2: complete
step-3: complete
step-4: complete
step-5: complete
step-6: complete
step-7: complete
step-8: complete
step-9: complete
department: engineering
scope: multi-session
---


## Goal

Build a system that automatically captures patterns from Claude Code sessions and evolves them into reusable instincts, skills, and agent behaviors. Adapted from ECC's continuous-learning-v2 architecture, fitted to this system's conventions and infrastructure.

## Context

### What we have now

- **`/learn` command** — manual, user-triggered pattern extraction. Saves to `operations/command/endeavor/records/learned/`. Good but relies entirely on someone remembering to run it.
- **`evaluate-session.js` stop hook** — counts tool calls, reminds user about `/learn` after substantial sessions. This is ECC's v1 approach: session-end signaling only.
- **`session-start.js` / `session-end.js`** — session state persistence. Loads context at start, saves at stop.
- **Memory system** — Claude's auto-memory in `~/.claude/projects/`. Stores user preferences, project context, feedback. Good for conversational continuity, not for systematic pattern detection.

### What ECC's v2 does differently

ECC's continuous learning v2 uses **hooks instead of skills** for observation. Skills fire ~50-80% based on model judgment; hooks fire 100% deterministically. The architecture:

1. **Observe hook** (PreToolUse + PostToolUse) captures every tool call to JSONL
2. **Observer agent** (background, Haiku model) reads accumulated observations and detects patterns
3. **Instincts** — atomic learned behaviors with confidence scores (0.3 tentative → 0.9 near-certain)
4. **Evolution** — instincts cluster into skills/commands/agents over time
5. **Project scoping** — instincts don't leak between projects (git remote URL hash)

### Key ECC source files

All under `operations/engineering/fars/src/everything-claude-code/skills/continuous-learning-v2/`:

- `SKILL.md` — full spec and architecture docs
- `hooks/observe.sh` — the observation hook (bash + python, ~400 lines)
- `agents/observer.md` — observer agent definition (pattern detection rules)
- `agents/observer-loop.sh` — background loop that runs the observer
- `scripts/detect-project.sh` — project detection via git remote hash
- `scripts/instinct-cli.py` — CLI for instinct management (status, import, export, promote, prune)
- `config.json` — observer configuration

### Adaptation decisions

| ECC pattern | Our adaptation |
|-------------|----------------|
| Bash + Python hooks | Python-only scripts (user preference: pure Python, no MCP) |
| Background Haiku observer | Same approach — cheap model for pattern detection |
| JSONL observation files | Same — append-only, archivable |
| `~/.claude/homunculus/` storage | In-repo under `operations/command/endeavor/records/` (everything stays version-controlled) |
| Project-scoped instincts | Useful but simpler — we mainly work in one repo |
| Instinct → skill evolution | Integrate with existing `/learn` and `/skill-create` commands |
| 5-layer observer safety gates | Adapt for Windows (no flock, no SIGUSR1) |

## Steps

### Step 1: Observation hook (Python)

Write `operations/engineering/fars/hooks/observe.py` — a Python script that:

- Reads hook JSON from stdin (Claude Code PreToolUse/PostToolUse format)
- Extracts tool name, input (truncated to 5000 chars), output, session ID, timestamp
- Scrubs secrets (API keys, tokens, passwords) before persisting
- Appends a JSONL entry to `operations/command/endeavor/records/observations/observations.jsonl`
- Archives when file exceeds 10MB
- Skips subagent sessions (agent_id present in input)
- Skips if `ECC_SKIP_OBSERVE=1` env var is set

Also write `operations/engineering/fars/hooks/detect_project.py` — project detection helper:

- Priority: `CLAUDE_PROJECT_DIR` env → git remote URL hash → git repo root hash → "global"
- Returns in-repo paths for observations and instincts directories

Register as a PostToolUse hook only in `.claude/settings.json` (PostToolUse captures both input context and output, so a single registration avoids duplicates):

```json
{
  "matcher": "",
  "hooks": [{
    "type": "command",
    "command": "python operations/engineering/fars/hooks/observe.py",
    "async": true,
    "timeout": 5000
  }]
}
```

**Verify:** Run a short session, check that `operations/command/endeavor/records/observations/observations.jsonl` has entries. Confirm no secrets in output. Confirm subagent sessions are skipped.

### Step 2: Instinct format and storage

Define the instinct format for this system. Instincts are markdown files with YAML frontmatter (consistent with everything else in this repo):

```markdown
---
id: grep-before-edit
trigger: "when modifying code or content"
confidence: 0.7
domain: workflow
source: session-observation
scope: project
project-id: "a1b2c3d4e5f6"
date-created: 2026-03-31
date-last-seen: 2026-03-31
---

# Grep before Edit

## Action

Search for the target content with Grep before using Edit, to confirm the exact string and its uniqueness.

## Evidence

- Observed 8 times across sessions
- Pattern: Edit failures when skipping Grep step
```

Storage structure:

```
# Everything lives IN-REPO:
operations/command/endeavor/records/
├── instincts/
│   ├── personal/          # Auto-learned from observations
│   └── inherited/         # Imported/curated
├── observations/
│   ├── observations.jsonl # Current observation log
│   └── archive/           # Rotated observation files
├── learned/               # Existing manual /learn output
├── session-logs/          # Session debriefs
└── session-state/         # Session continuity
```

**Verify:** Manually create 2-3 instincts. Confirm they load correctly in step 4.

### Step 3: Observer agent

Write the observer as an agent definition at `.claude/agents/observer.md`:

```yaml
---
name: observer
description: Background agent that analyzes session observations to detect patterns and create instincts. Uses Haiku for cost-efficiency.
model: haiku
tools:
  - Read
  - Write
  - Glob
  - Grep
---
```

Write `operations/engineering/fars/hooks/observer-loop.py` — background loop that:

- Reads the last 500 observations from the project's JSONL file
- Sends them to Claude (Haiku) with pattern detection instructions
- Haiku writes instinct files directly to the project's instincts directory
- Runs on a configurable interval (default: every 5 minutes)
- Has re-entrancy guard (skip if already analyzing)
- Has cooldown (minimum 60s between analyses)
- Prunes observations after processing (archive, don't delete)

Pattern detection targets (from ECC's observer.md):

1. **User corrections** — "No, use X instead" → instinct about preference
2. **Error resolutions** — error followed by fix → instinct about fix pattern
3. **Repeated workflows** — same tool sequence 3+ times → workflow instinct
4. **Tool preferences** — consistent tool choice → preference instinct

Windows adaptation: No SIGUSR1 signaling. Instead, use a simple file-based trigger (touch a sentinel file) or just rely on the interval timer.

**Verify:** Accumulate 20+ observations from a real session. Run observer manually. Confirm it creates reasonable instincts.

### Step 4: Instinct loading at session start

Modify `operations/engineering/fars/hooks/session-start.js` to:

- Read instincts from both global and project-scoped directories
- Filter to confidence >= 0.5 (skip tentative ones)
- Include them in the session context via stderr output
- Format as a brief "Learned behaviors" section

**Verify:** Create instincts, start new session, confirm they appear in context.

### Step 5: Instinct CLI and commands

Write `operations/engineering/fars/instinct-cli.py` with subcommands:

- `status` — show all instincts (project + global) with confidence scores
- `export` — export instincts to a file
- `import <file>` — import instincts
- `promote [id]` — promote project instinct to global
- `prune` — delete instincts with confidence below 0.3 or not seen in 30+ days

Create commands:

- `.claude/commands/instinct-status.md` — wraps `instinct-cli.py status`
- Update `/learn` to also check for instincts that should be promoted or evolved into skills

### Step 6: Connect to existing `/learn` and `/skill-create`

The continuous learning system feeds INTO the existing manual learning workflow:

- Observer creates instincts automatically (low-confidence, narrow)
- `/learn` reviews instincts and promotes the best ones to skills or terms
- `/skill-create` can cluster related instincts into a new skill
- High-confidence instincts that appear across sessions get promoted to global

Update `/learn` command to include: "Check auto-captured instincts via `python operations/engineering/fars/instinct_cli.py status` for instincts worth promoting."

### Step 7: Close the observation-analysis loop

Wire observer_loop.py into the Stop hook so observations actually get analyzed at session end, rather than only on manual invocation. Add confidence decay so stale instincts fade.

- Register `observer_loop.py` as async Stop hook (180s timeout) — DONE 2026-03-31
- Add `decay` subcommand to `instinct_cli.py` (-0.02/week since last seen) — DONE 2026-03-31
- `prune` now applies decay before pruning — DONE 2026-03-31

**Verify:** End a session with 20+ observations. Observer should fire automatically and create or update instincts. Run `instinct_cli.py decay --dry-run` after a week to confirm decay math.

### Step 8: Guard gates for observer

ECC has sophisticated guards: time-window gating, idle detection, cooldown timers. Our observer was firing blindly whenever there were 20+ observations.

- Cooldown gate: skip if observer ran within the last hour (temp file mtime check) — DONE 2026-03-31
- Session-length gate: skip if session had < 15 tool calls (reads suggest-compact counter) — DONE 2026-03-31
- `--no-guards` flag for manual invocation — DONE 2026-03-31
- stdin hook JSON parsing so observer receives session context — DONE 2026-03-31

Not implemented (diminishing returns for now): time-window gating, idle detection.

**Verify:** End a short session (< 15 tool calls) — observer should skip. End a session right after another — cooldown should block. Use `--no-guards` to override.

### Step 9: Evolve command

ECC's `/evolve` clusters related instincts into skills, commands, or agents.

- `evolve` subcommand in instinct_cli.py — groups by domain, suggests evolution type based on count + confidence — DONE 2026-03-31
- `--generate` flag creates draft files in `operations/command/endeavor/records/evolved/` — DONE 2026-03-31
- `/evolve` command wired up — DONE 2026-03-31
- Integration: generated drafts feed into `/skill-create` for manual refinement — DONE 2026-03-31

**Verify:** Run `python operations/engineering/fars/instinct_cli.py evolve` to see clusters. With 3 workflow instincts it should suggest a skill.

## What this does NOT include (yet)

- **Cross-project promotion** — ECC promotes instincts seen in 2+ projects. We mainly work in one repo, so this is low priority.

## Success criteria

- Every tool call in a session is captured as an observation
- After 20+ observations, the observer creates at least one instinct
- Instincts load into new sessions and influence agent behavior
- The `/learn` workflow can review and promote auto-captured instincts
- No secrets appear in observation files
- Observer doesn't fire on its own sessions (no infinite loops)
- Everything is Python (no bash wrapper scripts)
