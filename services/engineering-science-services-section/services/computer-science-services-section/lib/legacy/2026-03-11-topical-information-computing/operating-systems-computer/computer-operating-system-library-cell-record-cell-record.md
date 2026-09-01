---
name: cell-record
description: The flat EAVT row {e, a, v, t} that realizes a cell-record at the computer-operating-system stratum — one row per line in every .jsonl witness log across the OS.
kind-of: cell-record
schema: cell-record.schema.json
witness-log: cell-record.jsonl
having-subject: entity
having-predicate: transformer
having-object: structure
having-transaction-id: timestamp
---

A **cell-record** at this stratum is the flat EAVT row $\{e, a, v, t\}$ that the SPEC specifies as the per-line shape of every `.jsonl` witness log across the OS:

- **`e`** — entity-slug, the subject of $(s, p, o)$.
- **`a`** — transformer-gerund-slug, the predicate; named by a gerund whose realization is an ESM Node module under some [transformer record](../../../../../../../../code/transformers/_index.md).
- **`v`** — the object of $(s, p, o)$.
  Either a structure-slug (common), a literal of any JSON type, or a bilattice pair $\{t, f\}$ when explicitly overriding the default asserted-true valuation.
- **`t`** — ISO-8601 transaction-id.

## Projection to the math layer

The flat row $\{e, a, v, t\}$ projects to the [math-level cell-record](../../../../../../../cell-record/cell-record.md) $\langle \phi, w, t \rangle$ as:

$$\phi = (e, a, v), \quad w = \text{asserted-true unless } v \text{ is a bilattice pair}, \quad t = t.$$

The flatness is a realization choice — compactness on disk, line-oriented streaming, jq-friendliness — not a math-level change.

## Validator

[The cell-record validator script](validating-a-cell-record/scripts/validating-a-cell-record.mjs), nested as a transformer subdir per SPEC, compiles [the cell-record JSON Schema](cell-record.schema.json) with Ajv 2020 plus ajv-formats and exposes `validateCellRecord(record)` for a single record and `validateJsonlFile(path)` for a `.jsonl` file (line-by-line).
As a CLI: `node validating-a-cell-record/scripts/validating-a-cell-record.mjs <path.jsonl>` returns exit 0 on all-pass, exit 1 on any failure with line-level error reporting.

Verified against the [current diary file](../../../../../../../../prose/journals/diary/2026-05-20.jsonl) (passes) and a malformed hand-crafted sample (correctly rejects missing `t`, non-gerund `a`, and additional properties).
