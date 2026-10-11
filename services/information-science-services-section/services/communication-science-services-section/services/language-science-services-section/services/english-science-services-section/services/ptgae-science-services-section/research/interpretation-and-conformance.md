# PlainEng interpretation, meaning preservation and conformance — model 0.1

**Status:** Research model, not a proof of general natural-language equivalence. **Owner:** Lenticule Science. **Consumer:** Red Cup PTGAE engineering. **Date:** 2026-10-10.

## 1. Objects and contexts

Let $D$ be a set of documents or bounded document fragments; $C$ a set of explicit communicative contexts; $A$ a set of reader populations; and $T$ a set of tasks. Context includes conventional meanings, subject matter, source authority, relevant reference information, provenance, genre, version and date.

A candidate interpretation model $J(d,c,a)$ maps a document and context to a **set or probability distribution of admissible interpretations** for an audience. $J$ is not assumed fully known, computable or stable across all readers. Its predictions are empirical hypotheses.

A task $t$ supplies a decision/action observation $O_t(j)$ on an interpretation $j$. A revision morphism $r: d → d'$ proposes a source/target change with a recorded rule, context, authority and protective boundary.

These objects distinguish syntax, semantics, user behavior and organizational conformance; treating them as one readability score destroys evidence.

## 2. Bounded preservation relation

Select a **material invariant vector** $P_c(d)$ where components apply: named actor, predicate/action, quantified set, scope of negation, conditional direction, modality/deontic force, temporal bounds, amounts and units, attribution/source, causal status, exception set, epistemic claim status, technical referents, quotation/code/identifier integrity. Unknown components stay explicitly unknown.

The proposed *local checked rewrite relation* is

$$
 d \mathrel{\rightsquigarrow}_{c,R} d'
 \quad\text{only when}\quad
 \operatorname{Pre}_R(d,c) \land
 \operatorname{ProtectedEqual}(d,d') \land
 \operatorname{Checked}_R(P_c(d),P_c(d')).
$$

Here $R$ is a versioned, narrowly scoped rewrite rule. `Checked` covers only invariants for which that rule has a defensible checking method; it **does not assert** $J(d,c,a)=J(d',c,a)$ for all speakers and situations.

For empirical comparison choose a task loss function $L_t$. Under an explicitly sampled distribution of contexts/readers, estimate

$$
 \Delta_{a,t}=\mathbb{E}[L_t(O_t(J(d',c,a)))]-
 \mathbb{E}[L_t(O_t(J(d,c,a)))].
$$

A negative `Delta` may support better reader performance for that population/task. Failure to detect drift does not prove equivalence. Register preference, factual correctness, legal effect and reader-task success need separate evidence.

## 3. Orthogonal claim dimensions

The legacy PTGAE single `claimStatus` enumeration combines different questions. Preserve compatibility while researching independent, possibly multi-valued axes:

- **Evidence relation:** observed, measured, derived/inferred, simulated, testimony, absent, contradictory; each with a source, method, time and uncertainty where relevant.
- **Propositional commitment:** hypothesis, model prediction, assertion, rejection, open/unknown.
- **Normative force:** must, must not, should, may, prohibited, permitted, descriptive only; *which rule-making authority and edition* determine its effect.
- **Adoption and operational status:** proposed, intended, accepted, implemented, deployed, independently verified, deprecated.
- **Attribution:** original speaker/writer, reporter, organization, quoted source and whose view is being asserted.

This is a proposed normalization, **not** a command to migrate existing machine data without an agreed schema and tests. “Required” by one author is not legally mandated; “measured” does not guarantee accurate measurement; “proposed” says nothing about whether the proposal is true.

## 4. Rewrite counterexamples

| Original | Tempting edit | Material defect |
| --- | --- | --- |
| Some requests require approval. | All requests require approval. | Quantifier changed |
| Staff may decline the request. | Staff must decline the request. | Permission changed to obligation |
| The service can encrypt files. | The service encrypts files. | Capability changed to observed/default behavior |
| We have not verified the launch. | The launch failed. | Unverified became negative finding |
| Approve only if identity is verified. | Approve if identity is verified. | Necessary condition changed to sufficient |
| No payment is required unless X. | Payment is required when X. | Scope of exception/obligation may differ |
| We observed 3.0 ± 0.2 mg. | We measured 3 mg. | Method and uncertainty removed |
| The report attributes the failure to A. | A caused the failure. | Testimony became established causation |
| “The system is live,” said the vendor. | The system is live. | Quotation and attribution lost |
| Submit by October 12, 2026. | Submit soon. | Deadline lost |

Each becomes a regression fixture, with **preserve**, **reject**, **review-required** or **conditional** outcomes, not an indiscriminate phrase ban.

## 5. Conformance layers

1. **Syntactic/schema check:** parser, source bounds, locale tags and fields can be mechanically validated. This says nothing about scientific truth.
2. **Local transformation check:** a named rule and protected-span contract justify one bounded text operation; unresolved semantic features fail closed.
3. **Domain-semantic review:** qualified reviewers verify meaning, obligation, referents, units and factual provenance in the relevant context.
4. **Reader-task validation:** sampled intended readers demonstrate task success/comprehension; report uncertainty, sampling and adverse effects.
5. **Institutional/standards review:** authorized editor determines adoption and exact external requirements after reading the relevant full text/edition.

A text may pass one level and fail another. A machine-readable report **must name which level it checks**.

## 6. Research debt and next experiment

Identify which invariants are genuinely mechanical and which require external domain facts, compare annotator agreement on ambiguous modality/scope cases, run paired tasks with recruited readers, and explicitly record abstentions. Semantics underdetermination is an experimental boundary, not license to declare a universal proof. See [issue #54](https://github.com/lenticule-science/science-services-section/issues/54) and [Red Cup safe rewrite #3](https://github.com/red-cup-engineering/ptgae-engineering-services-section/issues/3).
