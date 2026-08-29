---

description: Validate a file's frontmatter against the semiotic-markdown spec — returns structured errors and warnings
name: validate-frontmatter
version: [0, 1]
runtime: mcp
triggers:
  - "validate frontmatter"
  - "check frontmatter"
inputs:
  path: string
outputs:
  valid: boolean
  errors: string[]
  warnings: string[]
  fields_present: string[]
region:
  reads: ["content/"]
  writes: []
dependencies: []
scopes: []
part-of: technology/specifications/agential-semioverse-repository
---
Validate a file's frontmatter against semiotic-markdown conventions.

## MCP tool

`mcp__asr__validate_frontmatter`

## What it checks

- Required fields: `title`, `date-created`
- Recommended fields: `aliases`, `description`, `type`
- Deprecated fields: `date`, `created`, `updated`, `author`, `id`, `kind`
- Date format: ISO 8601
- Tag format: CamelCase

## Relationship to validate-thing

This skill does fast, mechanical validation. The `validate-thing` skill
(runtime: inference) does deeper semantic validation including checking
that the content matches its declared type and that references resolve.
