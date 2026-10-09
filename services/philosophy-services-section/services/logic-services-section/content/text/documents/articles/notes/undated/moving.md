---
name: moving
gerund: moving
agent-noun: mover
description: Moves an entity from one location in the substrate to another, leaving no stale citations behind.
title: moving
---

Relocates a named substrate entity to a new path, then propagates the path change through every record that cited the old location so the new location is consistent with the rest of the cell-graph. The mechanical part is a POSIX rename; the load-bearing part is the cascade of σ-firings that re-cite the moved entity at its new path everywhere it is named.

## Domain and codomain

- **Domain:** a `(source-path, destination-path)` pair where `source-path` resolves to an existing entity (file or directory) and `destination-path` resolves to a non-existing target whose parent exists.
- **Codomain:** the same entity content at `destination-path`, with every record in the substrate that cited `source-path` (by exact-string match or by markdown-link path) now citing `destination-path`.

## Preservation conditions

- **Identity.** Bytes at `destination-path` after the move are the bytes that were at `source-path` before the move. For directories, the recursive byte set is preserved.
- **Citation closure.** No record in the moved scope cites `source-path` after the move. Records outside the moved scope that cited `source-path` cite `destination-path` instead.
- **History.** When the substrate is a git working tree, the move is recorded as a rename so `git log --follow` traces through it.

## Morphological forms in naming grammar

- `gerund: moving` heads skills built on this transformer: `moving-a-<noun>`, etc.
- `agent-noun: mover` heads agents that invoke such skills: `mover-of-a-<noun>`, etc.
