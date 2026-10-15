---
title: "The Algebraic Structure of Work: Free Algebras, Ground Terms, and Operational Signatures"
date-created: 2026-04-03
description: "Typed terms and grounding model work invocations; the work quartet, operational admission and plan dependencies require distinct structures."
date-modified: 2026-10-15
---

# The algebraic structure of work

Universal algebra separates an operation signature, an open expression and
a ground invocation. This provides one formalization of the work vocabulary;
it does not replace the general agency theory or establish every operational
property of an invocation.

## Signature, terms and grounding

Fix a many-sorted signature Σ with operations and their input/output sorts,
and a sorted variable family X. T(Σ,X) consists of well-formed terms.
An operation symbol ω is part of the signature. An application
ω(a₁,…,aₙ) is a term when the argument sorts match. A ground term has no free
term variables.

A sorted substitution σ:X→T(Σ,Y) extends homomorphically to terms. A ground
substitution, when the relevant ground terms exist, closes an invocation's
free arguments. A [work unit](../../../glossary/terms/work-unit.md) uses this
pattern to bind an operation's concrete inputs and parameters. Its actual
result can remain unknown until execution.

In a fixed first-order signature, an operation symbol is not a term variable.
Choosing a previously unspecified operation therefore needs an explicit
signature-selection, higher-order or elaboration model. It is not ordinary
substitution on X. Likewise, grounding inputs does not remove branching,
prove termination, grant authority or settle the meaning of an output.

## The work quartet has two axes

[Work](../../../glossary/terms/work.md) classifies process as meaning/execution
settled, procedure as meaning settled/execution open, derivation as meaning
open/execution settled, and inquiry as both open. If those two Boolean axes
are ordered by adding settled commitments, the shape is a diamond:

- Inquiry can become Procedure by settling meaning.
- Inquiry can become Derivation by settling execution.
- Either middle case can become Process by settling its remaining axis.

Procedure and Derivation are incomparable in that order. A linear
inquiry→derivation→procedure→process chain cannot be inferred from the table;
the middle transition changes one coordinate in each direction. A practical
method can visit those activities in a chosen sequence, but must not call
that sequence the monotone order of the two-axis classification.

Grounding and meaning/execution settlement are separate dimensions. A concrete
inquiry invocation can be ground; a template for a deterministic process can
still have unbound inputs. A correspondence between the dimensions requires
an explicit map and proof rather than a relabeling of the four cases.

## Composition and constraints

Term formation supplies syntactic composition under the signature. An
interpretation supplies semantic operations and any equations they satisfy.
Operational prerequisites, permission checks and failure conditions require
their own contracts; syntactic well-formedness does not prove executable
admission or successful production.

An equation identifies expressions in a congruence. A dependency such as
“review after drafting” instead constrains allowed traces or orderings.
These are different structures. A quotient by equations cannot be claimed to
encode a plan's dependency graph without constructing the translation and
showing it preserves the intended executions. Workflows may use typed graph,
process or effectful models where the chosen laws make that translation clear.

## Provenance and research obligations

This revises the April 3 source's grounding account while correcting its
operation-variable conflation, linear quartet and dependency-as-equation
claims. The prior text remains in the [prior source revision](https://github.com/lenticule-science/science-services-section/blob/aa46e2f11aff49635bfbd7a381ee4c8b261db63c/services/social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/documents/articles/notes/algebraic-structure-of-work.md). The term/substitution account
is a mathematical model stated in prose, not a new checked implementation.
The [workflow composition contract](../../../../../services/predicated-work-services-section/content/glossary/concepts/workflow-composition.md)
records categorical obligations. Open work includes a typed grounding map,
the operational semantics of errors/effects, and the relationship between
plan refinement and admissible execution traces.
