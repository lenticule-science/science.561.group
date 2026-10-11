# Science #69 → Public Grants #14: temporal source evidence receiving

Science owner: Lenticule Science, business-science-services-section. Public-service demand: Causeway Services issue #14. Distinguish public-program observations from client-local eligibility.

## Correct source lineage

PR #70 was merged and its original files are **present** on main, moved by the superrepo layout convergence to the business-science section. Original agenda Git blob `af056d9e0b03732f3749eef441ff606b86715f58` and mapping schema Git blob `861bdf75f53c8d69e9a1a9a121e128c733378674` were independently read back at their new canonical paths. Earlier "deleted on main" interpretation was incorrect. The legacy `research/causeway-demand/` restoration branch is superseded and must not be merged as a second authority.

## Scientific discriminator

A public program has two temporal axes: **valid-time** (when a rule applies) and **knowledge-time** (when we actually observed the claim). Publication date and retrieval date must be separately retained. Candidate current-state evidence must carry program/source/authority-scope IDs, revision, immutable observation ID, content digest, effective interval, status, and explicit supersession edges.

Falsifier 1: a revocation effective October 5, retrieved October 12, is wrongly shown as known on October 8.

Falsifier 2: two contradictory official claims are silently reconciled by latest retrieval rather than returned unresolved.

Falsifier 3: an apparent revision in a different authority scope is allowed to supersede a prior source without independent authority evidence.

Falsifier 4: missing, stale, or unknown source status is turned into client ineligibility, a denial, or a zero observation.

Falsifier 5: shared public program records accept customer-specific household, medical, identity, tribal or financial eligibility data.

## Engineering receiver

Deterministic ingestion, source dereferencing, time normalization, digesting, and interval validation need no further scientific study. Engineering may implement these now under existing authority. It must preserve dual clocks, contradicted/unknown states, exact source receipts, customer-data boundaries, and no automatic application/submission.

A 20-case synthetic Node assay for the temporal-evidence model was executed successfully. It remains a research mechanism and test set, **not an authenticated live program status**; independent source checks and Lenticule review are still required before treating an asserted public rule as authoritative. Trial/acceptance in customer territory is separate.

## Other group demand dispositions

AI Visibility Assurance (#6): HTTP/robots/provider-response snapshots are deterministic Engineering checks, not evidence of customer conversion; task-stratified blinded measurement of retrieval/representation and held-out customer outcomes still requires Science.

Publishing Services (#16): provider-draft readback is deterministic; typed publication/approval/send/public-witness/customer-acceptance authority transitions require negative-control formal checks before general service release. A provider-success receipt is not editorial or customer acceptance.
