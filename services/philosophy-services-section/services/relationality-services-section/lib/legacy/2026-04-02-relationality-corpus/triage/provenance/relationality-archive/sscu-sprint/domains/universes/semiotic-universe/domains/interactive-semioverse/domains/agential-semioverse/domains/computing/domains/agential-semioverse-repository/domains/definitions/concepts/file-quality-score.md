---

name: file-quality-score
date-created: 2026-03-07T00:00:00
introduces: concept
keywords:
  - content-quality
  - progressive-automation
  - agential-semioverse
description: "A computable measure of a file's observable relational density within the repository."
---

A file quality score is a computable measure of a file's observable
relational density within the repository. It answers the question:
how many relations does this file participate in?

## Grounding in quality

[Quality](../../../../general/terms/quality.md) is what becomes
observable about a thing through its relations. A file's quality is
therefore not intrinsic — it emerges from the file's relations to the
rest of the repository. A file with rich frontmatter, typed semantic
relations, structured body content, and incoming links from other files
has high observable relational density. A file with no frontmatter, no
links, and no connections has low density.

"Weakness" and "strength" name positions on this continuum. A weak
file has few observable relations. A strong file has many. These are
descriptive, not evaluative — a file may be weak because it is new, or
because it has not yet been enriched, or because its content genuinely
does not participate in many relations.

## Dimensions

The score is computed across three dimensions, each measuring a
different kind of relation.

### Dimension 1: Frontmatter completeness (0-7)

Frontmatter fields establish typed, machine-readable relations. Each
present field represents one kind of relation the file participates in.

| Field | Points | Relation expressed |
|---|---|---|
| `title` | 1 | self-identification |
| `date-created` | 1 | temporal placement |
| `type` (valid value) | 1 | classification |
| `tags` (3-5, CamelCase) | 1 | conceptual community membership |
| `description` | 1 | summarization |
| `authors` | 1 | provenance |
| any semantic relation field | 1 | typed dependency |

Semantic relation fields: `defines`, `cites`, `requires`, `teaches`,
`part-of`, `extends`, `questions`, `addresses`.

### Dimension 2: Body structure (0-4)

Body content establishes the file's internal coherence and its untyped
connections to other files.

| Check | Points | What it measures |
|---|---|---|
| non-empty body | 1 | the file says something |
| at least one heading | 1 | the content is structured |
| at least one markdown link | 1 | untyped connection to another file |
| no wikilinks | 1 | all connections are resolved |

### Dimension 3: Integration (0-3)

Integration measures the file's position in the network — whether
other files know about it.

| Check | Points | What it measures |
|---|---|---|
| at least one incoming link | 1 | another file references this one |
| at least 3 outgoing links | 1 | this file references others |
| parent directory has index.md | 1 | structural placement is documented |

### Total: 0-14

| Range | Label | Description |
|---|---|---|
| 0-3 | weak | few observable relations |
| 4-7 | developing | some structure, gaps remain |
| 8-11 | established | well-connected, minor gaps |
| 12-14 | strong | fully integrated |

## Computability

Dimensions 1 and 2 are fully mechanical — a script can compute them
by parsing frontmatter and scanning body content. Dimension 3 requires
an index of links across the repository, which can be built
mechanically but requires a full scan.

The score is designed so that the most impactful improvements (adding
frontmatter fields) are the easiest to automate. This follows
[policy 001](../../../../personal/projects/emsemioverse/policies/001-progressive-automation.md):
the weakest files need the least capable agents to improve.

## Relationship to skill maturity

The file improvement operations that increase the score follow the
[skill maturity](./skill-maturity.md) lifecycle:

- **Stage 1-2** (inference): semantic relation fields, body
  improvements, integration improvements
- **Stage 3** (delegable): description, tags, type classification
  via local model
- **Stage 4-5** (procedural/tool): date-created from git, deprecated
  field fixes, frontmatter normalization

The score itself is a stage 5 operation: fully mechanical, always
terminates, no inference needed.