# Olfactory comparability: preregistration and engineering evidence contract

Status: protocol candidate, 2026-10-11. No measurements, lab participation, accreditation, or market validation are claimed.

**Canonical intake (supersedes the short 2026-10-11 Science Intake):** The test is whether a laboratory's uncertainty statement survives cross-site transfer, not whether it repeats closely within one laboratory. Predeclare the between-site transfer tolerance and interval-coverage criterion before evaluating holdouts. If between-site predictive error exceeds that threshold despite narrow within-site agreement, that scoped comparability claim fails. The service remains a proposed, non-accredited assay; no empirical acceptance is recorded.

## Founding demand and receiver

Group source: https://github.com/561-group/561-group-opportunity-services-section/issues/23
The proposed Olfactory Metrology service promises an uncertainty/comparability assay, not an accredited proficiency test. Science must first answer whether a laboratory can trust its uncertainty statement *outside the calibration setting*.

Primary estimand: out-of-site predictive coverage for a blinded reference sample's concentration/threshold or ordered odor-intensity response, conditional on the stated sample domain. The response type and transformation must be selected before collecting study outcomes; threshold, concentration and hedonic preference must never be pooled as one metric.

## Competing, discriminable hypotheses

- H0 / site-invariant: after declared calibration, residual between-site variance is no greater than predeclared practical tolerance τ², and nominal predictive intervals attain their promised out-of-site coverage.
- H1 / site-shift: a site-specific component is material despite acceptable within-site repeatability.
- H2 / reference nontransfer: the apparent cross-site agreement is confined to the single calibration reference and fails on at least one preregistered alternative odorant/material domain.
- H3 / drift: a site-day, environment or assessor-training term predicts repeatable time trends; apparent site disagreement decreases when time is modeled prospectively.

These are models, not facts. H0 cannot be 'accepted' merely from nonsignificance.

## Assay before data collection

Eligible input: public, rights-cleared, genuinely replicated measurements with explicit laboratory, reference material, assessor/instrument, method, session/time, blind replicate, censoring and units. Do not import names or client-private records. Freeze the eligible cohort, method domain, transforms, deduplication and missing-data rule before model comparison. If public data lack crossed sites × reference materials × repeated sessions, disposition is **not identifiable** and request a purpose-built blinded pilot rather than manufacturing variance estimates.

For a continuous log-concentration response, candidate cross-classified model:

    y_{site,reference,day,unit} = μ + β_reference
      + u_site + v_(site,reference) + w_(site,day) + ε

Estimate components with interval uncertainty; assess heteroscedasticity and residual fit. For ordinal psychophysical ratings or left-censored thresholds, substitute an appropriate ordinal/censored hierarchical likelihood with an independently predeclared link. Avoid false precision from treating ordinal scores as continuous by default.

Primary external test: leave-one-site-out validation, preserving **all** records from that site as holdout; compare model with reference-specific transfer terms against a single-reference baseline using the same folds. Report coverage, interval width and proper predictive score for each reference separately. Secondary: leave-one-day/session-out drift discrimination; blind duplicate error; slope of error versus humidity/temperature where recorded. No claim of causal training effects from observational covariates.

## Falsifiers and negative controls

- A 95% interval that covers materially fewer than 95% of held-out references within prespecified statistical uncertainty falsifies its stated calibration claim.
- A multi-reference model that fails to improve held-out proper score compared with preregistered baseline refutes the added-complexity hypothesis for that domain. Report uncertainty, not a binary success slogan.
- Permute site labels within admissible blocks: the estimated site effect should collapse or a leakage/data-join bug exists.
- Introduce known synthetic batch offsets *in a separate fixture*: an estimator that cannot recover their sign or flags no anomaly fails QA.
- Identify disconnected reference×site graphs, censoring, pretest exclusions, assessor reuse, contamination and pooled-count artifacts; do not return a comparability verdict when these make the parameter nonidentifiable.
- The calibration reference cannot serve simultaneously as an independent validation set. No leakage across laboratory, assessor or session splits.

## Freeze fields and expected receiving

Required provenance fields: study_id, lab_pseudonym, method_revision, unit, reference_id, lot_id, sample_id, blind_code, replicate_id, assay_timestamp, instrument_or_assessor_id, measured_value, response_type, censoring_indicator, environment_observation_id, source_reference, rights_status. Use an explicit null/unknown vocabulary; empty values are not zero.

Red Cup Engineering receives a versioned parser, synthetic fixture generator, crossed-design rank/connectivity diagnostic, frozen split manifest, model runner, and machine-readable report with `not_identifiable` distinct from failure. The source must test shuffled order invariance, accidental duplicate key rejection, missingness, synthetic drift detection, and fold leakage. The receiving packet must list calibration, predictive interval coverage, sample counts and sensitivity to domain shift.

Coesite Operations receives a repeatable standard operating protocol, calibration-lot/assessor change control and drift-trigger thresholds only after Science's specification is accepted. Causeway receives only a bounded non-accredited customer-facing assay; no accreditation, customer benefit or live service is implied by this source commit.

Next independent receipt: one right-cleared public crossed dataset or a funded blinded pilot, plus someone other than the analysis author who recomputes leave-site-out coverage and reports discrepancies.
