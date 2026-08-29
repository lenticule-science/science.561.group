---
name: workitem-record
description: A cell representing a unit of work the dispatch loop selects and assigns to a receiver. The polymorphic cell-form passed across every layer of the dispatch chain — its kind field controls routing; its skill field names the capability the receiver must advertise; kind-specific fields carry the payload.
category: kernel
fields: []
---

A workitem is the cell-form an episode of [work](work.md) takes as it flows through dispatch. It carries the minimum cells a dispatcher needs to route the work to a receiver and the minimum a receiver needs to perform it. The shape is layered: a small common header (`kind`, `skill`, `target`) plus kind-specific fields drawn from the four work-type specializations.

## Required cells

- `kind` — one of `process`, `procedure`, `derivation`, `inquiry`. Matches the four work-types from [`work`](work.md) and the four `closure-position:` values from `work/governance/rules/specifications/skill.md`. The kind field is what `dispatching-work` switches on to pick the kind-dispatcher.
- `skill` — kebab-case slug naming the capability the receiver must advertise. The dispatcher's match-rule walks the receiver pool for a receiver whose `provides-skill:` or `skills:` list contains this slug. For procedure/process kinds the receiver is the script of the named skill; for derivation/inquiry kinds the receiver is whichever model record's `skills:` list contains the slug.
- `target` — cell-id naming where the response cell should be written. The literal value `<inline>` means the response should be returned to the caller and not persisted by the dispatch chain itself.

## Kind-specific cells

For `kind: process` and `kind: procedure`:

- `parameters` — object passed as the single argument to the receiver script's default-exported function. Shape is determined by the receiver skill's input schema (see `skill.md` §157, contract derivation).

For `kind: derivation` and `kind: inquiry`:

- `prompt` — the textual prompt sent to the LLM model the picker selects.
- `maxTokens` — optional integer cap on the response length. Omitted means the receiver adapter's default applies.

## Optional cells across all kinds

- `created-at` — ISO 8601 timestamp the workitem was constructed. Set by the caller, preserved across hops.
- `prefer-receiver` — slug or path naming a receiver the caller would prefer the picker select. Advisory; the picker respects it only when the named receiver advertises the capability. Future cell, not yet honored by the picker.

## Relation to the workitem cell on disk

The workitem-record is the in-flight cell-shape — it crosses script boundaries as a JSON object. When a workitem is persisted to a queue, witness, or assignment record, it serializes to the same shape so the disk form and the in-flight form coincide. The machine-readable shape is at [`workitem.schema.json`](workitem.schema.json); the conformant dispatch chain's contract composer (`doing/working/hacking/doing/working/skills/serving-skills-over-mcp/scripts/_compose-skill-contract.mjs`) $refs this schema as the input shape of every `dispatching-*` skill that consumes a workitem.

## Relation to other forms

- The workitem's `kind` cell ranges over the four work-types in [`work`](work.md).
- The workitem's `skill` cell ranges over slugs registered in the skill catalog at `doing/working/hacking/doing/working/skills/<slug>/`, per [`skill.md`](../../work/governance/rules/specifications/skill.md).
- A workitem is routed by the [`dispatching`](../transformers/dispatching.md) transformer; the receiver picked by dispatch returns a response cell plus a [`dispatch-witness-record`](dispatch-witness-record.md).
