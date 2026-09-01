---
name: make-semiotic-specification
description: Create a new semiotic specification per semiotic-specification-specification
---

Create a semiotic specification: $ARGUMENTS

## What this skill does

Creates a new semiotic specification by:
1. Running the general make-specification scaffold
2. Adding semiotic-specific frontmatter and requirements
3. Registering the spec in the semiotic endeavor infrastructure

This skill wraps make-specification (the general scaffold) and adds
the semiotic layer defined by semiotic-specification-specification.

## Instructions

### 1. Parse arguments

From `$ARGUMENTS`, extract:
- **spec-id**: kebab-case identifier (e.g., `semiotic-citation`)
- **category**: `format` or `convention` (default: convention)
- **source material**: paths to triage files or existing docs that
  inform the spec's content

### 2. Run the general scaffold

```bash
cd content
python technology/specifications/specification-specification/scripts/scaffold-specification.py \
  SPEC_ID --category CATEGORY
```

This creates the general specification template with A.1-A.10 TODO
markers per specification-specification.

### 3. Add semiotic requirements

Open the scaffolded `index.md` and add semiotic-specific content
per semiotic-specification-specification:

**Frontmatter**: add these fields (per semiotic-specification-specification §1):
- `requires` MUST include paths to specifications this one depends on,
  including `../semiotic-specification/index.md` and
  `../semiotic-specification-specification/index.md`
- `part-of: technology/specifications`
- Tags SHOULD include `SemioticSpecification`

**Opening paragraph**: note that this is a semiotic specification
and reference both specification-specification and
semiotic-specification-specification for conformance.

**Naming convention** (per semiotic-specification-specification §4):
use the naming convention: term (the thing) → semiotic-term (the
convention) → semiotic-term-specification (the conformance
requirements). The spec-id MUST match the directory name.

**Normative language**: use MUST/SHOULD/MAY per semiotic-specification §2.

### 4. Read source material

If source material paths were provided, read each file. Extract:
- Key concepts and vocabulary
- Existing practices being codified
- Normative constraints already in use
- Terms that need glossary entries

Do NOT copy source material into the spec. The spec defines normative
rules; source material provides context for what those rules should be.

### 5. Fill the specification

Replace each TODO section following the guidance in make-specification
§4, with these semiotic additions:

**Relationship to other specs**: MUST list semiotic-specification,
semiotic-specification-specification, and
specification-specification as requirements.

### 6. Validate

Check against both specification-specification A.1-A.10 AND
semiotic-specification-specification §1-§5:
- [ ] A.1: Frontmatter has spec-id, version, stability
- [ ] A.3: Error semantics defined
- [ ] A.4: Conformance matrix present
- [ ] A.6: Security considerations noted
- [ ] A.10: Glossary and rationale present
- [ ] §1: Semiotic frontmatter (spec-id, stability, requires, part-of, type)
- [ ] §2: Semiotic-markdown compliance
- [ ] §4: Naming convention compliance (spec-id matches directory)
- [ ] (Format only) A.2, A.7, A.9

### 7. Register

Update these files to register the new semiotic spec:

1. **Conceptual dependency map** at
   `technology/specifications/agential-semioverse-repository/conceptual-dependency-map.md`:
   add a node and edges.

2. **Semiotic-endeavor specified aspects** at
   `technology/specifications/semiotic-endeavor/index.md`:
   add a row to the specified aspects table (if the spec defines an
   endeavor aspect) or remove from candidates table.

3. **Plan 0033** at
   `technology/specifications/agential-semioverse-repository/plans/0033-semiotic-specification-family.md`:
   update the log.

4. **Skill registry** at `.claude/skills/registry.md`:
   register any skills created by the new spec.

### 8. Report

State:
- The spec-id and title
- The file path
- How many normative sections were written
- What source material was used
- What registration was done
