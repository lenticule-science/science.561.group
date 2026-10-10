# AGENTS.md

This repository builds a mathematical paper on the Relational Hyperverse
$\mathcal{H} = U_{\mathcal{H}}(\mathcal{H})$ and its Lean 4 formalization.

The **Relational Universe** $R$ is a Grothendieck topos of sheaves over a
history category, where each fiber carries two commuting nuclei ($\sigma$, $\Delta$)
whose joint fixed point is the invariant sub-algebra. The key theorem is
self-generation: $R = U_G(R)$. The **Relational Hyperverse** is the colimit of
the tower that feeds $R$ back into the same construction at each level.

---

## Departments

This repository has four departments. Before doing any work, identify which department
you are in. If it is not clear from the user's request, ask.

**Dependency order: math → proof → spec → src.**
Nothing downstream overrides anything upstream.

To discover what each department currently contains and what skills it provides,
read its `AGENTS.md` directly.

### The repository is one turn of $U_\mathcal{H}$

The four departments are the four phases of one application of the Universe Closure:

| Department | Phase | What happens |
|------------|-------|-------------|
| `math/` | Algebra | Fiber data $(T, H_t, \sigma_t, \Delta_t)$ established — the input to this turn |
| `proof/` | Language | Claims settled into verified canonical form — language closure applied |
| `spec/` | Geometry | Local fiber data assembled into global relational structure — topology closure applied |
| `src/` | Dynamics | The closure operator enacted — both closures applied, producing $R = U_G(R)$ |

The output of `src/` becomes the input algebra for the next turn. The tower
$R^{(0)} \hookrightarrow R^{(1)} \hookrightarrow \cdots$ converges to
$\mathcal{H} = U_\mathcal{H}(\mathcal{H})$.

---

## Read/write permissions

An agent operates in exactly one department at a time.

**By default, an agent may only read and write within its own department directory.**

The following are always readable by any agent, regardless of department:
- `skills/` — root-level shared skills
- `AGENTS.md` and other root `.md` files
- Any department's `AGENTS.md`

**Cross-department reads and writes are only permitted when a skill explicitly
instructs them.** An agent may not cross department boundaries on its own
initiative — only on a skill's instruction.

---

## Working interface

All work happens through the MCP server. Use `search`, `get_units`, `get_inbox`,
`get_plans`, and related query tools to understand state. Use `run_runbook` to
execute work — including CRUD operations (see `runbooks/`). Do not read, grep, or
edit files directly; use the MCP interface.

Multi-department prompts are handled automatically by the UserPromptSubmit hook,
which classifies the prompt and routes units to the appropriate department queues
before the agent receives it.

---

## Context files

Each department (math/, proof/, spec/, src/) and the root level has six coordination
files read in this order on every agent entry:

| File | Purpose |
|------|---------|
| `SOUL.md` | Why this department exists; core principles; what must never be compromised |
| `AGENTS.md` | Orientation; scope; permissions; entry-point skills |
| `MEMORY.md` | Accumulated cross-session knowledge; patterns; things learned |
| `INBOX.md` | Incoming messages from other department agents; triaged before planning |
| `PLANS.md` | Ordered work queue; only committed items; never raw messages |
| `IDEAS.md` | Raw unplanned material; mined into PLANS each pass |

**Read them in this order.** Each one presupposes the context built by the ones before it.

---

## Agent loop

This repository is a **self-improving agent workspace**. Every department runs
the same loop — see [agent-loop](spec/agent-loop.md) for the full spec.

The root agent's job is cross-department synthesis. After reading context files
and triaging INBOX, the root agent runs `skills/interpret-repo-state.md` as its
standing inquiry: reading the state of all departments, asking what each
department's progress implies for the others, and routing the implications as
Messages. This is not planning or execution — it is interpretation.

**Priority order for root work:**
1. Triage root INBOX — any department may have sent coordination requests.
2. Run `skills/interpret-repo-state.md` — synthesize cross-department state
   and route implications.
3. If interpret-repo-state found nothing new — run `spec/skills/texture-specs.md`
   to advance the C4 diagram. The diagram is the aspirational leading edge:
   making its vague nodes more determined is always productive work.

---

## Root-level shared skills

To discover what shared skills are available, read the `description:` frontmatter
of each file in `skills/`.

---

## Build

```sh
cd proof/RelationalHyperverse && lake build   # Lean typecheck
docker-compose up engine                      # MCP server (SSE, port 8765)
python3 -m src.engine.mcp_server              # MCP server (stdio, local)
```

---

## Terminology

| Use | Not |
|-----|-----|
| Relational Universe ($R$) | GSU, Generative Sheaf Universe |
| Relational Hyperverse ($\mathcal{H}$) | meta-R, higher GSU |
| [closure-and-self-generation](math/closure-and-self-generation.md) | physics |
| Universe Closure ($U_G$) | universe generator |
| Axiom of Generative Basis | Axiom of Finite Generation |
| history (the category $T$) | trace (deprecated for the category) |
