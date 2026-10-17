---
title: "Office / officer / persona split — three entity types where today there is one"
specialization: plan
date-created: 2026-04-30
horizon: month
work-type: procedure
serves: [operations-loop, library-as-knowledge-base]
depends-on: [operational-records-as-dag]
contributes-to: [agent-governance-enrichment]
produces: queryable-incumbency-records
status: draft
---

Today an "agent" file conflates three distinct things from the formal office model (`library/.../work/terms/office.md`, `library/.../work/texts/formal-structure-of-office.md`):

- **Office** — the normative position, defined by `(P, A, D_O, I^+)`: the structure, action domain, deontic profile, installation morphism.
  Persists across holders.
  The body politic.
- **Agent** — the Claude (or local-model) configuration that fills the office: model tier, tool list, system prompt, jurisdiction.
  The mechanism by which a body natural performs the office's duties.
- **Officer / incumbent** — the named identity currently invested in the office.
  The body natural at this moment.
  Calder Underhill currently holds first-officer; Cassia Lorne currently holds diviner.

The collapse means we cannot answer "who currently holds office X" or "what dignitas does this incumbency claim have" — both questions the formal model says are first-class.

## Tasks

- `split-create-command-offices-namespace` — create `command/offices/triage/` namespace; office files describe the position, deontic profile, installation conditions; each file has `kind: office`
- `split-create-command-officers-namespace` — create `command/officers/triage/` namespace; officer files are thin records linking persona → office with installation date and event reference
- `split-extract-office-fields-from-current-agents` — for each command/agents/triage/<X>/, copy the deontic profile + duties subdirs to command/offices/triage/<X>/; leave the model + tools + jurisdiction in the agent file
- `split-link-existing-personas-as-officers` — `engineering/personas/triage/cassia-lorne.md` already has `office: diviner` — convert this to `holds-office: diviner` and create a corresponding officer record
- `split-update-dispatch-script-for-three-entities` — `dispatch.py` resolves office → agent (the one that fills it) → officer (the persona currently invested); the eligibility check is on the office's deontic profile, the dispatch target is the agent
- `split-document-when-to-merge-vs-split` — write a guideline: for offices with a single permanent incumbent (researcher), keep merged; for offices that can be filled by different personas across sessions (first-officer ↔ Calder), split

## Acceptance

- A query like "who currently holds first-officer" returns "calder-underhill" via the officer record
- A query like "what dignitas-grade does Calder's first-officer claim have" can be expressed (recognition predicate + induction predicate state) — even if the answer is "we don't track this yet"
- Vacating an office (relief) becomes a recordable event; the office persists; the dispatch can detect "office vacant — no eligible incumbent"

## Open question

Should agent files merge into office files (one entity per role, with embedded model/tool config) or stay separate (one office, one or more agent configs that fill it across model versions)?
The 561 architecture text suggests the latter — different model tiers (haiku/sonnet/opus) for the same office under different load conditions.
But that's a future-proofing concern, not a present need.
Decide as part of `split-document-when-to-merge-vs-split`.
