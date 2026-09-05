---
type: object
class: system
description: A session in OpenClaw 2026.05.07 - an execution context that maintains state across agent turns.
status: draft
depends-on: []
---

# Session (v2026.05.07)

A **session** in OpenClaw is an execution context that maintains state (such as message history, workspace, and skill snapshot) across multiple agent turns.
Sessions provide isolation and continuity for agent orchestration.

## Session Types

OpenClaw 2026.05.07 supports four session target types, specified when creating agent turns or cron jobs:

1. **`main`**
   - The primary session where the user interacts directly with the agent
   - Long-lived; persists for the duration of the gateway process or until explicitly killed
   - Only accepts `systemEvent` payloads (used for reminders, notifications)
   - Example: chatting with the agent in the web UI or messaging platform

2. **`isolated`**
   - An ephemeral background session created for a specific agent turn
   - Automatically destroyed after the agent turn completes
   - Only accepts `agentTurn` payloads
   - Used for background work, cron jobs, subagent spawns
   - Each isolated session gets a clean skill snapshot and environment

3. **`current`**
   - Binds to the session where the requesting agent turn or cron job originated
   - Resolved at the time the cron is created or agent turn is spawned
   - Only accepts `agentTurn` payloads
   - Useful for continuing work in the same contextual session
   - If no current session exists, behaves like `isolated`

4. **`session:<custom-id>`**
   - A persistent named session reused across multiple turns
   - Format: `session:<identifier>` where identifier is a string (e.g., "session:project-daily")
   - Created on first use and persists until explicitly killed or gateway restart
   - Only accepts `agentTurn` payloads
   - Enables long-running contexts like ongoing projects or monitoring tasks

## Session State

Each session maintains the following state:

- **Message History**: Chronological record of turns in the session (limited by configuration, typically last N turns)
- **Workspace Directory**: File system root accessible to agent turns in the session (inherited from agent defaults)
- **Skill Snapshot**: The set of skills eligible for use in the session (refreshed on session start or via skills watcher)
- **Environment Variables**: Injected variables from skills.config and agent configuration
- **Tool Usage Metrics**: Tracking for billing, limits, and diagnostics
- **Session Metadata**: Creation time, last activity, agent ID, labels

## Session Isolation

Sessions provide strong isolation boundaries: - Message history does not leak between sessions - Workspace directories are separate unless explicitly shared (same path) - Skill snapshots are independent (though they may contain the same skills) - Environment variables are not shared between sessions - Agent turns in one session cannot directly access state from another session

Cross-session communication must occur through: - Shared files in the workspace - External services (databases, APIs) - Gateway-mediated mechanisms (e.g., one session leaving a message for another via a shared object)

## Version Specifics (2026.05.07)

- Default message history limit: typically 20 turns (configurable via session settings)
- Workspace inheritance: sessions inherit `agents.defaults.workspace` unless overridden
- Session cleanup: isolated sessions destroyed after agent turn completion; main and named sessions persist until killed
- Killing sessions: can be terminated via `sessions_spawn` with cleanup or direct gateway API
- Session labeling: optional human-readable labels for easier identification
- Concurrent limits: no hard limit on number of sessions; constrained by system resources
- Serialization: session state is not persisted across gateway restarts (ephemeral by design)
