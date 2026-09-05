---
id: audit-technical-debt
description: "Identify and report technical debt across the repository: missing indexes, broken references, incomplete frontmatter, missing skills, undocumented conventions"
name: audit-technical-debt
version: [0, 1]
type: operational
runtime: inference
triggers:
  - "audit technical debt"
  - "find technical debt"
  - "what needs fixing"
  - "check debt"
inputs:
  scope: string?
outputs:
  categories: object
  total_items: number
  priority_items: string[]
region:
  reads: ["content/", ".claude/"]
  writes: []
dependencies:
  - audit-vault-references
  - audit-content-folders
  - validate-content
  - check-skill
scopes: []
part-of: technology/specifications/agential-semioverse-repository
---
Audit technical debt: $ARGUMENTS

## What this does

Surveys the repository for accumulated technical debt and produces a
categorized report. Technical debt is work that was deferred, done
incompletely, or done in a way that needs revision. This skill does not
fix anything — it identifies and prioritizes.

## Categories to check

Run each category's check and collect results. If `$ARGUMENTS` names a
scope (a path or category name), limit the audit to that scope.

### 1. Structural debt

Missing `index.md` files, directories that violate the standard
discipline structure, loose `.md` files at discipline roots.

```bash
find content -mindepth 1 -maxdepth 3 -type d ! -path "*/\.*" ! -path "*/private*" ! -path "*/triage*" ! -path "*/slop*" ! -path "*/meta*" ! -path "*/tags*" ! -path "*/assets*" | sort | while read d; do [ ! -f "$d/index.md" ] && echo "missing index: $d"; done
```

### 2. Reference debt

Broken internal links (wikilinks and markdown links that do not resolve).
Run `/audit-vault-references` if the colocated script exists, or scan
with grep:

```bash
grep -rn '$$$$' content/ --include="*.md" | grep -v 'private/' | grep -v 'triage/' | head -30
```

### 3. Frontmatter debt

Missing required fields, inconsistent types, undeclared relations. Run
the content validation script:

```bash
python content/technology/specifications/agential-semioverse-repository/scripts/validate-content.py --errors-only --repo-root .
```

### 4. Skill debt

Skills that are missing, incomplete, or out of date. Run `/check-skill --all`
or manually check:

```bash
python content/technology/specifications/agential-semioverse-repository/scripts/validate-manifest.py --repo-root .
```

Also check for recurring manual operations that should be skills but are
not yet formalized.

### 5. Documentation debt

Conventions that are practiced but not documented in CLAUDE.md, ASR
specs, or skills. Identify by looking for patterns in recent commits or
working notes that reference undocumented rules.

### 6. Content debt

Pages that are stubs (fewer than two sentences of body content beyond
frontmatter), pages with `TODO` or `FIXME` markers, pages in `slop/`
that have been superseded by published content.

```bash
grep -rn 'TODO\|FIXME\|HACK\|XXX' content/ --include="*.md" | grep -v 'private/' | grep -v 'triage/' | grep -v 'slop/'
```

## Reporting

Present results as a categorized summary:

```
## Technical Debt Audit

### Structural (N items)
- missing index: content/path/to/dir

### References (N items)
- broken link: file.md:line → target

### Frontmatter (N items)
- error: file.md — missing required field

### Skills (N items)
- warning: skill-name — check 3 failed

### Documentation (N items)
- undocumented: convention description

### Content (N items)
- stub: file.md (1 sentence)
```

After presenting, ask emsenn which category to address first. Do not
fix anything without explicit instruction.
