# Institutional individuation: predictive-closure assay and receiving

**Status (2026-10-13):** finite-state mathematical oracle independently checked; Engineering test implementation merged and a provider-reported CI run succeeded. No measured institutional event series, field validation, autonomy determination, or Board recognition. This is the single current Science protocol and receipt for this assay.

**Authority and lineage:** [Group Board demand #2](https://github.com/561-group/561-group-board-of-directors-leader-movement-team/issues/2); [Science fixture](./institutional-individuation-lumpability-cases.json); [independent Science recomputation](./individuation-lumpability-independent-check.json); [Engineering receiver #61](https://github.com/red-cup-engineering/engineering-services-section/issues/61); [merged Engineering PR #62](https://github.com/red-cup-engineering/engineering-services-section/pull/62). Supersedes the separate 2026-10-11 Scientific Receiving and Engineering CI Receipt narratives; their history is preserved in Git.

## Claim and measurement

Let X be a finite state set; P(x,z) a row-stochastic transition kernel; π:X→Y a declared partition. Write q_x(B) = Σ_{z:π(z)=B} P(x,z) for each target block B of Y. The partition is **strongly lumpable** precisely when, for all x,x' with π(x)=π(x') and every B, q_x(B)=q_x'(B). In that case the quotient Q(π(x),B)=q_x(B) is well-defined. Compute the bounded defect

    ε_TV(P,π) = max_{π(x)=π(x')} (1/2) Σ_{B∈Y} |q_x(B)-q_x'(B)|.

Set the maximum of an empty pair collection to zero for singleton blocks. For this fixture, compare ε_TV to the declared absolute numerical tolerance 1e-10. Report both the numerical defect and Boolean verdict; a tolerance-relative computational classification is not a theorem of exact equality. All rows must be finite, nonnegative, and sum to one at the declared tolerance; partition labels must be total and valid. The identity and one-block partitions are deliberately **non-discriminating controls**: exact closure under either does not establish a useful institution boundary.

The observable proposed for future fieldwork is *out-of-sample predictive closure of a declared state aggregation*, not juridical standing, consent, political legitimacy, personhood, governance competence, or organizational autonomy. A positive synthetic result establishes no institutional fact. The Group Board alone makes recognition/governance decisions.

## Fixed synthetic oracle and independent evidence

The 2026-10-11 four-case [fixture](./institutional-individuation-lumpability-cases.json) has Git blob SHA **65d2ec61d6800eed79a6b623816203999480fba0**, frozen in Engineering's vendored input and asserted by its regression suite. Expected classifications and independently recomputed defects:

| Case | ε_TV from independent check | Strongly lumpable? | Discriminating? |
| --- | ---: | :---: | :---: |
| exact_nontrivial | 2.78e-17 | Yes | Yes |
| one_representative_changed | 0.10 | **No** | Yes |
| one_block_degenerate | 5.55e-17 | Yes | **No** |
| identity_degenerate | 0 | Yes | **No** |

Floating-point residuals near zero do not falsify the exact matrix oracle at its specified tolerance. The independent check records `pass: true` for *all four* because each matched its **expected** classification; the perturbed case still **fails** strong lumpability. The [independent-check file](./individuation-lumpability-independent-check.json) documents independent block-sum/pairwise-TV recomputation and passing stochastic-row checks; it is not a second empirical dataset.

Engineering delivered a distinct Node evaluator and tests in [PR #62](https://github.com/red-cup-engineering/engineering-services-section/pull/62), merged as commit **d1147939c3e448f4cf679aebfb12b1226d805bb7**. Workflow committed as **ec269c656ba25c2b576055532b4c1923ff30b38a**. [CI run 38179360411](https://github.com/red-cup-engineering/engineering-services-section/actions/runs/38179360411) reports event `push`, status `completed`, conclusion `success`; it runs `node --test services/institutional-individuation-verification-service/test/lumpability.test.mjs` using Node 22. The checked-in test asserts four expected cases, block weights/defects, fixture SHA, invalid matrices and labels, and a near-tolerance perturbation. This is a provider-level execution receipt; assertion-level independent observation would require job-log inspection.

**Receiving boundary:** mathematical fixture accepted; independent synthetic recomputation accepted; implementation and reported CI completion accepted as *computational receiving*. Field science **unassayed**; predictive adequacy of any actual institutional partition **unassayed**; real-world governance effects **unclaimed**.

## Field assay: preregistration and falsifiers

Before inspecting outcomes, freeze (1) sampling frame and institution/event provenance; (2) state taxonomy and observation unit (actor, decision, resource commitment, obligation outcome), candidate partition π and alternatives; (3) time windows, stationarity assumptions, missingness and censoring; (4) count estimation and uncertainty procedure; (5) leakage-free blocked future-time splits, numerical and practical tolerances, proper predictive score, calibration and error budget; (6) allowed interventions, rights and participant consent. Do not replace missing observations with invented exemplars.

Estimate transitions from timestamped, rights-cleared events without discarding within-block differences. Test the constrained quotient model against an unrestricted state-level kernel and a cheaper predictive baseline on held-out future trajectories. Report the defect, interval estimates, baseline loss/calibration and sensitivity to state coverage, alternate partitions, hidden shared infrastructure, selection/missingness, and regime change. Distinguish an algebraic defect in estimated P from observed predictive failure under nonstationarity. Use one-block and identity controls to expose vacuous successes.

A failure of predeclared held-out closure, predictive loss, calibration, or robustness **falsifies only the specified model/partition/window claim**, not an institution's right to organize. A positive held-out result supports bounded predictive adequacy, *never* legal/political recognition or autonomy. If legitimate events, identified transition rows, or sufficient holdout observations are unavailable, record **not identifiable** or **unassayed**, not success and not zero effect.

## Handoff, integrity and retirement

Red Cup Engineering owns the version-pinned deterministic evaluator and negative-control tests; Lenticule Science independently receives its mathematical claims and designs any field assay; Coesite Operations verifies actual runtime or event-provenance observations if installed; the 561 Group Board retains institutional judgment. A merged PR or CI success cannot be silently promoted to a validated social fact.

This note is the **canonical current research document** for institutional-individuation lumpability. It absorbs the substance of `institutional-individuation-scientific-receiving-20261011.md` and `institutional-individuation-engineering-ci-receipt-20261011.md`, without modifying the SHA-pinned fixture or the independent check. Existing software users should cite this note and the immutable fixture, not a retired narrative.
