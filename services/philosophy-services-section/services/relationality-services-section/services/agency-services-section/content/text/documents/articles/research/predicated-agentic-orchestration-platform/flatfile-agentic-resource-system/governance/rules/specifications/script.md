---
name: script
description: Specification of an ESM Node.js program that lives under a governance/staff/$$$/skills/<skill-slug>/scripts/ directory and executes one step of a skill as a self-contained pure function.
title: script
---

A script is an ESM Node.js program (`.mjs` file) that lives inside a `scripts/` subdirectory of a skill directory.
It is the executable half of the skill: the skill `.md` file says *when* and *why*; the script says *how*.

## File location

Scripts live at:

```
<theory>/governance/staff/$$$/skills/<skill-slug>/scripts/<script-slug>.mjs
```

`$$$` is either directly under `staff/` or under a character's subdirectory:

```
governance/staff/skills/<skill-slug>/scripts/<script-slug>.mjs
governance/staff/characters/<character>/skills/<skill-slug>/scripts/<script-slug>.mjs
```

The skill's `.md` file lives in the parent directory of `scripts/`:

```
governance/staff/skills/<skill-slug>/
  <skill-slug>.md         ← skill doc (what, when, why)
  scripts/
    <script-slug>.mjs     ← script (how)
```

## What a script is

**Self-contained.** A script imports only Node.js built-in modules (`node:fs`, `node:path`, `node:url`, `node:process`).
It has no `package.json`, no `node_modules`, and no dependency on pyfars, pypredcalc, or any other external library.
A script must run with `node <script>.mjs` and nothing else installed.

**Pure-function.** Given the same file-system state and arguments, a script produces the same output.
It does not bind ports, maintain state between runs, or call external network services.
A script reads the substrate and writes to stdout; it does not modify the substrate unless it is explicitly a mutation script (and then it must be named accordingly).

**Short-lived.** A script runs, produces output, and exits.
It is not a daemon, not a server, and not a service.

## How scripts differ from services

Scripts are pure functions in ESM Node.
Services are long-running programs in Python.
The distinction maps directly onto the theory: scripts realize the substrate's synchronous morphisms; services realize the substrate's continuous operational processes.

## Naming

Script slugs use the same present-participle gerund convention as transformers: `auditing-theory.mjs`, `scaffolding-structure.mjs`.
The `.mjs` extension marks ESM modules.

## Shebang and imports

Every script begins with:

```
#!/usr/bin/env node
```

and uses ESM import syntax.
Example:

```javascript
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";
```

## Standard interface

Every script accepts at minimum:

- `--root <path>` — the theory root directory when the script needs to walk the substrate
- `--json` — output a machine-readable JSON report instead of human-readable text
- `-h` / `--help` — print usage and exit 0

Exit code 0 means success or no findings.
Exit code 1 means errors found.
Exit code 2 means bad arguments.

## Scripts are not substrate entities

`.mjs` files are not `.md` files; they are not members of $E$ and do not carry frontmatter.
The script specification (this file) is a substrate entity; the scripts it describes are not.
