---
name: Semiotic Computing
aliases:
  - semiotic computing
  - semiotic computing system
  - semiotic computer
  - semiotic computer system
  - predicated computing
identity: semiotic-computing
description: "Semiotic computing is computing whose primitive datum is the sign relation held as a predication cell (subject, predicate, object, with a value in a four-valued bilattice), and whose computation is the admission, retraction and traversal of those cells and the settling of propositions under meaning-closure and execution-closure. A semiotic computing system is a system so built in which the agents and their tools are signs in the same substrate, and in which every sign is content-addressed and every change is a witnessed append."
date-created: 2026-10-09
authors:
  - emsenn
  - bare-cedar-fog-claude
office: senior-scientist
duty: realizing-allocated-science-work
see-also:
  - flatfile-agentic-resource-system
  - agentic-drone-swarm
  - mape-k
---

**Semiotic computing** is the third of the three jargons in the Leader's
2026-10-09 statement that the Group's codebase is "a flatfile agentic resource
system that is governed by an agentic drone swarm, using semiotic computing
systems". It is the mode of computation of the other two terms: a
[flatfile agentic resource system](./flatfile-agentic-resource-system.md) holds
signs as files, and an [agentic drone swarm](../../../../services/artificial-intelligence-science-services-section/services/agent-science-services-section/content/text/glossary/terms/agentic-drone-swarm.md)
operates on them.

## The primitive is the sign relation

A sign stands to an object for an interpretant through a code. The house's
semiotic system is the tuple S = (V, O, I, K, R, Sigma) of sign-vehicle
inventory, objects, interpretants, codes, relations and the signature
(`semiotic-system`). Semiotic computing makes the relation the unit of
storage and of operation.

- **The unit of storage is the predication cell.** A cell (s, p, o) carries
  a value in the predication fiber algebra at p. It is identified by its
  triple, not by an address. The store has no fetch-from-address primitive.
- **The unit of operation is the relational primitive.** The primitives are to
  assert a predication, retract a predication and traverse from an entity
  along a predicate. Any richer operator decomposes into them or it is not an
  operator on the substrate.
- **A write is an admission or a retraction.** There is no overwrite. An
  existing cell's value is raised monotonically toward a fixed point in the
  knowledge order, or the cell is retracted with a witness.
- **The substrate choice is ontological.** A graph database layered on an
  addressed store is not a semiotic computer. Predicated computing is the
  engineering name of the paradigm, and "semiotic" is the house's qualifier
  for the family of concrete systems that realize it
  (`semiotic-computer-system-services-section/README.md`; `predicated-computer`).

## Values are paraconsistent

The value domain is the bilattice FOUR: true, false, no evidence (bottom)
and contradicting evidence (top). Disagreement between sources is recorded as
top with both witnesses retained, and absence of evidence is bottom, which is
not false. A classical store collapses disagreement to a winner; a semiotic
store keeps it for adjudication (`bilattice`; survey section 2.1).

## Computation is settling

A semiotic computer machine is the operational instance of a relational
universe: a history site (T, J) running a fiber nuclear doctrine H. At each
history t, the meaning-closure nucleus sigma (saturation over the commutation
topology J) and the execution-closure nucleus Delta (transfer) commute, and
their composite pi = sigma after Delta projects a proposition onto the fixed
propositions, those stable under both. The machine's output at each step is
the global sections newly fixed
(`semiotic-computer-machine`; `nuclear-quartet-theorem`). The settling of a
function of the polity runs as a transfinite, knowledge-monotone orbit
(survey sections 2.4 and 2.5), which is the transfinite valuing of the
Leader's monitoring stage.

## The agents are signs

A semiotic computing system is agent-relational: the agents, skills, runbooks,
shapes and scripts that operate on it are entities of the same substrate, and
the fixed-point property is approached by defining more skills with skills
(`semiotic-computer-agent-relations-system`). The house carries sign
identity and relations in SignCell, SignChain and SignGraph, and carries
admission and assay in SignCraft (`agent-organization-engine/README.md`).
Content addressing makes a sign's identity its content, and the append-ordered
witness journal makes its history. Exchange between agents runs over one
exchange chain (EAVT or Datom rows, settlement, ActivityPub, A2A, x402, UCAN)
in which the chain is the only durable home and actuators are ephemeral
(`semiotic-exchange-chain-services-section`).

## The service loop

The Leader's design statement (`AGENTS.md`, lines 24 to 39) gives the loop a
node runs. In semiotic computing each stage has this content.

| Leader's stage | MAPE-K stage | What it is in semiotic computing |
|---|---|---|
| paraconsistent transfinitely-valued data-monitoring | Monitor | Observations are recorded as predications in FOUR, so unobserved, false and contested are three different states; settling is a transfinite orbit. |
| content-addressed evidence-substrate analyzing | Analyze | A finding rests on evidence cells named by digest. The evidence substrate is the set of content-addressed witnesses; independence of channels is evidential (`kinetic-proofing`). |
| coordination-free deductive-truth planning | Plan | A plan is derived deductively from settled cells under a rule system that is monotone in the knowledge order, so nodes that hold the same evidence derive the same plan without coordinating (rule addition is substrate-local; scope composition is knowledge-order monotone). |
| database-proof executing | Execute | An act is carried out against the record and leaves a proof-bearing record: the receipt binding operation, input digests, output digests and assays (`realization-receipt`; `fabrication-fidelity`). |
| recursively-self-improving knowledge | Knowledge | The files are the knowledge; the loop's own operations are files in it and are revised through the loop (`semiotic-computer-agent-relations-system`; `leader-corrections-persist-into-method`). |

## Sources

- Leader, 2026-10-09 (`2026-10-09-note-recovering-the-fabrication-research.md`, section 2); `AGENTS.md` lines 24 to 39.
- `engineering-services-section/content/text/glossary/terms/{predicated-computer,semiotic-computer-machine,semiotic-computer-agent-relations-system}.md`.
- `engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/semiotic-computer-system-services-section/README.md`.
- `science-services-section/services/philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/terms/semiotic-system.md`.
- `.../information-science-services-section/services/math-services-section/content/text/glossary/terms/{bilattice,nuclear-quartet,paraconsistent-logic}.md`.
- `science-services-section/content/text/documents/articles/notes/2026/08/20/theory-of-flatfile-agentic-drone-resource-system-swarms-may-2026.md`, sections 2.1, 2.4, 2.5.
- `.../systems-engineering-science-services-section/content/text/glossary/terms/mape-k.md`.
- `engineering-services-section/.../agent-organization-engine/README.md`.
