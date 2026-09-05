---
title: "Mount points"
description: "Closure rules that admit foreign cells under a local prefix. The OS's mount() analogue. Mounts a peer's substrate, a host filesystem, a paracosm, etc."
kind: spec
status: normative
version: "0.2"
---


A "mount point" is a closure rule that admits foreign cells under a local prefix, exposing them as if they were local cells.
Used for:

- Mounting a peer node's substrate (federation).
- Mounting a host filesystem via [drivers/fs-driver.md](../drivers/fs-driver.md).
- Mounting a git repository via [drivers/git-driver.md](../drivers/git-driver.md).
- Mounting a paracosm (Teraum, Hevî Mala) for read access from a research session.

## 1. Mount record

```json
{
  "subject": "mount:<slug>",
  "predicate": "kind",
  "object": "mount-point",
  "value": "True"
}
{
  "subject": "mount:<slug>",
  "predicate": "source-type",
  "object": "peer|fs|git|paracosm|...",
  "value": "True"
}
{
  "subject": "mount:<slug>",
  "predicate": "source-ref",
  "object": "<source-specific-uri>",
  "value": "True"
}
{
  "subject": "mount:<slug>",
  "predicate": "local-prefix",
  "object": "<entity-prefix>",
  "value": "True"
}
{
  "subject": "mount:<slug>",
  "predicate": "scope-restriction",
  "object": "<closure-rule-pattern>",
  "value": "True"
}
{
  "subject": "mount:<slug>",
  "predicate": "attached",
  "object": "True|False",
  "value": "True"
}
```

The `scope-restriction` cell is optional — its absence admits every foreign cell under the source.
The `attached` cell is the substrate marker for the §3 attach/detach lifecycle: attach asserts `True`, detach asserts `False`, the latest cell wins.
Definition cells (kind, source-type, source-ref, local-prefix, scope-restriction) are preserved across detach so re-attach is a single binary-cell write and the OS retains the history of every binding the operator ever made.

In v0.2a the `scope-restriction` pattern is interpreted as an `fnmatch`-style glob over the foreign slug (the part of the path after `local-prefix`).
Richer closure-rule patterns are unlocked when the closure-rule engine for mount projection lands at v0.4.

## 2. Mount semantics

When a mount is active, foreign cells under the source are projected into the local substrate at `local-prefix`.
The projection:

- Is a closure rule that asserts cells when foreign cells are read.
- May be filtered by scope-restriction (only some cells admitted).
- Is bounded by capability discipline (the mount has its own capability fiber).

### 2.1. Precedence for slug collisions

A path that lies under an attached mount's `local-prefix` resolves to a `mount-target` even when a local entity with the same slug already exists in the substrate.
The whole point of declaring a `local-prefix` is to reserve that region of the entity-slug space; mounts therefore *shadow* local entities under their prefix, the same way a Plan-9 bind mount shadows whatever was at the bind point.
Operators avoid collisions by choosing prefixes (`remote/`, `host/`, `paracosm/`) that no local-authored entity uses.

Among multiple mounts whose prefixes cover the same slug, the longest matching prefix wins (Plan-9 layered-bind behaviour).
This makes it safe to layer a restricted child mount under a permissive parent without changing parent behaviour.

## 3. Lifecycle

`mount`/`umount` operations:

```
respond(target=mount:<slug>, payload={action: "attach"}, sender=...)
respond(target=mount:<slug>, payload={action: "detach"}, sender=...)
```

Equivalent to driver attach/detach but for mount points specifically.

## 4. Examples

### Mount a peer

```json
{"subject": "mount:reach-around", "predicate": "source-type", "object": "peer", "value": "True"}
{"subject": "mount:reach-around", "predicate": "source-ref", "object": "peer:reach-around.561.local", "value": "True"}
{"subject": "mount:reach-around", "predicate": "local-prefix", "object": "remote/reach-around/", "value": "True"}
```

Reach-around's cells appear locally as `remote/reach-around/<their-slug>`.

### Mount the host home directory

```json
{"subject": "mount:home", "predicate": "source-type", "object": "fs", "value": "True"}
{"subject": "mount:home", "predicate": "source-ref", "object": "/home/emsenn/", "value": "True"}
{"subject": "mount:home", "predicate": "local-prefix", "object": "host/home/", "value": "True"}
```

## 5. Conformance

Mount points pass:

1. Mounted peer's cells visible under local prefix.
2. Scope-restriction limits which foreign cells are admitted.
3. Detach removes foreign cells from local visibility.

The v0.2a slice (`src/storage/mounts.py`, fixture `tests/conformance/test_mount_points.py`) ships the substrate machinery for all three gates: the registry, the `attach_mount` / `detach_mount` authoring under binary-cell-emission discipline, the `find_mount_for` resolver hook, the `scope-restriction` filter, and the `paths.resolve()` integration that returns `kind="mount-target"` with the local prefix stripped.
The per-source-type fetch backends — peer protocol, fs driver, git driver, paracosm reader — are out of scope for v0.2a and plug into the registry through `MountPoint.source_type` when their owning slices land (federation at v0.4; drivers under their respective `drivers/*-driver.md` specs).
Gate 1's "visible" therefore means "claimed by the resolver"; the bytes-on-the-wire half is the backend's responsibility.

## 6. Plan 9 / Unix analogue

| Unix | Mount-point |
|---|---|
| `mount` / `umount` | `respond mount:<slug> {action: "attach|detach"}` |
| Mount table | Substrate cells with `kind: mount-point` |
| Bind mounts (Plan 9) | Closure rules promoting peer cells to local prefix |
| Union mounts (Plan 9) | Multiple mounts to same prefix |
| FUSE | An app implementing the mount-point interface |
