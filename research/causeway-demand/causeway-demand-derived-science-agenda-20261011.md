# Causeway demand → Lenticule Science agenda

Date: 2026-10-11
Status: research-demand synthesis
Source boundary: Causeway Services public/service GitHub only; no personal/client-finance data.

## Purpose

Causeway's live service work is generating a recurring class of scientific demand that should not be answered by one-off feature work:

1. What exactly is being observed?
2. What construct does the observation measure?
3. Is the evidence source authoritative, current, and attributable?
4. Does the measurement matter to a real customer decision?
5. Can an intervention be causally distinguished from ordinary change?
6. What independent receiver can establish that an outcome actually improved?

This agenda turns those recurring demands into reusable Lenticule research rather than duplicating them in each service.

## Current Causeway demand signals

### AI Visibility Assurance — public-services-section#6

Causeway is developing an independent service for deciding whether AI-mediated discovery is materially failing an organization and, only then, what least-cost action is warranted.

The current service model distinguishes:
- crawl/index eligibility;
- entity resolution;
- retrieval for buyer-relevant questions;
- citation/mention;
- factual representation/prominence;
- conversion into observable customer action.

Science demand:

**Can these layers be measured as distinct observables with known uncertainty, and which combinations actually predict a customer-relevant outcome?**

Research questions:
- Define each layer independently and specify observable proxies.
- Quantify measurement error and surface-dependence.
- Test whether a composite score loses information compared with a vector of layer-specific evidence.
- Define causal designs for intervention → change in retrieval/representation → customer outcome.
- Establish when a free triage, existing vendor, one-time audit, monitoring service, or no action is the scientifically warranted recommendation.

### Public Grants Services — public-services-section#14

Causeway is designing a reusable provider of funding intelligence shared across Personal Services clients while keeping client-specific eligibility facts tenant-local.

Science demand:

**How should time-varying public-program knowledge be represented so source identity, freshness, eligibility predicates, program kind, application mechanics, and changes remain queryable without importing client-private facts?**

Research questions:
- Temporal source/evidence model for programs and rules.
- Typed distinction among grant, benefit, rebate, scholarship, loan forgiveness, financing, RFP, and technical assistance.
- Freshness and contradiction model for official program changes.
- De-identified demand signals that improve shared coverage without exposing client eligibility.
- Independent research-receipt semantics.

### Customer Publishing Service — public-services-section#16

Causeway needs shared publishing capabilities without letting the provider become owner of a customer's identity, corpus, editorial authority, or publication decisions.

Science demand:

**What formal distinctions are necessary to preserve customer sovereignty across preparation, review, provider draft, schedule/send, publication, archival verification, correction, and acceptance?**

Research questions:
- Model authority as typed transitions rather than one publish permission.
- Separate provenance, factual warrant, customer approval, provider execution, and public-state observation.
- Test whether provider receipts are sufficient evidence of public effect or require an independent public witness.
- Link these semantics to PlainEng/PTGAE and SignCell/SignChain where useful.

### Koios.News service evidence

Current Causeway issues report:
- article-depth/context deficiency (#4);
- stale newsroom execution (#15);
- Cloudflare analytics permission deficiency (#3);
- Google Analytics API availability (#2);
- AdSense rejection requiring exact current diagnostics (#45).

Science demand:

**How should service-health observations be separated from their causes, and how can a reported count or dashboard metric become a reproducible measurement with an immutable cohort, scoring-rule revision, source timestamp, and independent recount?**

This is directly connected to existing PlainEng reader-task research (#56), semantic/provenance research (#54, #57), and citation/provenance work.

## Shared scientific program

### A. Measurement validity for services

Develop a general model:

`claim -> observation -> measurement construct -> decision relevance -> intervention -> outcome -> independent acceptance`

For every link, record:
- source and timestamp;
- principal/authority;
- uncertainty;
- measurement error;
- falsifier;
- known missing coverage;
- whether the quantity is observed, inferred, modeled, or normative.

Core question:

**When is a service metric evidence of a customer-relevant outcome rather than merely an internal activity measure?**

### B. Temporal provenance and source freshness

Develop a typed evidence object that supports:
- source identity;
- revision/edition;
- observation time;
- effective-from/effective-to;
- retrieval time;
- contradictory observations;
- supersession;
- independent corroboration.

This should support both public-program intelligence and newsroom/service-health evidence.

### C. Authority, provenance, and acceptance

Formalize independent dimensions of:
- who said it;
- what evidence supports it;
- who may authorize an effect;
- whether the effect occurred;
- whether the customer accepted the outcome.

This should align with PlainEng/PTGAE semantics without collapsing epistemic status, normative authority, and deployment state.

### D. Service outcome science

Build experimental methods for testing:
- comprehension;
- task success;
- decision quality;
- accessibility;
- customer value;
- intervention effects.

Prefer task-based evaluation over generic readability, rankings, or self-reported satisfaction when the service claim concerns actual performance.

### E. Least-cost decision science

Causeway repeatedly requires a possible outcome of "do nothing" or "use an existing cheaper tool."

Research a decision rule that compares:
- expected value of more information;
- cost of measurement;
- cost of intervention;
- uncertainty;
- reversibility;
- materiality of the customer consequence.

The output should be a recommendation over actions, not a proprietary score.

## Explicit no-research-needed dispositions

Some Causeway demands can be satisfied by deterministic engineering assertions once their evidence sources are fixed. Examples:
- direct citation reachability;
- whether a link resolves;
- whether a required official eligibility statement appears in an article;
- whether a provider API permission exists;
- whether a required receipt field is present.

These should become test specifications, not inflated scientific projects.

## Existing Lenticule work to connect

- #54 — PTGAE semantics, conformance, epistemic status, rewrite invariants.
- #56 — reader-task evaluation and accessibility.
- #57 — restricted rewrite proofs and Obsmetrologia/Lean.
- #59 — mature English science and controlled-register theory.
- #60 — SignCell/SignChain/SignGraph/SignCraft semantics.
- #3/#4 — research-attention routing and relational/substrate research remain separate source lineages; do not conflate them with service-assurance work.

## Acceptance criteria for this agenda

1. Each Causeway demand above maps to a typed research question or explicit no-research-needed disposition.
2. Research outputs identify observable variables, uncertainty, falsifiers, and independent receiving conditions.
3. No customer-private eligibility, financial, subscriber, or account data enters shared Science source.
4. A future Science result can be consumed by Engineering as an executable specification without Science silently deciding the implementation.
5. Service outcomes are never self-accepted merely because a source commit, build, or deployment succeeded.
