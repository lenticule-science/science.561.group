---
name: validate-frontmatter
description: Validate a file's frontmatter against the semiotic-markdown spec — returns structured errors and warnings
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
