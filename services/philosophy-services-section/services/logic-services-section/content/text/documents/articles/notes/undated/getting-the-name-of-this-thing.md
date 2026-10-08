---
name: getting the name of this thing
description: The getting-the-name-of-this-thing skill reports the potential MCP server's bound entity name and kind.
specializing: thing
closure-position: process
operation-kind: query
input-schema:
  type: object
  properties: {}
  required: []
composes: []
title: getting the name of this thing
---

The `getting-the-name-of-this-thing` skill record. Operational body in [`SKILL.md`](skill.md).

The skill is the runtime-side analog of Unix `whoami`. It reports the canonical name of the entity the running 561 MCP server is bound to — entity-form-neutral, taking the basename of whichever of `AGENT_NAME` or `CHARACTER_NAME` the server was spawned with. The skill does not consult the substrate (no character file lookup, no agency resolution); it returns what the server already knows about itself.

The pair `(name, kind)` is sufficient to distinguish agent-form sessions from character-form sessions when callers need to branch on that, while the primary `name` field is the entity-form-neutral identifier most uses want.
