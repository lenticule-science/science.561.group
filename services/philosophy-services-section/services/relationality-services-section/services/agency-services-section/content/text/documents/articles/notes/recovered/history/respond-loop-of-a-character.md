---
name: respond-loop-of-a-character
category: kernel
description: The iteration body a character runs to respond to incoming messages and settle the cells in its region — one iteration is one tick of the character's respond cycle.
---

A respond loop is the running process that makes a character a peer in the swarm: without the loop, the character is data; with the loop, the character is a participant.

A respond loop is bounded by a character's read and write regions: it sees cells under its read paths, fires closure rules whose consequents fall in its write paths, and writes nothing outside. Many respond loops, one per character, can run simultaneously over the same git tree; coordination is by reading and writing cells in the shared markdown files, not by inter-loop direct calls.

## Iteration shape

One iteration does, in order:

1. **Tail the incoming queue.** Read newly appended lines from `code/queues/incoming-messages.jsonl` whose `target:` resolves to a path within the character's read region.
2. **For each message, invoke respond.** Resolve the addressed entity record; treat the message payload as a candidate cell; compose with the entity's fiber via the respond primitive (`code/structures/respond-primitive-record.md`); fire the closure rules to quiescence within the character's write region.
3. **Detect aim-frontier.** Cells the closure phase could not settle and whose unsettled state is itself what the LLM is to fill. Detector kinds (v1): open questions with dependencies settled; drafts with dependencies settled; unblocked tasks; closure-cap-hit cells.
4. **Optionally request an LLM consult.** If a frontier cell exists in the character's write region, build a work item `{ skill, prompt, target }` and call `dispatching-logical-inference`. The picker walks `doing/working/inferring/models/` and routes to the first model whose `skills:` list advertises the requested skill.
5. **Append witnesses.** One line to `code/logs/tool-uses/<date>.jsonl` per existing convention; one iteration record to `code/logs/iterations/<date>.jsonl`.
6. **Wait briefly, then iterate.** Exit cleanly on SIGINT, appending a stop-witness.

## Distinguishing predication-shape

- `loops-for(respond-loop, character)` — every loop is bound to exactly one character.
- `tails(respond-loop, queue-path)` — the inbound queue the loop watches.
- `bounded-by(respond-loop, read-region, write-region)` — the regions the loop reads and writes.
- `consults-via(respond-loop, model-record)` — derived from the work item's `skill:` by walking `doing/working/inferring/models/` for a model whose `skills:` list advertises it.

## Step-induction role

A respond loop is the running process that makes a character a peer in the swarm. Without the loop, the character is data; with the loop, the character is a participant. Coordination between characters is parallel composition of their respond loops over the shared cells: a cell written by one is read by another on its next iteration.

## Not the only ingress

The respond loop is one ingress path for messages. Other paths exist: the MCP server registering the character's `skills:` list as tools for a Claude Code session; protocol adapters (planned: Matrix, IMAP, MQTT, ActivityPub, HTTP-webhook) that translate external events into queue entries. The respond loop processes whatever lands in the queue, regardless of which adapter put it there.
