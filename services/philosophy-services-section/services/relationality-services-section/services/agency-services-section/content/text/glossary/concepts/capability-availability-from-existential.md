---
type: theorem
status: sketch
depends-on: [capability-fiber-bundle, project-fiber-to-capability, quantifier-adjoints-on-work-fibers, normative-operational-layering, capability-matching]
title: Capability evidence aggregation and coindexed dispatch witnesses
description: "Distinguish the knowledge-order join of per-agent FOUR evidence from the truth-order existential and the source-witnessed coindexed agent who is capable, authorized, current, and independently receivable."
realized-by:
  repository: red-cup-engineering/agent-organization-engine
  package: "@red-cup-engineering/organizing"
  module: lib/organizing/src/work/dispatch.mjs
  pure-reader: communityDispatchCandidates
  native-operation: community-dispatch-candidates
  action-surface: lib/organizing/src/actions.mjs
  status: source-merged-not-published-or-installed
  conformance-tests: lib/organizing/test/work/community-dispatch-candidates.test.mjs
  test-execution: unverified
witness-invariants:
  - one-actor-identity-per-evidence-row
  - same-actor-capability-and-authority
  - finite-four-readings-preserved
  - community-population-completeness-unverified
  - no-office-or-work-authority-from-a-diagnostic
  - candidate-selection-precedes-bounded-preview
golden-examples:
  - left: potential
    right: active
    join-order: knowledge
    expected: stable
    dispatch-interpretation: heterogeneous-evidence-not-a-power
  - left: active
    right: absurd
    join-order: knowledge
    expected: active
    dispatch-interpretation: denial-plus-unknown-not-universal-absence
  - left: stable
    right: absurd
    join-order: truth
    expected: potential
    dispatch-interpretation: no-actor-necessarily-has-exact-potential
residuation-refusal-examples:
  - requirement: stable
    provision: potential
    residuum-truth: potential
    operational-ready: false
    reason: source-requirement-contradiction
  - requirement: potential
    provision: stable
    residuum-truth: stable
    operational-ready: false
    reason: provision-contradiction
---

# Capability evidence aggregation and coindexed dispatch witnesses

This corrected **theorem sketch** retains the original knowledge-order adjunction and its useful community-wide information, but refuses to identify the result with a witnessed authorization or an existential claim about an executable actor. We distinguish (1) a projection of distributed **evidence**, (2) a truth-valued **existential over agents**, and (3) an **admitted joint witness** of capability, current institutional authority and bounded effect for the same actor. The third, not the first or second alone, may support dispatch.

The original constructions remain [quantifier adjoints on work fibers](../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/predicated-work-services-section/content/text/glossary/terms/quantifier-adjoints-on-work-fibers.md), [project fiber to capability](../terms/project-fiber-to-capability.md), [dispatch readiness](dispatch-readiness.md), and the actual Organizing work/authority consumers. This is a correction of their interpretation, not a duplicate Work or proof engine.

## Types and a finite counterexample

For Belnap's four information states, write \(\mathbf{FOUR}=\{\bot=(0,0),\mathbf t=(1,0),\mathbf f=(0,1),\top=(1,1)\}\), with coordinates recording positive and negative evidence. The knowledge-order join is componentwise maximum:

\[
(p,n)\vee_k(p',n')=(\max(p,p'),\max(n,n')).
\]

Let \(\sigma_A^C(c)\) be the capability evidence about **actor A** for capability \(c\), within a specified observation frontier. The existing knowledge-order projection is

\[
K^C(c)=\exists_{\pi}^{k}\sigma^C(c)=\bigvee\nolimits_{A\in E_{\mathrm{op}}}^{k}\sigma_A^C(c).
\]

This is a valid left-adjoint projection **when the declared indexed fibers and reindexing satisfy the asserted hyperdoctrine conditions**. It aggregates the positive and negative evidence over agent indices. It is **not** automatically the truth of “some authorized agent can act,” nor the certificate of a particular witness.

| Readings for two actors | \(K^C\) | Correct conclusion |
| --- | --- | --- |
| \(\bot,\bot\) | \(\bot\) | No positive or negative observation at this frontier |
| \(\mathbf t,\mathbf f\) | \(\top\) | Positive evidence about one agent and negative evidence about another; this is **not** a contradiction about one actor or a proof that no actor exists |
| \(\mathbf f,\bot\) | \(\mathbf f\) | One explicit denial, one unknown; this is **not** universal community absence |
| \(\top,\bot\) | \(\top\) | Contradicted evidence for one agent; the other is unknown, with no uncontradicted admissible witness |

Thus the former statement “knowledge-join \(\mathbf f\) means no agent has the capability” is false without complete negative evidence about the quantified domain. A knowledge-join \(\top\) can mean **heterogeneous reports from different people** as well as a within-actor contradiction. The actor index may not be discarded before testing which case holds.

The truth-order existential over \(\mathbf{FOUR}\), when that interpretation is wanted, is a *different* map:

\[
T^C(c)=\bigvee\nolimits_{A\in E_{\mathrm{op}}}^{t}\sigma_A^C(c),\qquad
(p,n)\vee_t(p',n')=(\max(p,p'),\min(n,n')).
\]

For \((\top,\bot)\), it yields \(\mathbf t\), although **neither actor has exactly \(\mathbf t\)**. That may be a legitimate truth-order existential reading, but it is not a safe dispatch certificate. A Boolean existential over actor-indexed **exact readiness** is yet a third predicate. Switching from \(\vee_k\) to \(\vee_t\) does not by itself repair action admission.

## Authority is separately indexed

For an action type \(X\), write the knowledge summary

\[
K^N(X)=\bigvee\nolimits_{A\in E_{\mathrm{op}}}^{k}\sigma_A^N(X).
\]

This summarizes testimony about authority. It does not issue a deontic power, install an Office, establish an Incumbency, grant a delegation, or prove a current institutionally valid effect. In particular, a recorded \(\mathbf f\) at one actor is not a community-wide absence, and heterogeneity \((\mathbf t,\mathbf f)\) across two actors is not a conflict that can be “adjudicated” by erasing one of their lawful differences.

An actual authority witness must be tied to the particular actor and its existing recognized/inducted Office, jurisdiction, effective time, bounded power, and the act's applicable rules. An agent's capability witness and an Office's power are distinct types; neither may be inferred from a job title, model session, message, strategy label, or the other witness.

## Coindexed dispatch theorem (admission condition)

Let \(\operatorname{CapReady}(A,T)\) and \(\operatorname{AuthorityReady}(A,T)\) denote **uncontradicted, source-qualified, current** per-actor decisions for one admitted original Work \(T\). Their FOUR readings may be combined at the **same actor** by the existing truth meet:

\[
\delta(A,T)=\delta^C(A,T)\wedge_t\delta^N(A,T).
\]

That local product is not a projection over the whole community. A necessary candidate condition for dispatch is the indexed existential

\[
\exists A\in E_{\mathrm{op}}\;[
  \delta^C(A,T)=\mathbf t
  \land\delta^N(A,T)=\mathbf t
  \land\operatorname{CurrentScopeAndGrant}(A,T)
].
\]

Execution still requires the native Work Arena's real admission and effect/receiver contract. The existential **locates a candidate**, but does not perform the action or create its Obligation. The original signed/typed Work identity, legal boundaries, causal dependencies, permitted effects, and distinct receiving actor remain in force.

For example, actor A may have \(\delta^C(A,T)=\mathbf t\) but \(\delta^N(A,T)=\bot\), while actor B has \(\delta^C(B,T)=\bot\) and \(\delta^N(B,T)=\mathbf t\). Both knowledge projections are \(\mathbf t\). **No actor is dispatch-ready.** Another example has a single actor with \(\delta^C=\top\), \(\delta^N=\mathbf t\): positive capability testimony exists, but contradictory evidence cannot be silently promoted to exactly-ready.

This is the **coindexed-witness** requirement: the same authorized bearer must satisfy every required capability and authority condition, rather than collecting a different bearer's witness for each coordinate.

## Refusal and information value

| Observed condition | Action reading |
| --- | --- |
| Some actor has exact \(\mathbf t\) for both layers and all current scoped admission predicates | Candidate for native admission; never an automatic action |
| One agent is capable, a different agent is authorized, but no jointly valid bearer is established | No admitted bearer; do not compose their powers |
| An incumbent or ability is \(\bot\) on a required coordinate | Evidence gap; preserve the Work as unresolved |
| A required coordinate is \(\top\) | Contradiction; preserve both witnesses, refer to the accountable adjudication path |
| Every actor in a **source-qualified complete current population** has an explicit failing required coordinate | Qualified absence of a ready bearer at that frontier; the population/negative evidence is essential |
| Incomplete roster, stale seat, unreceived grant, or unavailable producer | Unknown, not negative proof and not permission |

This replaces the earlier four-failure-mode table's incorrect deductions from \(K^C=\mathbf f\) or \(K^N=\mathbf f\). Each denied coordinate must retain its original actor and time, and only complete population evidence can justify a universal negative.

## CALM, concurrency and source-index preservation

The knowledge summaries \(K^C\) and \(K^N\) are monotone **as evidence maps** in \(\leq_k\): further information only increases the aggregate. That fact must not be conflated with monotonicity of “this exact actor remains uncontradicted and authorized.” New negative testimony changes \(\mathbf t\) to \(\top\), invalidating an exact-\(\mathbf t\) admission decision. Likewise, **no actor is ready** is a universal negative and needs complete, current domain knowledge.

A positive existence-of-*support* observation can be coordination-free on an append-only source, provided the actor identity is retained. An authoritative **ready-for-effect** decision additionally depends on current scope, revocations, competing Work obligations, resource bounds, and possibly causal nonconfluence. Consequently, the assertion that any knowledge-order monotone formula about community capability may decide live staffing without coordination is stronger than what this projection proves.

In a concurrent game, separate actors' effects can be independent, causally ordered, or conflicting. A witness linearization does not make incomparable events causally successive, and a cross-actor knowledge join does not grant shared institutional powers. The compatible global action must follow actual Work causality and independent receiving; it cannot be inferred from a totalized presentation or from combining local permissions.

## Three reproducible checks (sketch, not Lean certification)

1. **Motivating failure.** Compute \((\mathbf t,\mathbf f)\vee_k=\top\). The result is heterogeneous evidence, not a denial of the capable actor's individual reading.
2. **Different legitimate case.** Compute \((\mathbf f,\bot)\vee_k=\mathbf f\), while the second actor remains unknown; no universal negative is licensed.
3. **Refusal case.** Compute \(\top\vee_t\bot=\mathbf t\) but find no actor with exactly \(\mathbf t\). A truth-join existential is refused as an execution witness.

These follow directly from the finite FOUR tables. They are not evidence of a completed Obsmetrologia Lean proof, an actual office induction, a user-approved effect, or an independently received Work. A downstream Engineering consumer must preserve source-indexed readings and test the same-bearer condition, not reuse marginal sums as authorization.

## Operational consequence

Use the original Organizing and Work Arena readers to ask **which exact current actor has the required capabilities and legitimate authority for the same Work**. The knowledge-order adjoint remains useful for evidence aggregation and discovering possible demand. The truth-order existential remains mathematically distinct. Only the source-qualified coindexed bearer can become a candidate for native action admission. Source qualification, native validation, installed runtime and beneficiary receiving must still be independently established.

## Source-owned finite vectors and Engineering consumer

The source-owned finite checks above use the actual Computer Data FOUR names:
\(\mathbf t\leftrightarrow\texttt{potential}\),
\(\mathbf f\leftrightarrow\texttt{active}\),
\(\bot\leftrightarrow\texttt{absurd}\), and
\(\top\leftrightarrow\texttt{stable}\).
They state observations and expected algebraic results rather than an
unproved global theorem.

The corresponding original Engineering source now provides
[the per-actor community candidate reader](https://github.com/red-cup-engineering/agent-organization-engine/blob/main/lib/organizing/src/work/dispatch.mjs)
and [the native Organizing action](https://github.com/red-cup-engineering/agent-organization-engine/blob/main/lib/organizing/src/actions.mjs)
with [actor-indexed source tests](https://github.com/red-cup-engineering/agent-organization-engine/blob/main/lib/organizing/test/work/community-dispatch-candidates.test.mjs).
The output is explicitly bounded, but the candidate calculation observes the
**entire supplied actor array** before truncating the preview. It never reports
a community-wide negative without authenticated population coverage, and
never upgrades a matching candidate to an executor.

This is one finite implementation of the corrected **coindexed-witness**
requirement. Its actor testimonies remain caller-supplied observations:
original Office, Incumbency, grant, Work Arena, current time, jurisdiction,
conflicting evidence, rights and independent recipient qualification remain
independent requirements. A current source file or a schema-valid pure
readout is not a package release, deployed provider or completed beneficiary
receipt. The mathematical theorem's status remains *sketch* pending its owning
formalization and independent qualification.


## Contradictory input hidden by a positive residuum

A particularly important qualification of the original finite Work Algebra
comes **before** applying the community existential. Operational readiness
cannot be inferred from the residuated *result* while forgetting contradiction
in either operand.

On the \(\mathbf{FOUR}\) truth order, with
\(\mathrm{resid}(r,p)=\neg r\vee_t p\), let the requirement itself be
\(\top\) (knowledge-family `stable`, positive **and** negative evidence).
For the supplied provision \(\mathbf t\) (`potential`):

\[
\mathrm{resid}(\top,\mathbf t)
= \neg\top \vee_t\mathbf t
= \top\vee_t\mathbf t
= \mathbf t.
\]

**The algebraic residuation is genuinely positive**—it does not license
erasing the negative testimony attached to the original requirement.
An operational dispatch that only checks for `stable` in the *residuum*
can therefore return a false-ready reading. The correct diagnostic
distinguishes the raw residue from the original evidentiary inputs:

\[
\operatorname{AdmissibleMatch}(r,p)
\Rightarrow
\mathrm{resid}(r,p)=\mathbf t
\land r\ne\top
\land p\ne\top,
\]

with further actual current-office and Work Arena authority requirements.
The implication is a **necessary check** for the admitted dimensions,
not a sufficient authorization law for executing anything.

This concrete finite counterexample led to an original Engineering
repair in [AOE PR #22](https://github.com/red-cup-engineering/agent-organization-engine/pull/22):
`dispatchReadiness` preserves separately addressed, contradicted
requirement/provision/match coordinates and refuses readiness if
a required source cell is contradicted—even when the pure FOUR
`delta` is `potential`.
The existing `residuate` remains algebraically unchanged.

The source-qualified `community-dispatch-candidates` action then
counts only **uncontested** capability and authority matches for the
same bearer. Its source tests include an original Work with a
contradicted requirement and an uncontradicted provision. This is
machine-readable scientific conformance input and source-level
Engineering realization, not a claimed Lean certification, current
host release, or independent Work receipt.
