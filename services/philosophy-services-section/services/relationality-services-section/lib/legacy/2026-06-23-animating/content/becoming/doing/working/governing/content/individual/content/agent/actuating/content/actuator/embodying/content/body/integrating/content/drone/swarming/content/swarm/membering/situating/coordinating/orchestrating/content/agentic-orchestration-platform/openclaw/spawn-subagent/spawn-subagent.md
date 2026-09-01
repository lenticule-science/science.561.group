---
type: morphism
class: operator
description: Spawn a new isolated agent turn to execute a prompt in the background.
status: draft
depends-on: [agent-turn, session]
---

# Spawn Subagent

The **spawn subagent** morphism creates a new isolated agent turn to execute a given prompt, running concurrently with the current turn.
It is used for delegating work, running background tasks, or isolating potentially long-running or unsafe operations.

## Signature

```
spawn-subagent(
  prompt: string,
  sessionTarget: "isolated" | "current" | "session:<id>" = "isolated",
  model?: string,
  thinking?: string,
  timeoutSeconds?: number,
  contextMessages?: number  // 0-10
) => agent-turn-result
```

## Behavior

1. **Session Creation**
   - If `sessionTarget` is `"isolated"`: creates a new ephemeral isolated session
   - If `"current"`: uses the session where the morphism was invoked (or falls back to isolated if none)
   - If `"session:<id>"`: uses or creates a persistent named session with the given ID

2. **Skill & Tool Preparation**
   - Loads eligible skills based on the target session's agent allowlist and skill gates
   - Prepares environment injection for the agent turn

3. **Agent Turn Execution**
   - Invokes the agent runtime with the provided prompt in the target session
   - Streams intermediate `agent` events back to the caller (if desired)
   - Returns a final result (`ok` with output or `error`)

4. **Cleanup**
   - For `"isolated"` sessions: the session is destroyed after the turn completes
   - For `"current"` and named sessions: the session persists for future use

## Usage Notes

- The morphism is non-blocking with respect to the caller if the caller does not await the result; the gateway will continue processing the current turn while the subagent runs in the background.
- To await results, the caller must use a mechanism that waits for the subagent completion (e.g., via a future/promise or by checking session state).
- Subagents inherit the workspace of the parent agent unless overridden in the agent configuration.
- Useful for: running long computations, polling external services, handling user requests in parallel, isolating risky tool usage.

## Version Specifics (2026.05.07)

- Default `sessionTarget`: `"isolated"`
- Default `timeoutSeconds`: `0` (no timeout)
- Default `contextMessages`: `0` (no context)
- The morphism is exposed via the `sessions_spawn` tool in the gateway API.
- Subagent runs appear in the `openclaw tasks` list when using isolated sessions.
