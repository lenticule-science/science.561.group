---
name: 2026-05-04-validate-cross-theory-slug-resolution
description: fars validate reports cross-theory slugs as missing when fars show resolves them
type: friction-log
class: validator
date: 2026-05-04
status: open
see-also: [2026-05-04-substrate-records-by-hand, ../../teaching/explanations/friction-log]
title: 2026-05-04-validate-cross-theory-slug-resolution
date-created: 2026-05-04
---

# fars validate reports cross-theory slugs as missing when fars show resolves them

Drafting [`swarm`](../../../architecture/swarm/swarm.md) involved a body link from FARS to the sister theory `swarm-intelligence`'s `swarm-coordinated-system` concept.
The link, written `[swarm-coordinated-system](../../../../../../artificial-intelligence/theories/swarm-intelligence/concepts/swarm-coordinated-system.md)`, resolved correctly on the filesystem (verified via `ls`), and `fars show swarm-coordinated-system` returned the expected note.
AOP's `agent.md` does the structurally identical move at 4 `../`s and validates clean.

`fars validate` on the FARS directory nonetheless reported:

```
swarm.md:14: references missing slug `swarm-intelligence-index`
swarm.md:14: references missing slug `swarm-coordinated-system`
```

Tried: counting `../`s several times to rule out an off-by-one (6 is correct from `concepts/swarm.md` to `theories/<computing>/`); using slug-only `see-also:` in frontmatter (silenced the frontmatter complaint but body links still failed); checking another note in the same parent theory chain that does the same cross-theory move (AOP `agent.md` at 4 `../`s validates clean — same pattern, fewer hops).

Had to: stop trying to coerce validate to pass and move on, on the captain's redirect: "you're clearly hitting friction with the validator tool. log that! stop and think about it slower and more critically. maybe the code is just broken, it is like, early early alpha after all."

Violates: the substrate's transparency commitment — a tool that disagrees with itself (`fars show` and `fars validate` resolving slugs differently) about whether a reference is valid is silently misleading.
Either the validator's slug resolution should match `show`'s, or the tools should be one tool with one resolver.

Gap: probable validator bug in cross-theory slug resolution at sufficient nesting depth.
Hypothesis worth checking: the validator's path normalizer uses a heuristic (theory-graph traversal? prefix-matching?) that breaks above some `../`-count and silently falls back to "missing" rather than reporting a resolution-failure mode.
A friction-log isn't a bug report, but the fix likely lives in the validator's `_resolve_link_target` or equivalent.

Also flagged in pass: validator output line numbers are *body-relative* (counted from the line after frontmatter close), not *file-absolute*.
The error reports `:14` but the broken body link is on file line 22.
Caused several minutes of confusion until I stopped chasing the wrong line.
Either convention is fine, but the convention should be documented or the line numbers should be file-absolute.
