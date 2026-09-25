---
title: Code fabrication from a specification
date-created: 2026-09-04
authors: [emsenn, claude-fable-5-1]
status: specification — the fabrication-science statement of what a code work order carries, what a fabricator derives, and what an assay must be, measured against the jsnode fabrication line as it stands on 2026-09-04
part-of: computer-code-fabrication-science-services-section
description: "This specification states how a code resource is fabricated so that the fabrication is faithful in the sense the fabrication-science topics rule: fidelity set by the work order's completeness, bought by independent verification with…"
---

# Code fabrication from a specification

## What this is

This specification states how a code resource is fabricated so that the
fabrication is faithful in the sense the fabrication-science topics rule:
fidelity set by the work order's completeness, bought by independent
verification with irreversible rejection. It is language-neutral; the Node
operation-package line is its first measured instance. It follows from the
2026-09-04 note [fabrication as the birth of a thing](../../../../../../../../../content/text/documents/articles/notes/2026/09/04/2026-09-04-note-on-fabrication-as-the-birth-of-a-thing.md) and uses the
section's ruled vocabulary: [work order](../../../../../../../../../content/text/glossary/terms/work-order.md),
[fabricator](../../../../../../../../../content/text/glossary/terms/fabricator.md),
[fabrication fidelity](../../../../../../../../../content/text/glossary/terms/fabrication-fidelity.md),
[admission](../../../../../../../../../content/text/glossary/terms/admission.md), [acceptance](../../../../../../../../../content/text/glossary/terms/acceptance.md),
[realization receipt](../../../../../../../../../content/text/glossary/terms/realization-receipt.md).

The key words MUST, MUST NOT, SHOULD, SHOULD NOT, and MAY in this document are
to be interpreted as described in BCP 14 (RFC 2119, RFC 8174) when, and only
when, they appear in all capitals, per the house specification format
([specification](../../../../../../../../../../technology-science-services-section/services/specification-services-section/content/text/glossary/topics/specification.md)).

## The work order is the meaning-closure, not the artifact

A code work order MUST carry: the artifact's identity and seat (the section
that owns it); its requirements and prohibitions as distinct normative
classes; the laws and standards it must satisfy, each with authority,
revision, locator, applicability, and statement; the JSON Schema of the one
input object and the one output object of its operation; admitted examples as
input and output pairs; its exact dependencies; and a complete trace from
every requirement and prohibition to a projection, an acceptance obligation,
and at least one law or standard. This is the content the language-neutral
[artifact fabrication specification](../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-code-engineering-services-section/services/computer-code-development-services-section/services/artifact-fabrication-specification-admission-service/README.md) already
admits, plus the two schemas.

A code work order MUST NOT be required to carry the operation source or the
test source. A work order that carries them is an artifact awaiting
packaging, not a specification awaiting fabrication; the
[Central Dogma](../../../../../../../../../../../../../content/text/documents/articles/notes/2026/07/24/2026-07-24-research-on-the-central-dogma-of-code-fabrication.md) locates fidelity in the order's
completeness, and an order that already contains the answer has no
completeness to measure. A work order MAY carry a reference implementation
as an example, marked as such, which the fabricator MUST treat as one
acceptance case among others and MUST NOT copy as the operation.

The input and output schemas are the operation's argument places. The
operation is one unsaturated function of one schematized JSON object to
another (owner-ruled in the layering law), so the schemas are what the
fabricator saturates and the assays check; a work order whose schemas are
absent or open is not meaning-closed and MUST be refused at admission.

## The fabricator derives the source

A fabricator MUST derive the operation source and the behavioral tests from
the admitted work order. Derivation MAY be performed by an inference provider
purchased through the inference work market or by a deterministic generator
when one exists for the artifact kind; in either case the provider's identity
is provenance and MUST NOT be treated as acceptance evidence.

The fabricator MUST derive the tests before the source, from the examples and
the requirement and prohibition clauses, and MUST NOT let the provider that
derives the source see the tests it will be assayed against beyond the
admitted examples. This is what makes the tests a channel independent of the
source's author.

A fabricator MUST refuse rather than fill a gap: when the work order does not
determine a choice the source requires, the fabricator returns a typed
refusal naming the open question, and the order is revised. A provider's
convenient default is neither an authority nor a resolution.

## Assays are independent channels with an irreversible reject path

A fabrication MUST run at least these assays over the derived artifact, each
read from evidence the source's author did not supply:

1. **Schema conformance.** Every admitted example's input validates against
   the input schema, the operation's output for it validates against the
   output schema, and the output equals the admitted output.
2. **Face equivalence.** The import face and the command face give equal
   results for every admitted example (the jsnode line's existing assay).
3. **Derived tests.** The tests derived before the source pass.
4. **Conformance instruments.** The section's design-rule checks pass on the
   staged package: scripts conformance, import stratification, exact
   dependencies, lockfile registry, each by its own exit status.

A failed assay MUST remove the stage and leave no destination; the candidate
enters the reject path and is not repaired in place. The fabricator MUST NOT
re-run a failed candidate through the same provider with the same prompt and
evidence as a second channel; per the glass-sponge note
([§16.4](../../../../../../../../../../../../../../engineering-services-section/content/text/documents/articles/notes/2026/08/01/2026-08-01-note-on-the-content-addressed-glass-sponge-semantic-compute-complex.md)), two passes by the same model with the same
prompt and evidence are one pass.

## The receipt binds digests and the thing is born

A successful fabrication MUST produce a realization receipt binding the
work-order digest, the admitted specification digest, one piece of evidence
per projection and per acceptance obligation, and the provider and cost of
the derivation. The receipt is evidence of the stated assays and MUST NOT be
presented as acceptance.

A fabricated package SHOULD be constituted as a thing in the org's world
trace, with its work order, admission, assay, and receipt as witnessed rows,
so that it can be looked at, priced, and shadowed like any other thing
(LAGOON's guile-fabrication section states this for Guix packages; the Node
line owes the same). Publication to the registry MUST pass through the
publish gate.

## Implementations

**The jsnode fabrication line (2026-09-04).** The
[dialect](../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-code-engineering-services-section/services/javascript-engineering-services-section/services/javascript-code-fabrication-services-section/services/javascript-node-code-fabrication-services-section/services/jsnode-package-services-section/services/translate-markdown-jsnode-operation-package-specification-service/README.md) requires complete operation source and complete
test source in the work order, and the
[package-birth program](../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-code-engineering-services-section/services/javascript-engineering-services-section/services/javascript-code-fabrication-services-section/services/javascript-node-code-fabrication-services-section/services/jsnode-package-services-section/README.md) states that the specification
"contains the complete authored operation source, complete authored
behavioral tests." The line therefore satisfies the receipt, staging,
face-equivalence, and publication clauses above and does not satisfy the
work-order, derivation, or independent-channel clauses. All 28 receipts the
records reader lists for 2026-09-04 were fabricated from hand-written
operation blocks.

The engineering lot that realizes this specification, in order: (1) the
dialect admits `## Input schema` and `## Output schema` sections and makes
`## Operation` and `## Tests` optional; (2) a derivation stage, seated in the
jsnode package section beside the projectors, purchases test derivation and
then source derivation through the inference-dispatch market with the
admitted order as the whole context; (3) the schema-conformance assay is
added beside the face assay; (4) the conformance instruments run on the
stage; (5) the receipt carries provider and cost. Each step is a fabrication
lot on the rail; none is hand-written into the line.

**The research-question document fabricator.** Already conforms to the
work-order, admission, and receipt clauses for its artifact kind, since a
question document has no source to derive; it is the reference for what a
resource fabricator owes.

## Open questions

- Whether the deterministic generator lane can cover a useful fraction of
  operation kinds, so that provider purchase is the exception. Resolution
  blocked by: a measured distribution of admitted work orders by operation
  kind, which the records reader can supply once the dialect change lands.
- Whether deriving tests before source, with the source provider blind to
  them, is a sufficient second channel or whether a third, deterministic
  channel is always required. Resolution blocked by: a priced comparison on
  the first twenty fabrications under the revised dialect.
- Which nucleus the work order occupies, meaning-closure or execution-closure.
  This specification reads it as the meaning-closure; the same assignment is
  open in the work-orchestration specification
  ([work orchestration](../../../../../../../../../../../../../../561-group-services-section/content/text/documents/articles/notes/2026/09/04/2026-09-04-note-on-work-orchestration-by-modality-horizon-and-force.md)). Resolution blocked by: a stated
  theorem or founder ruling naming the assignment.
