# Causeway demand → Lenticule Science: shared research and Coesite receiving contract

**Status (2026-10-13):** program specification and proposed operational studies; synthetic scientific instruments exist, but this document records **no independently completed Coesite field study, validated client outcome or customer acceptance**. It is the sole active Science/Scientific Operations parameterization for the four Causeway demand classes (formerly separate agenda and Coesite parameter note).

**Custody:** Causeway Public Services owns demand, customer authority and external acceptance; Lenticule Science (receiver [#69](https://github.com/lenticule-science/science-services-section/issues/69)) owns constructs, hypotheses, analysis and scientific qualification; Coesite Scientific Operations/Enterprise/Data (receiver [#122](https://github.com/coesite-operations/operations-services-section/issues/122)) owns authorized data acquisition, measurement execution, immutable run manifests, storage, provenance and independent operational readback. Red Cup Engineering receives deterministic conformance obligations. The existence of a receiving issue is not proof of execution.

## One evidence chain, multiple irreducible statuses

Trace each bounded effect as:

    Causeway demand → eligible observations → declared construct → test/analysis
      → qualified scientific finding → Engineering contract or explicit no-finding
      → implemented effect → independent public/customer receiving

Each transition has its *own* provenance and acceptance authority. Separate: (a) owner-reported status, (b) independently witnessed public observation, (c) independently adjudicated measurement, (d) causal inference, (e) provider execution and (f) downstream customer acceptance. A source commit, dataset count, green test, cloud log or publication endpoint is not an interchangeable receipt. Missing/unreachable provider evidence is **missing**, never implicitly a zero outcome; an unobserved result cannot be assigned success or failure.

For a study run, record at minimum:
- `work_ref`, `causeway_owner`, `causeway_issue_url`, `observed_at`, `source_revision`, `evidence_class` (owner-reported, independently public, independently adjudicated), `rights_class`;
- `research_question`, `construct_and_units`, `observable_variables`, `population_and_sampling`, `instrument_revision`, `null_or_falsifier`, `missingness`, `uncertainty_method`;
- `study_cost`, `decision_threshold`, `independent_receiver`, `receipt_uri`, `status`, and the independently signed/inspectable readback if one exists.

Cohort identity, source revision, event/effect identity, observation time, effective-time window and customer authority remain separately typed. Do not join unrelated effects merely because provider stage labels match. Freeze eligibility, sampling, analysis and stopping thresholds **before** outcome access; never manufacture source observations, participants or customer acceptance. This research carrier accepts public or legitimate aggregate data only, not client eligibility, account identifiers, subscriber records, PII, credentials or commercial secrets.

## CS-01 — AI visibility: construct validity and customer decision value

**Demand:** [AI Visibility Assurance #6](https://github.com/causeway-services/public-services-section/issues/6). The incubating service has provisional metrics and a mock-client gate; not an accepted customer effect.

**Question:** Which observable layers—crawl/index eligibility, entity resolution, model retrieval, source citation/mention, factual representation and real customer action—predict a buyer-relevant outcome after considering uncertainty, measurement costs and alternatives? Define each layer independently; do not collapse a vector into one opaque visibility score.

**Coesite assay:** predeclare fixed prompts, entities, locales, models/surfaces, versions, time windows and replicated retrieval samples. Record surface-dependent errors, factual citation fidelity and drift separately from independently scored user-task completion. Compare layer-specific models and candidate composites against a simple baseline on held-out cases; remeasure identical cases for reliability.

**Falsifier:** a proposed assurance metric fails preregistered test/retest reliability or does not improve held-out prediction/decision quality over the simpler metric. **Disposition:** engineering may implement reproducible component observations and abstention now; do not claim causal SEO/GEO uplift, a customer's benefit or a generalizable “assurance score” without field evidence. A scientifically valid outcome may be no service purchase or a cheaper existing solution.

## CS-02 — Grants: temporal public knowledge without tenant leakage

**Demand:** [Public Grants Services #14](https://github.com/causeway-services/public-services-section/issues/14). A shared official public-program registry is proposed, but private household/client eligibility must stay tenant-local.

**Question:** Can source-backed program identity, kind (grant, benefit, rebate, scholarship, financing, forgiveness, procurement/RFP, technical assistance), application mechanics, eligibility rules, effective dates and conflicting revisions be reconstructed reproducibly?

**Coesite assay:** version public funder pages with issuer identity, capture timestamp, source revision, published/effective windows, deadline and supersession. Compare extraction and change detection against independently adjudicated current official terms; separate source observation from inferred program eligibility.

**Falsifier:** silent deadline changes, invalid source-time ordering or materially incorrect effective-date attribution persist beyond a preregistered tolerance. **Disposition:** deterministic link reachability and date parsing go to Engineering; empirically measure recall, source drift and risk-limited abstention before external assurance claims. Neither historical public pages nor shared de-identified demand authorize storage of a client's eligibility.

## CS-03 — Publishing: evidence, editorial authority and reader outcome

**Demands:** [Customer Publishing #16](https://github.com/causeway-services/public-services-section/issues/16), [Koios editorial depth #4](https://github.com/causeway-services/koios-news/issues/4), [execution freshness #15](https://github.com/causeway-services/koios-news/issues/15), [public correction intake](https://github.com/causeway-services/koios-news-site/issues/16).

**Question:** Which claim-source and context measures predict independently evaluated accuracy, accessibility, comprehension and reader task success—not just body length or an owner depth threshold? Separately, what typed authority/effect states preserve client sovereignty across preparation, review, approval, scheduling, sending/publication, public witness, correction and final acceptance?

**Pinned observation:** the [Koios structural-validity assay](./koios-structural-validity-identifiability-20261011.md) records a 2026-10-11 76-article owner cohort: 38 owner structural passes and 38 failures; all 76 with unavailable source-evidence sensors. No reader truth is identified by this rate. Do not repeat that measurement as a live 2026-10-13 count without new sampling. The [newsroom throughput protocol](./koios-throughput-causal-study-20261011.md) tests a distinct causal bottleneck—whether writing capacity changes **independently released** editions; do not reuse its story-attempt units as article-quality cases without a typed mapping.

**Coesite assay:** freeze article cohorts and sample inclusion probabilities; obtain independent blinded source-claim labels, omission/uncertainty assessments, accessible reader tasks, inter-rater disagreement/abstention and independent public effect readbacks. Trace approval authority and correction acknowledgments by revision. Compare source/context metrics against a word-count-only baseline. Distinguish owner score, provenance observability, validated claim, reader result and customer receiving as separate fields.

**Falsifier:** the richer measure fails to improve prespecified held-out reader/source adjudication performance; provider execution cannot be tied to an independently authorized/observed public effect; or an alleged released new edition has no independently identifiable fresh content/witness. **Disposition:** typed publishing state invariants can go to Engineering; reader utility, causal quality and customer value remain scientific field questions.

Related existing precise protocols: [field-effect validation](./field-effect-validation-protocol.md) and [temporal source/revision fact checking](./temporal-source-revision-factchecking-20261011.md). Maintain their specialized instruments rather than cloning them into this program document.

## CS-04 — Instrument validity, opportunity cost and abstention

**Demands:** Koios [analytics access #2](https://github.com/causeway-services/koios-news/issues/2), [analytics permission #3](https://github.com/causeway-services/koios-news/issues/3), [AdSense diagnostic #45](https://github.com/causeway-services/koios-news/issues/45), and cross-service assurance under Science #69.

**Question:** When does paying to observe additional data change a decision enough to justify observation/intervention cost, compared with provider repair, a public witness or no action?

**Coesite assay:** classify missingness (permission denied, unsupported API, delayed freshness, invalid credentials, selection gaps, censored outcome) and compare the expected action change under cheaper and more costly observations. EVI = expected decision-loss reduction from new information **minus** information and operational costs; estimate with bounded uncertainty and consider reversibility and consequence. Do not infer traffic, revenue, cause or customer outcomes from missing provider access.

**Falsifier:** newly purchased/collected evidence does not change decisions, reduce out-of-sample regret or meet predeclared minimum net value. **Disposition:** repairing a broken authorized provider permission or validating a required receipt field is an Operations/Engineering task, *not* new Science unless construct uncertainty remains. No credentials, billing acts or paid data acquisitions are authorized by this document.

## Reusable scientific obligations and receiving gates

1. **Measurement:** declare observation, scientific construct, unit, instrument revision, discriminant validity, uncertainty and missingness; preserve observed/inferred/modelled/normative distinctions.
2. **Time:** source identity, revision, published/effective/observed/received instants, contradiction and supersession form one provenance chain; conflicting assertions remain visible rather than silently overwritten.
3. **Authority:** who asserted, who verified, who may authorize and who independently received an actual effect are different relations. Align with existing PTGAE and SignCell/SignChain semantics instead of inventing a parallel ontology.
4. **Decision:** assess task success, accessibility, cost, uncertainty, alternatives and when *not* to intervene. Compare EVI against a no-new-measurement baseline.
5. **Handoff:** Coesite furnishes a real manifest, frozen selection, verified rights, executable outputs, uncertainty and independent run receipt; Science either qualifies the conclusion, refutes it, or returns **unassayed/not identifiable**; Engineering receives reproducible deterministic tests; Causeway independently accepts customer effects. Neither an issue nor a source commit closes the chain.

Already studied or implemented instruments remain in their owning modules; see [effect evidence field protocol](./field-effect-validation-protocol.md), [owner-metric identifiability](./koios-structural-validity-identifiability-20261011.md), [newsroom-throughput study](./koios-throughput-causal-study-20261011.md), and [recovery ledger](./recovery-ledger-20261011.md). Reuse relevant Lenticule work on PTGAE #54, reader-task/accessibility #56, restricted rewrite proof #57, English #59 and SignCell/Chain/Graph/Craft #60. Old standalone CS-01…04 Coesite parameter notes are superseded by this contract; preserved Git history remains available for audit.
