---
type: definition
class: substrate-entity
status: draft
symbol: "\\mathcal{N}"
depends-on: [normative-system, jural-relation, closure-rule]
realizes: [norm]
aliases:
  - Norm
date-modified: 2026-10-15
---

# Norm

A norm is a triple (φ, O, N): prescribed content φ, a deontic operator O
(obligation, permission or prohibition), and the normative system N in which
it is operative. This is a draft predicated representation of normative
relations, not a claim that recording a rule performs the required act.

## Representation

The existing vocabulary records `propositional-content`, `deontic-operator`
and `operative-in`, with `antecedent` for a conditional norm. The norm's
authority and current scope must be established by the governing system.
These predicates describe a norm; they do not directly set the truth/evidence
value of its prescribed performance.

| Norm | Consequence of valid activation | Evidence still owed |
| --- | --- | --- |
| Obligation of φ | A bearer owes specified performance to its beneficiary under the norm | Evidence that the bearer actually performed φ and the receiving condition is met |
| Permission of φ | φ is permitted within N and its scope under N’s permission semantics | Capability, preconditions and effect admission for this occurrence |
| Prohibition of φ | The applicable authority disallows φ within a named scope | Evidence of a prohibited occurrence before asserting a violation |

Conditional obligation ψ ⇒ Obl(φ) can establish an obligation when ψ holds;
it cannot infer φ. A charter requiring a report does not create the report.
The original norm source deliberately defines weak permission as no norm in
N prohibiting φ, and gives the nuclear reading Per(φ) iff ¬φ is not fixed
by σ. That absence-based definition is retained. It concerns the applicable
N, not the subset of documents a reader happened to retrieve. For example,
a corpus containing no prohibition record can be the same partial view of
N₁ with no prohibition and N₂ with an unreturned prohibition. The view alone
cannot decide which permission result is warranted. An implementation must
therefore identify N and its current scope, and establish its chosen
completeness/default semantics before applying the absence test.

## Independence of norm, performance and assessment

Norm validity, actual performance and assessment of compliance are distinct
predications. A breach assessment requires a bearer, required act, relevant
deadline or other triggering condition, applicable norm and sufficient
evidence. Unknown performance alone is not proof of breach; it can justify
an inquiry or an evidence request under the stated policy. A separate duty
to furnish a witness by a deadline, or an N-defined evidentiary default, can
support an assessment that required evidence was not provided. Preserve that
auditing rule and its scope without inferring that φ itself never occurred.

The traditional consistency condition Obl(φ) ⇒ Per(φ) is a property of a
chosen normative logic, not evidence that φ occurred. Conflicting obligations
and prohibitions form a normative conflict to adjudicate. They must not be
collapsed into invented positive and negative reports about the act itself.

Normative priority also requires a construction. The least fixed point of the
union of two contradictory inference rules does not automatically prefer the
higher-ranked rule; the [precedence question](../../documents/notes/questions-on-precedence-in-least-fixed-point.md)
records this exact unresolved point. Name the priority policy, applicability
conditions and conflict behavior in any executable realization.

## Operativity through joint settlement

The prior predicated source and the current normative-system source also give
a joint-predicate reading: a norm is operative at stage τ when
recognized-as-norm-in(φ,N)=t and forward-binding-in(φ,N)=t. Recognition and
continued binding are different evidence dimensions. Neither is the actual
performance of φ. This construction is retained as an authored draft model;
its comparison to office-incumbency is a proposed structural correspondence,
not a proved equivalence merely because both have two axes.

The source distinguishes a norm’s validity/in-force assessment from a truth
assessment of an ordinary factual proposition. A norm’s moral appraisal is
likewise distinct from whether it is operative in the chosen N. The σ-fixed,
transfer-shadow and joint-predicate readings need their carriers and maps
reconciled. The performance-projection correction does not settle that
research question or discard any of those authored constructions.

## Rights and transformations

The Hohfeldian model distinguishes claim/duty, privilege/no-claim,
power/liability and immunity/disability. Its governance operations transform
those relations with explicit parties, scope and authority conditions:

- [Assignment](assignment.md) changes a claim-holder subject to the governing
  conditions; it is not ordinary task dispatch.
- [Delegation](delegation.md) grants bounded authority derived from a source
  grant; scope, accountability and subdelegation conditions remain explicit.
- [Revocation](revocation.md) records a valid withdrawal of a grant under its
  own authority and notice rules; it does not erase the historical grant.
- [Succession](succession.md) changes the bearer of an office while preserving
  the institution and its accountable obligations under the succession rule.

These are draft mathematical models of particular normative traditions. A
Mission's commission/order supplies its own recall and abandonment rights.
Neither a generic capability match nor a work-queue transition grants them.

## Exact source premises and counterexamples

The [original norm](https://github.com/emsenn/561-theory/blob/04a09cb4f14dfa58994db7a6864fe7771ddca882/humanities/theories/sociology/theories/work/theories/governance/terms/norm.md#L20)
defines absence-based permission at line 20 and gives its σ-fixed-point
reading at lines 102–104. Its independence-from-compliance invariant at line
26 and norm-persistence Proposition 2 allow an operative norm with a
noncompliant act. Taking φ as “the report is submitted” supplies the direct
counterexample: obligation can remain operative while no report was submitted.
An inference that settles performance merely from Obl(φ) loses that model.

The current [normative-system source](https://github.com/lenticule-science/governance-services-section/blob/main/content/text/glossary/terms/normative-system.md)
(blob dcbfeed0068e223dbd0dfc01bbe04bfa311404ec) explicitly says its agents may
follow or violate norms and retains permission-by-default. Its geometric
reading places obligation at a transfer-fixed shadow, whereas the original
norm's nuclear reading puts operativity in Fix(σ). Those readings, together with the joint-predicate construction above, require
reconciliation of histories, nuclei and meanings; this revision does not
silently equate them or substitute a new deontic axiom. The correction is to
the operational projection from norms to performed facts and from partial
retrieval to claimed absence in N.

## Receiving and revision

Tests must reject the following inferences: duty ⇒ completed act; no known
prohibition ⇒ permission in an open corpus; office membership ⇒ arbitrary
authority; a producer's output ⇒ independent receiving; revocation ⇒ deletion
of prior evidence. Retain valid authority paths and effective scope alongside
historical assertions and conflicts.

The pre-October-15 version rendered obligation as a direct update of
performance cells and left the evidence boundary for its absence-based
permission test unspecified.
It remains in the [prior source revision](https://github.com/lenticule-science/science-services-section/blob/aa46e2f11aff49635bfbd7a381ee4c8b261db63c/services/social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/services/predicated-governance-services-section/content/text/glossary/terms/norm.md). This revision preserves the norm structure and
replaces those conflated projections with separate normative and operational
obligations. The precise inference system and its formal verification remain
with the owning governance/mathematics program.
