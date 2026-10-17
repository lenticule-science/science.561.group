---
name: Flatfile Agentic Resource System
aliases:
  - FARS
  - flatfile agentic resource system
  - Flatfile Agent Resource System
identity: flatfile-agentic-resource-system
description: "A flatfile agentic resource system (FARS) is a resource system whose substrate is ordinary files, in which every resource, relation, operation and agent is itself a file, and in which every change is a witnessed append. One FARS realization is one sovereign node. FERN is the shape of its data, FROG the graph of its operations, FAE the class of engine that runs it, and FAdRS the regime of many FARS nodes worked by a drone swarm. The Leader's design statement of 2026-10-09 is that the Group's codebase is such a system, governed by an agentic drone swarm, using semiotic computing systems."
date-created: 2026-10-09
authors:
  - emsenn
  - bare-cedar-fog-claude
office: senior-scientist
duty: realizing-allocated-science-work
supersedes-name: flatfile-agent-resource-system (2026-03-18)
see-also:
  - agentic-drone-swarm
  - semiotic-computing
  - flatfile-agent-resource-system
---

A **flatfile agentic resource system** (FARS) is a resource system built on
the five commitments below. The Leader stated on 2026-10-09 that the Group's
codebase must be "a flatfile agentic resource system that is governed by an
agentic drone swarm, using semiotic computing systems", and that "each of
those jargons ... barely have glossary terms let alone specs". This term is the
first of three that answer that statement; the others are
[agentic drone swarm](../../../../services/artificial-intelligence-science-services-section/services/agent-science-services-section/content/text/glossary/terms/agentic-drone-swarm.md)
and [semiotic computing](./semiotic-computing.md).

## The five commitments

1. **Flatfile.** The substrate is ordinary files. Each entity is one file;
   markdown with YAML frontmatter is the canonical form; a relation is a
   frontmatter key or a link that resolves to another file. The data is
   readable without any service running. The agent harness supplies computation,
   never the data (note of 2026-04-03, `flatfile-system`).
2. **Agentic.** The agents that operate on the substrate, human and machine,
   and the skills, runbooks, scripts, offices and tools they use, are entities
   in the same substrate. A system that cannot represent the skills it uses
   cannot improve them. This is self-generation, R = U_G(R), at the agent level
   (`semiotic-computer-agent-relations-system`; `agential-self-generation`).
3. **Resource.** A resource is an addressable subject of operations, with an
   identity and relations. Ownership and expendability are not implied.
4. **System.** The whole orchestration is in the substrate: data, algebra,
   scheduler, governance and the harness surfaces (CLI, MCP, programmatic API).
   There is no separate harness layer above it or runtime layer below it. The
   system is the closure of its files under the seven conditions of U_G: any
   file is valid input; every file has an identity and a description; complex
   files are assembled from simple ones; every relation key and every referenced
   tool is itself a file; types are checked by schema and shape; operations
   are named entities; and links resolve so that local sections glue.
5. **Sovereign node.** One FARS realization is one sovereign node. It owns one
   file tree, one append-only event log, one closure-rule-system version, one
   agent population and one governance discipline. Nodes federate with each
   other and never merge; each stays the source of truth for its own content.
   A federated envelope is settled at the receiver's rule-system version and
   recorded in the receiver's log with the peer as actor.

The value domain of a cell is the four-valued bilattice (true, false, no
evidence, contradicting evidence), so a FARS holds disagreement as a value and
does not erase it (the 2026-05-15 swarm survey, section 2.1).

## Which name is which

The house has used six names near this term. They name different things.

| Name | Is | Not |
|---|---|---|
| **FARS** | The system defined above. One acronym, two expansions: "Flatfile Agent Resource System" (2026-03-18, the first seated term, which defines it as an AgentRelationsSystem and states the seven conditions) and "Flatfile Agentic Resource System" (the May 2026 normative specification, and the Leader on 2026-10-09). The Leader's word is *agentic*, and the specification's title is *agentic*; the March term is the earlier name of the same concept and its seven-condition content is part of commitment 4 here. | A product, a package, or the enterprise that runs on it. FARS is the foundation the enterprise is built on, and an enterprise could run on any medium meeting the same seven conditions. |
| **FERN** (Flatfile Entity Resource Network) | The shape of a FARS's data: resources that have entity identity and network relations, held as flatfiles. An EAVT log is one concrete row form from which a FERN can be provided. | An application, package, protocol or runtime. The `flatfile` term writes the middle word as "Relation"; the FERN term writes it as "Resource"; the FERN term governs. |
| **FROG** (Flatfile Resource Operation Graph) | The graph of a FARS's operations: the resource-and-operation graph derived by interpreting Operation-typed data over Resource-typed flatfile data. Its edges are the defined acts (inspect, create, relate, transform, retire), each with inputs, authority, effects and outcomes. Code, Markdown or any other flatfile representation can realize it if it derives the same graph without a proxy runtime. | An application or semantic authority. Two seated files define it, `engineering-services-section/content/text/glossary/terms/flatfile-resource-operation-graph.md` and `561-group-services-section/content/text/glossary/terms/flatfile-resource-operations-graph.md`, with the same acronym and the same capability. One term is owed an alias to the other. |
| **FAE** (Flatfile Agent Engine) | A class of engine: one that reads flatfile resources, applies stateless operations, appends state changes to an evidence-bearing log and derives readouts from that log. A FARS is run by an engine of this class; FeltOS and LAGOON each declare it. | A package named FAE. An implementation declares the `flatfile-agent-engine` keyword. |
| **FAdRS** (flatfile agentic drone resource system) | The regime in which many FARS nodes, worked by drone agents, act as a coupled collective. It is the swarm view of confederated FARS nodes, not a second substrate. Its survey is a 2026-05-15 draft that lifted nothing into the Group's own layers; [agentic drone swarm](../../../../services/artificial-intelligence-science-services-section/services/agent-science-services-section/content/text/glossary/terms/agentic-drone-swarm.md) is that lift. | A different system from FARS. |
| **FAOH, MASH** | Earlier names for the harness-exposure surfaces. Deprecated; absorbed into FARS (commitment 4). | Layers separate from FARS. |

The relation among them: a FARS has data of FERN shape, operations that form a
FROG, and an engine of the FAE class; many FARS nodes under one swarm are a
FAdRS. The terms FERN, FROG and FAE each say of themselves that they are
descriptive names, not applications or packages, and that an implementation
declares the keyword and does not create a second semantic owner. That
constraint carries into FARS.

## The design statement

The Leader's design statement (`AGENTS.md`, lines 24 to 39) is that nodes
operate as service loops providing paraconsistent transfinitely-valued
data-monitoring, content-addressed evidence-substrate analyzing,
coordination-free deductive-truth planning and database-proof executing,
through recursively-self-improving knowledge. The four loop stages and the
knowledge are the Monitor, Analyze, Plan, Execute and Knowledge of MAPE-K
(`mape-k`). A FARS is the substrate those loops run on; the loops are stated
in [semiotic computing](./semiotic-computing.md) and in the specification note
`2026-10-09-specification-note-on-the-codebase-as-a-flatfile-agentic-resource-system.md`.

## Sources

- Leader, 2026-10-09, as recorded in
  `science-services-section/services/engineering-science-services-section/services/fabrication-science-services-section/content/text/documents/articles/notes/2026/10/09/2026-10-09-note-recovering-the-fabrication-research.md` (section 2).
- `flatfile-agent-resource-system.md` (this directory), the March 2026 term: seven conditions, self-generation, entity growth.
- `engineering-services-section/content/text/glossary/terms/{flatfile,flatfile-entity-resource-network,flatfile-resource-operation-graph,flatfile-agent-engine}.md` and `561-group-services-section/content/text/glossary/terms/flatfile-resource-operations-graph.md`.
- `engineering-services-section/content/text/documents/articles/notes/2026/04/03/2026-04-03-note-on-flatfile-system.md`.
- `.../agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/README.md` and `architecture/{sovereign-node,swarm,confederation}/`.
- `science-services-section/content/text/documents/articles/notes/2026/08/20/theory-of-flatfile-agentic-drone-resource-system-swarms-may-2026.md`, section 2.1.
- `engineering-services-section/content/text/glossary/terms/semiotic-computer-agent-relations-system.md`.
