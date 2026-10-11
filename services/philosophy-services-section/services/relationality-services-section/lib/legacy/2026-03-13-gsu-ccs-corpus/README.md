# The Relational Hyperverse

A mathematical construction that inverts the usual priority: instead of starting
with objects and adding relations, start with **relations as primitive data** and
derive objects as stable patterns within them.

The central object is the **Relational Universe** $R$: a Grothendieck topos built
from histories of concurrent relations. At each point in relational history, a
Heyting algebra of propositions carries two closure operators (nuclei) — one that
settles the past ($\sigma$, saturation) and one that projects into the stable
future ($\Delta$, transfer). Propositions fixed by both have *settled*: they are
the invariants of that history.

The key result is **self-generation**: $R = U_G(R)$. Given eight axioms, a closure
operator $U_G$, and a handful of atoms, you generate exactly $R$ and nothing else.
The universe is the least fixed point of its own construction.

The **Relational Hyperverse** $\mathcal{H}$ is what happens when you feed $R$ back
into the same construction: $R \hookrightarrow R^{(1)} \hookrightarrow \cdots$, where
each level applies the fourfold construction to the previous one. $\mathcal{H}$ is
the colimit — the universe where $\mathcal{H} = U_{\mathcal{H}}(\mathcal{H})$.

## This repository

| Directory | What it is | Status |
|-----------|------------|--------|
| `math/` | ~263 unit files — axioms, theorems, definitions, lessons | Active |
| `proof/` | Lean 4 formalization (~166 files, Mathlib) | Active |
| `spec/` | Specification for the knowledge graph and engine | Active |
| `src/` | Python engine: SQLite hot store, LangGraph graphs, MCP server | Active |
| `runbooks/` | YAML workflow definitions executed by the engine | Active |
| `skills/` | Markdown instruction files for LLM-backed steps | Active |

**First arc (math → proof):** `math/` states the construction; `proof/` verifies it
in Lean 4. The ground case $R$ is largely complete. The hyperverse tower is conjectural.

**Second arc (spec → src):** `spec/` defines the knowledge graph schema and engine
architecture; `src/` implements it. The engine runs as an MCP server.

## Engine

The `src/engine/` directory is the Relational Machine: a Python service that loads
all repository content into a SQLite Unit table (hot store), exposes it via a FastMCP
server, and executes YAML runbooks (LangGraph-backed for stateful loops, deterministic
for process-type work).

```sh
# Run engine locally (stdio MCP, for Claude Code)
python3 -m src.engine.mcp_server

# Run engine in Docker (SSE MCP, for Claude Code cloud or remote access)
docker-compose up engine
```

Claude Code connects via `.mcp.json`. The engine exposes tools for querying the
Unit graph (`search`, `get_units`, `get_inbox`, etc.) and executing runbooks
(`run_runbook`).

## Lean build

```sh
cd proof/RelationalHyperverse && lake build
```

Requires [elan](https://github.com/leanprover/elan).

## Layout

```
math/          One .md per mathematical concept (flat directory)
proof/         Lean 4 proofs
spec/          System specification
src/           Python engine (loader, serializer, graphs, MCP server)
runbooks/      YAML runbooks (process and procedure type)
skills/        Markdown skills (LLM instruction files)
PLANS.md       Root-level work queue
AGENTS.md      Agent orientation and policies
```

Each department has its own `SOUL.md`, `AGENTS.md`, `MEMORY.md`, `INBOX.md`,
`PLANS.md`, and `IDEAS.md`.
