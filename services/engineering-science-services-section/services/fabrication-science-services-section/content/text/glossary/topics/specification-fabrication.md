---
title: "Specification Fabrication"
description: "A fabrication-science account of producing an admitted work order by joining a lawful model class to applicable conformance obligations, while preserving the distinction between theory, standards, engineering, and acceptance."
kind: theory-note
status: design
date-created: 2026-08-28
---


## What this is

**Specification fabrication** is the governed production of a work order for a
durable artifact.  It makes explicit both (1) the structures an artifact may
lawfully instantiate and (2) the standards against which a situated artifact
is judged conforming.  It is prior to fabricating code, data, or documents:
the result is a reviewable constraint-bearing resource, not an implementation.
It specializes [Fabrication](./fabrication.md)'s claim that fidelity depends on
the work order's completeness rather than on a provider's presumed intent.
The upstream distinctions between world concerns, machine guarantees,
expectations, decisions, provenance, evidence, and acceptance are developed in
[Requirements to Specification](./requirements-to-specification.md).

This note uses four status labels deliberately.  **[D]** marks a definition in
this note; **[R]** marks a repository-level design constraint cited from an
existing source; **[H]** marks a falsifiable hypothesis or proposed operating
model; and **[O]** marks an unresolved question.  None of the [H] claims below
is represented as a mathematical theorem or as an external standard.

## The two hands

### Left hand: mathematical lawfulness

**[D] Mathematical lawfulness** is the set of structural constraints defining
the admissible model class for an artifact: declared sorts and operations,
relations between them, invariants, permitted transformations, and explicit
failure or non-existence cases.  A lawful artifact is one that instantiates
those constraints; it need not thereby be usable in any particular ecosystem.

The nearby engineering term [Blueprint](../../../../../../../../../engineering-services-section/content/text/glossary/terms/blueprint.md)
gives a stronger special case: a signature with axioms, distinguished from any
one of its models.  Specification fabrication need not claim that every
practical requirement is geometric or even formally expressed.  Rather, when a
law can be formalized, it MUST preserve the distinction between the model class
and an individual realization; when it cannot yet be formalized, it MUST be
labeled as a requirement, hypothesis, or open question rather than dressed up
as proof.

**[H]** For an artifact kind with a usable formal account, preserving the
identified laws is provider-independent: different providers may produce
different realizations, but each realization is acceptable on this hand only if
it satisfies the same declared constraints.  This hypothesis fails for a
claimed law if two conforming realizations can disagree on the asserted
invariant, or if the invariant cannot be stated independently of a particular
provider's private behavior.

### Right hand: standards conformance

**[D] Standards conformance** is satisfaction of the selected normative
obligations for a situated artifact: a format, protocol, platform contract,
local convention, or other named standard and version.  It answers a different
question from lawfulness: whether this artifact is accepted by the relevant
receivers and tools, not whether its internal structure is coherent.

The technology-science [Specification](../../../../../technology-science-services-section/services/specification-services-section/content/text/glossary/topics/specification.md)
already requires a specification to separate what is true, forbidden, and open
and to use normative vocabulary only for settled claims.  Specification
fabrication inherits that discipline.  A conformance obligation MUST name its
authority, version or revision when available, applicability conditions, and
the assay or witness by which compliance could be checked.  A compatibility
guess, a tool's undocumented behavior, or a provider's assertion is not by
itself a standard.

**[H]** Conformance is receiver-relative.  A Markdown resource may conform to
CommonMark yet fail a repository-specific frontmatter convention; a JavaScript
package may satisfy its own algebraic laws yet fail Node's package-resolution
rules.  This hypothesis is falsified for a stated receiver if the receiver
accepts artifacts that violate the declared applicable obligation, or rejects
artifacts that satisfy every obligation the specification claims is complete.

### Their junction

**[D] A fabricated specification** joins a declared lawful model class with a
declared applicability-scoped conformance profile.  It is complete enough for a
fabricator only when it also names its artifact identity, inputs and outputs,
prohibitions, examples or acceptance cases, dependencies, permitted effects,
open questions, and the provenance of its material claims.  Its requirements
MUST NOT be assumed to be machine-only statements: the linked
Requirements-to-Specification account distinguishes world requirements,
machine guarantees, and expectations that a machine cannot itself control.

The two hands are independent and both matter:

| Condition | Consequence |
| --- | --- |
| lawful, not conforming | structurally coherent but unusable by the target receiver |
| conforming, not lawful | accepted at an interface while violating the claimed internal model |
| neither | no basis for fabrication or acceptance |
| both | an eligible candidate for implementation and independent assay |

**[H]** Treating the two hands separately makes incompleteness inspectable:
every requirement can be classified as a structural law, a conformance
obligation, an operational choice, or an open question.  The hypothesis fails
if a useful class of requirements systematically cannot be assigned to any of
those categories without losing a material distinction; that would require a
third first-class constraint category.

## The circuit and its authority boundaries

Specification fabrication is a circuit, not a one-way prose activity:

```text
evidence and demand
  -> law and standards selection
  -> authored candidate specification
  -> admission or explicit refusal
  -> target-specific projection and fabrication
  -> independent assays and receiver evidence
  -> realization receipt
  -> proposed theory or standards enrichment
```

**[R]** The Central Dogma note treats a provider as interchangeable with
respect to unstated intent: a provider cannot be relied upon to recover intent
that the work order did not carry.  It therefore supports a refusal boundary:
an incomplete candidate is not made complete by selecting a supposedly more
capable provider.  See [The Central Dogma of Code Fabrication](../../../../../../../../content/text/documents/articles/notes/2026/07/24/2026-07-24-research-on-the-central-dogma-of-code-fabrication.md).

**[D] Authority is partitioned.** Science maintains terms, models, evidence
status, and falsifiability conditions.  Standards authorities maintain the
external or local obligations they promulgate.  Engineering maintains reusable
parsers, validators, projectors, and fabricators.  Operations maintains custody,
deployment, and acceptance.  An implementation MAY reveal a missing
constraint; it MUST NOT silently promote that constraint into settled theory or
rewrite a standard's authority.

**[D] Admission** is the decision that a candidate has enough named authority
and settled information for a particular fabrication scope.  Admission is not
acceptance: it authorizes an attempt to realize the work order.  **Acceptance**
is a receiver or owner decision made after the relevant evidence exists.  A
fabricator's own successful run is evidence of a bounded assay, not universal
acceptance.  Provenance binds that evidence to its production history but does
not establish the truth of the claim it concerns; an argument must still state
the claim, assumptions, method, and scope.

## Provider interchangeability and controlled variation

**[D] Providers are interchangeable only relative to a specification and an
assay profile.** Interchangeability does not mean their traces, performance,
costs, or incidental implementation choices are identical.  It means a change
of qualified provider does not change the authoritative requirements or the
criteria by which a realization is admitted.

This prevents a common category error: a provider may select among explicitly
permitted variants, but it has no authority to convert an omitted decision into
a requirement.  Where variation is desired, the work order MUST represent it
as a parameter, a finite allowed set, or an explicitly delegated decision with
its accountable authority.  Where equivalence between variants matters, the
required observational or semantic equivalence MUST be stated and assayed.

**[H]** Provider interchangeability is empirically supportable when repeated,
independently produced realizations meet the same law and conformance assays
without requiring provider-specific waivers.  It is falsified for a fabrication
class when passing outcomes require undisclosed provider knowledge or a
provider-specific interpretation of an allegedly complete work order.

## Latent axioms and the return path

**[D] A latent axiom** is a constraint exposed by implementation, assay, or
receiver failure as necessary for the claimed artifact class, but absent from
the admitted specification.  The term is compatible with the Blueprint account
of an implicit structural constraint, but this note does not assert that every
such discovery is a geometric axiom or already settled law.

Latent-axiom handling is deliberately conservative:

1. Record the observation, failed or passing assay, affected scope, provider,
   and the smallest candidate formulation.
2. Classify it as a possible law, a possible conformance condition, an
   engineering constraint, or a local operational choice.
3. Send it to the authority that can evaluate it; do not back-date it into the
   work order as though it were always stated.
4. Revise the specification only with a new identity or version and a clear
   statement of which prior realizations are affected.

This feedback loop is a preservation obligation, not a current refinement
proof: a translator or projector must eventually state which clauses it
preserves and how that claim is checked before the circuit may be described as
a proved refinement chain.

**[H]** This return path reduces repeated fabrication failures caused by hidden
constraints.  It is falsified if recording and classifying discovered
constraints does not improve future admission, assay coverage, or diagnostic
precision relative to otherwise comparable work.

## What would falsify the central operating claims

The fabrication framing is useful only while it risks being wrong.  The
following observations would require revision, not rhetorical rescue:

- Evidence that work-order completeness has no measurable relationship to
  defect or dispute rates after controlling for artifact class and assay scope.
- A reproducible case in which a provider can correctly recover omitted,
  material intent without an accountable authority or external evidence.
- A class of receiver requirements that cannot be represented as an applicable
  conformance profile, even after the profile admits contextual conditions.
- A class of structural obligations for which no provider-independent statement
  or observable equivalence can be made, despite their being called laws.
- Evidence that treating a discovered constraint as a pending proposal is less
  accurate or safe than silently treating implementation behavior as settled
  theory.

These are falsifiers of the operating hypotheses, not failures of a particular
toolchain.  A failed individual assay is often productive evidence: it may
identify an incomplete work order, a faulty realization, an inapplicable
standard, or an incorrect theory claim.

## Open questions

- Which minimal schema can carry this theory for the first JSNode package
  circuit without claiming to be a universal ontology?
- What formal relation, if any, should connect a human-authored Markdown
  specification, its normalized intermediate representation, and a Blueprint?
- Which kinds of standards evidence are sufficient for admission versus only
  for post-fabrication acceptance?
- How should a receiver's intentionally implementation-defined behavior be
  represented without laundering it into a universal standard?
- Which measurements can test the completeness-versus-provider hypothesis
  without confusing specification quality with task difficulty or assessor
  quality?
