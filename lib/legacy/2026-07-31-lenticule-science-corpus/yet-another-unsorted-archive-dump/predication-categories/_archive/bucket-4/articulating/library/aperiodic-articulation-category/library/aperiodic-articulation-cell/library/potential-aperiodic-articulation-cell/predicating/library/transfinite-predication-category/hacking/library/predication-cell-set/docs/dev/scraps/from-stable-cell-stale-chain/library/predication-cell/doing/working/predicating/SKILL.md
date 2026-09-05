---
name: predicating
description: The morphism that places a predication cell. Takes an oriented triple (subject, predicate, object) and a value drawn from the cell's fiber algebra under some valuation, and produces a cell-record — the pair (cell, value) carrying a transaction-id.
---

## What this transformer is

Predicating is the morphism that places a cell. The act takes the position $\phi = (s, p, o) \in \Phi$ together with a value $w$ drawn from the cell's fiber algebra under some valuation, and produces the cell-record $\langle \phi, w, t \rangle$ — the pair (cell, value) carrying a transaction-id $t$. Cell and value remain sibling fields of the record; they are not merged into a value-bearing cell. When the value $w$ is omitted, the default is the asserted-true element of FOUR — $\langle \text{FOUR}, \mathbf{t} \rangle$ — the convention attached to an unqualified assertion in the implicit register.

## Realization on this platform

1. Read `input.cell` or treat `input` itself as the cell.
2. Validate the cell against the predication-cell JSON Schema using ajv 2020.
3. Default the value to `{bilattice: FOUR, value: "t"}` when none is supplied; default the transaction-id to the current ISO-8601 wall-clock time.
4. Assemble `{cell, value, t, stratum?, derived-from?, derived-via?}` and validate against the cell-record schema.
5. Return the record. The function performs no filesystem write; appending the record to any persisted log is the caller's choice.

## Failure modes

- Schema-violating cell coordinates throw `TypeError`.
- Output shape that fails the cell-record schema throws `TypeError` (this catches malformed callers supplying broken values or provenance).
