---
name: session
description: "A session is a temporally-ordered set of turns conducted by one character against one inference model in one connected run. Identity is the session-id (a kebab-case name). The session is the structure the logging transformer indexes against — each EAVT row a logging transformer appends names a session as its entity."
specializing: thing
gathering: turn
running-as: character
realized-by: inference-model
---

A **session** is the temporally-ordered set of [turns](../turn/turn.md) one [character](../../doing/governing/characters/) conducts against one inference-model in one connected run.
At the math layer the session is an [object](../object/object.md) whose identity is its name — the session-id, a kebab-case identifier.
The substantive content of a session lives in the EAVT cell-records that name the session as their entity-slug.

## Session is distinct from turn

A turn is one round of inference: one user message, one assistant response, the tool calls between.
A session is the ordered collection of turns that share a character and an inference-model run.
Many turns belong to one session; one session belongs to one character.

The session is the unit the logging transformer indexes against.
Each row a logging transformer appends has the session-id as its `e` (entity-slug); the turn-record sits in the `v` (value) position; the transformer-slug naming what happened to the session sits in `a` (attribute); the transaction-id sits in `t`.
Reading a session's jsonl yields the ordered sequence of turn-records that occurred in that session.

## Realization

A session-instance is realized as a directory at the realizing leaf's `library/<session-id>/` per the recursive template — `_index.md`, `<session-id>.md`, `<session-id>.schema.json`, `<session-id>.jsonl`.
The jsonl is the session's log.
The directory accumulates as turns happen and is sealed by closing the session.

The session-id is minted by the agent that opens the session: the MCP server mints one at process startup; the Claude Code harness mints one per CLI invocation and exposes it in the hook input JSON as `session_id`.
Both shapes are valid session-ids so long as they conform to the [name JSON schema](../name/name.schema.json).
