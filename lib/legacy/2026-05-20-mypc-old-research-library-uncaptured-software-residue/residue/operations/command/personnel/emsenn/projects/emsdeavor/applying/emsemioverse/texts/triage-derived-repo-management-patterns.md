---
title: "Repository management patterns derived from triage specifications"
date-created: 2026-03-07T00:00:00
authors:
  - claude
type: text
keywords:
  - AgentialSemioverse
  - Governance
  - ProjectManagement
  - RepositoryManagement
description: "Policy advisory report extracting repository management ideas from emsenn's triage specifications (CCE, RTL, HTM, act structure, collapse dynamics)."
cites:
  - triage/Untitled 13
  - triage/Untitled 14
  - triage/Untitled 15
  - triage/Untitled 16
  - triage/Untitled 17
  - triage/Untitled 24
---

## Executive summary

emsenn's triage directory contains two kinds of governance-relevant
material:

1. **Ready-to-promote specifications** in \`triage/engine/contracts/\`
   and \`triage/specifications/\` — actual specs for Semiotic Markdown,
   Semiotic Git, typed knowledge graphs, intake pipelines, baseline
   renewal, policy enforcement, and a spec-spec. These are not
   patterns to extract; they are specifications emsenn already wrote
   that should be promoted from triage to the ASR.

2. **Architectural patterns** in the CCE, RTL, HTM, act structure,
   and collapse dynamics specs — computation and organization ideas
   applicable to repository management.

This report covers both. Part I describes the ready-to-promote
specs. Part II extracts patterns from the computational specs.

## Part I: Specifications to promote from triage

These specifications in \`triage/engine/contracts/\` and
\`triage/specifications/\` are directly about managing a repository
of markdown files. They should be promoted to the ASR specification
directory.

### Semiotic Markdown (SMD)

**Source**: \`triage/engine/contracts/semiotic-markdown/\`

A full document format spec: deterministic slugification (Unicode
NFD, strip marks, lowercase, collapse hyphens), a frontmatter
schema (\`type\`, \`status\`, \`tags\`, \`aliases\`, \`subjects\`, \`facts\`),
wikilink/transclusion/callout/citation extraction, and a canonical
\`DocumentRecord\` model. Every document has a derivable identity
(\`doc_id\` from slug of filename) and a deterministic extraction
into structured data.

**Recommendation**: Promote to ASR spec. This IS the content format
specification.

### Semiotic Git

**Source**: \`triage/engine/contracts/semiotic-git/\`

Git modeled as a Heyting algebra of ancestry cones. Annotated tags
mark necessity/stability boundaries. Version control is not just
history but a logical structure where tagged commits define modal
boundaries (what is necessary vs. contingent).

**Recommendation**: Promote to ASR spec. Informs how git is used
for governance (tagging stability, treating commits as provenance).

### Semiotic Repository (\`semantics.yaml\`)

**Source**: \`triage/engine/contracts/semiotic-repository/\`

Every repository declares a \`kind\` field that selects which operator
families apply. The repo itself has a typed identity that determines
what operations are valid on it.

**Recommendation**: Promote to ASR spec. This is the meta-identity
of the repository.

### Spec-spec

**Source**: \`triage/engine/contracts/spec-spec/\`

A meta-specification for how specifications themselves should be
written — versioning, canonicalization, error schemas, conformance
matrices. Specifications about specifications as a governance layer.

**Recommendation**: Promote to ASR spec. Governs how all other
specs are written.

### Typed Knowledge Graph

**Source**: \`triage/specifications/knowledge-graph.md\`

Content linked via a controlled vocabulary of edge types: \`citation\`,
\`expands-on\`, \`contradicts\`, \`part-of\`, \`version-of\`. Not just
markdown links but typed relationships between documents.

**Recommendation**: Promote to ASR spec. Extends the current
\`cites:\` frontmatter pattern to a full typed relation vocabulary.

### Traceability DAG

**Source**: \`triage/specifications/traceability-graph.md\`

Build a dependency graph from frontmatter \`depends_on\` fields,
validate for cycles and orphans, compute impact sets. Structural
validation of the repository as a graph.

**Recommendation**: Promote to ASR spec. Complements the predicate
graph.

### Intake Pipeline

**Source**: \`triage/specifications/intake-stack.md\`

New content enters through normalization, validation, context
seeding, and emission. Content has a defined entry process, not
ad-hoc file creation.

**Recommendation**: Promote to ASR spec. Formalizes triage
processing.

### Baseline Renewal

**Source**: \`triage/specifications/baseline-renewal.md\`

Content maturity modeled as convergence — when edit velocity drops
below a threshold, the document has stabilized. Automated detection
of when content is "done" based on edit frequency.

**Recommendation**: Promote to ASR spec. Operationalizes the
closure/stability concept.

### Policy Enforcement Hooks

**Source**: \`triage/specifications/policy.md\`

Hooks that enforce constraints on repository operations — pre-commit
validation, post-merge checks. Governance as code, not as
documentation.

**Recommendation**: Promote to ASR spec. This is plan 0003's
endgame — machine-enforced policies.

### Audit/Provenance

**Source**: \`triage/specifications/audit.md\`

Every transformation of content is logged with provenance — who
changed what, when, and why as a first-class concern.

**Recommendation**: Promote to ASR spec.

### Semiotic GitHub

**Source**: \`triage/engine/contracts/semiotic-github/\`

CI/CD as provenance-bearing semiotic interactions — every GitHub
action is a witnessed transformation of the repository state.

**Recommendation**: Promote to ASR spec.

### Additional notable specs

- **Information Engine Pipeline**
  (\`triage/specifications/information-engine.md\`): Canonical
  pipeline pattern for content processing.
- **Storage Snapshots** (\`triage/specifications/storage.md\`):
  Point-in-time views of repository state.
- **ActivityPub Publication**
  (\`triage/specifications/activitypub.md\`): External publication as
  functors from internal to external representation.
- **Job Orchestrator**
  (\`triage/computer-architecture/job-orchestrator.md\`): Complex
  operations decomposed into DAGs of steps.
- **Data Catalog**
  (\`triage/computer-architecture/data-catalog.md\`): Metadata,
  lineage, and usage tracking for all content.

### emsenn's explicit design note

**Source**: \`triage/computer-architecture/Personal Log, Wednesday, June 6 2025.md\`

emsenn wrote: use a flat directory structure and let metadata
(frontmatter) drive classification, not folder hierarchy. This is a
tension with the current discipline-based directory structure that
should be discussed.

## Part II: Architectural patterns from computational specs

### 1. Recognition Term Language: content maturity strata

RTL defines stratified types. A term at stratum 0 is raw data; at
stratum 1 it is a typed datum; at stratum 2 it is a type itself.

**Application**: Content in the ASR exists at different strata:
- **Stratum 0**: Raw triage notes, untitled files, unprocessed input
- **Stratum 1**: Properly typed content with frontmatter, filed in
  the correct discipline directory
- **Stratum 2**: Specifications and schemas that define content
  types — the directory-organization spec, the plans spec, the
  content type vocabulary itself

The encoding loop is a stratum-climbing process: each pass moves
content up one stratum. A `maturity:` frontmatter field could track
this: `raw → typed → linked → stable → closed`.

**Recommendation**: Add `maturity:` to the ASR frontmatter schema.
Incorporate into plan 0012 (content type enforcement).

### 2. Recognition Term Language: recognition vs. reference

RTL distinguishes between "recognizing" something (understanding it
well enough to classify and work with it) and merely "referring" to
it.

**Application**: A markdown link that merely points to another file
is a reference. A link that explains what the linked content says,
why it is relevant, and what specific idea is being used is a
recognition. The cross-linking workflow should aim for recognition
links, not just reference links.

**Recommendation**: Define recognition links as a content quality
standard. Incorporate into the cross-linking workflow plan.

### 3. Recognition Term Language: passive/active/medial modes

RTL terms have modes: passive (data), active (processes), medial
(bridges).

**Application**: ASR content types map to these modes:
- **Passive**: terms, concepts, texts (reference content)
- **Active**: skills, scripts (executable content)
- **Medial**: plans, policies, decisions (bridge description and
  action — they describe what IS and prescribe what to DO)

This classification supplements the content type vocabulary. It
explains why plans and policies feel different from terms and texts
— they operate in a different mode.

**Recommendation**: Add mode classification to the directory-
organization spec as a cross-cutting dimension.

### 4. Act structure: typed repository operations

Acts are the fundamental units of transformation. Every act has a
domain (input), codomain (output), and recognition context.

**Application**: Every repository operation is an act:
- `create-file`: domain = idea, codomain = new file, context =
  discipline knowledge
- `classify-triage`: domain = raw note, codomain = typed content,
  context = content type vocabulary
- `cross-link`: domain = isolated file, codomain = linked file,
  context = related content

Act composition describes how operations chain: the encoding loop
is a sequential composition of acts.

**Recommendation**: Use act vocabulary in skill definitions. Each
SKILL.md already defines inputs and outputs — formalizing these as
act domains and codomains makes composition explicit. Incorporate
into plan 0010 (workflow plans).

### 5. Act structure: application modes

Acts apply in different modes: total (everything), partial (some
things), local (bounded context).

**Application**: Repository operations have application modes:
- A global vocabulary rename is total application
- Editing one section of a file is partial application
- Per-directory policies are local application

The policy encoding system (plan 0003) should distinguish these
modes. A policy that applies "totally" to all directories is
different from one that applies "locally" to mathematics/.

**Recommendation**: Add application mode to policy encoding
vocabulary. Incorporate into plan 0003.

### 6. Collapse dynamics: content stability as a measurable property

Collapse dynamics describes how unstable structures resolve into
stable ones through closure operators.

**Application**: Content stability can be measured:
- **Semantic stability** (S_sem): has the meaning settled? Measured
  by: how recently was the definition changed? Do all uses agree?
- **Syntactic stability** (S_syn): is the form correct? Measured by:
  does frontmatter validate? Are links live? Is it in the right
  directory?
- **Fusion stability** (S_fus): do meaning and form cohere? Measured
  by: does the file say what it means? Is the title accurate? Do
  tags match content?

**Recommendation**: Build stability metrics into the review-plans
skill or a new `audit-content` skill. Track stability via git
history (change frequency) and validation scripts. Incorporate into
plan 0012.

### 7. Collapse dynamics: cascading stabilization

When one thing stabilizes, it can trigger stabilization in dependent
things. Stabilizing foundational terms has outsized value because
it cascades.

**Application**: When a core term definition stabilizes, all files
referencing that term become more stable. The cross-linking and
vocabulary audit workflows should prioritize foundational terms
(terms referenced by the most other files) because their
stabilization cascades.

**Recommendation**: Build a "reference count" metric. Prioritize
stabilizing high-reference-count terms. Incorporate into vocabulary
audit follow-up.

### 8. CCE architecture: directories as cells

Each CCE cell has inputs, outputs, internal state, and a closure
operator. A discipline directory is a cell.

**Application**:
- **Inputs**: triage items routed to this directory, cross-
  references from other directories
- **Outputs**: published content (terms, concepts, texts)
- **Internal state**: current files, their maturity levels
- **Closure operator**: the directory's methodology and quality
  criteria (encoded in AGENTS.md and applicable policies)

This makes per-directory governance concrete. Each directory's
AGENTS.md is literally the specification of its closure operator.

**Recommendation**: Frame AGENTS.md files as closure operator
specifications. Incorporate into plan 0001 (per-directory agent
instructions).

### 9. CCE-ABI: frontmatter as interface contract

The CCE-ABI defines the binary interface between cells. For the
repository, the "ABI" is the frontmatter schema + file naming
conventions + directory structure.

**Application**: If two discipline directories follow the same
ABI, their content is interoperable. The ASR directory-organization
spec already defines this ABI — but the CCE framing makes it
explicit that this is an interface contract, not just a style guide.
Breaking the ABI (changing frontmatter schema, renaming directories)
is a breaking change that requires a migration plan.

**Recommendation**: Treat the directory-organization spec as an ABI
specification. Add versioning. Require migration plans for breaking
changes.

### 10. HTM / sheaf consistency: cross-discipline agreement

In a topos, data organized as sheaves must satisfy a consistency
condition: overlapping patches must agree on their overlap.

**Application**: When two discipline directories both use a term,
they must agree on its meaning. A "sheaf consistency check" would:
for every term used in multiple directories, verify that all uses
are compatible with the term's definition.

**Recommendation**: Build sheaf consistency checks into the cross-
linking workflow. This goes beyond "do links resolve?" to "do
meanings agree across directories?"

## Priority recommendations

### Highest priority: promote existing specs

emsenn already wrote the specifications. They are sitting in triage.
The highest-priority governance work is promoting them:

1. **Semiotic Markdown** → ASR content format spec
2. **Spec-spec** → ASR meta-specification
3. **Typed Knowledge Graph** → ASR linking spec
4. **Intake Pipeline** → ASR triage processing spec
5. **Policy Enforcement Hooks** → ASR policy enforcement spec
6. **Baseline Renewal** → ASR content maturity spec
7. **Semiotic Git** → ASR version control spec
8. **Traceability DAG** → ASR dependency validation spec
9. **Audit/Provenance** → ASR provenance spec
10. **Semiotic Repository** → ASR meta-identity spec

This should be a new plan (or an amendment to plan 0006).

### Incorporate into existing plans

1. Content maturity field (`maturity:`) → plan 0012
2. Directories as cells / AGENTS.md as closure operators → plan 0001
3. Policy application modes → plan 0003
4. Act-based skill composition → plan 0010

### Write new plans

5. Sheaf consistency checks (cross-discipline term agreement)
6. Cascading stabilization (reference-count-prioritized term work)
7. Content stability metrics (git-history-derived)

### Resolve design tension

emsenn's note about flat directory structure + metadata-driven
classification vs. the current discipline-based hierarchy needs a
decision record. Both approaches have merit; the current ASR may
need to support both.

## Sources

Specifications are in `triage/engine/contracts/` and
`triage/specifications/`. Computational specs are in the CCE files
(Untitled 13-17, 20-22), HTM spec (Untitled 24), and
`triage/collapse dynamics/`, `triage/relations/`, and
`triage/relational derivatives/`.

See plan 0005 (triage processing) and plan 0006 (triage governance
mining) for the processing plans.
