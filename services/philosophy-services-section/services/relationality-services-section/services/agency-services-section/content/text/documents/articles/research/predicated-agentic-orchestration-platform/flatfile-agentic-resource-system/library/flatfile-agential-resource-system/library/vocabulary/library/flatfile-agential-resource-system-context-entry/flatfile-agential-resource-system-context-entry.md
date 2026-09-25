---
id: flatfile-agential-resource-system-context-entry
description: "The smallest indivisible entry in a locale context file; the concrete forms are Principle, MemoryEntry, Message, OperationItem, and Idea."
component-of: FlatfileAgentialResourceSystemLocale
date-modified: 2026-03-19
params:
  context-file: relational-universe
  concrete-form: relational-universe
output: relational-universe
ast:
  locale-fiber-element:
    - context-file
    - concrete-form:
        - principle
        - memory-entry
        - message
        - operation-item
        - idea
title: Flatfile Agential Resource System Context Entry
---

# Flatfile Agential Resource System Context Entry

## What it is

A **FlatfileAgentialResourceSystemContextEntry** is the smallest indivisible entry in a locale context file.
Each context file holds entries of one concrete form:

| File | Concrete form | Spec |
|------|--------------|------|
| `SOUL.md` | Principle | [principle](../../../../../../../../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/principle.md) |
| `MEMORY.md` | MemoryEntry | [flatfile-agential-resource-system-memory-entry](../flatfile-agential-resource-system-memory-entry/flatfile-agential-resource-system-memory-entry.md) |
| `INBOX.md` | Message | [flatfile-agential-resource-system-message](../flatfile-agential-resource-system-message/flatfile-agential-resource-system-message.md) |
| `PLANS.md` | OperationItem | [operation-item](../../../../../../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/operation-item.md) |
| `IDEAS.md` | Idea | [flatfile-agential-resource-system-idea](../flatfile-agential-resource-system-idea/flatfile-agential-resource-system-idea.md) |

A FlatfileAgentialResourceSystemContextEntry is identified by its heading within its file.
OperationItems and Ideas use numeric identifiers (for example, `### WI-3:`); Principles and MemoryEntries are identified by their heading text.

## What every FlatfileAgentialResourceSystemContextEntry has

Every FlatfileAgentialResourceSystemContextEntry MUST have:

- **A heading** that identifies it uniquely within its file
- **A body** containing at least the required fields for its concrete form

Every FlatfileAgentialResourceSystemContextEntry MAY have:

- **A status field** — required for OperationItem and Idea; absent for Principle and MemoryEntry
- **A why field** — provenance or motivation

A FlatfileAgentialResourceSystemContextEntry CANNOT encode information derivable from its position or file: the locale it belongs to, its concrete form, or its numeric sequence position.
Redundant encoding creates two sources of truth that can diverge.

## Concrete forms

See the individual specs for required fields and canonical format:

- [principle](../../../../../../../../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/principle.md) — a stable constraint on locale behavior
- [flatfile-agential-resource-system-memory-entry](../flatfile-agential-resource-system-memory-entry/flatfile-agential-resource-system-memory-entry.md) — a dated learned fact; append-only
- [flatfile-agential-resource-system-message](../flatfile-agential-resource-system-message/flatfile-agential-resource-system-message.md) — an inter-locale communication; has lifecycle status
- [operation-item](../../../../../../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/glossary/terms/operation-item.md) — a committed actionable task; has lifecycle status
- [flatfile-agential-resource-system-idea](../flatfile-agential-resource-system-idea/flatfile-agential-resource-system-idea.md) — an uncommitted potential work item; has lifecycle status

## Open questions
