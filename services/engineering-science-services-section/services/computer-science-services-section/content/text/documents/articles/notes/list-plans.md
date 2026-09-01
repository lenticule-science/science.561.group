---
description: List all ASR plans with their status and priority
id: list-plans
name: list-plans
version: [0, 1]
type: meta
runtime: mcp
triggers:
  - "list plans"
  - "show plans"
  - "what plans"
inputs:
  status: string?
  priority: string?
outputs:
  count: number
  plans: object[]
region:
  reads: ["content/technology/specifications/agential-semioverse-repository/plans/"]
  writes: []
dependencies: []
scopes: []
part-of: technology/specifications/agential-semioverse-repository
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
