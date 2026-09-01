---
name: list-plans
description: List all ASR plans with their status and priority
---

List all ASR plans, optionally filtered by status or priority.

## MCP tool

`mcp__asr__list_plans`

## Filter values

- **status**: `draft`, `proposed`, `active`, `completed`, `blocked`, `paused`
- **priority**: `high`, `medium`, `low`

## Relationship to review-plans

This skill returns a machine-readable list. The `review-plans` skill
(runtime: inference) reads plans in full and produces a narrative
summary. Use this skill for quick lookups; use review-plans for
session-start orientation.
