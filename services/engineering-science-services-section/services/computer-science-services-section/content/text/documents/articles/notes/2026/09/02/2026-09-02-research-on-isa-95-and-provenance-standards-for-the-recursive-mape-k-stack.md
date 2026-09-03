---
title: "ISA-95, Purdue, and Causal-Lineage Standards for the Recursive MAPE-K Stack"
description: "ISA-95/IEC 62264 and the Purdue reference model, new to the corpus, stated plainly and mapped as interpretation onto the house L0-L4 stack; plus a concrete wire-format recommendation for PROV-O/OpenTelemetry/CloudEvents causal lineage that builds on the corpus's existing PROV-O and CloudEvents treatments rather than introducing them."
date-created: 2026-09-02
type: research
name: 2026-09-02-research-on-isa-95-and-provenance-standards-for-the-recursive-mape-k-stack
authors:
  - claude-fable-5-1
keywords:
  - isa-95
  - iec-62264
  - purdue-reference-model
  - prov-o
  - opentelemetry
  - cloudevents
  - mape-k
---

A markdown-vault search this session for "ISA-95", "IEC 62264", and
"Purdue reference model" returned zero matches — §1's control-level model
is new to the corpus. PROV-O and CloudEvents are not: the 2026-08-20
research memo on articles as formal inspectable claim systems already
treats PROV-O formally (`Prov(x,y,r)`,
`wasDerivedFrom`/`wasAttributedTo`/`generatedBy`), and the MetroPlat
architecture note's §5.15/AD-37 already maps an admitted event's
`origin`/`address`/`time`/`causes` onto CloudEvents'
`source`/`subject`/`time` plus a causal-lineage extension attribute. §2 extends that correspondence with one wire-format recommendation. Every
mapping section is interpretation, not a ruling.

## 1. ISA-95 / IEC 62264 and the Purdue reference model

ANSI/ISA-95 (jointly published as IEC 62264, "Enterprise-control system
integration") is the standard for integrating enterprise business systems
with the manufacturing control systems beneath them. It defines five
functional levels, adapted from the earlier Purdue Enterprise Reference
Architecture (PERA):

- **Level 0** — the physical process itself: the actual manufacturing or
  physical activity being carried out.
- **Level 1** — sensing and manipulating the physical process: sensors and
  actuators, the basic control devices that read and act on Level 0 directly.
- **Level 2** — monitoring, supervisory control, and automated control of the
  process: SCADA/HMI/DCS functions that supervise Level 1 devices.
- **Level 3** — manufacturing operations management (MOM): the workflow that
  produces the desired end product — scheduling, dispatching, tracking,
  detailed production records — coordinating Level 2 activity toward a plan.
- **Level 4** — business planning and logistics: establishing the basic plant
  schedule, determining inventory and material requirements, and the other
  ERP-level functions that set the plan Level 3 executes.

Purdue's own diagram additionally names a Level 5 (the wider corporate/IT
network) and treats the Level 3/4 boundary as the conventional place to draw
a security demilitarized zone in industrial-control-system practice; ISA-95
proper is scoped to Levels 0-4.

### Interpretation: a mapping to the house stack

The following pairing is this note's own reading, not a house ruling:

| ISA-95 level | House analogue (interpretation) |
|---|---|
| L0 — physical process | EAVT rows and traces (`@red-cup-engineering/eavt`): the raw `{e,a,v,t}` assertions a running system deposits |
| L1 — sensing/manipulation | Harness hooks and observers: the code that turns a raw event into an admitted row |
| L2 — supervisory control | LAGOON's world fold: the Guile-resident map reading the Node-actuated trace, per `org-layering.md`'s Guile-maps/Node-actuates law |
| L3 — manufacturing operations management | Metroplat's work model — the `endeavor → campaign → project → plan → task → work-item` spine (`apps/metroplat/src/work/model.mts:30-38`), plus dispatch and milestones over it |
| L4 — business planning/logistics | ops.561.group readings: the control-plane view a person or office reads |

Each level here is doing the same job ISA-95 assigns it — L3 turns a plan
into scheduled, tracked work; L4 reads the aggregate for planning — but
nothing about ISA-95 required this particular five-way split; the parallel
is structural, offered because it already exists in the corpus's own
description of the stack.

### The recursion

The MetroPlat system architecture note states that MetroPlat instantiates
the Autonomic Computing Reference Architecture (ACRA; Kephart & Chess 2003)
"at two nested scales" — one managed element regulating its own settlement,
and an orchestrating autonomic manager regulating a set of such elements
through their touchpoints, neither scale given a privileged channel into
the shared knowledge base (`2026-07-11-note-on-metroplat-system-
architecture-design.md` §5.32). MetroPlat's README states the same
commitment at the settlement level: "the intelligence lives in the
settlement, not the model" (README.md:10) — each settlement is the primary
object an outer loop observes and itself the record an inner loop would
regulate. Read against the table above, each sovereign settlement is its
own L0-L4 stack: its rows are L0, its observers L1, up to whatever reads
it as an L4 aggregate — itself one L0 row from the next settlement out.
ISA-95 does not itself specify recursive instantiation; the recursion is
the house's own commitment, stated at §5.32 and README.md:10.

## 2. Causal lineage for the log flow

Three public standards address who-caused-what across a distributed system:

- **W3C PROV-O** models provenance as RDF properties over Entities,
  Activities, and Agents: `prov:wasDerivedFrom` (entity from entity),
  `prov:wasGeneratedBy` (entity from activity), `prov:wasAttributedTo`
  (entity to agent), and `prov:wasInformedBy` (activity from activity —
  the causal edge).
- **W3C Trace Context** (OpenTelemetry's wire format) defines the
  `traceparent` header: `version-trace-id-parent-id-flags`, where
  `trace-id` identifies the trace and `parent-id` names the causal
  predecessor span, letting independent services propagate one causal
  chain without sharing a database.
- **CloudEvents 1.0** is an event-envelope format with required context
  attributes (`id`, `source`, `specversion`, `type`, plus optional ones)
  and an extension-attribute mechanism for producer-defined context.

Metroplat already codes CloudEvents — `cloudEventSchema`
(`apps/metroplat/src/lib/codecs/cloudevents/schema.mts`) requires
`specversion`/`id`/`source`/`type`/`time`/`datacontenttype`/`data` and
allows `additionalProperties: true` for extensions; `cloudEventFromUtterance`
(`.../cloudevents/index.mts`) reads `source` as the utterance's token and
`data` as its claim. Metroplat's arrival pipeline
(`apps/metroplat/src/rpc/arrival.mts:129-152`) already carries a causal
chain as an explicit `CausalSet` of seven named stage events (`observed →
decoded → cloudevent-admitted → packet-presented → utterance-projected →
recorded → processed`) linked by `{from, to}` pairs, closed by
`closeCausalSet` before the receipt is admitted (`admitCloudEventArrival`,
same file, lines 272-311). Metroplat's journal layer carries a comparable
field directly — `JournalObservation.causes: readonly string[]`
(`src/journal/event.mts`), an observation's direct causal predecessors by
witness reference. `@red-cup-engineering/semantic-record-journal-service`
carries a related, distinct primitive: `record()`'s optional `relation`
is `{subject, predicate, object}`, admitted as a SEAVT claim via
`seavt(...)` — a general triple, not `causes`, and not EAVT's own
`{e, a, v, t}` row shape (`@red-cup-engineering/eavt`). A causal edge in a
plain EAVT trace is therefore an ordinary row whose attribute names the
edge (e.g. `a: "follows"`).

**Correspondence.** PROV-O's `wasInformedBy` and OpenTelemetry's
`parent-id` name what metroplat's `CausalSet` links already name: this
stage-event followed that one — not new, since the MetroPlat architecture
note's §5.15 already states it for the admitted-event case (`causes` maps
onto "a causal-lineage extension attribute" on CloudEvents) and AD-37
names CloudEvents as this boundary's one standard protocol. CloudEvents is
the wire face all three could ride, its context attributes already
carrying `id`/`source`/`type`/`time` with room for more via extension.

**Recommendation for wire interop.** Add `traceparent` as that
causal-lineage extension attribute (alongside `emsenntruthcharge`),
carrying the W3C trace-id/parent-id pair per arrival; project a PROV-O
`wasInformedBy` edge from it on read rather than storing PROV triples
primarily — a concrete field for what §5.15 already specifies, not a new
wire decision, keeping CloudEvents authoritative with PROV as a
read-time lens, per the cloudevents module's own design: "CloudEvents is
not a second communication ontology here" but a structured face of one
underlying object.

## 3. What the corpus already says

The house's own MAPE-K research note already anticipates the multi-loop
and typed-knowledge questions this recursion raises, independent of
ISA-95. Its frontier 6, "distributed and multi-loop control," replaces one
shared knowledge store with a family `{K_t^i}` linked by communication and
synchronization morphisms across `n` managers, each with local knowledge,
observations, and actions. Its frontier 7, "the formal status of knowledge
itself," decomposes untyped `K` into a typed tuple `(M, G, H, B, A, Q)` —
models, goals, history, beliefs, action semantics, confidence — each
evolving under different rules (`2026-07-11-research-on-mape-k.md` §4). A
recursive L0-L4 stack per settlement is one instance of frontier 6's
`{K_t^i}`: each settlement's knowledge base is one `K_t^i`, and an outer
settlement's L1 observation is the projection an inner settlement's L4
already computes.
