---
title: "Agent ignores PreToolUse hook errors rather than adapting behavior"
date-created: 2026-04-05
severity: design-flaw
affects: [session-discipline, hook-system]
reported-by: first-officer
triggered-by: session 01221bb8-d220-438c-a466-dd2c4861262e
aliases:
  - agent-ignores-pretooluse-hook-errors
description: When PreToolUse hooks block a tool call with a guidance message ("Use the Read tool with offset/limit instead of head", "Use the Grep tool instead of grep", "Use the Edit tool instead of sed", etc.), the agent retries with the suggested…
---

## Problem

When PreToolUse hooks block a tool call with a guidance message ("Use the Read tool with offset/limit instead of head", "Use the Grep tool instead of grep", "Use the Edit tool instead of sed", etc.), the agent retries with the suggested replacement but does not internalize the pattern.
The same class of error recurs throughout the session.

## Symptom

In session 01221bb8: - `safety-guard` blocked `head`, `tail`, `grep`, `sed` multiple times across the session - Each block produced a specific guidance message - Agent replaced the specific command that failed but continued attempting variations of the same pattern - No change in default behavior across turns

The hook system is designed as a constraint surface.
The agent treats each hook error as a one-off retry condition, not as a rule to learn and obey.

## Root Cause

Hook errors are not surfaced in the session-start context, so they appear novel each time.
The agent has no persistence of "lessons learned" from hooks during a session beyond the immediate retry.
There is no feedback loop that writes hook-error patterns to a session-local memory or character sheet.

## Desired Behavior

1. Hook blocks should be logged to a session-local "guardrails" record that is re-surfaced at each turn start.
2. Repeated blocks (same hook firing >3 times in a session) should emit an observation that escalates to the next turn's session-start context: "You have been blocked by X hook 5 times this session.
  Here are the rules: ..."
3. Character sheets should accumulate hook-lesson XP so officers become more disciplined over sessions.

## Workaround

Captain observes the pattern and calls it out manually.

## Related

- `operations/engineering/fars/agentic/hooks/safety-guard.js`
- `operations/engineering/fars/agentic/hooks/run-with-flags.js`
- continuous-learning skill — instincts should capture these patterns
