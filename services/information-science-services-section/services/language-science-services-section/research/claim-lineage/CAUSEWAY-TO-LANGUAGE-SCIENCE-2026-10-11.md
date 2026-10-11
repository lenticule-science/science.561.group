# Claim lineage and reporting-task coverage: a Source → Language Science assay

**Date:** 2026-10-11. **Status:** candidate Science method with executable **synthetic** falsification controls. Not a verified news quality metric, a natural-language parser, a field study, or a production publication admission rule.

**Owning research section:** `lenticule-science/science-services-section/services/information-science-services-section/services/language-science-services-section/research/`. **Existing Science work:** `lenticule-science/science-services-section#61` (PlainEng compositional constrained English), research introduced in PR #63, and Causeway-derived Science receiver #69. This is a proposed addition *within* that existing program, not a new sovereign science program.

## Fresh Causeway demand, and what it does not establish

- `causeway-services/koios-news#4` was updated on 2026-10-11 at 13:57:48 UTC. Its issue body reports **38 published articles** below the newsroom's current article-depth/context-section threshold; the stated observation is 2026-10-11 13:57:13.780 UTC. This is a producer's monitored *article-length deficiency*, not independently measured reader comprehension, truthfulness, or completeness. The issue gives `data/feedback/latest.json` as evidence. That file was not retrievable through the owning repository's accessible main contents endpoint in this investigation; evidence beyond the issue statement remains unverified.
- `causeway-services/koios-news#91` is an **open PR** observed as updated 2026-10-11 14:35:02 UTC. It corrects the current writing skill's blanket requirement to hedge closings, replacing it with evidentially appropriate treatment of **facts, attributed forecasts, commitments, uncertainty, and commissioned format**. This is authored proposed instruction, not yet independent publication effect.
- `causeway-services/public-services-section#16` requires customer-owned publication voice, evidence, admission decisions and native delivery receipts. A manuscript receipt is not customer consent to publish.
- `causeway-services/public-services-section#14` separately distinguishes publicly sourced **program eligibility rules** from a **particular client's eligibility**, preserving private applicant facts in client territory.
- `causeway-services/public-services-section#6` separates eligibility, entity resolution, retrieval, citation, representation and actual customer action. An AI mention is not proof of customer conversion.

The common scientific question is whether the transformation **from a source utterance into a rendered public assertion** preserves both the asserted proposition and the *kind of evidential/illocutionary act*, and whether a commissioned task's critical questions were addressed. A post's word count and number of headings can be useful operational triage variables, but neither implies success on those two questions.

## Derivation: marks → articulated utterance → interpreted claim → published utterance

Use the existing Lenticule Language Science multi-sorted construction: **M** source marks and spans, **U** uttered articulations and speech situation, **G** grammatical analyses, **I** contextual interpretations, **P** candidate predications/propositions, **E** evidence, **A** authority and **X** external effects. Source publication isn't evidence of claim truth; plausible interpretation isn't permission to publish or proof of customer reception.

For source claim records **S**, rendered claim records **R**, and a contractually selected required set **Q ⊆ S**, propose the partial structural lineage relation:

`L(s,r) ↔ source_claim_ref(r)=id(s) ∧ proposition_ref(r)=proposition_ref(s) ∧ scope_ref(r)=scope_ref(s) ∧ source_revision(r)=source_revision(s) ∧ act_kind(r)=act_kind(s) ∧ temporal_conditions(r)=temporal_conditions(s)`.

Then `task_coverage(Q,R) = |{s ∈ Q : ∃r ∈ R L(s,r)}| / |Q|`, when `|Q| > 0`. An empty commissioned claim set yields **unassessable**, not 100% coverage. The numerator is a *typed-lineage bookkeeping measure*, not a truth, accuracy, or human comprehension score.

Kinds in the candidate v0 instrument are `fact`, `attributed`, `commitment`, `forecast`, `scenario`, and `unknown`. **These are distinct speech/epistemic acts, not an ordered certainty scale.** The method refuses automatic substitutions between them. For example, “Company X promised to expand” and “Company X has expanded” differ in act-kind and target event; changing “will” to “might” or vice versa by style rule is not a valid substitute for evidence-bound interpretation. A forecast's conditions and horizon must remain pinned. Claims with changed evidence may be correct for *new reasons*, but demand a new source-lineage assessment rather than being waved through as equivalent.

### Negative controls and current instrument

`claim-lineage-assay.mjs` is a pure Node.js method accepting authored typed claims. `claim-lineage-assay.test.mjs` covers **20 synthetic fixtures** including: short-but-complete vs longer-but-incomplete briefs; commitment→fact, attribution→fact, fact→scenario; forecast time/condition drift; source-revision drift; invented claim references; proposition drift; duplicate and missing identity; a zero-denominator abstention case; permutation invariance; grant rule→applicant eligibility; AI mention→conversion; and nonrequired but honestly sourced facts. A structural mismatch is not automatically false reporting; it is an explicit warrant to inspect changed evidence and intention.

The current executable module does **not** authenticate an actual source, read English prose, prove natural-language entailment, determine when a reported source deserves belief, guarantee complete coverage of the newsworthy events, model rhetorical salience, or validate subscriber/customer receiving. Callers can fake `propositionRef` or `scopeRef` strings. Thus it is appropriate as a **counterexample fixture/provisional research instrument**, not a gate with externally trusted verdicts.

## Proposed scientific receiving before Engineering integration

1. **Pre-register** several commissioned story tasks across Koios formats and at least one grant-intelligence/AI-visibility packet, identifying required informational questions *without looking at the rendered output*. Preserve explicit source/claim revisions and allowed attribution.
2. Independently annotate source utterances and published utterances for **proposition, scope, speech act, agent, temporal horizon, conditions and source evidence**. Use two blinded qualified annotators; retain disagreements as unresolved rather than manufacturing a gold truth label. Establish reliability on pilot material before declaring a production threshold.
3. Construct paired controlled manuscripts: one concise but sufficient, one lengthy yet missing a required question, and one same-length version that upgrades a promise into an accomplished fact. Compare simple word-count/context proxies, structural typed assay, and independently adjudicated reader-task outcomes.
4. Report **false acceptance**, **false rejection**, **unassessable rate**, disagreement and editor/reader time costs by source type, format and manuscript revision. Pre-register the decision cost of each error. Group repeated manuscripts and source revisions when estimating uncertainty; synthetic pass counts cannot calibrate field rates.
5. **Falsify** the candidate if knowledgeable annotators cannot produce reproducible typed lineage, if adversarial same-ID/content-shift cases are wrongly counted as verified without cryptographic/provider readback, or if typed coverage fails to predict independently measured commissioned-task success better than the operational length proxy under the chosen error costs.
6. Only after that qualification, specify an Engineering interface: source-span/revision receipts, partial/ambiguous natural-language interpretation, typed SignCell/SignGraph evidence, abstention on unknowable entailment, and distinct publisher authority/delivery receipts. Publication admission and independent public acceptance remain owned downstream.

**Observation boundary:** All 20 passing fixtures are synthetic and include no private client or subscriber information. No empirical article-quality improvement, client-grant eligibility, AI conversion, or deployed publishing fix has been demonstrated.
