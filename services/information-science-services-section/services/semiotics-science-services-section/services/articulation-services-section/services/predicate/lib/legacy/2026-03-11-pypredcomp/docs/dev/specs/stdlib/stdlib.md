---
title: "Stdlib"
description: "Coreutils-equivalent verbs: project, filter, fold, materialize, hash, fork, await, settle, witness, audit, retract, assert."
kind: index
---


The standard library — verbs every program calls.
Plan 9 / Unix have `cat`, `ls`, `grep`, `find`, `sort`, `uniq`, etc.; this OS has the equivalent in substrate-native operations.

## Specs (to be written at v0.2)

- `project.md` — filter cells by predicate (`ls`/`grep` analogue).
- `filter.md` — refine fiber by predicate value.
- `fold.md` — aggregate over a fiber (`wc`/`sort -u` analogue).
- `materialize.md` — force a fiber projection (`cat` analogue).
- `hash.md` — canonical SHA-256 (`sha256sum` analogue).
- `fork.md` — clone a session (`fork` syscall analogue).
- `await.md` — wait on a fiber update (`wait`/`select` analogue).
- `settle.md` — run respond to fixed point on a target.
- `witness.md` — audit trail for a cell (`git log` analogue).
- `audit.md` — cross-reference an event chain.
- `retract-and-assert.md` — `retract` (cell denied; `rm` analogue) and `assert` (cell affirmed; `touch`/`echo >` analogue).
- `skill-manifest.md` — JSON-Schema-validated skill manifest contract; `build-skill-manifest` (boot-time aggregator; `mandb`/`makewhatis` analogue) and `lint-skills` (author tooling; `lintian`/`rpmlint` analogue) verbs.

## Theory grounding

Stdlib implements:

- `predicated-computing/morphisms/insertion` — `assert`.
- `predicated-computing/morphisms/retraction` — `retract`.
- `predicated-computing/morphisms/traversal` — `project`/`filter`/`fold`.
- `predicated-computing/morphisms/query` — composed of project/filter.
- `predicated-computing/morphisms/settle` — `settle`.
- `predicated-computing/morphisms/merge` — `fold` with $\odot$-merge.
- `functional-runtime-platform/objects/function-record` — typed callable.
- `functional-runtime-platform/morphisms/evaluate` — execution.
- `functional-runtime-platform/morphisms/invoke-function` — call site.
- `functional-runtime-platform/theorems/function-purity-replay-fidelity` — pure functions are deterministic.
- `database-platform/concepts/query-planning` — `project` and `filter` use planned execution.
- `database-platform/concepts/secondary-index` — speeds up `project` and `filter`.

## Per-verb fixture discipline

Per [decisions/fixture-authoring-paired-task.md](../../decisions/fixture-authoring-paired-task.md), every stdlib verb implementation task `t02-NN` has a paired **fixture-authoring task** `t02-NNf` with its own conformance gate.
The pairing is structural: the verb cannot ship until the fixtures exist and pass against the implementation.

Per-verb fixtures live under `pypredcomp/tests/fixtures/stdlib/<verb>/` with the following minimum coverage:

- **Happy-path fixture.** A canonical input + expected output for the verb's primary semantics.
- **Empty-input fixture.** The verb's behaviour on an empty fiber, empty payload, or zero-cell input.
- **Boundary fixture.** Maximum payload size, maximum fiber depth, fuel-exhaustion behaviour where applicable.
- **Composition fixture.** The verb composed with `project | filter | fold` (per the §"Conformance" gate 2 below) at least once.

Verbs that wrap `respond` (`assert`, `retract`, `settle`) inherit `respond`'s conformance fixtures (per [conformance-vectors.md](../conformance-vectors.md)) and additionally exercise the verb-specific surface contract.

Verbs that are pure read-projections (`project`, `filter`, `fold`, `materialize`, `hash`, `witness`, `audit`) MUST emit at `cost_class = "read"` per [decisions/cost-is-lawvere-quantale.md](../../decisions/cost-is-lawvere-quantale.md); the fixture's expected output asserts the cost cell's value is the quantale unit.

The stdlib **dispatch shell** (`pypredcomp/src/substrate/stdlib.py`) is one module per [decisions/single-respond-primitive.md](../../decisions/single-respond-primitive.md) — every verb reduces to `respond` patterns.
The per-verb fixtures exercise the dispatch surface; the dispatch shell does not get its own fixture directory.

## Conformance

Stdlib passes:

1. Each verb produces deterministic output for byte-identical inputs.
2. `project | filter | fold` composes via closure-rule chain semantics.
3. `fork` correctly inherits the parent session's capability fiber.
4. `await` blocks until the configured fiber predicate matches.
5. `settle` completes within configured fuel for non-pathological inputs.
6. `witness` and `audit` produce results consistent with the event log.

## Plan 9 / Unix analogue

| Unix verb | Stdlib analogue |
|---|---|
| `ls` | `project` |
| `cat` | `materialize` |
| `grep` | `filter` |
| `find` | `project` with deep filter |
| `cp` | `fork` |
| `mv` | `assert new-location` + `retract old-location` |
| `rm` | `retract` |
| `wc` / `sort` / `uniq` | `fold` |
| `sha256sum` | `hash` |
| `sleep` | `await` (on a deadline cell) |
| `git log` / `git blame` | `witness` |
| `awk` / `sed` | The message-language as transformation |
| `make` / `mk` | The closure-rule system |
| `mandb` / `makewhatis` | `build-skill-manifest` |
| `lintian` / `rpmlint` | `lint-skills` |
| `apropos` / `whatis` | `boot/skill-manifest.json` aggregate |

See [texts/unix-substrate-analogue.md](../../texts/unix-substrate-analogue.md) for the full mapping.
