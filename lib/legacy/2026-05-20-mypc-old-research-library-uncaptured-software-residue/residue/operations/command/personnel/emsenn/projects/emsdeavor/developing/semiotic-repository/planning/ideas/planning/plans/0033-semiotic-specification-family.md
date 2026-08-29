---
title: "Complete the semiotic specification family"
date-created: 2026-03-07T00:00:00
authors:
  - claude
status: active
priority: high
depends-on: []
milestone: ""
goal: "006"
supersedes: [20, 27, 30, 31, 50, 51]
---

## Summary

Identify, write, and mature the full set of semiotic-* specifications
that describe the tools and conventions the repository uses to do its
work. The goal is: every practice the repository relies on has a
specification that says what it is and how it works.

## Motivation

The repository already has five semiotic specifications: semiotic-
markdown, semiotic-specification, semiotic-project-management,
semiotic-versioning, and semiotic-changelog. These specify the
conventions the repo uses for files, specs, planning, versioning, and
changelogs respectively. All are draft-stability.

But the repo uses more conventions than these five cover. Skills,
policies, the triage system, the predicate graph, agent instructions,
the directory hierarchy, citations — these are all practices the repo
relies on. Some have ad-hoc documentation; none have specifications of
the same quality as the existing five.

Without specifications for practices, agents and humans work from
vibes. Specifications make practices reproducible, testable, and
improvable. This is the "specify the things we use to do things"
principle.

## Existing specifications (draft)

1. **semiotic-markdown** — file format, frontmatter, body syntax
2. **semiotic-specification** — what makes a document a specification
3. **semiotic-project-management** — plans, goals, milestones, cycles
4. **semiotic-versioning** — version semantics and stability
5. **semiotic-changelog** — change tracking and trace
6. **semiotic-endeavor** — the organizing concept; what an endeavor is,
   organizational levels, method vs practice (added 2026-03-08)

## Candidate specifications to write

Audit the repository's practices and identify which need specifications.
Candidates refined from triage mining (see advisory report at
`technology/texts/triage-mining-for-semiotic-endeavor-enrichment.md`):

- **semiotic-skill** — what a skill is, SKILL.md format, lifecycle,
  invocation, composition
- **semiotic-policy** — what a policy is, enforcement hooks, dynamic
  regime changes, closure consistency constraints. Source material in
  `triage/specifications/policy.md`.
- **semiotic-triage** — intake pipeline: normalization, schema
  validation, ordered policy filters, blocking on missing filters.
  Source material in `triage/specifications/intake-stack.md` and
  `triage/specifications/information-engine.md`.
- **semiotic-citation** — citation format, bibliography generation,
  reference semantics (partially covered in semiotic-markdown/citations.md)
- **semiotic-directory** — directory hierarchy conventions, discipline
  modules, index files (partially covered in ASR directory-organization)
- **semiotic-predicate-graph** — predicate graph structure, typed edges
  from controlled vocabulary, satisfaction checking, dependency
  enforcement (not just documentation). Source material in
  `triage/specifications/knowledge-graph.md` and
  `triage/specifications/traceability-graph.md`.
- **semiotic-audit** — provenance capture, trace reconstruction,
  verification, reporting. Goes beyond semiotic-changelog (what
  changed) to reconstructibility (the chain that produced any state).
  Source material in `triage/specifications/audit.md`.
- **semiotic-introspection** — self-monitoring, anomaly detection,
  non-perturbative feedback, method-practice gap measurement. Source
  material in `triage/specifications/introspection.md`.
- **semiotic-testing** — trace-based verification, deterministic
  execution, earned assertions. Source material in
  `triage/specifications/testing.md`.

## Steps

1. Audit: list every convention or practice the repo uses that is not
   yet specified. Compare with the existing five specs.
2. Prioritize: which missing specs would most improve agent and human
   work if they existed? Rank by how often the practice is used and
   how much ambiguity currently exists.
3. For each high-priority candidate: write the specification following
   the semiotic-specification meta-spec (terminology, motivation,
   definition, application).
4. Mature existing draft specs: address any gaps, add missing sections,
   move toward candidate stability where warranted.
5. Maintain a registry of all semiotic-* specs (could live in the
   specifications/ index or as a dedicated list).

## Done when

- [ ] Audit of repository practices complete
- [ ] All high-priority practices have specifications
- [ ] Existing five specs reviewed and gaps addressed
- [ ] Specification registry exists and is maintained

## Dependencies

None — this can proceed in parallel with other work since each
specification is an independent document.

## Naming convention

Three levels per concept (decision 0005):
- **`term`** — primary intension (the thing itself, in its field)
- **`semiotic-term`** — secondary intension map (properties determining
  membership, within the agential semioverse)
- **`semiotic-term-specification`** — conformance requirements (what an
  implementation MUST do)

## Log

**2026-03-07** — Created. Five semiotic-* specs already exist (all
draft stability). The goal is to extend this family to cover all
repository practices.

**2026-03-08** — semiotic-endeavor written (6th spec). Defines
organizational levels (endeavor, project, operation, repository) and
method/practice distinction. Decision 0005 records emsenn's directions
on theory gaps. Key insight: purpose is immanent (not declared),
repository is implementation-level (not theory-level), the
structuration-interface dual doesn't need formalization. Naming
convention clarified: term → semiotic-term → semiotic-term-specification.

**2026-03-08** — Triage mining session. Surveyed engine/contracts (5
repos), triage/specifications (20 files), collapse dynamics (~160
files), theorem (68 files) for ideas to enrich semiotic-endeavor and
identify new candidate specs. Advisory report written at
`technology/texts/triage-mining-for-semiotic-endeavor-enrichment.md`.
semiotic-endeavor spec updated to v0.2.0: strengthened repository
concept (handle with interaction surface), added no-implicit-contracts
principle, reframed aspects-of-method as pipeline views not silos, cited
Flow-Nucleus Compatibility and ComonadCurvature for method/practice
formalization, added closure conditions section with Omega, added
method-component lifecycle, added organizational emergence (collective
constraint synthesis). Candidate spec list expanded from 6 to 9 with
triage source citations.

**2026-03-08** — Correction session. emsenn identified that triage
mining found philosophical content (vocabulary overlap) instead of
technical content (formalizable structure). Reverted philosophical
additions, rewrote classifier prompt, wrote decision 0006. Second
technical pass read all 20 simulation specs + semiotic-markdown spec
and source code. Extracted 8 technical patterns. Updated spec to v0.5.0
with normative scope and shared carriers.

**2026-03-08** — Theory/spec separation. emsenn identified that
semiotic-endeavor conflated level 2 (what it IS) with level 3 (how
to implement it). Created semiotic-endeavor-specification (v0.1.0)
with conformance requirements moved out of the concept document.
semiotic-endeavor trimmed to v0.6.0. Gap analysis text written
documenting what's missing for theory completion and specification
completion. Created plans 0035 (retrospectives), 0036 (roadmap),
0037 (versions/releases) for missing PM practices. Decision 0007
records derivation/presentation order for endeavor philosophy
(TCCC→insurgent→disaster→military→medicine→FOSS→business internally;
reversed for presentation). 7th spec in the family.

**2026-03-08** — Audit and prioritization. 9 candidates from triage
mining assessed. semiotic-skill is now covered by semiotic-endeavor-
specification §8-§9 (plan 0042). Remaining 8 candidates prioritized:
semiotic-policy (highest — 9 policies practiced, §6 of endeavor spec
requires them), semiotic-triage (high — 3 MCP tools, extensive
practice), semiotic-directory (medium), semiotic-predicate-graph
(medium), others lower.

**2026-03-08** — Wrote semiotic-policy (v0.1.0, 8th spec). Convention
specification covering: what policies are (§1), document structure
(§2), identity/numbering (§3), lifecycle (§4, creation/revision/
retirement), enforcement (§5, agent loading/practice alignment/
automation), scope (§6), interactions (§7, consistency/spec
relationship/decision records). Updated semiotic-endeavor specified
aspects table.

**2026-03-08** — Wrote semiotic-triage (v0.1.0, 9th spec). Convention
specification covering: what triage is (§1), content states and
transitions (§2, raw→enriched→classified→promotable/extracted/trash),
operations (§3, ingestion/enrichment/classification/promotion/
extraction/trash removal), index requirements (§4), processing order
(§5), invariants (§6, body preservation/no duplication/status
monotonicity/index derivability). Updated semiotic-endeavor specified
aspects table and conceptual dependency map (N5g, N5h).

**2026-03-08** — Completed full specification treatment for
"specification" concept. Created the 4-document chain:
specification (concept page), specification-specification (general
A.1-A.10 scaffold), semiotic-specification (convention, already
existed), semiotic-specification-specification (semiotic conformance).
Created make-specification skill (general, under
specification-specification) and make-semiotic-specification skill
(semiotic, under semiotic-specification-specification). Cleaned all
semiotic bleed-through from the general layer. This establishes the
pattern for plan 0050 (specification treatment for all emsdeavor
concepts).
