---
title: "Hooks become predicates on offices — constraints compose via the algebra, not JS interception"
specialization: plan
date-created: 2026-04-06
project: system-architecture-refactor
---

## What exists now

The agentic harness has ~15 hooks that intercept tool calls and block or modify them.
These hooks hardcode governance knowledge in JavaScript:

- `enforce-commands.js` — blocks Write for record types, forces create-record.js
- `specialty-check.js` — checks if work matches the office's specialty
- `safety-guard.js` — blocks dangerous bash commands (rm, find, cat, etc.)
- `drift-detector.js` — flags when the first officer does non-coordination work
- `config-protection.js` — prevents editing .claude/ directly
- `mcp-privilege.js` — restricts which MCP tools are available
- `detect-secrets.js` — blocks writing files with secrets

Each hook has its own constants, its own pattern matching, its own logic.
The knowledge about what's allowed is scattered across 15 JS files.

## What should exist

The constraints ARE predicates on the office entity.
When an action happens, it composes with the office's fiber.
The algebra decides:

- **t (agreement)** — the action is consistent with the office's constraints.
  Allowed.
- **⊤ (contradiction)** — the action contradicts the office's constraints.
  Blocked.
- **⊥ (unknown)** — the office has no opinion about this action.
  Default policy decides.
- **f (told false)** — the office explicitly cannot do this.
  Blocked.

Example: the first officer has `specialty: coordination`.
An action with `work-type: implementation` composes with the office.
If the office's fiber says `work-type: [procedure, derivation, inquiry]` and implementation isn't in that list, the composition on the work-type predicate produces ⊥ (no information — the office doesn't handle that).
The drift detector IS this ⊥ check.

Example: safety-guard blocks `rm -rf`.
The office has `forbidden-commands: [rm -rf, git reset --hard, ...]
`.
An action with `bash-command: rm -rf /` composes with the office.
The forbidden-commands predicate produces f (told false).
Blocked.

## The thin hook

Instead of 15 hooks with their own logic, there's ONE hook: compose the action with the office's fiber via message().
Read the result.
Block on ⊤ or f.
Allow on t.
Apply default policy on ⊥.

The hook itself is ~20 lines.
All the governance knowledge lives on the office entities.
Different offices have different constraints — a security-reviewer can do things the writer can't, not because the hooks check `if (office === "security-reviewer")` but because their fibers differ.

## What this enables

- **Office-specific permissions without code changes** — add a predicate to an office, the constraint takes effect
- **Composable governance** — an office that extends another inherits its constraints via the algebra
- **Auditable policy** — `message(office)` shows all constraints, not hidden in JS files
- **The game connection** — lusory constraints (from the Sunday Funday plan) are predicates the office voluntarily accepts.
  Cheating = using a constrained predicate, detectable as ⊤

## Dependencies

- message() working (done)
- Office entities with constraint predicates (needs the entity-separation task — term vs office vs incumbent)
- A thin PreToolUse hook that calls message() and reads the result
