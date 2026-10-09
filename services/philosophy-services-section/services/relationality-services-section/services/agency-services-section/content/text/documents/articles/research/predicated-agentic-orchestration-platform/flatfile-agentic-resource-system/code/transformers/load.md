---
source: [root, path-filter]
target: [notes, parse-diagnostics]
name: load
description: "The morphism that walks a flatfile substrate root and produces one Note per .md file."
type: morphism
class: operator
depends-on: [note, flatfile, source-of-truth]
see-also: [interpret, respond]
title: load
---


The morphism that walks a [flatfile](../../flatfile/flatfile.md) substrate root and produces one [`Note`](../objects/note.md) per `.md` file.
`load` is the substrate-read entry point: every higher-level operation that reads substrate content begins with a `load`, either eagerly (a workspace-style cached load on platform startup) or lazily (one path at a time as operators traverse).

## Signature

```
load(root; path_filter) → (notes, parse_diagnostics)
```

Inputs:

- **`root`** — the substrate root directory.
  Walked recursively; every `.md` file under `root` is a candidate.
- **`path_filter`** — a predicate over paths controlling which files are included.
  The discipline excludes draft, build, and vendored content by default; callers that need to see drafts (e.g., triage tools) pass their own filter.

Outputs:

- **`notes`** — every `.md` file that has frontmatter and parsed cleanly.
  Files without frontmatter SHALL be silently skipped (they are markdown content but not substrate entities); files whose frontmatter fails to parse SHALL produce a diagnostic and be omitted from the notes.
- **`parse_diagnostics`** — frontmatter parse errors, file-read errors, and other I/O failures.
  Diagnostics SHALL carry enough context (path, line, error message) for operator-level surfacing.

## Operational semantics

`load` SHALL proceed:

1. **Walk.** Recursive directory walk under `root`.
  Filter each path through `path_filter`; reject filtered-out paths before reading.
2. **Read.** For each surviving `.md` path, peek at the file's leading bytes — files not beginning with the frontmatter sentinel have no frontmatter and SHALL be silently skipped.
  Files beginning with the sentinel are read in full.
3. **Parse.** Split the file content into frontmatter and body.
  Parse the frontmatter as YAML (or whichever mapping format the realization commits to).
  On parse error, emit a parse diagnostic; do not include this file in the output.
4. **Construct.** Build the `Note` per the [`Note`](../objects/note.md) record's required fields.
  `slug` from the canonicalized filename stem; `dir` from the enclosing-directory subdivision; `type` from frontmatter `type:` falling back to a directory-derived default; `fm` from the parsed mapping; `body` from the post-frontmatter content; `path` from the substrate-relative path; `mtime` from the filesystem.

## Normative invariants

- **Read-only.** `load` SHALL NOT mutate the filesystem, any cache, or any in-memory state shared across calls.
  A second call returns equivalent content modulo intervening filesystem edits.
- **Deterministic order.** The returned notes SHALL be ordered deterministically (typically lexicographic by path).
  Callers that need a different ordering re-sort downstream.
- **Filter-respecting.** Files rejected by `path_filter` SHALL NOT be read or parsed.
- **Diagnostic-emitting on parse failure.** A frontmatter parse error or a malformed block SHALL produce a parse diagnostic with the file's path and the underlying error.
  The note is omitted; subsequent operators see the substrate as if the file did not exist (consistent with [source-of-truth](../../../../teaching/explanations/source-of-truth.md): a file the substrate cannot parse is a file the substrate cannot read).

## Caching

`load` SHALL NOT consult or update a cache by default.
Realizations MAY provide an opt-in cache that uses file mtimes to skip re-parse on unchanged files; the cache's authority is derived from the substrate's source-of-truth (the file content), not the other way around.
The default `load` path SHALL re-walk the substrate so freshness is never a surprise.

## What `load` is not

- **Not interpretation.** `load` produces notes; the move from note to [`Fiber`](../structures/fiber.md) is [`interpret`](interpret.md), a separate morphism.
  A caller that needs algebraic content runs both.
- **Not validation.** `load` does not check that frontmatter satisfies declared shapes, that relation targets resolve, or that statuses are consistent.
  Validation runs as a separate pass over the loaded notes, emitting witnesses per [`Witness`](../objects/witness.md).
- **Not graph construction.** `load` produces a flat collection of notes.
  Edges between notes (the typed graph projection) are built by index morphisms on demand, given a collection of notes.

## Position

`load` is the morphism every higher-level FARS operator implicitly or explicitly invokes first.
Workspace-style realizations construct a cached note list on platform startup; lazy realizations call `load` per-path as operators traverse.
Both patterns are admissible; the morphism's signature and invariants are normative regardless of which.
