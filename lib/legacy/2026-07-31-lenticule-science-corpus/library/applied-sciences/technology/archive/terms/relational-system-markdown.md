---
id: relational-system-markdown
description: "The markdown encoding of the Flatfile Agential Resource System: how entities, relations, and scripts are encoded as markdown files, YAML frontmatter, and Python scripts."
defines: RelationalSystemMarkdown
component-of: FlatfileAgentialResourceSystemBlueprint
related: Flatfile
---

# Relational System Markdown

## What it is

This is the encoding specification for the [FlatfileAgentialResourceSystem](flatfile-agential-resource-system.md): how entities, relations, shapes, runbooks, and scripts are realized as markdown files, YAML frontmatter, and Python scripts.

FARS uses exactly three file types. Each corresponds to one irreducible mathematical object in $R = \mathbf{Sh}(T, J)$:

| File type | Math object | What it carries |
|---|---|---|
| Markdown (`.md`) | $H^*_t$ — settled fiber element | Propositional content: claims, definitions, relations |
| YAML (`.yaml`) | $u \in T$ — morphism in the site | Compositional structure: a composite extension in Foata normal form |
| Python (`.py`) | $\gamma_t$ — stepping map | Computation: one function from one fiber state to the next |

The general markdown format is in [markdown](markdown.md).
The frontmatter-to-RDF encoding is in [markdown-frontmatter](markdown-frontmatter.md).
This spec covers what is specific to the Relations System context: the Fregean relation pattern, the vocabulary constraint, the Python annotation pattern, and the colocated script convention.

## Entity structure

Every entity is a single `.md` file with YAML frontmatter.
The frontmatter block begins the file; the markdown body follows.
Every entity file MUST have:

- `id` — unique kebab-case identifier; the node IRI in the RDF graph
- `description` — one-line summary; human-readable label

All other frontmatter fields are relations.
An entity does not carry a `type:` field — what an entity is follows from which relations it has.

## Fregean relation pattern

**Frontmatter keys ARE relations, not labels for relations.**

`defines: RelationalSystemMarkdown` does not mean "this file has a field called `defines` whose value is `RelationalSystemMarkdown`." It means: **this file stands in the `defines` relation to `RelationalSystemMarkdown`.** The key name carries the semantic content. The subject is always implicit — it is the file itself.

The wrong pattern:
```yaml
type: skill
closure-type: process
```

The right pattern:
```yaml
closure-kind: process
```

In the wrong pattern, `kind` and `closure-type` are structural slots and the values carry the meaning.
In the right pattern, `closure-kind` IS the relation — its presence in the frontmatter is what makes this file a Skill.
`process` is the object of that relation.

A file IS a Skill by having `closure-kind`.
A file IS a Spec by having `defines`.
No `type:` declaration is needed or wanted.
In SHACL terms: shapes use `sh:targetSubjectsOf <relation>` — they target nodes that carry a relation, not nodes of a named class.

## Any entity can be any role

In a frontmatter triple, any entity can occupy any of the four RDF roles:

- **Subject** — the entity being described (every entity with `id` and `description`)
- **Predicate** — the entity as named relation (a skill, a spec field)
- **Object** — the entity as valid target (referenced by another entity's predicate)
- **Result** — the entity produced by composing subject + predicate + object

A skill is an entity that functions in the relation role (it names an operation).
A spec is an entity that functions in the subject role (it is described by its relations).
A SHACL shape constrains what can appear in the object role.
A runbook produces a result.

The self-referential property — R = U_G(R) — holds here: an entity that defines a relation is itself a subject (it has `id` and `description`), can be an object (other entities can reference it), and produces results when composed with other entities.

## Vocabulary layer

**Every relation key must itself be a specced entity.**
For an entity to validly function in the relation role, it must itself be a node in the graph — it must have `id` and `description`, and ideally have grown through enough U_G phases to be well-defined.

A relation used in frontmatter but not itself specced as an entity is **vocabulary debt**: the graph has an edge whose label is not itself a node.
The system loses self-describing capacity exactly where that edge appears.

The set of relations in use at any point is not enumerated here — it is discovered by reading the graph.
Any frontmatter key appearing in any entity file that does not itself have a corresponding node is vocabulary debt.
When a new frontmatter field is introduced anywhere in the system, a corresponding entity MUST be added before that field is used.

## Body links as graph edges

Inline links in the body (`[text](path.md)`) are also graph edges — less structured than frontmatter relations, but still edges. The full graph includes both frontmatter relations and body links. A body link that has no corresponding frontmatter relation is a candidate for nucleus evaluation: it may normalize to `uses:`, `grounding:`, or another specific predicate once its role is determined.

## Input pathway

Not everything starts settled. Content enters the system unsettled and moves toward $H^*$ through the nuclear settlement pipeline:

**Fleeting note**: a markdown file with `id:` and prose. No frontmatter relations beyond identity. Depth 1. Valid by condition 1.

**Working note**: frontmatter relations added. `related:` entries connecting it to existing nodes. `given:` entries naming what's unresolved. In the graph but unsettled — defect > 0.

**Settled note**: all `related:` entries normalized to specific predicates. All `given:` entries resolved and deleted. Defect is zero. The file is unconditionally in $H^*$.

This pipeline IS the nucleus acting on raw input: σ normalizes backward dependencies, Δ normalizes forward consequences. When both have acted and the result is a fixed point, the note is settled. The mathematical structure guarantees that cleaning up links converges.

## Python stepping map

A Python file is one stepping map $\gamma_t : X(t) \to X(s \star t)$ for one step $s \in \Sigma$.
It contains one function. The function's typed signature is the single source of truth for that step's input and output types.

A Python file carries no composition metadata — no `id`, no `description`, no `closure_kind`.
Those fields describe morphisms in $T$ (compositions of steps), not atomic steps.
A stepping map doesn't know what composition it's part of, the same way a generator $s$ doesn't know what history $t$ it will extend.

**Counit law.** The function must satisfy the counit constraint: inputs must be recoverable from the output. The function adds content from step $s$ without destroying content from history $t$. If the function fails, no state is changed — the stepping map either completes or does not fire.

### Typed function parameters with `Annotated`

Function parameters are typed using `typing.Annotated[T, Field(description="...")]` — the single source of truth for this step's interface:

```python
from typing import Annotated
from pydantic import Field

def add_work_item(
    locale: Annotated[str, Field(description="Path to the locale directory")],
    identifier: Annotated[str, Field(description="Kebab-case work item identifier")],
    action: Annotated[str, Field(description="What needs to be done")],
    why: Annotated[str, Field(description="Why this work is needed")],
) -> None:
    ...
```

The full interface is extractable at runtime via:

```python
import inspect, typing
sig = inspect.signature(fn)
hints = typing.get_type_hints(fn, include_extras=True)
# hints["locale"] = Annotated[str, FieldInfo(description="...")]
```

This is the standard pipeline used by PydanticAI, LangChain, and other AI agent frameworks to convert Python functions into JSON Schema tool definitions.
A script annotated this way can be automatically surfaced as a tool in any compatible agent framework without any adapter code.

### Why this matters for the ARS

A script with typed parameters is self-describing at the step level: its signature declares the interface and is readable by any compatible agent framework without adapter code.
Composition identity (`id`, `description`, `closure-kind`) lives on the YAML, not the Python file.

## Colocated script convention

Every atomic runbook has exactly one colocated Python script:

```
runbooks/
  add-operation-item.yaml    # Runbook: declares interface (inputs, outputs, steps)
  add-operation-item.py      # Script: implements it
```

Naming convention: `{runbook-id}.py` and `{runbook-id}.yaml` in the same directory.

The YAML is not read by the script at runtime (unless the script is a composite executor).
They are coupled by naming convention only.
The script's `--{flag}` interface mirrors the runbook's `inputs:` fields.

The `--locale` flag is the conventional way to pass the locale directory path. `.` is valid and means the current directory, enabling scripts to be run from within a locale.

Runbooks are colocated with the concept they operate on.
A runbook for working with specs lives in `spec/flatfile-agential-resource-system-specification/runbooks/`.
A runbook for working with a specific concept lives in that concept's directory.
There is no shared root — locales reference each other's runbooks by path when needed.

## Locale directory structure

Each locale contains:

```
{locale}/
  SOUL.md        # Principles
  AGENTS.md      # Agent policies
  MEMORY.md      # Cross-session knowledge
  INBOX.md       # Incoming messages
  PLANS.md       # Open work items
  IDEAS.md       # Uncommitted potential work
  runbooks/      # Department-specific runbooks (optional)
    {id}.yaml
    {id}.py
```

The six context files are what an entity accumulates as it grows through the U_G phases to full locale instantiation. See [flatfile-agential-resource-system](flatfile-agential-resource-system.md) for the growth sequence and why each file appears when it does.

## SHACL shapes

One SHACL shape file per relation lives at `shacl/{relation-id}.ttl`.
Each shape targets nodes that carry that relation via `sh:targetSubjectsOf`.
`shacl/id.ttl` targets every node.
A node's applicable shapes are those for the relations it actually has — every `id` is a potential shape target, not just nodes of particular named classes.
See [markdown-frontmatter](markdown-frontmatter.md) for the full validation pipeline.

## What this is NOT

This encoding spec does not describe the distributed runtime.
For the live distributed system (rqlite, NATS, Dapr, PydanticAI, LangGraph), see [distributed-relational-machine-runtime](distributed-relational-machine-runtime.md).

## Open questions

- SHACL shapes for vocabulary relation nodes: `id.ttl`, `description.ttl`, etc.
- A mechanically checkable definition of vocabulary completeness: scan all frontmatter keys, check each against the graph, report those with no corresponding node as vocabulary debt.
- Formal treatment of how the Python annotation pattern corresponds to a SHACL shape: `Annotated[str, Field(...)]` as the flatfile encoding of a geometry-layer constraint on a script parameter.
