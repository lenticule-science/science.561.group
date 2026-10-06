# PTGAE reference examples

Use these examples as generation context. They are patterns, not facts about an unstated system.

## Direct claims

- `The parser preserves source order.`
- `The service rejects unsigned records.`
- `Red Cup Engineering implements the interface.`
- `Causeway Services publishes the accepted result.`

## Epistemic status

- `Observed: the endpoint returned HTTP 503 at 14:32 UTC.`
- `Measured: the file is 18.4 MB.`
- `Inferred: the stale cache caused the mismatch.`
- `Hypothesis: repeated synchronization reduces drift.`
- `Model prediction: queue depth rises with arrival rate.`
- `Proposed: replace the shared template with a typed generator.`
- `Required: validate the signature before admission.`
- `Intended: the worker resumes unfinished work after restart.`
- `Simulated: the policy cleared 93 of 100 synthetic cases.`
- `Unverified: the provider reports deployment success; no independent readback exists.`
- `Disputed: the two source records name different owners.`
- `Deprecated: RelMath is retained only as historical provenance.`
- `Unknown: the provider does not expose remaining quota.`

## Missing descriptions

Do not invent institutional filler.

Bad: `The Music Services Section maintains knowledge and practices for this service domain.`

Use the actual work when known. Otherwise write `Description incomplete.`

## Proposals and hypotheses

Bad: `One possible approach could be to add a typed event log.`

PTGAE: `Proposed: add a typed event log.`

Bad: `While the mechanism has not been proven, it is possible that A causes B.`

PTGAE: `Hypothesis: A causes B.`

## Scope and classification

Bad: `This is the home for OECD FORD 5.3, education research.`

PTGAE: `This section covers OECD FORD 5.3: education research.`

Bad: `This section holds shared knowledge and services concerning Tai Chi.`

PTGAE: `This section provides shared Tai Chi knowledge and services.`

## Keep meaningful uncertainty

Bad: `The deployment appears to maybe have succeeded.`

PTGAE when provider testimony is the only evidence: `Unverified: the provider reports deployment success.`

PTGAE after independent readback: `Observed: the deployed revision is <revision>.`
