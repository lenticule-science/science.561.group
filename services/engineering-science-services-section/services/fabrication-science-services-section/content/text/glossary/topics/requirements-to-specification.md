---
title: "Requirements to Specification"
description: "A bounded account of turning goals, environmental requirements, and accountable decisions into an admitted fabrication specification without confusing provenance, evidence, conformance, or refinement with proof."
kind: research-note
status: design
date-created: 2026-08-28
---


## What this is

This note concerns the transition from a demand for a changed world to a
specification that may govern fabrication.  It supplies distinctions needed by
[Specification Fabrication](./specification-fabrication.md): a work order is
not made complete merely by adding more prose, tests, or provenance.  It must
say which desired effects are goals, which are requirements on the world,
which behaviours are assigned to a machine or provider, which environmental
conditions are expected, and who has authority to settle a still-open decision.

The labels are intentional.  **[E]** is an externally supported claim with a
source below. **[R]** is an existing repository design decision. **[D]** is a
definition adopted for this alpha. **[H]** is a hypothesis or proposed law.
**[O]** is open.  No [H] is a theorem, and no source below is silently adopted
as an imposed external standard.

## The world and the machine

**[E]** Zave and Jackson distinguish a requirement, which concerns a desired
relationship among environmental phenomena, from a specification, which
describes machine behaviour sufficient to help establish it.  Their point is
not that a specification is unimportant; it is that a machine description can
be correct while failing the actual world concern if its assumed interfaces,
domain properties, or controls are wrong.  See Michael Jackson and Pamela
Zave, [*Deriving Specifications from Requirements: An Example*](https://www.pamelazave.com/turnstile.pdf),
ICSE 1995, and Pamela Zave and Michael Jackson, [*Four Dark Corners of
Requirements Engineering*](https://doi.org/10.1145/237432.237434), TOSEM 1997.

**[D]** In this corpus, the **world** is the artifact's receiving and operating
context: people, repositories, runtimes, formats, services, and other facts
not controlled solely by the projected artifact.  The **machine** is the
artifact and the operations controlled by its fabrication and execution
boundary.  This definition applies to informational artifacts without claiming
that every recipient or provider is literally a physical machine.

**[H] World/machine separation law.** A candidate specification MUST classify
each settled claim as either a world goal or requirement, a machine guarantee,
an expected environmental condition, a standards obligation, or an internal
law.  A candidate which silently moves a condition from one class to another
is incomplete for admission.  This is a proposed alpha law, not a claim that
the current contract schema already represents every class.

## Goal, requirement, expectation, and decision

**[E]** Goal-oriented requirements engineering treats goals as desired
properties and refines them into more operational obligations assigned to
agents, while identifying conditions that depend on the environment rather than
on the system alone.  See Axel van Lamsweerde, [*Goal-Oriented Requirements
Engineering: A Guided Tour*](https://webperso.info.ucl.ac.be/~avl/gore.php),
RE 2001, and the author's [KAOS overview](https://webperso.info.ucl.ac.be/~avl/gore.php).

For this alpha:

- **[D] A goal** is a desired state of affairs in the world, stated before a
  particular artifact is chosen.  A goal may be valuable yet not be fully
  operational.
- **[D] A requirement** is a settled, assessable relationship in the world
  that the supplied machine is intended to help establish.  It MUST retain its
  receiver/context rather than being reduced to a code-shaped wish.
- **[D] A machine guarantee** is a behavior, effect, refusal, or invariant
  assigned to the fabricated artifact, under declared preconditions.
- **[D] An expectation** is an environmental condition needed by a guarantee
  or requirement but not controlled by the artifact.  Examples include a
  receiver honoring a protocol revision or an operator supplying valid input.
- **[D] A decision** is a choice among materially different permitted futures.
  It is not a missing field to be guessed by the fabricator.

**[R]** The existing fabrication account already refuses to let a provider
invent unstated intent and distinguishes admission from receiver acceptance.
These definitions make that boundary more explicit; they do not authorize a
provider to settle a goal, expectation, or decision while translating it.

**[H] Decision-authority law.** Every blocking decision or expectation MUST
name an accountable authority and a resolution condition, or remain an open
question that blocks admission.  A provider's convenient default is neither an
authority nor a resolution condition.

## Requirements engineering is process evidence, not a replacement for it

**[E]** ISO/IEC/IEEE 29148:2018 specifies requirements-engineering processes,
information items, and the contents and formats of those items across a system
life cycle.  It is a process and information-item standard, not a proof that a
particular requirement is true or that an implementation satisfies it.  The
[ISO public record for ISO/IEC/IEEE 29148:2018](https://www.iso.org/standard/72089.html)
records edition 2 (2018), confirmed in 2024 and currently marked for revision.

**[D]** A requirements process record is evidence that stated elicitation,
analysis, validation, or decision steps occurred.  It is distinct from the
truth of a world claim, the correctness of a machine guarantee, and the
receiver's acceptance of the realized artifact.

## Provenance is not truth

**[E]** W3C [*PROV-DM: The PROV Data Model*](https://www.w3.org/TR/prov-dm/Overview.html),
Recommendation 30 April 2013, defines provenance as information about the
entities, activities, and agents involved in producing or influencing a thing.
It says such information can support assessments of quality, reliability, or
trustworthiness; it does not make the assessed claim true.  PROV-DM also
separates derivation and responsibility from the content of a claim.

**[D] Provenance** answers *what produced, used, changed, or asserted this
resource, and when/under whose responsibility?*  A source digest, source span,
and activity record are provenance.  They bind a statement or artifact to a
history; they do not establish semantic correctness, standards conformance, or
acceptance.

**[H] Provenance-bound claim law.** Material claims, projections, assays, and
receipts SHOULD bind to stable identities and digests of the resources they
refer to.  A changed resource MUST NOT inherit an earlier assay merely because
it retains a filename or prose title.  This is a minimal integrity rule; it is
not a claim that content hashes decide what a statement means.

## Evidence, argument, and acceptance

**[E]** OMG [*Structured Assurance Case Metamodel (SACM), Version
2.3*](https://www.omg.org/spec/SACM/2.3), October 2023, provides a metamodel
for assurance cases: auditable claims, arguments, and evidence used to support
the claim that a defined system or service satisfies particular requirements.
The metamodel supplies a vocabulary for support and challenge; it does not turn
any evidence item into a universal proof.

**[D] Evidence** is a bounded observation, analysis result, witness, or
artifact relevant to a claim.  **[D] An argument** states why named evidence,
under named assumptions and scope, bears on a claim.  **[D] Acceptance** is the
decision of the relevant receiver or owner that the available argument and
evidence are sufficient for a stated purpose.

**[R]** The fabrication circuit already separates a fabricator's successful
assay from acceptance.  SACM supports retaining that separation: passing an
assay is evidence for a claim in its named scope, not a self-issued acceptance
certificate.

**[H] Evidence-scope law.** Every acceptance obligation MUST state the claim
or trace it bears on, its method, its execution context, and the limitations of
its result.  An omnibus "tests passed" record does not by itself discharge an
universal law, a world requirement, or a receiver decision.

## Refinement is a preservation obligation

**[E]** Dijkstra's predicate-transformer work defines weakest preconditions
for terminating behavior and gives laws such as monotonicity and the excluded
miracle.  Back and von Wright present refinement as a formal account in which
successive program developments preserve correctness.  See Dijkstra,
[*Guarded Commands, Nondeterminacy and a Calculus for the Derivation of
Programs*](https://www.cs.utexas.edu/~EWD/transcriptions/EWD04xx/EWD418.html),
EWD 418 (1973), and Ralph-Johan Back and Joakim von Wright, [*Refinement
Calculus: A Systematic Introduction*](https://doi.org/10.1007/978-1-4612-1674-2),
1998.

**[D] A refinement edge** is a claimed transition from one specification,
model, or representation to a more detailed one.  The edge is not established
by its direction, by generated code, or by matching names.  It requires a
stated preservation relation and a method of checking it.

**[H] Refinement-obligation law.** Each projection from an admitted artifact
contract SHOULD name the source constraints it claims to preserve, the target
representation, and an assay, proof, or explicitly limited argument.  A chain
may be called *proved refinement* only where every edge has a mechanically
checked proof under a stated semantics.  The current Markdown-to-IR-to-JSNode
circuit has provenance and bounded admission/assay checks; it is not yet such a
proved chain.

## Trace and observation

**[E]** CSP treats observable communications as central and its later model
distinguishes traces from refusals and divergence, because a sequence of happy
events alone does not capture all relevant behavior.  See C. A. R. Hoare,
[*Communicating Sequential Processes*](https://doi.org/10.1145/359576.359585),
CACM 1978, and Stephen Brookes, C. A. R. Hoare, and A. W. Roscoe, [*A Theory
of Communicating Sequential Processes*](https://doi.org/10.1145/828.833),
JACM 1984.

**[D] An observation alphabet** is the explicitly named set of externally
relevant events for a claim: for example, input, output, refusal, durable
write, package import, command invocation, or receipt emission.  A trace is a
sequence over that alphabet.  This alpha may use finite traces as evidence,
but MUST NOT equate a sampled test log with complete trace semantics.

## Minimal law set for the current alpha

The current generic artifact contract need only grow enough structure to make
the preceding distinctions actionable.  The following are proposed [H] laws,
not descriptions of completed implementation:

1. **Classification:** each settled clause has one declared role: world goal,
   world requirement, machine guarantee, expectation, standard, law, or
   operational decision.  More than one role requires separate linked clauses.
2. **Authority:** every decision and blocking expectation has an authority and
   resolution condition; absent these it remains blocking/open.
3. **Provenance binding:** each clause, projection, evidence item, and receipt
   identifies the version/digest it concerns.
4. **Argument binding:** evidence identifies its supported claim(s), method,
   context, and scope limit; acceptance names the authority and purpose.
5. **Refinement obligation:** each projection identifies the source clauses it
   purports to preserve and the non-proof or proof method bearing on that
   assertion.
6. **Observation declaration:** a behavioral-equivalence or conformance claim
   names the relevant observations, including refusals or effects where they
   matter.

These laws are deliberately smaller than KAOS, PROV, SACM, ISO 29148,
refinement calculus, or CSP.  The current alpha should borrow their
distinctions without claiming their complete metamodels, formalisms, or
conformance.

## Open questions

- Whether `goal`, `world requirement`, `machine guarantee`, and `expectation`
  should be first-class records in the next contract version or first be
  represented by a typed relation over the existing clauses.
- Which authority vocabulary can describe a human owner, a standards body, a
  receiver, and a delegated service without conflating responsibility with
  truth.
- What smallest assurance-case relation is sufficient to tie an assay to a
  claim without importing the entire SACM metamodel.
- What semantics and tool support would be necessary before any current
  projection may honestly be called a refinement proof.
- Which observation alphabets should be standard for Markdown resources,
  packages, schemas, and data resources.
