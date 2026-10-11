# Causeway → Lenticule Science: incentive-invariance research v2

Date: October 11, 2026. Synthetic methodological finding, not a measured Causeway revenue-influence incident.

## Demand and source

Causeway's Hearing Access presentation assurance (`causeway-services/public-services-section` PR #30) checks that the default has minimum upstream-supplied rank. Reproduced its exact Git blob c1b750abf0b20c6cf96496db733f98df8353af28 in `causeway-hearing-offer-public-gate.mjs`. Two packets with opposite upstream ranks both pass this pointwise gate. The file explicitly delegates ranking and verification of upstream receipts. Its behavior alone does not prove that actual rankings depend on remuneration.

## Science result and scope

A pointwise condition default = argmin(rank) cannot imply counterfactual independence of default/ranks/organic presentation from provider remuneration. The paired Science assay requires a frozen customer-relevant evidence pin (including customer price), option/evidence identities, an explicit remuneration perturbation, and external verification. Without these it returns *unassessable*. No customer or medical data are ingested.

## What landed and what did not

Committed to Lenticule branch `science/causeway-incentive-invariance-20261011`: `services/social-science-services-section/lib/decision-science/choice-incentive-invariance.mjs`, commit 42c27c667bcbdbf015d49cfec839f84d8a5cf50a; blob b21139f57a2906d936ab190a484cec49046fadea. This is `github-committed-candidate.mjs` in this packet.

A subsequent local negative control found that the committed candidate ignored *visible option ordering*, which can change exposure while keeping defaults, ranks and visible sets unchanged. The locally corrected `choice-incentive-invariance.mjs` detects both visible-set and visible-order drift; `order-drift-reproduction.json` contrasts the two on identical synthetic inputs. The correction write, test write, research note write, PR creation, and issue comment were blocked before GitHub dispatch. No review/CI/merge/production receiving is claimed. Do not deploy the uncorrected branch as a complete incentive-neutrality control.

## Verification

`node --test *.test.mjs`: 13 tests pass, including three exact-Causeway-source controls, nine earlier invariant-assay controls and one visible-order negative control. The corrected source SHA differs from the committed blob intentionally. See `sha256-v2.txt` and `test-results-v2.tap`.

## Engineering and Science receiving

Deterministic known requirement: compare upstream independently authenticated frozen-Q paired presentations with *only merchant remuneration* perturbed, and flag changed default, suitability rank, nonpromotional option visibility or order. A passing presentation-only gate or string-valued receipt does not prove the causal condition. Research remains for sampling actual options, identifying stable customer-relevant evidence, estimating reversal risk with abstention, and independently observed buyer task outcomes. No paid placements, new merchant relationship, patient profiling or external deployment authorized.
