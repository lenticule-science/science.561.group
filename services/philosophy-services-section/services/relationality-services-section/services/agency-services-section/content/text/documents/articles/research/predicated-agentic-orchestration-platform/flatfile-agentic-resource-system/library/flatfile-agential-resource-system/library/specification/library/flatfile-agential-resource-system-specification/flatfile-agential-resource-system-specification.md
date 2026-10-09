---
id: flatfile-agential-resource-system-specification
description: "The FARS encoding of a Specification: a markdown file with YAML frontmatter in the spec/ locale. Reference this spec when writing, locating, or validating a spec file in the Flatfile Agential Resource System."
describes: Specification
date-created: 2026-03-18
date-modified: 2026-03-18
title: flatfile-agential-resource-system-specification
---

# flatfile-agential-resource-system-specification

## What this is

This spec describes how a [Specification](../specification/specification.md) is encoded and stored in the Flatfile Agential Resource System.
In FARS, a Specification is a markdown [Resource](../../../../../../../../../../../../../../../../../../information-science-services-section/content/text/glossary/terms/resource.md) file living in the `spec/` locale.
It carries YAML frontmatter that identifies the concept being specified and declares the predicates that apply to it.

## File layout

Simple specifications with no colocated files live at `spec/{id}.md`.
A specification with colocated skills, runbooks, or scripts MUST live in a subdirectory:

```
spec/{id}/{id}.md
spec/{id}/skills/
spec/{id}/runbooks/
```

The directory name MUST equal the frontmatter `id` exactly.

## Encodings

### YAML frontmatter

Required keys:

| Key | Type | Value |
|-----|------|-------|
| `id` | kebab-case string | Unique within `spec/`. Filename MUST be `{id}.md`. |
| `description` | string, ≤200 chars | Two sentences: what it defines, when to reference it. |
| `date-created` | `YYYY-MM-DD` | Date the file was first written. Set once; never changed. |
| `date-modified` | `YYYY-MM-DD` | Date the file was last substantively changed. |

A spec that fully defines a type MUST carry:

| Key | Type | Value |
|-----|------|-------|
| `defines` | CamelCase string | The name of the type or concept this spec defines. |

A spec that characterizes a type without fully defining it MUST carry:

| Key | Type | Value |
|-----|------|-------|
| `describes` | CamelCase string | A related type this spec elaborates without fully defining. |

Optional keys:

| Key | Type | Value |
|-----|------|-------|
| `domain` | type expression | Input type, for specs defining a transformation or skill. |
| `codomain` | type expression | Output type, for specs defining a transformation or skill. |

No other frontmatter keys are permitted.
Unknown keys are a compliance violation.
Every key used in frontmatter MUST have a corresponding spec file in `spec/` — see [predicate](../predicate.md).

## Open questions

- Whether the required-sections shape (What this is / Topic sections / Encodings / Implementations / Open questions) should be enforced by a SHACL shape or checked only by the spec-compliance-check skill.
