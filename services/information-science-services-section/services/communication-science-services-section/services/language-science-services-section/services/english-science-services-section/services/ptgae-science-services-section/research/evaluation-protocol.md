# PlainEng empirical evaluation and annotation protocol — proposal 0.1

**Status:** Designed, not executed; no human-study results or claims of superiority. **Date:** 2026-10-10.

## Purpose and units

Determine when PTGAE improves **readers' comprehension and task completion** while preserving material meaning and respecting constraints. Analyze document × task × reader group × register × revision version rather than assuming every short sentence succeeds. Avoid using model self-ratings as a substitute for reader outcomes.

## Pilot materials

Assemble separately licensed, traceable examples of: federal/public service instructions; incident receipts and operations; scientific explanations; technical APIs and software manuals; mathematical definitions and theorems; legal/financial/safety notices; and accessible/multilingual uses. Each case keeps original source revision, domain, audience, task, factual dependencies and full trace of proposed revisions.

For each source include: (a) original; (b) writer/domain-approved PlainEng candidate; (c) baseline generic plain-language revision when available; (d) one **counterexample** rewrite that improves surface readability but changes the claim. No real participant sees an unsafe counterexample without a risk-reviewed study protocol.

## Annotation contract (candidate schema)

An annotation contains `exampleId`, `sourceUri`, `sourceRevision`, `licenseOrUseBasis`, `languageTag`, `audience`, `taskId`, `riskClass`, `original`, `candidate`, `sourceSpan`, `proposedRuleIds`, `protectedSpanIds`, `invariantJudgments`, `epistemicEffect`, `normativeEffect`, `classification` (preserves | drifts | indeterminate), `annotatorRole`, `reviewTime`, `rationale`, and `adjudicationStatus`.

Double-annotate at least a trial sample. Report raw agreement and a chance-corrected statistic when the label distribution and design justify it. Preserve disagreement and uncertain labels, rather than coercing agreement. Split training/calibration and evaluation cases by source document or family to avoid leakage.

## Reader-task experiment

Pre-register audiences and recruitment, inclusion/exclusion criteria, source/task stratification, primary outcome, sample-size calculation, statistical model and correction for multiple comparisons. Consent and privacy rules apply. Randomly assign revision conditions with counterbalanced tasks (or between-reader designs for learning-sensitive materials). Collect task completion and material errors, reading/findability time, correct paraphrase, confidence and self-reported effort; handle dropouts and censored time transparently.

Report subgroup differences with uncertainty; do not assume “General American” means the same literacy, cognitive load, register knowledge or accessibility needs. Human evaluation can involve screen-reader users, low vision, English learners and field experts when justified and consented.

## Primary and secondary outcomes

- **Primary:** correct completion of the stated task without material error, under a preregistered scoring rubric.
- **Key guardrail:** count and severity of semantic/authority/evidentiary drift among revisions.
- **Secondary:** paraphrase fidelity, decision time, useful information found, confidence calibration, cognitive effort, accessibility barriers and satisfaction.
- **Engineering diagnostics:** false positives/negatives per PTG rule, detector span accuracy, parser fidelity, successful abstentions, idempotence and computational cost.

Readability formulas are descriptive predictors only, not proof of clarity. Blind reviewers to which variant is the PlainEng one where feasible.

## Gates

1. Produce a **pilot corpus** with positive/negative examples and verifiable use rights.
2. Pilot the annotation handbook on disagreement-heavy cases; revise labels before evaluating models.
3. Run bounded machine baselines and independent source-span checks.
4. Obtain any institutional/ethical approval needed for participant research, then execute an adequately powered reader experiment.
5. Record results, limitations, null findings, adverse effects and approved rule changes. Preserve old versions.

Tracked in [science issue #56](https://github.com/lenticule-science/science-services-section/issues/56) and [engineering conformance issue #4](https://github.com/red-cup-engineering/ptgae-engineering-services-section/issues/4).
