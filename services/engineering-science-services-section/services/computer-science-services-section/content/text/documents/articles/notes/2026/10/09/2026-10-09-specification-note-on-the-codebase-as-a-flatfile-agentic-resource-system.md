---
title: "The codebase as a flatfile agentic resource system"
description: "Specification note: what the Group's codebase must satisfy to be a flatfile agentic resource system governed by an agentic drone swarm using semiotic computing systems, stated as 51 EARS requirements, each with its source and the measure by which engineering judges the codebase against it."
date-created: 2026-10-09
kind: specification-note
authors: [bare-cedar-fog-claude]
office: senior-scientist (Lenticule Science)
duty: realizing-allocated-science-work
skill: research
part-of: computer-science-services-section
prompted-by: the Leader, 2026-10-09
terms:
  - flatfile-agentic-resource-system
  - agentic-drone-swarm
  - semiotic-computing
keywords:
  - flatfile-agentic-resource-system
  - agentic-drone-swarm
  - semiotic-computing
  - mape-k
  - EARS
  - requirements
  - conformance
---

Paths below are relative to `lib/emsenn/services/561-group/services/` unless
they begin with `AGENTS.md`. `SCI` is `science-services-section`, `ENG` is
`engineering-services-section`, `CS` is
`SCI/services/engineering-science-services-section/services/computer-science-services-section`,
and `AOP` is
`SCI/services/philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform`.

## 1. The statement

The Leader's statement of 2026-10-09 is that the Group's codebase is "a flatfile
agentic resource system that is governed by an agentic drone swarm, using
semiotic computing systems", and that "each of those jargons ... barely have
glossary terms let alone specs" (recorded in
`SCI/services/engineering-science-services-section/services/fabrication-science-services-section/content/text/documents/articles/notes/2026/10/09/2026-10-09-note-recovering-the-fabrication-research.md`,
section 2, lines 57 to 63). Three terms now state the theory under each jargon:

- [`flatfile-agentic-resource-system`](../../../../../../glossary/terms/flatfile-agentic-resource-system.md):
  the substrate is files; agents, operations and tools are files; every change
  is a witnessed append; one realization is one sovereign node. FERN is the
  shape of its data, FROG the graph of its operations, FAE the class of its
  engine, FAdRS the regime of many such nodes under a swarm.
- [`agentic-drone-swarm`](../../../../../../../../services/artificial-intelligence-science-services-section/services/agent-science-services-section/content/text/glossary/terms/agentic-drone-swarm.md):
  the agents are operators on the substrate with asymmetric handedness,
  coordinate through its records, are bounded by envelopes and cost, and govern
  by bearing recorded offices, duties and skills.
- [`semiotic-computing`](../../../../../../glossary/terms/semiotic-computing.md):
  the datum is the predication cell valued in the four-valued bilattice, writes
  are admissions and retractions, computation is settling under meaning-closure
  and execution-closure, and the agents are signs of the same substrate.

The Leader's design statement (`AGENTS.md`, lines 24 to 39) is that the nodes
of this system run service loops of paraconsistent transfinitely-valued
data-monitoring, content-addressed evidence-substrate analyzing,
coordination-free deductive-truth planning and database-proof executing,
through recursively-self-improving knowledge. The Leader's order of layers is
data, code, networking, systems (`AGENTS.md`, line 13), and science,
engineering, operations, then external or internal (line 16).

The requirements in section 3 follow from these terms. A requirement is here
only if a sentence of a term or a source it cites states what it asks.

## 2. Form

Each requirement is one sentence in EARS form with one "shall": ubiquitous
("The X shall"), event ("When E, the X shall"), state ("While S, the X
shall"), optional feature ("Where F, the X shall"), or unwanted behaviour ("If
U, then the X shall"). "The codebase" is the Group's superrepository on
Bare Cedar Fog and the submodules it pins; "a node" is a deployed Group
node, such as Bare Cedar Fog. "Source" names the term clause or record the
requirement is read from. "Measure" names what engineering observes to judge
it; it is not part of the requirement.

## 3. Requirements

### 3.1 Flatfile (FS)

- **FS-1** The codebase shall hold every entity of the Group (office, incumbency, duty, skill, rule, term, note, specification, work item, evidence record) as a file.
  Source: flatfile commitment 1. Measure: for each entity kind, resolve a sample by path using git alone, with no service running.
- **FS-2** Where a database, queue, chain or cache holds state about entities, that store shall be a derived view of the files and the event log.
  Source: flatfile commitment 1; `AOP/flatfile-agentic-resource-system/architecture/sovereign-node/sovereign-node.md`, line 7 (source of truth). Measure: for each stateful service, rebuild its store from files and log and diff it against the live store.
- **FS-3** Each entity file shall carry an identity and a description in its frontmatter.
  Source: seven conditions, 2 (`CS/content/text/glossary/terms/flatfile-agent-resource-system.md`). Measure: per section, the count of entity files lacking either, taken from `git ls-files` for that section.
- **FS-4** Each relation between entities shall be a frontmatter key or a link that resolves to an entity file.
  Source: flatfile commitment 1; seven conditions, 7. Measure: unresolved relations per section.
- **FS-5** If a relation names no file, then the checker shall report an incompatible local section naming the file that holds the relation.
  Source: seven conditions, 7 (a broken link is an incompatible local section). Measure: seed one broken link; the checker reports it.
- **FS-6** Every operation the codebase uses to maintain itself (script, scheduled job, service, projector, checker) shall be an entity file with an identity and a description.
  Source: seven conditions, 4 and 6; self-generation, R = U_G(R). Measure: executables named by schedulers, CI and projectors that have no entity record.
- **FS-7** Each node shall keep exactly one append-only event log.
  Source: sovereign-node, "one event log per node". Measure: alter an earlier entry in a copy; the digest chain exposes it.
- **FS-8** When state changes, the node shall append an event naming the actor, the operation, the inputs and the outcome.
  Source: FAE ("appends state changes to an evidence-bearing log"). Measure: trace a sample of changes (a commit, a work-board move, a deployment, a service restart) each to its event.
- **FS-9** Each node shall own one file tree, one closure-rule-system version, one agent population and one governance discipline.
  Source: sovereign-node. Measure: for each node, list the five; a member shared between nodes is a defect.
- **FS-10** When a node receives a federated envelope, it shall settle the envelope under its own rule-system version and record the sending peer as the actor.
  Source: sovereign-node. Measure: submit an envelope produced under a different version; the log shows the receiver's version and the peer as actor.
- **FS-11** The codebase shall derive its resource-and-operation graph from Operation-typed data over Resource-typed flatfile data, without a proxy runtime.
  Source: FROG. Measure: regenerate the graph from files and diff it against the graph the services serve.
- **FS-12** Where an implementation provides a FERN, a FROG or a FAE, it shall declare the corresponding package keyword and introduce no package that owns their semantics.
  Source: FERN, FROG and FAE terms ("not an application or package"). Measure: manifest keywords; packages named FERN, FROG or FAE are defects.
- **FS-13** Each engineering resource shall be free of any particular section's data or brand, so that it sits at the order science, engineering, operations, then external or internal.
  Source: rule `science-engineering-operations-parameterize-in-order`; `AGENTS.md`, line 16. Measure: per engineering package, the count of embedded section names, brands or data records.
- **FS-14** Each resource shall depend only on resources at the same or a more primitive level of the order data, code, networking, systems.
  Source: `AGENTS.md`, line 13. Measure: dependency edges from package manifests and imports, counted by direction.
- **FS-15** The codebase shall hold Group knowledge in the repository at the owning section, and not in an agent harness's private memory, the home directory, `~/.config`, `~/.local`, a scratch directory or `/tmp`.
  Source: rules `no-harness-private-memory`, `group-material-on-bare-cedar-fog-lives-under-info`. Measure: the paths those rules name, checked directly by name, never by tree scan.

### 3.2 Agentic drone swarm (SW)

- **SW-1** Each agent that does Group work shall be an entity with an agent record, projected from an office record.
  Source: agentic drone swarm, "Agentic" and "Drone"; rule `sessions-dispatch-only-office-projected-agents`. Measure: for dispatches in a period, the fraction whose agent resolves to an office.
- **SW-2** Each office record shall list the duties and skills the office bears and the rules that bind it.
  Source: swarm commitments (`AOP/.../architecture/swarm/swarm.md`, lines 8 to 12). Measure: schema check over each section's `lib/agency/offices`.
- **SW-3** Each duty record shall name a skill that realizes it and a receiving office other than the claimant.
  Source: `SCI/lib/agency/duties/realizing-allocated-science-work.json` (fields `skills`, `receiver-condition`); rule `receiving-decisions-belong-to-the-receiving-office`. Measure: schema check over duties.
- **SW-4** If an act has no office bearing it as a duty realized by a skill, then the swarm shall create or revise the office, duty or skill before performing the act.
  Source: rule `no-work-outside-an-office-duty-and-skill`. Measure: trace a sample of commits, pull requests and notes to an office, duty and skill in their provenance.
- **SW-5** Each agent record shall declare its handedness as the four coordinates recv, send, actuate and observe.
  Source: agentic drone swarm, "Drone"; survey section 5.1 (lines 173 to 179). Measure: agent records lacking any coordinate.
- **SW-6** When two members of the swarm interact, the interaction shall pass through records of the substrate.
  Source: `architecture/swarm`, "coordination is substrate-mediated"; rule `coordinate-the-swarm-rather-than-stop-it`. Measure: enumerate inter-agent channels; a private message, a `/tmp` file or a harness memory is a defect.
- **SW-7** If an agent attests or receives its own work, then the audit shall refuse the attestation.
  Source: `requirement-event`; the duty's receiver condition. Measure: seed a self-attestation; the audit refuses it.
- **SW-8** When a judged change is to be marked ready, merged or closed, the office whose receiving duty covers it shall decide and record the decision.
  Source: rule `receiving-decisions-belong-to-the-receiving-office`. Measure: each disposition in a period cites its receiving office; a disposition returned to the Leader as a question is a defect.
- **SW-9** Before an actuation whose effect leaves the node (push, merge, publication, payment, external message), the actuating agent shall evaluate the action against a recorded safety envelope and its physical preconditions.
  Source: agentic drone swarm, "It is bounded" (`predicated-drone-swarm/safety-envelope-cell`, `physical-precondition`). Measure: each actuation class has an envelope record; a sample of actuations each has a precheck witness.
- **SW-10** Where an action requires meaningful human control, the node shall hold the action until an authorization record from the authorizing office exists.
  Source: `agentic-swarm-theory`; `predicated-drone-swarm/meaningful-human-control`. Measure: seed an unauthorized action in that class; it is held.
- **SW-11** When a drone performs a step, it shall record the step's embodied cost: inference tokens, compute time and bytes written.
  Source: `predicated-drone-swarm/embodied-cost-coordinate`. Measure: per-step cost records; their bytes-written sum against the node's disk growth over the same period.
- **SW-12** If a scheduled tick finds no work due, then the scheduler shall append no witness.
  Source: deposition is a witnessed write of an increment (survey section 4, line 156); the 2026-10-09 note on the Leader's corrections records `run-due` RPCs at about 3.4 per second, each witnessed three times at about 10 KB, 5.8 GB on 2026-10-08 (`561-group-services-section/content/text/documents/articles/notes/2026/10/09/2026-10-09-note-on-the-leaders-repeated-corrections.md`, item 6). Measure: witness bytes per idle hour on each node.
- **SW-13** While a node is live, its heartbeat shall schedule each unsettled entity by a recorded policy.
  Source: `architecture/swarm` (heartbeat schedules unsettled entities); `heartbeat-record`. Measure: the age of the oldest unsettled entity with no scheduled attempt.
- **SW-14** The swarm shall apply a classical swarm convergence claim only to a sub-population that is homogeneous, code-backed and confined to a bounded region of the substrate.
  Source: `architecture/swarm`, lines 32 to 36; survey section 3.4. Measure: each convergence claim in a record cites its sub-population and the three conditions.

### 3.3 Semiotic computing (SC)

- **SC-1** The codebase shall represent each claim it holds as a predication cell identified by its subject, predicate and object, with a value in the four-valued bilattice.
  Source: semiotic computing, "The primitive is the sign relation". Measure: claim stores; a store whose cell identity is an address or a row number is a defect.
- **SC-2** When a claim changes, the codebase shall express the change as an admitted or a retracted predication and not as an overwrite.
  Source: `predicated-computer`, "a write is the addition or retraction of a predication". Measure: update paths in claim stores; each appends.
- **SC-3** A cell's value shall rise only monotonically in the knowledge order, except by a retraction that carries a witness.
  Source: `predicated-computer`; survey section 4, evaporation. Measure: replay a log and check the order at each step.
- **SC-4** If two sources assert contradictory values for one cell, then the codebase shall record the value top with both witnesses retained.
  Source: semiotic computing, "Values are paraconsistent". Measure: seed two contradictory assertions; the cell holds top with two witnesses.
- **SC-5** Where no evidence has been recorded for a cell, the codebase shall report the value bottom and not false.
  Source: same. Measure: query an unasserted cell.
- **SC-6** The codebase shall identify each sign carrier by its content address.
  Source: semiotic computing, "The agents are signs"; `AGENTS.md`, line 29. Measure: the same content yields the same identity; changed content yields a different one.
- **SC-7** The codebase shall hold sign identity and relations in SignCell, SignChain and SignGraph, and admission and assay in SignCraft.
  Source: `ENG/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agent-organization-engine/README.md` (software-development work). Measure: operations that hold identity or relations in a private record; the README names the code-mission trajectory and acceptance records as such.
- **SC-8** The runtime shall treat a proposition as settled only when it is fixed under both the meaning-closure nucleus and the execution-closure nucleus.
  Source: `semiotic-computer-machine`; `nuclear-quartet-theorem`. Measure: golden vectors read from the nuclear-quartet declarations (requested in section 7, request 3) against the settle function.
- **SC-9** The codebase shall derive each readout from the event log such that rerunning the derivation on the same log yields the same readout.
  Source: FAE ("derives readouts from that log"). Measure: rerun and diff every readout a node serves.
- **SC-10** Each agent, skill, runbook, shape and script shall be a sign of the same substrate as the entities it operates on.
  Source: `semiotic-computer-agent-relations-system` ("Self-reference"). Measure: the set difference between the agents and tools in use and those that have records.

### 3.4 The service loop (LP)

The loop is the Leader's (`AGENTS.md`, lines 26 to 35), read as MAPE-K.

- **LP-1** (Monitor) While a node runs, it shall record each observation of its managed resources as a predication valued in the four-valued bilattice.
  Source: "paraconsistent transfinitely-valued data-monitoring"; semiotic computing, "Values are paraconsistent". Measure: observation records with values; a monitor that emits only two values is a defect.
- **LP-2** (Monitor) The node shall record whether a monitored resource is unobserved, false or contested as three different states.
  Source: same. Measure: query a resource of each state.
- **LP-3** (Analyze) When a finding is produced, it shall cite the digests of the evidence it rests on.
  Source: "content-addressed evidence-substrate analyzing". Measure: findings lacking a digest list.
- **LP-4** (Analyze) Where two assays are two passes of one method on the same evidence, the codebase shall count them as one channel.
  Source: `kinetic-proofing` ("two passes of the same model on the same evidence are one channel"). Measure: the channel identity in each assay record.
- **LP-5** (Plan) When a plan is derived, it shall be derived deductively from settled cells under rules monotone in the knowledge order, so that nodes holding the same evidence derive the same plan without coordinating.
  Source: "coordination-free deductive-truth planning"; `rule-addition-is-substrate-local` and `scope-composition-is-knowledge-order-monotone` (`AOP/.../flatfile-agentic-resource-system/theorems`). Measure: two nodes given the same evidence produce plans with equal digests with no message between them.
- **LP-6** (Execute) When an executor performs an act, it shall append a receipt binding the operation identity, the input digests, the output digests and the assays passed.
  Source: "database-proof executing"; `realization-receipt` and the code-fabrication specification, receipt clause. Measure: sample acts, each to its receipt.
- **LP-7** (Execute) If an act has no admitted plan or work order, then the executor shall refuse it.
  Source: `work-order`; `code-fabrication-from-a-specification` (refuse rather than fill a gap). Measure: seed an act with no admitted order; it is refused.
- **LP-8** (Knowledge) When the loop's own operations change, the change shall pass through the same loop and be recorded as files.
  Source: "recursively-self-improving knowledge"; self-generation. Measure: changes to schedulers, projectors and checkers each have a plan and a receipt.
- **LP-9** (Knowledge) When the Leader gives a correction, the node shall record it as a rule, skill revision, term or note at the lowest layer that faithfully holds it, in the turn it is received.
  Source: rules `leader-corrections-persist-into-method`, `capitalized-leader-statements-mark-a-failed-carrier`. Measure: corrections in a period's session records against records created in the same turn.

### 3.5 Derivation (DR)

- **DR-1** Each module of code shall trace to a requirement, a specification, a work order and a fabrication receipt.
  Source: the Leader's statement that aligned code is "derived from research papers I can read, specs I can read, SAS, HLD, LLD" (index note, line 61); the code-fabrication specification, traceability clause. Measure: per section, the fraction of modules with the full trace; Node operations first, where receipts exist.
- **DR-2** When a Leader prompt is received, research, requirements, specification and design shall be held in the corpus before code is written for it.
  Source: rule `leader-prompts-become-research-before-code`. Measure: for a period's prompts, the dates of notes and specifications against the dates of the commits that answer them.
- **DR-3** Each jargon of the Leader's design statement shall have a glossary term and a specification.
  Source: the Leader, "each of those jargons ... barely have glossary terms let alone specs". Measure: the jargons of `AGENTS.md`, lines 18 to 39, each against a term and a specification. By file name, terms exist for `mape-k`, `huidu`, `paraconsistent-logic`, `micro-enterprise` and `bilattice`; none exists for Rendanheyi, Huidu Guanli, conurbation, coordination-free planning, database-proof executing or evidence substrate; specifications exist for none.

## 4. How the codebase is measured

1. **Unit.** A section, that is a directory with its own `README.md` or `_index.md`, reached by `git ls-files -- '<section pathspec>'`. Never by `find`, recursive search, `git grep`, `tree` or `git status` over the whole tree (rule `no-whole-tree-scans-on-bare-cedar-fog`).
2. **Where.** A cloud session, since the measurement is wide and heavy (rule `heavy-work-runs-off-the-laptop`). Reading single files on the laptop is permitted.
3. **Verdict per requirement per section.** One of met, partly met, not met, or not measurable, each with the evidence as `path:line` or a receipt digest. "Not measurable" names the missing instrument.
4. **Record.** The measurement is a dated record in the owning engineering section and is itself an entity file (FS-1, FS-3), replacing the 2026-09-04 gap statements (`SCI/services/engineering-science-services-section/services/fabrication-science-services-section/content/text/documents/articles/notes/2026/09/04/2026-09-04-note-on-fabrication-as-the-birth-of-a-thing.md`, lines 257 to 294) where they overlap.
5. **No test run is the measure.** A passing suite is not a verdict on a requirement; the measure column states what is observed.

## 5. Design

The requirements fall in five layers that follow the Leader's order (data, code, networking, systems).

- **Data:** FS-1 to FS-6, SC-1 to SC-6. Entities are files; claims are cells; identity is content.
- **Code:** FS-11, FS-12, SC-7 to SC-10, LP-5 to LP-8, DR-1. Operations are entities; settling and planning are functions of the log.
- **Networking:** FS-9, FS-10, SW-6, LP-3. Nodes federate by envelope; agents meet through records.
- **Systems:** FS-7, FS-8, FS-13 to FS-15, SW-1 to SW-5, SW-7 to SW-14, LP-1, LP-2, LP-4, LP-9, DR-2, DR-3. The node, its swarm and its governance compose the lower layers.
- **Loop:** LP-1 to LP-9 are the MAPE-K stages; each lower requirement serves one of them.

## 6. Receiving conditions

The Chief Science Officer, or the science receiver it names, receives this note
against the allocation. The Senior scientist does not receive it. Engineering
consumes it: the Senior engineer (Red Cup Engineering) performs the
measurement of section 4 and the Chief Engineering Officer receives the
measurement. The note is received when each requirement has a source that
resolves, an EARS sentence of one "shall", and a measure an engineer can
perform without the Senior scientist.

## 7. Requests the specification obliges

Each names the wanted outcome and its judge.

1. **Measure the codebase against section 3.** Outcome: the dated record of section 4, one verdict per requirement per section, Node operations and the Bare Cedar Fog node first. Judge: the Chief Engineering Officer. Runs in a cloud session.
2. **Alias the two FROG terms.** Outcome: one of `engineering-services-section/content/text/glossary/terms/flatfile-resource-operation-graph.md` and `561-group-services-section/content/text/glossary/terms/flatfile-resource-operations-graph.md` aliases the other, and the `flatfile` term's "Entity Relation Network" reads "Entity Resource Network". Judge: the Chief Science Officer.
3. **Golden vectors for SC-8.** Outcome: vectors read from the nuclear-quartet and settling declarations in the owning Obsmetrologia package, for engineering's settle function. Judge: the Chief Science Officer's science receiver.
4. **Seat the jargons of DR-3.** Outcome: a term for each of Rendanheyi, Huidu Guanli (beside `huidu`), conurbation, coordination-free planning, database-proof executing and evidence substrate, each stating the Leader's use and citing `AGENTS.md`. Judge: the Chief Science Officer.
5. **Lift the drone-swarm theorems the Group adopts.** Outcome: for each of the survey's sketch-status theorems under `AOP/predicated-drone-swarm/`, a record that the Group carries it into its own terms or leaves it as informant; SW-5, SW-9, SW-10 and SW-11 depend on the embodied-handedness, safety-envelope, meaningful-human-control and embodied-cost entries. Judge: the Chief Science Officer.
6. **Specify the loop's database-proof stage.** Outcome: a specification of "database-proof executing" that LP-6 and LP-7 can cite, in the Leader's words. Judge: the Leader.

## 8. What is not yet derived

The Leader's sense of "database-proof" has no term in the house; LP-6 and
LP-7 read it as execution that leaves a proof-bearing record in the log
(`realization-receipt`, `fabrication-fidelity`), and request 6 owes the term.
The drone-swarm survey is a 2026-05-15 draft; SW-5 and SW-9 to SW-11 lift its
embodied-handedness, envelope, human-control and cost entries into the Group's
requirements, and request 5 owes the same lift into the Group's terms.
Evaporation, the classical decay of a trace field, has no clean analogue in a
knowledge-monotone substrate (survey, line 163); SC-3 states the retraction
with a witness that stands in its place.
