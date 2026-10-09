---
name: routing-a-claude-stop
description: Inspects a Claude Code Stop event and either permits the stop or blocks it with an instruction to write today's per-turn diary entry first. Use as the project's Stop hook so each turn closes with a retrospective-and-prospective entry in today's diary file.
title: routing-a-claude-stop
---

## Requirements

- Runs as a Claude Code `Stop` hook (`.claude/settings.json`), receiving the event JSON on stdin: `session_id`, `transcript_path`, `stop_hook_active`.
- The `computer` character's skills list registers `writing-a-diary-entry` as an MCP tool, so the block instruction can name a tool Claude can actually call.
- A readable transcript JSONL at the `transcript_path` field of the input.
- Write access to `prose/journals/diary/` so the writing skill can append to today's file.

## Steps

1. Read and JSON-parse stdin. If `stop_hook_active` is true, exit `0` (the previous block already fired; do not loop).
2. Read the transcript JSONL at `transcript_path` and scan from the end for the last entry where `type === "user"` and `message.content` is a string (i.e., a real user prompt, not a tool-result). Capture its `timestamp`. If no such entry is found, exit `0`.
3. Compute today's date in local time as `YYYY-MM-DD` and read `prose/journals/diary/<date>.jsonl` if it exists. Parse each line as a JSON EAVT row and extract its `t` (ISO timestamp).
4. If the file contains a row whose timestamp is strictly later than the user-prompt timestamp from step 2, exit `0` — the turn's diary entry is already written.
5. Otherwise, write JSON to stdout of the form `{"decision":"block","reason":"<instruction>"}` and exit `0`. The instruction names the `mcp__561__writing-a-diary-entry` tool, the `character: "the 561 Group's computer"` argument, the `retrospective` body ("this turn I did X but looking back I could have done Y"), and the `prospective` body ("when you do X, you should Y").
6. On any I/O or parse error, write the error to stderr and exit `0` rather than blocking — a misbehaving hook MUST NOT trap the session.

## Outcomes

- A Claude Code Stop event ends the turn cleanly iff today's diary file has been appended-to since the user's most recent prompt arrived.
- Otherwise, Claude continues its turn under the block's instruction and writes the missing entry by calling `writing-a-diary-entry`, after which a second Stop fires with `stop_hook_active=true` and is permitted.
- The hook is read-only: it does not write to the diary, the transcript, or any other record. It only routes the Stop.
