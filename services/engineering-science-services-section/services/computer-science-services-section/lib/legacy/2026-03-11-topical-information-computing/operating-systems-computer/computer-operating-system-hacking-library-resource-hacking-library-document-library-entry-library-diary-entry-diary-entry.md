---
name: diary entry
description: A timestamped row deposited into a daily journal file under a character's signature.
---

A diary-entry is one EAVT row situated by (a) the writer (a character — the row's entity `e`), (b) the kind of entry (the row's attribute `a`, naming the writer skill that produced it), (c) the body of writing (the row's value `v`), and (d) the wall-clock moment of writing (the row's time `t`).
Rows aggregate into per-day JSONL files under `prose/journals/diary/`, one row per line, in the shape `{"e":..,"a":..,"v":..,"t":..}
`.

The day-file is the smallest aggregation unit; the row is the smallest authoring unit.
A character may have many diary streams (different directories), but within a stream the per-day file is canonical and rows within it are ordered by their `t` timestamp.

Two rows sharing a `t` (typically produced by the parent `writing-a-diary-entry` skill, which dispatches to the retrospective and prospective child writers in one call) form one per-turn entry-pair.
