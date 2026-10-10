---
name: running-the-respond-loop-of-a-character
description: The runnable that makes a character a peer in the swarm — tails the inbound queue and routes each message through dispatching-work. Use to start a character without Claude Code.
specializing: respond-loop
composes:
  - dispatching-work
---

The OS's user-facing entry to "run a character."
Composes the dispatch chain into a long-lived loop.
Other ingress paths (the MCP server, future protocol adapters) write to the same queue this loop tails.
