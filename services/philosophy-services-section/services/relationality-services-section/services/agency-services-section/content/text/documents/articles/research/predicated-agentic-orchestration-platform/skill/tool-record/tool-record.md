---
type: definition
class: substrate-entity
realizes: [settlement-path, formality-layer]
depends-on: [skill-record, settlement-path]
see-also: [instinct-record, observation-record]
title: Tool record
description: "A tool record is the fourth and most-settled stage of the settlement path: a substrate-entity declaring a deterministic, in-substrate procedure — a sequence of closure-rule applications, graph operators, or scripted actions performed…"
---

# Tool record

A **tool record** is the fourth and most-settled stage of the [settlement path](teaching/explanations/settlement-path.md): a substrate-entity declaring a *deterministic, in-substrate procedure* — a sequence of [closure-rule applications](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/closure-rule-application.md), graph operators, or scripted actions performed without inference.
A tool is what a [skill](teaching/explanations/skill.md) consolidates into when its body has stabilized enough to settle.

## Structural fields

- **`id`** — kebab-case identifier.
- **`description`** — one-line summary of what the tool does.
- **`closure-kind`** — `process`.
  (The tool performs a process, not a procedure or derivation.)
- **`derived-from`** — references to the [skill record](skill-record.md) (or skills) the tool was consolidated from.
  Required for [provenance](../../teaching/explanations/provenance.md).
- **`inputs`** — references to shape entities declaring the tool's required inputs.
- **`outputs`** — references to shape entities declaring the tool's produced outputs.
- **`body`** — the deterministic substrate operations the tool performs.
  Unlike a skill's body (which may be inference-bearing), a tool's body is *strictly* a sequence of substrate operations — closure-rule applications, graph traversals, primitive insertions/retractions, content-addressed-store reads/writes — with no inference component.
- **`witness-format`** — reference to the witness shape the tool produces.
- **`scope`** — the scopes within which the tool is admissible.
- **`required-powers`** — typically inherited from the consolidated skill, possibly more permissive (a settled tool may be admitted to scopes its underlying skill required higher authorization for, given the tool's deterministic guarantees).
- **`formality`** — declaration that the tool operates at the [F3 formality layer](../../scope/formality-layer/formality-layer.md) — substrate-deterministic, near-zero inference cost.

## Invariants

- **Strictly deterministic body.** The tool's body invokes only substrate primitives and other tools; it does not invoke inference-bearing skills.
  The substrate's validation checks the body's reachable-from references.
- **Witness reproducibility.** Two invocations of the tool on byte-identical inputs produce byte-identical witnesses (per [determinism](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/determinism.md)).
- **Cost claim verifiable.** The tool's declared formality (F3 — near-zero inference) is checkable: the substrate's measurement can record the tool's actual cost-per-invocation and flag drift.

## Operations

- *Consolidate.* A [closure rule](../../teaching/explanations/closure-rule.md) (or a governance-bound substrate operation) reads a stable [skill record](skill-record.md) and produces the corresponding tool record.
  The consolidation is admissible only when the skill's body has been reduced to substrate-only operations; an inference-bearing skill cannot be consolidated to a tool without first being refined.
- *Invoke.* A tool invocation is a substrate operation with no inference cost.
  The invocation produces a [witness](../../teaching/explanations/witness.md) like any other operator; replay reproduces the witness exactly.
- *Retire.* When a tool's underlying claims are superseded (by a refined skill, a different consolidation, a substrate-vocabulary change), the tool is retired; its predications remain for audit but new invocations are blocked.

## Position in the platform

Tool records are the platform's *settled engineering*: the deterministic capabilities the substrate carries, repeatedly invocable without inference.
The platform's economy depends on production of tools — every observation that becomes an instinct that becomes a skill that becomes a tool is a movement of cost from F0 (frontier-model inference) to F3 (substrate-deterministic), per the [formality-layer](../../scope/formality-layer/formality-layer.md) discipline.

A platform with many tools is a platform that has done a lot of substrate-recorded learning.
A platform with no tools — or only externally-defined tools the substrate cannot see — is a platform whose F3 capabilities are out-of-band, breaking the [agential self-generation](../../agent/agential-self-generation/agential-self-generation.md) discipline at the deterministic-capability layer.
