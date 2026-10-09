---
type: concept
class: protocol
description: A scheduled job definition that specifies when and how work should be triggered in the OpenClaw gateway.
status: draft
depends-on: []
---

# Cron Job

A **cron job** is a scheduled task definition in OpenClaw that specifies when work should be triggered and what that work should be.
Cron jobs enable time-based automation within the agent orchestration platform.

## Structure

A cron job consists of: - **Schedule**: When the job should run (using standard cron syntax or interval-based syntax) - **Payload**: What work to do when the schedule triggers (system event or agent turn) - **Session Target**: Where the work should execute (main session, isolated session, current session, or named session) - **Delivery**: How results should be announced (none, announce to chat, or webhook) - **Optional Features**: Failure alerting, delete-after-run, context inclusion, etc.

## Schedule Types

OpenClaw 2026.05.07 supports three schedule types:

1. **`at`**: One-shot execution at an absolute time
   ```json5
   {
     kind: "at",
     at: "<ISO-8601 timestamp>"  // e.g., "2026-05-12T14:30:00Z"
   }
   ```
   - Timestamps without explicit timezone are treated as UTC

2. **`every`**: Recurring interval execution
   ```json5
   {
     kind: "every",
     everyMs: <interval-in-milliseconds>,
     anchorMs: <optional-start-time-in-ms>  // defaults to Unix epoch if omitted
   }
   ```
   - Useful for regular polling or periodic maintenance tasks

3. **`cron`**: Standard cron expression evaluation
   ```json5
   {
     kind: "cron",
     expr: "<cron-expression>",  // e.g., "0 18 * * *" for 6 PM daily
     tz: "<optional-IANA-timezone>"  // e.g., "Asia/Shanghai"; if omitted, uses gateway host local timezone
     staggerMs: <optional-random-jitter-in-ms>  // prevents thundering herd problems
   }
   ```
   - Expression is evaluated in the supplied timezone's local wall-clock time
   - Important: Do NOT convert requested local time to UTC first - the expression is meant to be read as local time

## Payload Types

When a cron job schedule triggers, it executes one of two payload types:

1. **`systemEvent`**: Injects text as a system event into a session
   ```json5
   {
     kind: "systemEvent",
     text: "<message-to-inject>"
   }
   ```
   - Results in a system event that appears in the target session
   - Used for reminders, notifications, or triggering internal processes
   - Only valid when sessionTarget is "main"

2. **`agentTurn`**: Runs an agent with a message (isolated sessions only)
   ```json5
   {
     kind: "agentTurn",
     message: "<prompt-for-agent>",
     model: "<optional-model-override>",
     thinking: "<optional-thinking-level-override>",
     timeoutSeconds: <optional-seconds>  // 0 means no timeout
   }
   ```
   - Spawns an isolated agent turn to process the prompt
   - Only valid when sessionTarget is "isolated", "current", or "session:<id>"

## Session Targets

Defines where the cron job's payload executes:

- **`main`**: Run in the main session (requires payload.kind="systemEvent")
- **`isolated`**: Run in an ephemeral isolated session (requires payload.kind="agentTurn")
- **`current`**: Bind to the current session where the cron is created (resolved at creation time)
- **`session:<custom-id>`**: Run in a persistent named session (e.g., "session:project-alpha-daily")

## Delivery Options

Controls how job results are communicated:

- **`mode: "none"`**: No announcement
- **`mode: "announce"`**: Send result to chat channel (optional channel/to target)
- **`mode: "webhook"`**: Send finished-run event as HTTP POST to delivery.to (URL required)
- For chat announcements, can specify channel, recipient, and threadId for threaded platforms

## Failure Handling

Cron jobs can be configured with failure alerting:
```json5
{
  failureAlert: {
    after: <number-of-failures-before-alerting>,
    channel: "<delivery-channel>",
    to: "<delivery-target>",
    cooldownMs: <milliseconds-between-alerts>,
    includeSkipped: <boolean-count-skipped-runs-toward-alerting>,
    mode: "announce" | "webhook"
  }
}
```

## Context Inclusion

Jobs can include recent message context:
```json5
{
  contextMessages: <number-between-0-and-10>  // how many previous messages to include as context
}
```

## Version Specifics (2026.05.07)

- Default heartbeat interval: 10 seconds (configurable via `heartbeat.intervalMs`)
- Cron expressions use standard Unix cron syntax (5 fields: minute hour day month weekday)
- When `tz` is omitted in cron schedule, uses the Gateway host's local timezone
- Maximum context messages: 10 (0 means no context)
- Agent turn timeoutSeconds: 0 means no timeout, positive values enforce limit
- Jobs can be configured to `deleteAfterRun: true` for one-time execution
- Failure alerts have cooldown periods to prevent alert spam
