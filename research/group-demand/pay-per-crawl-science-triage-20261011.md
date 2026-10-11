# Pay Per Crawl: scientific triage for 561 Group

Date: 2026-10-11. Status: hypotheses and protocol, not a test result.

## Demand and known platform facts

The Leader directs internal Pay Per Crawl learning, a service for operators, SaaS, and practical publishing. This is accepted founding demand, not contingent on scientific proof.

Cloudflare's current documentation distinguishes offered price on HTTP 402 from a charge assertion on successful retrieval and from a site's accounting settlement:
- https://developers.cloudflare.com/ai-crawl-control/features/pay-per-crawl/use-pay-per-crawl-as-ai-owner/crawl-pages/
- https://developers.cloudflare.com/ai-crawl-control/features/pay-per-crawl/use-pay-per-crawl-as-site-owner/set-a-pay-per-crawl-price/
- https://developers.cloudflare.com/ai-crawl-control/reference/graphql-api/
- https://developers.cloudflare.com/ai-crawl-control/features/pay-per-crawl/use-pay-per-crawl-as-site-owner/advanced-configuration/

**Conclusions directly testable by Engineering, no new Science needed:** a priced offer is not a payment; a charge assertion is not cleared merchant funds; a crawler hit is not a model-training use or an AI citation; analytics user-agent strings alone do not authenticate crawler identity. Required free-discovery routes need explicit exclusion tests. Use a source-specific evidence state and do not sum cross-account assertions as sales.

## Scientific questions

1. **Incremental net publisher value:** Does enabling a charge policy produce independently verified net proceeds after cost and effect on eligible request traffic, rather than only more 402s? Primary response: net proceeds per predeclared eligible page cohort-day, with cleared settlement linked to request cohorts. Secondary: eligible demand, error fraction, reader referrals. Never substitute request or 402 counts for revenue.
2. **Price response:** Holding comparable content and identified crawler populations fixed, how does permitted price variation change qualified requests and completed accesses? Price differences across unrelated page classes are confounded by content value. Observe cohorts and periods before designing a bounded intervention.
3. **Operator-task validity:** Can a consenting operator configure and verify intended access rules, inspect activity, and detect accounting mismatches without assistance? Primary response: independently witnessed task completion, errors and time. Completion of a source deployment is not customer acceptance.

## Falsifiers, controls, and uncertainty

Freeze page cohorts, periods, crawler strata, comparison treatment, exclusion rules, missingness, materiality thresholds and analysis revision before looking at outcome differences. If a controlled rollout is not authorized, report observational comparisons and confounding rather than inventing a randomized effect. Count unpaid requests, repeated retrievals, provider errors, empty traffic and excluded paths separately. Use holdout periods and independent ledger reconciliation before claiming margin.

Falsifiers: claimed net benefit disappears under reconciled costs; price-response model does not predict held-out qualified traffic; an operator cannot detect a planted synthetic accounting mismatch. If the settlement source is absent, classify *unassayed*, not zero revenue. If a group lacks exposure, classify *no information*, not a failed market.

## Engineering-ready evidence contract

Create a versioned record linking eligible request cohort, policy revision, platform observation time, priced offer, charged-content assertion, merchant settlement evidence, and independent receipt. Keep every stage separately nullable with provenance and a reason code. Test negative controls: 402 without payment; a platform-only charge assertion; an unauthenticated crawler label; unrelated settlement; duplicate request; excluded/free path; a changed policy revision. None proves collected payment or trained models.

Coesite receives a deployment/runbook and performs independent real account/runtime reconciliation. Causeway receives a customer-facing setup/audit service and user-task evaluation. No account, security, billing, or public policy changes are authorized by this scientific note.
