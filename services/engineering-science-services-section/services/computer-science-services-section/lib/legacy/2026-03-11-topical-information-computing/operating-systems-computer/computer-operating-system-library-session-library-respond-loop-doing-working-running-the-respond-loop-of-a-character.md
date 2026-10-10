---
name: running-the-respond-loop-of-a-character
description: Runs a character's respond loop — tails the incoming-messages queue, builds work items from new messages, dispatches each through dispatching-work, and writes response cells to disk. Use to start a character running without a Claude Code session attached.
---

## Requirements

- Character exists at `doing/governing/characters/<character>/<character>.md` with a non-empty `skills:` list.
- The dispatch chain skills exist (`dispatching-work` and downstream).
- `code/queues/incoming-messages.jsonl` will be tailed (created on first run if absent).

### Inputs

- `character` — string.
  Character slug (e.g. `computer`, `rom-keldar`).
- `tickMs` — number (optional, default 1000).
  Milliseconds between queue scans.

## Steps

1. Verify the character record exists; load its frontmatter.
2. Ensure `code/queues/incoming-messages.jsonl` and the per-character cursor file `code/queues/incoming-messages.<character>.cursor` exist.
3. Loop until SIGINT: a.
  Read the queue file from the cursor offset to EOF. b.
  For each new line, parse it as a work item. c.
  Call `dispatching-work({ workItem })`. d.
  If the result includes a `text:` and `workItem.target:`, write the text to the target path. e.
  Append a witness line to `code/logs/tool-uses/<date>.jsonl` and an iteration record to `code/logs/iterations/<date>.jsonl`. f.
  Update the cursor. g.
  Sleep `tickMs` and continue.
4. On SIGINT: append a stop-witness, close the cursor file, exit 0.

## Outcomes

- Per iteration with new messages: response cells written to targets; witnesses appended.
- Per iteration without new messages: a noop iteration record (so the loop's heartbeat is itself witnessed).
- On SIGINT: clean shutdown with stop-witness.

## Concurrency

Multiple characters can run their respond loops simultaneously over the same queue.
Each character has its own cursor, so each reads each message exactly once but does not contend with the others.
If a message's `target:` falls outside a character's write region, the character can choose to skip it; v1 processes every message regardless of region.
