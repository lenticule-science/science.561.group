---
name: wind-down-workflow

description: "Specification for the wind-down workflow: closing a work session by triaging INBOXes, deleting completed work, writing behavioral MemoryEntries, and committing. Includes implementation notes for the Claude agent executor."
---

The wind-down workflow closes a work session cleanly. It is a [Workflow](workflow.md)
whose domain and codomain are both "repository state" — the session starts with
accumulated work and ends with that work integrated, triaged, or explicitly deferred.

The skill implementation is [skills/wind-down.md](../skills/wind-down.md).

## Phases

1. **Triage** — every department INBOX is cleared; all messages get a status
2. **Debt review** — recent changes are scanned for induced gaps; findings go to INBOXes
3. **Memory** — behavioral MemoryEntries written (not session summaries)
4. **Cleanup** — completed WorkItems deleted from all PLANS.md files
5. **Commit** — dirty working tree committed if present
6. **Report** — open items, blockers, and top priorities for next session stated

## Trigger

Invoked by the operator (`/wind-down`) or automatically by the context monitor
hook when context usage reaches ~90%.

## Implementations

### Claude

The primary executor is the Claude agent running in the repository via Claude Code.
The skill file is the implementation spec; the agent reads and executes it.

#### Context monitor hook

Context warnings are injected via `UserPromptSubmit` hook
([src/claude/hooks/context-monitor.sh](../src/claude/hooks/context-monitor.sh)).
The hook outputs `additionalContext` instructing the agent to self-estimate
context usage and trigger wind-down at 90%. This is behavioral, not metric-based.

#### SDK

The context monitor hook relies on self-estimation because the Claude Code CLI
(used via included-with-plan access) does not expose per-response `usage` data
to hook scripts. The Anthropic SDK's response objects do include `input_tokens`
and `output_tokens`, which would allow computing a real percentage against the
model's context limit.

**Idea:** If the service layer (`src/`) ever wraps Claude API calls directly
using the SDK, the executor there could maintain a running token count and
emit a sentinel file (e.g., `.claude/context-pct`) that the hook reads instead
of relying on self-estimation.

**Blocked by:** direct API access. Not applicable to the current Claude Code CLI
deployment path.
