---
id: flatfile-agential-resource-system-operation
description: "How Operations are encoded in a Flatfile Agential Resource System. Skill, Runbook, and Script are the three Entity files that carry Operations in FARS."
grounding: agential-relations-system-operation.md
component-of: FlatfileAgentialResourceSystem
date-created: 2026-03-18
date-modified: 2026-03-18
params:
  carrier: relational-universe
output: relational-universe-morphism
ast:
  operation-carrier:
    - carrier:
        - skill
        - runbook
        - script
title: FARS Operation
---

# FARS Operation

## What this is

In a [Flatfile Agential Resource System](../../../../flatfile-agential-resource-system.md), an [AgentialRelationsSystemOperation](../../../../../agential-relations-system/library/vocabulary/library/agential-relations-system-operation/agential-relations-system-operation.md) is carried by an [Entity](entity.md) file.

The three Entity files that carry Operations are [Skill](skills.md), [Runbook](runbook.md), and [Script](../../../../../../governance/rules/specifications/script.md).
A [Resource](../../../../../../../../../../../../../../../../../../information-science-services-section/content/text/glossary/terms/resource.md) is NOT an Operation — Resources make claims; Operations transform things.

## The three carriers

Each carrier encodes a different scope of Operation:

- [Skill](skills.md) — one unit of agent judgment; one Operation at the reasoning level.
- [Runbook](runbook.md) — a sequence of Operations; orchestration of multiple steps.
- [Script](../../../../../../governance/rules/specifications/script.md) — one atomic executable step; one Operation at the implementation level.

A Skill corresponds to a single nuclear quartet position and declares it via [closure-kind](../flatfile-agential-resource-system-closure-kind/flatfile-agential-resource-system-closure-kind.md).
A Runbook sequences Skills and other Operations without itself occupying a single position.
A Script implements one atomic transformation in executable form.

## Open questions
