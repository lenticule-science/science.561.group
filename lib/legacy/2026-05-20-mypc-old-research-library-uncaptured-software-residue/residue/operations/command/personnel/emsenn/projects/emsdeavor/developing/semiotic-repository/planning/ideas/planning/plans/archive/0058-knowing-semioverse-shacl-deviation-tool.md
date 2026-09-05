---
title: "Plan 0058: Knowing-semioverse SHACL deviation measurement tool [SUPERSEDED]"
date-created: 2026-03-09T00:00:00
authors:
  - emsenn
  - claude
type: plan
status: superseded
superseded-by: "0059-standards-deviation-measurement.md"
priority: medium
keywords:
  - SHACL
  - Validation
  - KnowingSemioverse
  - Repository
---

## Goal

Produce a tool that walks the physical repository, measures how much
each file and directory deviates from the knowing-semioverse standard,
and outputs a ranked list of most-deviant items with actionable reasons.

This tool validates the REPOSITORY (files on disk) against the
knowing-semioverse standard (decision 0010: repository = files on
disk). It does not validate endeavor-layer concerns (plan health,
policy conformance).

## Location

All artifacts for this plan live at:
`information/disciplines/knowledge-systems/standards/knowing-semioverse/`
— alongside the standard being validated, per the created-here
principle.

## Standing rules

- Exclude triage/, private/, .obsidian/ from all file walks
- Do not move files — this tool measures; plan 0057 corrects
- Use pyshacl for SHACL validation (already in Python ecosystem)
- Scripts go in knowing-semioverse/scripts/
- Shapes go in knowing-semioverse/ as ontology.ttl and shapes.ttl

## Phases

### Phase 0 — Deviation model

Define the rules precisely before encoding them.

**Mechanical rules (SHACL-expressible):**

| Rule | Severity | Description |
|------|----------|-------------|
| type-directory match | Critical | File with `type: term` must be in a `terms/` directory; same for concept, text, specification, skill, index |
| part-of accuracy | High | `part-of` field must match the file's actual path (modulo known aliases) |
| required fields | Medium | All files must have title, date-created, type |
| recommended fields | Low | description, authors recommended |

**Structural rules (directory-level):**

| Rule | Severity | Description |
|------|----------|-------------|
| Standard dir naming | High | Directories named `curricula/` should be `learning/`; `texts/research/` → `researching/` |
| Orphan directories | Low | Empty directories with no index.md |

**Inference rules (phase B, not in this plan):**
- Depth float: file is at a higher level than its content warrants
- These require LLM-assisted evaluation and are deferred

### Phase 1 — SHACL shapes

Write the formal expression of the knowing-semioverse standard:

**`knowing-semioverse/ontology.ttl`**
- Define the 12 directory types as OWL classes
- Define `asr:inDirectory` property (file→directory type)
- Define `asr:declaredType` property (file→frontmatter type value)
- Map frontmatter type values to expected directory classes

**`knowing-semioverse/shapes.ttl`**
- NodeShape: files with `type: term` MUST be in `terms/` directory
- NodeShape: files with `type: concept` MUST be in `concepts/` directory
- NodeShape: `part-of` field MUST be resolvable to an ancestor path
- PropertyShape: required fields (title, date-created, type)
- PropertyShape: deprecated field detection (curricula → learning)

Reference existing shape pattern from:
`mathematics/.../specifications/mathematical-agential-semioverse-repository/shapes.ttl`

### Phase 2 — Serializer

**`knowing-semioverse/scripts/serialize-repo.py`**

Walk content/ (excluding triage/, private/, .obsidian/):
- Parse YAML frontmatter from each .md file
- For each file, emit RDF triples:
  - `<file-uri> rdf:type asr:RepositoryFile`
  - `<file-uri> asr:path "<relative-path>"`
  - `<file-uri> asr:declaredType "<type-value>"`
  - `<file-uri> asr:partOf "<part-of-value>"`
  - `<file-uri> asr:inDirectory asr:<directory-type>` (inferred from path)
  - `<file-uri> dc:title "<title>"`
  - etc.
- Output: `repo-snapshot.ttl`

Design principle: minimal dependencies, no external RDF library
required for parsing (write simple Turtle directly).

### Phase 3 — Validator and scorer

**`knowing-semioverse/scripts/measure-deviation.py`**

1. Run serialize-repo.py → repo-snapshot.ttl
2. Load knowing-semioverse ontology.ttl + shapes.ttl
3. Run pyshacl validation
4. Collect all violations
5. Score each file: sum of (severity weights × violation count)
   - Critical: 10 points
   - High: 5 points
   - Medium: 2 points
   - Low: 1 point
6. Output two files:
   - `deviation-report.json` — machine-readable, full violation list
   - `deviation-report.md` — human-readable, sorted by score descending,
     top 50 most deviant files with reasons

### Phase 4 — Skill

**`knowing-semioverse/skills/measure-deviation/SKILL.md`**

Runtime: script (invokes measure-deviation.py)
Outputs: deviation-report.json, deviation-report.md
Region reads: content/ (full repository)
Region writes: knowing-semioverse/scripts/output/

### Phase B (future plan) — Depth-float detection

Requires LLM-assisted evaluation: given a file's content and its
current location, is it floating higher in the taxonomy than it
should be? Deferred to a follow-on plan.

## Dependencies

- pyshacl (pip install pyshacl)
- Python 3.x (already present)
- knowing-semioverse standard must be at least draft stability
  (it is, as of 2026-03-09)

## Success criteria

- Running measure-deviation.py produces a ranked list of most-deviant
  files with actionable violation descriptions
- The shapes.ttl formally expresses the knowing-semioverse standard
  (machine-readable conformance, not just prose)
- A subsequent relocation sweep (plan 0057 or successor) can use the
  output as its work queue

## Log

2026-03-09 — Plan created. Phases 0 and 1 (deviation model and
shapes) are the next work. Serializer can proceed immediately after.
