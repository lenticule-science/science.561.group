---
name: script
description: A POSIX executable regular-file (S_IFREG with at least one execute bit set) that realizes a $\mathcal{P}$-morphism's body. The byte-level home of skills whose has-body cell points to `scripts/<name>.mjs`.
specializing: regular-file
realizing: morphism-body
realizes-standard: posix-1003-1
---

A **script** is a POSIX regular-file [@ieee10031-2017, §3.166] whose `st_mode` carries `S_IFREG` plus at least one of `S_IXUSR | S_IXGRP | S_IXOTH`.
When `execve(2)` is called on a script, the kernel reads the first two bytes; if they equal `#!
`, the rest of the first line names the interpreter through which the script's content is fed.
ESM Node scripts in the 561 OS use `#!/usr/bin/env node` and the `.mjs` extension per the `"type": "module"` field of [the root package manifest](../../../../../../../../../../package.json).

## Why script is a $\mathcal{P}$-morphism's body, not a morphism itself

Per [transformer.md:5–8](../../../../../transformer/transformer.md), a transformer is a morphism of $\mathcal{P}$; per [skill.md](../../../../agentic-systems/library/skill/skill.md), a skill is a transformer whose body realizes the arrow.
A script is the *byte-level data* of the body — it is the file the OS executes when the morphism fires.
The morphism itself is the categorical arrow $A \to B$; the script is the realizer.
The same morphism could be realized by a different script (a refactor that preserves the precondition/postcondition contract); the morphism's identity does not depend on which script realizes it.

## Distinguishing predication-shape

- `has-path(script, posix-path)` — the file's path in the filesystem.
- `has-interpreter(script, interpreter-slug)` — the program named by the shebang line.
- `has-parameters-shape(script, shape)` — the [parameters](../parameters/parameters.md) shape the script consumes on stdin or argv.
- `has-exit-code-discipline(script, discipline)` — what each exit code means (typically 0 = success; non-zero = error class).
- `realizes-body-of(script, skill)` — back-pointer to the skill whose body this script realizes.

## Not synonymous with

- **Skill** — a skill is the morphism record (precondition + postcondition + body + composes + witness shape).
  A script is one of the bytes the body resolves to.
- **Program** — per [the posix-computer study notes](../../../../../../../../../../doing/working/hacking/doing/working/planning/library/project/library/realigning-the-repository-layout/study-notes/posix-computer.md), "program" is the closure-rule-system projection of the predication settling.
  A script is a regular-file at the byte layer; a program is the rule-system the script realizes when run.
