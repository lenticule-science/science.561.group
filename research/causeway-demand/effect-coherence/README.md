# Causeway-derived Science: effect-coherent evidence (2026-10-11)

**Scope:** Lenticule Science research instrumentation, not a deployed Causeway service. Sources are current owning GitHub work, not inferred public complaints:

- Causeway Koios.News Site issue #16: https://github.com/causeway-services/koios-news-site/issues/16 (correction/accessibility intake: explicit receiver, independent delivery readback, accessible task success).
- Causeway Public Services issue #17: https://github.com/causeway-services/public-services-section/issues/17 (multiple sellers, entitlement, delivery, payment/settlement).
- Causeway Public Services issue #20: https://github.com/causeway-services/public-services-section/issues/20 (OfferFlow scope/payment/fulfillment/acceptance state).
- Causeway Koios.News issue #57: https://github.com/causeway-services/koios-news/issues/57 (new article throughput vs writer outage).
- Causeway Koios.News issue #65: https://github.com/causeway-services/koios-news/issues/65 (requested revision vs older draft regression; **existing engineering policy/test reconciliation**, not a new research mandate).
- Existing Lenticule receiving: https://github.com/lenticule-science/science-services-section/issues/69 .

## Scientific result — a quantified logical error

Let E be an effect cohort and S the list of required evidence stages. Write R(e,s) when stage s is positively evidenced **for that same effect**. Union-of-stages acceptance checks

    (∀s ∈ S)(∃e ∈ E) R(e,s),

but coherent completion requires

    (∃e ∈ E)(∀s ∈ S) R(e,s).

The second implies the first; the converse is false for at least two effects and two stages. For 2 effects and 2 stages, the diagonal relation R={(A,delivery),(B,acknowledgement)} witnesses the distinction. In the finite Boolean incidence model with k effects and n stages, the number of relations accepted by naïve stage union is `(2^k - 1)^n`, versus `2^(kn) - (2^n - 1)^k` accepted by coherent effect grouping. With two effects and seven stages, 2,187 incidence patterns pass the naïve condition but only 255 meet the coherent condition; **1,932** are spliced positives. These are combinatorial possibilities, **not production false-positive rates**.

The accompanying executable model enumerates every Boolean incidence relation through 3×3 and matches the closed-form counts.

## Reproduced work-reference bug

The previous structural cohort candidate checked effectRef and evidenceId but did not reject an event explicitly labeling a different originating `workRef`. A new negative control failed before the guard and passed after introducing:

    if (Object.hasOwn(row,'workRef') && row.workRef !== workRef)
      throw new TypeError('work reference mismatch');

This cannot authenticate an event that omits its workRef; it prevents a narrower, reproducible provenance relabeling defect. Authenticating effect manifests still requires an independently trusted provider witness.

## Test results and scope

With Node.js 22.16.0:

    node --test *.test.mjs       # 55/55 passing
    node controlled-benchmark.mjs  # 150 constructed cases

The controlled benchmark deliberately engineers 100 naïve false-positive cases and 25 positive cases. The effect-binding assay conditionally rejects those 100 negatives while accepting the 25 positives. It is not a field accuracy estimate, a security review, or an independent customer receiver.

## GitHub state as checked

The branch `lenticule-science/science-services-section@science/causeway-effect-receiving-20261011` contains the **earlier** cohort module (blob `ad69ddb596a0c47d0b1995ec78132093c7774355`) and a minimal negative-control test, under commits including `889b912fb64365020231e54ddce74d08e09fdbe6`. The branch is unmerged. The code in this packet has a new workRef guard (blob `df426840e7bbea366cbd67418c35c768d35c3306`) and the broader test suite. Normal GitHub update, richer test write, and pull-request creation were refused before dispatch; readback confirms those changes did not land. Do not count the packet as merged, deployed, scientifically adopted, or independently received.

## Falsification and next step

Run authenticated multi-provider traces from real Causeway operations with a competent independent receiver, then measure both incorrectly accepted completions and rejected authentic effects. A real, properly authenticated completed transaction rejected solely because legitimate provider components cannot share a manifest is a falsifier of the current binding rule. Keep payment receipt, service delivery, accessibility task success and customer acceptance separate, even if one actor occupies multiple offices.

## Additional independently reproduced defect in current Science main

The current merged `research/public-feedback/evidence-assay.mjs` v0.3 (blob `b39de2fa97370532794cda3c697b4b60c79e523e`) validates observation timestamps using a format prefix and `Date.parse`. JavaScript normalizes `2026-02-30T00:00:00Z` to March 2, so the current predicate returns true for an impossible February date. The enclosed `timestamp-candidate.mjs` and targeted regression test add Gregorian month lengths, leap years and UTC-offset bounds. That isolated test passed locally; full repository tests after integration have **not** been run. Two unified diff files show the exact proposed source and regression changes. A normal GitHub update was refused before dispatch, and authenticated readback had earlier pinned the uncorrected main implementation. Do not claim this fix is merged.

The Causeway-derived agenda previously merged through Lenticule PR #70 was **not lost**: the repository layout-convergence merge subsequently moved it, preserving blob SHA `af056d9e0b03732f3749eef441ff606b86715f58`, to:

`services/social-science-services-section/services/economics-and-business-science-services-section/services/business-science-services-section/content/text/documents/articles/notes/2026/10/11/causeway-demand-derived-science-agenda-20261011.md`.

The schema likewise lives under that business-science section's `data/records/schema/`. The old `research/causeway-demand/...` link on main was superseded by a valid migration. This is a verified path correction, **not** evidence that the merge was discarded.
