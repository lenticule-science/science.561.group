---
name: running agents
description: Agent-orientation surface for the concrete running of the computer-operating-system kind.
---

The exported `run` function takes `{ instance, child, logPath }` and spawns the child as a supervised subsystem.
561's run script at [doing/working/hacking/doing/working/running/scripts/running.mjs](../../../../../../../doing/working/running/scripts/running.mjs) imports this function and parameterizes it with `instance = '561'` and the MCP server as the child.
