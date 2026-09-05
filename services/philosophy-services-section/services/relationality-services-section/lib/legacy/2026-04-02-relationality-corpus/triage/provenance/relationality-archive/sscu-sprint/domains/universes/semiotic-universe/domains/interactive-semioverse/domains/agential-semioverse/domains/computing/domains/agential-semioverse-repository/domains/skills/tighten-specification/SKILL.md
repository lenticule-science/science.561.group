---
name: tighten-specification
description: Find an underspecified part of the ASR, emsemioverse, or semiotic markdown and bring it closer to formal specification
---

Tighten specification: $ARGUMENTS

## What this skill does

Surveys existing specifications for gaps — things referenced but not
defined, things practiced but not specified, things specified but not
validated — and brings ONE gap closer to formal specification. The goal
is incremental tightening: each invocation closes one gap rather than
attempting comprehensive formalization.

## Instructions

### 1. Survey for gaps

If `$ARGUMENTS` names a scope (a spec file, a directory, or a topic like
"frontmatter" or "skills"), limit the survey to that scope. Otherwise,
survey the full specification surface.

**Read the specification files:**

```bash
# ASR specifications
find content/technology/specifications/agential-semioverse-repository -name "*.md" -type f | sort

# Semiotic markdown specifications
find content/technology/specifications/semiotic-markdown -name "*.md" -type f | sort

# Domain-specific ASR specs
find content/mathematics/specifications -name "*.md" -type f | sort
find content/philosophy/specifications -name "*.md" -type f | sort

# CLAUDE.md (operational spec)
cat CLAUDE.md
```

**Identify gaps by category:**

| Gap type | How to detect | Example |
|---|---|---|
| **Referenced but undefined** | A spec mentions a concept, field, or process by name but does not define it | "the closure operation" referenced in a skill but not specified as an ASR operation |
| **Practiced but unspecified** | Agent behavior or vault conventions that are followed consistently but not documented in any spec | Filename conventions (kebab-case) practiced everywhere but never formally specified |
| **Specified but unvalidated** | A spec defines rules but no validation script, SHACL shape, or check-skill enforces them | Frontmatter relation fields specified in semantic-frontmatter.md but no script validates them across the vault |
| **Inconsistently specified** | Two specs or two parts of the same spec give conflicting rules | CLAUDE.md and a skill disagreeing on a procedure |
| **Incomplete specification** | A spec has TODO markers, empty sections, or "planned" status | Theory documents marked as sketches |

**Search for evidence:**

```bash
# Find TODOs and planned items in specs
grep -rn 'TODO\|FIXME\|planned\|sketch\|stub\|TBD' content/technology/specifications/ --include="*.md"

# Find wikilinks in specs (unresolved references)
grep -rn '\[\[' content/technology/specifications/ --include="*.md"

# Find references to things that may not exist
grep -rn 'see \|defined in \|specified at ' content/technology/specifications/ --include="*.md"
```

### 2. Pick ONE gap

Select the gap that is:
1. **Most impactful** — closing it would make multiple other specs or
   skills more precise
2. **Most tractable** — it can be specified in this session without
   requiring new research or emsenn's input on philosophical questions
3. **Not in the pure mathematical layer** — the agent does not modify
   `content/mathematics/objects/universes/*/` unless explicitly asked

Present the chosen gap to emsenn:
- What the gap is
- Where it was found
- Why it matters (what depends on it)
- What the proposed specification would cover

Wait for confirmation before proceeding.

### 3. Write or improve the specification

After confirmation, write the specification. Follow these rules:

**If creating a new spec file:**
- Place it in the appropriate `specifications/` directory
- Use standard frontmatter: `title`, `date-created`, `type`, `tags`,
  `description`
- Add `authors: [claude]` (and `emsenn` if the spec codifies emsenn's
  existing practice)
- Write in PTGAE style
- Keep it short: a specification is a set of rules, not an essay.
  Prefer tables, lists, and examples over prose.

**If improving an existing spec:**
- Add yourself to `authors:` and set `date-updated:`
- Preserve the existing structure; add the missing parts
- Do not rewrite settled content

**Specification content should include:**
- **Scope**: what this spec governs
- **Rules**: numbered, testable rules (MUST/SHOULD/MAY)
- **Examples**: at least one conforming and one non-conforming example
- **Rationale**: one sentence on why the rule exists (not a paragraph)

### 4. Create or update validation

If the specification defines testable rules, create or update validation:

**For frontmatter rules:**
Update the validation script at
`content/technology/specifications/agential-semioverse-repository/scripts/validate-content.py`
to check the new rules, OR document the rules as additions to
`/validate-content`.

**For structural rules:**
Add checks to the relevant audit skill (`/audit-content-folders`,
`/audit-vault-references`, `/audit-technical-debt`).

**For skill rules:**
Update `/check-skill` to validate the new constraints.

**For formal rules:**
If the spec can be expressed as a SHACL shape, write a `.shapes.ttl`
file alongside the spec.

If validation is not feasible in this session, document what validation
is needed as a TODO in the spec file and note it in the report.

### 5. Update cross-references

If the new or updated spec affects other documents:
- Update the ASR index at
  `content/technology/specifications/agential-semioverse-repository/index.md`
  if a new spec was added
- Update CLAUDE.md if the spec changes operational rules
- Update skills that reference the specified behavior

### 6. Report

State:
- The gap that was closed
- The file(s) created or modified
- What validation was added (if any)
- What remains open (if the gap was only partially closed)
- Suggested next gaps to tighten (for future invocations)
