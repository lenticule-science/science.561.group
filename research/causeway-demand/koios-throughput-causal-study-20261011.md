# Causeway newsroom throughput: where the causal bottleneck lies (study specification)

**Recorded:** 2026-10-11. **Demand owner:** Causeway Koios.News. **Science owner:** Lenticule Science. **Study operator requested:** Coesite Scientific Operations / Enterprise Data. **Science receiver:** #69. **Operational receiver:** coesite-operations/operations-services-section#122.

## Demand evidence (do not conflate levels)

- Causeway owner requirement: [koios-news#57](https://github.com/causeway-services/koios-news/issues/57) reports a target of 20 new articles/day, no new content commit since 2026-10-10T02:56Z, six previous attempts returning no manuscript on HTTP 503 then 429, and a configured cloud-reporter fallback. These are *Causeway-reported operational facts*, not independently audited causal findings.
- Causeway monitoring: [koios-news#15](https://github.com/causeway-services/koios-news/issues/15) reported at 2026-10-11T18:21:45.393Z that the most recent cloud-newsroom stage observation was 2026-10-11T14:46:48.621Z. Freshness of a monitor is not itself an effect or an article-release verdict.
- Independent public witness: a direct read of https://koios.news/ on 2026-10-11 displayed its latest listed article dated **2026-10-10** (Ray Gunn). This is a page observation, not an exhaustive article ledger or proof that no edition was released elsewhere; caching and incomplete homepage coverage remain possible.
- The previously developed Lenticule newsroom-throughput assay (`research/causeway-demand/newsroom-throughput-identifiability.mjs`) structurally separates draft, assessment, authority, ledger and public readback. Its `main` version currently misorders fractional-second ISO timestamps by string comparison; corrected source and 12 synthetic tests are on branch `science/throughput-time-boundary-20261011`. A local or branch test does not qualify a production instrument.

## Typed scientific question

Does lack of available zero-cash writer capacity **cause** lost independently accepted and publicly observable new Koios editions, rather than exposing a bottleneck at upstream admission, independent assessment, editorial authority, release, or public readback?

*Estimand*: difference in the probability of an independently observed, accepted new-edition public readback by deadline between (A) eligible new-story attempts assigned to the existing approved reporter fallback and (B) comparable eligible attempts left on the normal writer route under observed writer degradation. This is **not** the difference in draft counts, build success, or content revisions.

*Unit*: a uniquely identified source-admitted **new story/edition attempt**, not a recycled slug, duplicated request, code commit, or same public bytes. Use separate references for source admission, attempted composition, adjudicated edition authorization, release and public witness. Preserve content identity separately from release-event identity.

*Variables*: at each stage, source revision; immutable time window with normalized UTC instants; attempts; succeeded, failed or missing observations; origin/provider reason; fallback assignment; evidence coverage; draft creation; editorial verdict; independent authority grant; ledger receipt; public readback; story age; validation cost; rights class. The table must distinguish missing observability from measured zero.

*Falsifiers*: (1) fallback improves drafts but not accepted public editions while downstream gates remain binding; (2) attempts with healthy writing still fail at admission, assessment, editorial approval or release; (3) published editions occur without a measured writer recovery; (4) apparent stage failures disappear when monitors are repaired. Any of these defeats the simple statement “writer HTTP 429/503 caused the public shortfall.”

*Null/alternative*: null — writer-availability improvement does not raise the independently verified new-edition release probability conditional on equivalent admissibility and authority. Alternative — under comparable eligible inputs, writer availability/fallback changes this probability in the predicted direction. Observational association alone is insufficient for a causal attribution.

*Study design*: Coesite registers a public-data-only stage ledger with immutable source/edition/effect identifiers, signed-or-independently-checkable receipts and missingness classes. Collect a bounded prospective 24-hour panel at the existing cadence, recording candidate eligibility before fallback selection. Use pre-registered stratification or randomized assignment only where editorial/owner rules and service authority already permit it; otherwise label the result descriptive and use comparable episodes with explicit confounders. Use independent readback of actual new public editions, never owner stage totals as customer acceptance. No new API spend or external publication action is authorized by this research note.

*Decision*: If drafting is the limiting stage, specify an Engineering conformance test of the existing cloud-reporter fallback under simulated native 429/503, preserving evidence and editorial review; if approval or publication is limiting, locate Engineering work there instead; if coverage is insufficient, improve Coesite instrumentation and abstain from causal ranking. Reader satisfaction and economic customer outcomes require separate measurement.

*Acceptance*: Coesite furnishes a versioned study manifest, cohort selection and provenance, run records, verification of stage coverage, missingness and falsifier outcomes. Science independently reviews those data, estimates effect with uncertainty and qualifies an Engineering-ready contract or an explicit inconclusive finding. Causeway separately receives service effects and customer/public acceptance; neither a GitHub merge nor this specification establishes that receiving.

## No-new-Science triage

- ISO UTC window ordering and Gregorian date validity are **deterministic Engineering/test problems**, not open foundational research. A known fractional-second counterexample requires a regression-tested fix; do not promote the flawed `main` instrument to Coesite.
- Reported Cloudflare/Google Analytics/Search Console permissions failures (#3/#2/#1) are presently **provider/configuration and receiving problems**, absent new evidence of a measurement-construct dispute. Repair authorized access and verify provider readback; lack of access is missing, not zero audience.
- Scientific research is warranted for **causal bottleneck attribution** and the **construct validity** of “newsroom throughput” relative to independently released editions. Reuse Coesite owner-cohort study PR #125 for article-quality observability, but do not merge its article-quality cohort into a newsroom-throughput causal sample without typed unit alignment.

**Privacy/rights:** Public article observations and internal aggregate operational facts only; do not add private clients, accounts, unpublished manuscript contents, billing identities, credentials or subscriber information to Science source.
