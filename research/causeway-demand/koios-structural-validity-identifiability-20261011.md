# Owner-metric identifiability: Causeway → Lenticule → Coesite (2026-10-11)

**Causeway work_ref:** `causeway-services/koios-news#4`; consuming Publishing Service: `causeway-services/public-services-section#16`; Lenticule Science receiver: issue #69; Coesite Scientific Operations receiver: `coesite-operations/operations-services-section#122` and unmerged operational study PR #125.

## Pinned field observation, not independent editorial acceptance

Causeway's owning feedback dataset is `causeway-services/koios-news-data` at commit `fbc33aacd753671acd3e7f1e5fc153842daefee9`, file `feedback/latest.json`, Git blob `22413f2b20ad5b01037a219abdf49841361a529e`, sensor observation `2026-10-11T15:23:23.224Z`. Rights: internal aggregate-only. The records are owner-reported and no individual private/client data is published in this Science result.

From the 76 article rows: passing with context 38, passing without context 0, failing with context 15, failing without context 23. Therefore 38/76 have owner structural pass, and 23/76 report zero context sections. All 76 rows report evidenceAvailable=false, assertions=null and sourceHosts=null. These are **sensor missingness**, not verification failures, factual falsehoods, or failed reader tasks.

## Scientific finding and falsifier

A publisher's structural score and reader/source outcomes are different constructs. The owner's *passing without context* stratum is structurally empty. Consequently no observed contrast identifies the effect of context sections within passing articles. Moreover, without independent reader labels the positive predictive value of structural pass is not identified (uninformative bounds [0,1]). The observed structural rate of 50% is not an editorial success rate.

**Hypothesis (not established):** independently verified source-claim fidelity and contextual coverage predict actual reader task success better than article word count alone. **Null/falsifier:** on held-out blinded adjudications, the combined method does not improve prespecified predictive performance against a word-count-only baseline. Prospective source review and reader trials, not further synthetic tests, adjudicate this.

## Coesite Scientific Operations pilot parameterization

Prospective pilot sampling from the fixed 76-item observational cohort: randomly select 12 of 38 passing-with-context, 6 of 15 failing-with-context, 6 of 23 failing-without-context; acknowledge the absent fourth stratum. Total 24, with inclusion probabilities 12/38, 6/15 and 6/23. Coesite must commit the deterministic selection algorithm/seed **before** any labels, retain a revision-pinned internal map from article slugs to selections, and deliver aggregate-safe data with independent assessor identity/competence attestation. Selection quotas are a proposed pilot, not an executed or powered outcome experiment.

Collect source-claim support labels by two blinded source reviewers, a disagreement/abstention lane, and reader tasks scored independently from the service-owner structural score. Record date, source revisions, cohort, sample inclusion weights, missingness, interventions, assessor conflict, privacy constraints, actual study cost and prospective decision threshold. A 24-item feasibility pilot cannot by itself establish generalizable validity or causal effects. Separate customer publication acceptance is Causeway's authority.

## Tests, receiving and interpretation

`owner-metric-identifiability.mjs` is a source-pinned aggregate-only assay. The accompanying synthetic regressions exercise missing outcomes, positivity, duplicate-free aggregate agreement, Gregorian dates, privacy, sampling inclusion weights and fail-closed cases. Passing these tests validates the type-level guard, **not** the research hypothesis. This research is reusable for AI Visibility Assurance and Grants Services whenever owner-side convenience metrics are confused with independent customer outcomes.

**Engineering-ready now:** maintain separate fields for owner structural metric, provenance observability, independent source adjudication, independent reader outcomes and customer receiving; never coerce absent outcomes to zero. **Science still needed:** field-labeled prediction testing, reader task design and expected-value-of-information stopping rules.
