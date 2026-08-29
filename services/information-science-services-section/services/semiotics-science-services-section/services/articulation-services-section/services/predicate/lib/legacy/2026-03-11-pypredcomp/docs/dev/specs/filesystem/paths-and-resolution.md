---
title: "Paths and resolution"
description: "How paths resolve to cells. Hierarchical aliases, current-scope, relative vs absolute."
kind: spec
status: normative
version: "0.2"
---

# Paths and resolution

The OS doesn't have files in the Unix sense; it has cells.
A "path" is a sequence of aliases that resolve to a cell-id.

## 1. Path syntax

```
/aliases/<name>           — absolute alias path
./<name>                  — relative to current-scope
../<name>                 — relative to parent-scope
<entity-slug>             — direct entity reference
cell:<id>                 — direct content-addressed reference
```

## 2. Current scope

A session has a `current-scope` predicate:

```json
{"subject": "session:<id>", "predicate": "current-scope", "object": "<scope-slug>", "value": "True"}
```

Relative paths resolve against this.
Like Unix's `pwd`.

```sh
> :pwd
scope:engineering/tasks/

> ls
[task:write-spec, ...]
```

## 3. Resolution algorithm

Given a path:

1. If `cell:<id>`: return cell with that id.
2. If `<entity-slug>`: return cells about that entity.
3. If `/aliases/<name>`: look up alias mapping; return cell with that id.
4. If `./<name>` or `<name>` (with current-scope set): prepend current-scope; recurse.
5. If `../<name>`: walk up the scope hierarchy; recurse.

For multi-segment relative paths (`./<seg>/<leaf>`), the joined sub-scope path is looked up in the alias store (`alias-mapping.md` §5).
If an alias of that name resolves to a string ending in `:`, that string names the entity-kind and the path resolves to `<kind>:<leaf>` (the §4 worked example below).
Otherwise the joined scope slug is returned.
ERP modules register their own kind-aliases at bootstrap (e.g. `scope:engineering/tasks → task:`, `scope:accounting/entries → entry:`).

Resolution is deterministic; same path + same substrate state → same target.

## 4. Examples

```
/aliases/captain                  → personnel:emsenn
/aliases/main-ledger              → cell:abc123...
./tasks/write-spec                → task:write-spec (with current-scope = scope:engineering)
../tasks                          → entity-prefix scope:tasks (when current-scope = scope:engineering)
cell:f44702d559037b6b...          → that specific cell record
```

## 5. Conformance

Path resolution passes:

1. Same path + same state → same target across both implementations.
2. Capability scope honored: paths outside session's scope return error.
3. Aliases update; subsequent resolutions reflect.
