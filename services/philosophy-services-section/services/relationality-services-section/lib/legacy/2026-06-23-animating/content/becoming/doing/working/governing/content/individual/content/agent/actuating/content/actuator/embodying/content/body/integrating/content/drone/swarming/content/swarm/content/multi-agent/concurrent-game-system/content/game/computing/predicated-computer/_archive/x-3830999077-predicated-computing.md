---
derives-methods-from-theory: [predication-categories]
---

# Predicated Computing

An engineering research program: the engineering theory of *predicated computing* — computers whose primary substrate is the [predication](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/predication-cell.md) rather than the addressed memory cell. The substrate choice is ontological — what *kind* of computer this is, at the level of what data primitively is and what computation primitively does — not architectural. A graph database layered on a Boolean computer is not a predicated computer in this sense; the addressing, the storage primitives, and the operator semantics on a predicated computer all proceed in terms of subject-predicate-object cells rather than memory cells.

The engineering content of predicated computing is the study of what such a computer is: its operators, its closure machinery, its persistence, its concurrency and federation, its application-level views, its operational guarantees. The directory characterizes these structurally — what every predicated computer commits to, what is left open — so that two predicated computers built from different choices can still be compared against the same shared characterization.

The math reformulation of this engineering content lives in [predication-categories](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/_index.md): a predicated computer's value-domain is a [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md), its closure machinery is a [closure-rule system](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md) generating [closure operators](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md), and its runtime trajectory is a [predication settling](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md). This engineering directory and the math directory describe the same object from different angles: the math gives the formal apparatus and proves theorems; this directory gives the engineering register, the runtime disciplines, and the implementation contracts.

## Convention

This research directory follows the spatiotemporal-knowledge research-directory convention. Every note is a Markdown file with YAML frontmatter; one entity per file; filenames are stable lower-kebab-case slugs.

```yaml
---
type: concept | definition | morphism | theorem | conjecture | question | example | narrative | reference
class: substrate | operator | system | protocol | invariant | ...
status: draft | sketch | proved | open | refuted
depends-on: [...]
realizes: [...]
see-also: [...]
introduces: [...] | recaps: [...] | discusses: [...] | instantiates: [...] | explores: [...]
chapters: [...]
---
```

## Layout

- `concepts/` — engineering-semantic anchors that recur across the program.
- `objects/` — definitions of engineering structures (the predicated computer itself, the predication-graph store, the event log, the application sublocale).
- `morphisms/` — the engineering moves: primitive operators (insertion, retraction, traversal), composed operators, projections that produce application-level views.
- `theorems/` — engineering claims about substrate properties, operator guarantees, and invariants.
- `examples/` — concrete predicated-computing realizations.
- `narratives/` — short rhetorical documents that walk a path through the material.
- `questions/` — open engineering questions.
- `references/` — annotated bibliography.
- `theories/` — *subtheories*: more specific theories that study a particular flavor of predicated computing under additional structural commitments the parent leaves open. Subtheories are admitted only when the additional commitments warrant their own atomization into concepts/objects/morphisms.

  The current subtheories:

  - [database-platform](theories/database-platform/_index.md) — predicated computing under the operational discipline that turns the substrate's predication-graph store into a deployment-grade database (read-replica topology, materialized views, query planning, online schema change). See [substrate-is-already-a-graph-database](theories/database-platform/narratives/substrate-is-already-a-graph-database.md) for the framing.
  - [web-server-platform](theories/web-server-platform/_index.md) — predicated computing under the commitment that the substrate exchanges messages over HTTP with its protocol structure (methods, URLs, status codes, content negotiation). See [http-as-transport-with-protocol-structure](theories/web-server-platform/narratives/http-as-transport-with-protocol-structure.md).
  - [distributed-coordination-platform](theories/distributed-coordination-platform/_index.md) — predicated computing for the operations the parent's [federation-convergence](theorems/federation-convergence.md) cannot cover: distributed locks, leader election, sequential ID generation, atomic agreement. Complement, not replacement, of the CRDT discipline; see [when-crdt-isnt-enough](theories/distributed-coordination-platform/narratives/when-crdt-isnt-enough.md).
  - [functional-runtime-platform](theories/functional-runtime-platform/_index.md) — predicated computing under the commitment that programs are substrate content: functions, types, capabilities, and channels are predication cells. Inherits homoiconic and capability-discipline lineages; see [programs-as-substrate-content](theories/functional-runtime-platform/narratives/programs-as-substrate-content.md).
  - [interactive-application-platform](theories/interactive-application-platform/_index.md) — predicated computing under the commitment that human users act on the substrate through documents, lists, forms, and notifications, alongside (and witness-distinguishably from) agents acting via the predicated-agentic-orchestration-platform. See [users-alongside-agents](theories/interactive-application-platform/narratives/users-alongside-agents.md).

Supporting infrastructure:

- `tools/` — scripts for validation, dependency audit, monograph build.
- `references.bib` — canonical BibTeX record.
- `research.toml` — toolkit configuration.

## Status

Early. The directory is being assembled from substantive engineering content scattered across the triage. The triage is not blindly copied; each idea worth keeping is re-stated as engineering content with the precision that two implementations could be checked against it.
