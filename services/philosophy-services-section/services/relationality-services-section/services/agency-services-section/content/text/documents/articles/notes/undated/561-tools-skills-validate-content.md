---

description: Validate content frontmatter against domain-specific ASR rules
name: validate-content
version: [0, 1]
runtime: script
triggers:
  - "validate content"
  - "check frontmatter"
  - "run content validation"
inputs:
  path: string?
  type: string?
  errors-only: boolean?
outputs:
  passed: boolean
  total_scanned: number
  errors: number
  warnings: number
region:
  reads: ["content/"]
  writes: []
dependencies: []
scopes: []
part-of: technology/specifications/agential-semioverse-repository
title: validate-content
---
Validate content frontmatter: $ARGUMENTS

## What this does

Checks content files against the rules defined in domain-specific ASR
specifications:

- **Mathematical ASR** (`mathematics/specifications/mathematical-agential-semioverse-repository/`):
  definitions MUST have `defines:`, axioms MUST NOT have `proven-by:`,
  theorems MUST have `proven-by:`, notation scoping within `requires:` chains.

- **Philosophical ASR** (`philosophy/specifications/philosophical-agential-semioverse-repository/`):
  arguments MUST have `supports:`, objections MUST have `targets:`,
  responses MUST have `addresses:`.

- **Educational ASR** (`education/specifications/educational-agential-semioverse-repository/`):
  lessons MUST have worked examples and exercises, learn skills MUST have
  testable completion criteria, school pages MUST have critiques sections,
  term pages MUST have `defines:`.

- **General**: `requires:` and `extends:` paths resolve, no self-references,
  required fields (`title`, `date-created`) present.

## How to run

The validation script is at:
`content/technology/specifications/agential-semioverse-repository/scripts/validate-content.py`

```bash
# Validate all content
python scripts/validate-content.py --repo-root .

# Validate a specific subtree
python scripts/validate-content.py content/mathematics/ --repo-root .

# Only one content type
python scripts/validate-content.py --type definition --repo-root .

# Only errors (no warnings)
python scripts/validate-content.py --errors-only --repo-root .

# Machine-readable output
python scripts/validate-content.py --json --repo-root .
```

## When to use

Run after:
1. Enriching content with domain-specific frontmatter (via `/enrich-mathematical-content` or `/enrich-philosophical-content`)
2. Changing content types
3. Adding or modifying `requires:`, `extends:`, or `notation:` fields
4. Bulk operations that modify frontmatter

## How it differs from validate-thing

`/validate-thing` validates a single item against SHACL shapes (requires
RDF generation first). `/validate-content` validates frontmatter against
domain spec rules at scale without RDF. They are complementary:
- Use `/validate-content` for fast, broad checks across many files
- Use `/validate-thing` for deep, formal validation of one item

## Interpreting results

- **ERROR**: a MUST rule is violated. The content is ill-formed or mistyped
  per its domain spec. Fix before proceeding.
- **WARN**: a SHOULD rule is not met. The content is valid but could be
  improved (e.g., a definition without `notation:`).
- **INFO**: informational (e.g., a conceptual prerequisite in `requires:`
  rather than a file path).
