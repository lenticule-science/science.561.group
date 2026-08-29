---
name: diary-entry
description: A timestamped EAVT row deposited into a daily journal file under a character's signature. The atomic unit of a character's diary stream.
specializing: character
realizes: eavt-row
aggregated-into: per-day-jsonl
---

A **diary-entry** is one EAVT row situated by:

- (a) **the writer** — a character — the row's entity `e`,
- (b) **the kind of entry** — the row's attribute `a`, naming the writer skill that produced it (typically writing-a-diary-entry, writing-a-diary-entry-that-is-prospective, or writing-a-diary-entry-that-is-retrospective),
- (c) **the body of writing** — the row's value `v`,
- (d) **the wall-clock moment of writing** — the row's time `t`.

Rows aggregate into per-day JSONL files at `prose/journals/diary/YYYY-MM-DD.jsonl`, one row per line, in the EAVT shape `{"e":..,"a":..,"v":..,"t":..}`.

## Aggregation unit

The day-file is the smallest aggregation unit; the row is the smallest authoring unit. A character may have many diary streams (different directories under prose/journals/diary/), but within a stream the per-day file is canonical and rows within it are ordered by their `t` timestamp.

Two rows sharing a `t` (typically produced by the writing-a-diary-entry parent skill, which dispatches to the retrospective and prospective child writers in one call) form one per-turn entry-pair — the per-turn retrospective/prospective dual the [keep-retrospective-and-prospective-logs feedback memory](../../../../../../../../../../../../prose/journals/memory/feedback/keep-retrospective-and-prospective-logs.md) names as the loadbearing diary discipline.

## Distinguishing predication-shape

- `written-by(diary-entry, character)` — the entity in the row.
- `kind-of-entry(diary-entry, writer-skill)` — the attribute.
- `body(diary-entry, prose)` — the value.
- `at-time(diary-entry, time)` — the time field.
- `aggregated-in(diary-entry, day-file-path)` — the per-day jsonl the row was appended to.
- `paired-with(diary-entry, sibling-entry?)` — the matching retrospective/prospective sibling when the per-turn dual fires.
