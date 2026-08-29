---

name: technical-patterns-second-pass
date-created: 2026-03-08T00:00:00
keywords:
  - semiotic-endeavor
  - technical-patterns
  - research
description: "Second-pass mining of triage/specifications/ and triage/engine/contracts/semiotic-markdown/ for technical structure that semiotic-endeavor can formalize."
---

Research text documenting technical patterns found in the second pass
through triage content, focused on formalizable structure rather than
philosophical motivation.

## Sources examined

**Engine contracts:**
- `semiotic-markdown/spec/semiotic-markdown.md` — full SMD dialect
  specification with conformance model, identifier system, error
  classes, and frontmatter schema.
- `semiotic-markdown/src/semiotic_markdown/model.py` — Python
  dataclasses implementing the conformance extraction model
  (DocumentRecord, Feature types).
- `semiotic-markdown/src/semiotic_markdown/errors.py` — concrete
  error class hierarchy.

**Triage specifications (simulation specs):**
- audit.md, introspection.md, knowledge-graph.md, information-engine.md,
  traceability-graph.md, measurement-algebra.md, measurement-fabric.md,
  network.md, replication.md, universal-state.md, baseline-renewal.md,
  activitypub.md, stlc.md (plus previously-read: interface.md,
  scheduler.md, intake-stack.md, policy.md, storage.md, testing.md,
  concurrency.md).

## Pattern 1: Conformance extraction model

The semiotic-markdown spec defines a **conformance extraction model**:
a named record type (DocumentRecord) that a conforming implementation
MUST produce. This is stronger than just declaring outputs — it gives
a complete typed schema for what "conforming" means.

Fields of DocumentRecord: doc_id, title, source_path, frontmatter_raw,
frontmatter_norm, folders, body_raw, features. Features are a union
introduces: LinkFeature | CalloutFeature | InlineFieldFeature |
CitationGroupFeature.

The model.py implementation uses frozen dataclasses, making the
extraction output immutable by construction.

**Relevance to semiotic-endeavor:** The method component interface
(already in the spec at v0.4.0) requires each aspect to declare
outputs. The conformance extraction model pattern makes this
concrete: outputs should be named record types with typed fields, not
prose descriptions.

## Pattern 2: Normative scope declaration

The semiotic-markdown spec explicitly declares what it IS and ISN'T
normative about:

Normative for: file format, identifier derivation, extension
recognition, resolution determinism, minimum extraction outputs.

Not normative about: particular semantic universe, particular parsing
library, full AST exposure.

**Relevance to semiotic-endeavor:** This pattern prevents scope creep
in aspect specifications. Each aspect should declare its normative
boundary, preventing confusion about what a conforming implementation
must vs. may do.

## Pattern 3: Deterministic identifier model

Semiotic-markdown's slugify function is a deterministic mapping from
Unicode strings to ASCII slugs, specified as an ordered sequence of
7 steps. The spec declares exactly where slugification applies (6
contexts). Reference resolution is defined as deterministic over a
finite universe of known documents.

**Relevance to semiotic-endeavor:** Determinism is a requirement for
spec lifecycle transitions (v0.4.0 already states "determinism
verified" as a guard for the active state). The slugify model shows
what a determinism specification looks like in practice: a function
defined step-by-step, with the contexts where it applies enumerated.

## Pattern 4: Named error class hierarchy

Semiotic-markdown defines 5 error classes inheriting from a base
SemioticMarkdownError: FrontmatterParseError, FrontmatterTypeError,
DuplicateDocIdError, AmbiguousResolutionKeyError, InvalidEncodingError.

The spec (section 14) requires these as "required error classes." The
implementation provides exact Python classes.

**Relevance to semiotic-endeavor:** The spec already requires error
semantics with severity/fault/retryability. The semiotic-markdown
pattern adds: error classes should be NAMED and organized in a
hierarchy per aspect, not just described as schema fields.

## Pattern 5: Shared carrier types across aspects

Multiple simulation specs reference the same data types:

- **TracePoint**: appears in knowledge-graph, activitypub,
  universal-state, information-engine, traceability-graph. It is the
  fundamental unit of structured content.
- **Snapshot**: appears in storage, audit, replication,
  baseline-renewal. It is the unit of persistent state.
- **Acts**: appear in traceability-graph, knowledge-graph,
  information-engine, stlc. They are the unit of justified action.
- **Schema registry entries**: appear in measurement-fabric,
  intake-stack. They define what data types are recognized.

These shared types create implicit contracts between aspects. When
introspection says "monitoring must not perturb trace semantics
(handled by scheduling)," it assumes scheduling's trace model is
compatible.

**Relevance to semiotic-endeavor:** The method component interface
says aspects compose via input-output compatibility. The shared carrier
pattern shows HOW this works: aspects share a vocabulary of named
types. An endeavor's method should declare its shared carriers
explicitly.

## Pattern 6: Pipeline composition

The information-engine spec organizes all aspects into a 5-stage
canonical pipeline: intake/coding -> measurement/normalization ->
towers/flow -> sheaf/hypertensor state -> domain views.

Each stage consumes the previous stage's outputs. Domain specifications
are "slices" of the pipeline's final state — they define how to
read/write sections of the shared state, plus domain-specific
invariants.

**Relevance to semiotic-endeavor:** This is the most concrete example
of how aspects compose. The current semiotic-endeavor spec lists
aspects (file format, work planning, versioning, etc.) but doesn't
describe their composition order. A composition model would show which
aspects consume which others' outputs.

## Pattern 7: Dependency justification (traceability)

The traceability-graph spec requires every edge in the dependency DAG
to carry a justification: which act, theorem, or specification
authorizes that dependency. Unjustified edges are rejected. Policy
compliance is checked before accepting new edges.

**Relevance to semiotic-endeavor:** The "no implicit contracts"
principle (already in the spec) could be strengthened: inter-aspect
dependencies are not just named but JUSTIFIED — each must cite the
specification that authorizes it.

## Pattern 8: Cross-aspect invariant references

Several specs reference invariants maintained by OTHER specs:

- Introspection: "monitoring must not perturb trace semantics
  (handled by scheduling)"
- Measurement-fabric: "aggregations respect linearity and bounds
  from the measurement stack"
- Network: "messages must be intake-compliant (validated before
  routing)"
- Replication: "all replicas must converge to the same state (per
  commutation laws)"

**Relevance to semiotic-endeavor:** The spec says "invariants from
different aspects must be jointly satisfiable." The pattern here is
more specific: aspects may DELEGATE invariant enforcement to other
aspects, creating a dependency that must be tracked.

## Assessment: what to add to the spec

From these patterns, two additions are warranted:

1. **Normative scope declaration requirement** — add to the method
   component interface that each aspect MUST declare its normative
   scope (what it IS and ISN'T normative about). Source: semiotic-
   markdown's section 1.1.

2. **Shared carriers** — add to the aspects-of-method section that
   an endeavor's method SHOULD declare its shared carrier types (data
   structures that multiple aspects produce and consume). Source: the
   TracePoint/Snapshot/Act pattern across simulation specs.

NOT adding pipeline composition: the current semiotic-endeavor aspects
(file format, versioning, change tracking, etc.) don't naturally form
a pipeline in the same way the simulation specs do. Forcing a pipeline
model would be premature. The input-output compatibility statement
already in the spec is sufficient for now.

NOT adding conformance extraction model: the 5-section interface
template already requires typed outputs. Making it a named record type
is implementation guidance, not specification-level structure.
