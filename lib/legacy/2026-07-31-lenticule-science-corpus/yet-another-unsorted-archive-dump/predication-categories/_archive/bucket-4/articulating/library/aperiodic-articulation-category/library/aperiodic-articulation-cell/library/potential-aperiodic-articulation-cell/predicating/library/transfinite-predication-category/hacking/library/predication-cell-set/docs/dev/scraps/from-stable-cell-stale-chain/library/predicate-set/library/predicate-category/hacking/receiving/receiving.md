---
name: receiving
gerund: receiving
agent-noun: receiver
imperative: receive
description: Reading a message that crossed a boundary into the OS — from a remote endpoint over the wire, from a script's output, from an inbound queue.
---

A receive transformer. The transformer takes a source and reads a message from it, parsing the bytes into a structured form the cell store can consume. The output is the parsed message plus a witness record naming where it came from.

## Domain and codomain

- **Domain:** a receive-spec — a tuple `(source, parser, timeout)` where the source names the boundary to read from (an HTTP response, a script's stdout, a socket, a queue file tail), the parser maps the raw bytes to a cell-shaped record, and the timeout bounds how long to wait.
- **Codomain:** the parsed message record plus a receive-witness naming the source, the bytes received, and the timestamp.

## Morphological forms in naming grammar

- `gerund: receiving` heads skills built on this transformer: `receiving-a-message-from-a-logical-inference-model-on-the-web`, `receiving-a-message-from-a-script`, etc.
- `agent-noun: receiver` heads agents that invoke such skills.
- `imperative: receive` heads scripts that body such skills: `receive-a-message-from-a-logical-inference-model-on-the-web.mjs`, `receive-a-message-from-a-script.mjs`, etc.

## Distinct from adjacent transformers

- `sending` pushes bytes across a boundary; receiving reads them. The two are duals.
- `reading` reads from the cell store (markdown frontmatter, JSONL logs); receiving reads from across a process boundary (network, child process, socket).
- `dispatching` finds the source/receiver; receiving reads from it once the source is fixed.

## Step-induction role

Receiving completes the wire-level pair at the bottom of a dispatch chain. After sending, the OS waits for the dual receive. The parsed message becomes one or more cells in the store; the witness records that the OS heard back from the outside world.
