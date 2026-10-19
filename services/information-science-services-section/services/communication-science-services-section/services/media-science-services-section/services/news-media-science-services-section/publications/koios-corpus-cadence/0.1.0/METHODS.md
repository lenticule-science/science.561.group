# Koios.News retained-corpus publication cadence, snapshot 0.1.0

Question: What daily publication counts are declared by the public corpus in the seven complete UTC days before this observation, and what can they justify operationally?

This is a descriptive census of one captured public metadata population, prepared by an AI assistant for Lenticule Science under the Leader's research direction. It is not peer reviewed. No human authorship, independent scientific acceptance, public data release, DOI or journal status is claimed.

## Method and result

`source-observation.json` identifies the HTTPS response time, ETag and SHA-256 of the unmodified `source-coverage.json`. Select only `hasDefinedTerm` entries with `termCode = section`; deduplicate their `subjectOf` records by canonical URL after removing a terminal slash. Reject conflicting publication dates. This yields 78 URLs, equal to the source's declared article count. The source population contains 65 day-precision dates and 13 timestamps.

`articles.csv` retains each URL, section, declared publication and precision. Count each URL once in the UTC calendar day named by its declaration. `daily-counts.csv` includes all seven complete days, including zeros; it excludes the open observation day. `summary.json` gives units, exact window, population, extrema and unknowns. The October 12–18 window contains two articles: mean 2/7 article/day, median 0, minimum 0, maximum 2. The finite population needs no sampling confidence interval; uncertainty concerns coverage and date validity. These are *retained-corpus declarations*, not proof of continuous delivery or engineering throughput. A rolling native release ledger may report a different count and clock; neither witness overwrites the other.

The required 20+ articles/day is a Leader requirement. It cannot be inferred from this observed low output. Competitor cadence, model service capacity, arrival distributions, sustainable concurrency and saturation remain unmeasured. No historical maximum is admitted as a production ceiling. Better evidence requires repeated source-qualified observations with independent publication identity and revision/deletion custody, plus actual provider admission, usage and latency observations. No research-derived numeric capacity limit is justified by this snapshot.

## Receiving constraints

Engineering may use an actual ready-work population to size a finite queue drain; shared inference admission remains responsible for provider, account and cost capacity. A research-derived target must additionally identify its original dataset, version/digest, population, period, units, method, applicability, uncertainty and revision. Missing measurements remain unknown. An explicit authority constraint or editorial requirement retains its actual issuer; it is not reclassified as empirical capacity. Revisions must not count as new articles. Source identity and checksums identify evidence, not truth or authority.

## Machine-readable release and citation

`dataset.jsonld` uses W3C DCAT 3 / Dublin Core / PROV to describe CSV and JSON distributions, their byte counts, SHA-256 values, provenance and restricted access. `publication.json` extends the section's existing Lenticule research-publication carrier for an internal release. The private source and release do not satisfy the Content Mill public-paper lead classifier. Original third-party rights remain in force; this release grants no new redistribution license. This licensing/access gap prevents any claim of complete FAIR compliance.

Article bibliographic records use the Group's shared CSL-JSON owner, retaining `article-newspaper`, literal desk bylines, actual first-publication dates and stable article URLs. Citation metadata does not manufacture peer review or scholarly indexing. Actual research papers and their datasets must retain their own kind, methods, provenance and rights.

Sources: [captured Koios coverage](https://koios.news/coverage.json); the section's existing Study of News-Media Science and Nanopublication entry; the Research Services FAIR Data Principles entry; [W3C DCAT 3](https://www.w3.org/TR/vocab-dcat-3/); [Google Scholar inclusion criteria](https://scholar.google.com/intl/en/scholar/inclusion.html). Google Scholar excludes ordinary news and magazine articles; useful citation records do not change that content condition.
