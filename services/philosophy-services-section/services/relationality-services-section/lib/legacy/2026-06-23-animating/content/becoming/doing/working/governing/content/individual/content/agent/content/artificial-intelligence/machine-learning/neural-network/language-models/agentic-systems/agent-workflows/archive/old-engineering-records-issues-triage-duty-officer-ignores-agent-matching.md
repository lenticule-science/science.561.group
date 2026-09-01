---
name: duty-officer-ignores-agent-matching
date-created: 2026-04-05
severity: design-flaw
affects: duty-officer, dispatch-work, mash-engine
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

## Problem

The `/duty-officer` command and manual `mash-engine start` dispatch does not match tasks to agent capabilities. It spawns a generic `claude -p` process with a freeform prompt, ignoring:

1. The `dispatch-work.js` tool which already computes task-to-agent matching scores
2. Agent-specific skills, model recommendations, and tool restrictions
3. The distinction between work types (research, writing, infrastructure, review)

## Symptom

The first officer dispatched a "duty officer" to write library term definitions (specialized research/writing work) using the same generic prompt pattern as creating directories (trivial infrastructure work). The duty officer got no agent role, no relevant skills loaded, no model guidance. This is like assigning a deckhand to do the navigator's job because you only have one job title: "duty officer."

## Root Cause

The `mash-engine start` command spawns `claude -p "{prompt}"` with hardcoded `--allowedTools`. It has no concept of:
- Agent roles or specializations
- Skill loading based on task type
- Model selection based on task complexity
- Tool restrictions based on agent definition

The `/duty-officer` command compounds this by not consulting `dispatch-work.js` before dispatching.

## Desired Behavior

1. `/duty-officer <task-id>` should consult `dispatch-work.js` to get the best-match agent
2. The agent's definition (model, tools, description) should shape the dispatch prompt
3. `mash-engine start` should accept `--agent <name>` and load that agent's configuration
4. Skills relevant to the task should be injected into the prompt context

## Workaround

Use the in-session `Agent` tool with `subagent_type` for specialized work. Reserve `mash-engine start` for tasks where the generic harness is sufficient (infrastructure, audits, simple process work).
