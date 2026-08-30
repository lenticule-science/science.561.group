---
id: validate-educational-content
description: Validate educational content frontmatter against educational ASR rules
name: validate-educational-content
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "validate educational content"
  - "check educational frontmatter"
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
  reads: ["content/education/"]
  writes: []
dependencies: []
scopes: []
part-of: education/specifications/educational-agential-semioverse-repository
---
Validate educational content: $ARGUMENTS

## What this does

Checks educational content files against the rules defined in the [Educational ASR specification](../../index.md). This is the educational domain's equivalent of the general `/validate-content` skill, specialized for education's content types and relations.

## Validation rules by type

### lesson

| Rule | Severity | Check |
|---|---|---|
| `teaches:` present | Warning | Frontmatter field exists with ≥1 entry |
| `requires:` present or "none" stated | Warning | Frontmatter field exists OR body contains explicit "no prerequisites" statement |
| Worked example section | Error | Body contains a heading matching "worked example" or "walkthrough" (case-insensitive) |
| Exercises section | Error | Body contains a heading matching "check your understanding", "exercises", or "self-check" |
| Motivation before definition | Warning | First major concept is preceded by a "why it matters" or motivation section |
| Sources cited | Warning | At least one `[@citekey]` reference in body |

### curriculum

| Rule | Severity | Check |
|---|---|---|
| Links to existing lessons | Error | All lesson links resolve to files that exist |
| Scope statement | Warning | Body contains a heading or section addressing scope |
| `teaches:` present | Warning | Frontmatter field exists |

### skill (kind: learn)

| Rule | Severity | Check |
|---|---|---|
| Completion criteria section | Error | Body contains "what you will be able to do" or equivalent |
| Criteria are testable | Warning | Criteria use action verbs ("given X, do Y") not understanding verbs ("understand", "be familiar with") |
| Prerequisites section | Error | Body contains prerequisites section |
| Prerequisite skills exist | Error | All referenced skill paths resolve |
| Scope section | Warning | Body contains scope section |
| Verification section | Warning | Body contains verification section |
| Lessons linked | Error | At least one lesson linked |
| Lessons exist | Error | All lesson links resolve |

### term

| Rule | Severity | Check |
|---|---|---|
| `defines:` present | Error | Frontmatter field exists with ≥1 entry |
| Related terms section | Warning | Body contains "related terms" heading |
| `cites:` present | Warning | Frontmatter field exists or `[@citekey]` in body |

### school

| Rule | Severity | Check |
|---|---|---|
| Core claims section | Error | Body contains claims, commitments, or "common threads" section |
| Key texts/thinkers | Warning | Body names at least one person with a work title |
| Relationship to other traditions | Warning | Section present with links to other school pages |
| Critiques and limitations | Error | Section present |

### transmission-mode

| Rule | Severity | Check |
|---|---|---|
| `defines:` present | Error | Frontmatter field exists |
| Preserves/transforms described | Warning | Body addresses what the mode preserves and what it changes |
| Politics addressed | Warning | Body addresses whose knowledge the mode serves |

## How to run

Scan a specific path or all educational content:

```
# All education content
/validate-educational-content content/education/

# Specific discipline
/validate-educational-content content/education/disciplines/pedagogy/

# Specific type only
/validate-educational-content content/education/ --type lesson

# Errors only
/validate-educational-content content/education/ --errors-only
```

## Interpreting results

- **ERROR**: A MUST rule is violated. The content is ill-formed per the educational ASR. Fix before proceeding.
- **WARN**: A SHOULD rule is not met. The content is valid but could be improved.
- **INFO**: Informational finding (e.g., a skill with no dependents).

## How it differs from assess-pedagogical-soundness

`/validate-educational-content` checks structural rules (does the frontmatter have the right fields? do links resolve? are required sections present?). `/assess-pedagogical-soundness` checks pedagogical quality (does the content actually teach? does it reproduce the banking model?). They are complementary:
- Use `/validate-educational-content` for fast structural checks across many files.
- Use `/assess-pedagogical-soundness` for deep qualitative review of individual pages.
