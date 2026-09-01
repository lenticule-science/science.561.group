---
id: repository
description: "The relational-repository: the markdown + YAML + Python machine. Authoring layer for math units, specs, skills, and runbooks. Runs the MCP server that exposes repository content to agents."
---

# Repository

The **relational-repository** is one of the two machines in this project.

## What it is

A git repository whose content is authored as markdown files and YAML runbooks,
driven by a Python MCP server. It is the authoring and workflow layer — the place
where math is written, specs are defined, skills are described, and runbooks are
stored.

## Stack

- **Content:** Markdown files with YAML frontmatter
- **Workflows:** YAML runbooks executed by the runbook executor
- **Driver:** Python (FastMCP, SQLite as a read cache)
- **Interface:** MCP server exposing query and execution tools to agents

## What it contains

- `math/` — mathematical unit files
- `proof/` — Lean 4 formalization files
- `spec/` — specification files
- `skills/` — agent skill files
- `runbooks/` — YAML workflow definitions
- `src/repo/` — the Python driver (loader, serializer, runbook executor, MCP server)

## What it is NOT

The relational-repository does not run the full four-component relational machine
architecture. It does not implement the Normalization Kernel, Observation Layer,
or the live SQLite hot store. Those belong to the
[relational-service-system](service.md).

## MUST

- Every piece of content is a file — 1 file = 1 unit
- All files are git-versioned
- The MCP server is the only interface agents use to interact with the repository
- Runbooks are the only way to execute workflows; no bespoke scripts
