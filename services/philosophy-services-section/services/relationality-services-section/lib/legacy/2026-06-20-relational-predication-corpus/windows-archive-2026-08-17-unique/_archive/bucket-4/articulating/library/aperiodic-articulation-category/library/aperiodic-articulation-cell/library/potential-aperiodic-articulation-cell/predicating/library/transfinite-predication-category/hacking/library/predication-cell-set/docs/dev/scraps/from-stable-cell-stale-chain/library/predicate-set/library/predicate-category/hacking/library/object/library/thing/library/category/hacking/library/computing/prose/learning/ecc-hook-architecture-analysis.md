---
title: "ECC Hook Architecture Analysis"
description: "Deep analysis of Everything Claude Code's hook system — patterns, gaps, and recommendations for the 561 harness"
date-created: 2026-04-04
domain: computing
keywords:
  - claude-code
  - agentic-harness
  - hooks
  - infrastructure-analysis
sources:
  - operations/engineering/fars/src/everything-claude-code/
see-also:
  - ecc-agents-and-commands-analysis.md
  - ecc-skill-system-analysis.md
  - continuous-learning-in-agentic-harnesses.md
---

Everything Claude Code (ECC) is the most mature open-source Claude Code plugin, with 25+ hooks across 7 lifecycle events, a shared utility library, and a profile-gated execution framework. This analysis compares ECC's hook architecture against the 561 harness to identify patterns worth adopting, hooks worth porting, and design decisions worth understanding.

## Architecture Overview

### ECC Hook Inventory

ECC registers hooks across every Claude Code lifecycle event:

| Event | Count | Purpose |
|-------|-------|---------|
| SessionStart | 1 | Project detection, skill listing, package manager detection |
| PreToolUse | 12 | Safety gates, quality checks, observation capture, governance |
| PreCompact | 1 | State preservation before context compaction |
| PostToolUse | 10 | Logging, quality gates, observation capture, governance |
| PostToolUseFailure | 1 | MCP health tracking |
| Stop | 6 | Batch formatting, console.log scanning, session persistence, cost tracking, desktop notifications |
| SessionEnd | 1 | Observer cleanup |

The 561 harness registers hooks across the same events plus UserPromptSubmit (which ECC does not use), with 29 registered hooks total. Both systems have comparable breadth, but their depth differs in specific areas.

### The run-with-flags.js Pattern

ECC's most important architectural pattern is `run-with-flags.js`, a universal hook dispatcher that provides:

1. **Profile gating**: Three profiles (minimal, standard, strict) controlled by `ECC_HOOK_PROFILE` env var. Each hook declares which profiles it runs in. A runtime disable list (`ECC_DISABLED_HOOKS`) allows per-hook overrides.

2. **In-process execution**: When a hook exports a `run(rawInput)` function, run-with-flags.js calls it directly via `require()` instead of spawning a child process. This eliminates 50–100ms of Node.js startup overhead per hook invocation — significant when 5–10 hooks fire on every tool call.

3. **Truncation detection**: stdin is capped at 1MB. If input exceeds this, hooks receive a `truncated` flag and can choose to block (config-protection does) or degrade gracefully (governance-capture logs a warning event).

4. **Path traversal prevention**: The dispatcher validates that resolved hook paths stay within the plugin root directory.

The 561 harness has its own `run-with-flags.js` and `hook-profiles.js`, but does not implement the in-process execution optimization. Our hooks always spawn child processes.

**Recommendation**: Port the in-process `run()` export pattern. With 11+ synchronous PreToolUse hooks, eliminating spawn overhead could save 500ms+ per tool call in the critical path.

### The Dual Entry Point Pattern

Every ECC hook follows the same structure:

```javascript
function run(rawInput, options = {}) {
  // Core logic
  return rawInput; // or { exitCode, stdout, stderr }
}

module.exports = { run };

// Stdin fallback for legacy/direct invocation
if (require.main === module) {
  // Read stdin, call run(), write stdout
}
```

This pattern means hooks work both as imported modules (fast path via run-with-flags.js) and as standalone scripts (backward compatibility). The 561 harness hooks use only the stdin path.

**Recommendation**: Adopt this pattern for all new hooks and retrofit high-frequency existing hooks (observe.js, safety-guard.js, config-protection.js).

## Hook-by-Hook Comparison

### Hooks ECC Has That We Don't

#### auto-tmux-dev (PreToolUse:Bash)
**What it does**: Detects dev server commands (npm run dev, pnpm dev, yarn dev, bun run dev) and transforms them to run in a named tmux session. Kills any existing session with the same name first, creates a detached session, and reports how to view logs.

**Why it matters**: Prevents dev servers from blocking Claude Code's main process. The session naming convention (derived from the project directory basename) allows multiple projects to run simultaneously.

**Relevance to 561**: Low. We don't run web dev servers from the harness. The pattern of transforming Bash commands before execution is interesting but we have no current use case.

**Verdict**: Skip.

#### post-bash-pr-created (PostToolUse:Bash)
**What it does**: Detects when a `gh pr create` command produces a PR URL and logs it, then injects a suggested review command into the output.

**Why it matters**: Reduces context switching — the agent immediately has the review command available without needing to look it up.

**Relevance to 561**: Low. We rarely create PRs through the agent. If we start doing so, this would be a nice convenience.

**Verdict**: Skip for now.

#### post-edit-accumulator (PostToolUse:Edit|Write)
**What it does**: Records the file paths of all JS/TS files edited during a response to a temporary accumulator file. The Stop hook (stop-format-typecheck) reads this file to batch-process all edited files in a single formatter/typechecker invocation.

**Why it matters**: This is the core of ECC's "defer work to Stop" pattern. Instead of running formatters after every Edit (which adds latency to each tool call), all formatting is batched into a single Stop hook invocation. This is significantly faster for responses that edit many files.

**Relevance to 561**: Medium. We don't have JS/TS formatting needs, but the accumulator pattern itself is valuable. Our `post-edit-quality.js` runs after every Edit/Write — if it were deferred to Stop, it could batch YAML/frontmatter validation across all files modified in a response.

**Verdict**: Port the accumulator pattern, not the specific implementation. Create an edit-accumulator that our Stop hooks can consume.

#### stop-format-typecheck (Stop)
**What it does**: Reads the accumulator file, groups files by project root, runs one formatter invocation per root, then groups .ts/.tsx files by tsconfig.json directory and runs one `tsc --noEmit` per directory. Distributes a 270-second budget evenly across all batches.

**Why it matters**: The budget distribution pattern is clever — it prevents any single batch from consuming the entire Stop timeout. The grouping-by-root pattern avoids redundant formatter startup.

**Relevance to 561**: The budget distribution pattern is portable. Our observer-loop.js already has a 180s timeout, and we could apply similar budget management to future batch Stop hooks.

**Verdict**: Adapt the budget distribution pattern; skip the formatter/typechecker specifics.

#### stop-check-console-log (Stop)
**What it does**: Scans git-modified JS/TS files for `console.log` statements before final commit. A last-chance safety net for debug output.

**Relevance to 561**: Low. We don't write enough JS/TS to need this.

**Verdict**: Skip.

#### desktop-notify (Stop)
**What it does**: Sends a native desktop notification when Claude finishes responding. Supports macOS (osascript) and WSL (PowerShell BurntToast). Extracts a short summary from the last assistant message.

**Why it matters**: On long-running tasks, the user can switch to other work and get notified when Claude is done. The WSL detection is memoized at module load to avoid repeated /proc/version reads.

**Relevance to 561**: Medium-high. We run on a Linux VPS and often have long-running agent sessions. A notification mechanism (even just logging to a channel or sending to a webhook) would be useful.

**Verdict**: Adapt. Don't port the macOS/WSL specifics — build a Linux-native notification hook that writes to our event system and optionally sends a webhook or desktop notification via `notify-send`.

#### governance-capture (PreToolUse + PostToolUse)
**What it does**: Detects governance-relevant events across both pre and post phases:
- **Secret detection**: AWS keys, JWTs, GitHub tokens, generic secrets via regex patterns
- **Approval-required commands**: git push --force, git reset --hard, rm -rf, DROP TABLE, DELETE FROM
- **Sensitive path access**: .env, credentials, .pem, .key, id_rsa files
- **Elevated privilege commands**: sudo, chmod, chown
- **Input truncation**: Logs when hook input was too large to fully inspect

Events are emitted to stderr as structured JSON with event IDs, session correlation, severity levels, and resolution tracking fields.

**Why it matters**: This is a complete governance audit trail. Each event has an ID, severity, payload, and resolution tracking — it's designed for compliance reporting, not just blocking.

**Relevance to 561**: High. We have `safety-guard.js` that blocks destructive commands and `detect-secrets.js` that catches secrets, but neither produces a structured audit trail. Our `risk-score.js` computes risk scores but doesn't correlate them into governance events. The governance-capture approach unifies detection, classification, and audit into one pipeline.

**Verdict**: Port and adapt. Our existing detect-secrets and safety-guard hooks handle the blocking; governance-capture would add the audit trail layer on top. Wire events into our event recording system rather than just stderr.

#### quality-gate (PostToolUse:Edit|Write)
**What it does**: Runs lightweight quality checks on individual files after edit. Detects the project's formatter (Biome or Prettier), resolves the binary (preferring local node_modules/.bin over npx), and runs checks or fixes. Also supports Go (gofmt) and Python (ruff).

**Why it matters**: The formatter resolution chain is the valuable part — the `resolve-formatter.js` library handles detection, binary caching, and project root resolution. The quality-gate hook itself is thin; the library does the work.

**Relevance to 561**: Low for the formatter specifics, but our `post-edit-quality.js` already handles JSON/YAML validation. We don't need JS/TS/Go/Python formatting.

**Verdict**: Skip.

#### design-quality-check (PostToolUse:Edit|Write)
**What it does**: Warns when frontend edits drift toward generic template-looking UI patterns. A domain-specific quality guard for web projects.

**Relevance to 561**: None.

**Verdict**: Skip.

#### post-edit-console-warn (PostToolUse:Edit)
**What it does**: Warns about console.log statements immediately after an Edit.

**Relevance to 561**: Low.

**Verdict**: Skip.

#### insaits-security-wrapper (PreToolUse)
**What it does**: Bridges to an external Python-based security monitor (InsAIts). Gated behind `ECC_ENABLE_INSAITS=1` env var.

**Relevance to 561**: The external bridge pattern is interesting — we could use it to integrate with security tools. But the specific tool is Python-specific.

**Verdict**: Skip the implementation, note the pattern.

### Hooks Where Both Systems Overlap

| Function | ECC Hook | 561 Hook | Notes |
|----------|----------|----------|-------|
| Block --no-verify | `block-no-verify` (npx package) | `safety-guard.js` | Ours is broader — blocks many destructive patterns, not just --no-verify |
| Git push safety | `git-push-reminder` (strict only) | `pre-bash-git-push.js` | ECC only reminds; ours validates |
| Commit quality | `pre-bash-commit-quality` | `pre-bash-commit-quality.js` | Similar scope |
| Doc file warning | `doc-file-warning` | `doc-file-warning.js` | Similar |
| Suggest compact | `suggest-compact` | `suggest-compact.js` | Similar |
| Config protection | `config-protection` | `config-protection.js` | ECC focuses on linter configs; ours protects ~/.claude/ and harness files |
| MCP health | `mcp-health-check` | `mcp-health-check.js` | Similar |
| Pre-compact | `pre-compact` | `pre-compact.js` | Similar |
| Observation capture | `observe` (bash shell script) | `observe.js` | Ours is Node.js; ECC uses bash + continuous-learning-v2 skill |
| Session start | `session-start` | `session-start.js` | ECC does project/framework detection; ours loads memory and instincts |
| Session end | `session-end` | `session-end.js` | ECC parses JSONL transcripts; ours writes frontmatter session records |
| Evaluate session | `evaluate-session` | `evaluate-session.js` | Similar purpose |
| Cost tracker | `cost-tracker` | `cost-tracker.js` | ECC uses token-based estimation; ours tracks actual usage |
| Session end marker | `session-end-marker` | `session-end-marker.js` | Similar |

### Hooks We Have That ECC Doesn't

The 561 harness has several hooks with no ECC equivalent:

| Hook | Purpose |
|------|---------|
| `compose-environment.js` | UserPromptSubmit: builds a MUD-style environment description |
| `enforce-agent-roles.js` | Injects role norms from the datastore when spawning agents |
| `enforce-commands.js` | Blocks raw writes to record directories (must use tools) |
| `frontmatter-consequence.js` | Validates reference integrity and cascades status changes |
| `update-datastore.js` | Patches the knowledge graph when files change |
| `auto-record-events.js` | Automatically records operational events on status changes |
| `risk-score.js` | Multi-dimensional risk scoring on every tool call |
| `tool-call-logger.js` | Structured JSONL logging of all tool calls |
| `observer-loop.js` | Analyzes observations to detect patterns and write instincts |
| `wip-limit.js` | Work-in-progress limits (unregistered) |
| `skill-matcher.js` | Skill matching on user prompts (unregistered) |
| `failure-analyzer.js` | Session failure analysis (unregistered) |

These reflect the 561 harness's focus on knowledge management, organizational operations, and continuous learning — domains ECC doesn't address.

## Key Patterns Worth Adopting

### 1. In-Process Hook Execution

ECC's biggest performance win. Instead of spawning a new Node.js process for each hook, `run-with-flags.js` calls `require()` and invokes the hook's exported `run()` function directly. This saves 50–100ms per hook call.

**Implementation path**: Update our `run-with-flags.js` to detect hooks that export `run()` and call them in-process. Retrofit high-frequency hooks first: `observe.js`, `safety-guard.js`, `config-protection.js`, `detect-secrets.js`.

### 2. The Accumulator Pattern

ECC separates observation from action: `post-edit-accumulator` records what happened, and `stop-format-typecheck` acts on the accumulated data at Stop time. This is faster than acting on every individual edit.

**Implementation path**: Create a generic accumulator that PostToolUse hooks can write to, and Stop hooks can consume. Candidate: batch our frontmatter validation and datastore updates to Stop instead of running them after every Edit.

### 3. Structured Governance Events

ECC's `governance-capture.js` produces structured events with IDs, severity levels, session correlation, and resolution tracking. This is an audit trail, not just a block/allow decision.

**Implementation path**: Add a governance event emitter that our existing safety-guard and detect-secrets hooks can feed into. Wire it to our event recording system (`record-event.js`).

### 4. Budget Distribution for Stop Hooks

ECC's `stop-format-typecheck` distributes a time budget evenly across batches. This prevents any single slow batch from consuming the entire Stop timeout.

**Implementation path**: Apply this pattern to our observer-loop.js and any future batch Stop hooks.

### 5. Truncation-Aware Hooks

ECC caps stdin at 1MB and passes a `truncated` flag to hooks. Security-sensitive hooks (config-protection) block on truncation — you can't bypass protection by sending a huge payload. Others (governance-capture) log a warning.

**Implementation path**: Add truncation detection to our run-with-flags.js. Our safety-guard.js should block on truncated input.

## Hooks Not Worth Porting

| Hook | Reason to skip |
|------|----------------|
| `auto-tmux-dev` | No dev server use case in our workflow |
| `tmux-reminder` | We run on a VPS, not interactively developing |
| `post-bash-pr-created` | Rarely create PRs through the agent |
| `stop-check-console-log` | No significant JS/TS codebase |
| `post-edit-console-warn` | Same reason |
| `stop-format-typecheck` | No JS/TS formatting needs (pattern is portable, implementation isn't) |
| `quality-gate` | Our post-edit-quality.js covers our needs |
| `design-quality-check` | No frontend code |
| `insaits-security` | External Python dependency, no current need |
| `post-bash-command-log` (audit mode) | Our bash-audit-log.js already covers this |
| `post-bash-command-log` (cost mode) | Our cost-tracker.js is more comprehensive |
| `post-bash-build-complete` | Labeled as "example" even in ECC |

## Quality Assessment: Deterministic vs. Inference

All ECC hooks are deterministic — none invoke an LLM. They use regex matching, file system checks, and string parsing. This is a deliberate design choice: hooks are in the critical path and must be fast and predictable.

The 561 harness follows the same principle for registered hooks. Our `observer-loop.js` is the only hook that invokes inference (via mash-engine for pattern detection), and it runs async with a 180s timeout at Stop — outside the critical path.

**Assessment**: Both systems correctly keep inference out of the hot path. ECC's approach of pure-deterministic hooks is sound and we should maintain it.

## Recommendations Summary

| Priority | Action | Effort |
|----------|--------|--------|
| High | Port in-process run() execution pattern | Medium — update run-with-flags.js, retrofit 4–6 hooks |
| High | Add truncation detection to run-with-flags.js | Small — 20 lines in the dispatcher |
| High | Port governance-capture adapted to our event system | Medium — new hook + wire to record-event |
| Medium | Implement accumulator pattern for batch Stop processing | Medium — new shared module + refactor post-edit-quality |
| Medium | Build Linux desktop/webhook notification at Stop | Small — new hook, ~50 lines |
| Medium | Add budget distribution to Stop hooks | Small — pattern in observer-loop.js |
| Low | Adopt dual entry point pattern for all new hooks | Ongoing — convention change |

## Shared Utility Library Comparison

ECC's `scripts/lib/` contains utilities that we partially replicate:

| ECC Utility | 561 Equivalent | Gap |
|-------------|----------------|-----|
| `hook-flags.js` | `hook-profiles.js` | Similar, ours may lack the profile inheritance chain |
| `utils.js` (630 lines) | Spread across individual hooks | ECC centralizes file ops, git ops, stdin parsing. We should consolidate. |
| `resolve-formatter.js` | None | Not needed — we don't format JS/TS |
| `project-detect.js` | `detect-project.js` | ECC detects 12 languages + 24 frameworks; ours is simpler |
| `package-manager.js` | None | Not needed — single-project repo |
| `session-manager.js` | Our session records in operations/ | Different approach — ECC uses temp files, we use structured records |
| `session-aliases.js` | None | Not needed — we use session IDs |
| `shell-split.js` | None | Useful if we need to analyze Bash commands more granularly |
| `resolve-ecc-root.js` | None | Not needed — we know our root |

The main gap is utility consolidation. ECC's `utils.js` provides `readStdinJson()`, `log()`, `output()`, `ensureDir()`, `appendFile()` — functions that every hook needs. Our hooks each implement their own stdin reading and file operations. A shared utility module would reduce code duplication and make hooks easier to write.

## Conclusion

ECC is a well-engineered general-purpose plugin optimized for web development workflows. Its main architectural contributions to learn from are the in-process hook execution pattern (performance), the accumulator/batch pattern (deferred processing), and the governance event structure (audit trails). Its hook-specific implementations mostly target JS/TS web development and aren't directly portable, but the patterns underneath them are.

The 561 harness is more specialized — our hooks handle knowledge graph maintenance, organizational operations, and continuous learning, which are domains ECC doesn't address. Where the systems overlap (safety, session management, observation), both are competent. The main gap is performance: adopting ECC's in-process execution and batch processing patterns would reduce our per-tool-call overhead without changing what our hooks do.
