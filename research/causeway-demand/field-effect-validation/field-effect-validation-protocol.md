# Causeway → Lenticule: field-effect validation protocol

Date: 2026-10-11. Classification: proposed Lenticule Science research method, NOT a field measurement or customer acceptance.

## Live source witnesses and current effects

- Causeway `koios-news` PR #88, merged 2026-10-11 05:28:17 UTC as `b15f3b0d2216902379cfe26341aef5fb7ece2ace`: authenticating GitHub publisher identity and inspecting exact title, initial marker, author, issue state before rewriting diagnostics. Source: https://github.com/causeway-services/koios-news/pull/88.
- Causeway `koios-news` PR #89, merged 2026-10-11 05:48:44 UTC as `ee17e4c4eaafff79a75de03cec3e8c1c07558b07`: 26 source-bound CLI synthetic tests of that publisher. Source: https://github.com/causeway-services/koios-news/pull/89.
- Causeway correction/accessibility intake requirement: https://github.com/causeway-services/koios-news-site/issues/16. Reader receiver and deployed intake remain independently unverified.
- Causeway multi-seller marketplace requirement: https://github.com/causeway-services/public-services-section/issues/17. Do not infer independently settled orders from blockchain transfers.
- Causeway OfferFlow service requirement: https://github.com/causeway-services/public-services-section/issues/20. Do not combine distinct customer journeys into a single completed order.
- Lenticule receiver: https://github.com/lenticule-science/science-services-section/issues/69.

## New negative control: identity ambiguity in a service publisher

The exact source from Koios PR #88 retains `issues.find(x => diagnostic(x,name))`. Two publisher-authored issues with identical qualified title, leading marker and allowed state both satisfy `diagnostic`. The first element wins, so reversing API list order changes the selected issue identity. This is **an input-level structural counterexample**, not evidence that duplicates exist in live Koios or that the publisher has selected the wrong issue in practice. PR #89's merged test cases cover wrong author, title, markers, invalid state/ID, truncated scans, etc.; its shown tests do not cover two same-publisher eligible issues. A fail-closed **unique-match** rule is a qualified deterministic Engineering regression, not a new basic-science project. The included test demonstrates the counterexample and a candidate unique-selection guard.

## Empirical Science question

For actual multi-provider service effects, estimate both:

- false completion = P(classifier says complete | independent truth incomplete, classifier does not abstain)
- false rejection = P(classifier says incomplete | independent truth complete, classifier does not abstain)

The denominator is a **distinct `(workRef,effectRef)`**, with pinned source revision and provider reference. Never use number of provider events, issue comments, stage flags, or payment transfers as the number of customer outcomes. Report abstention, missing adjudication, unusable provenance, and qualified denominator separately. If the adjudicating receiver is also the issuer, do not accept that label as independent.

## Research design and falsifiability

1. Predeclare service, sampling unit, window, source revision, consent/privacy rules, materiality and candidate assay version. Sample failures as well as successes and include unresolved items without silently deleting them.
2. Obtain provider-native state and immutable effect/revision identity. An authenticated provider author does not imply factual warrant of their text. Do not let a mutable body marker substitute for stable identity or guarantee unique selection.
3. An independent qualified receiver adjudicates each effect as complete/incomplete/indeterminate, ideally blinded to classifier verdict. The `verifyAdjudication` callback is merely a trust boundary: a caller that returns true for fictional evidence can still fabricate a label.
4. Compare candidate verdict complete/incomplete/abstain against trusted labels. Count false positives and false negatives separately; do not score unknown, untrusted or abstained as correct.
5. Stratify by service and evidence provider. Report Wilson 95% intervals only as conditional binomial summaries when observations are sufficiently independent; for repeated clustered effects use clustered bootstrap/appropriate design-specific intervals. Do not confuse zero errors on tiny N with validated reliability.
6. A consuming service sets its own predeclared material risk and false-completion threshold. Science does not invent a universal acceptable service-risk tolerance. Re-assay after provider/version drift.

Negative controls: cross-effect stage union; wrong work_ref; mismatched source revision; duplicated evidence identity; missing independent receiver; multiple same-author matching diagnostic issues; impossible Gregorian timestamp; and incomplete provider readback.

Falsifier: a claimed effect classification failing the predeclared error tolerance against a verified field sample, or a valid same-effect multi-provider completion systematically rejected because the manifest/protocol cannot represent its legitimate component structure.

## Validity and current limitations

The included candidate assay and controlled benchmark operate on **synthetic** examples. All successful tests establish only internal consistency and boundary behavior, not actual field false-acceptance rates, independent customer acceptance, source-authentication guarantees or provider delivery. No client-private data, financial records, subscriber lists, secrets or person identifiers are included.
