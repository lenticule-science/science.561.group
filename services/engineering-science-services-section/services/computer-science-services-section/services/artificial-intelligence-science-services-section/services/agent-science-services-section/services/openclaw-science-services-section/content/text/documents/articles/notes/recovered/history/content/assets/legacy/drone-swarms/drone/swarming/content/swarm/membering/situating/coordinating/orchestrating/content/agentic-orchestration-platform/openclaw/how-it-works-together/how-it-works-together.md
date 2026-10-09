---
type: narrative
class: explanation
description: How the core OpenClaw concepts work together in practice.
status: draft
depends-on: [gateway, skill, agent-turn, heartbeat, cron-job, session]
---

# How It Works Together

This narrative walks through a typical OpenClaw interaction, showing how the gateway, skills, agent turns, heartbeats, cron jobs, and sessions cooperate to produce intelligent agent behavior.

## Scenario: Morning Briefing Routine

Imagine you want OpenClaw to give you a personalized briefing every weekday morning at 8:00 AM, summarizing your calendar, weather, and top priorities.

### 1. The Cron Job Is Defined (Night Before)

You create a cron job that will trigger each morning:

```yaml
name: "weekday-morning-briefing"
schedule:
  kind: "cron"
  expr: "0 8 * * 1-5"  // 8:00 AM, Monday-Friday
  tz: "America/Los_Angeles"
payload:
  kind: "agentTurn"
  message: |
    Give me a briefing for today:
    1. What's on my calendar?
    2. What's the weather like?
    3. What are my top 3 priorities based on my task list?
  timeoutSeconds: 45
sessionTarget: "main"  // Will appear in our main chat
delivery:
  mode: "announce"
contextMessages: 10  // Include recent conversation for context
enabled: true
```

This cron job definition lives in your configuration (perhaps via `openclaw message send` or a skill that manages cron jobs).

### 2. The Heartbeat Checks (Next Morning, 8:00:03 AM)

At approximately 8:00:03 AM, the gateway's heartbeat process wakes up (it runs every 10 seconds by default).
It scans all loaded cron jobs and evaluates their schedules against the current time.

For our cron job: - The cron expression `0 8 * * 1-5` is evaluated in the `America/Los_Angeles` timezone - At 8:00:03 AM on a Tuesday, this evaluates to `true` - The heartbeat recognizes the schedule is due

### 3. The Gateway Prepares the Agent Turn

Because the payload is `agentTurn` and `sessionTarget` is `main`, the gateway knows it needs to: - Use the main session (our ongoing conversation) - Spawn an agent turn with the specified message - Apply any configured timeouts (45 seconds) - Include the last 10 messages as context for the agent

Before invoking the agent model, the gateway: 1.
Loads eligible skills based on your agent's allowlist and skill gates 2.
For each skill (e.g., `calendar`, `weather`, `tasks`): - Checks if it passes load-time gates (required bins, env vars, etc.) - Injects any configured environment variables or API keys - Prepares the skill's description for inclusion in the system prompt 3.
Builds a system prompt that includes: - Your SOUL.md (identity and vibe) - Your IDENTITY.md (name, creature, etc.) - Your USER.md (context about what you care about) - Descriptions of all eligible skills (in XML format) - Instructions for tool usage

### 4. The Agent Turn Executes

The agent model receives: - System prompt (identity + skill descriptions) - Context (last 10 messages from our conversation) - The briefing request prompt

The model might then: 1.
Decide it needs to check your calendar → invokes the `calendar` skill's tool 2.
Gateway executes the calendar tool (might read a file or call an API) 3.
Tool result returned to model 4.
Model decides it needs weather → invokes `weather` skill 5.
Gateway executes weather tool 6.
Tool result returned 7.
Model checks task list → invokes `tasks` skill 8.
Finally, model synthesizes the information into a coherent briefing

Each tool execution: - Is validated against the skill's allowed tools - Runs with the skill's injected environment (e.g., API keys) - Returns structured data or text back to the model - Counts toward token usage and may be logged for diagnostics

### 5. The Briefing Is Delivered

Once the model has gathered the information and formulated a response: - It generates the briefing text - The gateway streams this back as `agent` events (you see it typing in real time) - When complete, it sends a final `status: "ok"` response - Because `delivery.mode` is `"announce"`, the gateway also announces the result to the chat channel - You see the briefing appear as a message from the agent

### 6. Cleanup and Next Steps

- The agent turn completes; any temporary state is cleaned up
- The main session persists, now containing:
  - Your original request (if any)
  - The briefing message from the agent
  - The tool invocations and results (if tool messages are included in history)
- The cron job remains enabled and will trigger again tomorrow at 8:00 AM
- If you had set `"deleteAfterRun": true`, the job would have been removed after this execution

## Extension: What If We Wanted Background Processing?

Suppose you didn't want the briefing to clutter your main chat, but instead wanted it processed quietly and only notified if something important was found.

We could change the cron job:
```yaml
sessionTarget: "isolated"  // Instead of "main"
delivery:
  mode: "none"  // Don't announce by default
```
And modify the prompt to:
```yaml
message: |
  Check my calendar, weather, and tasks.
  If there's a meeting before 9 AM or if it's going to rain,
  send me a brief alert. Otherwise, do nothing.
```

Now: - The heartbeat still triggers at 8:00 AM - But instead of using the main session, it creates an isolated session - The agent turn runs in the background, checks the same information - If conditions are met, it could use a tool like `message send` to alert you - Otherwise, it completes silently and the isolated session is destroyed - No clutter in your main chat unless something important happened

## The Big Picture

This example shows how OpenClaw's core concepts work together: - **Cron jobs** provide time-based automation - **Heartbeats** make the scheduling real by polling for due work - **Agent turns** are the unit of work where the agent reasons and acts - **Skills** teach the agent how to use specific tools - **Sessions** provide context and isolation for different types of work - **The gateway** orchestrates everything, managing lifecycle, environment, and delivery

Each concept is relatively simple on its own, but their combination enables sophisticated, automated agent behavior that can adapt to your needs and environment.
