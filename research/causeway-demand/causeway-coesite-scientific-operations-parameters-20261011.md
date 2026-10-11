# Causeway Science: Coesite scientific-operations parameterization (2026-10-11)

**Owner of demand:** Causeway Public Services. **Scientific owner:** Lenticule Science. **Operational execution and data custody:** Coesite Operations scientific operations / enterprise / data capabilities, subject to the owning Coesite contract and authorized ingress. **Receiver:** Science #69. This document parameterizes an operations request; it does not claim Coesite deployment or authorize a service effect.

## Operational contract

`CausewayWorkRef → DemandObservation → ScienceTriage → CoesiteStudyRun → ScienceFinding → QualifiedEngineeringSpec | FurtherResearch | NoFinding → CausewayReceiving`.

Require each study record to supply: `work_ref`, `causeway_owner`, `causeway_issue_url`, `observed_at`, `source_revision`, `evidence_class` (Causeway-reported / independent-public / independently-adjudicated), `rights_class`, `research_question`, `observable_variables`, `population_and_sampling`, `measurement_instrument_revision`, `null_or_falsifier`, `study_cost`, `decision_threshold`, `independent_receiver`, `receipt_uri`, `status`. Never join distinct work/effects by a convenient common stage; aggregate only when lineage and cohort constraints are explicit. No client-specific eligibility, PII, subscriptions, credentials or sensitive commercial material in Science GitHub.

Coesite must be the operator of data acquisition, immutable manifests, experiment execution, run logs, storage/retention, and instrument readback. Lenticule owns hypotheses, scientific constructs, analysis, interpretation and scientific qualification; Causeway owns client contract and actual receiving. A source commit or green test does not imply customer acceptance.

## Active parameter sets from live Causeway GitHub

### CS-01: AI visibility validity and customer effects
- Source: https://github.com/causeway-services/public-services-section/issues/6
- Observation: Causeway defines an incubating assurance offer, mock-client gate and provisional metrics; not an independently observed client outcome.
- Study: sample fixed prompts, locales, models, dates and tracked entities with repeated retrievals. Separate discoverability, retrieval, mention/citation accuracy and downstream customer task completion; measure test/retest stability and environmental drift.
- Null/falsifier: audit scores are not predictive of independently obtained user task success compared with simple baseline; stability collapses across repeated samples.
- Decision: specify reproducible measurement only if construct validity and repeatability meet a pre-registered threshold; otherwise sell no unqualified assurance claim.

### CS-02: Grants temporal provenance
- Source: https://github.com/causeway-services/public-services-section/issues/14
- Observation: the service requires a shared public program registry across clients, and local eligibility must stay tenant-private.
- Study: Coesite snapshots public funder pages and version/date/effective-window transitions; compare extraction to independently adjudicated program terms and changes.
- Falsifier: snapshots systematically fail to detect deadline changes or confuse publication date with effective date.
- Decision: specify a source-backed temporal knowledge contract with abstention on unresolved program changes; never aggregate private client eligibility.

### CS-03: Publication authority and reader success
- Sources: https://github.com/causeway-services/public-services-section/issues/16 ; https://github.com/causeway-services/koios-news/issues/4 ; https://github.com/causeway-services/koios-news/issues/15 ; https://github.com/causeway-services/koios-news-site/issues/16
- Observation: publishing scope, newsroom execution, article context, public correction intake and customer approval are distinct effects. Koios issue #4 reports 38 articles under its own depth threshold (2026-10-11 13:57Z); this is an owner metric, not reader outcome.
- Study: independently annotate source-to-article claims, omission and uncertainty, and blind reader comprehension/task completion across article-length strata. Run an explicit approval/effect/correction/acknowledgement trace for the client-authority boundary.
- Falsifier: typed claim-preservation or contextual-section measures fail to outperform word count on independently scored reader tasks.
- Decision: restrict Engineering specification to independently predictive metrics and deterministic authority state transitions; do not treat build success as publication success.

### CS-04: Instrument validity, cost and when not to measure
- Sources: https://github.com/causeway-services/koios-news/issues/2 ; https://github.com/causeway-services/koios-news/issues/3 ; https://github.com/causeway-services/koios-news/issues/45
- Observation: inaccessible analytics/AdSense provider reports cannot become zero measured usage, cause diagnoses or observed revenue. Existing provider access defects are mainly Operations repair.
- Study: Coesite measures missingness by reason; compares incremental information and action change from independent public observation, provider repair, and paid data acquisition. Decision-theoretic criterion: expected improvement under the posterior minus study and intervention costs, with explicit reversibility and consequence.
- Falsifier: expensive data collection does not change decisions or reduce regret against lower-cost baselines.
- Decision: preferentially repair access when needed, abstain on missing provider results and stop studies whose expected decision value is nonpositive.

## Receiving and implementation boundaries
Each parameter set requires a Coesite run manifest, pre-registered sampling and adjudication plan, immutable run outputs, versioned analyses and an independent receiving witness. **No Coesite operations run has yet been executed or independently accepted for these parameter sets.** Re-use Lenticule's merged effect-coherence, incentive-invariance and claim-lineage assays as research candidates; qualify them only after field studies. Coesite issue https://github.com/coesite-operations/operations-services-section/issues/32 provides a potential capability-demand ingress, not proof of an already running Scientific Operations service.
