# Causeway remuneration-invariance study: stricter comparability before inference

**Date:** 2026-10-11 08:38 CDT observation window.  
**Science status:** candidate comparator; synthetic controls passed; no causal field result.  
**Input boundary:** Causeway GitHub issues, PRs, and the Hearing Access public gate. No client records or actual health data.

## Demand and source lineage

The `causeway-services/public-services-section` Hearing Access presentation gate (commit blob `c1b750abf0b20c6cf96496db733f98df8353af28`; PR #30) checks that `view.startHere` is a minimum-ranked upstream eligible option. Its header explicitly disclaims diagnostic work and suitability ranking, and requires independent authentication of upstream receipts. It is a *presentation* assay, not a ranking-policy assay. Both remuneration-invariant and remuneration-dependent ranking policies can satisfy this local property.

Relevant neighboring services that need the same scientific distinction include AI Visibility Assurance (#6) and OfferFlow (#20). Separately, Causeway's seller intelligence and marketplace requirements (#17 and personal Decision Intelligence #2) need source provenance and genuine outcome measurement. No production merchant bias is alleged.

## Core proposition and observables

Define a decision procedure **D** accepting consumer-relevant case **x**, policy/config revision **θ**, provider remuneration vector **r**, and deterministic seed **u**. It returns: default recommendation, a suitability-rank vector, an organically visible option *set*, and its ordered presentation. Clearly marked paid placements are a separate dimension, provided upstream suitability ranking is unaffected.

The tested *conditional* invariance hypothesis is:

> For verified fixed x, θ, u and eligible option set O, replacing r with r′ does not change the decision-relevant outputs D(x,θ,r,u).

The falsifier is a changed output under an *authenticated remuneration-only intervention*. If prices, product availability, customer circumstances, reasons, scope, policy, seed, or verification change, then the contrast is **unassessable**. A stable output is evidence only for that frozen case and perturbation; neither proof of global independence nor a customer outcome.

## Defects found in the first Science candidate

The first committed comparator was placed on Lenticule branch `science/causeway-incentive-invariance-20261011`, commit `42c27c667bcbdbf015d49cfec839f84d8a5cf50a`, source blob `b21139f57a2906d936ab190a484cec49046fadea`.

1. **Visibility-order false negative.** The comparator sorted visible option IDs before comparing, turning a remuneration-dependent display-order change into a false `invariant` classification.
2. **Consumer-option comparability false negative.** The comparator projected only option ID, class and evidenceRef. Changed customer price, availability, rationale, or nested offer terms could slip through unchanged pins and produce a false payout-only inference.

The patched Science method preserves stable object semantics while comparing all supplied frozen option facts except `suitabilityRank`, which is the measured dependent variable. It also compares visible-order separately from visible-membership. Canonical key ordering avoids differences caused solely by JSON property order.

An external `verifyFrozenEvidence:()=>true` is **only** a caller assertion, not an authentication scheme. Reliable field work must bind and independently authenticate evidence contents, customer-facing terms, policy source/config revision, random seed, and source authority. This v0 module cannot infer their provenance.

## Experimental structure and negative controls

1. Pre-register the buyer decision, available options, consumer-facing prices and rule revision before collecting outputs.
2. Run paired counterfactuals in a controlled environment, with only merchant remuneration perturbed.
3. Independently attest the content of every frozen factor; refuse unsigned or stale assumptions.
4. Preserve four outcome dimensions independently: default, ranking, membership and ordered display.
5. Report an exact denominator for fully comparable pairs, unassessable pairs and apparent violations. Do not treat abstention as correctness.
6. Independently measure any *downstream* reader task outcomes if the service is going to claim usefulness, accessibility, or customer harm prevention.
7. Evaluate with at least one paid/free/professional option mix; use no-payment and swapped-payout negative controls; distinguish legitimate separately disclosed paid placement.

The repository-ready fixture includes payout-only invariant, altered default/rank/visibility, changed price/availability/reason/nested terms (unassessable), missing trusted verifier, duplicated IDs, and property key-order controls.

## Receiving / authority

Scientific receiving requires tested source and falsifying controls, with explicit limits and exact revision. Engineering can turn the comparator into a gate only after binding real provider-native evidence and the exact decision system. Causeway's public receiving requires independent observation of a deployed effect and appropriate customer review. Source commits, passing unit tests, and matching opaque receipt strings do **not** establish either.

## Distinct service demand surfaced in this window

Causeway's `morgan-sennhauser-personal-services-section#2` describes a Supply-Chain Shock Dossier whose material claims must distinguish observations, derived mechanisms, forecasts, scenarios, contested evidence and unknowns; its scientific receiver should study calibration and scenario sensitivity separately from the present remuneration experiment. TaskBounty integration (`public-services-section#21`) is primarily an existing economic adapter/operations problem, not a warrant to invent new fundamental research absent observed ranking, uncertainty or settlement contradictions.

## Reproduction

Run `node --test choice-incentive-invariance.test.mjs causeway-pointwise-counterexample.test.mjs` and `node compare-committed-vs-corrected.mjs`. The latter reproduces the two false conclusions in the original committed candidate. Inputs are synthetic, so observed accuracy is not transferable to real provider data.
