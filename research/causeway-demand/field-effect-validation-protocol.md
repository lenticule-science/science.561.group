# Field-effect evidence validation — Science protocol v0.2

Date: 2026-10-11
Status: proposed empirical protocol and tested synthetic instrument; no field validation or public/customer acceptance claimed.
Science receiving: https://github.com/lenticule-science/science-services-section/issues/69

## Causeway source demand

- Publishing feedback-issue custody: https://github.com/causeway-services/koios-news/pull/88 (merged 2026-10-11 05:28 UTC) and https://github.com/causeway-services/koios-news/pull/89 (merged 2026-10-11 05:48 UTC). These demonstrate *source-level* diagnostics and synthetic CLI checks, not delivered customer remedies.
- New source-observation publisher broker import repair: https://github.com/causeway-services/koios-news/pull/90 (open when inspected 2026-10-11 11:07 UTC). Its AST/parser and export-resolution evidence establishes source compatibility, not newsroom/publication runtime acceptance.
- Public reader correction intake: https://github.com/causeway-services/koios-news-site/issues/16. Actual discoverable reporter journey and independent receiver remain separate effects.
- Multi-seller marketplace: https://github.com/causeway-services/public-services-section/issues/17; OfferFlow: https://github.com/causeway-services/public-services-section/issues/20; customer-facing Publishing Service: https://github.com/causeway-services/public-services-section/issues/16. Source commits, provider receipts, authorized actions and independently accepted customer outcomes are distinct.

## Scientific question

For real bounded service effects, how accurately does a candidate completion classifier identify independently adjudicated complete and incomplete outcomes, without silently aggregating unrelated provider events or treating indeterminate effects as successes?

Observation unit: one unique (workRef,effectRef), with pinned source revision, service, provider binding, collection window and verdict revision. Never count stage flags, GitHub issues, money transfers, or raw provider events as completed customers.

Test variables:
- classifier decision: complete / incomplete / abstain;
- independent receiver truth: complete / incomplete / indeterminate;
- source and receipt provenance; revision and provider identity;
- measured actual customer task outcome and independent authority;
- materiality, error cost, provider/version cluster, accessibility mode if applicable.

## Assay, limits and negative controls

Code:
- `research/causeway-demand/evidence-cohort.mjs`: deterministic within-effect structural coverage and cross-effect splice indicator.
- `research/causeway-demand/adjudicate-effect-binding.mjs`: conditional false-completion and false-rejection rates, abstention/coverage, stratification, Wilson descriptive intervals.
- Their adjacent tests are executable design fixtures, not field calibration.

False completion = classified complete among **independently adjudicated incomplete effects** that the classifier did not abstain on.

False rejection = classified incomplete among **independently adjudicated complete effects** that the classifier did not abstain on.

Report denominator, untrusted labels, indeterminate truth, abstentions, and classified coverage separately. An all-wrong classifier must report accuracy 0, not unknown/null. A classifier that always abstains has 0 classified coverage, not 100% accuracy.

Non-collision negative controls: two work/effect tuples whose string delimiters overlap; two service/provider strata whose display labels would concatenate identically; repeated effect identity; two independent revisions with complementary pass stages; conflicting verdicts; publisher self-review; independent-verifier failure; all-wrong labels; all-abstained sample.

The supplied `verifyAdjudication` callback is **not** independently authenticated evidence. It accepts the caller's assertion; engineering must bind an independently verifiable receiver and credential/protocol before production use.

## Pre-registered field design and acceptance

1. Name one bounded Causeway service and actual receiving customer task; fix eligible effects, collection window, source/revision, risk significance and privacy/redaction method *before* observing classifiers.
2. Sample both successes and failures, unresolved and timed-out effects; preserve selection probabilities. Do not recruit or expose clients through this research carrier.
3. Independently read provider-native receipts and service/public witness; a receiver qualified by the service contract labels complete/incomplete/indeterminate, blinded to classifier verdict where feasible.
4. Measure false completion, false rejection, abstention, classified coverage and uncertainty by service/provider/revision; use clustered uncertainty if repeated effects share a customer/provider. Never claim that zero errors in a small synthetic sample calibrates production risk.
5. Falsify the method if the predeclared relevant error tolerance is exceeded, or if valid shared components under one legitimate effect are systematically rejected. Failure to verify independent labels is **unassayed**, not success.
6. Record revision drift, transfer any reproducible deterministic negative controls to Red Cup, and require operations/public receiving separately. Science does not authorize payment, publication, medical claims or release.

No protected/client personal records, subscriber lists, order amounts, account IDs or other secret/private values belong in this shared research test corpus. Public GitHub source links above support requirements, not independent empirical outcomes.
