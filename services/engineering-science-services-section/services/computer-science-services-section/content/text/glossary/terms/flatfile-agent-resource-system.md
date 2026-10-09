---
id: flatfile-agent-resource-system
description: "The Flatfile Agent Resource System (FARS): the Mode-2 substrate (Foundation) on which enterprises, institutions, and companies run — a site (B, J) whose medium is markdown files and YAML frontmatter, whose enabling conditions are the seven closure conditions of U_G, and whose Grothendieck topology is the Fregean predicate-as-key structure. FARS is not the enterprise; it is what the enterprise is built on. It provides: distinguishable identities (id), stable persistence (git), compositionality (links and frontmatter), and interface conformance (Fregean pattern). An enterprise is substrate-independent with respect to FARS: it could in principle run on a database or graph store satisfying the same seven enabling conditions."
implements: AgentRelationsSystem
date-created: 2026-03-18
date-modified: 2026-03-20
params:
  substrate: relational-universe
  agent-set: relational-universe
  closure-operator: relational-universe-morphism
output: relational-universe
ast:
  universe-fixed-point:
    - substrate
    - closure-operator:
        - substrate
    - self-generation:
        - closure-operator
---

# Flatfile Agent Resource System

This is the March 2026 seating of the concept. Its current term is [flatfile agentic resource system](./flatfile-agentic-resource-system.md), which keeps the acronym FARS, takes the Leader's word *agentic*, and states which of FARS, FERN, FROG, FAE and FAdRS is which. The seven conditions below remain the closure content of that term.

## What it is

A **FlatfileAgentResourceSystem** is an AgentRelationsSystem whose substrate is flatfiles: all entities live as plain text markdown and YAML files, human-readable without tooling.
The frontmatter IS the relational record — predicates, dates, identities, and relations are encoded there, not in any external system.
Agents (human and AI) operate directly on files: reading definitions, following skills, executing scripts.

The repo files ARE the input X. The system IS $U_G(X)$ — the [closure](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/closure-operator.md) of those files under the seven conditions. Any file in the repo is in $U_G(X)$ by condition 1.

All files are valid input — no file is rejected.

See [relational-system-markdown](./relational-system-markdown.md) for the full encoding specification: Fregean predicate-as-key pattern, Python annotation conventions, and vocabulary debt.

## The graph

The primary object in FARS is the **graph**: the network of connections between files. Every file is a node. Every frontmatter relation and every inline link is an edge.

The graph is the relational universe at the level a user interacts with it. A file with no connections is an isolated element of $H$ — present by condition 1 but contributing nothing to the global sections. A file with rich connections participates in compatible families that glue into global knowledge.

The sheaf condition (condition 7) in practice means: following links out of any file, the claims at the other end are compatible with the claims in the file you started from. A broken link is an incompatible local section. A circular reference that contradicts itself is a failure of the gluing condition. A well-maintained graph is a sheaf.

## How the three file types connect

The three types form a triangle. Each pair has a restriction map that enforces the sheaf condition:

**YAML → Python**: the YAML names Python files via `run:`. At each wiring junction, the YAML's declared connections must be type-compatible with the Python function signatures. This is checkable: read both signatures, compare types. If they don't match, the composition can't glue.

**Python → Markdown**: a stepping map reads markdown files as input and writes markdown files as output. Fiber content is what flows through the computation.

**YAML → Markdown**: a recipe's `id:` and `description:` are themselves markdown-expressible claims. The recipe is a node in the graph alongside the notes it operates on.

Markdown is what the system knows. YAML is what the system plans to do. Python is what the system does.

## Self-generation

$R = U_G(R)$. The system contains its own operations.

The markdown files that define FARS are FARS markdown files. The YAML files that compose operations are FARS operations. The Python files that compute stepping maps are FARS entities. The system describes itself using itself.

The fixed-point equation holds when every operation the system uses to maintain itself is a file in the system, satisfying all seven conditions. Getting there is asymptotic: you approach it by making more operations explicit, more vocabulary defined, more composition structure declared. The gap between where the system is and its fixed point is the system's defect. It shrinks with every settled relation, every resolved `given:`, every named operation that was previously anonymous.

## Entity growth

Entity growth is the [depth filtration](../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/depth-filtration.md) made concrete.
Each named stage adds structure to the entity:

| Stage | What appears | What is added |
|-------|-------------|---------------|
| Outpost | `{id}/`, `skills/` | Named operations as first-class objects (condition 4) |
| [Blueprint](./blueprint.md) | + `shacl/`, `runbooks/` | Governing shapes and structural procedures (conditions 5–6) |
| [Charter](../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/governance-services-section/content/text/glossary/terms/charter.md) | + `AGENTS.md` | Covering structure: agent community and operational policies |
| [Locale](../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/services/agent-computer-platform-system-engineering-services-section/services/flatfile-agent-resource-system-engineering-services-section/content/text/glossary/terms/flatfile-agent-resource-system-locale.md) | + `SOUL.md`, `MEMORY.md`, `INBOX.md`, `PLANS.md`, `IDEAS.md` | Live: governing soul, accumulation, receiving, generative work (condition 7) |

An entity that has completed all phases is a [FlatfileAgentResourceSystemLocale](../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/services/agent-computer-platform-system-engineering-services-section/services/flatfile-agent-resource-system-engineering-services-section/content/text/glossary/terms/flatfile-agent-resource-system-locale.md): a scope-local, self-similar instance of this system at its scale.
An entity at any earlier stage (Outpost, Blueprint, Charter) is valid at its current depth — not a broken locale, just one still growing.

The depth filtration is self-similar: a locale contains seed entities growing through the same sequence within its scope. The locale hierarchy mirrors the [hyperverse tower](../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/hyperverse-tower.md): each locale is a relational universe in its own right, and the root is the first level from which others are reachable.

For the abstract locale concept and the full implementation hierarchy, see [Locale](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/locale.md).

## FARS as Foundation (Mode-2 substrate)

FARS is a [Foundation](../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/documents/articles/notes/undated/foundation.md) in the formal sense — a site $(\mathcal{B}, J)$ — not the enterprise or institution that runs on it.

The confusion to avoid: FARS is frequently described as "the system" or "what we're building." It is not. FARS is what the system is *built on*. The enterprise — the aim-generative ongoing cooperative activity — runs on FARS but is not FARS. An enterprise could in principle run on a relational database, a graph store, or any other medium satisfying the same seven enabling conditions (substrate independence). The specific flatfile realization is contingent on the current state of the art and the operational context; the enterprise's logical structure is not.

The layered ontology:

| Stratum | What it is | Spec |
|---|---|---|
| $S_0$ | File system (git) | Mode-2 substrate: identity, persistence, addressability |
| $S_1$ | FARS | Mode-2 substrate: seven conditions, Fregean pattern, coverage structure |
| $S_2$ | Relational universe $(T, J, H)$ | Mode-2 substrate: presheaf structure, nucleus evaluation, settlement |
| $S_3$ | Institution | Runs on $S_0$–$S_2$: constitutive rules, collective recognition, positions |
| $S_4$ | Enterprise | Runs on $S_0$–$S_3$: hard core, generative mechanism, operative structure |

FARS satisfies the enabling conditions for the enterprise: distinguishable states (`id:`), stable persistence (git versioning), compositionality (links + frontmatter), interface conformance (Fregean predicate-as-key pattern). The enterprise is substrate-independent with respect to FARS: any medium satisfying these enabling conditions supports the same enterprise.

## Seven conditions

How $U_G$'s seven closure conditions manifest in FARS — [closure-operator](../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/closure-operator.md):

| # | Condition | In FARS |
|---|---|---|
| 1 | Any input is valid | Any file in the system is in the system |
| 2 | Canonical identity | Every file has `id:` and `description:` |
| 3 | Limits and colimits | Complex files assembled from simple ones; directories collect files |
| 4 | Exponentials | Every relation key is itself a file; every referenced Python tool exists |
| 5 | Subobject classification | Type-checking via Python signatures, schema validation, SHACL shapes |
| 6 | Structural operations | YAML and Python files are named entities in the system |
| 7 | Sheaf gluing | Links resolve; types match at wiring junctions; compatible sections assemble |

## ClosureKind

The four `closure-kind` values, defined by which of the two nuclei σ (meaning-closure) and Δ (execution-closure) have been applied to a YAML composition — [nuclear-quartet-theorem](../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/nuclear-quartet-theorem.md):

| Value | σ | Δ | Wiring structure |
|---|---|---|---|
| `process` | stable | stable | deterministic; no branching |
| `derivation` | open | stable | inference step produces value at runtime |
| `procedure` | stable | open | conditional routing between steps |
| `inquiry` | open | open | structure discovered during execution |

`closure-kind` lives on YAML files (compositions), not Python files (generators). A single step $s \in \Sigma$ has no closure kind — see [flatfile-agent-resource-system-runbook](../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/runbook.md).

## Predicate conventions by directory

| Directory | Expected predicates defined in |
|-----------|-------------------------------|
| `math/` | [math-entity](../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/services/agent-computer-platform-system-engineering-services-section/services/flatfile-agent-resource-system-engineering-services-section/content/text/glossary/terms/flatfile-agent-resource-system-math-entity.md) |
| `spec/` | [specification](./specification.md) |
| `skills/` | [skills](../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/skills.md) |
| `runbooks/` | [runbook](../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/runbook.md), [script](../../../../../../../../../engineering-services-section/content/text/glossary/terms/script.md) |

## Open questions
