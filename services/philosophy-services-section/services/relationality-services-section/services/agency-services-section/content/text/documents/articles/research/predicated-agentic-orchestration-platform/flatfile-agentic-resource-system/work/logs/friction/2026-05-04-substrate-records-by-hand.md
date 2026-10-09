---
name: 2026-05-04-substrate-records-by-hand
description: Drafted swarm and confederation by hand-Writing markdown files
type: friction-log
class: substrate-edit
date: 2026-05-04
status: open
see-also: [2026-05-04-validate-cross-theory-slug-resolution, ../../teaching/explanations/friction-log]
title: 2026-05-04-substrate-records-by-hand
date-created: 2026-05-04
---

# Drafted swarm and confederation by hand-Writing markdown files

Drafting the [`swarm`](../../../architecture/swarm/swarm.md) and [`confederation`](../../../architecture/confederation/confederation.md) concepts (and four [questions](../../questions/)) for FARS, I had to use the host harness's `Write` tool against absolute filesystem paths.
Each write was: (a) author the YAML frontmatter from memory of the convention, (b) author the body, (c) place the file at a hand-constructed absolute path under `theories/.../FARS/concepts/`, (d) hope the slug, frontmatter shape, and link paths were right.

Tried: nothing else, because nothing else was offered.
The fars CLI has 50 verbs registered including `new`, `from-template`, and `where`, but none was used in this session — the verbs were not in the harness's awareness, and even after `fars` was installed in editable mode, my reflex was still to reach for `Write`.

Had to: hand-author six substrate records (`concepts/swarm.md`, `concepts/confederation.md`, four `questions/*.md`) without templating support.
Three of the six had at least one path or slug error that the validator would later flag — errors a templated `fars new concept swarm --in <theory>` would likely have prevented because the template would have known its own location and emitted correct relative paths.

Violates: the substrate's [agential-self-generation](../../../../agent/agential-self-generation/agential-self-generation.md) commitment that every operative element is itself a substrate entity. *Creating* a substrate entity is itself an operative act, and that act should be a substrate-aware operation, not a host-level `Write` against a string-typed path.
The host harness (Write/Edit/Read) is a leak: it operates *below* the substrate, on bytes-and-paths, when it should be operating *through* fars verbs.

Gap: the agent-runtime harnesses currently in `operations/engineering/harnesses/` (`claude-code`, `cline-workflows`, etc.) project agent records out of the substrate but do not project fars *verbs* into agent runtimes' tool surfaces.
A Claude Code agent should see `fars-new`, `fars-show`, `fars-where`, `fars-context` as native tools alongside `Read`/`Write`/`Edit`.
The agent-runtime harness should *replace* host-level filesystem tools with substrate-aware verbs for substrate-targeted work, falling back to filesystem tools only for non-substrate paths.

This friction is large and structural; it is the seed of why the captain wants a swarm-over-the-web architecture.
Closing it is one of the load-bearing items on the path from "captain talks to one big model" to "captain talks to a properly harnessed swarm."
