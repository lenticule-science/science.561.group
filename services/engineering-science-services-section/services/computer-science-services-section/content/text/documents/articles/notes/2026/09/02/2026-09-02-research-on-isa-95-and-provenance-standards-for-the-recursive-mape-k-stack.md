---
title: "ISA-95, Purdue, and Causal-Lineage Standards for the Recursive MAPE-K Stack"
description: "Two external standards families the corpus lacked entirely (ISA-95/IEC 62264 with the Purdue reference model, and the PROV-O/OpenTelemetry/CloudEvents causal-lineage trio), stated plainly and then mapped, as interpretation, onto the house L0-L4 stack and metroplat's arrival pipeline."
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

A markdown-vault search this session for "ISA-95", "IEC 62264", "Purdue
reference model", "PROV-O", and "traceparent" returned zero matches across
every vault. Both standards families below answer questions this tree
already asks itself — what level of a control stack a component sits at,
and how one log event's causal lineage crosses service boundaries — so this
note states each standard plainly, sourced to its public specification,
before offering any house mapping. Every mapping section is labeled
interpretation; nothing here is a ruling.

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
through their touchpoints, with neither scale given a privileged channel
into the shared knowledge base (`2026-07-11-note-on-metroplat-system-
architecture-design.md` §5.32). MetroPlat's own README states the same
recursive commitment at the settlement level: "the intelligence lives in the
settlement, not the model" (README.md:10) — each settlement is the primary
object an outer loop observes, and is itself the record an inner loop would
regulate. Read against the table above, each sovereign settlement is its
own L0-L4 stack: its rows are its L0, its observers its L1, up to whatever
reads it as an L4 aggregate — itself one L0 row from the next settlement
out. ISA-95 does not itself specify recursive instantiation; the recursion
is the house's own commitment, stated independently at §5.32 and README.md:10.

## 2. Causal lineage for the log flow

Three public standards address who-caused-what across a distributed system:

- **W3C PROV-O** models provenance as a small set of RDF properties over
  Entities, Activities, and Agents: `prov:wasDerivedFrom` (one entity from
  another), `prov:wasGeneratedBy` (an entity from an activity),
  `prov:wasAttributedTo` (an entity to an agent), and `prov:wasInformedBy`
  (one activity informed by another — the activity-level causal edge).
- **W3C Trace Context** (which OpenTelemetry adopts as its wire format)
  defines the `traceparent` HTTP header: `version-trace-id-parent-id-flags`,
  where `trace-id` identifies the whole distributed trace and `parent-id`
  names the immediate causal predecessor span, letting independently-owned
  services propagate one causal chain without sharing a database.
- **CloudEvents 1.0** is an event-envelope format with required context
  attributes (`id`, `source`, `specversion`, `type`, plus optional ones) and
  an explicit extension-attribute mechanism for carrying additional
  producer-defined context alongside those.

Metroplat already codes CloudEvents: `cloudEventSchema`
(`apps/metroplat/src/lib/codecs/cloudevents/schema.mts`) requires
`specversion`/`id`/`source`/`type`/`time`/`datacontenttype`/`data`, allows
`additionalProperties: true` for extensions, and `cloudEventFromUtterance`
(`.../cloudevents/index.mts`) reads `source` as the house utterance's token
and `data` as its claim. Metroplat's arrival pipeline
(`apps/metroplat/src/rpc/arrival.mts:129-152`) already carries a causal
chain, but not through PROV or a `{subject, predicate, object}` triple: it
is an explicit `CausalSet` of seven named stage events (`observed →
decoded → cloudevent-admitted → packet-presented → utterance-projected →
recorded → processed`) linked by `{from, to}` pairs, closed by
`closeCausalSet` before the receipt is admitted (`admitCloudEventArrival`,
same file, lines 272-311). No `observation.causes` field, and no EAVT row
carrying a `follows` predicate, was found anywhere in the tree; EAVT's row
shape is `{e, a, v, t}` (`@red-cup-engineering/eavt`), not a
subject/predicate/object triple, so a causal edge in an EAVT trace is an
ordinary row whose attribute names the edge (e.g. `a: "follows"`).

**Correspondence.** PROV-O's `wasInformedBy` and OpenTelemetry's
`parent-id` both name the same thing metroplat's `CausalSet` links
already name explicitly: this stage-event followed that one. CloudEvents
is the wire face all three could ride on, since its context attributes
already carry `id`/`source`/`type`/`time` and its extension mechanism is
built to carry more.

**Recommendation for wire interop.** Add `traceparent` as a CloudEvents
extension attribute on metroplat's event envelope (alongside the existing
`emsenntruthcharge`), carrying the W3C trace-id/parent-id pair per arrival;
project a PROV-O `wasInformedBy` edge from it on read, rather than storing
PROV triples as the primary representation. This keeps the existing wire
format authoritative and treats PROV as a read-time lens over it —
consistent with the cloudevents module's own stated design, that
"CloudEvents is not a second communication ontology here" but a structured
face of one underlying object.

## 3. What the corpus already says

The house's own MAPE-K research note has already anticipated the multi-loop
and typed-knowledge questions this recursion raises, independent of ISA-95.
Its frontier 6, "distributed and multi-loop control," replaces one shared
knowledge store with a family `{K_t^i}` linked by communication and
synchronization morphisms across `n` managers, each with local knowledge,
observations, and actions. Its frontier 7, "the formal status of knowledge
itself," decomposes untyped `K` into a typed tuple `(M, G, H, B, A, Q)` —
models, goals, history, beliefs, action semantics, and confidence — each
evolving under different rules (`2026-07-11-research-on-mape-k.md` §4). A
recursive L0-L4 stack per settlement is one concrete instance of frontier
6's family `{K_t^i}`: each settlement's knowledge base is one `K_t^i`, and
what an outer settlement's L1 observes is the projection an inner
settlement's L4 already computes.
